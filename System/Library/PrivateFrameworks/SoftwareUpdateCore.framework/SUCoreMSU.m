@implementation SUCoreMSU

- (SUCoreMSU)initWithDelegate:(id)a3
{
  return -[SUCoreMSU initWithDelegate:withCallbackQueue:](self, "initWithDelegate:withCallbackQueue:", a3, 0);
}

- (SUCoreMSU)initWithDelegate:(id)a3 withCallbackQueue:(id)a4
{
  id v6;
  id v7;
  SUCoreMSU *v8;
  SUCoreMSU *v9;
  NSString *updateUUID;
  NSString *descriptionName;
  SUCoreDescriptor *updateDescriptor;
  NSString *applyProgressActionText;
  MSUUpdateBrainAssetLoader *brainLoader;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *msuControlQueue;
  id v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *msuOperationQueue;
  void *v27;
  uint64_t v28;
  OS_dispatch_queue *clientDelegateCallbackQueue;
  SUCoreMSU *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SUCoreMSU;
  v8 = -[SUCoreMSU init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_msuDelegate, v6);
    updateUUID = v9->_updateUUID;
    v9->_updateUUID = 0;

    descriptionName = v9->_descriptionName;
    v9->_descriptionName = (NSString *)CFSTR("NotAssigned");

    updateDescriptor = v9->_updateDescriptor;
    v9->_updateDescriptor = 0;

    v9->_nextProgressThreshold = 0.0;
    *(_DWORD *)&v9->_performingOperation = 0;
    v9->_applyProgressFinal = 0;
    applyProgressActionText = v9->_applyProgressActionText;
    v9->_applyProgressActionText = 0;

    brainLoader = v9->_brainLoader;
    v9->_brainLoader = 0;

    v9->_msuHandle = 0;
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "commonDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v16, CFSTR("msu.control")));
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    msuControlQueue = v9->_msuControlQueue;
    v9->_msuControlQueue = (OS_dispatch_queue *)v20;

    if (v9->_msuControlQueue)
    {
      v22 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v16, CFSTR("msu.operation")));
      v23 = (const char *)objc_msgSend(v22, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = dispatch_queue_create(v23, v24);
      msuOperationQueue = v9->_msuOperationQueue;
      v9->_msuOperationQueue = (OS_dispatch_queue *)v25;

      if (v9->_msuOperationQueue)
      {
        objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "selectDelegateCallbackQueue:", v7);
        v28 = objc_claimAutoreleasedReturnValue();
        clientDelegateCallbackQueue = v9->_clientDelegateCallbackQueue;
        v9->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v28;

        if (initWithDelegate_withCallbackQueue__msuErrorInfoOnce != -1)
          dispatch_once(&initWithDelegate_withCallbackQueue__msuErrorInfoOnce, &__block_literal_global_10);

        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = CFSTR("unable to create MSU operation dispatch queue");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = CFSTR("unable to create MSU control dispatch queue");
    }
    objc_msgSend(v31, "trackError:forReason:withResult:withError:", CFSTR("[MSU]"), v33, 8100, 0);

    v30 = 0;
    goto LABEL_11;
  }
LABEL_7:
  v30 = v9;
LABEL_11:

  return v30;
}

