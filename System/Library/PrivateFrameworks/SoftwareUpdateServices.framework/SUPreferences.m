@implementation SUPreferences

- (SUPreferences)init
{
  SUPreferences *v2;
  SUPreferenceEntry *v3;
  SUPreferenceEntry *v4;
  SUPreferenceEntry *v5;
  SUPreferenceEntry *v6;
  SUPreferenceEntry *v7;
  SUPreferenceEntry *v8;
  SUPreferenceEntry *v9;
  SUPreferenceEntry *v10;
  SUPreferenceEntry *v11;
  SUPreferenceEntry *v12;
  SUPreferenceEntry *v13;
  SUPreferenceEntry *v14;
  SUPreferenceEntry *v15;
  SUPreferenceEntry *v16;
  SUPreferenceEntry *v17;
  SUPreferenceEntry *v18;
  SUPreferenceEntry *v19;
  SUPreferenceEntry *v20;
  SUPreferenceEntry *v21;
  SUPreferenceEntry *v22;
  SUPreferenceEntry *v23;
  SUPreferenceEntry *v24;
  SUPreferenceEntry *v25;
  SUPreferenceEntry *v26;
  SUPreferenceEntry *v27;
  SUPreferenceEntry *v28;
  SUPreferenceEntry *v29;
  SUPreferenceEntry *v30;
  SUPreferenceEntry *v31;
  SUPreferenceEntry *v32;
  SUPreferenceEntry *v33;
  SUPreferenceEntry *v34;
  SUPreferenceEntry *v35;
  SUPreferenceEntry *v36;
  SUPreferenceEntry *v37;
  SUPreferenceEntry *v38;
  SUPreferenceEntry *v39;
  SUPreferenceEntry *v40;
  SUPreferenceEntry *v41;
  SUPreferenceEntry *v42;
  SUPreferenceEntry *v43;
  SUPreferenceEntry *v44;
  SUPreferenceEntry *v45;
  SUPreferenceEntry *v46;
  SUPreferenceEntry *v47;
  SUPreferenceEntry *v48;
  SUPreferenceEntry *v49;
  SUPreferenceEntry *v50;
  SUPreferenceEntry *v51;
  SUPreferenceEntry *v52;
  SUPreferenceEntry *v53;
  SUPreferenceEntry *v54;
  SUPreferenceEntry *v55;
  SUPreferenceEntry *v56;
  SUPreferenceEntry *v57;
  SUPreferenceEntry *v58;
  SUPreferenceEntry *v59;
  SUPreferenceEntry *v60;
  SUPreferenceEntry *v61;
  SUPreferenceEntry *v62;
  SUPreferenceEntry *v63;
  SUPreferenceEntry *v64;
  SUPreferenceEntry *v65;
  SUPreferenceEntry *v66;
  SUPreferenceEntry *v67;
  SUPreferenceEntry *v68;
  SUPreferenceEntry *v69;
  SUPreferenceEntry *v70;
  SUPreferenceEntry *v71;
  SUPreferenceEntry *v72;
  SUPreferenceEntry *v73;
  SUPreferenceEntry *v74;
  SUPreferenceEntry *v75;
  SUPreferenceEntry *v76;
  SUPreferenceEntry *v77;
  SUPreferenceEntry *v78;
  SUPreferenceEntry *v79;
  SUPreferenceEntry *v80;
  SUPreferenceEntry *v81;
  SUPreferenceEntry *v82;
  SUPreferenceEntry *v83;
  SUPreferenceEntry *v84;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v87;

  v87.receiver = self;
  v87.super_class = (Class)SUPreferences;
  v2 = -[SUPreferences init](&v87, sel_init);
  if (v2)
  {
    v2->_preferencesWorkloop = (OS_dispatch_workloop *)dispatch_workloop_create("com.apple.softwareupdateservices.preferencesWorkLoop");
    v2->_cachedPreferences = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->_preferencesDefinitions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->_observers = (NSHashTable *)(id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUUpdateRequiredFromFactory"), 0, CFSTR("Sets mandatory update dictionary value SUMandatoryUpdateRequiredFromFactory"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v3, CFSTR("SUUpdateRequiredFromFactory"));

    v4 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUCheckForUpdateFromFactory"), 0, CFSTR("Sets mandatory update dictionary value SUMandatoryUpdateCheckForUpdateFromFactory"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v4, CFSTR("SUCheckForUpdateFromFactory"));

    v5 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUUpdateRequiredOnErase"), 0, CFSTR("Sets mandatory update dictionary value SUMandatoryUpdateRequiredOnErase"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v5, CFSTR("SUUpdateRequiredOnErase"));

    v6 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUCheckForUpdateOnErase"), 0, CFSTR("Sets mandatory update dictionary value SUMandatoryUpdateCheckForUpdateOnErase"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v6, CFSTR("SUCheckForUpdateOnErase"));

    v7 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableManagedRequest"), 0, CFSTR("Disables managed update requests"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v7, CFSTR("SUDisableManagedRequest"));

    v8 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableUserWiFiOnlyPeriod"), 0, CFSTR("Disables wifi-only download period, allowing cellular download immediately"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v8, CFSTR("SUDisableUserWiFiOnlyPeriod"));

    v9 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableBuildNumberComparison"), 0, CFSTR("Disables build version number comparison"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v9, CFSTR("SUDisableBuildNumberComparison"));

    v10 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAllowSameBuildUpdates"), 0, CFSTR("Allows device to update to the same build version as currently installed version"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v10, CFSTR("SUAllowSameBuildUpdates"));

    v11 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableAvailabilityAlerts"), 0, CFSTR("Disabled SU availability alerts"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v11, CFSTR("SUDisableAvailabilityAlerts"));

    v12 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableAutoDownload"), 0, CFSTR("Disabled automatic downloads of software update assets"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v12, CFSTR("SUDisableAutoDownload"));

    v13 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUScanWeeklyInternally"), 0, CFSTR("Changes the auto scan interval to once a week for internal builds"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v13, CFSTR("SUScanWeeklyInternally"));

    v14 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUForceFullReplacement"), 0, CFSTR("Forces the device to only return full replacement update assets"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v14, CFSTR("SUForceFullReplacement"));

    v15 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisbaleFullReplacementFallback"), 0, CFSTR("Disabled full replacement fallback if prepare fails with patching error"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v15, CFSTR("SUDisbaleFullReplacementFallback"));

    v16 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoDownloadOverrideInterval"), 2, CFSTR("Overrides the auto download interval to a specified number of days"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v16, CFSTR("SUAutoDownloadOverrideInterval"));

    v17 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUUpdateDelayInterval"), 2, CFSTR("Sets the managed update delay period to specified number of days. Requires SUShouldDelayUpdates = true"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v17, CFSTR("SUUpdateDelayInterval"));

    v18 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDelayInMinutes"), 0, CFSTR("Sets the managed update delay period interval to be in minutes instead of days"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v18, CFSTR("SUDelayInMinutes"));

    v19 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUShouldDelayUpdates"), 0, CFSTR("Enables managed update delay period"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v19, CFSTR("SUShouldDelayUpdates"));

    v20 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUUnmetConstraints"), 2, CFSTR("Simulates unmet installation constraints"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v20, CFSTR("SUUnmetConstraints"));

    v21 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SURequestedPMV"), 1, CFSTR("Simulates an MDM administrator pushing a requested product marketing version"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v21, CFSTR("SURequestedPMV"));

    v22 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoUpdateForceOn"), 0, CFSTR("Forces the auto install setting ON for client option and asset attribute"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v22, CFSTR("SUAutoUpdateForceOn"));

    v23 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoUpdateForceOff"), 0, CFSTR("Forces the auto install setting OFF for client option and asset attribute"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v23, CFSTR("SUAutoUpdateForceOff"));

    v24 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoSUStartDelta"), 2, CFSTR("Sets automatic installation start time to N seconds after prepare completes."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v24, CFSTR("SUAutoSUStartDelta"));

    v25 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoSUEndDelta"), 2, CFSTR("Sets automatic installation end time to N seconds after prepare completes"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v25, CFSTR("SUAutoSUEndDelta"));

    v26 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoSUUnlockStartDelta"), 2, CFSTR("Sets automatic installation unlock start time to N seconds after prepare completes"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v26, CFSTR("SUAutoSUUnlockStartDelta"));

    v27 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoSUUnlockEndDelta"), 2, CFSTR("Sets automatic installation unlock end time to N seconds after prepare completes"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v27, CFSTR("SUAutoSUUnlockEndDelta"));

    v28 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutomaticUpdateV2Enabled"), 0, CFSTR("Enables/Disabled automatic update client setting"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v28, CFSTR("SUAutomaticUpdateV2Enabled"));

    v29 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutomaticUpdateV2Enabled_prev"), 0, CFSTR("Enables/Disabled automatic update client setting (previous user specified setting). Probably not what you're looking for. You likely want to use SUAutomaticUpdateV2Enabled"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v29, CFSTR("SUAutomaticUpdateV2Enabled_prev"));

    v30 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUBannerDelay"), 2, CFSTR("Sets the delay value in seconds for presenting auto update banner (30 minutes by default)"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v30, CFSTR("SUBannerDelay"));

    v31 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoDownloadDeletedBuild"), 0, CFSTR("Enabled auto download of deleted builds"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v31, CFSTR("SUAutoDownloadDeletedBuild"));

    v32 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUMDMSoftwareUpdatePath"), 2, CFSTR("Sets the MDM user initiated scan SU path\n\t0 = Default\n\t1 = slow lane\n\t2 = fast lane"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v32, CFSTR("SUMDMSoftwareUpdatePath"));

    v33 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAnalyticsSubmissionInterval"), 2, CFSTR("Sets the time interval(in minutes) for the submission of Analytics events"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v33, CFSTR("SUAnalyticsSubmissionInterval"));

    v34 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUQueryCustomerBuilds"), 0, CFSTR("If set to true, MobileAsset query for SU, brain and doc asset will have NULL ReleaseType"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v34, CFSTR("SUQueryCustomerBuilds"));

    v35 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableRollback"), 0, CFSTR("Disabled Splat rollback"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v35, CFSTR("SUDisableRollback"));

    v36 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUPreferencesSuggestedRollbackSplatVersion"), 1, CFSTR("Suggested rollback splat version"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v36, CFSTR("SUPreferencesSuggestedRollbackSplatVersion"));

    v37 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUUseEmptyPatches"), 0, CFSTR("If set to true, MobileAsset query for SU, brain and doc asset will use \"Empty\" ReleaseType"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v37, CFSTR("SUUseEmptyPatches"));

    v38 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAllowSplatUpdate"), 0, CFSTR("Allow Splat software updates"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v38, CFSTR("SUAllowSplatUpdate"));

    v39 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUFakeSplatInstalled"), 0, CFSTR("Fake Splat installed"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v39, CFSTR("SUFakeSplatInstalled"));

    v40 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAllowSameSplatUpdate"), 0, CFSTR("Allow updating Splat to the same version as currently installed splat"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v40, CFSTR("SUAllowSameSplatUpdate"));

    v41 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSplatScanInterval"), 2, CFSTR("Auto-scan interval for splat updates"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v41, CFSTR("SUSplatScanInterval"));

    v42 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSystemDataFilesForceOn"), 0, CFSTR("Forces the auto install system and data files setting ON for client option and asset attribute"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v42, CFSTR("SUAutoInstallSystemDataFilesForceOn"));

    v43 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSystemDataFilesForceOff"), 0, CFSTR("Forces the auto install system and data files setting OFF for client option and asset attribute"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v43, CFSTR("SUAutoInstallSystemDataFilesForceOff"));

    v44 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSystemDataFiles"), 0, CFSTR("Auto install system and data files"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v44, CFSTR("SUAutoInstallSystemDataFiles"));

    v45 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSecurityResponseForceOn"), 0, CFSTR("Forces the auto install Rapid Security Reponse setting ON for client option and asset attribute"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v45, CFSTR("SUAutoInstallSecurityResponseForceOn"));

    v46 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSecurityResponseForceOff"), 0, CFSTR("Forces the auto install Rapid Security Reponse setting OFF for client option and asset attribute"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v46, CFSTR("SUAutoInstallSecurityResponseForceOff"));

    v47 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSecurityResponse"), 0, CFSTR("Auto install Rapid Security Response"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v47, CFSTR("SUAutoInstallSecurityResponse"));

    v48 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallSecurityResponse_prev"), 0, CFSTR("Auto install Rapid Security Response (previous user specified setting). Probably not what you're looking for. You likely want to use SUAutoInstallSecurityResponse"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v48, CFSTR("SUAutoInstallSecurityResponse_prev"));

    v49 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUIgnoreBatteryInfo"), 0, CFSTR("If set to true, battery will be considered as plugged-in and fully charged"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v49, CFSTR("SUIgnoreBatteryInfo"));

    v50 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUBatteryInfoOverridePluggedIn"), 2, CFSTR("If set to true, battery will be considered as plugged-in. If false, battery will be considered as not plugged in. This overrides SUIgnoreBatteryInfo"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v50, CFSTR("SUBatteryInfoOverridePluggedIn"));

    v51 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUBatteryInfoOverrideWirelessCharging"), 2, CFSTR("If set to true, battery will be considered as wirelessly charging. If false, battery will be considered as wirelessly charging. This overrides SUIgnoreBatteryInfo"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v51, CFSTR("SUBatteryInfoOverrideWirelessCharging"));

    v52 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUBatteryLevelOverride"), 2, CFSTR("Set this to a numerical value from 0 to 100 to override the current battery level. This overrides SUIgnoreBatteryInfo"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v52, CFSTR("SUBatteryLevelOverride"));

    v53 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUCustomerPowerPolicies"), 0, CFSTR("If set to true, customer power policies will be used on internal build"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v53, CFSTR("SUCustomerPowerPolicies"));

    v54 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisablePurgeOnNewerUpdateFound"), 0, CFSTR("If set to true, prepared updates will not be purged if a newer update is located"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v54, CFSTR("SUDisablePurgeOnNewerUpdateFound"));

    v55 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SURecommendedUpdateInterval"), 2, CFSTR("Interval time in seconds between recommended update notifications"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v55, CFSTR("SURecommendedUpdateInterval"));

    v56 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUUseXPCActivityScheduler"), 0, CFSTR("If set to true, the SUCoreXPCActivity scheduler will be used for scheduling"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v56, CFSTR("SUUseXPCActivityScheduler"));

    v57 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUNetworkMonitorOverride"), 2, CFSTR("Set this to override the network monitor."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v57, CFSTR("SUNetworkMonitorOverride"));

    v58 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSkipDownload"), 0, CFSTR("If set to true, skip the download and the apply phases."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v58, CFSTR("SUSkipDownload"));

    v59 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSkipApply"), 0, CFSTR("If set to true, skip the apply phase."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v59, CFSTR("SUSkipApply"));

    v60 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSuppressSSOTokenInInstall"), 0, CFSTR("If set to true, suppress issuing apple connect SSO token when installing SU."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v60, CFSTR("SUSuppressSSOTokenInInstall"));

    v61 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSuppressSSOTokenInDownload"), 0, CFSTR("If set to true, suppress issuing apple connect SSO token when downloading SU asset."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v61, CFSTR("SUSuppressSSOTokenInDownload"));

    v62 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUKeybagState"), 2, CFSTR("Set this to override the keybag state."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v62, CFSTR("SUKeybagState"));

    v63 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUBuddyInitiatedScan"), 0, CFSTR("If set to true, scans will be buddy-initiated"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v63, CFSTR("SUBuddyInitiatedScan"));

    v64 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUHaveEnoughSpace"), 0, CFSTR("If set to false, it forces a storage shortage error; otherwise takes no effect"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v64, CFSTR("SUHaveEnoughSpace"));

    v65 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSpacePurgeSuccessful"), 0, CFSTR("If set to false, it forces a space purge failure; otherwise forces a success."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v65, CFSTR("SUSpacePurgeSuccessful"));

    v66 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSpacePurgeTime"), 2, CFSTR("Number of seconds for space purge (+[SUSpace makeRoomForUpdate:error:]) to finish. Even => success; odd => failure."));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v66, CFSTR("SUSpacePurgeTime"));

    v67 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUBypassSystemRootWarning"), 0, CFSTR("If set to true, updates won't be blocked on live fs"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v67, CFSTR("SUBypassSystemRootWarning"));

    v68 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableAutoDownloadJitter"), 0, CFSTR("If set to true, disable jitter for auto downloads"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v68, CFSTR("SUDisableAutoDownloadJitter"));

    v69 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUFakeAppOffload"), 0, CFSTR("If set to true, fake an app offload when making room"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v69, CFSTR("SUFakeAppOffload"));

    v70 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableAutoInstallJitter"), 0, CFSTR("If set to true, disable jitter for auto installations"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v70, CFSTR("SUDisableAutoInstallJitter"));

    v71 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUAutoInstallRetryDelay"), 2, CFSTR("Delay before scheduling another auto installation"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v71, CFSTR("SUAutoInstallRetryDelay"));

    v72 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUOverrideRamping"), 0, CFSTR("If set to true, descriptors will be considered ramped"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v72, CFSTR("SUOverrideRamping"));

    v73 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUOverrideGranularRamping"), 0, CFSTR("If set to true, descriptors will be considered granularly ramped"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v73, CFSTR("SUOverrideGranularRamping"));

    v74 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUOverrideScanSessionIDRampingPortion"), 1, CFSTR("To override the ramping portion of a scan session id"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v74, CFSTR("SUOverrideScanSessionIDRampingPortion"));

    v75 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUOverrideAllowAutoDownloadOnBattery"), 0, CFSTR("If set to true, allow auto-downloading on battery"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v75, CFSTR("SUOverrideAllowAutoDownloadOnBattery"));

    v76 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUOverrideAutoDownloadOnBatteryDelay"), 2, CFSTR("Delay before auto-downloading on battery after the update is fully-unramped"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v76, CFSTR("SUOverrideAutoDownloadOnBatteryDelay"));

    v77 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableSplombo"), 0, CFSTR("If set to false, enable splombo"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v77, CFSTR("SUDisableSplombo"));

    v78 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUFakeInstallFailure"), 0, CFSTR("If set to true, force an installation failure"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v78, CFSTR("SUFakeInstallFailure"));

    v79 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUDisableFollowUps"), 0, CFSTR("If set to true, don't post followups"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v79, CFSTR("SUDisableFollowUps"));

    v80 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUOverrideSplatComboBuildVersion"), 1, CFSTR("Set to override the build version of the associated splat for a splombo"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v80, CFSTR("SUOverrideSplatComboBuildVersion"));

    v81 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUEnablePreSuStaging"), 0, CFSTR("If set to true, enable pre SU staging in SUCore"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v81, CFSTR("SUEnablePreSuStaging"));

    v82 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUEnablePreSuStagingForOptionalAssets"), 0, CFSTR("If set to true, enable pre SU staging for optional assets in SUCore"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v82, CFSTR("SUEnablePreSuStagingForOptionalAssets"));

    v83 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSSOUsernameForPersonalization"), 1, CFSTR("If set, use this username for personalization"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v83, CFSTR("SUSSOUsernameForPersonalization"));

    v84 = -[SUPreferenceEntry initWithKey:type:description:]([SUPreferenceEntry alloc], "initWithKey:type:description:", CFSTR("SUSSOTokenForPersonalization"), 1, CFSTR("If set, use this token for personalization"));
    -[NSMutableDictionary setValue:forKey:](v2->_preferencesDefinitions, "setValue:forKey:", v84, CFSTR("SUSSOTokenForPersonalization"));

    -[SUPreferences _loadPreferences](v2, "_loadPreferences");
    -[SUPreferences _setupAutomaticUpdateV2Enabled](v2, "_setupAutomaticUpdateV2Enabled");
    CFPreferencesSynchronize(CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__SUPreferencesChanged, CFSTR("SUPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SUPreferencesChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SUPreferences;
  -[SUPreferences dealloc](&v4, sel_dealloc);
}

+ (SUPreferences)sharedInstance
{
  if (sharedInstance_pred_4 != -1)
    dispatch_once(&sharedInstance_pred_4, &__block_literal_global_22);
  return (SUPreferences *)sharedInstance___instance_10;
}

SUPreferences *__31__SUPreferences_sharedInstance__block_invoke()
{
  SUPreferences *result;

  result = objc_alloc_init(SUPreferences);
  sharedInstance___instance_10 = (uint64_t)result;
  return result;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](-[SUPreferences observers](self, "observers"), "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](-[SUPreferences observers](self, "observers"), "removeObject:", a3);
}

- (BOOL)disableManagedRequest
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableManagedRequest"), 0);
}

- (BOOL)disableUserWiFiOnlyPeriod
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableUserWiFiOnlyPeriod"), 0);
}

- (BOOL)disableBuildNumberComparison
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableBuildNumberComparison"), 0);
}

