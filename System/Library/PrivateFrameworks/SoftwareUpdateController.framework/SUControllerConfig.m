@implementation SUControllerConfig

- (SUControllerConfig)init
{
  SUControllerConfig *v2;
  SUControllerConfig *v3;
  NSString *requestedPMV;
  NSString *installPhaseOSBackgroundImagePath;
  NSString *updateMetricContext;
  NSString *prerequisiteBuildVersion;
  NSString *prerequisiteProductVersion;
  NSString *asReleaseType;
  NSString *simulatorCommandsFile;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUControllerConfig;
  v2 = -[SUControllerConfig init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_useSUCore = 16842753;
    v2->_performAutoInstall = 0;
    v2->_autoAcceptTermsAndConditions = updateRequiresDocAsset() ^ 1;
    *(_OWORD *)&v3->_autoActivityCheckPeriod = xmmword_2476A4190;
    *(_OWORD *)&v3->_autoInstallWindowBeginHour = xmmword_2476A41A0;
    *(_OWORD *)&v3->_autoInstallWindowEndHour = xmmword_2476A41B0;
    *(_WORD *)&v3->_downloadDocAsset = 0;
    v3->_supervisedMDM = 0;
    requestedPMV = v3->_requestedPMV;
    v3->_requestedPMV = 0;

    v3->_delayPeriod = 0;
    installPhaseOSBackgroundImagePath = v3->_installPhaseOSBackgroundImagePath;
    v3->_installPhaseOSBackgroundImagePath = 0;

    *(_QWORD *)&v3->_restrictToFullReplacement = 0;
    updateMetricContext = v3->_updateMetricContext;
    v3->_updateMetricContext = 0;

    prerequisiteBuildVersion = v3->_prerequisiteBuildVersion;
    v3->_prerequisiteBuildVersion = 0;

    prerequisiteProductVersion = v3->_prerequisiteProductVersion;
    v3->_prerequisiteProductVersion = 0;

    asReleaseType = v3->_asReleaseType;
    v3->_asReleaseType = 0;

    simulatorCommandsFile = v3->_simulatorCommandsFile;
    v3->_simulatorCommandsFile = 0;

  }
  return v3;
}

- (id)initFromDefaults:(int64_t)a3
{
  SUControllerConfig *v4;
  SUControllerConfig *v5;
  uint64_t v6;
  NSString *requestedPMV;
  uint64_t v8;
  NSString *installPhaseOSBackgroundImagePath;
  uint64_t v10;
  NSString *updateMetricContext;
  uint64_t v12;
  NSString *prerequisiteBuildVersion;
  uint64_t v14;
  NSString *prerequisiteProductVersion;
  uint64_t v16;
  NSString *asReleaseType;
  uint64_t v18;
  NSString *simulatorCommandsFile;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUControllerConfig;
  v4 = -[SUControllerConfig init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_internalDefaultsAsExternal = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v4, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUInternalDefaultsAsExternal"), 0, 0);
    v5->_useSUCore = 1;
    v5->_vpnOnDemandAsInternal = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUVPNOnDemandAsInternal"), 0, 0);
    *(_WORD *)&v5->_performAutoScan = 257;
    v5->_performAutoInstall = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUDisableAutoInstall"), 0, 1);
    v5->_autoAcceptTermsAndConditions = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUAutoAcceptTermsAndConditions"), updateRequiresDocAsset() ^ 1, 0);
    v5->_autoActivityCheckPeriod = -[SUControllerConfig _loadIntegerFromDefaults:releaseType:externalDefault:internalDefault:withLimit:](v5, "_loadIntegerFromDefaults:releaseType:externalDefault:internalDefault:withLimit:", CFSTR("SUAutoActivityCheckPeriod"), a3, 10080, 240, 44640);
    v5->_autoInstallForceMaxWait = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:](v5, "_loadIntegerFromDefaults:usingDefault:withLimit:", CFSTR("SUAutoInstallForceMaxWait"), 20, 1440);
    v5->_autoInstallWindowBeginHour = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:](v5, "_loadIntegerFromDefaults:usingDefault:withLimit:", CFSTR("SUAutoInstallWindowBeginHour"), 2, 23);
    v5->_autoInstallWindowBeginMinute = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:](v5, "_loadIntegerFromDefaults:usingDefault:withLimit:", CFSTR("SUAutoInstallWindowBeginMinute"), 0, 59);
    v5->_autoInstallWindowEndHour = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:](v5, "_loadIntegerFromDefaults:usingDefault:withLimit:", CFSTR("SUAutoInstallWindowEndHour"), 4, 23);
    v5->_autoInstallWindowEndMinute = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:](v5, "_loadIntegerFromDefaults:usingDefault:withLimit:", CFSTR("SUAutoInstallWindowEndMinute"), 0, 59);
    v5->_downloadDocAsset = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUDownloadDocAsset"), 0, 0);
    v5->_ignoreRamping = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUIgnoreRamping"), 0, 0);
    v5->_supervisedMDM = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("supervisedMDM"), 0, 0);
    v6 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("requestedPMV"), 0);
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v6;

    v5->_delayPeriod = -[SUControllerConfig _loadIntegerFromDefaults:usingDefault:withLimit:](v5, "_loadIntegerFromDefaults:usingDefault:withLimit:", CFSTR("delayPeriod"), 0, 90);
    v8 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("installPhaseOSBackgroundImagePath"), 0);
    installPhaseOSBackgroundImagePath = v5->_installPhaseOSBackgroundImagePath;
    v5->_installPhaseOSBackgroundImagePath = (NSString *)v8;

    v5->_restrictToFullReplacement = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SURestrictToFullReplacement"), 0, 0);
    v5->_allowSameVersionUpdates = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUAllowSameVersionUpdates"), 0, 0);
    v10 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("SUUpdateMetricContext"), 0);
    updateMetricContext = v5->_updateMetricContext;
    v5->_updateMetricContext = (NSString *)v10;

    v12 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("SUPrerequisiteBuildVersion"), 0);
    prerequisiteBuildVersion = v5->_prerequisiteBuildVersion;
    v5->_prerequisiteBuildVersion = (NSString *)v12;

    v14 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("SUPrerequisiteProductVersion"), 0);
    prerequisiteProductVersion = v5->_prerequisiteProductVersion;
    v5->_prerequisiteProductVersion = (NSString *)v14;

    v16 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("SUAsReleaseType"), 0);
    asReleaseType = v5->_asReleaseType;
    v5->_asReleaseType = (NSString *)v16;

    v18 = -[SUControllerConfig _copyStringFromDefaults:usingDefault:](v5, "_copyStringFromDefaults:usingDefault:", CFSTR("SUSimulatorCommandsFile"), 0);
    simulatorCommandsFile = v5->_simulatorCommandsFile;
    v5->_simulatorCommandsFile = (NSString *)v18;

    v5->_useSpecifiedInstallWindow = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUUseSpecifiedInstallWindow"), 0, 0);
    v5->_expiredSpecifiedAsExpired = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUExpiredSpecifiedAsExpired"), 0, 0);
    v5->_hideIndicationMayReboot = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUHideIndicationMayReboot"), 0, 0);
    v5->_requirePrepareSize = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SURequirePrepareSize"), 0, 0);
    v5->_installWindowAsDeltas = -[SUControllerConfig _loadBooleanFromDefaults:usingDefault:isStoredInverted:](v5, "_loadBooleanFromDefaults:usingDefault:isStoredInverted:", CFSTR("SUInstallWindowAsDeltas"), 0, 0);
  }
  return v5;
}

