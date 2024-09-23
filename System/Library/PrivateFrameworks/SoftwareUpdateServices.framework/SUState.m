@implementation SUState

+ (id)statePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;

  +[SUUtility systemContainerURL](SUUtility, "systemContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      SULogInfo(CFSTR("Failed to create state file path"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v14);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SUState)init
{
  return (SUState *)-[SUState initForTesting:](self, "initForTesting:", 0);
}

- (id)initForTesting:(BOOL)a3
{
  SUState *v4;
  SUState *v5;
  SUDownload *lastDownload;
  SUScanOptions *lastScannedDescriptorScanOptions;
  NSArray *failedPatchDescriptors;
  NSDate *scheduledManualDownloadWifiPeriodEndTime;
  NSDate *scheduledAutodownloadPolicyChangeTime;
  NSDate *lastScanDate;
  NSDate *lastAutoDownloadDate;
  NSDate *scheduledAutodownloadWifiPeriodEndTime;
  NSString *lastProductVersion;
  NSString *lastProductBuild;
  NSString *lastProductType;
  NSString *lastReleaseType;
  NSDictionary *unlockCallbacks;
  _SUAutoInstallOperationModel *lastAutoInstallOperationModel;
  SUManagedDeviceUpdateDelay *mdmDelay;
  SUInstallPolicy *installPolicy;
  NSDictionary *mandatoryUpdateDict;
  NSMutableArray *rolledBackBuildVersions;
  NSString *lastRollbackRecommendedBuildVersion;
  NSString *sessionID;
  NSString *lastDeletedSUAssetID;
  NSString *lastAssetAudience;
  NSDate *appliedTime;
  NSDictionary *updateDiscoveryDates;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *stateQueue;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  SUCorePersistedState *persistedState;
  SUCoreDescriptor *preferredLastScannedCoreDescriptor;
  SUCoreDescriptor *alternateLastScannedCoreDescriptor;
  NSDictionary *ddmPersistedError;
  NSString *lastSplatRestoreVersion;
  SURollbackDescriptor *lastRollbackDescriptor;
  NSString *lastRecommendedUpdateVersion;
  NSString *v49;
  NSDate *lastRecommendedUpdateDiscoveryDate;
  NSDate *lastSentOTAPostponedDate;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)SUState;
  v4 = -[SUState init](&v53, sel_init);
  v5 = v4;
  if (v4)
  {
    lastDownload = v4->_lastDownload;
    v4->_lastDownload = 0;

    lastScannedDescriptorScanOptions = v5->_lastScannedDescriptorScanOptions;
    v5->_lastScannedDescriptorScanOptions = 0;

    failedPatchDescriptors = v5->_failedPatchDescriptors;
    v5->_failedPatchDescriptors = 0;

    scheduledManualDownloadWifiPeriodEndTime = v5->_scheduledManualDownloadWifiPeriodEndTime;
    v5->_scheduledManualDownloadWifiPeriodEndTime = 0;

    scheduledAutodownloadPolicyChangeTime = v5->_scheduledAutodownloadPolicyChangeTime;
    v5->_scheduledAutodownloadPolicyChangeTime = 0;

    lastScanDate = v5->_lastScanDate;
    v5->_lastScanDate = 0;

    lastAutoDownloadDate = v5->_lastAutoDownloadDate;
    v5->_lastAutoDownloadDate = 0;

    scheduledAutodownloadWifiPeriodEndTime = v5->_scheduledAutodownloadWifiPeriodEndTime;
    v5->_scheduledAutodownloadWifiPeriodEndTime = 0;

    *(_WORD *)&v5->_autodownloadNeedsOneTimeRetry = 0;
    lastProductVersion = v5->_lastProductVersion;
    v5->_lastProductVersion = 0;

    lastProductBuild = v5->_lastProductBuild;
    v5->_lastProductBuild = 0;

    lastProductType = v5->_lastProductType;
    v5->_lastProductType = 0;

    lastReleaseType = v5->_lastReleaseType;
    v5->_lastReleaseType = 0;

    unlockCallbacks = v5->_unlockCallbacks;
    v5->_unlockCallbacks = 0;

    lastAutoInstallOperationModel = v5->_lastAutoInstallOperationModel;
    v5->_lastAutoInstallOperationModel = 0;

    mdmDelay = v5->_mdmDelay;
    v5->_mdmDelay = 0;

    installPolicy = v5->_installPolicy;
    v5->_installPolicy = 0;

    mandatoryUpdateDict = v5->_mandatoryUpdateDict;
    v5->_mandatoryUpdateDict = 0;

    rolledBackBuildVersions = v5->_rolledBackBuildVersions;
    v5->_rolledBackBuildVersions = 0;

    lastRollbackRecommendedBuildVersion = v5->_lastRollbackRecommendedBuildVersion;
    v5->_lastRollbackRecommendedBuildVersion = 0;

    sessionID = v5->_sessionID;
    v5->_sessionID = 0;

    lastDeletedSUAssetID = v5->_lastDeletedSUAssetID;
    v5->_lastDeletedSUAssetID = 0;

    lastAssetAudience = v5->_lastAssetAudience;
    v5->_lastAssetAudience = 0;

    appliedTime = v5->_appliedTime;
    v5->_appliedTime = 0;

    updateDiscoveryDates = v5->_updateDiscoveryDates;
    v5->_updateDiscoveryDates = 0;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("com.apple.softwareupdateservicesd.stateQueue", v30);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v31;

    v5->_testing = a3;
    if (a3)
    {
      v40 = CFSTR("/tmp/softwareupdateservicesd.plist");
    }
    else
    {
      +[SUState statePath](SUState, "statePath");
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    SULogInfo(CFSTR("[SUState] (%s) testing: %@, path: %@"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUState initForTesting:]");
    v41 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA80]), "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v5->_stateQueue, v40, CFSTR("1.0"));
    persistedState = v5->_persistedState;
    v5->_persistedState = (SUCorePersistedState *)v41;

    preferredLastScannedCoreDescriptor = v5->_preferredLastScannedCoreDescriptor;
    v5->_preferredLastScannedCoreDescriptor = 0;

    alternateLastScannedCoreDescriptor = v5->_alternateLastScannedCoreDescriptor;
    v5->_alternateLastScannedCoreDescriptor = 0;

    ddmPersistedError = v5->_ddmPersistedError;
    v5->_ddmPersistedError = 0;

    v5->_underExclusiveControl = 0;
    lastSplatRestoreVersion = v5->_lastSplatRestoreVersion;
    v5->_lastSplatRestoreVersion = 0;

    lastRollbackDescriptor = v5->_lastRollbackDescriptor;
    v5->_lastRollbackDescriptor = 0;

    lastRecommendedUpdateVersion = v5->_lastRecommendedUpdateVersion;
    v5->_lastRecommendedUpdateVersion = 0;

    v49 = v5->_lastRecommendedUpdateVersion;
    v5->_lastRecommendedUpdateVersion = 0;

    lastRecommendedUpdateDiscoveryDate = v5->_lastRecommendedUpdateDiscoveryDate;
    v5->_lastRecommendedUpdateDiscoveryDate = 0;

    lastSentOTAPostponedDate = v5->_lastSentOTAPostponedDate;
    v5->_lastSentOTAPostponedDate = 0;

    -[SUState load](v5, "load");
  }
  return v5;
}