- (BOOL)allowSameBuildUpdates
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAllowSameBuildUpdates"), 0);
}

- (BOOL)disableAvailabilityAlerts
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableAvailabilityAlerts"), 0);
}

- (BOOL)disableAutoDownload
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableAutoDownload"), -[SUPreferences _autoDownloadDisableDefaultValue](self, "_autoDownloadDisableDefaultValue"));
}

- (BOOL)scanWeeklyInternally
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUScanWeeklyInternally"), 0);
}

- (NSNumber)autoDownloadOverrideInterval
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAutoDownloadOverrideInterval"));
}

- (BOOL)forceFullReplacement
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUForceFullReplacement"), 0);
}

- (BOOL)disableFullReplacementFallback
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisbaleFullReplacementFallback"), 0);
}

- (BOOL)shouldDelayUpdates
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUShouldDelayUpdates"), 0);
}

- (NSNumber)updateDelayInterval
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUUpdateDelayInterval"));
}

- (BOOL)shouldDelayInMinutes
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDelayInMinutes"), 0);
}

- (NSNumber)unmetConstraints
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUUnmetConstraints"));
}

- (BOOL)allowSplatUpdate
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAllowSplatUpdate"), 1);
}

- (BOOL)fakeSplatInstalled
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUFakeSplatInstalled"), 0);
}

