@implementation SUCoreDescriptor

- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 defaultValues:(id)a5
{
  return -[SUCoreDescriptor initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:](self, "initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:", a3, a4, 0, 0, a5);
}

- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 prepareSize:(id)a5 applySize:(id)a6 defaultValues:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  SUCoreDescriptor *v20;
  SUCoreDescriptor *v21;
  void *v22;
  int v23;
  uint64_t v24;
  NSString *assetID;
  uint64_t v26;
  NSString *softwareUpdateAssetType;
  NSString *documentationAssetType;
  uint64_t v29;
  MAAbsoluteAssetId *softwareUpdateAssetAbsoluteID;
  uint64_t v31;
  NSString *softwareUpdateAssetPurpose;
  MAAbsoluteAssetId *documentationAssetAbsoluteID;
  NSString *documentationAssetPurpose;
  uint64_t v35;
  NSString *uniqueBuildID;
  uint64_t v37;
  NSString *rawProductVersion;
  uint64_t v39;
  NSString *productVersion;
  uint64_t v41;
  NSString *productBuildVersion;
  uint64_t v43;
  NSString *productVersionExtra;
  uint64_t v45;
  NSString *productSystemName;
  uint64_t v47;
  NSString *releaseType;
  uint64_t v49;
  NSString *publisher;
  uint64_t v51;
  NSString *restoreVersion;
  uint64_t v53;
  NSString *targetUpdateBridgeVersion;
  uint64_t v55;
  NSString *targetUpdateSFRVersion;
  uint64_t v57;
  NSString *trainName;
  NSDate *releaseDate;
  id *p_releaseDate;
  id v61;
  id v62;
  void *v63;
  SUCoreDescriptor *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  uint64_t v69;
  NSString *prerequisiteBuild;
  uint64_t v71;
  NSString *prerequisiteOSVersion;
  uint64_t v73;
  NSArray *supportedDevices;
  uint64_t v75;
  NSDictionary *systemPartitionPadding;
  uint64_t v77;
  NSString *setupCritical;
  uint64_t v79;
  NSString *lastEmergencyBuild;
  uint64_t v81;
  NSString *lastEmergencyOSVersion;
  void *v83;
  void *v84;
  uint64_t v85;
  NSString *mandatoryUpdateVersionMin;
  uint64_t v87;
  NSString *mandatoryUpdateVersionMax;
  char v89;
  NSString *v90;
  NSString *v91;
  uint64_t v92;
  NSArray *oneShotBuddyDisabledBuilds;
  uint64_t v94;
  NSString *productType;
  uint64_t v96;
  NSString *minimumBridgeVersion;
  uint64_t v98;
  NSData *sepDigest;
  uint64_t v100;
  NSData *sepTBMDigests;
  uint64_t v102;
  NSData *rsepDigest;
  uint64_t v104;
  NSData *rsepTBMDigests;
  uint64_t v106;
  NSString *documentationID;
  NSString *softwareUpdateURL;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  uint64_t v115;
  NSString *v116;
  uint64_t v117;
  NSData *measurement;
  uint64_t v119;
  NSString *measurementAlgorithm;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  MAAsset *documentationAsset;
  SUCoreDocumentation *documentation;
  uint64_t v132;
  SUCoreMAIdentifier *softwareUpdateAssetIdentifier;
  SUCoreMAIdentifier *documentationAssetIdentifier;
  uint64_t v135;
  NSString *alternateAssetAudienceUUID;
  NSString *assetAudienceUUID;
  NSString *updateBrainPath;
  NSString *updateBundlePath;
  uint64_t v140;
  NSArray *semiSplatMustQuitApps;
  SUCoreDescriptor *associatedSplatDescriptor;
  char v143;
  uint64_t v144;
  void *v145;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  objc_super v151;
  uint8_t buf[4];
  void *v153;
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    objc_msgSend(v13, "SUCoreBorder_attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "count"))
      {
        v151.receiver = self;
        v151.super_class = (Class)SUCoreDescriptor;
        v20 = -[SUCoreDescriptor init](&v151, sel_init);
        v21 = v20;
        if (!v20)
        {
LABEL_51:
          self = v21;
          v64 = self;
          goto LABEL_52;
        }
        v149 = v16;
        v150 = v15;
        v20->_descriptorType = 1;
        objc_msgSend(v13, "assetType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.MobileAsset.SFRSoftwareUpdate"));

        if (v23)
          v21->_descriptorType = 3;
        v21->_descriptorAudienceType = 0;
        v21->_preferredUpdateType = 0;
        objc_msgSend(v13, "assetId");
        v24 = objc_claimAutoreleasedReturnValue();
        assetID = v21->_assetID;
        v21->_assetID = (NSString *)v24;

        objc_storeStrong((id *)&v21->_bundleAttributes, v19);
        objc_msgSend(v13, "assetType");
        v26 = objc_claimAutoreleasedReturnValue();
        softwareUpdateAssetType = v21->_softwareUpdateAssetType;
        v21->_softwareUpdateAssetType = (NSString *)v26;

        documentationAssetType = v21->_documentationAssetType;
        v21->_documentationAssetType = 0;

        objc_msgSend(v13, "absoluteAssetId");
        v29 = objc_claimAutoreleasedReturnValue();
        softwareUpdateAssetAbsoluteID = v21->_softwareUpdateAssetAbsoluteID;
        v21->_softwareUpdateAssetAbsoluteID = (MAAbsoluteAssetId *)v29;

        objc_msgSend(v13, "purpose");
        v31 = objc_claimAutoreleasedReturnValue();
        softwareUpdateAssetPurpose = v21->_softwareUpdateAssetPurpose;
        v21->_softwareUpdateAssetPurpose = (NSString *)v31;

        documentationAssetAbsoluteID = v21->_documentationAssetAbsoluteID;
        v21->_documentationAssetAbsoluteID = 0;

        documentationAssetPurpose = v21->_documentationAssetPurpose;
        v21->_documentationAssetPurpose = 0;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("UniqueBuildID"));
        v35 = objc_claimAutoreleasedReturnValue();
        uniqueBuildID = v21->_uniqueBuildID;
        v21->_uniqueBuildID = (NSString *)v35;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("OSVersion"));
        v37 = objc_claimAutoreleasedReturnValue();
        rawProductVersion = v21->_rawProductVersion;
        v21->_rawProductVersion = (NSString *)v37;

        +[SUCoreDescriptor cleanProductVersion:](SUCoreDescriptor, "cleanProductVersion:", v21->_rawProductVersion);
        v39 = objc_claimAutoreleasedReturnValue();
        productVersion = v21->_productVersion;
        v21->_productVersion = (NSString *)v39;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("Build"));
        v41 = objc_claimAutoreleasedReturnValue();
        productBuildVersion = v21->_productBuildVersion;
        v21->_productBuildVersion = (NSString *)v41;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("ProductVersionExtra"));
        v43 = objc_claimAutoreleasedReturnValue();
        productVersionExtra = v21->_productVersionExtra;
        v21->_productVersionExtra = (NSString *)v43;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("SUProductSystemName"));
        v45 = objc_claimAutoreleasedReturnValue();
        productSystemName = v21->_productSystemName;
        v21->_productSystemName = (NSString *)v45;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("ReleaseType"));
        v47 = objc_claimAutoreleasedReturnValue();
        releaseType = v21->_releaseType;
        v21->_releaseType = (NSString *)v47;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("SUPublisher"));
        v49 = objc_claimAutoreleasedReturnValue();
        publisher = v21->_publisher;
        v21->_publisher = (NSString *)v49;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("RestoreVersion"));
        v51 = objc_claimAutoreleasedReturnValue();
        restoreVersion = v21->_restoreVersion;
        v21->_restoreVersion = (NSString *)v51;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("TargetBridgeUpdateVersion"));
        v53 = objc_claimAutoreleasedReturnValue();
        targetUpdateBridgeVersion = v21->_targetUpdateBridgeVersion;
        v21->_targetUpdateBridgeVersion = (NSString *)v53;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("TargetSFRUpdateVersion"));
        v55 = objc_claimAutoreleasedReturnValue();
        targetUpdateSFRVersion = v21->_targetUpdateSFRVersion;
        v21->_targetUpdateSFRVersion = (NSString *)v55;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("TrainName"));
        v57 = objc_claimAutoreleasedReturnValue();
        trainName = v21->_trainName;
        v21->_trainName = (NSString *)v57;

        p_releaseDate = (id *)&v21->_releaseDate;
        releaseDate = v21->_releaseDate;
        v21->_releaseDate = 0;

        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v61 = v14;
            v62 = *p_releaseDate;
            *p_releaseDate = v61;
LABEL_19:

            goto LABEL_20;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v62 = objc_alloc_init(MEMORY[0x1E0CB3578]);
            objc_msgSend(v62, "setDateFormat:", CFSTR("yyyy-MM-dd"));
            v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
            objc_msgSend(v62, "setLocale:");
            objc_msgSend(v62, "dateFromString:", v14);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (v68)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_storeStrong((id *)&v21->_releaseDate, v68);
            }

            goto LABEL_19;
          }
        }