+ (id)currentState
{
  if (currentState_pred != -1)
    dispatch_once(&currentState_pred, &__block_literal_global_9);
  return (id)currentState___instance;
}

void __23__SUState_currentState__block_invoke()
{
  SUState *v0;
  void *v1;

  v0 = objc_alloc_init(SUState);
  v1 = (void *)currentState___instance;
  currentState___instance = (uint64_t)v0;

}

- (void)resetDownloadAndScanHistory
{
  -[SUState setFailedPatchDescriptors:](self, "setFailedPatchDescriptors:", 0);
  -[SUState setScheduledManualDownloadWifiPeriodEndTime:](self, "setScheduledManualDownloadWifiPeriodEndTime:", 0);
  -[SUState setScheduledAutodownloadWifiPeriodEndTime:](self, "setScheduledAutodownloadWifiPeriodEndTime:", 0);
  -[SUState setScheduledAutodownloadPolicyChangeTime:](self, "setScheduledAutodownloadPolicyChangeTime:", 0);
  -[SUState setLastScanDate:](self, "setLastScanDate:", 0);
  -[SUState setLastAutoDownloadDate:](self, "setLastAutoDownloadDate:", 0);
  -[SUState setAutodownloadNeedsOneTimeRetry:](self, "setAutodownloadNeedsOneTimeRetry:", 0);
  -[SUState setStashbagPersisted:](self, "setStashbagPersisted:", 0);
  -[SUState setLastDownload:](self, "setLastDownload:", 0);
  -[SUState setLastAutoInstallOperationModel:](self, "setLastAutoInstallOperationModel:", 0);
  -[SUState setUnlockCallbacks:](self, "setUnlockCallbacks:", 0);
  -[SUState setMdmDelay:](self, "setMdmDelay:", 0);
  -[SUState setInstallPolicy:](self, "setInstallPolicy:", 0);
  -[SUState setMandatoryUpdateDict:](self, "setMandatoryUpdateDict:", 0);
  -[SUState setLastDeletedSUAssetID:](self, "setLastDeletedSUAssetID:", 0);
  -[SUState setLastAssetAudience:](self, "setLastAssetAudience:", 0);
  -[SUState setUpdateDiscoveryDates:](self, "setUpdateDiscoveryDates:", 0);
  -[SUState setUpdateFullyUnrampedDates:](self, "setUpdateFullyUnrampedDates:", 0);
  -[SUState setLastRecommendedUpdateVersion:](self, "setLastRecommendedUpdateVersion:", 0);
  -[SUState setLastRecommendedUpdateInterval:](self, "setLastRecommendedUpdateInterval:", 0);
  -[SUState setLastRecommendedUpdateDiscoveryDate:](self, "setLastRecommendedUpdateDiscoveryDate:", 0);
  -[SUState setLastSentOTAPostponedDate:](self, "setLastSentOTAPostponedDate:", 0);
  -[SUState setDdmPersistedError:](self, "setDdmPersistedError:", 0);
  -[SUState setPreferredLastScannedCoreDescriptor:](self, "setPreferredLastScannedCoreDescriptor:", 0);
  -[SUState setAlternateLastScannedCoreDescriptor:](self, "setAlternateLastScannedCoreDescriptor:", 0);
}

- (void)resetAllHistory
{
  -[SUState resetDownloadAndScanHistory](self, "resetDownloadAndScanHistory");
  -[SUState setLastProductVersion:](self, "setLastProductVersion:", 0);
  -[SUState setLastProductBuild:](self, "setLastProductBuild:", 0);
  -[SUState setLastProductType:](self, "setLastProductType:", 0);
  -[SUState setLastReleaseType:](self, "setLastReleaseType:", 0);
  -[SUState setSessionID:](self, "setSessionID:", 0);
  -[SUState setAppliedTime:](self, "setAppliedTime:", 0);
  -[SUState setLastRollbackDescriptor:](self, "setLastRollbackDescriptor:", 0);
}

