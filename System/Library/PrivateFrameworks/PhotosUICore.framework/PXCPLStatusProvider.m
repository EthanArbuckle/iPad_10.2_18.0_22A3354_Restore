@implementation PXCPLStatusProvider

- (PXCPLStatusProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProvider.m"), 193, CFSTR("%s is not available as initializer"), "-[PXCPLStatusProvider init]");

  abort();
}

- (PXCPLStatusProvider)initWithPhotoLibrary:(id)a3
{
  id v6;
  NSObject *v7;
  void *v8;
  PXCPLStatusProvider *v9;
  uint64_t v10;
  OS_dispatch_queue *serialUpdateQueue;
  PHPhotoLibrary **p_photoLibrary;
  void *v13;
  PXCPLStatusSource *v14;
  PXCPLStatusSource *cplStatusSource;
  NSObject *v16;
  PXCPLPhotoLibrarySource *v17;
  PXCPLPhotoLibrarySource *photoLibrarySource;
  uint64_t v19;
  PXCPLSyncActivity *syncActivity;
  PXCPLSharedLibraryActivity *v21;
  PXCPLSharedLibraryActivity *sharedLibraryActivity;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v24;
  PXCloudQuotaOfferProvider *offerProvider;
  uint64_t v26;
  PXCloudQuotaPremiumOfferProvider *premiumOfferProvider;
  void *v28;
  void *v29;
  void *v31;
  PXCPLStatusProvider *v32;
  objc_super v33;
  uint8_t buf[4];
  PXCPLStatusProvider *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProvider.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  if ((objc_msgSend(v6, "isCloudPhotoLibraryEnabled") & 1) == 0)
  {
    PLUserStatusGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "photoLibraryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = self;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "%{public}@ ICPL is not enabled for library: %@, URL: \"%@\", buf, 0x20u);

    }
  }
  v33.receiver = self;
  v33.super_class = (Class)PXCPLStatusProvider;
  v9 = -[PXCPLStatusProvider init](&v33, sel_init);
  if (v9)
  {
    +[PXCPLStatusProvider sharedQueue](PXCPLStatusProvider, "sharedQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    serialUpdateQueue = v9->_serialUpdateQueue;
    v9->_serialUpdateQueue = (OS_dispatch_queue *)v10;

    p_photoLibrary = &v9->_photoLibrary;
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    -[PHPhotoLibrary cplStatus](v9->_photoLibrary, "cplStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[PXCPLStatusSource initWithStatus:]([PXCPLStatusSource alloc], "initWithStatus:", v13);
      cplStatusSource = v9->_cplStatusSource;
      v9->_cplStatusSource = v14;

      -[PXCPLStatusSource registerChangeObserver:context:](v9->_cplStatusSource, "registerChangeObserver:context:", v9, PXCPLStatusSourceObservationContext);
    }
    else
    {
      PLUserStatusGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = v9;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "%{public}@ No CPL status for library: %@", buf, 0x16u);
      }

    }
    v17 = -[PXCPLPhotoLibrarySource initWithPhotoLibrary:]([PXCPLPhotoLibrarySource alloc], "initWithPhotoLibrary:", *p_photoLibrary);
    photoLibrarySource = v9->_photoLibrarySource;
    v9->_photoLibrarySource = v17;

    -[PXCPLPhotoLibrarySource registerChangeObserver:context:](v9->_photoLibrarySource, "registerChangeObserver:context:", v9, PXCPLPhotoLibrarySourceObservationContext);
    +[PXCPLSyncActivity sharedInstance](PXCPLSyncActivity, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    syncActivity = v9->_syncActivity;
    v9->_syncActivity = (PXCPLSyncActivity *)v19;

    -[PXCPLSyncActivity registerChangeObserver:context:](v9->_syncActivity, "registerChangeObserver:context:", v9, PXCPLSyncActivityObservationContext);
    v21 = -[PXCPLSharedLibraryActivity initWithPhotoLibrary:]([PXCPLSharedLibraryActivity alloc], "initWithPhotoLibrary:", *p_photoLibrary);
    sharedLibraryActivity = v9->_sharedLibraryActivity;
    v9->_sharedLibraryActivity = v21;

    -[PXCPLSharedLibraryActivity registerChangeObserver:context:](v9->_sharedLibraryActivity, "registerChangeObserver:context:", v9, PXCPLSharedLibraryActivityObservationContext);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_uploadAndDownloadCountsDidChange, (CFStringRef)*MEMORY[0x1E0D71D48], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_uploadByteCountsDidChange, (CFStringRef)*MEMORY[0x1E0D71D50], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_pauseDidChange, (CFStringRef)*MEMORY[0x1E0D71D40], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_numberOfOriginalsToDownloadDidChange, (CFStringRef)*MEMORY[0x1E0D71D38], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_resetSyncStatusDidChange, (CFStringRef)*MEMORY[0x1E0D71FF8], 0, (CFNotificationSuspensionBehavior)1024);
    if (_os_feature_enabled_impl())
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_numberOfItemsFailingToUploadDidChange, (CFStringRef)*MEMORY[0x1E0D71D08], 0, (CFNotificationSuspensionBehavior)1024);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_numberOfItemsFailingToUploadDidChange, (CFStringRef)*MEMORY[0x1E0D71D00], 0, (CFNotificationSuspensionBehavior)1024);
    }
    +[PXCloudQuotaOfferProvider currentOfferProvider](PXCloudQuotaOfferProvider, "currentOfferProvider");
    v24 = objc_claimAutoreleasedReturnValue();
    offerProvider = v9->_offerProvider;
    v9->_offerProvider = (PXCloudQuotaOfferProvider *)v24;

    +[PXCloudQuotaPremiumOfferProvider currentPremiumOfferProvider](PXCloudQuotaPremiumOfferProvider, "currentPremiumOfferProvider");
    v26 = objc_claimAutoreleasedReturnValue();
    premiumOfferProvider = v9->_premiumOfferProvider;
    v9->_premiumOfferProvider = (PXCloudQuotaPremiumOfferProvider *)v26;

    -[PXCloudQuotaOfferProvider offer](v9->_offerProvider, "offer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v9->_hasCloudQuotaOffer = 1;
    }
    else
    {
      -[PXCloudQuotaPremiumOfferProvider premiumOffer](v9->_premiumOfferProvider, "premiumOffer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_hasCloudQuotaOffer = v29 != 0;

    }
    -[PXCloudQuotaOfferProvider registerChangeObserver:context:](v9->_offerProvider, "registerChangeObserver:context:", v9, PXCloudQuotaOfferProviderObservationContext);
    -[PXCloudQuotaPremiumOfferProvider registerChangeObserver:context:](v9->_premiumOfferProvider, "registerChangeObserver:context:", v9, PXCloudQuotaPremiumOfferProviderObservationContext);
    v32 = v9;
    px_dispatch_on_main_queue();

  }
  return v9;
}