LABEL_20:
        objc_msgSend(v19, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
        v69 = objc_claimAutoreleasedReturnValue();
        prerequisiteBuild = v21->_prerequisiteBuild;
        v21->_prerequisiteBuild = (NSString *)v69;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("PrerequisiteOSVersion"));
        v71 = objc_claimAutoreleasedReturnValue();
        prerequisiteOSVersion = v21->_prerequisiteOSVersion;
        v21->_prerequisiteOSVersion = (NSString *)v71;

        objc_msgSend(v19, "safeObjectForKey:ofClass:", CFSTR("SupportedDevices"), objc_opt_class());
        v73 = objc_claimAutoreleasedReturnValue();
        supportedDevices = v21->_supportedDevices;
        v21->_supportedDevices = (NSArray *)v73;

        v21->_suDownloadSize = objc_msgSend(v19, "safeULLForKey:defaultValue:", *MEMORY[0x1E0D4DEF8], objc_msgSend(v17, "safeULLForKey:", *MEMORY[0x1E0D4DEF8]));
        v21->_unarchivedSize = objc_msgSend(v19, "safeULLForKey:defaultValue:", *MEMORY[0x1E0D4DF10], objc_msgSend(v17, "safeULLForKey:", *MEMORY[0x1E0D4DF10]));
        v21->_minimumSystemPartitionSize = objc_msgSend(v19, "safeULLForKey:defaultValue:", CFSTR("ActualMinimumSystemPartition"), objc_msgSend(v17, "safeULLForKey:", CFSTR("ActualMinimumSystemPartition"))) << 20;
        v21->_streamingZipCapable = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", *MEMORY[0x1E0D4DF00], objc_msgSend(v17, "safeBooleanForKey:", *MEMORY[0x1E0D4DF00]));
        objc_msgSend(v19, "safeDictionaryForKey:fromBase:withKeyDescription:", CFSTR("SystemPartitionPadding"), CFSTR("updateAsset attributes"), CFSTR("system partition padding"));
        v75 = objc_claimAutoreleasedReturnValue();
        systemPartitionPadding = v21->_systemPartitionPadding;
        v21->_systemPartitionPadding = (NSDictionary *)v75;

        v21->_preSUStagingRequiredSize = 0;
        v21->_preSUStagingOptionalSize = 0;
        v21->_autoDownloadAllowableOverCellular = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("AutomaticDownloadOver3G"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("AutomaticDownloadOver3G")));
        v21->_downloadAllowableOverCellular = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("AllowableOverCellular"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("AllowableOverCellular")));
        v21->_downloadable = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("AllowableOTA"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("AllowableOTA")));
        v21->_disableSiriVoiceDeletion = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("SUDisableSiriVoiceDeletion"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("SUDisableSiriVoiceDeletion")));
        v21->_disableCDLevel4 = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("SUDisableCDLevel4"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("SUDisableCDLevel4")));
        v21->_disableAppDemotion = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("SUDisableAppDemotion"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("SUDisableAppDemotion")));
        v21->_disableInstallTonight = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("SUInstallTonightEnabled"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("SUInstallTonightEnabled"))) ^ 1;
        v21->_forcePasscodeRequired = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("ForcePasscodeRequired"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("ForcePasscodeRequired")));
        v21->_rampEnabled = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("Ramp"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("Ramp")));
        v21->_granularlyRamped = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("GranularlyRamped"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("GranularlyRamped")));
        v21->_mdmDelayInterval = objc_msgSend(v19, "safeULLForKey:defaultValue:", CFSTR("MDMDelayInterval"), objc_msgSend(v17, "safeULLForKey:", CFSTR("MDMDelayInterval")));
        v21->_autoUpdateEnabled = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("AutoUpdate"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("AutoUpdate")));
        v21->_hideInstallAlert = objc_msgSend(v19, "safeTriStateForKey:defaultValue:", CFSTR("__HideInstallAlert"), objc_msgSend(v17, "safeTriStateForKey:", CFSTR("__HideInstallAlert")));
        v21->_containsSFRContent = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("ContainsSFRContent"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("ContainsSFRContent")));
        v21->_installAlertInterval = objc_msgSend(v19, "safeULLForKey:defaultValue:", CFSTR("InstallAlertInterval"), objc_msgSend(v17, "safeULLForKey:", CFSTR("InstallAlertInterval")));
        v21->_allowAutoDownloadOnBattery = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("AllowAutoDownloadOnBattery"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("AllowAutoDownloadOnBattery")));
        v21->_autoDownloadOnBatteryDelay = objc_msgSend(v19, "safeULLForKey:defaultValue:", CFSTR("AllowAutoDownloadOnBatteryDelay"), objc_msgSend(v17, "safeULLForKey:", CFSTR("AllowAutoDownloadOnBatteryDelay")));
        v21->_autoDownloadOnBatteryMinBattery = objc_msgSend(v19, "safeULLForKey:defaultValue:", CFSTR("AutoDownloadOnBatteryMinBattery"), objc_msgSend(v17, "safeULLForKey:", CFSTR("AutoDownloadOnBatteryMinBattery")));
        objc_msgSend(v19, "safeStringForKey:", CFSTR("SetupCritical"));
        v77 = objc_claimAutoreleasedReturnValue();
        setupCritical = v21->_setupCritical;
        v21->_setupCritical = (NSString *)v77;

        v21->_criticalCellularOverride = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("SetupCriticalCellularOverride"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("SetupCriticalCellularOverride")));
        v21->_criticalOutOfBoxOnly = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("SetupCriticalUpdateOutOfBoxOnly"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("SetupCriticalUpdateOutOfBoxOnly")));
        objc_msgSend(v19, "safeStringForKey:", CFSTR("LastEmergencyBuild"));
        v79 = objc_claimAutoreleasedReturnValue();
        lastEmergencyBuild = v21->_lastEmergencyBuild;
        v21->_lastEmergencyBuild = (NSString *)v79;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("LastEmergencyOSVersion"));
        v81 = objc_claimAutoreleasedReturnValue();
        lastEmergencyOSVersion = v21->_lastEmergencyOSVersion;
        v21->_lastEmergencyOSVersion = (NSString *)v81;

        objc_msgSend(v19, "safeObjectForKey:ofClass:", CFSTR("MacBuddyEligibleUpdate"), objc_opt_class());
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = v83;
        if (v83)
        {
          v84 = v83;
          v21->_mandatoryUpdateEligible = 1;
          objc_msgSend(v83, "safeStringForKey:", CFSTR("VersionMin"));
          v85 = objc_claimAutoreleasedReturnValue();
          mandatoryUpdateVersionMin = v21->_mandatoryUpdateVersionMin;
          v21->_mandatoryUpdateVersionMin = (NSString *)v85;

          objc_msgSend(v84, "safeStringForKey:", CFSTR("VersionMax"));
          v87 = objc_claimAutoreleasedReturnValue();
          mandatoryUpdateVersionMax = v21->_mandatoryUpdateVersionMax;
          v21->_mandatoryUpdateVersionMax = (NSString *)v87;

          v21->_mandatoryUpdateOptional = objc_msgSend(v84, "safeBooleanForKey:", CFSTR("Optional"));
          v89 = objc_msgSend(v84, "safeBooleanForKey:", CFSTR("RestrictedToOutOfTheBox"));
        }
        else
        {
          v21->_mandatoryUpdateEligible = 0;
          v90 = v21->_mandatoryUpdateVersionMin;
          v21->_mandatoryUpdateVersionMin = 0;

          v91 = v21->_mandatoryUpdateVersionMax;
          v21->_mandatoryUpdateVersionMax = 0;

          v89 = 0;
          v21->_mandatoryUpdateOptional = 0;
        }
        v21->_mandatoryUpdateRestrictedToOutOfTheBox = v89;
        v21->_oneShotBuddyDisabled = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("DisableOneShotBuddy"));
        objc_msgSend(v19, "safeObjectForKey:ofClass:", CFSTR("DisableOneShotBuddyBuilds"), objc_opt_class());
        v92 = objc_claimAutoreleasedReturnValue();
        oneShotBuddyDisabledBuilds = v21->_oneShotBuddyDisabledBuilds;
        v21->_oneShotBuddyDisabledBuilds = (NSArray *)v92;

        v21->_criticalUpdate = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("CriticalUpdate"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("CriticalUpdate")));
        objc_msgSend(v19, "safeStringForKey:", CFSTR("ProductType"));
        v94 = objc_claimAutoreleasedReturnValue();
        productType = v21->_productType;
        v21->_productType = (NSString *)v94;

        v21->_autoInstallDelay = objc_msgSend(v19, "safeULLForKey:defaultValue:", CFSTR("AutoInstallDelay"), objc_msgSend(v17, "safeULLForKey:", CFSTR("AutoInstallDelay")));
        v21->_notifyAfter = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("NotifyAfter"), objc_msgSend(v17, "safeBooleanForKey:", CFSTR("NotifyAfter")));
        objc_msgSend(v19, "safeStringForKey:", CFSTR("TargetUpdateBridgeVersion"));
        v96 = objc_claimAutoreleasedReturnValue();
        minimumBridgeVersion = v21->_minimumBridgeVersion;
        v21->_minimumBridgeVersion = (NSString *)v96;

        v21->_disableRosettaUpdates = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("DisableRosettaUpdates"));
        v21->_disableRecoveryOSUpdates = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("DisableRecoveryOSUpdates"));
        v21->_requireInstallAssistantUpdate = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("RequireInstallAssistantUpdate"));
        objc_msgSend(v19, "safeDataForKey:", CFSTR("SEPDigest"));
        v98 = objc_claimAutoreleasedReturnValue();
        sepDigest = v21->_sepDigest;
        v21->_sepDigest = (NSData *)v98;

        objc_msgSend(v19, "safeDataForKey:", CFSTR("SEPTBMDigests"));
        v100 = objc_claimAutoreleasedReturnValue();
        sepTBMDigests = v21->_sepTBMDigests;
        v21->_sepTBMDigests = (NSData *)v100;

        objc_msgSend(v19, "safeDataForKey:", CFSTR("RSEPDigest"));
        v102 = objc_claimAutoreleasedReturnValue();
        rsepDigest = v21->_rsepDigest;
        v21->_rsepDigest = (NSData *)v102;

        objc_msgSend(v19, "safeDataForKey:", CFSTR("RSEPTBMDigests"));
        v104 = objc_claimAutoreleasedReturnValue();
        rsepTBMDigests = v21->_rsepTBMDigests;
        v21->_rsepTBMDigests = (NSData *)v104;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("SUDocumentationID"));
        v106 = objc_claimAutoreleasedReturnValue();
        documentationID = v21->_documentationID;
        v21->_documentationID = (NSString *)v106;

        softwareUpdateURL = v21->_softwareUpdateURL;
        v21->_softwareUpdateURL = 0;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("__BaseURL"));
        v109 = objc_claimAutoreleasedReturnValue();
        if (v109)
        {
          v110 = (void *)v109;
          objc_msgSend(v19, "safeStringForKey:", CFSTR("__RelativePath"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          if (v111)
          {
            v112 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v19, "safeStringForKey:", CFSTR("__BaseURL"));
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "safeStringForKey:", CFSTR("__RelativePath"));
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v112, "initWithFormat:", CFSTR("%@%@"), v113, v114);
            v116 = v21->_softwareUpdateURL;
            v21->_softwareUpdateURL = (NSString *)v115;

          }
        }
        objc_msgSend(v19, "safeDataForKey:", CFSTR("_Measurement"));
        v117 = objc_claimAutoreleasedReturnValue();
        measurement = v21->_measurement;
        v21->_measurement = (NSData *)v117;

        objc_msgSend(v19, "safeStringForKey:", CFSTR("_MeasurementAlgorithm"));
        v119 = objc_claimAutoreleasedReturnValue();
        measurementAlgorithm = v21->_measurementAlgorithm;
        v21->_measurementAlgorithm = (NSString *)v119;

        if (v150)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "oslog");
          v122 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v150;
            _os_log_impl(&dword_1DDFDD000, v122, OS_LOG_TYPE_DEFAULT, "Override descriptor attribute msuPrepareSize with %{public}@", buf, 0xCu);
          }

          v123 = 0;
          v21->_msuPrepareSize = objc_msgSend(v150, "longLongValue");
        }
        else
        {
          SUCoreBorder_MSUAssetCalculatePrepareSize(v19);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v21->_msuPrepareSize = 0;
          if (v123)
          {
            objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "trackAnomaly:forReason:withResult:withError:", CFSTR("[DESCRIPTOR]"), CFSTR("unable to determine prepare size for installation"), 8100, v123);

          }
        }
        if (v149)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "oslog");
          v126 = objc_claimAutoreleasedReturnValue();

          v16 = v149;
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v149;
            _os_log_impl(&dword_1DDFDD000, v126, OS_LOG_TYPE_DEFAULT, "Override descriptor attribute installationSize with %{public}@", buf, 0xCu);
          }

          v21->_installationSize = objc_msgSend(v149, "longLongValue");
        }
        else
        {
          SUCoreBorder_MSUAssetCalculateApplySize(v19);
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          v21->_installationSize = 0;
          if (v127)
          {
            objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "trackAnomaly:forReason:withResult:withError:", CFSTR("[DESCRIPTOR]"), CFSTR("unable to determine apply size for installation"), 8100, v127);

          }
          v16 = 0;
        }
        v15 = v150;
        if (+[SUCoreDescriptor isEmergencyUpdate:](SUCoreDescriptor, "isEmergencyUpdate:", v19))
        {
          v129 = 3;
        }
        else if (v21->_prerequisiteBuild || v21->_prerequisiteOSVersion)
        {
          v129 = 1;
        }
        else
        {
          v129 = 2;
        }
        v21->_updateType = v129;
        objc_storeStrong((id *)&v21->_softwareUpdateAsset, a3);
        documentationAsset = v21->_documentationAsset;
        v21->_documentationAsset = 0;

        documentation = v21->_documentation;
        v21->_documentation = 0;

        v132 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8968]), "initWithProductVersion:productBuildVersion:releaseType:measurement:measurementAlgorithm:", v21->_productVersion, v21->_productBuildVersion, v21->_releaseType, v21->_measurement, v21->_measurementAlgorithm);
        softwareUpdateAssetIdentifier = v21->_softwareUpdateAssetIdentifier;
        v21->_softwareUpdateAssetIdentifier = (SUCoreMAIdentifier *)v132;

        documentationAssetIdentifier = v21->_documentationAssetIdentifier;
        v21->_documentationAssetIdentifier = 0;

        v21->_promoteAlternateUpdate = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("PromoteAlternateUpdate"));
        v21->_enableAlternateAssetAudience = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("EnableAlternateAssetAudience"));
        objc_msgSend(v19, "safeStringForKey:", CFSTR("AlternateAssetAudienceUUID"));
        v135 = objc_claimAutoreleasedReturnValue();
        alternateAssetAudienceUUID = v21->_alternateAssetAudienceUUID;
        v21->_alternateAssetAudienceUUID = (NSString *)v135;

        assetAudienceUUID = v21->_assetAudienceUUID;
        v21->_assetAudienceUUID = 0;

        updateBrainPath = v21->_updateBrainPath;
        v21->_updateBrainPath = 0;

        updateBundlePath = v21->_updateBundlePath;
        v21->_updateBundlePath = 0;

        v21->_splatOnly = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("SplatOnly"));
        v21->_semiSplatEnabled = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("SemiSplatEnabled"));
        objc_msgSend(v19, "safeObjectForKey:ofClass:", CFSTR("SemiSplatMustQuitApps"), objc_opt_class());
        v140 = objc_claimAutoreleasedReturnValue();
        semiSplatMustQuitApps = v21->_semiSplatMustQuitApps;
        v21->_semiSplatMustQuitApps = (NSArray *)v140;

        v21->_revoked = objc_msgSend(v19, "safeBooleanForKey:", CFSTR("Revoked"));
        v21->_semiSplatRestartNow = 0;
        associatedSplatDescriptor = v21->_associatedSplatDescriptor;
        v21->_associatedSplatDescriptor = 0;

        v21->_disableSplatCombo = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("DisableSplombo"), objc_msgSend(v17, "safeBooleanForKey:defaultValue:", CFSTR("DisableSplombo"), 0));
        v143 = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", CFSTR("DisablePreSoftwareUpdateAssetStaging"), objc_msgSend(v17, "safeBooleanForKey:defaultValue:", CFSTR("DisablePreSoftwareUpdateAssetStaging"), 0));
        v21->_enablePreSUStaging = v143 ^ 1;
        if ((v143 & 1) != 0)
        {
          v21->_enablePreSUStagingForOptionalAssets = 0;
        }
        else
        {
          if (v17)
          {
            v144 = objc_msgSend(v17, "safeBooleanForKey:defaultValue:", CFSTR("EnablePSUSForOptionalAssets"), 1);
            v145 = v19;
          }
          else
          {
            v145 = v19;
            v144 = 1;
          }
          v21->_enablePreSUStagingForOptionalAssets = objc_msgSend(v145, "safeBooleanForKey:defaultValue:", CFSTR("EnablePSUSForOptionalAssets"), v144);
        }

        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = CFSTR("unable to create SU descriptor: update asset without attributes");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = CFSTR("unable to create SU descriptor: unable to create attributes dictionary");
    }
    objc_msgSend(v65, "trackError:forReason:withResult:withError:", CFSTR("[DESCRIPTOR]"), v67, 8100, 0);

    v64 = 0;
LABEL_52:

    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trackError:forReason:withResult:withError:", CFSTR("[DESCRIPTOR]"), CFSTR("unable to create SU descriptor: nil update asset"), 8100, 0);

  v64 = 0;
LABEL_53:

  return v64;
}

- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5
{
  return -[SUCoreDescriptor initWithUpdateBrainPath:updateBundlePath:bundleAttributes:descriptorType:](self, "initWithUpdateBrainPath:updateBundlePath:bundleAttributes:descriptorType:", a3, a4, a5, 2);
}

- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5 descriptorType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  SUCoreDescriptor *v15;
  SUCoreDescriptor *v16;
  NSString *assetID;
  uint64_t v18;
  NSString *uniqueBuildID;
  NSDate *releaseDate;
  uint64_t v21;
  NSString *rawProductVersion;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSString *productVersion;
  uint64_t v28;
  NSString *productBuildVersion;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *productVersionExtra;
  uint64_t v34;
  NSString *productSystemName;
  uint64_t v36;
  NSString *releaseType;
  uint64_t v38;
  NSString *publisher;
  uint64_t v40;
  NSString *restoreVersion;
  uint64_t v42;
  NSString *targetUpdateBridgeVersion;
  uint64_t v44;
  NSString *targetUpdateSFRVersion;
  uint64_t v46;
  NSString *trainName;
  uint64_t v48;
  NSString *prerequisiteBuild;
  uint64_t v50;
  NSString *prerequisiteOSVersion;
  uint64_t v52;
  NSArray *supportedDevices;
  NSDictionary *systemPartitionPadding;
  NSString *setupCritical;
  NSString *lastEmergencyBuild;
  NSString *lastEmergencyOSVersion;
  NSString *mandatoryUpdateVersionMin;
  NSString *mandatoryUpdateVersionMax;
  NSArray *oneShotBuddyDisabledBuilds;
  NSString *productType;
  NSString *minimumBridgeVersion;
  NSData *sepDigest;
  NSData *sepTBMDigests;
  NSData *rsepDigest;
  NSData *rsepTBMDigests;
  NSString *documentationID;
  NSString *softwareUpdateURL;
  NSData *measurement;
  NSString *measurementAlgorithm;
  MAAsset *softwareUpdateAsset;
  NSString *softwareUpdateAssetType;
  MAAbsoluteAssetId *softwareUpdateAssetAbsoluteID;
  NSString *softwareUpdateAssetPurpose;
  MAAsset *documentationAsset;
  NSString *documentationAssetType;
  MAAbsoluteAssetId *documentationAssetAbsoluteID;
  NSString *documentationAssetPurpose;
  SUCoreDocumentation *documentation;
  SUCoreMAIdentifier *softwareUpdateAssetIdentifier;
  SUCoreMAIdentifier *documentationAssetIdentifier;
  NSString *alternateAssetAudienceUUID;
  NSString *assetAudienceUUID;
  uint64_t v84;
  NSArray *semiSplatMustQuitApps;
  SUCoreDescriptor *associatedSplatDescriptor;
  SUCoreDescriptor *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  objc_super v92;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    v90 = CFSTR("no update brain path was provided on descriptor initialization");