- (id)_stateAsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastDownload, CFSTR("SULastDownload"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_failedPatchDescriptors, CFSTR("SUFailedPatchDescriptorsKey"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_scheduledManualDownloadWifiPeriodEndTime, CFSTR("SUManualDownloadWifiPeriodEndTime"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_scheduledAutodownloadWifiPeriodEndTime, CFSTR("SUAutodownloadWifiPeriodEndTime"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_scheduledAutodownloadPolicyChangeTime, CFSTR("SUAutodownloadPolicyChangeTime"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastScanDate, CFSTR("SULastScanDate"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastAutoDownloadDate, CFSTR("SULastAutoDownloadDate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_autodownloadNeedsOneTimeRetry);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("SUAutodownloadNeedsOneTimeRetry"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_stashbagPersisted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("SUStashbagIsPersisted"));

  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastProductVersion, CFSTR("SULastProductVersionKey"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastProductBuild, CFSTR("SULastProductBuildKey"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastProductType, CFSTR("SULastProductTypeKey"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastReleaseType, CFSTR("SULastReleaseTypeKey"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_unlockCallbacks, CFSTR("SUUnlockCallbacksKey"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastAutoInstallOperationModel, CFSTR("SULastAutoInstallOperationModel"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_mdmDelay, CFSTR("SUManagedDeviceDelay"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_installPolicy, CFSTR("SUInstallPolicy"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_mandatoryUpdateDict, CFSTR("SUMandatorUpdateDict"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastRollbackRecommendedBuildVersion, CFSTR("LastRollbackRecommendationBuildVersion"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_rolledBackBuildVersions, CFSTR("SURolledBackBuildVersions"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_sessionID, CFSTR("SUSessionID"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastDeletedSUAssetID, CFSTR("SULastDeletedSUAssetID"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastAssetAudience, CFSTR("SULastAssetAudience"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_appliedTime, CFSTR("SUAppliedTime"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_updateDiscoveryDates, CFSTR("SUDiscoveryDates"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_updateFullyUnrampedDates, CFSTR("SUFullyUnrampedDates"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_ddmPersistedError, CFSTR("SUDDMPersistedError"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_preferredLastScannedCoreDescriptor, CFSTR("SUPreferredLastScannedCoreDescriptor"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_alternateLastScannedCoreDescriptor, CFSTR("SUAlternateLastScannedCoreDescriptor"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_underExclusiveControl);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("SUUnderExclusiveControl"));

  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastSplatRestoreVersion, CFSTR("SULastSplatRestoreVersion"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastRollbackDescriptor, CFSTR("SULastRollbackDescriptor"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastRecommendedUpdateVersion, CFSTR("LastRecommendedUpdateVersion"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastRecommendedUpdateInterval, CFSTR("LastRecommendedUpdateInterval"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastRecommendedUpdateDiscoveryDate, CFSTR("LastRecommendedUpdateDiscoveryDate"));
  objc_msgSend(v3, "setSafeObject:forKey:", self->_lastSentOTAPostponedDate, CFSTR("LastSentOTAPostponedDate"));
  return v3;
}

- (void)load
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __15__SUState_load__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __15__SUState_load__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  void *v18;
  id *v19;
  void *v20;
  id *v21;
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  void *v26;
  id *v27;
  void *v28;
  id *v29;
  void *v30;
  id *v31;
  void *v32;
  id *v33;
  void *v34;
  id *v35;
  void *v36;
  id *v37;
  void *v38;
  id *v39;
  void *v40;
  id *v41;
  void *v42;
  id *v43;
  void *v44;
  id *v45;
  void *v46;
  id *v47;
  void *v48;
  id *v49;
  void *v50;
  id *v51;
  void *v52;
  id *v53;
  void *v54;
  id *v55;
  void *v56;
  id *v57;
  void *v58;
  id *v59;
  void *v60;
  id *v61;
  void *v62;
  id *v63;
  void *v64;
  id *v65;
  void *v66;
  id *v67;
  void *v68;
  id *v69;
  void *v70;
  id *v71;
  void *v72;
  id *v73;
  uint64_t v74;
  id v75;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "loadPersistedState");
  v2 = (void *)MEMORY[0x24BEAEA28];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistedPolicyVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "stringIsEqual:to:", v3, CFSTR("1.0"));

  if ((v2 & 1) == 0)
  {
    SULogInfo(CFSTR("Persisted state policy version does not match current policy, removing persisted state."), v4, v5, v6, v7, v8, v9, v10, v74);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "removePersistedState");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "loadPersistedState");
  }
  v11 = *(id **)(a1 + 32);
  objc_msgSend(v11[39], "secureCodedObjectForKey:ofClass:", CFSTR("SULastDownload"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLastDownload:", v12);

  v13 = *(id **)(a1 + 32);
  objc_msgSend(v13[39], "dateForKey:", CFSTR("SUManualDownloadWifiPeriodEndTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScheduledManualDownloadWifiPeriodEndTime:", v14);

  v15 = *(id **)(a1 + 32);
  objc_msgSend(v15[39], "dateForKey:", CFSTR("SUAutodownloadWifiPeriodEndTime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScheduledAutodownloadWifiPeriodEndTime:", v16);

  v17 = *(id **)(a1 + 32);
  objc_msgSend(v17[39], "dateForKey:", CFSTR("SUAutodownloadPolicyChangeTime"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScheduledAutodownloadPolicyChangeTime:", v18);

  v19 = *(id **)(a1 + 32);
  objc_msgSend(v19[39], "dateForKey:", CFSTR("SULastScanDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLastScanDate:", v20);

  v21 = *(id **)(a1 + 32);
  objc_msgSend(v21[39], "dateForKey:", CFSTR("SULastAutoDownloadDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLastAutoDownloadDate:", v22);

  objc_msgSend(*(id *)(a1 + 32), "setAutodownloadNeedsOneTimeRetry:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "BOOLeanForKey:", CFSTR("SUAutodownloadNeedsOneTimeRetry")));
  objc_msgSend(*(id *)(a1 + 32), "setStashbagPersisted:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "BOOLeanForKey:", CFSTR("SUStashbagIsPersisted")));
  v23 = *(id **)(a1 + 32);
  objc_msgSend(v23[39], "stringForKey:", CFSTR("SULastProductVersionKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLastProductVersion:", v24);

  v25 = *(id **)(a1 + 32);
  objc_msgSend(v25[39], "stringForKey:", CFSTR("SULastProductBuildKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLastProductBuild:", v26);

  v27 = *(id **)(a1 + 32);
  objc_msgSend(v27[39], "stringForKey:", CFSTR("SULastProductTypeKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLastProductType:", v28);

  v29 = *(id **)(a1 + 32);
  objc_msgSend(v29[39], "stringForKey:", CFSTR("SULastReleaseTypeKey"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLastReleaseType:", v30);

  v31 = *(id **)(a1 + 32);
  objc_msgSend(v31[39], "dictionaryForKey:", CFSTR("SUUnlockCallbacksKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUnlockCallbacks:", v32);

  v33 = *(id **)(a1 + 32);
  objc_msgSend(v33[39], "secureCodedObjectForKey:ofClass:", CFSTR("SULastAutoInstallOperationModel"), objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLastAutoInstallOperationModel:", v34);

  v35 = *(id **)(a1 + 32);
  objc_msgSend(v35[39], "secureCodedObjectForKey:ofClass:", CFSTR("SUManagedDeviceDelay"), objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setMdmDelay:", v36);

  v37 = *(id **)(a1 + 32);
  objc_msgSend(v37[39], "secureCodedObjectForKey:ofClass:", CFSTR("SUInstallPolicy"), objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setInstallPolicy:", v38);

  v39 = *(id **)(a1 + 32);
  objc_msgSend(v39[39], "dictionaryForKey:", CFSTR("SUMandatorUpdateDict"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMandatoryUpdateDict:", v40);

  v41 = *(id **)(a1 + 32);
  objc_msgSend(v41[39], "stringForKey:", CFSTR("LastRollbackRecommendationBuildVersion"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLastRollbackRecommendedBuildVersion:", v42);

  objc_msgSend(*(id *)(a1 + 32), "loadRolledBackBuildVersions");
  v43 = *(id **)(a1 + 32);
  objc_msgSend(v43[39], "stringForKey:", CFSTR("SUSessionID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSessionID:", v44);

  v45 = *(id **)(a1 + 32);
  objc_msgSend(v45[39], "stringForKey:", CFSTR("SULastDeletedSUAssetID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setLastDeletedSUAssetID:", v46);

  v47 = *(id **)(a1 + 32);
  objc_msgSend(v47[39], "stringForKey:", CFSTR("SULastAssetAudience"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setLastAssetAudience:", v48);

  v49 = *(id **)(a1 + 32);
  objc_msgSend(v49[39], "dateForKey:", CFSTR("SUAppliedTime"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAppliedTime:", v50);

  objc_msgSend(*(id *)(a1 + 32), "loadPersistedFailedPatchDescriptors");
  v51 = *(id **)(a1 + 32);
  objc_msgSend(v51[39], "dictionaryForKey:", CFSTR("SUDiscoveryDates"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setUpdateDiscoveryDates:", v52);

  v53 = *(id **)(a1 + 32);
  objc_msgSend(v53[39], "dictionaryForKey:", CFSTR("SUFullyUnrampedDates"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setUpdateFullyUnrampedDates:", v54);

  v55 = *(id **)(a1 + 32);
  objc_msgSend(v55[39], "dictionaryForKey:", CFSTR("SUDDMPersistedError"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDdmPersistedError:", v56);

  v57 = *(id **)(a1 + 32);
  objc_msgSend(v57[39], "secureCodedObjectForKey:ofClass:", CFSTR("SUPreferredLastScannedCoreDescriptor"), objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setPreferredLastScannedCoreDescriptor:", v58);

  v59 = *(id **)(a1 + 32);
  objc_msgSend(v59[39], "secureCodedObjectForKey:ofClass:", CFSTR("SUAlternateLastScannedCoreDescriptor"), objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setAlternateLastScannedCoreDescriptor:", v60);

  v61 = *(id **)(a1 + 32);
  objc_msgSend(v61[39], "secureCodedObjectForKey:ofClass:", CFSTR("SULastScannedDescriptorScanOptionsKey"), objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setLastScannedDescriptorScanOptions:", v62);

  objc_msgSend(*(id *)(a1 + 32), "setUnderExclusiveControl:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "BOOLeanForKey:", CFSTR("SUUnderExclusiveControl")));
  v63 = *(id **)(a1 + 32);
  objc_msgSend(v63[39], "stringForKey:", CFSTR("SULastSplatRestoreVersion"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setLastSplatRestoreVersion:", v64);

  v65 = *(id **)(a1 + 32);
  objc_msgSend(v65[39], "secureCodedObjectForKey:ofClass:", CFSTR("SULastRollbackDescriptor"), objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setLastRollbackDescriptor:", v66);

  v67 = *(id **)(a1 + 32);
  objc_msgSend(v67[39], "stringForKey:", CFSTR("LastRecommendedUpdateVersion"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setLastRecommendedUpdateVersion:", v68);

  v69 = *(id **)(a1 + 32);
  objc_msgSend(v69[39], "secureCodedObjectForKey:ofClass:", CFSTR("LastRecommendedUpdateInterval"), objc_opt_class());
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setLastRecommendedUpdateInterval:", v70);

  v71 = *(id **)(a1 + 32);
  objc_msgSend(v71[39], "dateForKey:", CFSTR("LastRecommendedUpdateDiscoveryDate"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setLastRecommendedUpdateDiscoveryDate:", v72);

  v73 = *(id **)(a1 + 32);
  objc_msgSend(v73[39], "dateForKey:", CFSTR("LastSentOTAPostponedDate"));
  v75 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setLastSentOTAPostponedDate:", v75);

}

- (void)save
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __15__SUState_save__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __15__SUState_save__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;

  if (+[SUUtility isDaemon](SUUtility, "isDaemon"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 304))
    {
      v9 = CFSTR("/tmp/softwareupdateservicesd.plist");
    }
    else
    {
      +[SUState statePath](SUState, "statePath");
      v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    v32 = (__CFString *)v9;
    SULogInfo(CFSTR("[SUState] (%s) testing: %@, path: %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUState save]_block_invoke");
    if (v32)
    {
      -[__CFString stringByDeletingLastPathComponent](v32, "stringByDeletingLastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);
      v20 = (uint64_t *)MEMORY[0x24BDD0CC8];
      if ((v19 & 1) == 0)
      {
        v31 = *MEMORY[0x24BDD0CC8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", &unk_24CE6E058);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, v21, 0);

      }
      v22 = objc_msgSend(v18, "fileExistsAtPath:", v32);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("SULastDownload"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), CFSTR("SUPreferredLastScannedCoreDescriptor"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), CFSTR("SUAlternateLastScannedCoreDescriptor"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SULastScannedDescriptorScanOptionsKey"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("SUManualDownloadWifiPeriodEndTime"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("SUAutodownloadWifiPeriodEndTime"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), CFSTR("SUAutodownloadPolicyChangeTime"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), CFSTR("SULastScanDate"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("SULastAutoDownloadDate"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistBoolean:forKey:shouldPersist:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("SUAutodownloadNeedsOneTimeRetry"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistBoolean:forKey:shouldPersist:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 73), CFSTR("SUStashbagIsPersisted"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), CFSTR("SULastProductVersionKey"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), CFSTR("SULastProductBuildKey"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), CFSTR("SULastProductTypeKey"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), CFSTR("SULastReleaseTypeKey"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDictionary:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), CFSTR("SUUnlockCallbacksKey"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), CFSTR("SULastAutoInstallOperationModel"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), CFSTR("SUManagedDeviceDelay"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), CFSTR("SUInstallPolicy"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDictionary:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), CFSTR("SUMandatorUpdateDict"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), CFSTR("LastRollbackRecommendationBuildVersion"), 0);
      objc_msgSend(*(id *)(a1 + 32), "persistRolledBackBuildVersions");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), CFSTR("SUSessionID"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), CFSTR("SULastDeletedSUAssetID"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), CFSTR("SULastAssetAudience"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), CFSTR("SUAppliedTime"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistBoolean:forKey:shouldPersist:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 320), CFSTR("SUUnderExclusiveControl"), 0);
      objc_msgSend(*(id *)(a1 + 32), "persistFailedPatchDescriptors");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDictionary:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), CFSTR("SUDiscoveryDates"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDictionary:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), CFSTR("SUFullyUnrampedDates"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), CFSTR("SULastSplatRestoreVersion"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232), CFSTR("SULastRollbackDescriptor"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistString:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), CFSTR("LastRecommendedUpdateVersion"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), CFSTR("LastRecommendedUpdateInterval"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288), CFSTR("LastRecommendedUpdateDiscoveryDate"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDictionary:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), CFSTR("SUDDMPersistedError"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistDate:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296), CFSTR("LastSentOTAPostponedDate"), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "persistState");
      if ((v22 & 1) == 0)
      {
        v31 = *v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", &unk_24CE6E058);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAttributes:ofItemAtPath:error:", v30, v32, 0);

      }
      SULogDebug(CFSTR("Saved software update state"), v23, v24, v25, v26, v27, v28, v29, v31);

    }
    else
    {
      SULogInfo(CFSTR("Unable to retrieve state file path"), v10, v11, v12, v13, v14, v15, v16, v31);
    }

  }
}

- (void)persistFailedPatchDescriptors
{
  void *v3;
  NSArray *failedPatchDescriptors;
  unint64_t v5;
  SUCorePersistedState *persistedState;
  void *v7;
  void *v8;
  unint64_t v9;
  SUCorePersistedState *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("SUFailedPatchDescriptorOneKey");
  v12[1] = CFSTR("SUFailedPatchDescriptorTwoKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  failedPatchDescriptors = self->_failedPatchDescriptors;
  if (failedPatchDescriptors)
  {
    if (-[NSArray count](failedPatchDescriptors, "count"))
    {
      v5 = 0;
      do
      {
        if (objc_msgSend(v3, "count") <= v5)
          break;
        persistedState = self->_persistedState;
        -[NSArray objectAtIndexedSubscript:](self->_failedPatchDescriptors, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePersistedState persistSecureCodedObject:forKey:shouldPersist:](persistedState, "persistSecureCodedObject:forKey:shouldPersist:", v7, v8, 0);

        ++v5;
      }
      while (-[NSArray count](self->_failedPatchDescriptors, "count") > v5);
    }
  }
  else if (objc_msgSend(v3, "count"))
  {
    v9 = 0;
    do
    {
      v10 = self->_persistedState;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePersistedState persistSecureCodedObject:forKey:shouldPersist:](v10, "persistSecureCodedObject:forKey:shouldPersist:", 0, v11, 0);

      ++v9;
    }
    while (objc_msgSend(v3, "count") > v9);
  }

}

- (void)loadPersistedFailedPatchDescriptors
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v21[0] = CFSTR("SUFailedPatchDescriptorOneKey");
  v21[1] = CFSTR("SUFailedPatchDescriptorTwoKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        -[SUCorePersistedState secureCodedObjectForKey:ofClass:](self->_persistedState, "secureCodedObjectForKey:ofClass:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7), objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUState _queue_addFailedPatchDescriptor:](self, "_queue_addFailedPatchDescriptor:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  SULogInfo(CFSTR("Loaded failed patch descriptors: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)self->_failedPatchDescriptors);
}

- (void)persistRolledBackBuildVersions
{
  void *v3;
  unint64_t v4;
  SUCorePersistedState *persistedState;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("RolledBackBuildVersionsOne");
  v8[1] = CFSTR("RolledBackBuildVersionsTwo");
  v8[2] = CFSTR("RolledBackBuildVersionsThree");
  v8[3] = CFSTR("RolledBackBuildVersionsFour");
  v8[4] = CFSTR("RolledBackBuildVersionsFive");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_rolledBackBuildVersions, "count"))
  {
    v4 = 0;
    do
    {
      if (objc_msgSend(v3, "count") <= v4)
        break;
      persistedState = self->_persistedState;
      -[NSMutableArray objectAtIndexedSubscript:](self->_rolledBackBuildVersions, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePersistedState persistString:forKey:shouldPersist:](persistedState, "persistString:forKey:shouldPersist:", v6, v7, 0);

      ++v4;
    }
    while (-[NSMutableArray count](self->_rolledBackBuildVersions, "count") > v4);
  }

}

- (void)loadRolledBackBuildVersions
{
  NSMutableArray *v3;
  NSMutableArray *rolledBackBuildVersions;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  if (!self->_rolledBackBuildVersions)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    rolledBackBuildVersions = self->_rolledBackBuildVersions;
    self->_rolledBackBuildVersions = v3;

  }
  v23[0] = CFSTR("RolledBackBuildVersionsOne");
  v23[1] = CFSTR("RolledBackBuildVersionsTwo");
  v23[2] = CFSTR("RolledBackBuildVersionsThree");
  v23[3] = CFSTR("RolledBackBuildVersionsFour");
  v23[4] = CFSTR("RolledBackBuildVersionsFive");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        -[SUCorePersistedState stringForKey:](self->_persistedState, "stringForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUState queue_addRolledBackBuildVersion:](self, "queue_addRolledBackBuildVersion:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  SULogInfo(CFSTR("Loaded rolled back build versions: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)self->_rolledBackBuildVersions);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUState preferredLastScannedCoreDescriptor](self, "preferredLastScannedCoreDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[SUState alternateLastScannedCoreDescriptor](self, "alternateLastScannedCoreDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BDD17C8];
  -[SUState lastDownload](self, "lastDownload");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState failedPatchDescriptors](self, "failedPatchDescriptors");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1500];
  -[SUState scheduledManualDownloadWifiPeriodEndTime](self, "scheduledManualDownloadWifiPeriodEndTime");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringFromDate:dateStyle:timeStyle:", v39, 1, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1500];
  -[SUState scheduledAutodownloadWifiPeriodEndTime](self, "scheduledAutodownloadWifiPeriodEndTime");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromDate:dateStyle:timeStyle:", v38, 1, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1500];
  -[SUState scheduledAutodownloadPolicyChangeTime](self, "scheduledAutodownloadPolicyChangeTime");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v37, 1, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1500];
  -[SUState lastScanDate](self, "lastScanDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v36, 1, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1500];
  -[SUState lastAutoDownloadDate](self, "lastAutoDownloadDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringFromDate:dateStyle:timeStyle:", v35, 1, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUState autodownloadNeedsOneTimeRetry](self, "autodownloadNeedsOneTimeRetry"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v32 = v12;
  if (-[SUState stashbagPersisted](self, "stashbagPersisted"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v31 = v13;
  -[SUState lastProductVersion](self, "lastProductVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastProductBuild](self, "lastProductBuild");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastProductType](self, "lastProductType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastReleaseType](self, "lastReleaseType");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastSplatRestoreVersion](self, "lastSplatRestoreVersion");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastAutoInstallOperationModel](self, "lastAutoInstallOperationModel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState mdmDelay](self, "mdmDelay");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState installPolicy](self, "installPolicy");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState mandatoryUpdateDict](self, "mandatoryUpdateDict");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastRollbackRecommendedBuildVersion](self, "lastRollbackRecommendedBuildVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState rolledBackBuildVersions](self, "rolledBackBuildVersions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState sessionID](self, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastDeletedSUAssetID](self, "lastDeletedSUAssetID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastAssetAudience](self, "lastAssetAudience");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1500];
  -[SUState appliedTime](self, "appliedTime");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringFromDate:dateStyle:timeStyle:", v28, 1, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUState underExclusiveControl](self, "underExclusiveControl"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  -[SUState lastRecommendedUpdateVersion](self, "lastRecommendedUpdateVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastRecommendedUpdateInterval](self, "lastRecommendedUpdateInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastRecommendedUpdateDiscoveryDate](self, "lastRecommendedUpdateDiscoveryDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState updateDiscoveryDates](self, "updateDiscoveryDates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("LastDownload: %@            \npreferredLastScannedCoreDescriptor: %@            \nalternateLastScannedCoreDescriptor: %@            \nFailedPatchDescriptors: %@            \nScheduledManualDownloadWifiPeriodEndTime: %@            \nScheduledAutoDownloadWifiPeriodEndTime: %@            \nScheduledAutoDownloadPolicyChangeTime: %@            \nLastScanDate: %@            \nLastAutoDownloadDate: %@            \nNeedsOneTimeAutodownloadRetry: %@            \nStashbagIsPersisted: %@            \nLastProductVersion: %@            \nLastProductBuild: %@            \nLastProductType: %@            \nLastReleaseType: %@            \nLastSplatRestoreVersion: %@            \nLastAutoInstallOperationModel: %@            \nManagedDeviceDelay: %@            \nInstallPolicy: %@            \nMandatoryUpdateDict: %@            \nLastRollbackRecommendedBuildVersion: %@            \rolledBackBuildVersions: %@            \nsessionID: %@            \nlastDeletedAssetID: %@            \nlastAssetAudience: %@            \nappliedSate: %@            \nunderExclusiveControl: %@            \nLastRecommendedUpdateVersion: %@            \nLastRecommendedUpdateInterval: %@            \nLastRecommendedUpdateDiscoveryDate: %@            \nUpdateDiscoveryDates: %@"), v51, v53, v54, v52, v50, v48, v49, v47, v46, v32, v31, v45, v44, v43, v42, v41,
    v30,
    v40,
    v29,
    v27,
    v26,
    v14,
    v15,
    v25,
    v16,
    v18,
    v19,
    v20,
    v21,
    v22,
    v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v34;
}

- (void)setLastDownload:(id)a3
{
  void *v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__SUState_setLastDownload___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __27__SUState_setLastDownload___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (SUDownload)lastDownload
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __23__SUState_lastDownload__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUDownload *)v3;
}

void __23__SUState_lastDownload__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setLastRecommendedUpdateVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SUState_setLastRecommendedUpdateVersion___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __43__SUState_setLastRecommendedUpdateVersion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), *(id *)(a1 + 40));
}

- (NSString)lastRecommendedUpdateVersion
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__SUState_lastRecommendedUpdateVersion__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __39__SUState_lastRecommendedUpdateVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

- (void)setLastRecommendedUpdateInterval:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SUState_setLastRecommendedUpdateInterval___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __44__SUState_setLastRecommendedUpdateInterval___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), *(id *)(a1 + 40));
}

- (NSNumber)lastRecommendedUpdateInterval
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUState_lastRecommendedUpdateInterval__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __40__SUState_lastRecommendedUpdateInterval__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 280));
}

- (void)setLastRecommendedUpdateDiscoveryDate:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUState_setLastRecommendedUpdateDiscoveryDate___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __49__SUState_setLastRecommendedUpdateDiscoveryDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), *(id *)(a1 + 40));
}

- (NSDate)lastRecommendedUpdateDiscoveryDate
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SUState_lastRecommendedUpdateDiscoveryDate__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __45__SUState_lastRecommendedUpdateDiscoveryDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 288));
}

- (void)setLastSentOTAPostponedDate:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUState_setLastSentOTAPostponedDate___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __39__SUState_setLastSentOTAPostponedDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
}

- (NSDate)lastSentOTAPostponedDate
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__SUState_lastSentOTAPostponedDate__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __35__SUState_lastSentOTAPostponedDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 296));
}

- (void)setPreferredLastScannedCoreDescriptor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUState_setPreferredLastScannedCoreDescriptor___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __49__SUState_setPreferredLastScannedCoreDescriptor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), *(id *)(a1 + 40));
}

- (SUCoreDescriptor)preferredLastScannedCoreDescriptor
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SUState_preferredLastScannedCoreDescriptor__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUCoreDescriptor *)v3;
}

void __45__SUState_preferredLastScannedCoreDescriptor__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 240));
}

- (void)setAlternateLastScannedCoreDescriptor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUState_setAlternateLastScannedCoreDescriptor___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __49__SUState_setAlternateLastScannedCoreDescriptor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
}

- (SUCoreDescriptor)alternateLastScannedCoreDescriptor
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SUState_alternateLastScannedCoreDescriptor__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUCoreDescriptor *)v3;
}

void __45__SUState_alternateLastScannedCoreDescriptor__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 248));
}

- (void)setUpdateDiscoveryDates:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUState_setUpdateDiscoveryDates___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __35__SUState_setUpdateDiscoveryDates___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), *(id *)(a1 + 40));
}

- (NSDictionary)updateDiscoveryDates
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SUState_updateDiscoveryDates__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __31__SUState_updateDiscoveryDates__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

- (void)setUpdateFullyUnrampedDates:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUState_setUpdateFullyUnrampedDates___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __39__SUState_setUpdateFullyUnrampedDates___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), *(id *)(a1 + 40));
}

- (NSDictionary)updateFullyUnrampedDates
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__SUState_updateFullyUnrampedDates__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __35__SUState_updateFullyUnrampedDates__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 224));
}

- (void)setLastScannedDescriptorScanOptions:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SUState_setLastScannedDescriptorScanOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __47__SUState_setLastScannedDescriptorScanOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (SUScanOptions)lastScannedDescriptorScanOptions
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SUState_lastScannedDescriptorScanOptions__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUScanOptions *)v3;
}

void __43__SUState_lastScannedDescriptorScanOptions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)addFailedPatchDescriptor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SUState_addFailedPatchDescriptor___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __36__SUState_addFailedPatchDescriptor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addFailedPatchDescriptor:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addFailedPatchDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v4 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_failedPatchDescriptors);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);
    if ((unint64_t)objc_msgSend(v5, "count") >= 3)
    {
      do
        objc_msgSend(v5, "removeObjectAtIndex:", 0);
      while ((unint64_t)objc_msgSend(v5, "count") > 2);
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUState setFailedPatchDescriptors:](self, "setFailedPatchDescriptors:", v6);

    v4 = v7;
  }

}

- (void)setFailedPatchDescriptors:(id)a3
{
  void *v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SUState_setFailedPatchDescriptors___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __37__SUState_setFailedPatchDescriptors___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (NSArray)failedPatchDescriptors
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__SUState_failedPatchDescriptors__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __33__SUState_failedPatchDescriptors__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setScheduledManualDownloadWifiPeriodEndTime:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUState_setScheduledManualDownloadWifiPeriodEndTime___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __55__SUState_setScheduledManualDownloadWifiPeriodEndTime___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (NSDate)scheduledManualDownloadWifiPeriodEndTime
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SUState_scheduledManualDownloadWifiPeriodEndTime__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __51__SUState_scheduledManualDownloadWifiPeriodEndTime__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)setScheduledAutodownloadWifiPeriodEndTime:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SUState_setScheduledAutodownloadWifiPeriodEndTime___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __53__SUState_setScheduledAutodownloadWifiPeriodEndTime___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (NSDate)scheduledAutodownloadWifiPeriodEndTime
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__SUState_scheduledAutodownloadWifiPeriodEndTime__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __49__SUState_scheduledAutodownloadWifiPeriodEndTime__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)setScheduledAutodownloadPolicyChangeTime:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SUState_setScheduledAutodownloadPolicyChangeTime___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __52__SUState_setScheduledAutodownloadPolicyChangeTime___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (NSDate)scheduledAutodownloadPolicyChangeTime
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SUState_scheduledAutodownloadPolicyChangeTime__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __48__SUState_scheduledAutodownloadPolicyChangeTime__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setLastScanDate:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__SUState_setLastScanDate___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __27__SUState_setLastScanDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (NSDate)lastScanDate
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __23__SUState_lastScanDate__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __23__SUState_lastScanDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)setLastAutoDownloadDate:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUState_setLastAutoDownloadDate___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __35__SUState_setLastAutoDownloadDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (NSDate)lastAutoDownloadDate
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SUState_lastAutoDownloadDate__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __31__SUState_lastAutoDownloadDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)setAutodownloadNeedsOneTimeRetry:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  BOOL v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUState_setAutodownloadNeedsOneTimeRetry___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __44__SUState_setAutodownloadNeedsOneTimeRetry___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)autodownloadNeedsOneTimeRetry
{
  NSObject *stateQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUState_autodownloadNeedsOneTimeRetry__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3] != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__SUState_autodownloadNeedsOneTimeRetry__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)setStashbagPersisted:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  BOOL v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__SUState_setStashbagPersisted___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __32__SUState_setStashbagPersisted___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 73) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)stashbagPersisted
{
  NSObject *stateQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__SUState_stashbagPersisted__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3] != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__SUState_stashbagPersisted__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 73);
  return result;
}

- (void)setLastProductVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUState_setLastProductVersion___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __33__SUState_setLastProductVersion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (NSString)lastProductVersion
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__SUState_lastProductVersion__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __29__SUState_lastProductVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setLastProductBuild:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__SUState_setLastProductBuild___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __31__SUState_setLastProductBuild___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (NSString)lastProductBuild
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__SUState_lastProductBuild__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __27__SUState_lastProductBuild__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)setLastProductType:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUState_setLastProductType___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __30__SUState_setLastProductType___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

- (NSString)lastProductType
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__SUState_lastProductType__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __26__SUState_lastProductType__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)setLastReleaseType:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUState_setLastReleaseType___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __30__SUState_setLastReleaseType___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

- (NSString)lastReleaseType
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__SUState_lastReleaseType__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __26__SUState_lastReleaseType__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)setUnlockCallbacks:(id)a3
{
  void *v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUState_setUnlockCallbacks___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __30__SUState_setUnlockCallbacks___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

- (NSDictionary)unlockCallbacks
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__SUState_unlockCallbacks__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __26__SUState_unlockCallbacks__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

- (void)setMandatoryUpdateDict:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SUState_setMandatoryUpdateDict___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __34__SUState_setMandatoryUpdateDict___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
}