uint64_t __48__SUCoreMSU_initWithDelegate_withCallbackQueue___block_invoke()
{
  uint64_t v0;
  uint64_t v1;

  v0 = *MEMORY[0x1E0D4F750];
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:indicating:ifKeyTrue:", 510, *MEMORY[0x1E0D4F750], 2, CFSTR("MSUFullReplacementRecommened"));
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:indicating:ifKeyTrue:", 512, CFSTR("com.apple.BuildInfo.preflight.error"), 8, CFSTR("BIPreflightAlternateInstallerRecommended"));
  v1 = *MEMORY[0x1E0D4F758];
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:", 511, *MEMORY[0x1E0D4F758]);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 1, CFSTR("MSU_ERR_BAD_SIGNATURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 2, CFSTR("MSU_ERR_PERSONALIZATION_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 3, CFSTR("MSU_ERR_FILESYSTEM_DOESNT_VERIFY"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 4, CFSTR("MSU_ERR_PENDING_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 5, CFSTR("MSU_ERR_NO_SUSPENDED_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 6, CFSTR("MSU_ERR_NONFATAL_RESIZE_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 7, CFSTR("MSU_ERR_INTERNAL_ERROR"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 8, CFSTR("MSU_ERR_INVALID_INFO_PLIST"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 9, CFSTR("MSU_ERR_BAD_ARGUMENT"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 10, CFSTR("MSU_ERR_UPDATE_BRAIN"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 11, CFSTR("MSU_ERR_BOOT_SETUP_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 12, CFSTR("MSU_ERR_CANCEL"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 13, CFSTR("MSU_ERR_FDR"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 14, CFSTR("MSU_ERR_ALLOC"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 15, CFSTR("MSU_ERR_PROGRAMMED_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 16, CFSTR("MSU_ERR_PREPARE_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 17, CFSTR("MSU_ERR_APPLY_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 18, CFSTR("MSU_ERR_PARALLELEXTRACTPAYLOAD"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 19, CFSTR("MSU_ERR_PARALLELAPPLYPATCHFILES"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 20, CFSTR("MSU_ERR_INSUFFICIENT_DISK_SPACE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 21, CFSTR("MSU_ERR_CONTENT_HASHES"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 23, CFSTR("MSU_ERR_APP_DEMOTION"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 24, CFSTR("MSU_ERR_PREBRAIN_SCAN"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 25, CFSTR("MSU_ERR_PREBRAIN_DOWNLOAD"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 26, CFSTR("MSU_ERR_NO_STASHBAG"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 27, CFSTR("MSU_ERR_FAILED_BRAIN_LOAD"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 28, CFSTR("MSU_ERR_NO_BRAIN"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 29, CFSTR("MSU_ERR_PACKAGE_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 30, CFSTR("MSU_ERR_RETRIEVE_AP_NONCE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 31, CFSTR("MSU_ERR_PERSONALIZATION_VERIFICATION_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 32, CFSTR("MSU_ERR_NETWORK"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 33, CFSTR("MSU_ERR_DEMO_MODE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 34, CFSTR("MSU_ERR_PURGE_QUERY_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 35, CFSTR("MSU_ERR_LOCAL_QUERY_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 36, CFSTR("MSU_ERR_BRIDGE_CALLING_MA"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 37, CFSTR("MSU_ERR_RETRIEVE_UCRT_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 38, CFSTR("MSU_ERR_COPY_DEVICE_IDENTITY"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 39, CFSTR("MSU_ERR_FAILED_TRUST_CACHE_LOAD"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 40, CFSTR("MSU_ERR_CONNECT_SOFTWAREUPDATED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 41, CFSTR("MSU_ERR_BACKWARDS_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 42, CFSTR("MSU_ERR_MISSING_TARGET"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 43, CFSTR("MSU_ERR_BOOTPOLICY_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 44, CFSTR("MSU_ERR_BRIDGEOS_PERSONALIZATION_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 45, CFSTR("MSU_ERR_BRIDGEOS_PREPARE_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 46, CFSTR("MSU_ERR_BRIDGEOS_APPLY_FAILURE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 47, CFSTR("MSU_ERR_LIVE_SNAPSHOT_MOUNT_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 48, CFSTR("MSU_ERR_CREATE_SNAPSHOT_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 49, CFSTR("MSU_ERR_SET_TARGET_SYSTEM_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 50, CFSTR("MSU_ERR_CONFIGURE_TARGET_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 51, CFSTR("MSU_ERR_PREP_INSTALL_TARGET_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 52, CFSTR("MSU_ERR_GLOBAL_TICKET_NOT_FOUND"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 53, CFSTR("MSU_ERR_GLOBAL_TICKET_INVALID"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 54, CFSTR("MSU_ERR_MEDIUM_DOWNGRADE_NOT_ALLOWED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 55, CFSTR("MSU_ERR_INTERNAL_USE_ONLY_BUILD"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 56, CFSTR("MSU_ERR_STAGE_SPLAT_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 57, CFSTR("MSU_ERR_SPLAT_PREBOOT_UNAVAILABLE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 58, CFSTR("MSU_ERR_ROLLBACK_UNSUPPORTED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 59, CFSTR("MSU_ERR_ROLLBACK_UNAVAILABLE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 60, CFSTR("MSU_ERR_STAGE_SPLAT_ROLLBACK_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 61, CFSTR("MSU_ERR_PARALLELPATCHIMAGEINFO_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 62, CFSTR("MSU_ERR_MOUNT_PREBOOT"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 63, CFSTR("MSU_ERR_PRESOFTWAREUPDATESTAGING"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 64, CFSTR("MSU_ERR_STAGE_SEMISPLAT_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 65, CFSTR("MSU_ERR_IMG4_NONCE_PREROLL_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 66, CFSTR("MSU_ERR_IMG4_NONCE_UNSUPPORTED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 67, CFSTR("MSU_ERR_BOOTPOLICY_NONCES_CHANGED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 801, CFSTR("MSU_ERR_BRAINLOAD_MISSING_PLIST"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 802, CFSTR("MSU_ERR_BRAINLOAD_NO_LOCATION"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 803, CFSTR("MSU_ERR_BRAINLOAD_NO_QUERY_RESULTS"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 804, CFSTR("MSU_ERR_BRAINLOAD_SORT_EXCEPTION"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 805, CFSTR("MSU_ERR_BRAINLOAD_NO_BEST_ASSET"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 806, CFSTR("MSU_ERR_BRAINLOAD_ASSET_DOWNLOAD_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 807, CFSTR("MSU_ERR_BRAINLOAD_NO_ASSET"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 808, CFSTR("MSU_ERR_BRAINLOAD_ADJUST_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 809, CFSTR("MSU_ERR_BRAINLOAD_ADJUST_NOT_DOWNLOADING"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 810, CFSTR("MSU_ERR_BRAINLOAD_CANCEL_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 811, CFSTR("MSU_ERR_BRAINLOAD_QUERY_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 812, CFSTR("MSU_ERR_BRAINLOAD_CATALOG_DOWNLOAD_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 813, CFSTR("MSU_ERR_BRAINLOAD_PURGE_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 814, CFSTR("MSU_ERR_BRAINLOAD_SPACE_CHECK_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 815, CFSTR("MSU_ERR_BRAINLOAD_CANCEL_DOWNLOAD_FAILED"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 816, CFSTR("MSU_ERR_BRAINLOAD_NO_SHARED_CONNECTION"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 817, CFSTR("MSU_ERR_BRAINLOAD_NO_BRAIN_LOCATOR"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v0, 818, CFSTR("MSU_ERR_BRAINLOAD_INVALID_RESPONSE"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 1, CFSTR("BIPreflightErrorMissingTargetMedia"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 2, CFSTR("BIPreflightErrorTargetIsEncrypted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 3, CFSTR("BIPreflightErrorTargetIsNotMounted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 4, CFSTR("BIPreflightErrorTargetIsFirewireDisk"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 5, CFSTR("BIPreflightErrorTargetIsTargetDiskMode"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 6, CFSTR("BIPreflightErrorTargetIsNotSnapshotBooted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 7, CFSTR("BIPreflightErrorTargetIsAppleRAID"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 8, CFSTR("BIPreflightErrorTargetIsCaseSensitive"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 9, CFSTR("BIPreflightErrorDeviceNotSupported"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 10, CFSTR("BIPreflightErrorTargetNotCompatible"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 11, CFSTR("BIPreflightErrorTargetHasInvalidBAACert"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 12, CFSTR("BIPreflightErrorBaseBuildNotCompatible"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 13, CFSTR("BIPreflightErrorUpdateIsNotMounted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 14, CFSTR("BIPreflightErrorBootIsNotMounted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", CFSTR("com.apple.BuildInfo.preflight.error"), 15, CFSTR("BIPreflightErrorBootOutOfSpace"), 4);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", CFSTR("com.apple.BuildInfo.preflight.error"), 16, CFSTR("BIPreflightErrorTargetOutOfSpace"), 4);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", CFSTR("com.apple.BuildInfo.preflight.error"), 17, CFSTR("BIPreflightErrorUpdateOutOfSpace"), 4);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 18, CFSTR("BIPreflightErrorStatFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", CFSTR("com.apple.BuildInfo.preflight.error"), 19, CFSTR("BIPreflightErrorInsufficientFreeSpace"), 4);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 20, CFSTR("BIPreflightErrorTargetIsBackupDisk"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 21, CFSTR("BIPreflightErrorDowngrade"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 22, CFSTR("BIPreflightErrorNotInstallable"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 23, CFSTR("BIPreflightErrorIsDiskUser"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 24, CFSTR("BIPreflightErrorHasInstallerUser"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 25, CFSTR("BIPreflightErrorBootVolumeIsExternal"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 26, CFSTR("BIPreflightErrorRosettaDownloadNotAllowed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", CFSTR("com.apple.BuildInfo.preflight.error"), 27, CFSTR("BIPreflightErrorNetworkingRequired"), 1);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 28, CFSTR("BIPreflightErrorAlternateInstaller"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 29, CFSTR("BIPreflightErrorFullReplacement"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 32, CFSTR("BIPreflightErrorMacOSServerUnsupported"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.BuildInfo.preflight.error"), 33, CFSTR("BIPreflightErrorInvalidStartupDisk"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 1, CFSTR("kAMAuthInstallErrorBadParameter"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 2, CFSTR("kAMAuthInstallErrorAllocation"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 3, CFSTR("kAMAuthInstallErrorConversion"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 4, CFSTR("kAMAuthInstallErrorFile"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5, CFSTR("kAMAuthInstallErrorHash"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 6, CFSTR("kAMAuthInstallErrorCrypto"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 7, CFSTR("kAMAuthInstallErrorBadBuildIdentity"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 8, CFSTR("kAMAuthInstallErrorEntryNotFound"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 9, CFSTR("kAMAuthInstallErrorInvalidImg3Object"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 10, CFSTR("kAMAuthInstallErrorInvalidFlsObject"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", v1, 11, CFSTR("kAMAuthInstallErrorServerNotReachable"), 1);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", v1, 12, CFSTR("kAMAuthInstallErrorServerTimedOut"), 1);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 13, CFSTR("kAMAuthInstallErrorUnimplemented"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 14, CFSTR("kAMAuthInstallErrorInternal"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 15, CFSTR("kAMAuthInstallErrorInvalidBbfwFile"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 16, CFSTR("kAMAuthInstallErrorNetwork"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 17, CFSTR("kAMAuthInstallErrorBadResponse"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 18, CFSTR("kAMAuthInstallErrorFusingFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 19, CFSTR("kAMAuthInstallErrorBBProvisioningFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 20, CFSTR("kAMAuthInstallErrorAppleConnectNotFound"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 21, CFSTR("kAMAuthInstallErrorAppleConnectCanceled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 22, CFSTR("kAMAuthInstallErrorAppleConnectAuthFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 23, CFSTR("kAMAuthInstallErrorInvalidImg4Object"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 24, CFSTR("kAMAuthInstallErrorProvisioningAckFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 25, CFSTR("kAMAuthInstallErrorUpdaterOperation"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 26, CFSTR("kAMAuthInstallErrorUpdaterNotFound"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 99, CFSTR("kAMAuthInstallErrorGeneric"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", v1, 3194, CFSTR("kAMAuthInstallTATSUDeclinedAuthorization"), 16);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 3501, CFSTR("kAMAuthInstallErrorHTTPUnauthorized"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 3503, CFSTR("kAMAuthInstallErrorHTTPForbidden"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 3504, CFSTR("kAMAuthInstallErrorHTTPNotFound"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 3507, CFSTR("kAMAuthInstallErrorHTTPProxyAuthNeeded"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 3500, CFSTR("kAMAuthInstallErrorHTTPInternalServerError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5000, CFSTR("kAMAuthInstallErrorZipOpenFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5001, CFSTR("kAMAuthInstallErrorZipWriteFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5002, CFSTR("kAMAuthInstallErrorZipCloseFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5003, CFSTR("kAMAuthInstallErrorZipParamError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5004, CFSTR("kAMAuthInstallErrorZipBadZipFile"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5005, CFSTR("kAMAuthInstallErrorZipInternalError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5006, CFSTR("kAMAuthInstallErrorZipStreamError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5007, CFSTR("kAMAuthInstallErrorZipDataError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5008, CFSTR("kAMAuthInstallErrorZipMemError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5009, CFSTR("kAMAuthInstallErrorZipBufError"));
  return objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", v1, 5010, CFSTR("kAMAuthInstallErrorZipVersionError"));
}

- (void)assignDescriptor:(id)a3 updateUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreMSU *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ ASSIGN_DESCRIPTOR: Client provided updateUUID: %{public}@; descriptor: %{public}@",
      buf,
      0x20u);
  }

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SUCoreMSU_assignDescriptor_updateUUID___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

void __41__SUCoreMSU_assignDescriptor_updateUUID___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ASSIGN_DESCRIPTOR"), 8115, CFSTR("busy performing other MSU operation"));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "setUpdateDescriptor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setUpdateUUID:", *(_QWORD *)(a1 + 48));
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "updateUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("[MSU(%@)]"), v3);
  objc_msgSend(*(id *)(a1 + 32), "setDescriptionName:", v4);

  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "descriptorType") == 2)
  {

LABEL_8:
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4F740]), "initWithUpdateAsset:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setBrainLoader:", v8);

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "descriptorType");

  if (v7 == 4)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "descriptorType") == 1)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "descriptorType");

    if (v28 != 3)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4F740]), "initWithUpdateAsset:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setBrainLoader:", v33);

      objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ASSIGN_DESCRIPTOR"), 8115, CFSTR("method received a descriptor with unknown type; creating a brain loader anyways"));
      goto LABEL_9;
    }
  }
  v29 = objc_alloc(MEMORY[0x1E0D4F740]);
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "softwareUpdateAsset");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v29, "initWithUpdateAsset:", v31);
  objc_msgSend(*(id *)(a1 + 32), "setBrainLoader:", v32);

LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "brainLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ASSIGN_DESCRIPTOR"), 8100, CFSTR("unable to create MSU brain loader"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "updateDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overviewWithMaxValueLength:providingSubstitutionMap:", 96, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v13;
    v41 = 2114;
    v42 = v15;
    _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ assigned update descriptor: %{public}@", buf, 0x16u);

  }
  v16 = a1;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "oslog");
        v24 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *(void **)(v16 + 32);
          *(_DWORD *)buf = 138543618;
          v40 = v25;
          v41 = 2114;
          v42 = v22;
          _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v19);
  }

}

- (void)assignRollbackDescriptor:(id)a3 updateUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreMSU *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ ASSIGN_ROLLBACK_DESCRIPTOR: Client provided updateUUID: %{public}@; rollbackDescriptor: %{public}@",
      buf,
      0x20u);
  }

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SUCoreMSU_assignRollbackDescriptor_updateUUID___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

void __49__SUCoreMSU_assignRollbackDescriptor_updateUUID___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ASSIGN_ROLLBACK_DESCRIPTOR"), 8115, CFSTR("busy performing other MSU operation"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRollbackDescriptor:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setUpdateUUID:", *(_QWORD *)(a1 + 48));
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "updateUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("[MSU Rollback(%@)]"), v3);
    objc_msgSend(*(id *)(a1 + 32), "setDescriptionName:", v4);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4F740]), "initWithUpdateAsset:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setBrainLoader:", v5);

    objc_msgSend(*(id *)(a1 + 32), "brainLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ASSIGN_ROLLBACK_DESCRIPTOR"), 8100, CFSTR("unable to create MSU brain loader"));
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ assigned rollback descriptor: %{public}@", buf, 0x16u);
    }

  }
}

- (void)loadBrain:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.LoadBrain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SUCoreMSU_loadBrain___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __23__SUCoreMSU_loadBrain___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("LOAD_BRAIN"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.LoadBrain"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLoadBrainTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationLoadBrain:", *(_QWORD *)(a1 + 48));
  }
}

- (void)preflightDownloadSU:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.PreflightDownloadSU"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreMSU_preflightDownloadSU___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __33__SUCoreMSU_preflightDownloadSU___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("PREFLIGHT_DOWNLOAD"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightDownloadSU"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreflightDownloadSUTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationPreflightSUDownload:", *(_QWORD *)(a1 + 48));
  }
}

- (void)preflightPersonalize:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.PreflightPersonalize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SUCoreMSU_preflightPersonalize___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __34__SUCoreMSU_preflightPersonalize___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("PREFLIGHT_PERSONALIZE"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightPersonalize"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreflightPersonalizeTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationPreflightPersonalize:", *(_QWORD *)(a1 + 48));
  }
}

- (void)preflightFDRRecovery:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.PreflightFDRRecovery"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SUCoreMSU_preflightFDRRecovery___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __34__SUCoreMSU_preflightFDRRecovery___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("PREFLIGHT_FDR_RECOVERY"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightFDRRecovery"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreflightFDRRecoveryTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationPreflightFDRRecovery:", *(_QWORD *)(a1 + 48));
  }
}

- (void)preflightWakeup:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.PreflightWakeup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SUCoreMSU_preflightWakeup___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __29__SUCoreMSU_preflightWakeup___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("PREFLIGHT_WAKEUP"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightWakeup"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreflightWakeupTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationPreflightWakeup:", *(_QWORD *)(a1 + 48));
  }
}

- (void)preflightPrerequisiteCheck:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.PreflightPrerequisiteCheck"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SUCoreMSU_preflightPrerequisiteCheck___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __40__SUCoreMSU_preflightPrerequisiteCheck___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("PREFLIGHT_PREREQUISITE_CHECK"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightPrerequisiteCheck"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreflightPrerequisiteCheckTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationPreflightPrerequisiteCheck:", *(_QWORD *)(a1 + 48));
  }
}

- (void)prepareUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.PrepareUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SUCoreMSU_prepareUpdate___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __27__SUCoreMSU_prepareUpdate___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("PREPARE_UPDATE"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PrepareUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPrepareUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationPrepareUpdate:", *(_QWORD *)(a1 + 48));
  }
}

- (void)suspendUpdate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.SuspendUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__SUCoreMSU_suspendUpdate__block_invoke;
  v6[3] = &unk_1EA878A88;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __26__SUCoreMSU_suspendUpdate__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("SUSPEND_UPDATE"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.SuspendUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSuspendUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationSuspendUpdate");
  }
}

- (void)resumeUpdate
{
  -[SUCoreMSU resumeUpdate:](self, "resumeUpdate:", 0);
}

- (void)resumeUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.ResumeUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SUCoreMSU_resumeUpdate___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __26__SUCoreMSU_resumeUpdate___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("RESUME_UPDATE"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.ResumeUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setResumeUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationResumeUpdate:", *(_QWORD *)(a1 + 48));
  }
}

- (void)applyUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.ApplyUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SUCoreMSU_applyUpdate___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __25__SUCoreMSU_applyUpdate___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("APPLY_UPDATE"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.ApplyUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setApplyUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationApplyUpdate:", *(_QWORD *)(a1 + 48));
  }
}

+ (id)commitStash:(id)a3
{
  return SUCoreBorder_MSUCommitStash(a3);
}

- (void)rollbackUpdatePrepare:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.RollbackUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SUCoreMSU_rollbackUpdatePrepare___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __35__SUCoreMSU_rollbackUpdatePrepare___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ROLLBACK_UPDATE_PREPARE"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRollbackUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationRollbackUpdatePrepare:", *(_QWORD *)(a1 + 48));
  }
}

- (void)rollbackUpdateSuspend:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.RollbackUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SUCoreMSU_rollbackUpdateSuspend___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __35__SUCoreMSU_rollbackUpdateSuspend___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ROLLBACK_UPDATE_SUSPEND"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRollbackUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationRollbackUpdateSuspend:", *(_QWORD *)(a1 + 48));
  }
}

- (void)rollbackUpdateResume:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.RollbackUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SUCoreMSU_rollbackUpdateResume___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __34__SUCoreMSU_rollbackUpdateResume___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ROLLBACK_UPDATE_RESUME"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRollbackUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationRollbackUpdateResume:", *(_QWORD *)(a1 + 48));
  }
}

- (void)rollbackUpdateApply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.RollbackUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreMSU_rollbackUpdateApply___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __33__SUCoreMSU_rollbackUpdateApply___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("ROLLBACK_UPDATE_APPLY"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRollbackUpdateTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_operationRollbackUpdateApply:", *(_QWORD *)(a1 + 48));
  }
}

- (void)cancelPrepare
{
  NSObject *v3;
  _QWORD block[5];

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SUCoreMSU_cancelPrepare__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __26__SUCoreMSU_cancelPrepare__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CFSTR("busy performing other MSU operation");
    return objc_msgSend(v2, "_trackMSUAnomaly:result:description:", CFSTR("CANCEL_PREPARE"), 8115, v3);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = CFSTR("not performing any MSU operation");
    return objc_msgSend(v2, "_trackMSUAnomaly:result:description:", CFSTR("CANCEL_PREPARE"), 8115, v3);
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will request that prepare be canceled [with result provided back to MSU on prepare progress as mechanism for requesting cancel]", (uint8_t *)&v8, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setCancelingPrepare:", 1);
}

- (void)removePrepared
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("msu.RemovePrepared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SUCoreMSU_removePrepared__block_invoke;
  v6[3] = &unk_1EA878A88;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __27__SUCoreMSU_removePrepared__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "performingOperation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingPrepared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("REMOVE_PREPARED"), 8115, CFSTR("busy performing other MSU operation"));
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RemovePrepared"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemovePreparedTransaction:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_removePrepared");
  }
}

- (void)_addUpdateMetricsEventFieldsToMSUOptions:(id)a3 usingPolicy:(id)a4 descriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint8_t v30[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCoreMSU updateUUID](self, "updateUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("NEW_UPDATE_METRIC_EVENT_FIELDS"), CFSTR("Could not get everything needed to provide a sessionID on for update metric event fields (missing updateUUID)"), 8116, 0);
    goto LABEL_25;
  }
  v13 = *MEMORY[0x1E0D4F8C0];
  objc_msgSend(v8, "safeObjectForKey:ofClass:", *MEMORY[0x1E0D4F8C0], objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "mutableCopy");

  if (!v15)
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D4F858]);
  -[SUCoreMSU updateUUID](self, "updateUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSafeObject:forKey:", v16, *MEMORY[0x1E0D4F898]);

  objc_msgSend(v9, "updateMetricContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSafeObject:forKey:", v17, *MEMORY[0x1E0DA8AE8]);

  objc_msgSend(v10, "productBuildVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v10, "productBuildVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSafeObject:forKey:", v19, *MEMORY[0x1E0D4F7A0]);

  }
  objc_msgSend(v9, "updateMetricEventFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v9, "updateMetricEventFields");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSafeObject:forKey:", v21, *MEMORY[0x1E0D4F818]);

  }
  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "descriptorType") == 1)
  {

  }
  else
  {
    -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "descriptorType");

    if (v24 != 3)
    {
      if (objc_msgSend(v10, "descriptorType") == 2 || objc_msgSend(v10, "descriptorType") == 4)
      {
        objc_msgSend(v10, "bundleAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      goto LABEL_17;
    }
  }
  objc_msgSend(v10, "softwareUpdateAsset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "attributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  objc_msgSend(v26, "safeObjectForKey:ofClass:", CFSTR("_EventRecordingServiceURL"), objc_opt_class());
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!v27)
    v27 = (id)*MEMORY[0x1E0DA8B90];
  objc_msgSend(v8, "setSafeObject:forKey:", v27, CFSTR("_EventRecordingServiceURL"));
  objc_msgSend(v15, "setSafeObject:forKey:", v27, CFSTR("_EventRecordingServiceURL"));
  if (objc_msgSend(v10, "descriptorType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, "Not setting update attributes for the SUCoreDescriptorTypeSFRPackage descriptor type", v30, 2u);
    }

  }
  else
  {
    objc_msgSend(v8, "setSafeObject:forKey:", v15, v13);
  }

LABEL_25:
}

- (void)_addUpdateMetricsEventFieldsToMSURollbackOptions:(id)a3 usingPolicy:(id)a4 rollbackDescriptor:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[SUCoreMSU updateUUID](self, "updateUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *MEMORY[0x1E0D4F8C0];
    objc_msgSend(v25, "safeObjectForKey:ofClass:", *MEMORY[0x1E0D4F8C0], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "mutableCopy");

    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SUCoreMSU updateUUID](self, "updateUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSafeObject:forKey:", v15, *MEMORY[0x1E0D4F898]);

    objc_msgSend(v8, "updateMetricContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSafeObject:forKey:", v16, *MEMORY[0x1E0DA8AE8]);

    objc_msgSend(v14, "setSafeObject:forKey:", *MEMORY[0x1E0DA8B50], *MEMORY[0x1E0DA8B30]);
    objc_msgSend(v9, "productBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v9, "productBuildVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSafeObject:forKey:", v18, *MEMORY[0x1E0D4F7A0]);

    }
    objc_msgSend(v9, "restoreVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "restoreVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSafeObject:forKey:", v20, *MEMORY[0x1E0D4F860]);

    }
    objc_msgSend(v8, "updateMetricEventFields");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v25;
    if (v21)
    {
      objc_msgSend(v8, "updateMetricEventFields");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSafeObject:forKey:", v23, *MEMORY[0x1E0D4F818]);

      v22 = v25;
    }
    v24 = *MEMORY[0x1E0DA8B90];
    objc_msgSend(v22, "setSafeObject:forKey:", *MEMORY[0x1E0DA8B90], CFSTR("_EventRecordingServiceURL"));
    objc_msgSend(v14, "setSafeObject:forKey:", v24, CFSTR("_EventRecordingServiceURL"));
    objc_msgSend(v25, "setSafeObject:forKey:", v14, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("NEW_UPDATE_METRIC_EVENT_FIELDS"), CFSTR("Could not get everything needed to provide a sessionID on for update metric event fields (missing updateUUID)"), 8116, 0);
  }

}

- (void)_addRemoteServerAccessControlToMSUOptions:(id)a3 usingPolicy:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "personalizationServerURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSafeObject:forKey:", v8, *MEMORY[0x1E0D4F840]);

  objc_msgSend(v6, "proxyHostName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    objc_msgSend(v6, "proxyPortNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v11)
  {
    objc_msgSend(v6, "proxyHostName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSafeObject:forKey:", v12, CFSTR("SOCKSProxy"));

    objc_msgSend(v6, "proxyPortNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSafeObject:forKey:", v13, CFSTR("SOCKSPort"));

    objc_msgSend(v15, "setSafeObject:forKey:", v11, *MEMORY[0x1E0D4F878]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("ADD_REMOTE_SERVER_ACCESS_CONTROL_TO_MSU_OPTIONS"), CFSTR("could not create proxy dictionary"), 8100, 0);

  }
LABEL_8:

}

- (id)_newMSUOptionsUsingPolicy:(id)a3 descriptor:(id)a4 baseOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v84;
  void *v85;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCoreMSU updateUUID](self, "updateUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trackAnomaly:forReason:withResult:withError:", CFSTR("NEW_MSU_OPTIONS"), CFSTR("Could not get everything needed to provide a sessionID creation of MSU options (missing updateUUID)"), 8116, 0);

    v14 = 0;
    goto LABEL_55;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;
  if (v10)
    objc_msgSend(v13, "addEntriesFromDictionary:", v10);
  v15 = (void *)objc_opt_new();
  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateBrainPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D4F760];
  objc_msgSend(v15, "setSafeObject:forKey:", v17, *MEMORY[0x1E0D4F760]);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isBootedOSSecureInternal") & 1) != 0)
  {
    objc_msgSend(v8, "updateBrainLocationOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:].cold.1(v8, v22);

    objc_msgSend(v8, "updateBrainLocationOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSafeObject:forKey:", v19, v18);
  }

LABEL_10:
  if (objc_msgSend(v9, "descriptorType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "Not setting update attributes for the SUCoreDescriptorTypeSFRPackage descriptor type", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(v14, "setSafeObject:forKey:", v15, *MEMORY[0x1E0D4F8C0]);
  }
  v85 = v15;
  -[SUCoreMSU _addUpdateMetricsEventFieldsToMSUOptions:usingPolicy:descriptor:](self, "_addUpdateMetricsEventFieldsToMSUOptions:usingPolicy:descriptor:", v14, v8, v9);
  -[SUCoreMSU _addRemoteServerAccessControlToMSUOptions:usingPolicy:](self, "_addRemoteServerAccessControlToMSUOptions:usingPolicy:", v14, v8);
  objc_msgSend(v8, "updateMetricEventFields");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v26, *MEMORY[0x1E0D4F818]);

  objc_msgSend(v8, "userAgentString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v27, *MEMORY[0x1E0D4F8A0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "performPreflightEncryptedCheck"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v28, *MEMORY[0x1E0D4F8C8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "performPreflightSnapshotCheck"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v29, *MEMORY[0x1E0D4F8D0]);

  objc_msgSend(v8, "ssoToken");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "ssoToken");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x1E0D4F778];
    objc_msgSend(v31, "setSafeObject:forKey:", v32, *MEMORY[0x1E0D4F778]);

    objc_msgSend(v14, "setSafeObject:forKey:", v31, *MEMORY[0x1E0D4F770]);
    objc_msgSend(v8, "ssoToken");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSafeObject:forKey:", v34, v33);

  }
  objc_msgSend(v8, "personalizedManifestRootsPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v35, *MEMORY[0x1E0D4F848]);

  objc_msgSend(v8, "localAuthenticationContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v36, *MEMORY[0x1E0D4F828]);

  objc_msgSend(v8, "localAuthenticationUserID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v37, *MEMORY[0x1E0D4F830]);

  objc_msgSend(v8, "mdmBootstrapToken");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v38, *MEMORY[0x1E0D4F838]);

  v39 = objc_msgSend(v8, "bridgeOSIgnoreMinimumVersionCheck");
  v40 = MEMORY[0x1E0C9AAA0];
  v41 = MEMORY[0x1E0C9AAB0];
  if (v39)
    v42 = MEMORY[0x1E0C9AAB0];
  else
    v42 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v14, "setSafeObject:forKey:", v42, *MEMORY[0x1E0D4F798]);
  objc_msgSend(v8, "bridgeOSDownloadDirectory");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v43, *MEMORY[0x1E0D4F790]);

  if (objc_msgSend(v8, "enableEmbeddedOSInstall"))
    v44 = v41;
  else
    v44 = v40;
  objc_msgSend(v14, "setSafeObject:forKey:", v44, *MEMORY[0x1E0D4F800]);
  if (objc_msgSend(v8, "enableBridgeOSInstall"))
    v45 = v41;
  else
    v45 = v40;
  objc_msgSend(v14, "setSafeObject:forKey:", v45, *MEMORY[0x1E0D4F7F8]);
  if (objc_msgSend(v8, "enableOSPersonalization"))
    v46 = v41;
  else
    v46 = v40;
  objc_msgSend(v14, "setSafeObject:forKey:", v46, *MEMORY[0x1E0D4F810]);
  if (objc_msgSend(v8, "userInitiated"))
    v47 = v41;
  else
    v47 = v40;
  objc_msgSend(v14, "setSafeObject:forKey:", v47, *MEMORY[0x1E0D4F8A8]);
  if (objc_msgSend(v8, "skipVolumeSealing"))
    v48 = v41;
  else
    v48 = v40;
  objc_msgSend(v14, "setSafeObject:forKey:", v48, *MEMORY[0x1E0D4F870]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "qualityOfService"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v49, *MEMORY[0x1E0D4F850]);

  objc_msgSend(v8, "targetVolumeUUID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v50, *MEMORY[0x1E0D4F890]);

  objc_msgSend(v8, "prerequisiteBuildVersion");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v51, *MEMORY[0x1E0D4F788]);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rootVolumeUUID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v53, *MEMORY[0x1E0D4F780]);

  objc_msgSend(v8, "targetVolumeUUID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v54, *MEMORY[0x1E0D4F7A8]);

  if (objc_msgSend(v9, "descriptorType") == 2)
  {
    objc_msgSend(v9, "updateBundlePath");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSafeObject:forKey:", v55, *MEMORY[0x1E0D4F880]);
LABEL_48:

    goto LABEL_49;
  }
  if (objc_msgSend(v9, "descriptorType") == 1)
  {
    objc_msgSend(v9, "softwareUpdateAsset");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "getLocalUrl");
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55 = (void *)objc_msgSend(v57, "fileSystemRepresentation");

    if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v55);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "setSafeObject:forKey:", v55, *MEMORY[0x1E0D4F880]);
    objc_msgSend(v9, "associatedSplatDescriptor");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      objc_msgSend(v9, "associatedSplatDescriptor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "descriptorType");

      if (v61 == 1)
      {
        objc_msgSend(v9, "associatedSplatDescriptor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "softwareUpdateAsset");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "refreshState");

        objc_msgSend(v9, "associatedSplatDescriptor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "softwareUpdateAsset");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "wasLocal");

        if (v66)
        {
          objc_msgSend(v9, "associatedSplatDescriptor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "softwareUpdateAsset");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "getLocalUrl");
          v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v69 = (void *)objc_msgSend(v68, "fileSystemRepresentation");

          if (v69)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v69);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "setSafeObject:forKey:", v69, CFSTR("SplatComboBundlePath"));

        }
        objc_msgSend(v9, "associatedSplatDescriptor");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "bundleAttributes");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSafeObject:forKey:", v71, CFSTR("__msu-splat-combo-update-attributes-dictionary-key"));

      }
    }
    goto LABEL_48;
  }