LABEL_14:
    objc_msgSend(v88, "trackError:forReason:withResult:withError:", CFSTR("[DESCRIPTOR]"), v90, 8100, 0);

    v87 = 0;
    goto LABEL_15;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    v90 = CFSTR("no update bundle path was provided on descriptor initialization");
    goto LABEL_14;
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    v90 = CFSTR("no update bundle attributes were provided on descriptor initialization");
    goto LABEL_14;
  }
  v92.receiver = self;
  v92.super_class = (Class)SUCoreDescriptor;
  v15 = -[SUCoreDescriptor init](&v92, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_descriptorAudienceType = 0;
    v15->_preferredUpdateType = 0;
    v15->_descriptorType = a6;
    objc_storeStrong((id *)&v15->_updateBrainPath, a3);
    objc_storeStrong((id *)&v16->_updateBundlePath, a4);
    objc_storeStrong((id *)&v16->_bundleAttributes, a5);
    assetID = v16->_assetID;
    v16->_assetID = 0;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("UniqueBuildID"));
    v18 = objc_claimAutoreleasedReturnValue();
    uniqueBuildID = v16->_uniqueBuildID;
    v16->_uniqueBuildID = (NSString *)v18;

    releaseDate = v16->_releaseDate;
    v16->_releaseDate = 0;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("OSVersion"));
    v21 = objc_claimAutoreleasedReturnValue();
    rawProductVersion = v16->_rawProductVersion;
    v16->_rawProductVersion = (NSString *)v21;

    v23 = v16->_rawProductVersion;
    if (!v23)
    {
      objc_msgSend(v14, "safeStringForKey:", CFSTR("ProductVersion"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v16->_rawProductVersion;
      v16->_rawProductVersion = (NSString *)v24;

      v23 = v16->_rawProductVersion;
    }
    +[SUCoreDescriptor cleanProductVersion:](SUCoreDescriptor, "cleanProductVersion:", v23);
    v26 = objc_claimAutoreleasedReturnValue();
    productVersion = v16->_productVersion;
    v16->_productVersion = (NSString *)v26;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("Build"));
    v28 = objc_claimAutoreleasedReturnValue();
    productBuildVersion = v16->_productBuildVersion;
    v16->_productBuildVersion = (NSString *)v28;

    if (!v16->_productBuildVersion)
    {
      objc_msgSend(v14, "safeStringForKey:", CFSTR("TargetUpdate"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v16->_productBuildVersion;
      v16->_productBuildVersion = (NSString *)v30;

    }
    objc_msgSend(v14, "safeStringForKey:", CFSTR("ProductVersionExtra"));
    v32 = objc_claimAutoreleasedReturnValue();
    productVersionExtra = v16->_productVersionExtra;
    v16->_productVersionExtra = (NSString *)v32;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("SUProductSystemName"));
    v34 = objc_claimAutoreleasedReturnValue();
    productSystemName = v16->_productSystemName;
    v16->_productSystemName = (NSString *)v34;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("ReleaseType"));
    v36 = objc_claimAutoreleasedReturnValue();
    releaseType = v16->_releaseType;
    v16->_releaseType = (NSString *)v36;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("SUPublisher"));
    v38 = objc_claimAutoreleasedReturnValue();
    publisher = v16->_publisher;
    v16->_publisher = (NSString *)v38;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("RestoreVersion"));
    v40 = objc_claimAutoreleasedReturnValue();
    restoreVersion = v16->_restoreVersion;
    v16->_restoreVersion = (NSString *)v40;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("TargetBridgeUpdateVersion"));
    v42 = objc_claimAutoreleasedReturnValue();
    targetUpdateBridgeVersion = v16->_targetUpdateBridgeVersion;
    v16->_targetUpdateBridgeVersion = (NSString *)v42;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("TargetSFRUpdateVersion"));
    v44 = objc_claimAutoreleasedReturnValue();
    targetUpdateSFRVersion = v16->_targetUpdateSFRVersion;
    v16->_targetUpdateSFRVersion = (NSString *)v44;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("TrainName"));
    v46 = objc_claimAutoreleasedReturnValue();
    trainName = v16->_trainName;
    v16->_trainName = (NSString *)v46;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
    v48 = objc_claimAutoreleasedReturnValue();
    prerequisiteBuild = v16->_prerequisiteBuild;
    v16->_prerequisiteBuild = (NSString *)v48;

    objc_msgSend(v14, "safeStringForKey:", CFSTR("PrerequisiteOSVersion"));
    v50 = objc_claimAutoreleasedReturnValue();
    prerequisiteOSVersion = v16->_prerequisiteOSVersion;
    v16->_prerequisiteOSVersion = (NSString *)v50;

    objc_msgSend(v14, "safeObjectForKey:ofClass:", CFSTR("SupportedDevices"), objc_opt_class());
    v52 = objc_claimAutoreleasedReturnValue();
    supportedDevices = v16->_supportedDevices;
    v16->_supportedDevices = (NSArray *)v52;

    v16->_suDownloadSize = 0;
    v16->_unarchivedSize = 0;
    systemPartitionPadding = v16->_systemPartitionPadding;
    v16->_minimumSystemPartitionSize = 0;
    v16->_systemPartitionPadding = 0;
    v16->_streamingZipCapable = 0;

    *(_WORD *)&v16->_disableCDLevel4 = 0;
    *(_DWORD *)&v16->_autoDownloadAllowableOverCellular = 0;
    v16->_preSUStagingRequiredSize = 0;
    v16->_preSUStagingOptionalSize = 0;
    v16->_disableInstallTonight = 1;
    *(_DWORD *)&v16->_forcePasscodeRequired = 0;
    *(_OWORD *)&v16->_mdmDelayInterval = xmmword_1DE07B250;
    v16->_containsSFRContent = objc_msgSend(v14, "safeBooleanForKey:", CFSTR("ContainsSFRContent"));
    v16->_allowAutoDownloadOnBattery = 0;
    *(_OWORD *)&v16->_installAlertInterval = xmmword_1DE07B260;
    setupCritical = v16->_setupCritical;
    v16->_autoDownloadOnBatteryMinBattery = 80;
    v16->_setupCritical = 0;

    *(_WORD *)&v16->_criticalCellularOverride = 0;
    lastEmergencyBuild = v16->_lastEmergencyBuild;
    v16->_lastEmergencyBuild = 0;

    lastEmergencyOSVersion = v16->_lastEmergencyOSVersion;
    v16->_lastEmergencyOSVersion = 0;

    v16->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v16->_mandatoryUpdateVersionMin;
    v16->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v16->_mandatoryUpdateVersionMax;
    v16->_mandatoryUpdateVersionMax = 0;

    *(_WORD *)&v16->_mandatoryUpdateOptional = 0;
    v16->_oneShotBuddyDisabled = 0;
    oneShotBuddyDisabledBuilds = v16->_oneShotBuddyDisabledBuilds;
    v16->_oneShotBuddyDisabledBuilds = 0;

    v16->_criticalUpdate = 0;
    productType = v16->_productType;
    v16->_productType = 0;

    minimumBridgeVersion = v16->_minimumBridgeVersion;
    v16->_autoInstallDelay = 0;
    v16->_minimumBridgeVersion = 0;
    v16->_notifyAfter = 0;

    *(_WORD *)&v16->_disableRosettaUpdates = 0;
    v16->_requireInstallAssistantUpdate = 0;
    sepDigest = v16->_sepDigest;
    v16->_sepDigest = 0;

    sepTBMDigests = v16->_sepTBMDigests;
    v16->_sepTBMDigests = 0;

    rsepDigest = v16->_rsepDigest;
    v16->_rsepDigest = 0;

    rsepTBMDigests = v16->_rsepTBMDigests;
    v16->_rsepTBMDigests = 0;

    documentationID = v16->_documentationID;
    v16->_documentationID = 0;

    softwareUpdateURL = v16->_softwareUpdateURL;
    v16->_softwareUpdateURL = 0;

    measurement = v16->_measurement;
    v16->_measurement = 0;

    measurementAlgorithm = v16->_measurementAlgorithm;
    v16->_measurementAlgorithm = 0;

    v16->_updateType = 0;
    v16->_msuPrepareSize = 0;
    v16->_installationSize = 0;
    softwareUpdateAsset = v16->_softwareUpdateAsset;
    v16->_softwareUpdateAsset = 0;

    softwareUpdateAssetType = v16->_softwareUpdateAssetType;
    v16->_softwareUpdateAssetType = 0;

    softwareUpdateAssetAbsoluteID = v16->_softwareUpdateAssetAbsoluteID;
    v16->_softwareUpdateAssetAbsoluteID = 0;

    softwareUpdateAssetPurpose = v16->_softwareUpdateAssetPurpose;
    v16->_softwareUpdateAssetPurpose = 0;

    documentationAsset = v16->_documentationAsset;
    v16->_documentationAsset = 0;

    documentationAssetType = v16->_documentationAssetType;
    v16->_documentationAssetType = 0;

    documentationAssetAbsoluteID = v16->_documentationAssetAbsoluteID;
    v16->_documentationAssetAbsoluteID = 0;

    documentationAssetPurpose = v16->_documentationAssetPurpose;
    v16->_documentationAssetPurpose = 0;

    documentation = v16->_documentation;
    v16->_documentation = 0;

    softwareUpdateAssetIdentifier = v16->_softwareUpdateAssetIdentifier;
    v16->_softwareUpdateAssetIdentifier = 0;

    documentationAssetIdentifier = v16->_documentationAssetIdentifier;
    v16->_documentationAssetIdentifier = 0;

    *(_WORD *)&v16->_promoteAlternateUpdate = 0;
    alternateAssetAudienceUUID = v16->_alternateAssetAudienceUUID;
    v16->_alternateAssetAudienceUUID = 0;

    assetAudienceUUID = v16->_assetAudienceUUID;
    v16->_assetAudienceUUID = 0;

    v16->_splatOnly = objc_msgSend(v14, "safeBooleanForKey:", CFSTR("SplatOnly"));
    v16->_semiSplatEnabled = objc_msgSend(v14, "safeBooleanForKey:", CFSTR("SemiSplatEnabled"));
    objc_msgSend(v14, "safeObjectForKey:ofClass:", CFSTR("SemiSplatMustQuitApps"), objc_opt_class());
    v84 = objc_claimAutoreleasedReturnValue();
    semiSplatMustQuitApps = v16->_semiSplatMustQuitApps;
    v16->_semiSplatMustQuitApps = (NSArray *)v84;

    v16->_revoked = objc_msgSend(v14, "safeBooleanForKey:", CFSTR("Revoked"));
    v16->_semiSplatRestartNow = 0;
    associatedSplatDescriptor = v16->_associatedSplatDescriptor;
    v16->_associatedSplatDescriptor = 0;

    *(_WORD *)&v16->_disableSplatCombo = 0;
    v16->_enablePreSUStagingForOptionalAssets = 0;
  }
  self = v16;
  v87 = self;
LABEL_15:

  return v87;
}

- (id)initSemiSplatDescriptor
{
  SUCoreDescriptor *v2;
  SUCoreDescriptor *v3;
  NSString *updateBrainPath;
  NSString *updateBundlePath;
  NSDictionary *bundleAttributes;
  NSString *assetID;
  NSString *uniqueBuildID;
  NSDate *releaseDate;
  NSString *publisher;
  void *v11;
  uint64_t v12;
  NSString *rawProductVersion;
  void *v14;
  uint64_t v15;
  NSString *productVersion;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *productBuildVersion;
  uint64_t v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  NSString *productVersionExtra;
  NSString *productSystemName;
  void *v28;
  uint64_t v29;
  NSString *releaseType;
  void *v31;
  uint64_t v32;
  NSString *restoreVersion;
  NSString *targetUpdateBridgeVersion;
  NSString *targetUpdateSFRVersion;
  NSString *trainName;
  NSString *prerequisiteBuild;
  NSString *prerequisiteOSVersion;
  NSArray *supportedDevices;
  NSDictionary *systemPartitionPadding;
  NSString *setupCritical;
  NSString *lastEmergencyBuild;
  NSString *lastEmergencyOSVersion;
  NSString *mandatoryUpdateVersionMin;
  NSString *mandatoryUpdateVersionMax;
  NSArray *oneShotBuddyDisabledBuilds;
  NSString *productType;
  NSString *minimumBridgeVersion;
  NSData *sepDigest;
  NSData *sepTBMDigests;
  NSData *rsepDigest;
  NSData *rsepTBMDigests;
  NSString *documentationID;
  NSString *softwareUpdateURL;
  NSData *measurement;
  NSString *measurementAlgorithm;
  MAAsset *softwareUpdateAsset;
  NSString *softwareUpdateAssetType;
  MAAbsoluteAssetId *softwareUpdateAssetAbsoluteID;
  NSString *softwareUpdateAssetPurpose;
  MAAsset *documentationAsset;
  NSString *documentationAssetType;
  MAAbsoluteAssetId *documentationAssetAbsoluteID;
  NSString *documentationAssetPurpose;
  SUCoreDocumentation *documentation;
  SUCoreMAIdentifier *softwareUpdateAssetIdentifier;
  SUCoreMAIdentifier *documentationAssetIdentifier;
  NSString *alternateAssetAudienceUUID;
  NSString *assetAudienceUUID;
  NSArray *semiSplatMustQuitApps;
  SUCoreDescriptor *associatedSplatDescriptor;
  void *v72;
  uint64_t v73;
  SUCoreDocumentation *v74;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)SUCoreDescriptor;
  v2 = -[SUCoreDescriptor init](&v76, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_descriptorAudienceType = 0;
    v2->_preferredUpdateType = 0;
    v2->_descriptorType = 6;
    updateBrainPath = v2->_updateBrainPath;
    v2->_updateBrainPath = 0;

    updateBundlePath = v3->_updateBundlePath;
    v3->_updateBundlePath = 0;

    bundleAttributes = v3->_bundleAttributes;
    v3->_bundleAttributes = 0;

    assetID = v3->_assetID;
    v3->_assetID = 0;

    uniqueBuildID = v3->_uniqueBuildID;
    v3->_uniqueBuildID = 0;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0;

    publisher = v3->_publisher;
    v3->_publisher = 0;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "splatCryptex1ProductVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    rawProductVersion = v3->_rawProductVersion;
    v3->_rawProductVersion = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "splatCryptex1ProductVersion");
    v15 = objc_claimAutoreleasedReturnValue();
    productVersion = v3->_productVersion;
    v3->_productVersion = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "splatCryptex1BuildVersionOverride");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
      productBuildVersion = v3->_productBuildVersion;
      v3->_productBuildVersion = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
      productBuildVersion = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(productBuildVersion, "splatCryptex1BuildVersion");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v3->_productBuildVersion;
      v3->_productBuildVersion = (NSString *)v22;

    }
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "splatCryptex1ProductVersionExtra");
    v25 = objc_claimAutoreleasedReturnValue();
    productVersionExtra = v3->_productVersionExtra;
    v3->_productVersionExtra = (NSString *)v25;

    productSystemName = v3->_productSystemName;
    v3->_productSystemName = (NSString *)CFSTR("Security Response");

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "splatCryptex1ReleaseType");
    v29 = objc_claimAutoreleasedReturnValue();
    releaseType = v3->_releaseType;
    v3->_releaseType = (NSString *)v29;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "splatCryptex1RestoreVersion");
    v32 = objc_claimAutoreleasedReturnValue();
    restoreVersion = v3->_restoreVersion;
    v3->_restoreVersion = (NSString *)v32;

    targetUpdateBridgeVersion = v3->_targetUpdateBridgeVersion;
    v3->_targetUpdateBridgeVersion = 0;

    targetUpdateSFRVersion = v3->_targetUpdateSFRVersion;
    v3->_targetUpdateSFRVersion = 0;

    trainName = v3->_trainName;
    v3->_trainName = 0;

    prerequisiteBuild = v3->_prerequisiteBuild;
    v3->_prerequisiteBuild = 0;

    prerequisiteOSVersion = v3->_prerequisiteOSVersion;
    v3->_prerequisiteOSVersion = 0;

    supportedDevices = v3->_supportedDevices;
    v3->_supportedDevices = 0;

    v3->_suDownloadSize = 0;
    v3->_unarchivedSize = 0;
    systemPartitionPadding = v3->_systemPartitionPadding;
    v3->_minimumSystemPartitionSize = 0;
    v3->_systemPartitionPadding = 0;
    v3->_streamingZipCapable = 0;

    *(_DWORD *)&v3->_forcePasscodeRequired = 0;
    *(_QWORD *)&v3->_autoDownloadAllowableOverCellular = 0;
    v3->_preSUStagingRequiredSize = 0;
    v3->_preSUStagingOptionalSize = 0;
    *(_WORD *)&v3->_containsSFRContent = 0;
    *(_OWORD *)&v3->_mdmDelayInterval = xmmword_1DE07B250;
    *(_OWORD *)&v3->_installAlertInterval = xmmword_1DE07B260;
    setupCritical = v3->_setupCritical;
    v3->_autoDownloadOnBatteryMinBattery = 80;
    v3->_setupCritical = 0;

    *(_WORD *)&v3->_criticalCellularOverride = 0;
    lastEmergencyBuild = v3->_lastEmergencyBuild;
    v3->_lastEmergencyBuild = 0;

    lastEmergencyOSVersion = v3->_lastEmergencyOSVersion;
    v3->_lastEmergencyOSVersion = 0;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0;

    *(_WORD *)&v3->_mandatoryUpdateOptional = 0;
    v3->_oneShotBuddyDisabled = 0;
    oneShotBuddyDisabledBuilds = v3->_oneShotBuddyDisabledBuilds;
    v3->_oneShotBuddyDisabledBuilds = 0;

    v3->_criticalUpdate = 0;
    productType = v3->_productType;
    v3->_productType = 0;

    minimumBridgeVersion = v3->_minimumBridgeVersion;
    v3->_autoInstallDelay = 0;
    v3->_minimumBridgeVersion = 0;
    v3->_notifyAfter = 0;

    *(_WORD *)&v3->_disableRosettaUpdates = 0;
    v3->_requireInstallAssistantUpdate = 0;
    sepDigest = v3->_sepDigest;
    v3->_sepDigest = 0;

    sepTBMDigests = v3->_sepTBMDigests;
    v3->_sepTBMDigests = 0;

    rsepDigest = v3->_rsepDigest;
    v3->_rsepDigest = 0;

    rsepTBMDigests = v3->_rsepTBMDigests;
    v3->_rsepTBMDigests = 0;

    documentationID = v3->_documentationID;
    v3->_documentationID = 0;

    softwareUpdateURL = v3->_softwareUpdateURL;
    v3->_softwareUpdateURL = 0;

    measurement = v3->_measurement;
    v3->_measurement = 0;

    measurementAlgorithm = v3->_measurementAlgorithm;
    v3->_measurementAlgorithm = 0;

    v3->_updateType = 0;
    v3->_msuPrepareSize = 0;
    v3->_installationSize = 0;
    softwareUpdateAsset = v3->_softwareUpdateAsset;
    v3->_softwareUpdateAsset = 0;

    softwareUpdateAssetType = v3->_softwareUpdateAssetType;
    v3->_softwareUpdateAssetType = 0;

    softwareUpdateAssetAbsoluteID = v3->_softwareUpdateAssetAbsoluteID;
    v3->_softwareUpdateAssetAbsoluteID = 0;

    softwareUpdateAssetPurpose = v3->_softwareUpdateAssetPurpose;
    v3->_softwareUpdateAssetPurpose = 0;

    documentationAsset = v3->_documentationAsset;
    v3->_documentationAsset = 0;

    documentationAssetType = v3->_documentationAssetType;
    v3->_documentationAssetType = 0;

    documentationAssetAbsoluteID = v3->_documentationAssetAbsoluteID;
    v3->_documentationAssetAbsoluteID = 0;

    documentationAssetPurpose = v3->_documentationAssetPurpose;
    v3->_documentationAssetPurpose = 0;

    documentation = v3->_documentation;
    v3->_documentation = 0;

    softwareUpdateAssetIdentifier = v3->_softwareUpdateAssetIdentifier;
    v3->_softwareUpdateAssetIdentifier = 0;

    documentationAssetIdentifier = v3->_documentationAssetIdentifier;
    v3->_documentationAssetIdentifier = 0;

    *(_WORD *)&v3->_promoteAlternateUpdate = 0;
    alternateAssetAudienceUUID = v3->_alternateAssetAudienceUUID;
    v3->_alternateAssetAudienceUUID = 0;

    assetAudienceUUID = v3->_assetAudienceUUID;
    v3->_assetAudienceUUID = 0;

    *(_WORD *)&v3->_splatOnly = 257;
    semiSplatMustQuitApps = v3->_semiSplatMustQuitApps;
    v3->_semiSplatMustQuitApps = (NSArray *)&unk_1EA89AB78;

    *(_WORD *)&v3->_revoked = 256;
    associatedSplatDescriptor = v3->_associatedSplatDescriptor;
    v3->_associatedSplatDescriptor = 0;

    *(_WORD *)&v3->_disableSplatCombo = 0;
    v3->_enablePreSUStagingForOptionalAssets = 0;
    +[SUCoreDocumentationDataManager sharedManager](SUCoreDocumentationDataManager, "sharedManager");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "getDocumentationForInstalledUpdateType:withError:", 1, 0);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v3->_documentation;
    v3->_documentation = (SUCoreDocumentation *)v73;

  }
  return v3;
}