- (NSDictionary)mandatoryUpdateDict
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__SUState_mandatoryUpdateDict__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __30__SUState_mandatoryUpdateDict__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

- (void)setLastRollbackRecommendedBuildVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SUState_setLastRollbackRecommendedBuildVersion___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __50__SUState_setLastRollbackRecommendedBuildVersion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
}

- (NSString)lastRollbackRecommendedBuildVersion
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SUState_lastRollbackRecommendedBuildVersion__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __46__SUState_lastRollbackRecommendedBuildVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 144));
}

- (void)addRolledBackBuildVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SUState_addRolledBackBuildVersion___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __37__SUState_addRolledBackBuildVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_addRolledBackBuildVersion:", *(_QWORD *)(a1 + 40));
}

- (void)queue_addRolledBackBuildVersion:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v4 = v6;
  if (v6)
  {
    v5 = -[NSMutableArray containsObject:](self->_rolledBackBuildVersions, "containsObject:", v6);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      if ((unint64_t)-[NSMutableArray count](self->_rolledBackBuildVersions, "count") >= 5)
      {
        do
          -[NSMutableArray removeObjectAtIndex:](self->_rolledBackBuildVersions, "removeObjectAtIndex:", 0);
        while ((unint64_t)-[NSMutableArray count](self->_rolledBackBuildVersions, "count") > 4);
      }
      -[NSMutableArray addObject:](self->_rolledBackBuildVersions, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (NSMutableArray)rolledBackBuildVersions
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SUState_rolledBackBuildVersions__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableArray *)v3;
}