LABEL_49:
  if (objc_msgSend(v9, "splatOnly"))
    objc_msgSend(v14, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D4F888]);
  v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "hwModelStr");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setSafeObject:forKey:", v73, *MEMORY[0x1E0D4F7C0]);

  objc_msgSend(v8, "deviceClass");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setSafeObject:forKey:", v74, *MEMORY[0x1E0D4F7B8]);

  objc_msgSend(v8, "productType");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setSafeObject:forKey:", v75, *MEMORY[0x1E0D4F7D0]);

  objc_msgSend(v8, "releaseType");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setSafeObject:forKey:", v76, *MEMORY[0x1E0D4F7D8]);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "deviceBoardID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setSafeObject:forKey:", v78, *MEMORY[0x1E0D4F7B0]);

  objc_msgSend(v14, "setSafeObject:forKey:", v72, *MEMORY[0x1E0D4F7C8]);
  +[SUCoreDescriptor nameForDescriptorAudienceType:](SUCoreDescriptor, "nameForDescriptorAudienceType:", objc_msgSend(v9, "descriptorAudienceType"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v79, *MEMORY[0x1E0D4F7E0]);

  +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", objc_msgSend(v9, "preferredUpdateType"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v80, *MEMORY[0x1E0D4F7E8]);

  objc_msgSend(v8, "softwareUpdateScanPolicy");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v81, "allowSameVersion"))
    v82 = v41;
  else
    v82 = v40;
  objc_msgSend(v14, "setSafeObject:forKey:", v82, *MEMORY[0x1E0D4F768]);