- (BOOL)allowSameRestoreVersionSplatUpdate
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAllowSameSplatUpdate"), 0);
}

- (BOOL)autoInstallSystemDataFilesForceOn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSystemDataFilesForceOn"), 0);
  if (v9)
    SULogInfo(CFSTR("%s: %@ is ON"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSystemDataFilesForceOn]");
  return v9;
}

- (BOOL)autoInstallSystemDataFilesForceOff
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSystemDataFilesForceOff"), 0);
  if (v9)
    SULogInfo(CFSTR("%s: %@ is OFF"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSystemDataFilesForceOff]");
  return v9;
}

- (BOOL)autoInstallSystemAndDataFiles
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSystemDataFiles"), -[SUPreferences _autoInstallSystemDataFilesDefaultValue](self, "_autoInstallSystemDataFilesDefaultValue"));
}

- (BOOL)autoInstallSecurityResponseForceOn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSecurityResponseForceOn"), 0);
  if (v9)
    SULogInfo(CFSTR("%s: %@ is ON"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSecurityResponseForceOn]");
  return v9;
}

- (BOOL)autoInstallSecurityResponseForceOff
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSecurityResponseForceOff"), 0);
  if (v9)
    SULogInfo(CFSTR("%s: %@ is OFF"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSecurityResponseForceOff]");
  return v9;
}