- (SUControllerConfig)initWithCoder:(id)a3
{
  id v4;
  SUControllerConfig *v5;
  SUControllerConfig *v6;
  char v7;
  uint64_t v8;
  NSString *requestedPMV;
  uint64_t v10;
  NSString *installPhaseOSBackgroundImagePath;
  uint64_t v12;
  NSString *updateMetricContext;
  uint64_t v14;
  NSString *prerequisiteBuildVersion;
  uint64_t v16;
  NSString *prerequisiteProductVersion;
  uint64_t v18;
  NSString *asReleaseType;
  uint64_t v20;
  NSString *simulatorCommandsFile;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUControllerConfig;
  v5 = -[SUControllerConfig init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = 1;
    v5->_useSUCore = 1;
    v5->_vpnOnDemandAsInternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("vpnOnDemandAsInternal"));
    if (-[SUControllerConfig _runningOnAppleTV](v6, "_runningOnAppleTV"))
      v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performAutoScan"));
    v6->_performAutoScan = v7;
    v6->_performAutoDownloadAndPrepare = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performAutoDownloadAndPrepare"));
    v6->_performAutoInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performAutoInstall"));
    v6->_autoAcceptTermsAndConditions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoAcceptTermsAndConditions"));
    v6->_autoActivityCheckPeriod = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("autoActivityCheckPeriod"), 44640);
    v6->_autoInstallForceMaxWait = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("autoInstallForceMaxWait"), 1440);
    v6->_autoInstallWindowBeginHour = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("autoInstallWindowBeginHour"), 23);
    v6->_autoInstallWindowBeginMinute = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("autoInstallWindowBeginMinute"), 59);
    v6->_autoInstallWindowEndHour = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("autoInstallWindowEndHour"), 23);
    v6->_autoInstallWindowEndMinute = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("autoInstallWindowEndMinute"), 59);
    v6->_downloadDocAsset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadDocAsset"));
    v6->_ignoreRamping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRamping"));
    v6->_supervisedMDM = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supervisedMDM"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedPMV"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestedPMV = v6->_requestedPMV;
    v6->_requestedPMV = (NSString *)v8;

    v6->_delayPeriod = -[SUControllerConfig _decodeInteger:forKey:withLimit:](v6, "_decodeInteger:forKey:withLimit:", v4, CFSTR("delayPeriod"), 90);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installPhaseOSBackgroundImagePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    installPhaseOSBackgroundImagePath = v6->_installPhaseOSBackgroundImagePath;
    v6->_installPhaseOSBackgroundImagePath = (NSString *)v10;

    v6->_restrictToFullReplacement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictToFullReplacement"));
    v6->_allowSameVersionUpdates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowSameVersionUpdates"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateMetricContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    updateMetricContext = v6->_updateMetricContext;
    v6->_updateMetricContext = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prerequisiteBuildVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    prerequisiteBuildVersion = v6->_prerequisiteBuildVersion;
    v6->_prerequisiteBuildVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prerequisiteProductVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    prerequisiteProductVersion = v6->_prerequisiteProductVersion;
    v6->_prerequisiteProductVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asReleaseType"));
    v18 = objc_claimAutoreleasedReturnValue();
    asReleaseType = v6->_asReleaseType;
    v6->_asReleaseType = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simulatorCommandsFile"));
    v20 = objc_claimAutoreleasedReturnValue();
    simulatorCommandsFile = v6->_simulatorCommandsFile;
    v6->_simulatorCommandsFile = (NSString *)v20;

    v6->_useSpecifiedInstallWindow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useSpecifiedInstallWindow"));
    v6->_expiredSpecifiedAsExpired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expiredSpecifiedAsExpired"));
    v6->_hideIndicationMayReboot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideIndicationMayReboot"));
    v6->_internalDefaultsAsExternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("internalDefaultsAsExternal"));
    v6->_requirePrepareSize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requirePrepareSize"));
    v6->_installWindowAsDeltas = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("installWindowAsDeltas"));
  }

  return v6;
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
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig useSUCore](self, "useSUCore"), CFSTR("useSUCore"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal"), CFSTR("vpnOnDemandAsInternal"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig performAutoScan](self, "performAutoScan"), CFSTR("performAutoScan"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare"), CFSTR("performAutoDownloadAndPrepare"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig performAutoInstall](self, "performAutoInstall"), CFSTR("performAutoInstall"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions"), CFSTR("autoAcceptTermsAndConditions"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod"), CFSTR("autoActivityCheckPeriod"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait"), CFSTR("autoInstallForceMaxWait"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour"), CFSTR("autoInstallWindowBeginHour"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"), CFSTR("autoInstallWindowBeginMinute"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"), CFSTR("autoInstallWindowEndHour"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"), CFSTR("autoInstallWindowEndMinute"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"), CFSTR("downloadDocAsset"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig ignoreRamping](self, "ignoreRamping"), CFSTR("ignoreRamping"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig supervisedMDM](self, "supervisedMDM"), CFSTR("supervisedMDM"));
  -[SUControllerConfig requestedPMV](self, "requestedPMV");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("requestedPMV"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig delayPeriod](self, "delayPeriod"), CFSTR("delayPeriod"));
  -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("installPhaseOSBackgroundImagePath"));

  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement"), CFSTR("restrictToFullReplacement"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates"), CFSTR("allowSameVersionUpdates"));
  -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("updateMetricContext"));

  -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("prerequisiteBuildVersion"));

  -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("prerequisiteProductVersion"));

  -[SUControllerConfig asReleaseType](self, "asReleaseType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("asReleaseType"));

  -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("simulatorCommandsFile"));

  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"), CFSTR("useSpecifiedInstallWindow"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"), CFSTR("expiredSpecifiedAsExpired"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"), CFSTR("hideIndicationMayReboot"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"), CFSTR("internalDefaultsAsExternal"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"), CFSTR("requirePrepareSize"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"), CFSTR("installWindowAsDeltas"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)modify:(id)a3 usingMask:(int64_t)a4
{
  int v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  int v11;
  const __CFString *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  const __CFString *v19;
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

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v35 = v6;
  if ((v4 & 0x10000) != 0)
  {
    v8 = objc_msgSend(v6, "useSUCore");
    v7 = v35;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x24BDD17C8]);
      v11 = objc_msgSend(v35, "useSUCore");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("attempt to set %@ to %@ (only supported value is %@ [as of 4.2.1])"), CFSTR("useSUCore"), v12, CFSTR("YES"));
      objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[CONFIG]"), v13, 8102, 0);

      v7 = v35;
    }
  }
  if ((v4 & 0x8000000) != 0)
  {
    -[SUControllerConfig setVpnOnDemandAsInternal:](self, "setVpnOnDemandAsInternal:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUVPNOnDemandAsInternal"), objc_msgSend(v7, "vpnOnDemandAsInternal"), 0));
    v7 = v35;
  }
  if ((v4 & 1) != 0)
  {
    v14 = -[SUControllerConfig _runningOnAppleTV](self, "_runningOnAppleTV");
    v15 = objc_msgSend(v35, "performAutoScan");
    if (v14)
    {
      -[SUControllerConfig setPerformAutoScan:](self, "setPerformAutoScan:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUDisableAutoScan"), v15, 1));
    }
    else
    {
      v7 = v35;
      if ((v15 & 1) != 0)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x24BDD17C8]);
      v18 = objc_msgSend(v35, "performAutoScan");
      v19 = CFSTR("NO");
      if (v18)
        v19 = CFSTR("YES");
      v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("attempt to set %@ to %@ (only supported value is %@ [as of 4.2.1])"), CFSTR("performAutoScan"), v19, CFSTR("YES"));
      objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("[CONFIG]"), v20, 8102, 0);

    }
    v7 = v35;
  }