LABEL_55:
  return v14;
}

- (id)_newMSURollbackOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4 baseOptions:(id)a5 additionalOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:](self, "_newMSUOptionsUsingPolicy:descriptor:baseOptions:", v12, 0, a5);
  -[SUCoreMSU _addUpdateMetricsEventFieldsToMSURollbackOptions:usingPolicy:rollbackDescriptor:](self, "_addUpdateMetricsEventFieldsToMSURollbackOptions:usingPolicy:rollbackDescriptor:", v13, v12, v11);

  objc_msgSend(v13, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D4F868]);
  objc_msgSend(v13, "setSafeObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D4F858]);
  objc_msgSend(v13, "addEntriesFromDictionary:", v10);

  return v13;
}

- (id)_newPreflightOptionsUsingPolicy:(id)a3 subPolicyClass:(Class)a4 descriptor:(id)a5 baseOptions:(id)a6 additionalOptions:(id)a7
{
  id v12;
  id v13;

  v12 = a7;
  v13 = -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:](self, "_newMSUOptionsUsingPolicy:descriptor:baseOptions:", a3, a5, a6);
  if ((Class)objc_opt_class() == a4 || (Class)objc_opt_class() == a4)
    objc_msgSend(v13, "setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D4F820]);
  objc_msgSend(v13, "addEntriesFromDictionary:", v12);

  return v13;
}

- (id)_newPrepareOptionsUsingPolicy:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "preparePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "basePrepareOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:](self, "_newMSUOptionsUsingPolicy:descriptor:baseOptions:", v7, v6, v9);

  -[SUCoreMSU updatePrepareOptions:withPolicy:](self, "updatePrepareOptions:withPolicy:", v10, v7);
  return v10;
}

- (id)_newRollbackPrepareOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "rollbackPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseRollbackOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rollbackPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "additionalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUCoreMSU _newMSURollbackOptionsUsingPolicy:rollbackDescriptor:baseOptions:additionalOptions:](self, "_newMSURollbackOptionsUsingPolicy:rollbackDescriptor:baseOptions:additionalOptions:", v7, v6, v9, v11);

  -[SUCoreMSU updatePrepareOptions:withPolicy:](self, "updatePrepareOptions:withPolicy:", v12, v7);
  objc_msgSend(v7, "updateRollbackOptionsWithExtensions:", v12);

  return v12;
}

- (void)updatePrepareOptions:(id)a3 withPolicy:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[SUCoreMSU doNotPatchList](self, "doNotPatchList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D4F7F0];
  objc_msgSend(v16, "safeObjectForKey:ofClass:", *MEMORY[0x1E0D4F7F0], objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v7;
  }
  objc_msgSend(v16, "setSafeObject:forKey:", v13, v8);
  -[SUCoreMSU _addRemoteServerAccessControlToMSUOptions:usingPolicy:](self, "_addRemoteServerAccessControlToMSUOptions:usingPolicy:", v16, v6);
  objc_msgSend(v6, "preparePolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "additionalOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntriesFromDictionary:", v15);

}

- (id)doNotPatchList
{
  return &unk_1EA89ABD8;
}

- (void)_operationLoadBrain:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU brainLoader](self, "brainLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__SUCoreMSU__operationLoadBrain___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildError:underlying:description:", 8102, 0, CFSTR("Missing required brain loader when attempting to load an update brain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMSU _reportBrainLoadFailed:](self, "_reportBrainLoadFailed:", v9);

    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 0);
  }

}

void __33__SUCoreMSU__operationLoadBrain___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "updateDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "_newMSUOptionsUsingPolicy:descriptor:baseOptions:", v3, v4, 0);

  v6 = (void *)objc_opt_new();
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "loadBrainPolicy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDiscretionary:", objc_msgSend(v8, "discretionary"));

      objc_msgSend(*(id *)(a1 + 40), "loadBrainPolicy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsCellularAccess:", objc_msgSend(v9, "allowsCellular"));

      objc_msgSend(*(id *)(a1 + 40), "loadBrainPolicy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLiveServerCatalogOnly:", objc_msgSend(v10, "liveServerCatalogOnly"));

      if (objc_msgSend(*(id *)(a1 + 40), "isSupervisedPolicy"))
      {
        objc_msgSend(v6, "setSupervised:", 1);
        objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "productVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setRequestedProductVersion:", v12);

      }
      objc_msgSend(v6, "additionalServerParams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = v16;

      objc_msgSend(*(id *)(a1 + 40), "loadBrainPolicy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "additionalOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 40), "loadBrainPolicy");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "additionalOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addEntriesFromDictionary:", v21);

      }
      objc_msgSend(v6, "setAdditionalServerParams:", v17);

    }
    else
    {
      objc_msgSend(v6, "setDiscretionary:", 0);
      objc_msgSend(v6, "setAllowsCellularAccess:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "assetAudienceUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "assetAudienceUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(v6, "setLiveAssetAudienceUUID:", v27);

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMSUAnomaly:result:description:", CFSTR("LOAD_BRAIN"), 8100, CFSTR("unable to create download options - using default"));
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "oslog");
  v29 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(void **)(a1 + 32);
    objc_msgSend(v30, "brainLoader");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("YES");
    *(_DWORD *)buf = 138543874;
    v36 = v30;
    v37 = 2114;
    if (!v31)
      v32 = CFSTR("NO");
    v38 = v6;
    v39 = 2114;
    v40 = v32;
    _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ loading brain with download options: %{public}@; brain loader present: %{public}@",
      buf,
      0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("loadUpdateBrainWithMAOptions"));
  objc_msgSend(*(id *)(a1 + 32), "brainLoader");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __33__SUCoreMSU__operationLoadBrain___block_invoke_648;
  v34[3] = &unk_1EA879D40;
  v34[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v33, "SUCoreBorder_loadUpdateBrainWithMAOptions:clientOptionsFromPolicy:progressHandler:", v6, v5, v34);

}

uint64_t __33__SUCoreMSU__operationLoadBrain___block_invoke_648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadBrainProgress:error:", a2, a3);
}

- (void)_operationPreflightSUDownload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "buildError:underlying:description:", 8803, 0, CFSTR("Missing required descriptor for PreflightSUDownload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportSUDownloadPreflightFailed:](self, "_reportSUDownloadPreflightFailed:", v16);
    goto LABEL_8;
  }
  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "descriptorType") == 1)
    goto LABEL_5;
  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "descriptorType");

  if (v9 != 3)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", objc_msgSend(v11, "descriptorType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("Unexpected descriptor type %@, expecting SUCoreDescriptorTypeAsset or SUCoreDescriptorTypeSFRAsset"), v12);

    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("PreflightSUDownload"), v7, 8116, 0);

LABEL_5:
  }
  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SUCoreMSU__operationPreflightSUDownload___block_invoke;
  block[3] = &unk_1EA878A88;
  block[4] = self;
  v18 = v4;
  dispatch_async(v14, block);

LABEL_8:
}

void __43__SUCoreMSU__operationPreflightSUDownload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "descriptorType") == 2)
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("MSUPreflightSUDownload"), CFSTR("The descriptor specified a package type which is not expected for download preflight"), 8116, 0);

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "descriptorType");

  if (v4 == 4)
    goto LABEL_4;
LABEL_5:
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "downloadPreflightPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "softwareUpdateDownloadPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "basePreflightOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "softwareUpdateDownloadPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "additionalOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v6, "_newPreflightOptionsUsingPolicy:subPolicyClass:descriptor:baseOptions:additionalOptions:", v7, v9, v10, v12, v14);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU preflight (download)"), CFSTR("preflightOptions"), v15);
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUPreflightUpdate"));
  SUCoreBorder_MSUPreflightUpdate(4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __43__SUCoreMSU__operationPreflightSUDownload___block_invoke_2;
  v20[3] = &unk_1EA878A88;
  v18 = *(_QWORD *)(a1 + 32);
  v21 = v16;
  v22 = v18;
  v19 = v16;
  dispatch_async(v17, v20);

}

uint64_t __43__SUCoreMSU__operationPreflightSUDownload___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportSUDownloadPreflightFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportSUDownloadPreflighted");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUPreflightUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationPreflightPersonalize:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SUCoreMSU__operationPreflightPersonalize___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildError:underlying:description:", 8803, 0, CFSTR("Missing required descriptor for PreflightPersonalize"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportPersonalizePreflightFailed:](self, "_reportPersonalizePreflightFailed:", v9);
  }

}

void __44__SUCoreMSU__operationPreflightPersonalize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "personalizePreflightPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personalizePreflightPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "basePreflightOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personalizePreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "_newPreflightOptionsUsingPolicy:subPolicyClass:descriptor:baseOptions:additionalOptions:", v3, v5, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU preflight (personalize)"), CFSTR("preflightOptions"), v11);
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUPreflightUpdate"));
  SUCoreBorder_MSUPreflightUpdate(2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__SUCoreMSU__operationPreflightPersonalize___block_invoke_2;
  v16[3] = &unk_1EA878A88;
  v14 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  v18 = v14;
  v15 = v12;
  dispatch_async(v13, v16);

}

uint64_t __44__SUCoreMSU__operationPreflightPersonalize___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportPersonalizePreflightFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportPersonalizePreflighted");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUPreflightUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationPreflightFDRRecovery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildError:underlying:description:", 8803, 0, CFSTR("Missing required descriptor for PreflightFDRRecovery"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportFDRRecoveryPreflightFailed:](self, "_reportFDRRecoveryPreflightFailed:", v9);
  }

}

void __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "fdrRecoveryPreflightPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fdrRecoveryPreflightPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "basePreflightOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fdrRecoveryPreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "_newPreflightOptionsUsingPolicy:subPolicyClass:descriptor:baseOptions:additionalOptions:", v3, v5, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU preflight (FDRRecovery)"), CFSTR("preflightOptions"), v11);
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUPreflightUpdate"));
  SUCoreBorder_MSUPreflightUpdate(3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke_2;
  v16[3] = &unk_1EA878A88;
  v14 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  v18 = v14;
  v15 = v12;
  dispatch_async(v13, v16);

}

uint64_t __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportFDRRecoveryPreflightFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportFDRRecoveryPreflighted");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUPreflightUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationPreflightWakeup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__SUCoreMSU__operationPreflightWakeup___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildError:underlying:description:", 8803, 0, CFSTR("Missing required descriptor for PreflightWakeup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportWakeupPreflightFailed:](self, "_reportWakeupPreflightFailed:", v9);
  }

}

void __39__SUCoreMSU__operationPreflightWakeup___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "descriptorType");
  if (v4 != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "descriptorType") != 4)
    {

      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateBrainPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != 2)
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trackAnomaly:forReason:withResult:withError:", CFSTR("MSUPreflightWakeup"), CFSTR("An update brain path is required for preflight, yet none was provided"), 8116, 0);
LABEL_8:

  }
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "wakeupPreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "wakeupPreflightPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "basePreflightOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "wakeupPreflightPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "additionalOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v7, "_newPreflightOptionsUsingPolicy:subPolicyClass:descriptor:baseOptions:additionalOptions:", v8, v10, v11, v13, v15);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU preflight (wakeup)"), CFSTR("preflightOptions"), v16);
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUPreflightUpdate"));
  SUCoreBorder_MSUPreflightUpdate(4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __39__SUCoreMSU__operationPreflightWakeup___block_invoke_2;
  v21[3] = &unk_1EA878A88;
  v19 = *(_QWORD *)(a1 + 32);
  v22 = v17;
  v23 = v19;
  v20 = v17;
  dispatch_async(v18, v21);

}