- (void)assignDocumentationFromAsset:(id)a3
{
  -[SUCoreDescriptor assignDocumentationFromAsset:extendingBundleProperties:](self, "assignDocumentationFromAsset:extendingBundleProperties:", a3, 1);
}

- (void)assignDocumentationFromAsset:(id)a3 extendingBundleProperties:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SUCoreDocumentation *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v4 = a4;
  v6 = a3;
  -[SUCoreDescriptor setDocumentationAsset:](self, "setDocumentationAsset:", v6);
  objc_msgSend(v6, "assetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetType:](self, "setDocumentationAssetType:", v7);

  objc_msgSend(v6, "absoluteAssetId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetAbsoluteID:](self, "setDocumentationAssetAbsoluteID:", v8);

  objc_msgSend(v6, "purpose");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetPurpose:](self, "setDocumentationAssetPurpose:", v9);

  v10 = -[SUCoreDocumentation initWithDocumentationAsset:]([SUCoreDocumentation alloc], "initWithDocumentationAsset:", v6);
  -[SUCoreDescriptor setDocumentation:](self, "setDocumentation:", v10);

  v11 = objc_alloc(MEMORY[0x1E0DA8968]);
  -[SUCoreDescriptor documentation](self, "documentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverAssetMeasurement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor documentation](self, "documentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serverAssetAlgorithm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithProductVersion:productBuildVersion:releaseType:measurement:measurementAlgorithm:", 0, 0, 0, v13, v15);
  -[SUCoreDescriptor setDocumentationAssetIdentifier:](self, "setDocumentationAssetIdentifier:", v16);

  if (v4)
  {
    -[SUCoreDescriptor documentation](self, "documentation");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v18, "extendDocumentationProperties");

  }
}

- (void)assignDescriptorAudienceType:(int64_t)a3 descriptorPreferredUpdateType:(int64_t)a4 assetAudienceUUID:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  -[SUCoreDescriptor setDescriptorAudienceType:](self, "setDescriptorAudienceType:", a3);
  -[SUCoreDescriptor setPreferredUpdateType:](self, "setPreferredUpdateType:", a4);
  v8 = v9;
  if (v9)
  {
    -[SUCoreDescriptor setAssetAudienceUUID:](self, "setAssetAudienceUUID:", v9);
    v8 = v9;
  }

}

- (NSString)humanReadableUpdateName
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;

  -[SUCoreDescriptor documentation](self, "documentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "humanReadableUpdateName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SUCoreDescriptor productSystemName](self, "productSystemName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v11 = (void *)v10,
          -[SUCoreDescriptor productVersion](self, "productVersion"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      v4 = CFSTR("Software Update");
      goto LABEL_12;
    }
    v13 = -[SUCoreDescriptor splatOnly](self, "splatOnly");
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreDescriptor productSystemName](self, "productSystemName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor productVersion](self, "productVersion");
    v15 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v15;
    if (v13)
    {
      -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ Security Response %@ %@"), v7, v8, v16);

    }
    else
    {
      v4 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ %@"), v7, v15);
    }
    goto LABEL_11;
  }
  if (-[SUCoreDescriptor splatOnly](self, "splatOnly"))
  {
    -[SUCoreDescriptor productVersion](self, "productVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreDescriptor productVersion](self, "productVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@ %@ %@"), v4, v7, v8);

      v4 = (__CFString *)v9;
LABEL_11:

    }
  }
LABEL_12:
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "productVersionExtra");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@ %@"), v4, v20);

    v4 = (__CFString *)v21;
  }
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isBootedOSSecureInternal"))
    goto LABEL_18;
  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_18;
  v24 = (void *)v23;
  v25 = objc_alloc(MEMORY[0x1E0DA8928]);
  v26 = (void *)objc_msgSend(v25, "initWithProjectName:", *MEMORY[0x1E0DA8A10]);
  v27 = objc_msgSend(v26, "getBoolConfigForKey:", *MEMORY[0x1E0DA89C8]);

  if ((v27 & 1) == 0)
  {
    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "initWithFormat:", CFSTR("%@ (%@)"), v4, v22);

    v4 = (__CFString *)v29;
LABEL_18:

  }
  return (NSString *)v4;
}

- (NSString)humanReadableUpdateTitle
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "humanReadableUpdateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)humanReadableUpdateVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;

  -[SUCoreDescriptor documentation](self, "documentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "humanReadableUpdateVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCoreDescriptor splatOnly](self, "splatOnly"))
  {
    -[SUCoreDescriptor productVersion](self, "productVersion");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCoreDescriptor productVersion](self, "productVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@ %@"), v9, v10);

        v4 = (void *)v11;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isBootedOSSecureInternal"))
    v13 = v4 == 0;
  else
    v13 = 1;
  if (v13)
    goto LABEL_12;
  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_12;
  v15 = (void *)v14;
  v16 = objc_alloc(MEMORY[0x1E0DA8928]);
  v17 = (void *)objc_msgSend(v16, "initWithProjectName:", *MEMORY[0x1E0DA8A10]);
  v18 = objc_msgSend(v17, "getBoolConfigForKey:", *MEMORY[0x1E0DA89C8]);

  if ((v18 & 1) == 0)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@ (%@)"), v4, v12);

    v4 = (void *)v20;
LABEL_12:

  }
  return (NSString *)v4;
}

- (NSString)humanReadableMoreInfoLink
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "humanReadableMoreInfoLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)notificationEnabled
{
  void *v2;
  char v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationEnabled");

  return v3;
}

- (NSString)notificationTitleString
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)notificationBodyString
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationBodyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)recommendedUpdateEnabled
{
  void *v2;
  char v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recommendedUpdateEnabled");

  return v3;
}

- (BOOL)recommendedUpdateApplicable
{
  void *v2;
  char v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recommendedUpdateApplicable");

  return v3;
}

- (NSNumber)recommendedUpdateNotificationFrequencyDays
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recommendedUpdateNotificationFrequencyDays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)recommendedUpdateMinOSVersion
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recommendedUpdateMinOSVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recommendedUpdateMaxOSVersion
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recommendedUpdateMaxOSVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recommendedUpdateTitleString
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recommendedUpdateTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recommendedUpdateAlertBodyString
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recommendedUpdateAlertBodyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)mandatoryUpdateBodyString
{
  void *v2;
  void *v3;

  -[SUCoreDescriptor documentation](self, "documentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mandatoryUpdateBodyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)publisher
{
  if (self->_publisher)
    return self->_publisher;
  else
    return (NSString *)CFSTR("Apple, Inc.");
}

- (NSString)productSystemName
{
  NSString *productSystemName;
  void *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  productSystemName = self->_productSystemName;
  if (productSystemName)
    return productSystemName;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marketingProductName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Falling back to marketingProductName:%{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      v11 = 138543362;
      v12 = CFSTR("OS");
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Falling back to kSUProductSystemNameDefault:%{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreDescriptor"), CFSTR("Falling back to kSUProductSystemNameDefault due to no SUCoreDevice marketingProductName"), 8116, 0);

    v9 = CFSTR("OS");
  }

  return (NSString *)v9;
}

- (BOOL)fullReplacement
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (unint64_t)unarchivedSize
{
  unint64_t unarchivedSize;
  void *v4;
  void *v5;

  unarchivedSize = self->_unarchivedSize;
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    unarchivedSize += objc_msgSend(v5, "unarchivedSize");

  }
  return unarchivedSize;
}

- (unint64_t)installationSize
{
  unint64_t installationSize;
  void *v3;

  installationSize = self->_installationSize;
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return installationSize + 32000000;
  else
    return installationSize;
}

- (unint64_t)preparationSize
{
  unint64_t v3;

  v3 = -[SUCoreDescriptor unarchivedSize](self, "unarchivedSize");
  return -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize") + v3;
}

- (unint64_t)refreshInstallationSize
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SUCoreBorder_MSUAssetCalculateApplySize(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[DESCRIPTOR]"), CFSTR("unable to determine refreshed apply size for installation, using preexisting value"), 8100, v4);

  }
  else
  {
    self->_installationSize = 0;
  }
  v6 = -[SUCoreDescriptor installationSize](self, "installationSize");

  return v6;
}

- (unint64_t)totalRequiredFreeSpace
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v3 = -[SUCoreDescriptor preparationSize](self, "preparationSize");
  v4 = -[SUCoreDescriptor installationSize](self, "installationSize") + v3;
  if (!-[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable"))
    v4 += -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "streamingZipCapable");

    if ((v8 & 1) == 0)
    {
      -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 += objc_msgSend(v9, "suDownloadSize");

    }
  }
  if (-[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging"))
    v4 += -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
  return v4;
}

- (unint64_t)downloadSize
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 += objc_msgSend(v5, "suDownloadSize");

  }
  if (-[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging"))
    v3 += -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
  return v3;
}

- (id)criticalOverrideCellularPolicy
{
  if (-[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride"))
    return CFSTR("WifiAndCellular");
  else
    return CFSTR("WifiOnly");
}

- (id)updateTypeName
{
  unint64_t v2;

  v2 = -[SUCoreDescriptor updateType](self, "updateType");
  if (v2 > 5)
    return CFSTR("unknown");
  else
    return off_1EA879280[v2];
}

+ (BOOL)isEmergencyUpdate:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildVersion");
    v5 = objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "oslog");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate returns NO because currentBuild is nil", (uint8_t *)&v26, 2u);
      }
      v15 = 0;
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productVersion");
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate returns NO because currentOSVersion is nil", (uint8_t *)&v26, 2u);
      }
      v15 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("LastEmergencyBuild"), objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("LastEmergencyOSVersion"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v9, "compare:options:", v7, 64) == -1)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "oslog");
        v13 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138543618;
          v27 = v10;
          v28 = 2114;
          v29 = v7;
          v21 = "isEmergencyUpdate returns NO because lastEmergencyOSVersion:%{public}@ is less than currentOSVersion:%{public}@";
LABEL_29:
          v22 = v13;
          v23 = 22;
LABEL_30:
          _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
        }
      }
      else
      {
        v11 = -[NSObject compare:options:](v8, "compare:options:", v5, 64);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "oslog");
        v13 = objc_claimAutoreleasedReturnValue();

        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v11 != -1)
        {
          if (v14)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate: YES", (uint8_t *)&v26, 2u);
          }
          v15 = 1;
          goto LABEL_32;
        }
        if (v14)
        {
          v26 = 138543618;
          v27 = v8;
          v28 = 2114;
          v29 = v5;
          v21 = "isEmergencyUpdate returns NO because lastEmergencyBuild:%{public}@ is less than currentBuild:%{public}@";
          goto LABEL_29;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
          v20 = CFSTR("LastEmergencyOSVersion");
        else
          v20 = CFSTR("LastEmergencyBuild");
        v26 = 138543362;
        v27 = (void *)v20;
        v21 = "isEmergencyUpdate returns NO because asset attributes does no contain %{public}@";
        v22 = v13;
        v23 = 12;
        goto LABEL_30;
      }
    }
    v15 = 0;
LABEL_32:

LABEL_33:
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate returns NO because assetAttributes is nil", (uint8_t *)&v26, 2u);
  }
  v15 = 0;
LABEL_35:

  return v15;
}

+ (id)nameForDescriptorType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return CFSTR("Unknown");
  else
    return off_1EA8792B0[a3];
}

+ (id)nameForDescriptorAudienceType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("AudienceTypeUnknown");
  else
    return off_1EA8792E8[a3];
}

+ (id)nameForDescriptorPreferredUpdateType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("PreferredUpdateTypeUnknown");
  else
    return off_1EA879300[a3];
}

+ (id)cleanProductVersion:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 4
    && objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("9.9."), 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_1EA87A8E8);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