void __34__SUState_rolledBackBuildVersions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

- (void)setLastAutoInstallOperationModel:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SUState_setLastAutoInstallOperationModel___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __44__SUState_setLastAutoInstallOperationModel___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
}

- (_SUAutoInstallOperationModel)lastAutoInstallOperationModel
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUState_lastAutoInstallOperationModel__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_SUAutoInstallOperationModel *)v3;
}

void __40__SUState_lastAutoInstallOperationModel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

- (void)setMdmDelay:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __23__SUState_setMdmDelay___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __23__SUState_setMdmDelay___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
}

- (SUManagedDeviceUpdateDelay)mdmDelay
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __19__SUState_mdmDelay__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUManagedDeviceUpdateDelay *)v3;
}

void __19__SUState_mdmDelay__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

- (void)setInstallPolicy:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__SUState_setInstallPolicy___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __28__SUState_setInstallPolicy___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
}

- (SUInstallPolicy)installPolicy
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__SUState_installPolicy__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUInstallPolicy *)v3;
}

void __24__SUState_installPolicy__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
}

- (void)setSessionID:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24__SUState_setSessionID___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __24__SUState_setSessionID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
}

- (NSString)sessionID
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __20__SUState_sessionID__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __20__SUState_sessionID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 176));
}

- (void)setLastDeletedSUAssetID:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUState_setLastDeletedSUAssetID___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __35__SUState_setLastDeletedSUAssetID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
}