LABEL_16:
  if ((v4 & 2) != 0)
  {
    -[SUControllerConfig setPerformAutoDownloadAndPrepare:](self, "setPerformAutoDownloadAndPrepare:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUDisableAutoDownloadAndPrepare"), objc_msgSend(v7, "performAutoDownloadAndPrepare"), 1));
    v7 = v35;
    if ((v4 & 4) == 0)
    {
LABEL_18:
      if ((v4 & 8) == 0)
        goto LABEL_19;
      goto LABEL_48;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_18;
  }
  -[SUControllerConfig setPerformAutoInstall:](self, "setPerformAutoInstall:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUDisableAutoInstall"), objc_msgSend(v7, "performAutoInstall"), 1));
  v7 = v35;
  if ((v4 & 8) == 0)
  {
LABEL_19:
    if ((v4 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  -[SUControllerConfig setAutoAcceptTermsAndConditions:](self, "setAutoAcceptTermsAndConditions:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUAutoAcceptTermsAndConditions"), objc_msgSend(v7, "autoAcceptTermsAndConditions"), 0));
  v7 = v35;
  if ((v4 & 0x10) == 0)
  {
LABEL_20:
    if ((v4 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  -[SUControllerConfig setAutoActivityCheckPeriod:](self, "setAutoActivityCheckPeriod:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("SUAutoActivityCheckPeriod"), objc_msgSend(v7, "autoActivityCheckPeriod")));
  v7 = v35;
  if ((v4 & 0x2000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  -[SUControllerConfig setAutoInstallForceMaxWait:](self, "setAutoInstallForceMaxWait:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("SUAutoInstallForceMaxWait"), objc_msgSend(v7, "autoInstallForceMaxWait")));
  v7 = v35;
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  -[SUControllerConfig setAutoInstallWindowBeginHour:](self, "setAutoInstallWindowBeginHour:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("SUAutoInstallWindowBeginHour"), objc_msgSend(v7, "autoInstallWindowBeginHour")));
  v7 = v35;
  if ((v4 & 0x100) == 0)
  {
LABEL_23:
    if ((v4 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  -[SUControllerConfig setAutoInstallWindowBeginMinute:](self, "setAutoInstallWindowBeginMinute:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("SUAutoInstallWindowBeginMinute"), objc_msgSend(v7, "autoInstallWindowBeginMinute")));
  v7 = v35;
  if ((v4 & 0x200) == 0)
  {
LABEL_24:
    if ((v4 & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  -[SUControllerConfig setAutoInstallWindowEndHour:](self, "setAutoInstallWindowEndHour:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("SUAutoInstallWindowEndHour"), objc_msgSend(v7, "autoInstallWindowEndHour")));
  v7 = v35;
  if ((v4 & 0x400) == 0)
  {
LABEL_25:
    if ((v4 & 0x400000) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  -[SUControllerConfig setAutoInstallWindowEndMinute:](self, "setAutoInstallWindowEndMinute:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("SUAutoInstallWindowEndMinute"), objc_msgSend(v7, "autoInstallWindowEndMinute")));
  v7 = v35;
  if ((v4 & 0x400000) == 0)
  {
LABEL_26:
    if ((v4 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  -[SUControllerConfig setDownloadDocAsset:](self, "setDownloadDocAsset:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUDownloadDocAsset"), objc_msgSend(v7, "downloadDocAsset"), 0));
  v7 = v35;
  if ((v4 & 0x800000) == 0)
  {
LABEL_27:
    if ((v4 & 0x10000000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  -[SUControllerConfig setIgnoreRamping:](self, "setIgnoreRamping:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUIgnoreRamping"), objc_msgSend(v7, "ignoreRamping"), 0));
  v7 = v35;
  if ((v4 & 0x10000000) == 0)
  {
LABEL_28:
    if ((v4 & 0x20000000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  -[SUControllerConfig setSupervisedMDM:](self, "setSupervisedMDM:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("supervisedMDM"), objc_msgSend(v7, "supervisedMDM"), 0));
  v7 = v35;
  if ((v4 & 0x20000000) == 0)
  {
LABEL_29:
    if ((v4 & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v7, "requestedPMV");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("requestedPMV"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setRequestedPMV:](self, "setRequestedPMV:", v22);

  v7 = v35;
  if ((v4 & 0x40000000) == 0)
  {
LABEL_30:
    if ((v4 & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  -[SUControllerConfig setDelayPeriod:](self, "setDelayPeriod:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", CFSTR("delayPeriod"), objc_msgSend(v7, "delayPeriod")));
  v7 = v35;
  if ((v4 & 0x80000000) == 0)
  {
LABEL_31:
    if ((v4 & 0x20) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v7, "installPhaseOSBackgroundImagePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("installPhaseOSBackgroundImagePath"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setInstallPhaseOSBackgroundImagePath:](self, "setInstallPhaseOSBackgroundImagePath:", v24);

  v7 = v35;
  if ((v4 & 0x20) == 0)
  {
LABEL_32:
    if ((v4 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  -[SUControllerConfig setRestrictToFullReplacement:](self, "setRestrictToFullReplacement:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SURestrictToFullReplacement"), objc_msgSend(v7, "restrictToFullReplacement"), 0));
  v7 = v35;
  if ((v4 & 0x40) == 0)
  {
LABEL_33:
    if ((v4 & 0x4000000) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  -[SUControllerConfig setAllowSameVersionUpdates:](self, "setAllowSameVersionUpdates:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUAllowSameVersionUpdates"), objc_msgSend(v7, "allowSameVersionUpdates"), 0));
  v7 = v35;
  if ((v4 & 0x4000000) == 0)
  {
LABEL_34:
    if ((v4 & 0x20000) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v7, "updateMetricContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("SUUpdateMetricContext"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setUpdateMetricContext:](self, "setUpdateMetricContext:", v26);

  v7 = v35;
  if ((v4 & 0x20000) == 0)
  {
LABEL_35:
    if ((v4 & 0x40000) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v7, "prerequisiteBuildVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("SUPrerequisiteBuildVersion"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setPrerequisiteBuildVersion:](self, "setPrerequisiteBuildVersion:", v28);

  v7 = v35;
  if ((v4 & 0x40000) == 0)
  {
LABEL_36:
    if ((v4 & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v7, "prerequisiteProductVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("SUPrerequisiteProductVersion"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setPrerequisiteProductVersion:](self, "setPrerequisiteProductVersion:", v30);

  v7 = v35;
  if ((v4 & 0x80000) == 0)
  {
LABEL_37:
    if ((v4 & 0x200000) == 0)
      goto LABEL_38;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v7, "asReleaseType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("SUAsReleaseType"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setAsReleaseType:](self, "setAsReleaseType:", v32);

  v7 = v35;
  if ((v4 & 0x200000) == 0)
  {
LABEL_38:
    if ((v4 & 0x800) == 0)
      goto LABEL_39;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v7, "simulatorCommandsFile");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig _storeStringToDefaults:toValue:](self, "_storeStringToDefaults:toValue:", CFSTR("SUSimulatorCommandsFile"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerConfig setSimulatorCommandsFile:](self, "setSimulatorCommandsFile:", v34);

  v7 = v35;
  if ((v4 & 0x800) == 0)
  {
LABEL_39:
    if ((v4 & 0x100000) == 0)
      goto LABEL_40;
    goto LABEL_69;
  }
LABEL_68:
  -[SUControllerConfig setUseSpecifiedInstallWindow:](self, "setUseSpecifiedInstallWindow:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUUseSpecifiedInstallWindow"), objc_msgSend(v7, "useSpecifiedInstallWindow"), 0));
  v7 = v35;
  if ((v4 & 0x100000) == 0)
  {
LABEL_40:
    if ((v4 & 0x1000) == 0)
      goto LABEL_41;
    goto LABEL_70;
  }
LABEL_69:
  -[SUControllerConfig setExpiredSpecifiedAsExpired:](self, "setExpiredSpecifiedAsExpired:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUExpiredSpecifiedAsExpired"), objc_msgSend(v7, "expiredSpecifiedAsExpired"), 0));
  v7 = v35;
  if ((v4 & 0x1000) == 0)
  {
LABEL_41:
    if ((v4 & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_71;
  }
LABEL_70:
  -[SUControllerConfig setHideIndicationMayReboot:](self, "setHideIndicationMayReboot:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUHideIndicationMayReboot"), objc_msgSend(v7, "hideIndicationMayReboot"), 0));
  v7 = v35;
  if ((v4 & 0x2000000) == 0)
  {
LABEL_42:
    if ((v4 & 0x4000) == 0)
      goto LABEL_43;
LABEL_72:
    -[SUControllerConfig setRequirePrepareSize:](self, "setRequirePrepareSize:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SURequirePrepareSize"), objc_msgSend(v7, "requirePrepareSize"), 0));
    v7 = v35;
    if ((v4 & 0x8000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_71:
  -[SUControllerConfig setInternalDefaultsAsExternal:](self, "setInternalDefaultsAsExternal:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUInternalDefaultsAsExternal"), objc_msgSend(v7, "internalDefaultsAsExternal"), 0));
  v7 = v35;
  if ((v4 & 0x4000) != 0)
    goto LABEL_72;
LABEL_43:
  if ((v4 & 0x8000) != 0)
  {
LABEL_44:
    -[SUControllerConfig setInstallWindowAsDeltas:](self, "setInstallWindowAsDeltas:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", CFSTR("SUInstallWindowAsDeltas"), objc_msgSend(v7, "installWindowAsDeltas"), 0));
    v7 = v35;
  }
LABEL_45:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int v17;
  int v18;
  int v19;
  char v20;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
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

  v4 = a3;
  v5 = -[SUControllerConfig useSUCore](self, "useSUCore");
  if (v5 != objc_msgSend(v4, "useSUCore"))
    goto LABEL_16;
  v6 = -[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal");
  if (v6 != objc_msgSend(v4, "vpnOnDemandAsInternal"))
    goto LABEL_16;
  v7 = -[SUControllerConfig performAutoScan](self, "performAutoScan");
  if (v7 != objc_msgSend(v4, "performAutoScan"))
    goto LABEL_16;
  v8 = -[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare");
  if (v8 != objc_msgSend(v4, "performAutoDownloadAndPrepare"))
    goto LABEL_16;
  v9 = -[SUControllerConfig performAutoInstall](self, "performAutoInstall");
  if (v9 != objc_msgSend(v4, "performAutoInstall"))
    goto LABEL_16;
  v10 = -[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions");
  if (v10 != objc_msgSend(v4, "autoAcceptTermsAndConditions"))
    goto LABEL_16;
  v11 = -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod");
  if (v11 != objc_msgSend(v4, "autoActivityCheckPeriod"))
    goto LABEL_16;
  v12 = -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait");
  if (v12 != objc_msgSend(v4, "autoInstallForceMaxWait"))
    goto LABEL_16;
  v13 = -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour");
  if (v13 == objc_msgSend(v4, "autoInstallWindowBeginHour")
    && (v14 = -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"),
        v14 == objc_msgSend(v4, "autoInstallWindowBeginMinute"))
    && (v15 = -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"),
        v15 == objc_msgSend(v4, "autoInstallWindowEndHour"))
    && (v16 = -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"),
        v16 == objc_msgSend(v4, "autoInstallWindowEndMinute"))
    && (v17 = -[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"),
        v17 == objc_msgSend(v4, "downloadDocAsset"))
    && (v18 = -[SUControllerConfig ignoreRamping](self, "ignoreRamping"),
        v18 == objc_msgSend(v4, "ignoreRamping"))
    && (v19 = -[SUControllerConfig supervisedMDM](self, "supervisedMDM"),
        v19 == objc_msgSend(v4, "supervisedMDM")))
  {
    -[SUControllerConfig requestedPMV](self, "requestedPMV");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestedPMV");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (doStringsMatch(v22, v23)
      && (v24 = -[SUControllerConfig delayPeriod](self, "delayPeriod"), v24 == objc_msgSend(v4, "delayPeriod")))
    {
      -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "installPhaseOSBackgroundImagePath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!doStringsMatch(v25, v26))
        goto LABEL_29;
      v27 = -[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement");
      if (v27 != objc_msgSend(v4, "restrictToFullReplacement"))
        goto LABEL_29;
      v28 = -[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates");
      if (v28 == objc_msgSend(v4, "allowSameVersionUpdates")
        && (v29 = -[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"),
            v29 == objc_msgSend(v4, "useSpecifiedInstallWindow"))
        && (v30 = -[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"),
            v30 == objc_msgSend(v4, "expiredSpecifiedAsExpired"))
        && (v31 = -[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"),
            v31 == objc_msgSend(v4, "hideIndicationMayReboot"))
        && (v32 = -[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"),
            v32 == objc_msgSend(v4, "internalDefaultsAsExternal"))
        && (v33 = -[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"),
            v33 == objc_msgSend(v4, "requirePrepareSize"))
        && (v34 = -[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"),
            v34 == objc_msgSend(v4, "installWindowAsDeltas")))
      {
        -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "updateMetricContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (doStringsMatch(v35, v36))
        {
          -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "prerequisiteBuildVersion");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v37;
          if (doStringsMatch(v37, v38))
          {
            -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "prerequisiteProductVersion");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v39;
            if (doStringsMatch(v39, v45))
            {
              -[SUControllerConfig asReleaseType](self, "asReleaseType");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "asReleaseType");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v40;
              if (doStringsMatch(v40, v43))
              {
                -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "simulatorCommandsFile");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = doStringsMatch(v42, v41);

              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
LABEL_29:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
LABEL_16:
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  const __CFString *v35;
  void *v36;
  __CFString *v37;
  int64_t v38;
  void *v39;
  const __CFString *v40;
  __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  int64_t v49;
  __CFString *v50;
  int64_t v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;

  v61 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUControllerConfig useSUCore](self, "useSUCore"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v59 = v3;
  if (-[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v58 = v4;
  if (-[SUControllerConfig performAutoScan](self, "performAutoScan"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v56 = v5;
  if (-[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v55 = v6;
  if (-[SUControllerConfig performAutoInstall](self, "performAutoInstall"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v54 = v7;
  if (-[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v52 = v8;
  v51 = -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod");
  v49 = -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait");
  v48 = -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour");
  v47 = -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute");
  v46 = -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour");
  v45 = -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute");
  if (-[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v43 = v9;
  if (-[SUControllerConfig ignoreRamping](self, "ignoreRamping"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v42 = v10;
  if (-[SUControllerConfig supervisedMDM](self, "supervisedMDM"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v40 = v11;
  -[SUControllerConfig requestedPMV](self, "requestedPMV");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SUControllerConfig requestedPMV](self, "requestedPMV");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("(default)");
  }
  v38 = -[SUControllerConfig delayPeriod](self, "delayPeriod");
  -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = CFSTR("(default)");
  }
  if (-[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v35 = v15;
  if (-[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v33 = v16;
  -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = CFSTR("(default)");
  }
  -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("(default)");
  }
  -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)v12;
  if (v36)
  {
    -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("(default)");
  }
  -[SUControllerConfig asReleaseType](self, "asReleaseType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v14;
  if (v21)
  {
    -[SUControllerConfig asReleaseType](self, "asReleaseType");
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = CFSTR("(default)");
  }
  v44 = (void *)v17;
  -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (__CFString *)v13;
  v39 = (void *)v18;
  v37 = (__CFString *)v19;
  v34 = (__CFString *)v20;
  if (v22)
  {
    -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("(default)");
  }
  if (-[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  v32 = v24;
  if (-[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  if (-[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  if (-[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  if (-[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  if (-[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v61, "stringWithFormat:", CFSTR("\nuseSUCore: %@\nVPNOnDemandAsInternal: %@\nPerformAutoScan: %@\nPerformAutoDownloadAndPrepare: %@\nPerformAutoInstall: %@\nAutoAcceptTermsAndConditions: %@\nAutoActivityCheckPeriod: %d minutes\nAutoInstallForceMaxWait: %d minutes\nAutoInstallWindowBegin: %02d:%02d\nAutoInstallWindowEnd: %02d:%02d\nDownloadDocAsset: %@\nIgnoreRamping: %@\nSupervisedMDM: %@\nRequestedPMV: %@\nDelayPeriod: %d days\nInstallPhaseOSBackgroundImagePath: %@\nRestrictToFullReplacement: %@\nAllowSameVersionUpdates: %@\nUpdateMetricContext: %@\nPrerequisiteBuildVersion: %@\nPrerequisiteProductVersion: %@\nAsReleaseType: %@\nsimulatorCommandsFile: %@\nuseSpecifiedInstallWindow: %@\nexpiredSpecifiedAsExpired: %@\nHideIndicationMayReboot: %@\nInternalDefaultsAsExternal: %@\nRequirePrepareSize: %@\nInstallWindowAsDeltas: %@"), v59, v58, v56, v55, v54, v52, v51, v49, v48, v47, v46, v45, v43, v42, v40, v57,
    v38,
    v50,
    v35,
    v33,
    v41,
    v37,
    v34,
    v62,
    v23,
    v32,
    v25,
    v26,
    v27,
    v28,
    v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)

  if (v21)
  if (v36)

  if (v39)
  if (v44)

  if (v53)
  if (v60)

  return v30;
}

- (id)summary
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  const __CFString *v35;
  void *v36;
  __CFString *v37;
  int64_t v38;
  void *v39;
  const __CFString *v40;
  __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  int64_t v49;
  __CFString *v50;
  int64_t v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;

  v61 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUControllerConfig useSUCore](self, "useSUCore"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v59 = v3;
  if (-[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  v58 = v4;
  if (-[SUControllerConfig performAutoScan](self, "performAutoScan"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  v56 = v5;
  if (-[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  v55 = v6;
  if (-[SUControllerConfig performAutoInstall](self, "performAutoInstall"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v54 = v7;
  if (-[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  v52 = v8;
  v51 = -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod");
  v49 = -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait");
  v48 = -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour");
  v47 = -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute");
  v46 = -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour");
  v45 = -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute");
  if (-[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  v43 = v9;
  if (-[SUControllerConfig ignoreRamping](self, "ignoreRamping"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  v42 = v10;
  if (-[SUControllerConfig supervisedMDM](self, "supervisedMDM"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  v40 = v11;
  -[SUControllerConfig requestedPMV](self, "requestedPMV");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SUControllerConfig requestedPMV](self, "requestedPMV");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("!");
  }
  v38 = -[SUControllerConfig delayPeriod](self, "delayPeriod");
  -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = CFSTR("!");
  }
  if (-[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement"))
    v15 = CFSTR("Y");
  else
    v15 = CFSTR("N");
  v35 = v15;
  if (-[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates"))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  v33 = v16;
  -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = CFSTR("!");
  }
  -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("!");
  }
  -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)v12;
  if (v36)
  {
    -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("!");
  }
  -[SUControllerConfig asReleaseType](self, "asReleaseType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v14;
  if (v21)
  {
    -[SUControllerConfig asReleaseType](self, "asReleaseType");
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = CFSTR("!");
  }
  v44 = (void *)v17;
  -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (__CFString *)v13;
  v39 = (void *)v18;
  v37 = (__CFString *)v19;
  v34 = (__CFString *)v20;
  if (v22)
  {
    -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("!");
  }
  if (-[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"))
    v24 = CFSTR("Y");
  else
    v24 = CFSTR("N");
  v32 = v24;
  if (-[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"))
    v25 = CFSTR("Y");
  else
    v25 = CFSTR("N");
  if (-[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"))
    v26 = CFSTR("Y");
  else
    v26 = CFSTR("N");
  if (-[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"))
    v27 = CFSTR("Y");
  else
    v27 = CFSTR("N");
  if (-[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"))
    v28 = CFSTR("Y");
  else
    v28 = CFSTR("N");
  if (-[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"))
    v29 = CFSTR("Y");
  else
    v29 = CFSTR("N");
  objc_msgSend(v61, "stringWithFormat:", CFSTR("useSUCore:%@,vpnAsInternal:%@,autoScan:%@,autoDownload:%@,autoInstall:%@,autoAccept:%@,activityPeriod:%d,forceMaxWait:%d,windowBegin:%02d:%02d,windowEnd:%02d:%02d,downloadDoc:%@,ignoreRamp:%@,supervisedMDM:%@,requestedPMV:%@,delayPeriod:%d,installPhaseBGImgPath:%@,restrictToFull:%@,allowSame:%@,context:%@,asBuild:%@,asProduct:%@,asRelease:%@,simFile:%@,useInstallWindow:%@,expiredAsExpired:%@,hideMayReboot:%@,asExternal:%@,requirePrepSize:%@,windowDeltas:%@"), v59, v58, v56, v55, v54, v52, v51, v49, v48, v47, v46, v45, v43, v42, v40, v57,
    v38,
    v50,
    v35,
    v33,
    v41,
    v37,
    v34,
    v62,
    v23,
    v32,
    v25,
    v26,
    v27,
    v28,
    v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)

  if (v21)
  if (v36)

  if (v39)
  if (v44)

  if (v53)
  if (v60)

  return v30;
}

- (id)changeSummary:(int64_t)a3
{
  int v3;
  __CFString *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  id v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  id v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  id v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  id v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  id v48;
  const __CFString *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  __CFString *v61;
  void *v62;
  uint64_t v63;
  id v64;
  const __CFString *v65;
  void *v66;
  uint64_t v67;
  id v68;
  const __CFString *v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  __CFString *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  __CFString *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  __CFString *v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  __CFString *v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  __CFString *v94;
  void *v95;
  uint64_t v96;
  id v97;
  const __CFString *v98;
  void *v99;
  uint64_t v100;
  id v101;
  const __CFString *v102;
  void *v103;
  uint64_t v104;
  id v105;
  const __CFString *v106;
  void *v107;
  uint64_t v108;
  id v109;
  const __CFString *v110;
  void *v111;
  uint64_t v112;
  id v113;
  const __CFString *v114;
  void *v115;
  uint64_t v116;

  v3 = a3;
  if ((a3 & 0x8000000) != 0)
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (-[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal"))
      v7 = CFSTR("Y");
    else
      v7 = CFSTR("N");
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("|vpnAsInternal:%@"), v7);
    objc_msgSend(&stru_2518D1100, "stringByAppendingString:", v8);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((v3 & 1) == 0)
      goto LABEL_13;
  }
  else
  {
    v5 = &stru_2518D1100;
    if ((a3 & 1) == 0)
      goto LABEL_13;
  }
  if (-[SUControllerConfig _runningOnAppleTV](self, "_runningOnAppleTV"))
  {
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (-[SUControllerConfig performAutoScan](self, "performAutoScan"))
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("|autoScan:%@"), v10);
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v12;
  }
LABEL_13:
  if ((v3 & 2) != 0)
  {
    v26 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (-[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare"))
      v27 = CFSTR("Y");
    else
      v27 = CFSTR("N");
    v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("|autoDownload:%@"), v27);
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v29;
    if ((v3 & 4) == 0)
    {
LABEL_15:
      if ((v3 & 8) == 0)
        goto LABEL_16;
      goto LABEL_57;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_15;
  }
  v30 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig performAutoInstall](self, "performAutoInstall"))
    v31 = CFSTR("Y");
  else
    v31 = CFSTR("N");
  v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("|autoInstall:%@"), v31);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v33;
  if ((v3 & 8) == 0)
  {
LABEL_16:
    if ((v3 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_57:
  v34 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions"))
    v35 = CFSTR("Y");
  else
    v35 = CFSTR("N");
  v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("|autoAccept:%@"), v35);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v36);
  v37 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v37;
  if ((v3 & 0x10) == 0)
  {
LABEL_17:
    if ((v3 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_61:
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("|activityPeriod:%d"), -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod"));
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v39;
  if ((v3 & 0x2000) != 0)
  {
LABEL_18:
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("|forceMaxWait:%d"), -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait"));
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v14;
  }
LABEL_19:
  if ((v3 & 0x180) != 0)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("|windowBegin:%02d:%02d"), -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour"), -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"));
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v16;
  }
  if ((v3 & 0x600) != 0)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("|windowEnd:%02d:%02d"), -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"), -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"));
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v18;
  }
  if ((v3 & 0x400000) != 0)
  {
    v40 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (-[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"))
      v41 = CFSTR("Y");
    else
      v41 = CFSTR("N");
    v42 = (void *)objc_msgSend(v40, "initWithFormat:", CFSTR("|downloadDoc:%@"), v41);
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v43;
    if ((v3 & 0x800000) == 0)
    {
LABEL_25:
      if ((v3 & 0x10000000) == 0)
        goto LABEL_26;
      goto LABEL_71;
    }
  }
  else if ((v3 & 0x800000) == 0)
  {
    goto LABEL_25;
  }
  v44 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig ignoreRamping](self, "ignoreRamping"))
    v45 = CFSTR("Y");
  else
    v45 = CFSTR("N");
  v46 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("|ignoreRamping:%@"), v45);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v46);
  v47 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v47;
  if ((v3 & 0x10000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_27;
    goto LABEL_75;
  }
LABEL_71:
  v48 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig supervisedMDM](self, "supervisedMDM"))
    v49 = CFSTR("Y");
  else
    v49 = CFSTR("N");
  v50 = (void *)objc_msgSend(v48, "initWithFormat:", CFSTR("|supervisedMDM:%@"), v49);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v50);
  v51 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v51;
  if ((v3 & 0x20000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_81;
  }
LABEL_75:
  v52 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig requestedPMV](self, "requestedPMV");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    -[SUControllerConfig requestedPMV](self, "requestedPMV");
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = CFSTR("!");
  }
  v55 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("|requestedPMV:%@"), v54);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v55);
  v56 = objc_claimAutoreleasedReturnValue();

  if (v53)
  v5 = (__CFString *)v56;
  if ((v3 & 0x40000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_82;
  }
LABEL_81:
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("|delayPeriod:%d"), -[SUControllerConfig delayPeriod](self, "delayPeriod"));
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v57);
  v58 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v58;
  if ((v3 & 0x80000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_88;
  }
LABEL_82:
  v59 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath");
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = CFSTR("!");
  }
  v62 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("|installPhaseOSBgImgPath:%@"), v61);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v62);
  v63 = objc_claimAutoreleasedReturnValue();

  if (v60)
  v5 = (__CFString *)v63;
  if ((v3 & 0x20) == 0)
  {
LABEL_30:
    if ((v3 & 0x40) == 0)
      goto LABEL_31;
    goto LABEL_92;
  }
LABEL_88:
  v64 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement"))
    v65 = CFSTR("Y");
  else
    v65 = CFSTR("N");
  v66 = (void *)objc_msgSend(v64, "initWithFormat:", CFSTR("|restrictToFull:%@"), v65);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v66);
  v67 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v67;
  if ((v3 & 0x40) == 0)
  {
LABEL_31:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_96;
  }
LABEL_92:
  v68 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates"))
    v69 = CFSTR("Y");
  else
    v69 = CFSTR("N");
  v70 = (void *)objc_msgSend(v68, "initWithFormat:", CFSTR("|allowSame:%@"), v69);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v70);
  v71 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v71;
  if ((v3 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x20000) == 0)
      goto LABEL_33;
    goto LABEL_102;
  }
LABEL_96:
  v72 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    -[SUControllerConfig updateMetricContext](self, "updateMetricContext");
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = CFSTR("!");
  }
  v75 = (void *)objc_msgSend(v72, "initWithFormat:", CFSTR("|context:%@"), v74);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v75);
  v76 = objc_claimAutoreleasedReturnValue();

  if (v73)
  v5 = (__CFString *)v76;
  if ((v3 & 0x20000) == 0)
  {
LABEL_33:
    if ((v3 & 0x40000) == 0)
      goto LABEL_34;
    goto LABEL_108;
  }
LABEL_102:
  v77 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    -[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v79 = CFSTR("!");
  }
  v80 = (void *)objc_msgSend(v77, "initWithFormat:", CFSTR("|asBuild:%@"), v79);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v80);
  v81 = objc_claimAutoreleasedReturnValue();

  if (v78)
  v5 = (__CFString *)v81;
  if ((v3 & 0x40000) == 0)
  {
LABEL_34:
    if ((v3 & 0x80000) == 0)
      goto LABEL_35;
    goto LABEL_114;
  }
LABEL_108:
  v82 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    -[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion");
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = CFSTR("!");
  }
  v85 = (void *)objc_msgSend(v82, "initWithFormat:", CFSTR("|asProduct:%@"), v84);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v85);
  v86 = objc_claimAutoreleasedReturnValue();

  if (v83)
  v5 = (__CFString *)v86;
  if ((v3 & 0x80000) == 0)
  {
LABEL_35:
    if ((v3 & 0x200000) == 0)
      goto LABEL_36;
    goto LABEL_120;
  }
LABEL_114:
  v87 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig asReleaseType](self, "asReleaseType");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    -[SUControllerConfig asReleaseType](self, "asReleaseType");
    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v89 = CFSTR("!");
  }
  v90 = (void *)objc_msgSend(v87, "initWithFormat:", CFSTR("|asRelease:%@"), v89);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v90);
  v91 = objc_claimAutoreleasedReturnValue();

  if (v88)
  v5 = (__CFString *)v91;
  if ((v3 & 0x200000) == 0)
  {
LABEL_36:
    if ((v3 & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_126;
  }
LABEL_120:
  v92 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    -[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile");
    v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v94 = CFSTR("!");
  }
  v95 = (void *)objc_msgSend(v92, "initWithFormat:", CFSTR("|simFile:%@"), v94);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v95);
  v96 = objc_claimAutoreleasedReturnValue();

  if (v93)
  v5 = (__CFString *)v96;
  if ((v3 & 0x800) == 0)
  {
LABEL_37:
    if ((v3 & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_130;
  }
LABEL_126:
  v97 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"))
    v98 = CFSTR("Y");
  else
    v98 = CFSTR("N");
  v99 = (void *)objc_msgSend(v97, "initWithFormat:", CFSTR("|useInstallWindow:%@"), v98);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v99);
  v100 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v100;
  if ((v3 & 0x100000) == 0)
  {
LABEL_38:
    if ((v3 & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_134;
  }
LABEL_130:
  v101 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"))
    v102 = CFSTR("Y");
  else
    v102 = CFSTR("N");
  v103 = (void *)objc_msgSend(v101, "initWithFormat:", CFSTR("|expiredAsExpired:%@"), v102);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v103);
  v104 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v104;
  if ((v3 & 0x1000) == 0)
  {
LABEL_39:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_138;
  }
LABEL_134:
  v105 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"))
    v106 = CFSTR("Y");
  else
    v106 = CFSTR("N");
  v107 = (void *)objc_msgSend(v105, "initWithFormat:", CFSTR("|hideMayReboot:%@"), v106);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v107);
  v108 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v108;
  if ((v3 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v3 & 0x4000) == 0)
      goto LABEL_41;
LABEL_142:
    v113 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (-[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"))
      v114 = CFSTR("Y");
    else
      v114 = CFSTR("N");
    v115 = (void *)objc_msgSend(v113, "initWithFormat:", CFSTR("|requirePrepSize:%@"), v114);
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v115);
    v116 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v116;
    if ((v3 & 0x8000) == 0)
      goto LABEL_46;
    goto LABEL_42;
  }
LABEL_138:
  v109 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (-[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"))
    v110 = CFSTR("Y");
  else
    v110 = CFSTR("N");
  v111 = (void *)objc_msgSend(v109, "initWithFormat:", CFSTR("|asExternal:%@"), v110);
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v111);
  v112 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v112;
  if ((v3 & 0x4000) != 0)
    goto LABEL_142;
LABEL_41:
  if ((v3 & 0x8000) != 0)
  {
LABEL_42:
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (-[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"))
      v20 = CFSTR("Y");
    else
      v20 = CFSTR("N");
    v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("|windowDeltas:%@"), v20);
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v22;
  }
LABEL_46:
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_2518D1100) & 1) == 0)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|"));
    v23 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v23;
  }
  v24 = v5;

  return v24;
}

- (BOOL)_loadBooleanFromDefaults:(id)a3 usingDefault:(BOOL)a4 isStoredInverted:(BOOL)a5
{
  _BOOL4 v5;
  int AppBooleanValue;
  BOOL v8;
  Boolean keyExistsAndHasValidFormat;

  v5 = a5;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.SUController"), &keyExistsAndHasValidFormat);
  v8 = AppBooleanValue != 0;
  if (v5)
    v8 = AppBooleanValue == 0;
  if (keyExistsAndHasValidFormat)
    return v8;
  else
    return a4;
}

- (int64_t)_loadBooleanFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(BOOL)a5 internalDefault:(BOOL)a6 isStoredInverted:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int AppBooleanValue;
  _BOOL4 v13;
  Boolean keyExistsAndHasValidFormat;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.SUController"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v13 = AppBooleanValue != 0;
    if (v7)
      return AppBooleanValue == 0;
  }
  else if (self->_internalDefaultsAsExternal || (unint64_t)(a4 - 1) >= 2)
  {
    return v9;
  }
  else
  {
    return v8;
  }
  return v13;
}

- (int64_t)_loadIntegerFromDefaults:(id)a3 usingDefault:(int64_t)a4 withLimit:(int64_t)a5
{
  __CFString *v8;
  void *v9;
  void *v10;

  v8 = (__CFString *)a3;
  v9 = (void *)CFPreferencesCopyAppValue(v8, CFSTR("com.apple.SUController"));
  v10 = v9;
  if (v9)
    a4 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:](self, "_limitedInteger:checkingValue:forKey:withLimit:", CFSTR("load"), (int)objc_msgSend(v9, "intValue"), v8, a5);

  return a4;
}

- (int64_t)_loadIntegerFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(int64_t)a5 internalDefault:(int64_t)a6 withLimit:(int64_t)a7
{
  __CFString *v12;
  void *v13;
  void *v14;
  int64_t v15;

  v12 = (__CFString *)a3;
  v13 = (void *)CFPreferencesCopyAppValue(v12, CFSTR("com.apple.SUController"));
  v14 = v13;
  if (v13)
  {
    v15 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:](self, "_limitedInteger:checkingValue:forKey:withLimit:", CFSTR("load"), (int)objc_msgSend(v13, "intValue"), v12, a7);
  }
  else if (self->_internalDefaultsAsExternal || (unint64_t)(a4 - 1) >= 2)
  {
    v15 = a5;
  }
  else
  {
    v15 = a6;
  }

  return v15;
}

- (id)_copyStringFromDefaults:(id)a3 usingDefault:(id)a4
{
  id v5;
  CFPropertyListRef v6;
  void *v7;

  v5 = a4;
  v6 = CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.SUController"));
  v7 = (void *)v6;
  if (v5 && !v6)
    v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (BOOL)_storeBooleanToDefaults:(id)a3 toValue:(BOOL)a4 isStoredInverted:(BOOL)a5
{
  const __CFString *v6;

  if (a4 != a5)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  CFPreferencesSetAppValue((CFStringRef)a3, v6, CFSTR("com.apple.SUController"));
  return a4;
}

- (int64_t)_storeIntegerToDefaults:(id)a3 toValue:(int64_t)a4
{
  __CFString *v5;
  void *v6;

  v5 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFPreferencesSetAppValue(v5, v6, CFSTR("com.apple.SUController"));

  return a4;
}

- (id)_storeStringToDefaults:(id)a3 toValue:(id)a4
{
  id v5;

  v5 = a4;
  CFPreferencesSetAppValue((CFStringRef)a3, v5, CFSTR("com.apple.SUController"));
  return v5;
}

- (int64_t)_decodeInteger:(id)a3 forKey:(id)a4 withLimit:(int64_t)a5
{
  id v8;
  int64_t v9;

  v8 = a4;
  v9 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:](self, "_limitedInteger:checkingValue:forKey:withLimit:", CFSTR("decode"), objc_msgSend(a3, "decodeIntegerForKey:", v8), v8, a5);

  return v9;
}

- (int64_t)_limitedInteger:(id)a3 checkingValue:(int64_t)a4 forKey:(id)a5 withLimit:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a3;
  v10 = a5;
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("attempt to %@ %@ to negative value(%ld) - using value of 0"), v9, v10, a4);
    objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", CFSTR("[CONFIG]"), v12, 8102, 0);
    a6 = 0;
    goto LABEL_6;
  }
  if (a6 && a4 > a6)
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("attempt to %@ %@ to over-limit value(%ld) - using value of %ld"), v9, v10, a4, a6);
    objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", CFSTR("[CONFIG]"), v12, 8102, 0);
LABEL_6:

    a4 = a6;
  }

  return a4;
}

- (BOOL)_runningOnAppleTV
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEAEA40], "sharedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV"));

  return v4;
}

- (BOOL)useSUCore
{
  return self->_useSUCore;
}

- (void)setUseSUCore:(BOOL)a3
{
  self->_useSUCore = a3;
}

- (int64_t)preservePreparedMaxAttempts
{
  return self->_preservePreparedMaxAttempts;
}

- (void)setPreservePreparedMaxAttempts:(int64_t)a3
{
  self->_preservePreparedMaxAttempts = a3;
}

- (BOOL)vpnOnDemandAsInternal
{
  return self->_vpnOnDemandAsInternal;
}

- (void)setVpnOnDemandAsInternal:(BOOL)a3
{
  self->_vpnOnDemandAsInternal = a3;
}

- (BOOL)performAutoScan
{
  return self->_performAutoScan;
}

- (void)setPerformAutoScan:(BOOL)a3
{
  self->_performAutoScan = a3;
}

- (BOOL)performAutoDownloadAndPrepare
{
  return self->_performAutoDownloadAndPrepare;
}

- (void)setPerformAutoDownloadAndPrepare:(BOOL)a3
{
  self->_performAutoDownloadAndPrepare = a3;
}

- (BOOL)performAutoInstall
{
  return self->_performAutoInstall;
}

- (void)setPerformAutoInstall:(BOOL)a3
{
  self->_performAutoInstall = a3;
}

- (BOOL)autoAcceptTermsAndConditions
{
  return self->_autoAcceptTermsAndConditions;
}

- (void)setAutoAcceptTermsAndConditions:(BOOL)a3
{
  self->_autoAcceptTermsAndConditions = a3;
}

- (int64_t)autoActivityCheckPeriod
{
  return self->_autoActivityCheckPeriod;
}

- (void)setAutoActivityCheckPeriod:(int64_t)a3
{
  self->_autoActivityCheckPeriod = a3;
}

- (int64_t)autoInstallForceMaxWait
{
  return self->_autoInstallForceMaxWait;
}

- (void)setAutoInstallForceMaxWait:(int64_t)a3
{
  self->_autoInstallForceMaxWait = a3;
}

- (int64_t)autoInstallWindowBeginHour
{
  return self->_autoInstallWindowBeginHour;
}

- (void)setAutoInstallWindowBeginHour:(int64_t)a3
{
  self->_autoInstallWindowBeginHour = a3;
}

- (int64_t)autoInstallWindowBeginMinute
{
  return self->_autoInstallWindowBeginMinute;
}

- (void)setAutoInstallWindowBeginMinute:(int64_t)a3
{
  self->_autoInstallWindowBeginMinute = a3;
}

- (int64_t)autoInstallWindowEndHour
{
  return self->_autoInstallWindowEndHour;
}

- (void)setAutoInstallWindowEndHour:(int64_t)a3
{
  self->_autoInstallWindowEndHour = a3;
}

- (int64_t)autoInstallWindowEndMinute
{
  return self->_autoInstallWindowEndMinute;
}

- (void)setAutoInstallWindowEndMinute:(int64_t)a3
{
  self->_autoInstallWindowEndMinute = a3;
}

- (BOOL)downloadDocAsset
{
  return self->_downloadDocAsset;
}

- (void)setDownloadDocAsset:(BOOL)a3
{
  self->_downloadDocAsset = a3;
}

- (BOOL)ignoreRamping
{
  return self->_ignoreRamping;
}

- (void)setIgnoreRamping:(BOOL)a3
{
  self->_ignoreRamping = a3;
}

- (NSString)installPhaseOSBackgroundImagePath
{
  return self->_installPhaseOSBackgroundImagePath;
}

- (void)setInstallPhaseOSBackgroundImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_installPhaseOSBackgroundImagePath, a3);
}

- (BOOL)supervisedMDM
{
  return self->_supervisedMDM;
}

- (void)setSupervisedMDM:(BOOL)a3
{
  self->_supervisedMDM = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPMV, a3);
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (BOOL)restrictToFullReplacement
{
  return self->_restrictToFullReplacement;
}

- (void)setRestrictToFullReplacement:(BOOL)a3
{
  self->_restrictToFullReplacement = a3;
}

- (BOOL)allowSameVersionUpdates
{
  return self->_allowSameVersionUpdates;
}

- (void)setAllowSameVersionUpdates:(BOOL)a3
{
  self->_allowSameVersionUpdates = a3;
}

- (BOOL)useSpecifiedInstallWindow
{
  return self->_useSpecifiedInstallWindow;
}

- (void)setUseSpecifiedInstallWindow:(BOOL)a3
{
  self->_useSpecifiedInstallWindow = a3;
}

- (BOOL)expiredSpecifiedAsExpired
{
  return self->_expiredSpecifiedAsExpired;
}

- (void)setExpiredSpecifiedAsExpired:(BOOL)a3
{
  self->_expiredSpecifiedAsExpired = a3;
}

- (BOOL)hideIndicationMayReboot
{
  return self->_hideIndicationMayReboot;
}

- (void)setHideIndicationMayReboot:(BOOL)a3
{
  self->_hideIndicationMayReboot = a3;
}

- (BOOL)internalDefaultsAsExternal
{
  return self->_internalDefaultsAsExternal;
}

- (void)setInternalDefaultsAsExternal:(BOOL)a3
{
  self->_internalDefaultsAsExternal = a3;
}

- (BOOL)requirePrepareSize
{
  return self->_requirePrepareSize;
}

- (void)setRequirePrepareSize:(BOOL)a3
{
  self->_requirePrepareSize = a3;
}

- (BOOL)installWindowAsDeltas
{
  return self->_installWindowAsDeltas;
}

- (void)setInstallWindowAsDeltas:(BOOL)a3
{
  self->_installWindowAsDeltas = a3;
}

- (NSString)updateMetricContext
{
  return self->_updateMetricContext;
}

- (void)setUpdateMetricContext:(id)a3
{
  objc_storeStrong((id *)&self->_updateMetricContext, a3);
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, a3);
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, a3);
}

- (NSString)asReleaseType
{
  return self->_asReleaseType;
}

- (void)setAsReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_asReleaseType, a3);
}

- (NSString)simulatorCommandsFile
{
  return self->_simulatorCommandsFile;
}

- (void)setSimulatorCommandsFile:(id)a3
{
  objc_storeStrong((id *)&self->_simulatorCommandsFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatorCommandsFile, 0);
  objc_storeStrong((id *)&self->_asReleaseType, 0);
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, 0);
  objc_storeStrong((id *)&self->_updateMetricContext, 0);
  objc_storeStrong((id *)&self->_requestedPMV, 0);
  objc_storeStrong((id *)&self->_installPhaseOSBackgroundImagePath, 0);
}

@end