- (BOOL)autoInstallSecurityResponse
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSecurityResponse"), -[SUPreferences _autoInstallSecurityResponseDefaultValue](self, "_autoInstallSecurityResponseDefaultValue"));
}

- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoInstallSecurityResponse_prev"), -[SUPreferences _autoInstallSecurityResponseDefaultValue](self, "_autoInstallSecurityResponseDefaultValue"));
}

- (NSNumber)splatScanInterval
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUSplatScanInterval"));
}

- (NSString)requestedPMV
{
  return (NSString *)-[SUPreferences _cachedStringValueForKey:](self, "_cachedStringValueForKey:", CFSTR("SURequestedPMV"));
}

- (NSNumber)autoSUStartDelta
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAutoSUStartDelta"));
}

- (NSNumber)autoSUEndDelta
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAutoSUEndDelta"));
}

- (NSNumber)autoSUUnlockStartDelta
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAutoSUUnlockStartDelta"));
}

- (NSNumber)autoSUUnlockEndDelta
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAutoSUUnlockEndDelta"));
}

- (BOOL)autoUpdateForceOn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoUpdateForceOn"), 0);
  if (v9)
    SULogInfo(CFSTR("%s: %@ is ON"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoUpdateForceOn]");
  return v9;
}

- (BOOL)autoUpdateForceOff
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoUpdateForceOff"), 0);
  if (v9)
    SULogInfo(CFSTR("%s: %@ is OFF"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoUpdateForceOff]");
  return v9;
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutomaticUpdateV2Enabled"), -[SUPreferences _autoInstallDefaultValue](self, "_autoInstallDefaultValue"));
}

- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutomaticUpdateV2Enabled_prev"), -[SUPreferences _autoInstallDefaultValue](self, "_autoInstallDefaultValue"));
}

- (NSNumber)bannerDelay
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUBannerDelay"));
}

- (BOOL)autoDownloadDeletedBuild
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUAutoDownloadDeletedBuild"), 0);
}

- (NSNumber)MDMSoftwareUpdatePath
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUMDMSoftwareUpdatePath"));
}

- (NSNumber)analyticsSubmissionIntervalOverride
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAnalyticsSubmissionInterval"));
}

- (BOOL)queryCustomerBuilds
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUQueryCustomerBuilds"), 0);
}

- (BOOL)disableRollback
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableRollback"), 0);
}

- (NSString)suggestedRollbackSplatVersion
{
  return (NSString *)-[SUPreferences _cachedStringValueForKey:](self, "_cachedStringValueForKey:", CFSTR("SUPreferencesSuggestedRollbackSplatVersion"));
}

- (void)setSuggestedRollbackSplatVersion:(id)a3
{
  -[SUPreferences setPreference:toValue:](self, "setPreference:toValue:", CFSTR("SUPreferencesSuggestedRollbackSplatVersion"), a3);
}

- (BOOL)useEmptyPatches
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUUseEmptyPatches"), 0);
}

- (BOOL)disablePurgeOnNewerUpdateFound
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisablePurgeOnNewerUpdateFound"), 0);
}

- (void)_loadPreferences
{
  NSObject *preferencesWorkloop;
  _QWORD block[5];

  preferencesWorkloop = self->_preferencesWorkloop;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUPreferences__loadPreferences__block_invoke;
  block[3] = &unk_24CE3BA38;
  block[4] = self;
  dispatch_async_and_wait(preferencesWorkloop, block);
}