- (void)_setStatus:(id)a3 producedForUpdateType:(unint64_t)a4 timeIntervalProducingUpdatedStatus:(double)a5
{
  __int16 v6;
  PXCPLStatus *v9;
  PXCPLStatus *v10;
  PXCPLStatus *v11;
  BOOL v12;
  NSObject *v13;
  PXCPLStatus *status;
  void *v15;
  NSObject *v16;
  PXCPLStatus *v17;
  int v18;
  PXCPLStatusProvider *v19;
  __int16 v20;
  PXCPLStatus *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = (PXCPLStatus *)a3;
  v10 = self->_status;
  if (v10 == v9)
  {

  }
  else
  {
    v11 = v10;
    v12 = -[PXCPLStatus isEqual:](v10, "isEqual:", v9);

    if (!v12)
    {
      objc_storeStrong((id *)&self->_status, a3);
      PLUserStatusGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        status = self->_status;
        PXCPLStatusUpdateTypeDebugDescription(v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138544130;
        v19 = self;
        v20 = 2114;
        v21 = status;
        v22 = 2114;
        v23 = *(double *)&v15;
        v24 = 2048;
        v25 = a5;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ >> %{public}@ [reason: %{public}@, time: %.2f s]", (uint8_t *)&v18, 0x2Au);

      }
      -[PXCPLStatusProvider signalChange:](self, "signalChange:", 1);
      goto LABEL_10;
    }
  }
  PLUserStatusGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    PXCPLStatusUpdateTypeDebugDescription(v6);
    v17 = (PXCPLStatus *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = self;
    v20 = 2114;
    v21 = v17;
    v22 = 2048;
    v23 = a5;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "%@ Update resulted in no change [reason: %{public}@, time: %.2f s]", (uint8_t *)&v18, 0x20u);

  }
LABEL_10:

}