uint64_t __39__SUCoreMSU__operationPreflightWakeup___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportWakeupPreflightFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportWakeupPreflighted");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUPreflightUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationPreflightPrerequisiteCheck:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildError:underlying:description:", 8803, 0, CFSTR("Missing required descriptor for PreflightPrerequisiteCheck"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportPrerequisiteCheckPreflightFailed:](self, "_reportPrerequisiteCheckPreflightFailed:", v9);
  }

}

void __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "prerequisiteCheckPreflightPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "prerequisiteCheckPreflightPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "basePreflightOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "prerequisiteCheckPreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "_newPreflightOptionsUsingPolicy:subPolicyClass:descriptor:baseOptions:additionalOptions:", v3, v5, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU preflight (prerequisite check)"), CFSTR("preflightOptions"), v11);
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUPreflightUpdate"));
  SUCoreBorder_MSUPreflightUpdate(5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke_2;
  v16[3] = &unk_1EA878A88;
  v14 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  v18 = v14;
  v15 = v12;
  dispatch_async(v13, v16);

}

uint64_t __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportPrerequisiteCheckPreflightFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportPrerequisiteCheckPreflighted");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUPreflightUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationPrepareUpdate:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;

  v5 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "descriptorType");
    if (v9 == 2
      || (-[SUCoreMSU updateDescriptor](self, "updateDescriptor"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "descriptorType") == 4))
    {
      -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateBrainPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != 2)
      if (v11)
      {
LABEL_11:
        -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "descriptorType");
        if (v15 == 2
          || (-[SUCoreMSU updateDescriptor](self, "updateDescriptor"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "descriptorType") == 4))
        {
          -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "updateBundlePath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 != 2)
          if (v17)
            goto LABEL_19;
          objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("MSUPrepare"), CFSTR("An update bundle path is required for prepare, yet none was provided"), 8116, 0);
        }
        else
        {

        }
LABEL_19:
        -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
        -[SUCoreMSU setCancelingPrepare:](self, "setCancelingPrepare:", 0);
        LODWORD(v18) = 0;
        -[SUCoreMSU setNextProgressThreshold:](self, "setNextProgressThreshold:", v18);
        -[SUCoreMSU setPrepareProgressFinal:](self, "setPrepareProgressFinal:", 0);
        -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __37__SUCoreMSU__operationPrepareUpdate___block_invoke;
        v20[3] = &unk_1EA878A88;
        v20[4] = self;
        v21 = v5;
        dispatch_async(v19, v20);

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("MSUPrepare"), CFSTR("An update brain path is required for prepare, yet none was provided"), 8116, 0);
    }
    else
    {

    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buildError:underlying:description:", 8803, 0, CFSTR("Missing required descriptor for PrepareUpdate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreMSU _reportPrepareFailed:](self, "_reportPrepareFailed:", v13);
LABEL_20:

}

void __37__SUCoreMSU__operationPrepareUpdate___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v26 = *(id *)(a1 + 32);
  +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("msu.PrepareUpdate"));
  objc_msgSend(*v2, "setMsuHandle:", 0);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "updateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_newPrepareOptionsUsingPolicy:descriptor:", v3, v5);

  objc_msgSend(*v2, "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU prepare"), CFSTR("prepareOptions"), v6);
  v25 = 0;
  objc_msgSend(*v2, "updateDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "descriptorType") == 2)
  {

LABEL_4:
    objc_msgSend(*v2, "_trackMSUBegin:", CFSTR("MSUPrepareUpdate"));
    objc_msgSend(*v2, "updateDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateBundlePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SUCoreBorder_MSUPrepareUpdate(v11, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(*v2, "updateDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "descriptorType");

  if (v9 == 4)
    goto LABEL_4;
  objc_msgSend(*v2, "_trackMSUBegin:", CFSTR("MSUPrepareUpdateWithMAAsset"));
  objc_msgSend(*v2, "updateDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "softwareUpdateAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SUCoreBorder_MSUPrepareUpdateWithMAAsset(v11, v6);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (void *)v12;

  +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("msu.PrepareUpdate"));
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __37__SUCoreMSU__operationPrepareUpdate___block_invoke_cold_1(v2, (uint64_t)v13, v15);
  }
  else
  {
    objc_msgSend(*v2, "setMsuHandle:", v25);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *v2;
      v18 = objc_msgSend(*v2, "msuHandle");
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU prepare completed successfully, updating msuHandle: %ld", buf, 0x16u);
    }
  }

  objc_msgSend(*v2, "msuControlQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __37__SUCoreMSU__operationPrepareUpdate___block_invoke_697;
  v22[3] = &unk_1EA878A88;
  v20 = *v2;
  v23 = v13;
  v24 = v20;
  v21 = v13;
  dispatch_async(v19, v22);

}

uint64_t __37__SUCoreMSU__operationPrepareUpdate___block_invoke_697(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString **v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;

  v2 = *(void **)(a1 + 40);
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = objc_alloc(MEMORY[0x1E0DA8978]);
    LODWORD(v5) = 1.0;
    v6 = (void *)objc_msgSend(v4, "initWithPhase:isStalled:portionComplete:remaining:", *MEMORY[0x1E0DA8BB8], 0, v5, -1.0);
    objc_msgSend(v2, "_reportPrepared:", v6);

    objc_msgSend(*(id *)(a1 + 40), "updateDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "descriptorType") == 2)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "updateDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "descriptorType");

      if (v12 != 4)
      {
        v13 = *(void **)(a1 + 40);
        v14 = kSU_M_MSUPrepareUpdateWithMAAsset;
        goto LABEL_13;
      }
    }
    v13 = *(void **)(a1 + 40);
    v14 = kSU_M_MSUPrepareUpdate;
LABEL_13:
    v19 = *v14;
    v17 = 0;
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 40), "_reportPrepareFailed:");
  objc_msgSend(*(id *)(a1 + 40), "updateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "descriptorType") == 2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "updateDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "descriptorType");

    if (v9 != 4)
    {
      v10 = kSU_M_MSUPrepareUpdateWithMAAsset;
      goto LABEL_11;
    }
  }
  v10 = kSU_M_MSUPrepareUpdate;
LABEL_11:
  v15 = *v10;
  v16 = *(void **)(a1 + 40);
  v17 = objc_msgSend(*(id *)(a1 + 32), "code");
  v18 = *(_QWORD *)(a1 + 32);
  v13 = v16;
  v19 = v15;
LABEL_14:
  objc_msgSend(v13, "_trackMSUEnd:withResult:withError:", v19, v17, v18);
  objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setCancelingPrepare:", 0);
}

- (void)_operationSuspendUpdate
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SUCoreMSU__operationSuspendUpdate__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __36__SUCoreMSU__operationSuspendUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v4;
    v14 = 2048;
    v15 = objc_msgSend(v4, "msuHandle");
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing MSU suspend update with msuHandle: %ld", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUSuspendUpdate"));
  objc_msgSend(*(id *)(a1 + 32), "msuHandle");
  SUCoreBorder_MSUSuspendUpdate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SUCoreMSU__operationSuspendUpdate__block_invoke_699;
  v9[3] = &unk_1EA878A88;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __36__SUCoreMSU__operationSuspendUpdate__block_invoke_699(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportSuspendFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportSuspended");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUSuspendUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationResumeUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SUCoreMSU__operationResumeUpdate___block_invoke;
  v8[3] = &unk_1EA878A88;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __36__SUCoreMSU__operationResumeUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "resumePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "updateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resumePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseResumeOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resumePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "_newPreflightOptionsUsingPolicy:subPolicyClass:descriptor:baseOptions:additionalOptions:", v3, v5, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU resume"), CFSTR("resumeUpdateOptions"), v11);
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUResumeUpdateWithOptions"));
  v20 = 0;
  SUCoreBorder_MSUResumeUpdateWithOptions(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__SUCoreMSU__operationResumeUpdate___block_invoke_2;
  v16[3] = &unk_1EA879B50;
  v14 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  v18 = v14;
  v19 = 0;
  v15 = v12;
  dispatch_async(v13, v16);

}

uint64_t __36__SUCoreMSU__operationResumeUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oslog");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __36__SUCoreMSU__operationResumeUpdate___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_reportResumeFailed:", *(_QWORD *)(a1 + 32));
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setMsuHandle:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(v10, "msuHandle");
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU resume completed successfully, updating msuHandle: %ld", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_reportResumed");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUResumeUpdateWithOptions"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationApplyUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  LODWORD(v6) = 0;
  -[SUCoreMSU setNextProgressThreshold:](self, "setNextProgressThreshold:", v6);
  -[SUCoreMSU setApplyProgressFinal:](self, "setApplyProgressFinal:", 0);
  -[SUCoreMSU setApplyProgressActionText:](self, "setApplyProgressActionText:", 0);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__SUCoreMSU__operationApplyUpdate___block_invoke;
  v9[3] = &unk_1EA878A88;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __35__SUCoreMSU__operationApplyUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = *(id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "updateDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "applyPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseApplyOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "_newMSUOptionsUsingPolicy:descriptor:baseOptions:", v3, v4, v6);

  objc_msgSend(*(id *)(a1 + 40), "updateApplyOptionsWithExtensions:", v7);
  objc_msgSend(*(id *)(a1 + 40), "applyPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU apply"), CFSTR("applyOptions"), v7);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    v23 = 2048;
    v24 = objc_msgSend(v12, "msuHandle");
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ performing MSU apply with msuHandle: %ld", buf, 0x16u);
  }

  +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("msu.ApplyUpdate"));
  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUApplyUpdate"));
  SUCoreBorder_MSUApplyUpdate(objc_msgSend(*(id *)(a1 + 32), "msuHandle"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("msu.ApplyUpdate"));
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SUCoreMSU__operationApplyUpdate___block_invoke_708;
  block[3] = &unk_1EA878A88;
  v15 = *(_QWORD *)(a1 + 32);
  v18 = v13;
  v19 = v15;
  v16 = v13;
  dispatch_async(v14, block);

}

uint64_t __35__SUCoreMSU__operationApplyUpdate___block_invoke_708(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportApplyFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportApplied");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUApplyUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_removePrepared
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SUCoreMSU__removePrepared__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __28__SUCoreMSU__removePrepared__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_trackMSUBegin:", CFSTR("MSUPurgeSuspendedUpdate"));
  SUCoreBorder_MSUPurgeSuspendedUpdate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__SUCoreMSU__removePrepared__block_invoke_2;
  v6[3] = &unk_1EA878A88;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __28__SUCoreMSU__removePrepared__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportRemoveFailed:");
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v2, "_reportRemoved");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSUPurgeSuspendedUpdate"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setRemovingPrepared:", 0);
}

- (void)_operationRollbackUpdatePrepare:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUCoreMSU *v10;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke;
  v8[3] = &unk_1EA878A88;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  void *v32;
  _BYTE buf[12];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileAsset.SplatSoftwareUpdate")))
  {

LABEL_4:
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "rollbackDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "_newRollbackPrepareOptionsUsingPolicy:rollbackDescriptor:", v6, v7);

    objc_msgSend(*(id *)(a1 + 40), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU rollback prepare"), CFSTR("rollbackOptions"), v8);
    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("msu.RollbackUpdatePrepare"));
    objc_msgSend(*(id *)(a1 + 40), "_trackMSUBegin:", CFSTR("MSURollbackUpdatePrepare"));
    *(_QWORD *)buf = 0;
    SUCoreBorder_MSURollbackUpdatePrepare((uint64_t)buf, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("msu.RollbackUpdatePrepare"));
    objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2;
    block[3] = &unk_1EA879B50;
    v11 = v9;
    v12 = *(_QWORD *)(a1 + 40);
    v26 = v11;
    v27 = v12;
    v28 = *(_QWORD *)buf;
    dispatch_async(v10, block);

    v13 = v26;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.MacSplatSoftwareUpdate"));

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Rollback prepare operation only supported for Splat asset types. Asset Type %@ unsupported"), v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v18;
    v34 = 2114;
    v35 = v8;
    _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0DA8AD8];
  v31 = *MEMORY[0x1E0CB2D50];
  v32 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 8118, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ROLLBACK_UPDATE_PREPARE"), CFSTR("SoftwareUpdateAssetType is not supported with rollback"), 8118, v22);

  objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_716;
  v29[3] = &unk_1EA878A88;
  v29[4] = *(_QWORD *)(a1 + 40);
  v11 = v22;
  v30 = v11;
  dispatch_async(v24, v29);

  v13 = v30;
LABEL_8:

}

uint64_t __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_716(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reportRollbackFailed:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setPerformingOperation:", 0);
}