- (BOOL)requiresSoftwareUpdateAssetReload
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](self, "softwareUpdateAssetAbsoluteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUCoreDescriptor softwareUpdateAsset](self, "softwareUpdateAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresDocumentationReload
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SUCoreDescriptor documentationAssetAbsoluteID](self, "documentationAssetAbsoluteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SUCoreDescriptor documentationAsset](self, "documentationAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)transferNonAssetPropertiesFromDescriptor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v4 = (void *)MEMORY[0x1E0DA8960];
  v5 = a3;
  objc_msgSend(v4, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Transferring non-asset attribute properties from other descriptor", v15, 2u);
  }

  -[SUCoreDescriptor setDescriptorAudienceType:](self, "setDescriptorAudienceType:", objc_msgSend(v5, "descriptorAudienceType"));
  -[SUCoreDescriptor setPreferredUpdateType:](self, "setPreferredUpdateType:", objc_msgSend(v5, "preferredUpdateType"));
  objc_msgSend(v5, "assetAudienceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setAssetAudienceUUID:](self, "setAssetAudienceUUID:", v8);

  -[SUCoreDescriptor setPreSUStagingRequiredSize:](self, "setPreSUStagingRequiredSize:", objc_msgSend(v5, "preSUStagingRequiredSize"));
  -[SUCoreDescriptor setPreSUStagingOptionalSize:](self, "setPreSUStagingOptionalSize:", objc_msgSend(v5, "preSUStagingOptionalSize"));
  objc_msgSend(v5, "documentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentation:](self, "setDocumentation:", v9);

  objc_msgSend(v5, "documentationAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAsset:](self, "setDocumentationAsset:", v10);

  objc_msgSend(v5, "documentationAssetType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetType:](self, "setDocumentationAssetType:", v11);

  objc_msgSend(v5, "documentationAssetIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetIdentifier:](self, "setDocumentationAssetIdentifier:", v12);

  objc_msgSend(v5, "documentationAssetAbsoluteID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor setDocumentationAssetAbsoluteID:](self, "setDocumentationAssetAbsoluteID:", v13);

  objc_msgSend(v5, "documentationAssetPurpose");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDescriptor setDocumentationAssetPurpose:](self, "setDocumentationAssetPurpose:", v14);
}

- (SUCoreDescriptor)initWithCoder:(id)a3
{
  id v4;
  SUCoreDescriptor *v5;
  uint64_t v6;
  NSString *assetID;
  uint64_t v8;
  NSString *softwareUpdateAssetType;
  uint64_t v10;
  NSString *documentationAssetType;
  uint64_t v12;
  MAAbsoluteAssetId *softwareUpdateAssetAbsoluteID;
  uint64_t v14;
  MAAbsoluteAssetId *documentationAssetAbsoluteID;
  uint64_t v16;
  NSString *softwareUpdateAssetPurpose;
  uint64_t v18;
  NSString *documentationAssetPurpose;
  uint64_t v20;
  NSString *uniqueBuildID;
  uint64_t v22;
  NSString *productVersion;
  uint64_t v24;
  NSString *productBuildVersion;
  uint64_t v26;
  NSString *productVersionExtra;
  uint64_t v28;
  NSString *productSystemName;
  uint64_t v30;
  NSString *releaseType;
  uint64_t v32;
  NSString *publisher;
  uint64_t v34;
  NSDate *releaseDate;
  uint64_t v36;
  NSString *restoreVersion;
  uint64_t v38;
  NSString *targetUpdateBridgeVersion;
  uint64_t v40;
  NSString *targetUpdateSFRVersion;
  uint64_t v42;
  NSString *trainName;
  uint64_t v44;
  NSString *prerequisiteBuild;
  uint64_t v46;
  NSString *prerequisiteOSVersion;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSArray *supportedDevices;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSDictionary *systemPartitionPadding;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSString *setupCritical;
  uint64_t v70;
  NSString *lastEmergencyBuild;
  uint64_t v72;
  NSString *lastEmergencyOSVersion;
  uint64_t v74;
  NSString *mandatoryUpdateVersionMin;
  uint64_t v76;
  NSString *mandatoryUpdateVersionMax;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSArray *oneShotBuddyDisabledBuilds;
  uint64_t v83;
  NSString *productType;
  void *v85;
  uint64_t v86;
  NSString *minimumBridgeVersion;
  uint64_t v88;
  NSData *sepDigest;
  uint64_t v90;
  NSData *sepTBMDigests;
  uint64_t v92;
  NSData *rsepDigest;
  uint64_t v94;
  NSData *rsepTBMDigests;
  uint64_t v96;
  NSString *documentationID;
  uint64_t v98;
  SUCoreDocumentation *documentation;
  uint64_t v100;
  NSString *softwareUpdateURL;
  uint64_t v102;
  NSData *measurement;
  uint64_t v104;
  NSString *measurementAlgorithm;
  uint64_t v106;
  SUCoreMAIdentifier *softwareUpdateAssetIdentifier;
  uint64_t v108;
  SUCoreMAIdentifier *documentationAssetIdentifier;
  uint64_t v110;
  NSString *alternateAssetAudienceUUID;
  uint64_t v112;
  NSString *assetAudienceUUID;
  uint64_t v114;
  NSString *updateBrainPath;
  uint64_t v116;
  NSString *updateBundlePath;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSArray *semiSplatMustQuitApps;
  uint64_t v123;
  SUCoreDescriptor *associatedSplatDescriptor;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  NSDictionary *bundleAttributes;
  MAAsset *softwareUpdateAsset;
  MAAsset *documentationAsset;
  void *v139;
  objc_super v140;
  _QWORD v141[4];

  v141[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)SUCoreDescriptor;
  v5 = -[SUCoreDescriptor init](&v140, sel_init);
  if (v5)
  {
    v5->_descriptorType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("DescriptorType"));
    v5->_descriptorAudienceType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("DescriptorAudienceType"));
    v5->_preferredUpdateType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PreferredUpdateType"));
    v5->_updateType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UpdateType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssetID"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftwareUpdateAssetType"));
    v8 = objc_claimAutoreleasedReturnValue();
    softwareUpdateAssetType = v5->_softwareUpdateAssetType;
    v5->_softwareUpdateAssetType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationAssetType"));
    v10 = objc_claimAutoreleasedReturnValue();
    documentationAssetType = v5->_documentationAssetType;
    v5->_documentationAssetType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftwareUpdateAssetAbsoluteID"));
    v12 = objc_claimAutoreleasedReturnValue();
    softwareUpdateAssetAbsoluteID = v5->_softwareUpdateAssetAbsoluteID;
    v5->_softwareUpdateAssetAbsoluteID = (MAAbsoluteAssetId *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationAssetAbsoluteID"));
    v14 = objc_claimAutoreleasedReturnValue();
    documentationAssetAbsoluteID = v5->_documentationAssetAbsoluteID;
    v5->_documentationAssetAbsoluteID = (MAAbsoluteAssetId *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftwareUpdateAssetPurpose"));
    v16 = objc_claimAutoreleasedReturnValue();
    softwareUpdateAssetPurpose = v5->_softwareUpdateAssetPurpose;
    v5->_softwareUpdateAssetPurpose = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationAssetPurpose"));
    v18 = objc_claimAutoreleasedReturnValue();
    documentationAssetPurpose = v5->_documentationAssetPurpose;
    v5->_documentationAssetPurpose = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueBuildID"));
    v20 = objc_claimAutoreleasedReturnValue();
    uniqueBuildID = v5->_uniqueBuildID;
    v5->_uniqueBuildID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductVersion"));
    v22 = objc_claimAutoreleasedReturnValue();
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductBuildVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductVersionExtra"));
    v26 = objc_claimAutoreleasedReturnValue();
    productVersionExtra = v5->_productVersionExtra;
    v5->_productVersionExtra = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductSystemName"));
    v28 = objc_claimAutoreleasedReturnValue();
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseType"));
    v30 = objc_claimAutoreleasedReturnValue();
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Publisher"));
    v32 = objc_claimAutoreleasedReturnValue();
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RestoreVersion"));
    v36 = objc_claimAutoreleasedReturnValue();
    restoreVersion = v5->_restoreVersion;
    v5->_restoreVersion = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TargetUpdateBridgeVersion"));
    v38 = objc_claimAutoreleasedReturnValue();
    targetUpdateBridgeVersion = v5->_targetUpdateBridgeVersion;
    v5->_targetUpdateBridgeVersion = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TargetUpdateSFRVersion"));
    v40 = objc_claimAutoreleasedReturnValue();
    targetUpdateSFRVersion = v5->_targetUpdateSFRVersion;
    v5->_targetUpdateSFRVersion = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TrainName"));
    v42 = objc_claimAutoreleasedReturnValue();
    trainName = v5->_trainName;
    v5->_trainName = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteBuild"));
    v44 = objc_claimAutoreleasedReturnValue();
    prerequisiteBuild = v5->_prerequisiteBuild;
    v5->_prerequisiteBuild = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteOSVersion"));
    v46 = objc_claimAutoreleasedReturnValue();
    prerequisiteOSVersion = v5->_prerequisiteOSVersion;
    v5->_prerequisiteOSVersion = (NSString *)v46;

    v48 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v50, CFSTR("SupportedDevices"));
    v51 = objc_claimAutoreleasedReturnValue();
    supportedDevices = v5->_supportedDevices;
    v5->_supportedDevices = (NSArray *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUDownloadSize"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suDownloadSize = objc_msgSend(v53, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnarchiveSize"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unarchivedSize = objc_msgSend(v54, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSUPrepareSize"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_msuPrepareSize = objc_msgSend(v55, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstallationSize"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installationSize = objc_msgSend(v56, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MinimumSystemPartitionSize"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumSystemPartitionSize = objc_msgSend(v57, "unsignedLongLongValue");

    v5->_streamingZipCapable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("StreamingZipCapable"));
    v58 = (void *)MEMORY[0x1E0C99E60];
    v141[0] = objc_opt_class();
    v141[1] = objc_opt_class();
    v141[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setWithArray:", v59);
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v139, CFSTR("SystemPartitionPadding"));
    v60 = objc_claimAutoreleasedReturnValue();
    systemPartitionPadding = v5->_systemPartitionPadding;
    v5->_systemPartitionPadding = (NSDictionary *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSUSRequiredSize"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preSUStagingRequiredSize = objc_msgSend(v62, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSUSOptionalSize"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preSUStagingOptionalSize = objc_msgSend(v63, "unsignedLongLongValue");

    v5->_autoDownloadAllowableOverCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AutoDownloadAllowableOverCellular"));
    v5->_downloadAllowableOverCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DownloadAllowableOverCellular"));
    v5->_downloadable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Downloadable"));
    v5->_disableSiriVoiceDeletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableSiriVoiceDeletion"));
    v5->_disableCDLevel4 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableCDLevel4"));
    v5->_disableAppDemotion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableAppDemotion"));
    v5->_disableInstallTonight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableInstallTonight"));
    v5->_forcePasscodeRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ForcePasscodeRequired"));
    v5->_rampEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RampEnabled"));
    v5->_granularlyRamped = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("GranularlyRamped"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MDMDelayInterval"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mdmDelayInterval = objc_msgSend(v64, "unsignedLongLongValue");

    v5->_autoUpdateEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AutoUpdateEnabled"));
    v5->_hideInstallAlert = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HideInstallAlert"));
    v5->_containsSFRContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ContainsSFRContent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstallAlertInterval"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installAlertInterval = objc_msgSend(v65, "unsignedLongLongValue");

    v5->_allowAutoDownloadOnBattery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowAutoDownloadOnBattery"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoDownloadOnBatteryDelay"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoDownloadOnBatteryDelay = objc_msgSend(v66, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoDownloadOnBatteryMinBattery"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoDownloadOnBatteryMinBattery = objc_msgSend(v67, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SetupCritical"));
    v68 = objc_claimAutoreleasedReturnValue();
    setupCritical = v5->_setupCritical;
    v5->_setupCritical = (NSString *)v68;

    v5->_criticalCellularOverride = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CriticalCellularOverride"));
    v5->_criticalOutOfBoxOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CriticalOutOfBoxOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastEmergencyBuild"));
    v70 = objc_claimAutoreleasedReturnValue();
    lastEmergencyBuild = v5->_lastEmergencyBuild;
    v5->_lastEmergencyBuild = (NSString *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastEmergencyOSVersion"));
    v72 = objc_claimAutoreleasedReturnValue();
    lastEmergencyOSVersion = v5->_lastEmergencyOSVersion;
    v5->_lastEmergencyOSVersion = (NSString *)v72;

    v5->_mandatoryUpdateEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MandatoryUpdateEligible"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MandatoryUpdateVersionMin"));
    v74 = objc_claimAutoreleasedReturnValue();
    mandatoryUpdateVersionMin = v5->_mandatoryUpdateVersionMin;
    v5->_mandatoryUpdateVersionMin = (NSString *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MandatoryUpdateVersionMax"));
    v76 = objc_claimAutoreleasedReturnValue();
    mandatoryUpdateVersionMax = v5->_mandatoryUpdateVersionMax;
    v5->_mandatoryUpdateVersionMax = (NSString *)v76;

    v5->_mandatoryUpdateOptional = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MandatoryUpdateOptional"));
    v5->_mandatoryUpdateRestrictedToOutOfTheBox = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MandatoryUpdateRestrictedToOutOfTheBox"));
    v5->_oneShotBuddyDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OneShotBuddyDisabled"));
    v78 = (void *)MEMORY[0x1E0C99E60];
    v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v80, CFSTR("OneShotBuddyDisabledBuilds"));
    v81 = objc_claimAutoreleasedReturnValue();
    oneShotBuddyDisabledBuilds = v5->_oneShotBuddyDisabledBuilds;
    v5->_oneShotBuddyDisabledBuilds = (NSArray *)v81;

    v5->_criticalUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CriticalUpdate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductType"));
    v83 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v83;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoInstallDelay"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoInstallDelay = objc_msgSend(v85, "unsignedLongLongValue");

    v5->_notifyAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotifyAfter"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MinimumBridgeVersion"));
    v86 = objc_claimAutoreleasedReturnValue();
    minimumBridgeVersion = v5->_minimumBridgeVersion;
    v5->_minimumBridgeVersion = (NSString *)v86;

    v5->_disableRosettaUpdates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableRosettaUpdates"));
    v5->_disableRecoveryOSUpdates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableRecoveryOSUpdates"));
    v5->_requireInstallAssistantUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequireInstallAssistantUpdate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SEPDigest"));
    v88 = objc_claimAutoreleasedReturnValue();
    sepDigest = v5->_sepDigest;
    v5->_sepDigest = (NSData *)v88;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SEPTBMDigests"));
    v90 = objc_claimAutoreleasedReturnValue();
    sepTBMDigests = v5->_sepTBMDigests;
    v5->_sepTBMDigests = (NSData *)v90;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RSEPDigest"));
    v92 = objc_claimAutoreleasedReturnValue();
    rsepDigest = v5->_rsepDigest;
    v5->_rsepDigest = (NSData *)v92;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RSEPTBMDigests"));
    v94 = objc_claimAutoreleasedReturnValue();
    rsepTBMDigests = v5->_rsepTBMDigests;
    v5->_rsepTBMDigests = (NSData *)v94;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationID"));
    v96 = objc_claimAutoreleasedReturnValue();
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v96;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Documentation"));
    v98 = objc_claimAutoreleasedReturnValue();
    documentation = v5->_documentation;
    v5->_documentation = (SUCoreDocumentation *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftwareUpdateURL"));
    v100 = objc_claimAutoreleasedReturnValue();
    softwareUpdateURL = v5->_softwareUpdateURL;
    v5->_softwareUpdateURL = (NSString *)v100;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Measurement"));
    v102 = objc_claimAutoreleasedReturnValue();
    measurement = v5->_measurement;
    v5->_measurement = (NSData *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MeasurementAlgorithm"));
    v104 = objc_claimAutoreleasedReturnValue();
    measurementAlgorithm = v5->_measurementAlgorithm;
    v5->_measurementAlgorithm = (NSString *)v104;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftwareUpdateAssetIdentifier"));
    v106 = objc_claimAutoreleasedReturnValue();
    softwareUpdateAssetIdentifier = v5->_softwareUpdateAssetIdentifier;
    v5->_softwareUpdateAssetIdentifier = (SUCoreMAIdentifier *)v106;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationAssetIdentifier"));
    v108 = objc_claimAutoreleasedReturnValue();
    documentationAssetIdentifier = v5->_documentationAssetIdentifier;
    v5->_documentationAssetIdentifier = (SUCoreMAIdentifier *)v108;

    v5->_promoteAlternateUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PromoteAlternateUpdate"));
    v5->_enableAlternateAssetAudience = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableAlternateAssetAudienceUUID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AlternateAssetAudienceUUID"));
    v110 = objc_claimAutoreleasedReturnValue();
    alternateAssetAudienceUUID = v5->_alternateAssetAudienceUUID;
    v5->_alternateAssetAudienceUUID = (NSString *)v110;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssetAudienceUUID"));
    v112 = objc_claimAutoreleasedReturnValue();
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSString *)v112;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateBrainPath"));
    v114 = objc_claimAutoreleasedReturnValue();
    updateBrainPath = v5->_updateBrainPath;
    v5->_updateBrainPath = (NSString *)v114;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateBundlePath"));
    v116 = objc_claimAutoreleasedReturnValue();
    updateBundlePath = v5->_updateBundlePath;
    v5->_updateBundlePath = (NSString *)v116;

    v5->_splatOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SplatOnly"));
    v5->_semiSplatEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SemiSplatEnabled"));
    v118 = (void *)MEMORY[0x1E0C99E60];
    v119 = objc_opt_class();
    objc_msgSend(v118, "setWithObjects:", v119, objc_opt_class(), 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v120, CFSTR("SemiSplatMustQuitApps"));
    v121 = objc_claimAutoreleasedReturnValue();
    semiSplatMustQuitApps = v5->_semiSplatMustQuitApps;
    v5->_semiSplatMustQuitApps = (NSArray *)v121;

    v5->_revoked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Revoked"));
    v5->_semiSplatRestartNow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SemiSplatRestartNow"));
    v5->_disableSplatCombo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableSplombo"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssociatedSplatDescriptor"));
    v123 = objc_claimAutoreleasedReturnValue();
    associatedSplatDescriptor = v5->_associatedSplatDescriptor;
    v5->_associatedSplatDescriptor = (SUCoreDescriptor *)v123;

    v125 = (void *)MEMORY[0x1E0C99E60];
    v126 = objc_opt_class();
    v127 = objc_opt_class();
    v128 = objc_opt_class();
    v129 = objc_opt_class();
    v130 = objc_opt_class();
    v131 = objc_opt_class();
    v132 = objc_opt_class();
    objc_msgSend(v125, "setWithObjects:", v126, v127, v128, v129, v130, v131, v132, objc_opt_class(), 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v133, CFSTR("BundleAttributes"));
    v134 = objc_claimAutoreleasedReturnValue();
    bundleAttributes = v5->_bundleAttributes;
    v5->_bundleAttributes = (NSDictionary *)v134;

    softwareUpdateAsset = v5->_softwareUpdateAsset;
    v5->_softwareUpdateAsset = 0;

    documentationAsset = v5->_documentationAsset;
    v5->_documentationAsset = 0;

    v5->_enablePreSUStaging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnablePSUS"));
    v5->_enablePreSUStagingForOptionalAssets = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnablePSUSForOptionalAssets"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;

  v65 = a3;
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor descriptorType](self, "descriptorType"), CFSTR("DescriptorType"));
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"), CFSTR("DescriptorAudienceType"));
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"), CFSTR("PreferredUpdateType"));
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor updateType](self, "updateType"), CFSTR("UpdateType"));
  -[SUCoreDescriptor assetID](self, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v4, CFSTR("AssetID"));

  -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v5, CFSTR("SoftwareUpdateAssetType"));

  -[SUCoreDescriptor documentationAssetType](self, "documentationAssetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v6, CFSTR("DocumentationAssetType"));

  -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](self, "softwareUpdateAssetAbsoluteID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v7, CFSTR("SoftwareUpdateAssetAbsoluteID"));

  -[SUCoreDescriptor documentationAssetAbsoluteID](self, "documentationAssetAbsoluteID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v8, CFSTR("DocumentationAssetAbsoluteID"));

  -[SUCoreDescriptor softwareUpdateAssetPurpose](self, "softwareUpdateAssetPurpose");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v9, CFSTR("SoftwareUpdateAssetPurpose"));

  -[SUCoreDescriptor documentationAssetPurpose](self, "documentationAssetPurpose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v10, CFSTR("DocumentationAssetPurpose"));

  -[SUCoreDescriptor uniqueBuildID](self, "uniqueBuildID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v11, CFSTR("UniqueBuildID"));

  -[SUCoreDescriptor productVersion](self, "productVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v12, CFSTR("ProductVersion"));

  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v13, CFSTR("ProductBuildVersion"));

  -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v14, CFSTR("ProductVersionExtra"));

  -[SUCoreDescriptor productSystemName](self, "productSystemName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v15, CFSTR("ProductSystemName"));

  -[SUCoreDescriptor releaseType](self, "releaseType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v16, CFSTR("ReleaseType"));

  -[SUCoreDescriptor publisher](self, "publisher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v17, CFSTR("Publisher"));

  -[SUCoreDescriptor releaseDate](self, "releaseDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v18, CFSTR("ReleaseDate"));

  -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v19, CFSTR("RestoreVersion"));

  -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v20, CFSTR("TargetUpdateBridgeVersion"));

  -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v21, CFSTR("TargetUpdateSFRVersion"));

  -[SUCoreDescriptor trainName](self, "trainName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v22, CFSTR("TrainName"));

  -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v23, CFSTR("PrerequisiteBuild"));

  -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v24, CFSTR("PrerequisiteOSVersion"));

  -[SUCoreDescriptor supportedDevices](self, "supportedDevices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v25, CFSTR("SupportedDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v26, CFSTR("SUDownloadSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_unarchivedSize);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v27, CFSTR("UnarchiveSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v28, CFSTR("MSUPrepareSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_installationSize);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v29, CFSTR("InstallationSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v30, CFSTR("MinimumSystemPartitionSize"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable"), CFSTR("StreamingZipCapable"));
  -[SUCoreDescriptor systemPartitionPadding](self, "systemPartitionPadding");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v31, CFSTR("SystemPartitionPadding"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v32, CFSTR("PSUSRequiredSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v33, CFSTR("PSUSOptionalSize"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor autoDownloadAllowableOverCellular](self, "autoDownloadAllowableOverCellular"), CFSTR("AutoDownloadAllowableOverCellular"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor downloadAllowableOverCellular](self, "downloadAllowableOverCellular"), CFSTR("DownloadAllowableOverCellular"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor downloadable](self, "downloadable"), CFSTR("Downloadable"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableSiriVoiceDeletion](self, "disableSiriVoiceDeletion"), CFSTR("DisableSiriVoiceDeletion"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableCDLevel4](self, "disableCDLevel4"), CFSTR("DisableCDLevel4"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableAppDemotion](self, "disableAppDemotion"), CFSTR("DisableAppDemotion"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableInstallTonight](self, "disableInstallTonight"), CFSTR("DisableInstallTonight"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor forcePasscodeRequired](self, "forcePasscodeRequired"), CFSTR("ForcePasscodeRequired"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor rampEnabled](self, "rampEnabled"), CFSTR("RampEnabled"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor granularlyRamped](self, "granularlyRamped"), CFSTR("GranularlyRamped"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v34, CFSTR("MDMDelayInterval"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"), CFSTR("AutoUpdateEnabled"));
  objc_msgSend(v65, "encodeInteger:forKey:", -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"), CFSTR("HideInstallAlert"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor containsSFRContent](self, "containsSFRContent"), CFSTR("ContainsSFRContent"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v35, CFSTR("InstallAlertInterval"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"), CFSTR("AllowAutoDownloadOnBattery"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v36, CFSTR("AutoDownloadOnBatteryDelay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v37, CFSTR("AutoDownloadOnBatteryMinBattery"));

  -[SUCoreDescriptor setupCritical](self, "setupCritical");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v38, CFSTR("SetupCritical"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride"), CFSTR("CriticalCellularOverride"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly"), CFSTR("CriticalOutOfBoxOnly"));
  -[SUCoreDescriptor lastEmergencyBuild](self, "lastEmergencyBuild");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v39, CFSTR("LastEmergencyBuild"));

  -[SUCoreDescriptor lastEmergencyOSVersion](self, "lastEmergencyOSVersion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v40, CFSTR("LastEmergencyOSVersion"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"), CFSTR("MandatoryUpdateEligible"));
  -[SUCoreDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v41, CFSTR("MandatoryUpdateVersionMin"));

  -[SUCoreDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v42, CFSTR("MandatoryUpdateVersionMax"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"), CFSTR("MandatoryUpdateOptional"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"), CFSTR("MandatoryUpdateRestrictedToOutOfTheBox"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor oneShotBuddyDisabled](self, "oneShotBuddyDisabled"), CFSTR("OneShotBuddyDisabled"));
  -[SUCoreDescriptor oneShotBuddyDisabledBuilds](self, "oneShotBuddyDisabledBuilds");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v43, CFSTR("OneShotBuddyDisabledBuilds"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor criticalUpdate](self, "criticalUpdate"), CFSTR("CriticalUpdate"));
  -[SUCoreDescriptor productType](self, "productType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v44, CFSTR("ProductType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor autoInstallDelay](self, "autoInstallDelay"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v45, CFSTR("AutoInstallDelay"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor notifyAfter](self, "notifyAfter"), CFSTR("NotifyAfter"));
  -[SUCoreDescriptor minimumBridgeVersion](self, "minimumBridgeVersion");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v46, CFSTR("MinimumBridgeVersion"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableRosettaUpdates](self, "disableRosettaUpdates"), CFSTR("DisableRosettaUpdates"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableRecoveryOSUpdates](self, "disableRecoveryOSUpdates"), CFSTR("DisableRecoveryOSUpdates"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor requireInstallAssistantUpdate](self, "requireInstallAssistantUpdate"), CFSTR("RequireInstallAssistantUpdate"));
  -[SUCoreDescriptor sepDigest](self, "sepDigest");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v47, CFSTR("SEPDigest"));

  -[SUCoreDescriptor sepTBMDigests](self, "sepTBMDigests");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v48, CFSTR("SEPTBMDigests"));

  -[SUCoreDescriptor rsepDigest](self, "rsepDigest");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v49, CFSTR("RSEPDigest"));

  -[SUCoreDescriptor rsepTBMDigests](self, "rsepTBMDigests");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v50, CFSTR("RSEPTBMDigests"));

  -[SUCoreDescriptor documentationID](self, "documentationID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v51, CFSTR("DocumentationID"));

  -[SUCoreDescriptor documentation](self, "documentation");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v52, CFSTR("Documentation"));

  -[SUCoreDescriptor softwareUpdateURL](self, "softwareUpdateURL");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v53, CFSTR("SoftwareUpdateURL"));

  -[SUCoreDescriptor measurement](self, "measurement");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v54, CFSTR("Measurement"));

  -[SUCoreDescriptor measurementAlgorithm](self, "measurementAlgorithm");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v55, CFSTR("MeasurementAlgorithm"));

  -[SUCoreDescriptor softwareUpdateAssetIdentifier](self, "softwareUpdateAssetIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v56, CFSTR("SoftwareUpdateAssetIdentifier"));

  -[SUCoreDescriptor documentationAssetIdentifier](self, "documentationAssetIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v57, CFSTR("DocumentationAssetIdentifier"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"), CFSTR("PromoteAlternateUpdate"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor enableAlternateAssetAudience](self, "enableAlternateAssetAudience"), CFSTR("EnableAlternateAssetAudienceUUID"));
  -[SUCoreDescriptor alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v58, CFSTR("AlternateAssetAudienceUUID"));

  -[SUCoreDescriptor assetAudienceUUID](self, "assetAudienceUUID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v59, CFSTR("AssetAudienceUUID"));

  -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v60, CFSTR("UpdateBrainPath"));

  -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v61, CFSTR("UpdateBundlePath"));

  -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v62, CFSTR("BundleAttributes"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor splatOnly](self, "splatOnly"), CFSTR("SplatOnly"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled"), CFSTR("SemiSplatEnabled"));
  -[SUCoreDescriptor semiSplatMustQuitApps](self, "semiSplatMustQuitApps");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v63, CFSTR("SemiSplatMustQuitApps"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor revoked](self, "revoked"), CFSTR("Revoked"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor semiSplatRestartNow](self, "semiSplatRestartNow"), CFSTR("SemiSplatRestartNow"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo"), CFSTR("DisableSplombo"));
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "encodeObject:forKey:", v64, CFSTR("AssociatedSplatDescriptor"));

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging"), CFSTR("EnablePSUS"));
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"), CFSTR("EnablePSUSForOptionalAssets"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreDescriptor *v4;
  SUCoreDescriptor *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;

  v4 = (SUCoreDescriptor *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCoreDescriptor descriptorType](self, "descriptorType");
      if (v6 == -[SUCoreDescriptor descriptorType](v5, "descriptorType"))
      {
        -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreDescriptor associatedSplatDescriptor](v5, "associatedSplatDescriptor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqual:", v9);

          if ((v10 & 1) != 0)
          {
LABEL_6:
            if (-[SUCoreDescriptor descriptorType](self, "descriptorType") == 2
              || -[SUCoreDescriptor descriptorType](self, "descriptorType") == 4)
            {
              v11 = (void *)MEMORY[0x1E0DA8920];
              -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreDescriptor updateBrainPath](v5, "updateBrainPath");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "stringIsEqual:to:", v12, v13))
              {
                v14 = (void *)MEMORY[0x1E0DA8920];
                -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCoreDescriptor updateBundlePath](v5, "updateBundlePath");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v14, "stringIsEqual:to:", v15, v16);