- (id)_updateStatus:(id)a3 requestedTypes:(unint64_t)a4
{
  id v7;
  void *v8;
  PXCPLStatus *v9;
  void *v10;
  PXCPLStatus *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  PXCPLStatus *v74;
  id v76;
  _QWORD v77[4];
  id v78;
  _BYTE *v79;
  _QWORD v80[7];
  _QWORD v81[3];
  uint8_t v82[16];
  __int128 v83;
  uint64_t v84;
  int v85;
  _BYTE buf[24];
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProvider.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateType != PXCPLStatusUpdateTypeNone"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    v9 = objc_alloc_init(PXCPLStatus);
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = (PXCPLStatus *)objc_msgSend(v8, "copy");
LABEL_6:
  v11 = v9;
  if ((a4 & 1) != 0 && v9)
  {
    PLUserStatusGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "%@ > Will update PhotoLibrary", buf, 0xCu);
    }

    -[PXCPLStatus setIsEnabled:](v11, "setIsEnabled:", -[PXCPLPhotoLibrarySource isCloudPhotosEnabled](self->_photoLibrarySource, "isCloudPhotosEnabled"));
    -[PXCPLStatus setIsLocalModeEnabled:](v11, "setIsLocalModeEnabled:", -[PXCPLPhotoLibrarySource isLocalModeEnabled](self->_photoLibrarySource, "isLocalModeEnabled"));
    -[PXCPLPhotoLibrarySource fractionCompletedForRebuild](self->_photoLibrarySource, "fractionCompletedForRebuild");
    -[PXCPLStatus setFractionCompletedForLibraryRebuild:](v11, "setFractionCompletedForLibraryRebuild:");
    -[PXCPLStatus setIsRebuildingThumbnails:](v11, "setIsRebuildingThumbnails:", -[PXCPLPhotoLibrarySource isRebuildingThumbnails](self->_photoLibrarySource, "isRebuildingThumbnails"));
    PLUserStatusGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "%@ < Did update PhotoLibrary", buf, 0xCu);
    }

  }
  if ((a4 & 2) != 0 && v11)
  {
    v14 = self->_cplStatusSource == 0;
    PLUserStatusGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

        goto LABEL_24;
      }
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      v19 = "%{public}@ Failed to get CPL status: No PXCPLStatusSource";
      v20 = v16;
      v21 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "%@ > Will update CPLStatus", buf, 0xCu);
      }

      -[PXCPLStatusSource exitDate](self->_cplStatusSource, "exitDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCPLStatus setExitDate:](v11, "setExitDate:", v17);

      -[PXCPLStatusSource syncDate](self->_cplStatusSource, "syncDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCPLStatus setSyncDate:](v11, "setSyncDate:", v18);

      -[PXCPLStatus setIsExceedingQuota:](v11, "setIsExceedingQuota:", -[PXCPLStatusSource isExceedingQuota](self->_cplStatusSource, "isExceedingQuota"));
      -[PXCPLStatus setIsExceedingSharedLibraryQuota:](v11, "setIsExceedingSharedLibraryQuota:", -[PXCPLStatusSource isExceedingSharedLibraryQuota](self->_cplStatusSource, "isExceedingSharedLibraryQuota"));
      -[PXCPLStatus setIsClientVersionTooOld:](v11, "setIsClientVersionTooOld:", -[PXCPLStatusSource isClientVersionTooOld](self->_cplStatusSource, "isClientVersionTooOld"));
      -[PXCPLStatus setIsClientNotAuthenticated:](v11, "setIsClientNotAuthenticated:", -[PXCPLStatusSource isClientNotAuthenticated](self->_cplStatusSource, "isClientNotAuthenticated"));
      -[PXCPLStatus setIsExceedingBatteryQuota:](v11, "setIsExceedingBatteryQuota:", -[PXCPLStatusSource isExceedingBatteryQuota](self->_cplStatusSource, "isExceedingBatteryQuota"));
      -[PXCPLStatus setIsExceedingCellularQuota:](v11, "setIsExceedingCellularQuota:", -[PXCPLStatusSource isExceedingCellularQuota](self->_cplStatusSource, "isExceedingCellularQuota"));
      -[PXCPLStatus setIsCellularDataDisabled:](v11, "setIsCellularDataDisabled:", -[PXCPLStatusSource isCellularDataDisabled](self->_cplStatusSource, "isCellularDataDisabled"));
      -[PXCPLStatus setIsInAirplaneMode:](v11, "setIsInAirplaneMode:", -[PXCPLStatusSource isInAirplaneMode](self->_cplStatusSource, "isInAirplaneMode"));
      -[PXCPLStatus setIsOffline:](v11, "setIsOffline:", -[PXCPLStatusSource isOffline](self->_cplStatusSource, "isOffline"));
      -[PXCPLStatus setIsInLowDataMode:](v11, "setIsInLowDataMode:", -[PXCPLStatusSource isInLowDataMode](self->_cplStatusSource, "isInLowDataMode"));
      -[PXCPLStatus setIsInLowPowerMode:](v11, "setIsInLowPowerMode:", -[PXCPLStatusSource isInLowPowerMode](self->_cplStatusSource, "isInLowPowerMode"));
      -[PXCPLStatus setIsLowDiskSpace:](v11, "setIsLowDiskSpace:", -[PXCPLStatusSource isLowDiskSpace](self->_cplStatusSource, "isLowDiskSpace"));
      -[PXCPLStatus setIsVeryLowDiskSpace:](v11, "setIsVeryLowDiskSpace:", -[PXCPLStatusSource isVeryLowDiskSpace](self->_cplStatusSource, "isVeryLowDiskSpace"));
      -[PXCPLStatus setSharedLibraryExitingWithNumberOfAssetsRemaining:](v11, "setSharedLibraryExitingWithNumberOfAssetsRemaining:", -[PXCPLStatusSource sharedLibraryExitingWithNumberOfAssetsRemaining](self->_cplStatusSource, "sharedLibraryExitingWithNumberOfAssetsRemaining"));
      -[PXCPLStatus setIsCapturingSnapshot:](v11, "setIsCapturingSnapshot:", -[PXCPLStatusSource isCapturingSnapshot](self->_cplStatusSource, "isCapturingSnapshot"));
      -[PXCPLStatus setIsOptimizingSystemPerformance:](v11, "setIsOptimizingSystemPerformance:", -[PXCPLStatusSource isOptimizingSystemPerformance](self->_cplStatusSource, "isOptimizingSystemPerformance"));
      -[PXCPLStatus setIsInPoorNetworkConnection:](v11, "setIsInPoorNetworkConnection:", -[PXCPLStatusSource isInPoorNetworkConnection](self->_cplStatusSource, "isInPoorNetworkConnection"));
      -[PXCPLStatus setIsInModerateThermalPressure:](v11, "setIsInModerateThermalPressure:", -[PXCPLStatusSource isInModerateThermalPressure](self->_cplStatusSource, "isInModerateThermalPressure"));
      -[PXCPLStatus setIsInHeavyThermalPressure:](v11, "setIsInHeavyThermalPressure:", -[PXCPLStatusSource isInHeavyThermalPressure](self->_cplStatusSource, "isInHeavyThermalPressure"));
      -[PXCPLStatus setIsInLowBattery:](v11, "setIsInLowBattery:", -[PXCPLStatusSource isInLowBattery](self->_cplStatusSource, "isInLowBattery"));
      -[PXCPLStatus setIsUpgradeSuggestedToAccessAllPhotos:](v11, "setIsUpgradeSuggestedToAccessAllPhotos:", -[PXCPLStatusSource isUpgradeSuggestedToAccessAllPhotos](self->_cplStatusSource, "isUpgradeSuggestedToAccessAllPhotos"));
      -[PXCPLStatus setNumberOfPhotoAssets:](v11, "setNumberOfPhotoAssets:", -[PXCPLStatusSource numberOfPhotoAssets](self->_cplStatusSource, "numberOfPhotoAssets"));
      -[PXCPLStatus setNumberOfVideoAssets:](v11, "setNumberOfVideoAssets:", -[PXCPLStatusSource numberOfVideoAssets](self->_cplStatusSource, "numberOfVideoAssets"));
      -[PXCPLStatus setNumberOfOtherAssets:](v11, "setNumberOfOtherAssets:", -[PXCPLStatusSource numberOfOtherAssets](self->_cplStatusSource, "numberOfOtherAssets"));
      PLUserStatusGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      v19 = "%@ < Did update CPLStatus";
      v20 = v16;
      v21 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl(&dword_1A6789000, v20, v21, v19, buf, 0xCu);
    goto LABEL_23;
  }
LABEL_24:
  if ((a4 & 4) != 0 && v11)
  {
    PLUserStatusGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEBUG, "%@ > Will update TransferCounts", buf, 0xCu);
    }

    *(_QWORD *)&v83 = 0;
    *(_QWORD *)v82 = 0;
    -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "libraryBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "indicatorFileCoordinator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "getDownloadPhotoCount:downloadVideoCount:", &v83, v82);
    -[PXCPLStatus setNumberOfItemsToAdd:](v11, "setNumberOfItemsToAdd:", *(_QWORD *)v82 + (_QWORD)v83);
    PLUserStatusGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEBUG, "%@ < Did update TransferCounts", buf, 0xCu);
    }

  }
  if ((a4 & 8) != 0 && v11)
  {
    PLUserStatusGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEBUG, "%@ > Will update TransferBytes", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v87 = 0;
    *(_QWORD *)&v83 = 0;
    *((_QWORD *)&v83 + 1) = &v83;
    v84 = 0x2020000000;
    v85 = -1082130432;
    -[PXCPLStatus exitDate](v11, "exitDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "assetsdClient");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "cloudInternalClient");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke;
      v80[3] = &unk_1E5117610;
      v80[4] = self;
      v80[5] = buf;
      v80[6] = &v83;
      objc_msgSend(v34, "getCurrentTransferProgress:", v80);
      -[PXCPLStatus setNumberOfItemsToUpload:](v11, "setNumberOfItemsToUpload:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      LODWORD(v35) = *(_DWORD *)(*((_QWORD *)&v83 + 1) + 24);
      -[PXCPLStatus setFractionCompletedForUpload:](v11, "setFractionCompletedForUpload:", v35);

    }
    else
    {
      PLUserStatusGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v82 = 138412290;
        *(_QWORD *)&v82[4] = self;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEBUG, "%@ >> Ignoring upload counts when in exit mode", v82, 0xCu);
      }

      -[PXCPLStatus setNumberOfItemsToUpload:](v11, "setNumberOfItemsToUpload:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      LODWORD(v31) = *(_DWORD *)(*((_QWORD *)&v83 + 1) + 24);
      -[PXCPLStatus setFractionCompletedForUpload:](v11, "setFractionCompletedForUpload:", v31);
    }
    PLUserStatusGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v82 = 138412290;
      *(_QWORD *)&v82[4] = self;
      _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEBUG, "%@ < Did update TransferBytes", v82, 0xCu);
    }

    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(buf, 8);
  }
  if ((a4 & 0x10) != 0 && v11)
  {
    -[PXCPLPhotoLibrarySource cplSettingsObserver](self->_photoLibrarySource, "cplSettingsObserver");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "settings");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isKeepOriginalsEnabled");

    if (v39)
    {
      PLUserStatusGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_DEBUG, "%@ > Will update NumberOfOriginals", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v87 = 0;
      -[PHPhotoLibrary managedObjectContextForCurrentQueueQoS](self->_photoLibrary, "managedObjectContextForCurrentQueueQoS");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotosDataSource waitForAllBackgroundFetchingToFinish](PXPhotosDataSource, "waitForAllBackgroundFetchingToFinish");
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke_182;
      v77[3] = &unk_1E5148AA8;
      v42 = v41;
      v78 = v42;
      v79 = buf;
      objc_msgSend(v42, "performBlockAndWait:", v77);
      v43 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      PLUserStatusGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v83) = 138412290;
        *(_QWORD *)((char *)&v83 + 4) = self;
        _os_log_impl(&dword_1A6789000, v44, OS_LOG_TYPE_DEBUG, "%@ < Did update NumberOfOriginals", (uint8_t *)&v83, 0xCu);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v43 = 0;
    }
    -[PXCPLStatus setNumberOfOriginalsToDownload:](v11, "setNumberOfOriginalsToDownload:", v43);
  }
  if ((a4 & 0x400) != 0 && v11)
  {
    PLUserStatusGetLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_DEBUG, "%@ > Will update ResetSyncState", buf, 0xCu);
    }

    -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "assetsdClient");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "cloudInternalClient");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0;
    v49 = objc_msgSend(v48, "getResetSyncStatusWithError:", &v76);
    v50 = v76;
    if (v50)
    {
      PLUserStatusGetLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v50;
        _os_log_impl(&dword_1A6789000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cloud reset sync status %@", buf, 0x16u);
      }

    }
    else
    {
      switch(v49)
      {
        case 2:
          -[PXCPLStatus setIsInSoftResetSync:](v11, "setIsInSoftResetSync:", 0);
          -[PXCPLStatus setIsInHardResetSync:](v11, "setIsInHardResetSync:", 1);
          break;
        case 1:
          -[PXCPLStatus setIsInSoftResetSync:](v11, "setIsInSoftResetSync:", 1);
          -[PXCPLStatus setIsInHardResetSync:](v11, "setIsInHardResetSync:", 0);
          break;
        case 0:
          -[PXCPLStatus setIsInSoftResetSync:](v11, "setIsInSoftResetSync:", 0);
          -[PXCPLStatus setIsInHardResetSync:](v11, "setIsInHardResetSync:", 0);
          break;
      }
    }
    PLUserStatusGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v52, OS_LOG_TYPE_DEBUG, "%@ < Did update ResetSyncState", buf, 0xCu);
    }

  }
  if ((a4 & 0x800) != 0 && v11)
  {
    PLUserStatusGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v53, OS_LOG_TYPE_DEBUG, "%@ > Will update SharedLibrary", buf, 0xCu);
    }

    -[PXCPLStatus setSharedLibraryState:](v11, "setSharedLibraryState:", -[PXCPLSharedLibraryActivity state](self->_sharedLibraryActivity, "state"));
    -[PXCPLStatus setSharedLibraryMovingToShared:](v11, "setSharedLibraryMovingToShared:", -[PXCPLSharedLibraryActivity movingToShared](self->_sharedLibraryActivity, "movingToShared"));
    -[PXCPLStatus setSharedLibraryMovingToPersonal:](v11, "setSharedLibraryMovingToPersonal:", -[PXCPLSharedLibraryActivity movingToPersonal](self->_sharedLibraryActivity, "movingToPersonal"));
    PLUserStatusGetLog();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v54, OS_LOG_TYPE_DEBUG, "%@ < Did update SharedLibrary", buf, 0xCu);
    }

  }
  if (((v11 != 0) & _os_feature_enabled_impl() & (a4 >> 5)) == 1)
  {
    PLUserStatusGetLog();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v55, OS_LOG_TYPE_DEBUG, "%@ > Will update NumberOfFailures", buf, 0xCu);
    }

    v56 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(cloudLocalState) IN %@"), &unk_1E53E85F8);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v57;
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsEligibleForCloudKitTransport"), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v58;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("trashedState"), 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "andPredicateWithSubpredicates:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v62, "setShouldPrefetchCount:", 1);
    objc_msgSend(v62, "setInternalPredicate:", v61);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCPLStatus setNumberOfItemsFailingToUpload:](v11, "setNumberOfItemsFailingToUpload:", objc_msgSend(v63, "count"));
    PLUserStatusGetLog();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v64, OS_LOG_TYPE_DEBUG, "%@ < Did update NumberOfFailures", buf, 0xCu);
    }

  }
  if ((a4 & 0x80) != 0 && v11)
  {
    PLUserStatusGetLog();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v65, OS_LOG_TYPE_DEBUG, "%@ > Will update CloudQuota", buf, 0xCu);
    }

    -[PXCPLStatus setHasCloudQuotaOffer:](v11, "setHasCloudQuotaOffer:", self->_hasCloudQuotaOffer);
    PLUserStatusGetLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v66, OS_LOG_TYPE_DEBUG, "%@ < Did update CloudQuota", buf, 0xCu);
    }

  }
  if ((a4 & 0x100) != 0 && v11)
  {
    PLUserStatusGetLog();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v67, OS_LOG_TYPE_DEBUG, "%@ > Will update PauseStates", buf, 0xCu);
    }

    -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "libraryBundle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "indicatorFileCoordinator");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCPLStatus setIsUserPaused:](v11, "setIsUserPaused:", objc_msgSend(v70, "currentPauseReason") == 3);
    PLUserStatusGetLog();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v71, OS_LOG_TYPE_DEBUG, "%@ < Did update PauseStates", buf, 0xCu);
    }

  }
  if ((a4 & 0x200) != 0 && v11)
  {
    PLUserStatusGetLog();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v72, OS_LOG_TYPE_DEBUG, "%@ > Will update SyncProgress", buf, 0xCu);
    }

    -[PXCPLStatus setIsSyncing:](v11, "setIsSyncing:", -[PXCPLSyncActivity isSyncing](self->_syncActivity, "isSyncing"));
    PLUserStatusGetLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1A6789000, v73, OS_LOG_TYPE_DEBUG, "%@ < Did update SyncProgress", buf, 0xCu);
    }

  }
  v74 = v11;

  return v74;
}