uint64_t __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackFailed:", *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 40);
    v6 = objc_msgSend(*(id *)(a1 + 32), "code");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = 138543618;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU rollback completed successfully, updating msuHandle: %ld", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setMsuHandle:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackPrepareSuccess");
    v8 = *(void **)(a1 + 40);
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(v8, "_trackMSUEnd:withResult:withError:", CFSTR("MSURollbackUpdatePrepare"), v6, v7);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationRollbackUpdateSuspend:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUCoreMSU *v10;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke;
  v8[3] = &unk_1EA878A88;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileAsset.SplatSoftwareUpdate")))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v32 = v7;
      v33 = 2048;
      v34 = objc_msgSend(v7, "msuHandle");
      _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing MSU suspend rollback update with msuHandle: %ld", buf, 0x16u);
    }

    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("msu.RollbackUpdateSuspend"));
    objc_msgSend(*(id *)(a1 + 40), "_trackMSUBegin:", CFSTR("MSURollbackUpdateSuspend"));
    objc_msgSend(*(id *)(a1 + 40), "msuHandle");
    SUCoreBorder_MSURollbackUpdateSuspend();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("msu.RollbackUpdateSuspend"));
    objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_726;
    block[3] = &unk_1EA878A88;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 40);
    v25 = v10;
    v26 = v11;
    dispatch_async(v9, block);

    v12 = v25;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.MacSplatSoftwareUpdate"));

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Rollback suspend operation only supported for Splat asset types. Asset Type %@ unsupported"), v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v17;
    v33 = 2114;
    v34 = (uint64_t)v12;
    _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0DA8AD8];
  v29 = *MEMORY[0x1E0CB2D50];
  v30 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 8118, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ROLLBACK_UPDATE_SUSPEND"), CFSTR("SoftwareUpdateAssetType is not supported with rollback"), 8118, v21);

  objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_725;
  v27[3] = &unk_1EA878A88;
  v27[4] = *(_QWORD *)(a1 + 40);
  v10 = v21;
  v28 = v10;
  dispatch_async(v23, v27);

LABEL_10:
}

uint64_t __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_725(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reportRollbackFailed:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setPerformingOperation:", 0);
}

uint64_t __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_726(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_726_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackFailed:", *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 40);
    v6 = objc_msgSend(*(id *)(a1 + 32), "code");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = objc_msgSend(v9, "msuHandle");
      _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU suspend rollback completed successfully, msuHandle: %ld", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackSuspendSuccess");
    v8 = *(void **)(a1 + 40);
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(v8, "_trackMSUEnd:withResult:withError:", CFSTR("MSURollbackUpdateSuspend"), v6, v7);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationRollbackUpdateResume:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUCoreMSU *v10;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke;
  v8[3] = &unk_1EA878A88;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  void *v31;
  _BYTE buf[12];
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileAsset.SplatSoftwareUpdate")))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      v33 = 2048;
      v34 = objc_msgSend(v7, "msuHandle");
      _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing MSU resume rollback update with msuHandle: %ld", buf, 0x16u);
    }

    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("msu.RollbackUpdateResume"));
    objc_msgSend(*(id *)(a1 + 40), "_trackMSUBegin:", CFSTR("MSURollbackUpdateResume"));
    *(_QWORD *)buf = 0;
    SUCoreBorder_MSURollbackUpdateResumeWithOptions(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("msu.RollbackUpdateResume"));
    objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_732;
    block[3] = &unk_1EA879B50;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 40);
    v25 = v10;
    v26 = v11;
    v27 = *(_QWORD *)buf;
    dispatch_async(v9, block);

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.MacSplatSoftwareUpdate"));

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Rollback resume operation only supported for Splat asset types. Asset Type %@ unsupported"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    v33 = 2114;
    v34 = (uint64_t)v14;
    _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0DA8AD8];
  v30 = *MEMORY[0x1E0CB2D50];
  v31 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 8118, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ROLLBACK_UPDATE_RESUME"), CFSTR("SoftwareUpdateAssetType is not supported with rollback"), 8118, v21);

  objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_731;
  v28[3] = &unk_1EA878A88;
  v28[4] = *(_QWORD *)(a1 + 40);
  v10 = v21;
  v29 = v10;
  dispatch_async(v23, v28);

LABEL_10:
}

uint64_t __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_731(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reportRollbackFailed:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setPerformingOperation:", 0);
}

uint64_t __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_732(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oslog");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_732_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackFailed:", *(_QWORD *)(a1 + 32));
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 32), "code");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setMsuHandle:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(v10, "msuHandle");
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU resume completed successfully, updating msuHandle: %ld", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackResumeSuccess");
    v7 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 0;
  }
  objc_msgSend(v7, "_trackMSUEnd:withResult:withError:", CFSTR("MSURollbackUpdateResume"), v5, v6);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)_operationRollbackUpdateApply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUCoreMSU *v10;

  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke;
  v8[3] = &unk_1EA878A88;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD block[4];
  id v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileAsset.SplatSoftwareUpdate")))
  {

LABEL_4:
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "rollbackDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rollbackPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baseRollbackOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rollbackPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "additionalOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "_newMSURollbackOptionsUsingPolicy:rollbackDescriptor:baseOptions:additionalOptions:", v6, v7, v9, v11);

    objc_msgSend(*(id *)(a1 + 32), "updateApplyOptionsWithExtensions:", v12);
    objc_msgSend(*(id *)(a1 + 40), "_trackMSUOptions:optionsName:withMSUOptions:", CFSTR("performing MSU rollback apply"), CFSTR("applyOptions"), v12);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v40 = v15;
      v41 = 2048;
      v42 = objc_msgSend(v15, "msuHandle");
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ performing MSU rollback apply with msuHandle: %ld", buf, 0x16u);
    }

    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("msu.ApplyUpdate"));
    objc_msgSend(*(id *)(a1 + 40), "_trackMSUBegin:", CFSTR("MSURollbackUpdateApply"));
    SUCoreBorder_MSURollbackUpdateApply(objc_msgSend(*(id *)(a1 + 40), "msuHandle"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("msu.ApplyUpdate"));
    objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_740;
    block[3] = &unk_1EA878A88;
    v18 = v16;
    v19 = *(_QWORD *)(a1 + 40);
    v33 = v18;
    v34 = v19;
    dispatch_async(v17, block);

    v20 = v33;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.MacSplatSoftwareUpdate"));

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateAssetType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("Rollback apply operation only supported for Splat asset types. Asset Type %@ unsupported"), v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "oslog");
  v24 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v40 = v25;
    v41 = 2114;
    v42 = (uint64_t)v12;
    _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v27 = *MEMORY[0x1E0DA8AD8];
  v37 = *MEMORY[0x1E0CB2D50];
  v38 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 8118, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] ROLLBACK_UPDATE_APPLY"), CFSTR("SoftwareUpdateAssetType is not supported with rollback"), 8118, v29);

  objc_msgSend(*(id *)(a1 + 40), "msuControlQueue");
  v31 = objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_737;
  v35[3] = &unk_1EA878A88;
  v35[4] = *(_QWORD *)(a1 + 40);
  v18 = v29;
  v36 = v18;
  dispatch_async(v31, v35);

  v20 = v36;
LABEL_10:

}

uint64_t __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_737(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reportRollbackFailed:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setPerformingOperation:", 0);
}

uint64_t __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_740(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_740_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackApplyFailed:", *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 40);
    v6 = objc_msgSend(*(id *)(a1 + 32), "code");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU apply rollback completed successfully", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_reportRollbackApplySuccess");
    v8 = *(void **)(a1 + 40);
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(v8, "_trackMSUEnd:withResult:withError:", CFSTR("MSURollbackUpdateApply"), v6, v7);
  return objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
}

- (void)loadBrainProgress:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SUCoreMSU *v14;

  v6 = a3;
  v7 = a4;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SUCoreMSU_loadBrainProgress_error___block_invoke;
  block[3] = &unk_1EA878940;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __37__SUCoreMSU_loadBrainProgress_error___block_invoke(id *a1)
{
  id v2;
  id v3;
  double v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a1[4])
  {
    objc_msgSend(a1[6], "_reportBrainLoadFailed:");
    objc_msgSend(a1[6], "_trackMSUEnd:withResult:withError:", CFSTR("loadUpdateBrainWithMAOptions"), objc_msgSend(a1[4], "code"), a1[4]);
    objc_msgSend(a1[6], "setPerformingOperation:", 0);
  }
  else
  {
    objc_msgSend(a1[5], "safeStringForKey:", *MEMORY[0x1E0D4DF90]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D4DF70]))
    {
      v2 = a1[6];
      v3 = objc_alloc(MEMORY[0x1E0DA8978]);
      LODWORD(v4) = -1.0;
      v5 = (void *)objc_msgSend(v3, "initWithPhase:isStalled:portionComplete:remaining:", *MEMORY[0x1E0DA8BB0], 1, v4, -1.0);
      objc_msgSend(v2, "_reportBrainLoadStalled:", v5);

    }
    else
    {
      v6 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D4DF68]);
      v7 = a1[6];
      v8 = objc_alloc(MEMORY[0x1E0DA8978]);
      v10 = *MEMORY[0x1E0DA8BB0];
      if (v6)
      {
        LODWORD(v9) = 1.0;
        v11 = (void *)objc_msgSend(v8, "initWithPhase:isStalled:portionComplete:remaining:", v10, 0, v9, -1.0);
        objc_msgSend(v7, "_reportBrainLoaded:", v11);

        objc_msgSend(a1[6], "_trackMSUEnd:withResult:withError:", CFSTR("loadUpdateBrainWithMAOptions"), 0, 0);
        objc_msgSend(a1[6], "setPerformingOperation:", 0);
      }
      else
      {
        LODWORD(v9) = -1.0;
        v12 = (void *)objc_msgSend(v8, "initWithPhase:isStalled:portionComplete:remaining:", v10, 0, v9, -1.0);
        objc_msgSend(v7, "_reportBrainLoadProgress:", v12);

      }
    }

  }
}

- (int)prepareProgress:(__CFDictionary *)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SUCoreMSU_prepareProgress___block_invoke;
  block[3] = &unk_1EA878B38;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LODWORD(a3) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return (int)a3;
}

void __29__SUCoreMSU_prepareProgress___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  float v6;
  float v7;
  double v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingPrepare"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oslog");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting cancel (on return from prepare progress)", buf, 0xCu);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
  }
  else
  {
    CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E0D4F8B8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    *(float *)&v5 = v5;
    v6 = fminf(fmaxf(*(float *)&v5 / 100.0, 0.0), 1.0);
    objc_msgSend(*(id *)(a1 + 32), "nextProgressThreshold");
    if (v6 > v7 && (objc_msgSend(*(id *)(a1 + 32), "prepareProgressFinal") & 1) == 0)
    {
      *(float *)&v8 = v6 + 0.01;
      if ((float)(v6 + 0.01) >= 0.99)
      {
        if (v6 >= 0.99)
        {
          objc_msgSend(*(id *)(a1 + 32), "setPrepareProgressFinal:", 1, v8);
          if (v6 > 0.99)
            v6 = 0.99;
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setNextProgressThreshold:", v8);
      }
      v9 = *(void **)(a1 + 32);
      v10 = objc_alloc(MEMORY[0x1E0DA8978]);
      *(float *)&v11 = v6;
      v12 = (void *)objc_msgSend(v10, "initWithPhase:isStalled:portionComplete:remaining:", *MEMORY[0x1E0DA8BB8], 0, v11, -1.0);
      objc_msgSend(v9, "_reportPrepareProgress:", v12);

    }
  }
}

- (int)applyProgress:(__CFDictionary *)a3
{
  NSObject *v5;
  _QWORD v7[6];

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__SUCoreMSU_applyProgress___block_invoke;
  v7[3] = &unk_1EA879BC8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v5, v7);

  return 0;
}

void __27__SUCoreMSU_applyProgress___block_invoke(uint64_t a1)
{
  double v2;
  BOOL v3;
  CFTypeID v4;
  float v5;
  float v6;
  char v7;
  void *v8;
  id v9;
  CFTypeID v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  float valuePtr;
  void *value;

  value = 0;
  valuePtr = -1.0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E0D4F8B8], (const void **)&value))
  {
    v3 = value == 0;
  }
  else
  {
    v3 = 1;
  }
  if (v3
    || (v4 = CFGetTypeID(value), v4 != CFNumberGetTypeID())
    || (CFNumberGetValue((CFNumberRef)value, kCFNumberFloatType, &valuePtr), *(float *)&v2 = valuePtr, valuePtr < 0.0)
    || (v5 = fminf(valuePtr, 1.0), objc_msgSend(*(id *)(a1 + 32), "nextProgressThreshold"), v5 <= *(float *)&v2)
    || (objc_msgSend(*(id *)(a1 + 32), "applyProgressFinal") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "nextProgressThreshold", v2);
    v5 = v6;
    v7 = 0;
    goto LABEL_10;
  }
  *(float *)&v2 = v5 + 0.01;
  if ((float)(v5 + 0.01) < 0.99)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNextProgressThreshold:", v2);