void __33__SUPreferences__loadPreferences__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  SULogInfo(CFSTR("%s: loading preferences"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUPreferences _loadPreferences]_block_invoke");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v18 = v10;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v9);
        v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "isKeySetInPreferences:", objc_msgSend(v21, "preferenceKey")))
        {
          v22 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyValueOfKey:withType:", objc_msgSend(v21, "preferenceKey"), objc_msgSend(v21, "type"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setValue:forKey:", v22, objc_msgSend(v21, "preferenceKey"));

        }
      }
      v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }
  SULogInfo(CFSTR("%s: done loading preferences"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUPreferences _loadPreferences]_block_invoke");
}

- (id)_mandatorySUFlagsForPreferences
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("SUUpdateRequiredFromFactory");
  v18[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v17[1] = CFSTR("SUCheckForUpdateFromFactory");
  v18[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v17[2] = CFSTR("SUUpdateRequiredOnErase");
  v18[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v17[3] = CFSTR("SUCheckForUpdateOnErase");
  v18[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 8);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_msgSend(v3, "allKeys", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[SUPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", v10, 0))
        {
          v7 |= objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v10), "unsignedIntegerValue");
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
}

- (id)_copyValueOfKey:(id)a3 withType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  id result;

  if (a4 == 2)
    return -[SUPreferences _copyNumberPreferenceForKey:](self, "_copyNumberPreferenceForKey:", a3);
  if (a4 == 1)
    return -[SUPreferences _copyStringPreferenceForKey:](self, "_copyStringPreferenceForKey:", a3);
  if (a4)
  {
    SULogInfo(CFSTR("Unknown SUPreferenceType for key: %@ type:%ld"), (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, (uint64_t)a3);
  }
  else
  {
    v8 = -[SUPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", a3);
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  }
  return result;
}

- (BOOL)_getBooleanPreferenceForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  void *v5;
  const void *v6;

  v5 = -[SUPreferences _copyPreferenceForKey:ofType:](self, "_copyPreferenceForKey:ofType:", a3, CFBooleanGetTypeID());
  if (v5)
  {
    v6 = v5;
    a4 = CFBooleanGetValue((CFBooleanRef)v5) != 0;
    CFRelease(v6);
  }
  return a4;
}

- (void)_setCachedBooleanPreferenceForKey:(id)a3 value:(BOOL)a4
{
  NSObject *preferencesWorkloop;
  _QWORD block[6];
  BOOL v6;

  preferencesWorkloop = self->_preferencesWorkloop;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUPreferences__setCachedBooleanPreferenceForKey_value___block_invoke;
  block[3] = &unk_24CE3E530;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(preferencesWorkloop, block);
}

uint64_t __57__SUPreferences__setCachedBooleanPreferenceForKey_value___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)), *(_QWORD *)(a1 + 40));
}

- (id)_cachedObjectForKey:(id)a3 ofClass:(Class)a4
{
  NSObject *preferencesWorkloop;
  void *v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__21;
  v12 = __Block_byref_object_dispose__21;
  v13 = 0;
  preferencesWorkloop = self->_preferencesWorkloop;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SUPreferences__cachedObjectForKey_ofClass___block_invoke;
  v7[3] = &unk_24CE3E558;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_async_and_wait(preferencesWorkloop, v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __45__SUPreferences__cachedObjectForKey_ofClass___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 24), "valueForKey:", a1[5]);
  if (result)
  {
    v3 = result;
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = v3;
  }
  return result;
}

- (BOOL)_cachedBoolValueForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5;

  v5 = -[SUPreferences _cachedObjectForKey:ofClass:](self, "_cachedObjectForKey:ofClass:", a3, objc_opt_class());
  if (v5)
    return objc_msgSend(v5, "BOOLValue");
  else
    return a4;
}

- (id)_cachedStringValueForKey:(id)a3
{
  return -[SUPreferences _cachedObjectForKey:ofClass:](self, "_cachedObjectForKey:ofClass:", a3, objc_opt_class());
}

- (id)_cachedNumberValueForKey:(id)a3
{
  return -[SUPreferences _cachedObjectForKey:ofClass:](self, "_cachedObjectForKey:ofClass:", a3, objc_opt_class());
}

- (void)_setBooleanPreferenceForKey:(id)a3 value:(BOOL)a4
{
  CFPropertyListRef *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4)
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  else
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  v5 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue((CFStringRef)a3, *v4, CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), v5);
  SULogDebug(CFSTR("%s: posting change notification... Key: %@ enabled: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUPreferences _setBooleanPreferenceForKey:value:]");
  notify_post((const char *)objc_msgSend(CFSTR("SUPreferencesChangedNotification"), "UTF8String"));
}

- (void)_setObjectPreferenceForKey:(id)a3 value:(id)a4
{
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue((CFStringRef)a3, a4, CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), v4);
  SULogDebug(CFSTR("%s: posting change notification... Key: %@: Value: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUPreferences _setObjectPreferenceForKey:value:]");
  notify_post((const char *)objc_msgSend(CFSTR("SUPreferencesChangedNotification"), "UTF8String"));
}

- (id)_copyStringPreferenceForKey:(id)a3
{
  return -[SUPreferences _copyPreferenceForKey:ofType:](self, "_copyPreferenceForKey:ofType:", a3, CFStringGetTypeID());
}