- (NSString)lastDeletedSUAssetID
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SUState_lastDeletedSUAssetID__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __31__SUState_lastDeletedSUAssetID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

- (void)setLastAssetAudience:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SUState_setLastAssetAudience___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __32__SUState_setLastAssetAudience___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
}

- (NSString)lastAssetAudience
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__SUState_lastAssetAudience__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __28__SUState_lastAssetAudience__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 192));
}

- (void)setAppliedTime:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__SUState_setAppliedTime___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __26__SUState_setAppliedTime___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), *(id *)(a1 + 40));
}

- (NSDate)appliedTime
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__SUState_appliedTime__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __22__SUState_appliedTime__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 200));
}

- (void)setUnderExclusiveControl:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  BOOL v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__SUState_setUnderExclusiveControl___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __36__SUState_setUnderExclusiveControl___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 320) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)underExclusiveControl
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__SUState_underExclusiveControl__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SUState_underExclusiveControl__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 320);
  return result;
}

- (void)setLastSplatRestoreVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SUState_setLastSplatRestoreVersion___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __38__SUState_setLastSplatRestoreVersion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

- (NSString)lastSplatRestoreVersion
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SUState_lastSplatRestoreVersion__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __34__SUState_lastSplatRestoreVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)setLastRollbackDescriptor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SUState_setLastRollbackDescriptor___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __37__SUState_setLastRollbackDescriptor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(a1 + 40));
}