LABEL_23:
    v7 = 1;
    goto LABEL_10;
  }
  if (v5 < 0.99)
    goto LABEL_23;
  v7 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setApplyProgressFinal:", 1, v2);
  if (v5 > 0.99)
    v5 = 0.99;
LABEL_10:
  v8 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E0D4F8B0]);
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFStringGetTypeID())
    {
      v9 = v9;
      objc_msgSend(*(id *)(a1 + 32), "applyProgressActionText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(a1 + 32);
      if (!v11)
      {
LABEL_15:
        objc_msgSend(v12, "setApplyProgressActionText:", v9);
LABEL_18:
        v15 = *(void **)(a1 + 32);
        v16 = objc_alloc(MEMORY[0x1E0DA8978]);
        *(float *)&v17 = v5;
        v18 = (void *)objc_msgSend(v16, "initWithPhase:isStalled:portionComplete:remaining:actionText:", *MEMORY[0x1E0DA8BA0], 0, v9, v17, -1.0);
        objc_msgSend(v15, "_reportApplyProgress:", v18);

        goto LABEL_19;
      }
      objc_msgSend(v12, "applyProgressActionText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v9);

      if ((v14 & 1) == 0)
      {
        v12 = *(void **)(a1 + 32);
        goto LABEL_15;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  if ((v7 & 1) != 0)
    goto LABEL_18;
LABEL_19:

}

- (void)_reportBrainLoadProgress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  SUCoreMSU *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__SUCoreMSU__reportBrainLoadProgress___block_invoke;
    v12[3] = &unk_1EA878A88;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoadProgress:); so not reporting progress=%{public}@",
        buf,
        0x16u);

    }
  }

}

void __38__SUCoreMSU__reportBrainLoadProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuBrainLoadProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_reportBrainLoadStalled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  SUCoreMSU *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__SUCoreMSU__reportBrainLoadStalled___block_invoke;
    v12[3] = &unk_1EA878A88;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoadStalled:); so not reporting stalled with progress=%{public}@",
        buf,
        0x16u);

    }
  }

}

void __37__SUCoreMSU__reportBrainLoadStalled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuBrainLoadStalled:", *(_QWORD *)(a1 + 40));

}

- (void)_reportBrainLoaded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreMSU *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU loadBrainTransaction](self, "loadBrainTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setLoadBrainTransaction:](self, "setLoadBrainTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SUCoreMSU__reportBrainLoaded___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v14 = v4;
    v15 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoaded:); so not reporting brain loaded with progress=%{public}@",
        buf,
        0x16u);

    }
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.LoadBrain"));
  }

}

uint64_t __32__SUCoreMSU__reportBrainLoaded___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuBrainLoaded:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.LoadBrain"));
}

- (void)_reportBrainLoadFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU loadBrainTransaction](self, "loadBrainTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setLoadBrainTransaction:](self, "setLoadBrainTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__SUCoreMSU__reportBrainLoadFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoadFailed:); so not reporting brain load failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.LoadBrain"));
  }

}

uint64_t __36__SUCoreMSU__reportBrainLoadFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuBrainLoadFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.LoadBrain"));
}

- (void)_reportSUDownloadPreflighted
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightDownloadSUTransaction](self, "preflightDownloadSUTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightDownloadSUTransaction:](self, "setPreflightDownloadSUTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__SUCoreMSU__reportSUDownloadPreflighted__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSUDownloadPreflighted); so not reporting SU download preflighted",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.PreflightDownloadSU"));
  }

}

uint64_t __41__SUCoreMSU__reportSUDownloadPreflighted__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuSUDownloadPreflighted");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightDownloadSU"));
}

- (void)_reportSUDownloadPreflightFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightDownloadSUTransaction](self, "preflightDownloadSUTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightDownloadSUTransaction:](self, "setPreflightDownloadSUTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SUCoreMSU__reportSUDownloadPreflightFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSUDownloadPreflightFailed:); so not reporting SU download pr"
        "eflight failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PreflightDownloadSU"));
  }

}

uint64_t __46__SUCoreMSU__reportSUDownloadPreflightFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuSUDownloadPreflightFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PreflightDownloadSU"));
}

- (void)_reportPersonalizePreflighted
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightPersonalizeTransaction](self, "preflightPersonalizeTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPersonalizeTransaction:](self, "setPreflightPersonalizeTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportPersonalizePreflighted__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPersonalizePreflighted); so not reporting personalization preflighted",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.PreflightPersonalize"));
  }

}

uint64_t __42__SUCoreMSU__reportPersonalizePreflighted__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPersonalizePreflighted");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightPersonalize"));
}

- (void)_reportPersonalizePreflightFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightPersonalizeTransaction](self, "preflightPersonalizeTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPersonalizeTransaction:](self, "setPreflightPersonalizeTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SUCoreMSU__reportPersonalizePreflightFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPersonalizePreflightFailed:); so not reporting personalizati"
        "on preflight failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PreflightDownloadSU"));
  }

}

uint64_t __47__SUCoreMSU__reportPersonalizePreflightFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPersonalizePreflightFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PreflightDownloadSU"));
}

- (void)_reportFDRRecoveryPreflighted
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightFDRRecoveryTransaction](self, "preflightFDRRecoveryTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightFDRRecoveryTransaction:](self, "setPreflightFDRRecoveryTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportFDRRecoveryPreflighted__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuFDRRecoveryPreflighted); so not reporting FDRRecovery preflighted",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.PreflightFDRRecovery"));
  }

}

uint64_t __42__SUCoreMSU__reportFDRRecoveryPreflighted__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuFDRRecoveryPreflighted");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightFDRRecovery"));
}

- (void)_reportFDRRecoveryPreflightFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightFDRRecoveryTransaction](self, "preflightFDRRecoveryTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightFDRRecoveryTransaction:](self, "setPreflightFDRRecoveryTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SUCoreMSU__reportFDRRecoveryPreflightFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuFDRRecoveryPreflightFailed:); so not reporting FDRRecovery p"
        "reflight failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PreflightFDRRecovery"));
  }

}

uint64_t __47__SUCoreMSU__reportFDRRecoveryPreflightFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuFDRRecoveryPreflightFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PreflightFDRRecovery"));
}

- (void)_reportWakeupPreflighted
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightWakeupTransaction](self, "preflightWakeupTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightWakeupTransaction:](self, "setPreflightWakeupTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__SUCoreMSU__reportWakeupPreflighted__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuWakeupPreflighted); so not reporting wakeup preflighted",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.PreflightWakeup"));
  }

}

uint64_t __37__SUCoreMSU__reportWakeupPreflighted__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuWakeupPreflighted");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightWakeup"));
}

- (void)_reportWakeupPreflightFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightWakeupTransaction](self, "preflightWakeupTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightWakeupTransaction:](self, "setPreflightWakeupTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SUCoreMSU__reportWakeupPreflightFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuWakeupPreflightFailed:); so not reporting wakeup preflight f"
        "ailed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PreflightWakeup"));
  }

}

uint64_t __42__SUCoreMSU__reportWakeupPreflightFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuWakeupPreflightFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PreflightWakeup"));
}

- (void)_reportPrerequisiteCheckPreflighted
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightPrerequisiteCheckTransaction](self, "preflightPrerequisiteCheckTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPrerequisiteCheckTransaction:](self, "setPreflightPrerequisiteCheckTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SUCoreMSU__reportPrerequisiteCheckPreflighted__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrerequisiteCheckPreflighted); so not reporting prerequisite"
        " check preflighted",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.PreflightPrerequisiteCheck"));
  }

}

uint64_t __48__SUCoreMSU__reportPrerequisiteCheckPreflighted__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPrerequisiteCheckPreflighted");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.PreflightPrerequisiteCheck"));
}

- (void)_reportPrerequisiteCheckPreflightFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightPrerequisiteCheckTransaction](self, "preflightPrerequisiteCheckTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPrerequisiteCheckTransaction:](self, "setPreflightPrerequisiteCheckTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SUCoreMSU__reportPrerequisiteCheckPreflightFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrerequisiteCheckPreflightFailed:); so not reporting prerequ"
        "isite check preflight failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PreflightPrerequisiteCheck"));
  }

}

uint64_t __53__SUCoreMSU__reportPrerequisiteCheckPreflightFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPrerequisiteCheckPreflightFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PreflightPrerequisiteCheck"));
}

- (void)_reportPrepared:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  SUCoreMSU *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU prepareUpdateTransaction](self, "prepareUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPrepareUpdateTransaction:](self, "setPrepareUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__SUCoreMSU__reportPrepared___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v14 = v4;
    v15 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrepared:); so not reporting prepared with progress=%{public}@",
        buf,
        0x16u);

    }
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PrepareUpdate"));
  }

}

uint64_t __29__SUCoreMSU__reportPrepared___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPrepared:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PrepareUpdate"));
}

- (void)_reportPrepareProgress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  SUCoreMSU *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__SUCoreMSU__reportPrepareProgress___block_invoke;
    v12[3] = &unk_1EA878A88;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrepareProgress:); so not reporting prepare progress=%{public}@",
        buf,
        0x16u);

    }
  }

}

void __36__SUCoreMSU__reportPrepareProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPrepareProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_reportApplyProgress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  SUCoreMSU *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__SUCoreMSU__reportApplyProgress___block_invoke;
    v12[3] = &unk_1EA878A88;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuApplyProgress:); so not reporting apply progress=%{public}@",
        buf,
        0x16u);

    }
  }

}

void __34__SUCoreMSU__reportApplyProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuApplyProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_reportPrepareFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU prepareUpdateTransaction](self, "prepareUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPrepareUpdateTransaction:](self, "setPrepareUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__SUCoreMSU__reportPrepareFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrepareFailed:); so not reporting prepare failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.PrepareUpdate"));
  }

}

uint64_t __34__SUCoreMSU__reportPrepareFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuPrepareFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.PrepareUpdate"));
}

- (void)_reportSuspended
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU suspendUpdateTransaction](self, "suspendUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setSuspendUpdateTransaction:](self, "setSuspendUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__SUCoreMSU__reportSuspended__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSuspended); so not reporting suspended",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.SuspendUpdate"));
  }

}

uint64_t __29__SUCoreMSU__reportSuspended__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuSuspended");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.SuspendUpdate"));
}

- (void)_reportSuspendFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU suspendUpdateTransaction](self, "suspendUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setSuspendUpdateTransaction:](self, "setSuspendUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__SUCoreMSU__reportSuspendFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSuspendFailed:); so not reporting suspend failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.SuspendUpdate"));
  }

}

uint64_t __34__SUCoreMSU__reportSuspendFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuSuspendFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.SuspendUpdate"));
}

- (void)_reportResumed
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU resumeUpdateTransaction](self, "resumeUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setResumeUpdateTransaction:](self, "setResumeUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__SUCoreMSU__reportResumed__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuResumed); so not reporting resumed",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.ResumeUpdate"));
  }

}

uint64_t __27__SUCoreMSU__reportResumed__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuResumed");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.ResumeUpdate"));
}

- (void)_reportResumeFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU resumeUpdateTransaction](self, "resumeUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setResumeUpdateTransaction:](self, "setResumeUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__SUCoreMSU__reportResumeFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuResumeFailed:); so not reporting resume failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.ResumeUpdate"));
  }

}

uint64_t __33__SUCoreMSU__reportResumeFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuResumeFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.ResumeUpdate"));
}

- (void)_reportApplied
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU applyUpdateTransaction](self, "applyUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setApplyUpdateTransaction:](self, "setApplyUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__SUCoreMSU__reportApplied__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuApplied); so not reporting applied",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.ApplyUpdate"));
  }

}

uint64_t __27__SUCoreMSU__reportApplied__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuApplied");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.ApplyUpdate"));
}

- (void)_reportApplyFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU applyUpdateTransaction](self, "applyUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setApplyUpdateTransaction:](self, "setApplyUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SUCoreMSU__reportApplyFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuApplyFailed:); so not reporting apply failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.ApplyUpdate"));
  }

}

uint64_t __32__SUCoreMSU__reportApplyFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuApplyFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.ApplyUpdate"));
}

- (void)_reportRollbackPrepareSuccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportRollbackPrepareSuccess__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackPrepareSuccess); so not reporting msuRollbackPrepareSuccess",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.RollbackUpdate"));
  }

}

uint64_t __42__SUCoreMSU__reportRollbackPrepareSuccess__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRollbackPrepareSuccess");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
}

- (void)_reportRollbackSuspendSuccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportRollbackSuspendSuccess__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackSuspendSuccess); so not reporting msuRollbackSuspendSuccess",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.RollbackUpdate"));
  }

}