- (double)nextOverrideResumeTimeInterval
{
  double v3;
  double v4;
  NSObject *v5;
  int v7;
  PXCPLStatusProvider *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "nextOverrideTimeIntervalForSystemBudgets:", 18487);
  v4 = v3;
  PLUserStatusGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%@ < Did get next override time interval: %f", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void)_performUpdate
{
  NSObject *v3;
  void *v4;
  double v5;
  void *needsUpdate;
  void *v7;
  void *v8;
  NSObject *serialUpdateQueue;
  id v10;
  dispatch_block_t v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  PXCPLStatusProvider *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    PXCPLStatusUpdateTypeDebugDescription(self->_needsUpdate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%@ Perform update [reason: %{public}@]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastUpdate = v5;
  needsUpdate = (void *)self->_needsUpdate;
  self->_needsUpdate = 0;
  -[PXCPLStatusProvider status](self, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_initWeak((id *)buf, self);
  serialUpdateQueue = self->_serialUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PXCPLStatusProvider__performUpdate__block_invoke;
  block[3] = &unk_1E513FF48;
  objc_copyWeak(v14, (id *)buf);
  v13 = v8;
  v14[1] = needsUpdate;
  v10 = v8;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(serialUpdateQueue, v11);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

- (void)_queue_performUpdateWithStatus:(id)a3 updateType:(unint64_t)a4
{
  NSObject *serialUpdateQueue;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16[3];
  id location;

  serialUpdateQueue = self->_serialUpdateQueue;
  v7 = a3;
  dispatch_assert_queue_V2(serialUpdateQueue);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  -[PXCPLStatusProvider _updateStatus:requestedTypes:](self, "_updateStatus:requestedTypes:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v12 = v11 - v9;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXCPLStatusProvider__queue_performUpdateWithStatus_updateType___block_invoke;
  block[3] = &unk_1E51259E8;
  objc_copyWeak(v16, &location);
  v15 = v10;
  v16[1] = (id)a4;
  v16[2] = *(id *)&v12;
  v13 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_main_handleUpdatedStatus:(id)a3 producedForUpdateType:(unint64_t)a4 timeIntervalProducingUpdatedStatus:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PXCPLStatusProvider *v14;
  id v15;
  unint64_t v16;
  double v17;

  v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __106__PXCPLStatusProvider__main_handleUpdatedStatus_producedForUpdateType_timeIntervalProducingUpdatedStatus___block_invoke;
  v13 = &unk_1E5117638;
  v14 = self;
  v15 = v8;
  v16 = a4;
  v17 = a5;
  v9 = v8;
  -[PXCPLStatusProvider performChanges:](self, "performChanges:", &v10);
  self->_isUpdating = 0;
  -[PXCPLStatusProvider _schedulePendingUpdates](self, "_schedulePendingUpdates", v10, v11, v12, v13, v14);

}

- (void)_schedulePendingUpdates
{
  double v3;
  double v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  PXCPLStatusProvider *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdate && !self->_isUpdating)
  {
    self->_isUpdating = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = self->_lastUpdate + 1.0 - v3;
    if (v4 <= 0.0)
    {
      -[PXCPLStatusProvider _performUpdate](self, "_performUpdate");
    }
    else
    {
      PLUserStatusGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v10 = self;
        v11 = 2048;
        v12 = v4;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%@ - Delaying update: %.2fs", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__PXCPLStatusProvider__schedulePendingUpdates__block_invoke;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v8, (id *)buf);
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_scheduleUpdateForType:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  PXCPLStatusProvider *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProvider.m"), 575, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateType != PXCPLStatusUpdateTypeNone"));

  }
  PLUserStatusGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    PXCPLStatusUpdateTypeDebugDescription(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%@ Request update [reason: %{public}@]", buf, 0x16u);

  }
  self->_needsUpdate |= a3;
  -[PXCPLStatusProvider _schedulePendingUpdates](self, "_schedulePendingUpdates");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCPLPhotoLibrarySourceObservationContext == a5)
  {
    if ((v6 & 0xF) != 0)
    {
      v13 = v9;
      v11 = 1;
    }
    else
    {
      if ((v6 & 0x10) == 0)
        goto LABEL_24;
      v13 = v9;
      v11 = 16;
    }
    goto LABEL_23;
  }
  if ((void *)PXCPLStatusSourceObservationContext == a5)
  {
    v13 = v9;
    v11 = 2;
    goto LABEL_23;
  }
  if ((void *)PXCPLSyncActivityObservationContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_24;
    v13 = v9;
    v11 = 512;
LABEL_23:
    -[PXCPLStatusProvider _scheduleUpdateForType:](self, "_scheduleUpdateForType:", v11);
    v9 = v13;
    goto LABEL_24;
  }
  if ((void *)PXCPLSharedLibraryActivityObservationContext == a5)
  {
    if ((v6 & 7) == 0)
      goto LABEL_24;
    v13 = v9;
    v11 = 2048;
    goto LABEL_23;
  }
  if ((void *)PXCPLCloudQuotaSourceObservationContext != a5)
  {
    v13 = v9;
    if ((void *)PXCloudQuotaOfferProviderObservationContext == a5)
    {
      -[PXCloudQuotaOfferProvider offer](self->_offerProvider, "offer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((void *)PXCloudQuotaPremiumOfferProviderObservationContext != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProvider.m"), 673, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      -[PXCloudQuotaPremiumOfferProvider premiumOffer](self->_premiumOfferProvider, "premiumOffer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self->_hasCloudQuotaOffer = v10 != 0;

    goto LABEL_22;
  }
  if ((v6 & 0xF) != 0)
  {
    v13 = v9;
LABEL_22:
    v11 = 128;
    goto LABEL_23;
  }
LABEL_24:

}

- (PXCPLStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_premiumOfferProvider, 0);
  objc_storeStrong((id *)&self->_offerProvider, 0);
  objc_storeStrong((id *)&self->_cloudQuotaSource, 0);
  objc_storeStrong((id *)&self->_numberOfReferencedItemsObserver, 0);
  objc_storeStrong((id *)&self->_sharedLibraryActivity, 0);
  objc_storeStrong((id *)&self->_syncActivity, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
  objc_storeStrong((id *)&self->_cplStatusSource, 0);
  objc_storeStrong((id *)&self->_serialUpdateQueue, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

void __46__PXCPLStatusProvider__schedulePendingUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performUpdate");

}

uint64_t __106__PXCPLStatusProvider__main_handleUpdatedStatus_producedForUpdateType_timeIntervalProducingUpdatedStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatus:producedForUpdateType:timeIntervalProducingUpdatedStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

void __65__PXCPLStatusProvider__queue_performUpdateWithStatus_updateType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_main_handleUpdatedStatus:producedForUpdateType:timeIntervalProducingUpdatedStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));

}

void __37__PXCPLStatusProvider__performUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_performUpdateWithStatus:updateType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

float __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke(_QWORD *a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  NSObject *v10;
  uint64_t v11;
  float result;
  int v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    v13 = 138413314;
    v14 = v11;
    v15 = 2048;
    v16 = a2;
    v17 = 2048;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "%@ >> originalSize: %lu, originalSize: %lu, uploadedMasters: %lu, unpushedMasters: %lu", (uint8_t *)&v13, 0x34u);
  }

  if (a5 && a5 >= a4)
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a5 - a4;
  if (a3)
  {
    if (a2 <= a3)
    {
      result = (float)a2 / (float)a3;
      *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
    }
  }
  return result;
}

void __52__PXCPLStatusProvider__updateStatus_requestedTypes___block_invoke_182(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D717F0], "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D717F0], "predicateForOriginalsToDownload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(v3, "setResultType:", 4);
  v5 = *(void **)(a1 + 32);
  v8 = 0;
  v6 = objc_msgSend(v5, "countForFetchRequest:error:", v3, &v8);
  v7 = v8;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

}

uint64_t __44__PXCPLStatusProvider_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdateForType:", 4031);
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1)
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_7271);
  return (id)sharedQueue_sharedQueue;
}

void __34__PXCPLStatusProvider_sharedQueue__block_invoke()
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

  v2 = dispatch_queue_create("com.apple.photos.pxcplstatusprovider.update", attr);
  v3 = (void *)sharedQueue_sharedQueue;
  sharedQueue_sharedQueue = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_159);

}

void __34__PXCPLStatusProvider_sharedQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)sharedQueue_sharedQueue);
}

@end