- (void)setDdmPersistedError:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SUState_setDdmPersistedError___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __32__SUState_setDdmPersistedError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (void)setDdmPersistedErrorDescription:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUState *v9;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SUState_setDdmPersistedErrorDescription___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __43__SUState_setDdmPersistedErrorDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEAEA28];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSafeObject:forKey:", v5, *MEMORY[0x24BEAE980]);

  objc_msgSend(v2, "setSafeObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEAE978]);
  objc_msgSend(v2, "setSafeObject:forKey:", &unk_24CE6E070, *MEMORY[0x24BEAE968]);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v2;

}

- (SURollbackDescriptor)lastRollbackDescriptor
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__SUState_lastRollbackDescriptor__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SURollbackDescriptor *)v3;
}

void __33__SUState_lastRollbackDescriptor__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 232));
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t vars0;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SUDownloadInterfaceReport")))
  {
    SULogDebug(CFSTR("Skipping SUDownloadInterfaceReport in SUState (legacy)."), v5, v6, v7, v8, v9, v10, v11, vars0);
    objc_opt_class();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return (Class)v12;
}

- (NSDictionary)ddmPersistedError
{
  return self->_ddmPersistedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_lastSentOTAPostponedDate, 0);
  objc_storeStrong((id *)&self->_lastRecommendedUpdateDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_lastRecommendedUpdateInterval, 0);
  objc_storeStrong((id *)&self->_lastRecommendedUpdateVersion, 0);
  objc_storeStrong((id *)&self->_ddmPersistedError, 0);
  objc_storeStrong((id *)&self->_ddmDeclaration, 0);
  objc_storeStrong((id *)&self->_alternateLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_lastRollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_updateFullyUnrampedDates, 0);
  objc_storeStrong((id *)&self->_updateDiscoveryDates, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_appliedTime, 0);
  objc_storeStrong((id *)&self->_lastAssetAudience, 0);
  objc_storeStrong((id *)&self->_lastDeletedSUAssetID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);
  objc_storeStrong((id *)&self->_mdmDelay, 0);
  objc_storeStrong((id *)&self->_lastAutoInstallOperationModel, 0);
  objc_storeStrong((id *)&self->_lastRollbackRecommendedBuildVersion, 0);
  objc_storeStrong((id *)&self->_rolledBackBuildVersions, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateDict, 0);
  objc_storeStrong((id *)&self->_unlockCallbacks, 0);
  objc_storeStrong((id *)&self->_lastSplatRestoreVersion, 0);
  objc_storeStrong((id *)&self->_lastReleaseType, 0);
  objc_storeStrong((id *)&self->_lastProductType, 0);
  objc_storeStrong((id *)&self->_lastProductBuild, 0);
  objc_storeStrong((id *)&self->_lastProductVersion, 0);
  objc_storeStrong((id *)&self->_lastAutoDownloadDate, 0);
  objc_storeStrong((id *)&self->_lastScanDate, 0);
  objc_storeStrong((id *)&self->_scheduledAutodownloadPolicyChangeTime, 0);
  objc_storeStrong((id *)&self->_scheduledAutodownloadWifiPeriodEndTime, 0);
  objc_storeStrong((id *)&self->_scheduledManualDownloadWifiPeriodEndTime, 0);
  objc_storeStrong((id *)&self->_lastScannedDescriptorScanOptions, 0);
  objc_storeStrong((id *)&self->_failedPatchDescriptors, 0);
  objc_storeStrong((id *)&self->_lastDownload, 0);
}

@end