- (id)_copyNumberPreferenceForKey:(id)a3
{
  return -[SUPreferences _copyPreferenceForKey:ofType:](self, "_copyPreferenceForKey:ofType:", a3, CFNumberGetTypeID());
}

- (void)_copyPreferenceForKey:(__CFString *)a3 ofType:(unint64_t)a4
{
  CFPropertyListRef v5;
  const void *v6;

  v5 = CFPreferencesCopyValue(a3, CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  v6 = v5;
  if (v5 && CFGetTypeID(v5) != a4)
  {
    CFRelease(v6);
    return 0;
  }
  return (void *)v6;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (-[SUPreferences isAutomaticUpdateV2Enabled](self, "isAutomaticUpdateV2Enabled") != a3)
  {
    if (v3 && -[SUPreferences disableAutoDownload](self, "disableAutoDownload"))
    {
      SULogInfo(CFSTR("Unable to enabled auto update while auto download is disabled"), v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled"), v3);
      -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled"), v3);
      notify_post((const char *)objc_msgSend(CFSTR("SUPreferencesChangedNotificationAutoUpdate"), "UTF8String"));
    }
  }
}

- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (-[SUPreferences previousUserSpecifiedAutomaticUpdateV2Enabled](self, "previousUserSpecifiedAutomaticUpdateV2Enabled") != a3)
  {
    if (v3 && -[SUPreferences disableAutoDownload](self, "disableAutoDownload"))
    {
      SULogInfo(CFSTR("Unable to enabled auto update while auto download is disabled"), v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled_prev"), v3);
      -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled_prev"), v3);
    }
  }
}

- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  v3 = a3;
  if (-[SUPreferences autoInstallSystemAndDataFiles](self, "autoInstallSystemAndDataFiles") != a3)
  {
    v12 = CFSTR("disabled");
    if (v3)
      v12 = CFSTR("enabled");
    SULogInfo(CFSTR("Setting auto install system and data files to %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
    -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutoInstallSystemDataFiles"), v3);
    -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUAutoInstallSystemDataFiles"), v3);
  }
}

- (void)enableAutoInstallSecurityResponse:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  v3 = a3;
  if (-[SUPreferences autoInstallSecurityResponse](self, "autoInstallSecurityResponse") != a3)
  {
    v12 = CFSTR("disabled");
    if (v3)
      v12 = CFSTR("enabled");
    SULogInfo(CFSTR("Setting auto install Rapid Security Response to %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
    -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutoInstallSecurityResponse"), v3);
    -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUAutoInstallSecurityResponse"), v3);
  }
}

- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  v3 = a3;
  if (-[SUPreferences previousUserSpecifiedAutoInstallSecurityResponse](self, "previousUserSpecifiedAutoInstallSecurityResponse") != a3)
  {
    v12 = CFSTR("disabled");
    if (v3)
      v12 = CFSTR("enabled");
    SULogInfo(CFSTR("Setting auto install Rapid Security Response (previous user specified) to %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
    -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutoInstallSecurityResponse_prev"), v3);
    -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUAutoInstallSecurityResponse_prev"), v3);
  }
}

- (BOOL)isAutomaticDownloadEnabled
{
  return !-[SUPreferences disableAutoDownload](self, "disableAutoDownload");
}

- (BOOL)isAutoDownloadDisabled
{
  return !-[SUPreferences isAutomaticDownloadEnabled](self, "isAutomaticDownloadEnabled");
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[SUPreferences isAutomaticDownloadEnabled](self, "isAutomaticDownloadEnabled") != a3)
  {
    -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUDisableAutoDownload"), !v3);
    -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUDisableAutoDownload"), !v3);
    if (!v3)
    {
      -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled"), 0);
      -[SUPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled"), 0);
      notify_post((const char *)objc_msgSend(CFSTR("SUPreferencesChangedNotificationAutoUpdate"), "UTF8String"));
    }
  }
}

- (BOOL)isChinaDevice
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  char v11;

  v2 = (void *)MGCopyAnswerWithError();
  if (v2)
  {
    v10 = v2;
    v11 = objc_msgSend(v2, "isEqualToString:", CFSTR("CH"));
    CFRelease(v10);
  }
  else
  {
    SULogDebug(CFSTR("Failed to copy region code: %d"), v3, v4, v5, v6, v7, v8, v9, 0);
    return 0;
  }
  return v11;
}

- (BOOL)_autoInstallDefaultValue
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (!-[SUPreferences isChinaDevice](self, "isChinaDevice"))
    return -[SUPreferences isAutomaticDownloadEnabled](self, "isAutomaticDownloadEnabled");
  SULogDebug(CFSTR("Defaulting to Auto Install OFF for green tea"), v3, v4, v5, v6, v7, v8, v9, v11);
  return 0;
}

- (BOOL)_autoInstallSystemDataFilesDefaultValue
{
  return 1;
}

- (BOOL)_autoInstallSecurityResponseDefaultValue
{
  BOOL v3;

  v3 = -[SUPreferences autoInstallSystemAndDataFiles](self, "autoInstallSystemAndDataFiles");
  if (-[SUPreferences isChinaDevice](self, "isChinaDevice"))
    return -[SUPreferences isAutomaticUpdateV2Enabled](self, "isAutomaticUpdateV2Enabled");
  else
    return v3;
}

- (BOOL)isKeySetInPreferences:(id)a3
{
  CFPropertyListRef v3;
  CFPropertyListRef v4;

  v3 = CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4 != 0;
}

- (void)_setupAutomaticUpdateV2Enabled
{
  _BOOL8 v3;

  v3 = !-[SUPreferences disableAutoDownload](self, "disableAutoDownload")
    && -[SUPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("SUAutomaticUpdateV2Enabled"), -[SUPreferences _autoInstallDefaultValue](self, "_autoInstallDefaultValue"));
  -[SUPreferences _setCachedBooleanPreferenceForKey:value:](self, "_setCachedBooleanPreferenceForKey:value:", CFSTR("SUAutomaticUpdateV2Enabled"), v3);
}

- (BOOL)ignoreBatteryInfo
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUIgnoreBatteryInfo"), 0);
}

- (BOOL)customerPowerPolicies
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUCustomerPowerPolicies"), 0);
}

- (NSNumber)batteryOverridePluggedIn
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUBatteryInfoOverridePluggedIn"));
}