LABEL_25:
                goto LABEL_26;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(&unk_1EA89AB90, "containsObject:", v19);

              if (v20)
              {
                v21 = (void *)MEMORY[0x1E0DA8920];
                -[SUCoreDescriptor productVersion](self, "productVersion");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCoreDescriptor productVersion](v5, "productVersion");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "stringIsEqual:to:", v12, v13))
                {
                  v22 = (void *)MEMORY[0x1E0DA8920];
                  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SUCoreDescriptor productBuildVersion](v5, "productBuildVersion");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v22, "stringIsEqual:to:", v23, v24))
                  {
                    v25 = (void *)MEMORY[0x1E0DA8920];
                    -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SUCoreDescriptor productVersionExtra](v5, "productVersionExtra");
                    v57 = objc_claimAutoreleasedReturnValue();
                    v58 = v26;
                    if (objc_msgSend(v25, "stringIsEqual:to:", v26))
                    {
                      v27 = (void *)MEMORY[0x1E0DA8920];
                      -[SUCoreDescriptor releaseType](self, "releaseType");
                      v28 = objc_claimAutoreleasedReturnValue();
                      -[SUCoreDescriptor releaseType](v5, "releaseType");
                      v29 = objc_claimAutoreleasedReturnValue();
                      v30 = v27;
                      v31 = (void *)v28;
                      v56 = (void *)v29;
                      if (objc_msgSend(v30, "stringIsEqual:to:", v28))
                      {
                        v53 = (void *)v28;
                        v32 = (void *)MEMORY[0x1E0DA8920];
                        -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
                        v33 = objc_claimAutoreleasedReturnValue();
                        -[SUCoreDescriptor restoreVersion](v5, "restoreVersion");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        v55 = (void *)v33;
                        if (objc_msgSend(v32, "stringIsEqual:to:", v33))
                        {
                          v51 = (void *)MEMORY[0x1E0DA8920];
                          -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
                          v34 = objc_claimAutoreleasedReturnValue();
                          -[SUCoreDescriptor targetUpdateBridgeVersion](v5, "targetUpdateBridgeVersion");
                          v35 = objc_claimAutoreleasedReturnValue();
                          v36 = v51;
                          v50 = (void *)v35;
                          v52 = (void *)v34;
                          if (objc_msgSend(v36, "stringIsEqual:to:", v34))
                          {
                            v48 = (void *)MEMORY[0x1E0DA8920];
                            -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
                            v37 = objc_claimAutoreleasedReturnValue();
                            -[SUCoreDescriptor targetUpdateSFRVersion](v5, "targetUpdateSFRVersion");
                            v38 = objc_claimAutoreleasedReturnValue();
                            v39 = v48;
                            v47 = (void *)v38;
                            v49 = (void *)v37;
                            if (objc_msgSend(v39, "stringIsEqual:to:", v37))
                            {
                              v40 = (void *)MEMORY[0x1E0DA8920];
                              -[SUCoreDescriptor trainName](self, "trainName");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SUCoreDescriptor trainName](v5, "trainName");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              v17 = objc_msgSend(v40, "stringIsEqual:to:", v41, v42);

                            }
                            else
                            {
                              v17 = 0;
                            }

                          }
                          else
                          {
                            v17 = 0;
                          }
                          v46 = (void *)v57;
                          v26 = v58;
                          v31 = v53;

                        }
                        else
                        {
                          v17 = 0;
                          v46 = (void *)v57;
                          v26 = v58;
                          v31 = v53;
                        }

                      }
                      else
                      {
                        v17 = 0;
                        v46 = (void *)v57;
                        v26 = v58;
                      }

                    }
                    else
                    {
                      v17 = 0;
                      v46 = (void *)v57;
                    }

                  }
                  else
                  {
                    v17 = 0;
                  }

                  goto LABEL_25;
                }
              }
              else
              {
                v43 = objc_alloc(MEMORY[0x1E0CB3940]);
                +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("Unexpected descriptor type %@"), v44);

                objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("DescriptorIsEqual"), v12, 8116, 0);
              }
            }
            v17 = 0;
            goto LABEL_25;
          }
        }
        else
        {
          -[SUCoreDescriptor associatedSplatDescriptor](v5, "associatedSplatDescriptor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            goto LABEL_6;
        }
      }
      v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v17 = 0;
  }