uint64_t __42__SUCoreMSU__reportRollbackSuspendSuccess__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRollbackSuspendSuccess");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
}

- (void)_reportRollbackResumeSuccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__SUCoreMSU__reportRollbackResumeSuccess__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackResumeSuccess); so not reporting msuRollbackResumeSuccess",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.RollbackUpdate"));
  }

}

uint64_t __41__SUCoreMSU__reportRollbackResumeSuccess__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRollbackResumeSuccess");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
}

- (void)_reportRollbackApplySuccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__SUCoreMSU__reportRollbackApplySuccess__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackApplySuccess); so not reporting msuRollbackApplySuccess",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.RollbackUpdate"));
  }

}

uint64_t __40__SUCoreMSU__reportRollbackApplySuccess__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRollbackApplySuccess");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RollbackUpdate"));
}

- (void)_reportRollbackApplyFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SUCoreMSU__reportRollbackApplyFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackApplyFailed:); so not reporting apply failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.RollbackUpdate"));
  }

}

uint64_t __40__SUCoreMSU__reportRollbackApplyFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRollbackApplyFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.RollbackUpdate"));
}

- (void)_reportRollbackFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SUCoreMSU__reportRollbackFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackFailed:); so not reporting rollback failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.RollbackUpdate"));
  }

}

uint64_t __35__SUCoreMSU__reportRollbackFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRollbackFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.RollbackUpdate"));
}

- (void)_reportRemoved
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU removePreparedTransaction](self, "removePreparedTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRemovePreparedTransaction:](self, "setRemovePreparedTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__SUCoreMSU__reportRemoved__block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRemoved); so not reporting removed",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v4, CFSTR("msu.RemovePrepared"));
  }

}

uint64_t __27__SUCoreMSU__reportRemoved__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRemoved");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("msu.RemovePrepared"));
}

- (void)_reportRemoveFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  SUCoreMSU *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU removePreparedTransaction](self, "removePreparedTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRemovePreparedTransaction:](self, "setRemovePreparedTransaction:", 0);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__SUCoreMSU__reportRemoveFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v13 = v4;
    v14 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRemoveFailed:); so not reporting remove failed error=%{public}@",
        buf,
        0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v6, CFSTR("msu.RemovePrepared"));
  }

}

uint64_t __33__SUCoreMSU__reportRemoveFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuRemoveFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("msu.RemovePrepared"));
}

- (void)_reportAnomaly:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  SUCoreMSU *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__SUCoreMSU__reportAnomaly___block_invoke;
    v10[3] = &unk_1EA878A88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v7, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuAnomaly:); so not reporting anomaly error=%{public}@",
        buf,
        0x16u);
    }

  }
}

void __28__SUCoreMSU__reportAnomaly___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "msuDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msuAnomaly:", *(_QWORD *)(a1 + 40));

}

- (void)_trackMSUBegin:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DA8938];
  v4 = a3;
  objc_msgSend(v3, "sharedDiag");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackBegin:atLevel:forModule:", v4, 1, CFSTR("msu"));

}

- (void)_trackMSUEnd:(id)a3
{
  -[SUCoreMSU _trackMSUEnd:withResult:withError:](self, "_trackMSUEnd:withResult:withError:", a3, 0, 0);
}

- (void)_trackMSUEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0DA8938];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "sharedDiag");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackEnd:atLevel:forModule:withResult:withError:", v9, 1, CFSTR("msu"), a4, v8);

}

- (void)_trackMSUOptions:(id)a3 optionsName:(id)a4 withMSUOptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  SUCoreMSU *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  SUCoreMSU *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v39;
  void *v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  SUCoreMSU *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "safeDescriptionWithName:maxNestedLevel:withMaxValueLength:providingSubstitutionMap:", v7, 0, 64, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v53 = self;
    v54 = 2114;
    v55 = v39;
    v56 = 2114;
    v57 = v10;
    _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ | %{public}@ | %{public}@", buf, 0x20u);
  }
  v37 = (void *)v10;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v13);
        v18 = *(SUCoreMSU **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "oslog");
        v20 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v18;
          _os_log_impl(&dword_1DDFDD000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v15);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "safeSubDescriptionAtNestedLevel:instanceAtLevel:withMaxValueLength:providingSubstitutionMap:", 1, 0, 96, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v36 = v7;
    v24 = 0;
    do
    {
      v41 = v24;
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", v36, v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "oslog");
      v26 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v53 = self;
        v54 = 2114;
        v55 = v39;
        v56 = 2114;
        v57 = (uint64_t)v23;
        _os_log_impl(&dword_1DDFDD000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ | %{public}@ | %{public}@", buf, 0x20u);
      }
      v40 = v23;

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v27 = v21;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v43 != v30)
              objc_enumerationMutation(v27);
            v32 = *(SUCoreMSU **)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "oslog");
            v34 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v32;
              _os_log_impl(&dword_1DDFDD000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v29);
      }

      v24 = v41 + 1;
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

      objc_msgSend(v8, "safeSubDescriptionAtNestedLevel:instanceAtLevel:withMaxValueLength:providingSubstitutionMap:", 1, v41 + 1, 96, v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        break;
      v23 = v35;
    }
    while (v41 < 5);

    v7 = v36;
  }

}

- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
  -[SUCoreMSU _trackMSUAnomaly:result:description:underlying:](self, "_trackMSUAnomaly:result:description:underlying:", a3, a4, a5, 0);
}

- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = (void *)MEMORY[0x1E0DA8920];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "buildError:underlying:description:", a4, v11, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[MSU] %@"), v13);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), self, v12);
  objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", v16, v17, a4, v18);

  -[SUCoreMSU _reportAnomaly:](self, "_reportAnomaly:", v18);
}

- (OS_dispatch_queue)msuControlQueue
{
  return self->_msuControlQueue;
}

- (OS_dispatch_queue)msuOperationQueue
{
  return self->_msuOperationQueue;
}

- (NSString)descriptionName
{
  return self->_descriptionName;
}

- (void)setDescriptionName:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionName, a3);
}

- (id)msuDelegate
{
  return objc_loadWeakRetained(&self->_msuDelegate);
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_updateUUID, a3);
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (void)setUpdateDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_updateDescriptor, a3);
}

- (BOOL)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(BOOL)a3
{
  self->_performingOperation = a3;
}

- (BOOL)cancelingPrepare
{
  return self->_cancelingPrepare;
}

- (void)setCancelingPrepare:(BOOL)a3
{
  self->_cancelingPrepare = a3;
}

- (BOOL)removingPrepared
{
  return self->_removingPrepared;
}

- (void)setRemovingPrepared:(BOOL)a3
{
  self->_removingPrepared = a3;
}

- (float)nextProgressThreshold
{
  return self->_nextProgressThreshold;
}

- (void)setNextProgressThreshold:(float)a3
{
  self->_nextProgressThreshold = a3;
}

- (BOOL)prepareProgressFinal
{
  return self->_prepareProgressFinal;
}

- (void)setPrepareProgressFinal:(BOOL)a3
{
  self->_prepareProgressFinal = a3;
}

- (BOOL)applyProgressFinal
{
  return self->_applyProgressFinal;
}

- (void)setApplyProgressFinal:(BOOL)a3
{
  self->_applyProgressFinal = a3;
}

- (NSString)applyProgressActionText
{
  return self->_applyProgressActionText;
}

- (void)setApplyProgressActionText:(id)a3
{
  objc_storeStrong((id *)&self->_applyProgressActionText, a3);
}

- (MSUUpdateBrainAssetLoader)brainLoader
{
  return self->_brainLoader;
}

- (void)setBrainLoader:(id)a3
{
  objc_storeStrong((id *)&self->_brainLoader, a3);
}

- (int64_t)msuHandle
{
  return self->_msuHandle;
}

- (void)setMsuHandle:(int64_t)a3
{
  self->_msuHandle = a3;
}

- (SUCoreRollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackDescriptor, a3);
}

- (OS_os_transaction)loadBrainTransaction
{
  return self->_loadBrainTransaction;
}

- (void)setLoadBrainTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_loadBrainTransaction, a3);
}

- (OS_os_transaction)preflightDownloadSUTransaction
{
  return self->_preflightDownloadSUTransaction;
}

- (void)setPreflightDownloadSUTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_preflightDownloadSUTransaction, a3);
}

- (OS_os_transaction)preflightPersonalizeTransaction
{
  return self->_preflightPersonalizeTransaction;
}

- (void)setPreflightPersonalizeTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_preflightPersonalizeTransaction, a3);
}

- (OS_os_transaction)preflightFDRRecoveryTransaction
{
  return self->_preflightFDRRecoveryTransaction;
}

- (void)setPreflightFDRRecoveryTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_preflightFDRRecoveryTransaction, a3);
}

- (OS_os_transaction)preflightWakeupTransaction
{
  return self->_preflightWakeupTransaction;
}

- (void)setPreflightWakeupTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_preflightWakeupTransaction, a3);
}

- (OS_os_transaction)preflightPrerequisiteCheckTransaction
{
  return self->_preflightPrerequisiteCheckTransaction;
}

- (void)setPreflightPrerequisiteCheckTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_preflightPrerequisiteCheckTransaction, a3);
}

- (OS_os_transaction)prepareUpdateTransaction
{
  return self->_prepareUpdateTransaction;
}

- (void)setPrepareUpdateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_prepareUpdateTransaction, a3);
}

- (OS_os_transaction)suspendUpdateTransaction
{
  return self->_suspendUpdateTransaction;
}

- (void)setSuspendUpdateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_suspendUpdateTransaction, a3);
}

- (OS_os_transaction)resumeUpdateTransaction
{
  return self->_resumeUpdateTransaction;
}

- (void)setResumeUpdateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_resumeUpdateTransaction, a3);
}

- (OS_os_transaction)applyUpdateTransaction
{
  return self->_applyUpdateTransaction;
}

- (void)setApplyUpdateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_applyUpdateTransaction, a3);
}

- (OS_os_transaction)cancelPrepareTransaction
{
  return self->_cancelPrepareTransaction;
}

- (void)setCancelPrepareTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelPrepareTransaction, a3);
}

- (OS_os_transaction)removePreparedTransaction
{
  return self->_removePreparedTransaction;
}

- (void)setRemovePreparedTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_removePreparedTransaction, a3);
}

- (OS_os_transaction)rollbackUpdateTransaction
{
  return self->_rollbackUpdateTransaction;
}

- (void)setRollbackUpdateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackUpdateTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_removePreparedTransaction, 0);
  objc_storeStrong((id *)&self->_cancelPrepareTransaction, 0);
  objc_storeStrong((id *)&self->_applyUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_resumeUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_suspendUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_prepareUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_preflightPrerequisiteCheckTransaction, 0);
  objc_storeStrong((id *)&self->_preflightWakeupTransaction, 0);
  objc_storeStrong((id *)&self->_preflightFDRRecoveryTransaction, 0);
  objc_storeStrong((id *)&self->_preflightPersonalizeTransaction, 0);
  objc_storeStrong((id *)&self->_preflightDownloadSUTransaction, 0);
  objc_storeStrong((id *)&self->_loadBrainTransaction, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_brainLoader, 0);
  objc_storeStrong((id *)&self->_applyProgressActionText, 0);
  objc_storeStrong((id *)&self->_updateDescriptor, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_destroyWeak(&self->_msuDelegate);
  objc_storeStrong((id *)&self->_descriptionName, 0);
  objc_storeStrong((id *)&self->_msuOperationQueue, 0);
  objc_storeStrong((id *)&self->_msuControlQueue, 0);
}

- (void)_newMSUOptionsUsingPolicy:(void *)a1 descriptor:(NSObject *)a2 baseOptions:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "updateBrainLocationOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1DDFDD000, a2, OS_LOG_TYPE_ERROR, "[NEW_MSU_OPTIONS] WARNING WARNING WARNING: Setting update brain location override: %{public}@", (uint8_t *)&v4, 0xCu);

}

void __37__SUCoreMSU__operationPrepareUpdate___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, a2, a3, "%{public}@ MSU prepare completed with error (not updating msuHandle): %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

void __36__SUCoreMSU__operationResumeUpdate___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ MSU resume failed to complete with error (not updating msuHandle): %@");
  OUTLINED_FUNCTION_2_0();
}

void __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ MSU rollback completed with error (not updating msuHandle): %@");
  OUTLINED_FUNCTION_2_0();
}

void __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_726_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ MSU suspend rollback completed with error (not updating msuHandle): %@");
  OUTLINED_FUNCTION_2_0();
}

void __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_732_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ MSU resume rollback completed with error (not updating msuHandle): %@");
  OUTLINED_FUNCTION_2_0();
}

void __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_740_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ MSU apply rollback completed with error: %@");
  OUTLINED_FUNCTION_2_0();
}

@end