- (NSNumber)batteryOverrideWirelessCharging
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUBatteryInfoOverrideWirelessCharging"));
}

- (NSNumber)batteryLevelOverride
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUBatteryLevelOverride"));
}

- (NSNumber)recommendedUpdateInterval
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SURecommendedUpdateInterval"));
}

- (BOOL)useSUCoreXPCActivityScheduler
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUUseXPCActivityScheduler"), 0);
}

- (NSNumber)networkMonitorOverride
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUNetworkMonitorOverride"));
}

- (BOOL)skipDownload
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUSkipDownload"), 0);
}

- (BOOL)skipApply
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUSkipApply"), 0);
}

- (BOOL)suppressSSOTokenInInstall
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUSuppressSSOTokenInInstall"), 0);
}

- (BOOL)suppressSSOTokenInDownload
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUSuppressSSOTokenInDownload"), 0);
}

- (NSNumber)keybagState
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUKeybagState"));
}

- (BOOL)buddyInitiatedScan
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUBuddyInitiatedScan"), 0);
}

- (BOOL)haveEnoughSpace
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUHaveEnoughSpace"), 1);
}

- (BOOL)spacePurgeSuccessful
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUSpacePurgeSuccessful"), 1);
}

- (NSNumber)spacePurgeTime
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUSpacePurgeTime"));
}

- (BOOL)bypassSystemRootWarning
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUBypassSystemRootWarning"), 0);
}

- (BOOL)disableAutoDownloadJitter
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableAutoDownloadJitter"), 0);
}

- (BOOL)fakeAppOffload
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUFakeAppOffload"), 0);
}

- (BOOL)disableAutoInstallJitter
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableAutoInstallJitter"), 0);
}

- (NSNumber)autoInstallRetryDelay
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUAutoInstallRetryDelay"));
}

- (BOOL)overrideRamping
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUOverrideRamping"), 0);
}

- (BOOL)overrideGranularRamping
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUOverrideGranularRamping"), 0);
}

- (NSString)overrideScanSessionIDRampingPortion
{
  return (NSString *)-[SUPreferences _cachedStringValueForKey:](self, "_cachedStringValueForKey:", CFSTR("SUOverrideScanSessionIDRampingPortion"));
}

- (BOOL)overrideAllowAutoDownloadOnBattery
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUOverrideAllowAutoDownloadOnBattery"), 0);
}

- (NSNumber)overrideAutoDownloadOnBatteryDelay
{
  return (NSNumber *)-[SUPreferences _cachedNumberValueForKey:](self, "_cachedNumberValueForKey:", CFSTR("SUOverrideAutoDownloadOnBatteryDelay"));
}

- (BOOL)disableSplombo
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableSplombo"), 0);
}

- (BOOL)fakeInstallFailure
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUFakeInstallFailure"), 0);
}

- (NSString)overrideSplatComboBuildVersion
{
  return (NSString *)-[SUPreferences _cachedStringValueForKey:](self, "_cachedStringValueForKey:", CFSTR("SUOverrideSplatComboBuildVersion"));
}

- (BOOL)disableFollowUps
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUDisableFollowUps"), 0);
}

- (BOOL)enablePreSUStaging
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUEnablePreSuStaging"), 1);
}

- (BOOL)enablePreSUStagingForOptionalAssets
{
  return -[SUPreferences _cachedBoolValueForKey:withDefaultValue:](self, "_cachedBoolValueForKey:withDefaultValue:", CFSTR("SUEnablePreSuStagingForOptionalAssets"), 1);
}

- (NSString)ssoUsernameForPersonalization
{
  return (NSString *)-[SUPreferences _cachedStringValueForKey:](self, "_cachedStringValueForKey:", CFSTR("SUSSOUsernameForPersonalization"));
}

- (NSString)ssoTokenForPersonalization
{
  return (NSString *)-[SUPreferences _cachedStringValueForKey:](self, "_cachedStringValueForKey:", CFSTR("SUSSOTokenForPersonalization"));
}

- (NSDictionary)preferencesDefinitions
{
  return &self->_preferencesDefinitions->super;
}

- (void)setPreferencesDefinitions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableDictionary)cachedPreferences
{
  return self->_cachedPreferences;
}

- (void)setCachedPreferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)backgroundDLKnownBuilds
{
  return self->_backgroundDLKnownBuilds;
}

- (BOOL)isAutoSUDisabled
{
  return self->_disableAutoSU;
}

- (BOOL)previousUserSpecifiedAutoDownload
{
  return self->_previousUserSpecifiedAutoDownload;
}

- (void)enablePreviousUserSpecifiedAutoDownload:(BOOL)a3
{
  self->_previousUserSpecifiedAutoDownload = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