LABEL_27:

  return v17;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  const __CFString *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;

  if (-[SUCoreDescriptor descriptorType](self, "descriptorType") == 2
    || -[SUCoreDescriptor descriptorType](self, "descriptorType") == 4)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\n[>>>\n    descriptorType: %@\n   updateBrainPath: %@\n  updateBundlePath: %@\n  bundleAttributes: %@\n<<<]"), v4, v5, v6, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(&unk_1EA89ABA8, "containsObject:", v10);

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v11)
    {
      +[SUCoreDescriptor nameForDescriptorAudienceType:](SUCoreDescriptor, "nameForDescriptorAudienceType:", -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v12;
      if (-[SUCoreDescriptor notificationEnabled](self, "notificationEnabled"))
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v58 = v15;
      -[SUCoreDescriptor notificationTitleString](self, "notificationTitleString");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor notificationBodyString](self, "notificationBodyString");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor recommendedUpdateEnabled](self, "recommendedUpdateEnabled"))
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v57 = v16;
      if (-[SUCoreDescriptor recommendedUpdateApplicable](self, "recommendedUpdateApplicable"))
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v56 = v17;
      -[SUCoreDescriptor recommendedUpdateNotificationFrequencyDays](self, "recommendedUpdateNotificationFrequencyDays");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor recommendedUpdateMinOSVersion](self, "recommendedUpdateMinOSVersion");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor recommendedUpdateMaxOSVersion](self, "recommendedUpdateMaxOSVersion");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor recommendedUpdateTitleString](self, "recommendedUpdateTitleString");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor recommendedUpdateAlertBodyString](self, "recommendedUpdateAlertBodyString");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor mandatoryUpdateBodyString](self, "mandatoryUpdateBodyString");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor updateTypeName](self, "updateTypeName");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor assetID](self, "assetID");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationAssetType](self, "documentationAssetType");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](self, "softwareUpdateAssetAbsoluteID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationAssetAbsoluteID](self, "documentationAssetAbsoluteID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetPurpose](self, "softwareUpdateAssetPurpose");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationAssetPurpose](self, "documentationAssetPurpose");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"))
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      v55 = v18;
      if (-[SUCoreDescriptor enableAlternateAssetAudience](self, "enableAlternateAssetAudience"))
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      v54 = v19;
      -[SUCoreDescriptor alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor assetAudienceUUID](self, "assetAudienceUUID");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor uniqueBuildID](self, "uniqueBuildID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor trainName](self, "trainName");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productVersion](self, "productVersion");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productVersionExtra](self, "productVersionExtra");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor productSystemName](self, "productSystemName");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor releaseType](self, "releaseType");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor publisher](self, "publisher");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor releaseDate](self, "releaseDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor supportedDevices](self, "supportedDevices");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor fullReplacement](self, "fullReplacement"))
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      v47 = v20;
      v46 = -[SUCoreDescriptor downloadSize](self, "downloadSize");
      v45 = -[SUCoreDescriptor unarchivedSize](self, "unarchivedSize");
      v44 = -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize");
      v43 = -[SUCoreDescriptor preparationSize](self, "preparationSize");
      v42 = -[SUCoreDescriptor installationSize](self, "installationSize");
      v41 = -[SUCoreDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize");
      v40 = -[SUCoreDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
      if (-[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      v39 = v21;
      -[SUCoreDescriptor systemPartitionPadding](self, "systemPartitionPadding");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
      v36 = -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize");
      v35 = -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
      if (-[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging"))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v34 = v22;
      if (-[SUCoreDescriptor enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v33 = v23;
      -[SUCoreDescriptor autoDownloadAllowableOverCellular](self, "autoDownloadAllowableOverCellular");
      -[SUCoreDescriptor downloadAllowableOverCellular](self, "downloadAllowableOverCellular");
      -[SUCoreDescriptor downloadable](self, "downloadable");
      -[SUCoreDescriptor disableSiriVoiceDeletion](self, "disableSiriVoiceDeletion");
      -[SUCoreDescriptor disableCDLevel4](self, "disableCDLevel4");
      -[SUCoreDescriptor disableAppDemotion](self, "disableAppDemotion");
      -[SUCoreDescriptor disableInstallTonight](self, "disableInstallTonight");
      -[SUCoreDescriptor forcePasscodeRequired](self, "forcePasscodeRequired");
      -[SUCoreDescriptor rampEnabled](self, "rampEnabled");
      -[SUCoreDescriptor granularlyRamped](self, "granularlyRamped");
      -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval");
      -[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled");
      objc_msgSend(MEMORY[0x1E0DA8920], "stringFromTriState:", -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor containsSFRContent](self, "containsSFRContent");
      -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval");
      -[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery");
      -[SUCoreDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay");
      -[SUCoreDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery");
      -[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo");
      -[SUCoreDescriptor setupCritical](self, "setupCritical");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride");
      -[SUCoreDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly");
      -[SUCoreDescriptor lastEmergencyBuild](self, "lastEmergencyBuild");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor lastEmergencyOSVersion](self, "lastEmergencyOSVersion");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible");
      -[SUCoreDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional");
      -[SUCoreDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox");
      -[SUCoreDescriptor oneShotBuddyDisabled](self, "oneShotBuddyDisabled");
      -[SUCoreDescriptor oneShotBuddyDisabledBuilds](self, "oneShotBuddyDisabledBuilds");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor criticalUpdate](self, "criticalUpdate");
      -[SUCoreDescriptor productType](self, "productType");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor autoInstallDelay](self, "autoInstallDelay");
      -[SUCoreDescriptor notifyAfter](self, "notifyAfter");
      -[SUCoreDescriptor minimumBridgeVersion](self, "minimumBridgeVersion");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor disableRosettaUpdates](self, "disableRosettaUpdates");
      -[SUCoreDescriptor disableRecoveryOSUpdates](self, "disableRecoveryOSUpdates");
      -[SUCoreDescriptor requireInstallAssistantUpdate](self, "requireInstallAssistantUpdate");
      -[SUCoreDescriptor sepDigest](self, "sepDigest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor sepTBMDigests](self, "sepTBMDigests");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor rsepDigest](self, "rsepDigest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor rsepTBMDigests](self, "rsepTBMDigests");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentationID](self, "documentationID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor documentation](self, "documentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateURL](self, "softwareUpdateURL");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor measurement](self, "measurement");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor measurementAlgorithm](self, "measurementAlgorithm");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor bundleAttributes](self, "bundleAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor splatOnly](self, "splatOnly");
      -[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled");
      -[SUCoreDescriptor semiSplatMustQuitApps](self, "semiSplatMustQuitApps");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor revoked](self, "revoked");
      -[SUCoreDescriptor semiSplatRestartNow](self, "semiSplatRestartNow");
      -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v59, "initWithFormat:", &cfstr_Descriptortype_1, v14, v104, v103, v102, v101, v100, v99, v58, v98, v97, v57, v56, v96, v95, v94, v93,
                     v92,
                     v91,
                     v90,
                     v89,
                     v88,
                     v87,
                     v86,
                     v85,
                     v84,
                     v83,
                     v55,
                     v54,
                     v82,
                     v81,
                     v80,
                     v79,
                     v78,
                     v77,
                     v76,
                     v75,
                     v74,
                     v73,
                     v72,
                     v53,
                     v52,
                     v51,
                     v50,
                     v49,
                     v48,
                     v47,
                     v46,
                     v45,
                     v44,
                     v43,
                     v42,
                     v41,
                     v40,
                     v39,
                     v38,
                     v37,
                     v36,
                     v35,
                     v34,
                     v33);

      v4 = v14;
    }
    else
    {
      v8 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Unexpected descriptor type %@"), v13);

      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("DescriptorDescription"), v8, 8116, 0);
    }
  }

  return v8;
}

- (id)overview
{
  return -[SUCoreDescriptor overviewWithMaxValueLength:providingSubstitutionMap:](self, "overviewWithMaxValueLength:providingSubstitutionMap:", 0, 0);
}

- (id)overviewWithMaxValueLength:(unint64_t)a3 providingSubstitutionMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  unint64_t v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;

  v6 = a4;
  if (-[SUCoreDescriptor descriptorType](self, "descriptorType") == 2
    || -[SUCoreDescriptor descriptorType](self, "descriptorType") == 4)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DA8920];
    -[SUCoreDescriptor updateBrainPath](self, "updateBrainPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "limitString:toMaxLength:providingSubstitutionMap:", v10, a3, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DA8920];
    -[SUCoreDescriptor updateBundlePath](self, "updateBundlePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "limitString:toMaxLength:providingSubstitutionMap:", v13, a3, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("\n[>>>\n    descriptorType: %@\n   updateBrainPath: %@\n  updateBundlePath: %@\n<<<]"), v8, v11, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(&unk_1EA89ABC0, "containsObject:", v17);

    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    v20 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v20;
    if (v18)
    {
      +[SUCoreDescriptor nameForDescriptorAudienceType:](SUCoreDescriptor, "nameForDescriptorAudienceType:", -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "limitString:toMaxLength:providingSubstitutionMap:", v95, a3, v6);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "limitString:toMaxLength:providingSubstitutionMap:", v94, a3, v6);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "limitString:toMaxLength:providingSubstitutionMap:", v93, a3, v6);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor humanReadableMoreInfoLink](self, "humanReadableMoreInfoLink");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "limitString:toMaxLength:providingSubstitutionMap:", v92, a3, v6);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor updateTypeName](self, "updateTypeName");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "limitString:toMaxLength:providingSubstitutionMap:", v91, a3, v6);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor productVersion](self, "productVersion");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "limitString:toMaxLength:providingSubstitutionMap:", v90, a3, v6);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "limitString:toMaxLength:providingSubstitutionMap:", v89, a3, v6);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor restoreVersion](self, "restoreVersion");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "limitString:toMaxLength:providingSubstitutionMap:", v88, a3, v6);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor targetUpdateBridgeVersion](self, "targetUpdateBridgeVersion");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "limitString:toMaxLength:providingSubstitutionMap:", v87, a3, v6);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor targetUpdateSFRVersion](self, "targetUpdateSFRVersion");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "limitString:toMaxLength:providingSubstitutionMap:", v86, a3, v6);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor releaseType](self, "releaseType");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "limitString:toMaxLength:providingSubstitutionMap:", v85, a3, v6);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor releaseDate](self, "releaseDate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "description");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "limitString:toMaxLength:providingSubstitutionMap:", v83, a3, v6);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor prerequisiteBuild](self, "prerequisiteBuild");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "limitString:toMaxLength:providingSubstitutionMap:", v82, a3, v6);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor prerequisiteOSVersion](self, "prerequisiteOSVersion");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "limitString:toMaxLength:providingSubstitutionMap:", v81, a3, v6);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = -[SUCoreDescriptor downloadSize](self, "downloadSize");
      v79 = -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize");
      v78 = -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize");
      v77 = -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize");
      v76 = -[SUCoreDescriptor unarchivedSize](self, "unarchivedSize");
      v75 = -[SUCoreDescriptor preparationSize](self, "preparationSize");
      v73 = -[SUCoreDescriptor installationSize](self, "installationSize");
      v72 = -[SUCoreDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
      v35 = CFSTR("YES");
      if (-[SUCoreDescriptor rampEnabled](self, "rampEnabled"))
        v36 = CFSTR("YES");
      else
        v36 = CFSTR("NO");
      v71 = v36;
      if (-[SUCoreDescriptor granularlyRamped](self, "granularlyRamped"))
        v37 = CFSTR("YES");
      else
        v37 = CFSTR("NO");
      v69 = v37;
      v68 = -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval");
      if (-[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"))
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      v67 = v38;
      objc_msgSend(MEMORY[0x1E0DA8920], "stringFromTriState:", -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor containsSFRContent](self, "containsSFRContent"))
        v39 = CFSTR("YES");
      else
        v39 = CFSTR("NO");
      v65 = v39;
      v63 = -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval");
      if (-[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"))
        v40 = CFSTR("YES");
      else
        v40 = CFSTR("NO");
      v61 = v40;
      if (-[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo"))
        v41 = CFSTR("YES");
      else
        v41 = CFSTR("NO");
      v59 = v41;
      v42 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor setupCritical](self, "setupCritical");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "limitString:toMaxLength:providingSubstitutionMap:", v74, a3, v6);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor documentationID](self, "documentationID");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "limitString:toMaxLength:providingSubstitutionMap:", v70, a3, v6);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor softwareUpdateURL](self, "softwareUpdateURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "limitString:toMaxLength:providingSubstitutionMap:", v66, a3, v6);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor measurement](self, "measurement");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "description");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "limitString:toMaxLength:providingSubstitutionMap:", v62, a3, v6);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor measurementAlgorithm](self, "measurementAlgorithm");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "limitString:toMaxLength:providingSubstitutionMap:", v57, a3, v6);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCoreDescriptor splatOnly](self, "splatOnly"))
        v47 = CFSTR("YES");
      else
        v47 = CFSTR("NO");
      v53 = v19;
      if (-[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled"))
        v48 = CFSTR("YES");
      else
        v48 = CFSTR("NO");
      if (!-[SUCoreDescriptor revoked](self, "revoked"))
        v35 = CFSTR("NO");
      v49 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "humanReadableUpdateName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "limitString:toMaxLength:providingSubstitutionMap:", v50, a3, v6);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v53, "initWithFormat:", CFSTR("\n[>>>\n             descriptorType: %@\n     descriptorAudienceType: %@\n        preferredUpdateType: %@\n    humanReadableUpdateName: %@\n   humanReadableUpdateTitle: %@\n humanReadableUpdateVersion: %@\n  humanReadableMoreInfoLink: %@\n                 updateType: %@\n             productVersion: %@\n        productBuildVersion: %@\n             restoreVersion: %@\n  targetUpdateBridgeVersion: %@\n     targetUpdateSFRVersion: %@\n                releaseType: %@\n                releaseDate: %@\n          prerequisiteBuild: %@\n      prerequisiteOSVersion: %@\n               downloadSize: %llu\n     psusRequiredAssetsSize: %llu\n     psusOptionalAssetsSize: %llu\n             suDownloadSize: %llu\n             unarchivedSize: %llu\n            preparationSize: %llu\n           installationSize: %llu\n     totalRequiredFreeSpace: %llu\n                rampEnabled: %@\n           granularlyRamped: %@\n           mdmDelayInterval: %llu\n          autoUpdateEnabled: %@\n           hideInstallAlert: %@\n         containsSFRContent: %@\n       installAlertInterval: %llu\n allowAutoDownloadOnBattery: %@\n             disableSplombo: %@\n              setupCritical: %@\n            documentationID: %@\n          softwareUpdateURL: %@\n                measurement: %@\n       measurementAlgorithm: %@\n                  splatOnly: %@\n           semiSplatEnabled: %@\n                    revoked: %@\n  associatedSplatDescriptor: %@\n<<<]"), v8, v112, v111, v110, v109, v108, v107, v106, v105, v104, v103, v102, v101, v100, v99, v98,
                      v97,
                      v80,
                      v79,
                      v78,
                      v77,
                      v76,
                      v75,
                      v73,
                      v72,
                      v71,
                      v69,
                      v68,
                      v67,
                      v96,
                      v65,
                      v63,
                      v61,
                      v59,
                      v60,
                      v58,
                      v56,
                      v55,
                      v52,
                      v47,
                      v48,
                      v35,
                      v51);

    }
    else
    {
      v15 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("Unexpected descriptor type %@"), v20);

      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("DescriptorOverview"), v15, 8116, 0);
    }
  }

  return v15;
}

- (id)summary
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;

  -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain")))
  {

LABEL_4:
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@"), v7);
    goto LABEL_11;
  }
  -[SUCoreDescriptor softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileAsset.MobileSoftwareUpdate.MacUpdateBrain"));

  if (v5)
    goto LABEL_4;
  -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor releaseType](self, "releaseType");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("Customer");
  if (v12)
    v14 = (const __CFString *)v12;
  if (v9)
    v15 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ %@ (SplatCombo) (%@)"), v7, v11, v14);
  else
    v15 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ %@ (%@)"), v7, v11, v14);
  v8 = (void *)v15;

LABEL_11:
  return v8;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void)setProductSystemName:(id)a3
{
  objc_storeStrong((id *)&self->_productSystemName, a3);
}

- (int64_t)descriptorType
{
  return self->_descriptorType;
}

- (void)setDescriptorType:(int64_t)a3
{
  self->_descriptorType = a3;
}

- (int64_t)descriptorAudienceType
{
  return self->_descriptorAudienceType;
}

- (void)setDescriptorAudienceType:(int64_t)a3
{
  self->_descriptorAudienceType = a3;
}

- (int64_t)preferredUpdateType
{
  return self->_preferredUpdateType;
}

- (void)setPreferredUpdateType:(int64_t)a3
{
  self->_preferredUpdateType = a3;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int64_t)a3
{
  self->_updateType = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (NSString)uniqueBuildID
{
  return self->_uniqueBuildID;
}

- (void)setUniqueBuildID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueBuildID, a3);
}

- (NSString)softwareUpdateAssetType
{
  return self->_softwareUpdateAssetType;
}

- (void)setSoftwareUpdateAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAssetType, a3);
}

- (NSString)documentationAssetType
{
  return self->_documentationAssetType;
}

- (void)setDocumentationAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAssetType, a3);
}

- (MAAbsoluteAssetId)softwareUpdateAssetAbsoluteID
{
  return self->_softwareUpdateAssetAbsoluteID;
}

- (void)setSoftwareUpdateAssetAbsoluteID:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAssetAbsoluteID, a3);
}

- (MAAbsoluteAssetId)documentationAssetAbsoluteID
{
  return self->_documentationAssetAbsoluteID;
}

- (void)setDocumentationAssetAbsoluteID:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAssetAbsoluteID, a3);
}

- (NSString)softwareUpdateAssetPurpose
{
  return self->_softwareUpdateAssetPurpose;
}

- (void)setSoftwareUpdateAssetPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAssetPurpose, a3);
}

- (NSString)documentationAssetPurpose
{
  return self->_documentationAssetPurpose;
}

- (void)setDocumentationAssetPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAssetPurpose, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productBuildVersion, a3);
}

- (NSString)productVersionExtra
{
  return self->_productVersionExtra;
}

- (void)setProductVersionExtra:(id)a3
{
  objc_storeStrong((id *)&self->_productVersionExtra, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersion, a3);
}

- (NSString)targetUpdateBridgeVersion
{
  return self->_targetUpdateBridgeVersion;
}

- (void)setTargetUpdateBridgeVersion:(id)a3
{
  objc_storeStrong((id *)&self->_targetUpdateBridgeVersion, a3);
}

- (NSString)targetUpdateSFRVersion
{
  return self->_targetUpdateSFRVersion;
}

- (void)setTargetUpdateSFRVersion:(id)a3
{
  objc_storeStrong((id *)&self->_targetUpdateSFRVersion, a3);
}

- (NSString)trainName
{
  return self->_trainName;
}

- (void)setTrainName:(id)a3
{
  objc_storeStrong((id *)&self->_trainName, a3);
}

- (NSString)prerequisiteBuild
{
  return self->_prerequisiteBuild;
}

- (void)setPrerequisiteBuild:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteBuild, a3);
}

- (NSString)prerequisiteOSVersion
{
  return self->_prerequisiteOSVersion;
}

- (void)setPrerequisiteOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteOSVersion, a3);
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (void)setSupportedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_supportedDevices, a3);
}

- (void)setUnarchivedSize:(unint64_t)a3
{
  self->_unarchivedSize = a3;
}

- (unint64_t)msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)setMsuPrepareSize:(unint64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (void)setInstallationSize:(unint64_t)a3
{
  self->_installationSize = a3;
}

- (unint64_t)minimumSystemPartitionSize
{
  return self->_minimumSystemPartitionSize;
}

- (void)setMinimumSystemPartitionSize:(unint64_t)a3
{
  self->_minimumSystemPartitionSize = a3;
}

- (BOOL)streamingZipCapable
{
  return self->_streamingZipCapable;
}

- (void)setStreamingZipCapable:(BOOL)a3
{
  self->_streamingZipCapable = a3;
}

- (NSDictionary)systemPartitionPadding
{
  return self->_systemPartitionPadding;
}

- (void)setSystemPartitionPadding:(id)a3
{
  objc_storeStrong((id *)&self->_systemPartitionPadding, a3);
}

- (unint64_t)preSUStagingRequiredSize
{
  return self->_preSUStagingRequiredSize;
}

- (void)setPreSUStagingRequiredSize:(unint64_t)a3
{
  self->_preSUStagingRequiredSize = a3;
}

- (unint64_t)preSUStagingOptionalSize
{
  return self->_preSUStagingOptionalSize;
}

- (void)setPreSUStagingOptionalSize:(unint64_t)a3
{
  self->_preSUStagingOptionalSize = a3;
}

- (unint64_t)suDownloadSize
{
  return self->_suDownloadSize;
}

- (void)setSuDownloadSize:(unint64_t)a3
{
  self->_suDownloadSize = a3;
}

- (BOOL)autoDownloadAllowableOverCellular
{
  return self->_autoDownloadAllowableOverCellular;
}

- (void)setAutoDownloadAllowableOverCellular:(BOOL)a3
{
  self->_autoDownloadAllowableOverCellular = a3;
}

- (BOOL)downloadAllowableOverCellular
{
  return self->_downloadAllowableOverCellular;
}

- (void)setDownloadAllowableOverCellular:(BOOL)a3
{
  self->_downloadAllowableOverCellular = a3;
}

- (BOOL)downloadable
{
  return self->_downloadable;
}

- (void)setDownloadable:(BOOL)a3
{
  self->_downloadable = a3;
}

- (BOOL)disableSiriVoiceDeletion
{
  return self->_disableSiriVoiceDeletion;
}

- (void)setDisableSiriVoiceDeletion:(BOOL)a3
{
  self->_disableSiriVoiceDeletion = a3;
}

- (BOOL)disableCDLevel4
{
  return self->_disableCDLevel4;
}

- (void)setDisableCDLevel4:(BOOL)a3
{
  self->_disableCDLevel4 = a3;
}

- (BOOL)disableAppDemotion
{
  return self->_disableAppDemotion;
}

- (void)setDisableAppDemotion:(BOOL)a3
{
  self->_disableAppDemotion = a3;
}

- (BOOL)disableInstallTonight
{
  return self->_disableInstallTonight;
}

- (void)setDisableInstallTonight:(BOOL)a3
{
  self->_disableInstallTonight = a3;
}

- (BOOL)forcePasscodeRequired
{
  return self->_forcePasscodeRequired;
}

- (void)setForcePasscodeRequired:(BOOL)a3
{
  self->_forcePasscodeRequired = a3;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (BOOL)granularlyRamped
{
  return self->_granularlyRamped;
}

- (void)setGranularlyRamped:(BOOL)a3
{
  self->_granularlyRamped = a3;
}

- (unint64_t)mdmDelayInterval
{
  return self->_mdmDelayInterval;
}

- (void)setMdmDelayInterval:(unint64_t)a3
{
  self->_mdmDelayInterval = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (int64_t)hideInstallAlert
{
  return self->_hideInstallAlert;
}

- (void)setHideInstallAlert:(int64_t)a3
{
  self->_hideInstallAlert = a3;
}

- (BOOL)containsSFRContent
{
  return self->_containsSFRContent;
}

- (void)setContainsSFRContent:(BOOL)a3
{
  self->_containsSFRContent = a3;
}

- (unint64_t)installAlertInterval
{
  return self->_installAlertInterval;
}

- (void)setInstallAlertInterval:(unint64_t)a3
{
  self->_installAlertInterval = a3;
}

- (BOOL)allowAutoDownloadOnBattery
{
  return self->_allowAutoDownloadOnBattery;
}

- (void)setAllowAutoDownloadOnBattery:(BOOL)a3
{
  self->_allowAutoDownloadOnBattery = a3;
}

- (unint64_t)autoDownloadOnBatteryDelay
{
  return self->_autoDownloadOnBatteryDelay;
}

- (void)setAutoDownloadOnBatteryDelay:(unint64_t)a3
{
  self->_autoDownloadOnBatteryDelay = a3;
}

- (unint64_t)autoDownloadOnBatteryMinBattery
{
  return self->_autoDownloadOnBatteryMinBattery;
}

- (void)setAutoDownloadOnBatteryMinBattery:(unint64_t)a3
{
  self->_autoDownloadOnBatteryMinBattery = a3;
}

- (NSString)setupCritical
{
  return self->_setupCritical;
}

- (void)setSetupCritical:(id)a3
{
  objc_storeStrong((id *)&self->_setupCritical, a3);
}

- (BOOL)criticalCellularOverride
{
  return self->_criticalCellularOverride;
}

- (void)setCriticalCellularOverride:(BOOL)a3
{
  self->_criticalCellularOverride = a3;
}

- (BOOL)criticalOutOfBoxOnly
{
  return self->_criticalOutOfBoxOnly;
}

- (void)setCriticalOutOfBoxOnly:(BOOL)a3
{
  self->_criticalOutOfBoxOnly = a3;
}

- (NSString)lastEmergencyBuild
{
  return self->_lastEmergencyBuild;
}

- (void)setLastEmergencyBuild:(id)a3
{
  objc_storeStrong((id *)&self->_lastEmergencyBuild, a3);
}

- (NSString)lastEmergencyOSVersion
{
  return self->_lastEmergencyOSVersion;
}

- (void)setLastEmergencyOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_lastEmergencyOSVersion, a3);
}

- (BOOL)mandatoryUpdateEligible
{
  return self->_mandatoryUpdateEligible;
}

- (void)setMandatoryUpdateEligible:(BOOL)a3
{
  self->_mandatoryUpdateEligible = a3;
}

- (NSString)mandatoryUpdateVersionMin
{
  return self->_mandatoryUpdateVersionMin;
}

- (void)setMandatoryUpdateVersionMin:(id)a3
{
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, a3);
}

- (NSString)mandatoryUpdateVersionMax
{
  return self->_mandatoryUpdateVersionMax;
}

- (void)setMandatoryUpdateVersionMax:(id)a3
{
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, a3);
}

- (BOOL)mandatoryUpdateOptional
{
  return self->_mandatoryUpdateOptional;
}

- (void)setMandatoryUpdateOptional:(BOOL)a3
{
  self->_mandatoryUpdateOptional = a3;
}

- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox
{
  return self->_mandatoryUpdateRestrictedToOutOfTheBox;
}

- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3
{
  self->_mandatoryUpdateRestrictedToOutOfTheBox = a3;
}

- (BOOL)oneShotBuddyDisabled
{
  return self->_oneShotBuddyDisabled;
}

- (NSArray)oneShotBuddyDisabledBuilds
{
  return self->_oneShotBuddyDisabledBuilds;
}

- (BOOL)criticalUpdate
{
  return self->_criticalUpdate;
}

- (void)setCriticalUpdate:(BOOL)a3
{
  self->_criticalUpdate = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (unint64_t)autoInstallDelay
{
  return self->_autoInstallDelay;
}

- (void)setAutoInstallDelay:(unint64_t)a3
{
  self->_autoInstallDelay = a3;
}

- (BOOL)notifyAfter
{
  return self->_notifyAfter;
}

- (void)setNotifyAfter:(BOOL)a3
{
  self->_notifyAfter = a3;
}

- (NSString)minimumBridgeVersion
{
  return self->_minimumBridgeVersion;
}

- (void)setMinimumBridgeVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minimumBridgeVersion, a3);
}

- (BOOL)disableRosettaUpdates
{
  return self->_disableRosettaUpdates;
}

- (void)setDisableRosettaUpdates:(BOOL)a3
{
  self->_disableRosettaUpdates = a3;
}

- (BOOL)disableRecoveryOSUpdates
{
  return self->_disableRecoveryOSUpdates;
}

- (BOOL)requireInstallAssistantUpdate
{
  return self->_requireInstallAssistantUpdate;
}

- (NSData)sepDigest
{
  return self->_sepDigest;
}

- (void)setSepDigest:(id)a3
{
  objc_storeStrong((id *)&self->_sepDigest, a3);
}

- (NSData)sepTBMDigests
{
  return self->_sepTBMDigests;
}

- (void)setSepTBMDigests:(id)a3
{
  objc_storeStrong((id *)&self->_sepTBMDigests, a3);
}

- (NSData)rsepDigest
{
  return self->_rsepDigest;
}

- (void)setRsepDigest:(id)a3
{
  objc_storeStrong((id *)&self->_rsepDigest, a3);
}

- (NSData)rsepTBMDigests
{
  return self->_rsepTBMDigests;
}

- (void)setRsepTBMDigests:(id)a3
{
  objc_storeStrong((id *)&self->_rsepTBMDigests, a3);
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
  objc_storeStrong((id *)&self->_documentationID, a3);
}

- (SUCoreDocumentation)documentation
{
  return (SUCoreDocumentation *)objc_getProperty(self, a2, 472, 1);
}

- (void)setDocumentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSString)softwareUpdateURL
{
  return self->_softwareUpdateURL;
}

- (void)setSoftwareUpdateURL:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateURL, a3);
}

- (NSData)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_measurement, a3);
}

- (NSString)measurementAlgorithm
{
  return self->_measurementAlgorithm;
}

- (void)setMeasurementAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_measurementAlgorithm, a3);
}

- (SUCoreMAIdentifier)softwareUpdateAssetIdentifier
{
  return self->_softwareUpdateAssetIdentifier;
}

- (void)setSoftwareUpdateAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAssetIdentifier, a3);
}

- (SUCoreMAIdentifier)documentationAssetIdentifier
{
  return self->_documentationAssetIdentifier;
}

- (void)setDocumentationAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAssetIdentifier, a3);
}

- (BOOL)promoteAlternateUpdate
{
  return self->_promoteAlternateUpdate;
}

- (void)setPromoteAlternateUpdate:(BOOL)a3
{
  self->_promoteAlternateUpdate = a3;
}

- (BOOL)enableAlternateAssetAudience
{
  return self->_enableAlternateAssetAudience;
}

- (void)setEnableAlternateAssetAudience:(BOOL)a3
{
  self->_enableAlternateAssetAudience = a3;
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, a3);
}

- (NSString)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetAudienceUUID, a3);
}

- (NSString)updateBrainPath
{
  return self->_updateBrainPath;
}

- (void)setUpdateBrainPath:(id)a3
{
  objc_storeStrong((id *)&self->_updateBrainPath, a3);
}

- (NSString)updateBundlePath
{
  return self->_updateBundlePath;
}

- (void)setUpdateBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_updateBundlePath, a3);
}

- (NSDictionary)bundleAttributes
{
  return self->_bundleAttributes;
}

- (void)setBundleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_bundleAttributes, a3);
}

- (BOOL)splatOnly
{
  return self->_splatOnly;
}

- (BOOL)semiSplatEnabled
{
  return self->_semiSplatEnabled;
}

- (NSArray)semiSplatMustQuitApps
{
  return self->_semiSplatMustQuitApps;
}

- (BOOL)revoked
{
  return self->_revoked;
}

- (BOOL)semiSplatRestartNow
{
  return self->_semiSplatRestartNow;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
}

- (SUCoreDescriptor)associatedSplatDescriptor
{
  return self->_associatedSplatDescriptor;
}

- (void)setAssociatedSplatDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_associatedSplatDescriptor, a3);
}

- (BOOL)enablePreSUStaging
{
  return self->_enablePreSUStaging;
}

- (void)setEnablePreSUStaging:(BOOL)a3
{
  self->_enablePreSUStaging = a3;
}

- (BOOL)enablePreSUStagingForOptionalAssets
{
  return self->_enablePreSUStagingForOptionalAssets;
}

- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3
{
  self->_enablePreSUStagingForOptionalAssets = a3;
}

- (NSString)rawProductVersion
{
  return self->_rawProductVersion;
}

- (void)setRawProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_rawProductVersion, a3);
}

- (MAAsset)softwareUpdateAsset
{
  return self->_softwareUpdateAsset;
}

- (void)setSoftwareUpdateAsset:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAsset, a3);
}

- (MAAsset)documentationAsset
{
  return self->_documentationAsset;
}

- (void)setDocumentationAsset:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentationAsset, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAsset, 0);
  objc_storeStrong((id *)&self->_rawProductVersion, 0);
  objc_storeStrong((id *)&self->_associatedSplatDescriptor, 0);
  objc_storeStrong((id *)&self->_semiSplatMustQuitApps, 0);
  objc_storeStrong((id *)&self->_bundleAttributes, 0);
  objc_storeStrong((id *)&self->_updateBundlePath, 0);
  objc_storeStrong((id *)&self->_updateBrainPath, 0);
  objc_storeStrong((id *)&self->_assetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_documentationAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_measurementAlgorithm, 0);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_softwareUpdateURL, 0);
  objc_storeStrong((id *)&self->_documentation, 0);
  objc_storeStrong((id *)&self->_documentationID, 0);
  objc_storeStrong((id *)&self->_rsepTBMDigests, 0);
  objc_storeStrong((id *)&self->_rsepDigest, 0);
  objc_storeStrong((id *)&self->_sepTBMDigests, 0);
  objc_storeStrong((id *)&self->_sepDigest, 0);
  objc_storeStrong((id *)&self->_minimumBridgeVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_oneShotBuddyDisabledBuilds, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, 0);
  objc_storeStrong((id *)&self->_lastEmergencyOSVersion, 0);
  objc_storeStrong((id *)&self->_lastEmergencyBuild, 0);
  objc_storeStrong((id *)&self->_setupCritical, 0);
  objc_storeStrong((id *)&self->_systemPartitionPadding, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_prerequisiteOSVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuild, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
  objc_storeStrong((id *)&self->_targetUpdateSFRVersion, 0);
  objc_storeStrong((id *)&self->_targetUpdateBridgeVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersion, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productVersionExtra, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_documentationAssetPurpose, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetPurpose, 0);
  objc_storeStrong((id *)&self->_documentationAssetAbsoluteID, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetAbsoluteID, 0);
  objc_storeStrong((id *)&self->_documentationAssetType, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetType, 0);
  objc_storeStrong((id *)&self->_uniqueBuildID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_productSystemName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end
