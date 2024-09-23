@implementation MSDDemoUpdateController

+ (id)sharedInstance
{
  if (qword_1001754F8 != -1)
    dispatch_once(&qword_1001754F8, &stru_10013F490);
  return (id)qword_1001754F0;
}

- (MSDDemoUpdateController)init
{
  MSDDemoUpdateController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDDemoUpdateController;
  v2 = -[MSDDemoUpdateController init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[MSDDemoUpdateController setDevice:](v2, "setDevice:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    -[MSDDemoUpdateController setHelperAgent:](v2, "setHelperAgent:", v4);

  }
  return v2;
}

- (void)getDemoUpdateInProgress:(BOOL *)a3 operationAllowed:(BOOL *)a4
{
  void *v7;
  unsigned int v8;

  *a3 = 1;
  *a4 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
  v8 = objc_msgSend(v7, "mode");

  if (v8 <= 5 && ((1 << v8) & 0x27) != 0)
  {
    *a4 = 1;
    if (!-[MSDDemoUpdateController busy](self, "busy"))
      *a3 = 0;
  }
}

- (BOOL)enrolled
{
  void *v2;
  void *v3;
  MSDIsEnrolledRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.keychainItemID")));

  if (v3)
  {
    v4 = objc_alloc_init(MSDIsEnrolledRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handleRequestSync:", v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v6, "isEnrolled");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)enrollForDeviceName:(id)a3 pairingCredential:(id)a4 hubHostName:(id)a5 hubPort:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  MSDDemoUpdateController *v15;
  MSDEnrollRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t v65[16];
  uint8_t v66[16];
  uint8_t v67[16];
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self;
  objc_sync_enter(v15);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v60 = v12;
  v61 = v11;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  if (!-[MSDDemoUpdateController busy](v15, "busy"))
  {
    -[MSDDemoUpdateController setBusy:](v15, "setBusy:", 1);
    objc_msgSend(v64, "updateStage:", 1);
    v16 = objc_alloc_init(MSDEnrollRequest);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest getRegistrationInfoKeys](v16, "getRegistrationInfoKeys"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceInformation:", v18));
    v20 = objc_msgSend(v19, "mutableCopy");

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
    LODWORD(v18) = objc_msgSend(v21, "isNPIDevice");

    if ((_DWORD)v18)
      v22 = &off_10014DAA8;
    else
      v22 = &off_10014DAC0;
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("MSDDemoPingType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v20));
    -[MSDEnrollRequest setRegistrationInfo:](v16, "setRegistrationInfo:", v23);

    if (v13 && v14)
    {
      -[MSDCommandServerRequest setServer:](v16, "setServer:", v13);
      -[MSDCommandServerRequest setPort:](v16, "setPort:", v14);
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "handleRequestSync:", v16));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "error"));

    if (v24)
    {
      v32 = 0;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      objc_msgSend(v25, "setHubHostName:", v13);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      objc_msgSend(v26, "setHubPort:", v14);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      objc_msgSend(v27, "saveHubLastOnlineTime:", (uint64_t)v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      objc_msgSend(v30, "holdPowerAssertion");

      +[MSDBundleProgressTracker migratePreferencesFromFactoryDevicesIfNeeded](MSDBundleProgressTracker, "migratePreferencesFromFactoryDevicesIfNeeded");
      objc_msgSend(v64, "loadBundles");
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      LODWORD(v28) = objc_msgSend(v31, "isBetterTogetherDemo");

      if ((_DWORD)v28)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
        objc_msgSend(v32, "bootstrap");
      }
      else
      {
        v32 = 0;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      v34 = objc_msgSend(v33, "setDemoDeviceFlag");

      if ((v34 & 1) == 0)
      {
        v59 = sub_1000604F0();
        v55 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          sub_1000BE7CC();
        goto LABEL_23;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      objc_msgSend(v35, "setupWorkFolderForBootTask");

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
      objc_msgSend(v36, "createSecretKeyIfNeeded");

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
      v38 = objc_msgSend(v37, "turnOnDemoMode");

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
        objc_msgSend(v39, "disableCoreAnalticsTransformSampling");

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[MSDConfigurationProfileManager sharedInstance](MSDConfigurationProfileManager, "sharedInstance"));
        objc_msgSend(v40, "installDefaultConfigurationProfile");

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
        objc_msgSend(v41, "setWaitingForCommand:", 1);

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
        objc_msgSend(v42, "setWaitingForCommand:", 1);

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
        v44 = objc_msgSend(v43, "switchModeImmediately:", 1);

        if (v44)
        {
          v45 = sub_1000604F0();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Starting mail processor after enrolling.", buf, 2u);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
          objc_msgSend(v47, "start");

          v48 = sub_1000604F0();
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v67 = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Starting mail processor ended", v67, 2u);
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
          objc_msgSend(v50, "terminateConfigurationApp");

          v51 = sub_1000604F0();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v66 = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "terminateConfigurationApp ended", v66, 2u);
          }

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v15, "device"));
          objc_msgSend(v53, "deleteConfigurationApp");

          v54 = sub_1000604F0();
          v55 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v65 = 0;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "deleteConfigurationApp ended", v65, 2u);
          }
LABEL_23:

LABEL_24:
          -[MSDDemoUpdateController setBusy:](v15, "setBusy:", 0);
          goto LABEL_25;
        }
      }
    }
    v34 = 0;
    goto LABEL_24;
  }
  v57 = sub_1000604F0();
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    sub_1000C58D0();

  v62 = 0;
  v32 = 0;
  v16 = 0;
  v20 = 0;
  v34 = 0;
LABEL_25:

  objc_sync_exit(v15);
  return v34;
}

- (BOOL)installCachedContentForCurrentLocale:(BOOL *)a3
{
  MSDDemoUpdateController *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  BOOL v55;
  BOOL v56;
  void *v57;
  id v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *context;
  id v77;
  id v78;
  id v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  _QWORD v85[3];
  _QWORD v86[3];

  v3 = self;
  objc_sync_enter(v3);
  context = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Installing cached demo content...", buf, 2u);
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod")
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
        v9 = objc_msgSend(v8, "skipVerifyHashBeforeStaging"),
        v8,
        v9))
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping file hash verification before staging", buf, 2u);
    }

    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  v85[0] = CFSTR("IsCriticalUpdate");
  v85[1] = CFSTR("ForBackgroundDownload");
  v86[0] = &__kCFBooleanFalse;
  v86[1] = &__kCFBooleanFalse;
  v85[2] = CFSTR("VerifyHashBeforeStaging");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
  v86[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 3));

  if (!-[MSDDemoUpdateController busy](v3, "busy"))
  {
    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
    objc_msgSend(v15, "setCachedBundleInstallState:", CFSTR("cachedBundleInstallInProgress"));

    v80 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController _selectCachedManifestWithError:](v3, "_selectCachedManifestWithError:", &v80));
    v17 = v80;
    v18 = v17;
    if (v16)
    {
      v79 = v17;
      v19 = -[MSDDemoUpdateController _signedManifestMinimumOSVersionCheck:error:](v3, "_signedManifestMinimumOSVersionCheck:error:", v16, &v79);
      v20 = v79;

      if (v19)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "installedFactoryBundleID"));

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "installedFactoryBundleID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleID"));
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (v26)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
            objc_msgSend(v70, "setCachedBundleInstallState:", CFSTR("cachedBundleInstallDone"));

            v71 = sub_1000604F0();
            v54 = objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getLocaleCode"));
              v73 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "installedFactoryBundleID"));
              *(_DWORD *)buf = 138543618;
              v82 = v72;
              v83 = 2114;
              v84 = v74;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Bundle with locale %{public}@ & bundle ID %{public}@ already installed", buf, 0x16u);

            }
            v55 = 0;
            v56 = 1;
            goto LABEL_26;
          }
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v3, "helperAgent"));
        v28 = objc_msgSend(v27, "stageDeviceForUpdateProcess:", 0);

        if ((v28 & 1) != 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
          objc_msgSend(v29, "startFullScreenUIWith:allowCancel:", CFSTR("CACHED_BUNDLE_INSTALL"), 0);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
          v31 = objc_msgSend(v30, "dcotaOfflineModeDevice");

          if ((v31 & 1) == 0)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
            objc_msgSend(v32, "setupDummyPreferenceFile");

          }
          objc_msgSend(v5, "startBundleUpdateMonitor:inMode:", v16, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleInProgress"));
          objc_msgSend(v33, "startBundleUpdateTimer");

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
          objc_msgSend(v34, "setBackgroundDownloadActive:", 0);

          v35 = sub_1000604F0();
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Stopping all apps running in the foreground...", buf, 2u);
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullScreenUIAppId"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v38, CFSTR("com.apple.ist.windward"), CFSTR("com.apple.ist.DemoDiscoveryApp"), CFSTR("com.apple.PineBoard"), 0));
          objc_msgSend(v37, "stopAllAppsExcept:", v39);

          v78 = v20;
          LODWORD(v37) = -[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:](v3, "_kickOffContentUpdateForManifest:withOptions:error:", v16, v14, &v78);
          v18 = v78;

          if ((_DWORD)v37)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleInProgress"));
            objc_msgSend(v40, "getBundleUpdateTime");
            v42 = v41;

            v43 = sub_1000604F0();
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v82 = v42;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Total time taken for this update: %f.", buf, 0xCu);
            }

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleInProgress"));
            objc_msgSend(v45, "stopBundleUpdateTimer");

            v46 = sub_1000604F0();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Done with content update, switching to real backup folder.", buf, 2u);
            }

            v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v3, "helperAgent"));
            v49 = objc_msgSend(v48, "switchToBackupFolder");

            if (v49)
            {
              -[MSDDemoUpdateController _stageContentPlistForManifest:](v3, "_stageContentPlistForManifest:", v16);
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
              objc_msgSend(v50, "saveCurrentDeviceLanguageIdentifier");

              v51 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
              objc_msgSend(v51, "saveCuurentDeviceRegionCode");

              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleID"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
              objc_msgSend(v53, "setInstalledFactoryBundleID:", v52);

              v54 = objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
              -[NSObject setCachedBundleInstallState:](v54, "setCachedBundleInstallState:", CFSTR("cachedBundleInstallWaitMigration"));
              v55 = 1;
              v56 = 1;
              v20 = v18;
LABEL_26:

              if (a3)
                *a3 = v55;
              v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
              objc_msgSend(v57, "stopFullScreenUI:", 0);

              -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 0);
              goto LABEL_29;
            }
          }
          v55 = 1;
LABEL_39:
          v77 = v18;
          sub_1000B6428(&v77, 3727744768, CFSTR("An error has occurred."));
          v20 = v77;

          v63 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
          objc_msgSend(v63, "demoUpdateFailed:", v20);

          v64 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
          v65 = objc_msgSend(v64, "dcotaOfflineModeDevice");

          if ((v65 & 1) == 0)
          {
            v66 = sub_1000604F0();
            v67 = objc_claimAutoreleasedReturnValue(v66);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Cleaning up keep alive file and BootTask Work folder...", buf, 2u);
            }

            v68 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
            objc_msgSend(v68, "cleanupDummyPreferenceFile");

            v69 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
            objc_msgSend(v69, "destroyWorkFolderForBootTask");

          }
          v54 = objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
          -[NSObject setCachedBundleInstallState:](v54, "setCachedBundleInstallState:", CFSTR("cachedBundleInstallDone"));
          v56 = 0;
          goto LABEL_26;
        }
        v61 = sub_1000604F0();
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          sub_1000C58FC();

      }
      v55 = 0;
      v18 = v20;
      goto LABEL_39;
    }
    v55 = 0;
    goto LABEL_39;
  }
  v59 = sub_1000604F0();
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "demo updater is busy; ignoring install call",
      buf,
      2u);
  }

  v16 = 0;
  v20 = 0;
  v56 = 0;
LABEL_29:

  objc_autoreleasePoolPop(context);
  objc_sync_exit(v3);

  return v56;
}

- (BOOL)updateDemoContent
{
  MSDDemoUpdateController *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  void *context;
  id v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  void *v71;
  unsigned int v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint8_t buf[4];
  double v78;
  _QWORD v79[3];
  _QWORD v80[3];

  v2 = self;
  objc_sync_enter(v2);
  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
  v69 = objc_msgSend(v4, "criticalUpdatePrioritized");

  if (os_variant_has_internal_content("com.apple.mobilestoredemod")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
        v6 = objc_msgSend(v5, "skipVerifyHashBeforeStaging"),
        v5,
        v6))
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping file hash verification before staging", buf, 2u);
    }

    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  v79[0] = CFSTR("IsCriticalUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v69));
  v80[0] = v10;
  v80[1] = &__kCFBooleanFalse;
  v79[1] = CFSTR("ForBackgroundDownload");
  v79[2] = CFSTR("VerifyHashBeforeStaging");
  v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  v80[2] = v11;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v80, v79, 3));

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
  v72 = -[MSDDemoUpdateController busy](v2, "busy");
  if (!v72)
  {
    -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
    v13 = objc_msgSend(v12, "switchModeImmediately:", 2);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
      if (objc_msgSend(v14, "isBetterTogetherDemo"))
        v64 = objc_msgSend(v67, "paired");
      else
        v64 = 0;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v2, "helperAgent"));
      v16 = objc_msgSend(v15, "stageDeviceForUpdateProcess:", 0);

      if ((v16 & 1) != 0)
      {
        v17 = sub_1000604F0();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Device downloading manifest...", buf, 2u);
        }

        objc_msgSend(v3, "updateStage:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "retrieveSignedManifest"));

        if (v20)
        {
          v75 = 0;
          v21 = -[MSDDemoUpdateController _signedManifestMinimumOSVersionCheck:error:](v2, "_signedManifestMinimumOSVersionCheck:error:", v20, &v75);
          v22 = v75;
          if (v21)
          {
            objc_msgSend(v3, "startBundleUpdateMonitor:inMode:", v20, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
            objc_msgSend(v23, "startBundleUpdateTimer");

            v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppPrivacyPermissionsHelper sharedInstance](MSDAppPrivacyPermissionsHelper, "sharedInstance"));
            objc_msgSend(v24, "savePrivacyPermissionsForAllApps:", v20);

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
            objc_msgSend(v25, "setBackgroundDownloadActive:", 0);

            objc_msgSend(v3, "updateStage:", 21);
            v26 = sub_1000604F0();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Stopping all apps running in the foreground...", buf, 2u);
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "fullScreenUIAppId"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v29, CFSTR("com.apple.ist.windward"), CFSTR("com.apple.ist.DemoDiscoveryApp"), CFSTR("com.apple.PineBoard"), CFSTR("com.apple.ist.DigitalSignage.iOS"), 0));
            objc_msgSend(v28, "stopAllAppsExcept:", v30);

            objc_msgSend(v3, "updateStage:", 22);
            v74 = v22;
            LODWORD(v28) = -[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:](v2, "_kickOffContentUpdateForManifest:withOptions:error:", v20, v70, &v74);
            v66 = v74;

            if ((_DWORD)v28)
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getContentUpdateType"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "downloadedContentSource"));

              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("remote")));
              v34 = (char *)objc_msgSend(v33, "longLongValue");
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("local")));
              v36 = objc_msgSend(v35, "longLongValue");

              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
              v38 = objc_msgSend(v37, "getComponentsSuccessful");
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
              v40 = (uint64_t)objc_msgSend(v39, "getAllComponentsForUpdate");

              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("local")));
              v42 = objc_msgSend(v41, "longLongValue");

              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
              objc_msgSend(v43, "getBundleUpdateTime");
              v45 = v44;

              v46 = sub_1000604F0();
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v78 = v45;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Total time taken for this update: %f.", buf, 0xCu);
              }

              v48 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
              objc_msgSend(v48, "sendContentUpdateCompletedEvent:withTimeTaken:cachingHubAvailable:isCriticalUpdate:contentUpdateType:andComponentSuccess:", &v34[(_QWORD)v36], v42 != 0, v69, v68, 100 * (uint64_t)v38 / v40, v45);

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleInProgress"));
              objc_msgSend(v49, "stopBundleUpdateTimer");

              v50 = sub_1000604F0();
              v51 = objc_claimAutoreleasedReturnValue(v50);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Done with content update, switching to real backup folder.", buf, 2u);
              }

              v52 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v2, "helperAgent"));
              v53 = objc_msgSend(v52, "switchToBackupFolder");

              if (v53)
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
                v55 = objc_msgSend(v54, "switchModeImmediately:", 4);

                if (v55)
                {
                  -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 0);
                  LOBYTE(v11) = 1;
                  goto LABEL_27;
                }
              }
            }
            else
            {
              v68 = 0;
              v32 = 0;
            }
            v22 = v66;
          }
          else
          {
            v68 = 0;
            v32 = 0;
          }
          goto LABEL_41;
        }
        v76 = 0;
        sub_1000B6428(&v76, 3727740940, CFSTR("Could not download manifest."));
        v22 = v76;
        v68 = 0;
        v32 = 0;
LABEL_37:
        v20 = 0;
LABEL_41:
        v73 = v22;
        sub_1000B6428(&v73, 3727744768, CFSTR("An error has occurred."));
        v66 = v73;

        v61 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
        objc_msgSend(v61, "demoUpdateFailed:", v66);

        v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
        objc_msgSend(v62, "sendContentUpdateFailureEvent:isFatal:", v66, 1);

        if (v64)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
          objc_msgSend(v63, "signalContentUpdateCompletion:andError:", 0, v66);

        }
        -[MSDDemoUpdateController checkWithTimeKeeper:](v2, "checkWithTimeKeeper:", v66);
        -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 0);
        LOBYTE(v11) = 0;
        goto LABEL_27;
      }
      v59 = sub_1000604F0();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        sub_1000C58FC();

      v68 = 0;
      v32 = 0;
    }
    else
    {
      v68 = 0;
      v32 = 0;
      v64 = 0;
    }
    v22 = 0;
    goto LABEL_37;
  }
  v57 = sub_1000604F0();
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "demo updater is busy.", buf, 2u);
  }

  v68 = 0;
  v32 = 0;
  v66 = 0;
  v20 = 0;
LABEL_27:

  objc_autoreleasePoolPop(context);
  objc_sync_exit(v2);

  return v11 & (v72 ^ 1);
}

- (void)cancelDemoContentUpdate
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
  if (objc_msgSend(v3, "isBetterTogetherDemo"))
  {
    v4 = objc_msgSend(v16, "paired");

    if (v4)
      objc_msgSend(v16, "cancelOperation");
  }
  else
  {

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
  objc_msgSend(v5, "canceledByUser");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  objc_msgSend(v6, "forceSwitchToDemoUpdateModeIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v7, "macOS"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v9 = objc_msgSend(v8, "iOS");

    if (!v9)
      goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPricingUpdateController sharedInstance](MSDPricingUpdateController, "sharedInstance"));
  objc_msgSend(v10, "operationCanceled");

LABEL_9:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));
    objc_msgSend(v12, "abortProcessing");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
  objc_msgSend(v13, "fullScreenUICanceledByUser");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v14, "updateStage:", 101);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
  objc_msgSend(v15, "sendImmediateDeviceInfoPing");

}

- (void)concludeDemoContenUpdateWithResult:(BOOL)a3 andError:(id)a4
{
  _BOOL4 v4;
  id v6;
  MSDDemoUpdateController *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (!-[MSDDemoUpdateController busy](v7, "busy"))
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "demo updater is NOT busy.", buf, 2u);
    }

    goto LABEL_8;
  }
  -[MSDDemoUpdateController setBusy:](v7, "setBusy:", 0);
  if (!v4)
  {
LABEL_8:
    v13 = v6;
    sub_1000B6428(&v13, 3727744768, CFSTR("An error has occurred."));
    v9 = v13;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v12, "demoUpdateFailed:", v9);

    -[MSDDemoUpdateController checkWithTimeKeeper:](v7, "checkWithTimeKeeper:", v9);
    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v7, "device"));
  objc_msgSend(v8, "switchModeImmediately:", 5);

  v9 = v6;
LABEL_4:
  objc_sync_exit(v7);

}

- (BOOL)setupAccounts:(id *)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](MSDAccountManager, "sharedInstance"));
  v12 = 0;
  v5 = objc_msgSend(v4, "setupAccounts:", &v12);
  v6 = v12;

  if ((v5 & 1) == 0)
  {
    v11 = v6;
    sub_1000B6428(&v11, 3727744743, CFSTR("An error has occurred."));
    v7 = v11;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v8, "demoUpdateFailed:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    objc_msgSend(v9, "sendiCloudSigninFailureEvent:", v7);

    if (a3)
    {
      v6 = objc_retainAutorelease(v7);
      *a3 = v6;
    }
    else
    {
      v6 = v7;
    }
  }

  return v5;
}

- (BOOL)continueToUpdateAccountContent
{
  unsigned __int8 v2;
  MSDDemoUpdateController *v3;
  unsigned int v4;
  NSObject *v5;
  id v7;
  id v8;

  v3 = self;
  objc_sync_enter(v3);
  v4 = -[MSDDemoUpdateController busy](v3, "busy");
  if (v4)
  {
    v7 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000C58D0();
  }
  else
  {
    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 1);
    v8 = 0;
    v2 = -[MSDDemoUpdateController setupAccounts:](v3, "setupAccounts:", &v8);
    v5 = v8;
    if (v5)
      -[MSDDemoUpdateController checkWithTimeKeeper:](v3, "checkWithTimeKeeper:", v5);
    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 0);
  }

  objc_sync_exit(v3);
  return (v4 ^ 1) & v2;
}

- (BOOL)continueToUpdateDemoContent
{
  char v2;
  MSDDemoUpdateController *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;

  v3 = self;
  objc_sync_enter(v3);
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
  v6 = -[MSDDemoUpdateController busy](v3, "busy");
  if (v6)
  {
    v32 = sub_1000604F0();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1000C58D0();

    v18 = 0;
    v9 = 0;
  }
  else
  {
    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppPrivacyPermissionsHelper sharedInstance](MSDAppPrivacyPermissionsHelper, "sharedInstance"));
    objc_msgSend(v7, "grantPrivacyPermissionsForAllApps");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDConfigurationProfileManager sharedInstance](MSDConfigurationProfileManager, "sharedInstance"));
    objc_msgSend(v8, "installDefaultConfigurationProfile");

    v35 = 0;
    -[MSDDemoUpdateController setupAccounts:](v3, "setupAccounts:", &v35);
    v9 = v35;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v3, "device"));
    if (objc_msgSend(v10, "isBetterTogetherDemo"))
    {
      v11 = objc_msgSend(v5, "paired");

      if (v11)
      {
        if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentSyncTimeoutInterval"));

          if (v13)
          {
            v14 = sub_1000604F0();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v37 = v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Override default content sync timeout interval with value: %{public}@", buf, 0xCu);
            }

            v16 = objc_msgSend(v13, "unsignedIntValue");
          }
          else
          {
            v16 = 1800;
          }

        }
        else
        {
          v16 = 1800;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
        objc_msgSend(v25, "updateStage:", 32);

        v26 = sub_1000604F0();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v37) = v16;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Wait extra %u seconds for content sync between phone and watch...", buf, 8u);
        }

        sleep(v16);
        v28 = sub_1000604F0();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Sending content update completion signal to paired watch...", buf, 2u);
        }

        if ((objc_msgSend(v5, "signalContentUpdateCompletion:andError:", 1, 0) & 1) == 0)
        {
          v34 = v9;
          sub_1000B6428(&v34, 3727744768, CFSTR("An error has occurred."));
          v30 = v34;

          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
          objc_msgSend(v31, "demoUpdateFailed:", v30);

          objc_msgSend(v5, "signalContentUpdateCompletion:andError:", 0, v30);
          -[MSDDemoUpdateController checkWithTimeKeeper:](v3, "checkWithTimeKeeper:", v30);
          -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 0);
          v18 = 0;
          v2 = 0;
          v9 = v30;
          goto LABEL_13;
        }
      }
    }
    else
    {

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("locale")));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("language")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("region")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
      objc_msgSend(v21, "setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:", v19, v20, 0, 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      objc_msgSend(v22, "removeObjectForKey:", CFSTR("locale"));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
    objc_msgSend(v23, "disableCoreAnalticsTransformSampling");

    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 0);
    v2 = 1;
  }
LABEL_13:

  objc_autoreleasePoolPop(v4);
  objc_sync_exit(v3);

  return v2 & (v6 ^ 1);
}

- (void)checkWithTimeKeeper:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  int v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
  v16 = 0;
  v5 = objc_msgSend(v4, "shouldCleanUp:", &v16);
  v6 = v16;
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "code") != (id)3727741184)
    {
      if (objc_msgSend(v7, "code") == (id)3727741185)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
        objc_msgSend(v8, "forceSwitchToDemoUpdateModeIfNeeded");
LABEL_15:

        goto LABEL_18;
      }
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unknown clean up reason!", buf, 2u);
      }

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v8, "forceSwitchToDemoModeIfNeeded");
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "code") == (id)3727740939)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
    objc_msgSend(v8, "updateStage:", 24);
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v10 = (uint64_t)objc_msgSend(v9, "timeShowingFatalError");

  if ((_DWORD)v10)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Override MSDTimeShowingFatalError timeout: %u", buf, 8u);
    }

  }
  else
  {
    v10 = 900;
  }
  v15 = objc_msgSend(v4, "setCompletionTimeForFatalError:", v10);
LABEL_18:

}

- (BOOL)PLHasCompletedRestorePostProcessing
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v12;
  char v13;

  v13 = 0;
  v2 = objc_alloc((Class)PLAssetsdClient);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibraryPathManager systemLibraryURL](PLPhotoLibraryPathManager, "systemLibraryURL"));
  v4 = objc_msgSend(v2, "initWithPhotoLibraryURL:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "demoClient"));
  v12 = 0;
  v6 = objc_msgSend(v5, "hasCompletedRestorePostProcessing:error:", &v13, &v12);
  v7 = v12;

  if ((v6 & 1) != 0)
  {
    v8 = v13 != 0;
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C5928();

    v8 = 0;
  }

  return v8;
}

- (BOOL)PLHasCompletedMomentAnalysis
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v12;
  char v13;

  v13 = 0;
  v2 = objc_alloc((Class)PLAssetsdClient);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibraryPathManager systemLibraryURL](PLPhotoLibraryPathManager, "systemLibraryURL"));
  v4 = objc_msgSend(v2, "initWithPhotoLibraryURL:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "demoClient"));
  v12 = 0;
  v6 = objc_msgSend(v5, "hasCompletedMomentAnalysis:error:", &v13, &v12);
  v7 = v12;

  if ((v6 & 1) != 0)
  {
    v8 = v13 != 0;
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C5988();

    v8 = 0;
  }

  return v8;
}

- (BOOL)migrateDataWithBlockingUI:(int)a3 startMigration:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  double v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  id v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  double v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  uint64_t v41;

  v4 = a4;
  if (!-[MSDDemoUpdateController migrationDone](self, "migrationDone", *(_QWORD *)&a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
    objc_msgSend(v6, "updateStage:", 14);

    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Waiting for data migration to finish; startMigration=%{BOOL}d",
        (uint8_t *)&v41,
        8u);
    }

    if (v4)
      DMPerformMigration(CFSTR("Demod is waiting for data migration to finish."));
    else
      DMPerformMigrationIfNeeded();
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Data migration finished.", (uint8_t *)&v41, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
    v12 = objc_msgSend(v11, "isOfflineMode");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
    v14 = v13;
    if (v12)
      v15 = CFSTR("CACHED_BUNDLE_INSTALL");
    else
      v15 = CFSTR("IN_PROGRESS");
    objc_msgSend(v13, "startFullScreenUIWith:allowCancel:disableIdleTimer:", v15, 1, 1);

    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Checking photo library migration.", (uint8_t *)&v41, 2u);
    }

    v18 = 0;
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = v20;
      v22 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      v23 = -[MSDDemoUpdateController PLHasCompletedRestorePostProcessing](self, "PLHasCompletedRestorePostProcessing");
      sleep(2u);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      objc_msgSend(v19, "timeIntervalSinceDate:", v20);
      v18 += (int)v24;
    }
    while ((v23 & 1) == 0 && v18 < 900);
    v25 = sub_1000604F0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v27)
        goto LABEL_23;
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v18;
      v28 = "Photo library migration finished after %d seconds.";
    }
    else
    {
      if (!v27)
        goto LABEL_23;
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v18;
      v28 = "Photo library migration timeout after %d seconds.";
    }
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v41, 8u);
LABEL_23:

    v29 = sub_1000604F0();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Checking photo moment analysis.", (uint8_t *)&v41, 2u);
    }

    v31 = 0;
    do
    {
      v32 = v20;
      v33 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v41));

      v34 = -[MSDDemoUpdateController PLHasCompletedMomentAnalysis](self, "PLHasCompletedMomentAnalysis");
      sleep(5u);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      objc_msgSend(v19, "timeIntervalSinceDate:", v20);
      v31 += (int)v35;
    }
    while ((v34 & 1) == 0 && v31 < 300);
    v36 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v38)
      {
        LODWORD(v41) = 67109120;
        HIDWORD(v41) = v31;
        v39 = "Photo moment analysis finished after %d seconds.";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&v41, 8u);
      }
    }
    else if (v38)
    {
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v31;
      v39 = "Photo moment analysis timeout after %d seconds.";
      goto LABEL_33;
    }

    -[MSDDemoUpdateController setMigrationDone:](self, "setMigrationDone:", 1);
  }
  return 1;
}

- (void)setIOSSpecificSettings
{
  -[MSDDemoUpdateController _configureMailAppForDemo](self, "_configureMailAppForDemo");
}

- (void)setAutomatedDeviceGroupStoreID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getDeviceOptions"));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("store_id")));
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));

  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration automatedDeviceGroup](OSASystemConfiguration, "automatedDeviceGroup"));
  if (!v8)
  {
    v12 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C59E8(v11, v13, v14);
    v15 = 0;
    v9 = 0;
    goto LABEL_26;
  }
  v9 = v8;
  if (!v5)
  {
    v16 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C5A70(v11, v17, v18);
    goto LABEL_25;
  }
  if (!v7)
  {
    v24 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C5AF8(v11, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_25;
  }
  if (-[__CFString containsString:](v8, "containsString:", v5)
    && -[__CFString containsString:](v9, "containsString:", v7))
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v33 = CFSTR("AutomatedDeviceGroup");
      v34 = 2114;
      v35 = v9;
      v36 = 2114;
      v37 = v5;
      v38 = 2114;
      v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ key with value %{public}@ already contains store ID %{public}@ and serial number %{public}@, skip appending store ID and serial number again", buf, 0x2Au);
    }
LABEL_25:
    v15 = 0;
LABEL_26:

    v19 = v9;
    goto LABEL_27;
  }
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@"), v9, v5, v7));

  +[OSASystemConfiguration setAutomatedDeviceGroup:](OSASystemConfiguration, "setAutomatedDeviceGroup:", v19);
  v20 = sub_1000604F0();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Set new AutomatedDeviceGroup %@", buf, 0xCu);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration automatedDeviceGroup](OSASystemConfiguration, "automatedDeviceGroup"));
  v15 = v22;
  if (!v22 || (objc_msgSend(v22, "isEqualToString:", v19) & 1) == 0)
  {
    v23 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C5B68();
    v9 = v19;
    goto LABEL_26;
  }
LABEL_27:

}

- (void)_configureMailAppForDemo
{
  dispatch_semaphore_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  v2 = dispatch_semaphore_create(0);
  v3 = objc_alloc_init((Class)EMDaemonInterface);
  objc_msgSend(v3, "launchDaemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientState"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100083D5C;
  v9[3] = &unk_10013F4B8;
  v5 = v2;
  v10 = v5;
  objc_msgSend(v4, "setStateForDemoMode:", v9);

  v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C5C00();

  }
}

- (BOOL)_signedManifestMinimumOSVersionCheck:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  BOOL v18;
  id v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("MinimumOSVersion")));

  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("PartNumber")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("Revision")));
    v22 = 138543874;
    v23 = v12;
    v24 = 2114;
    v25 = v14;
    v26 = 2114;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manifest partnumber/revision: %{public}@_%{public}@, minimum OS version is %{public}@", (uint8_t *)&v22, 0x20u);

  }
  if (v8
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "OSVersion")),
        v17 = objc_msgSend(v8, "higherVersionThan:", v16),
        v16,
        v15,
        v17))
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C5CBC((uint64_t)v8, self, v21);

    sub_1000B6428(a4, 3727740976, CFSTR("iOS version mismatch."));
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)_kickOffContentUpdateForManifest:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  char *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  MSDComponentBuilder *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  MSDComponentProcessor *v37;
  MSDComponentManager *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  BOOL v42;
  void *v43;
  id v45;
  void *v46;
  id *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id obj;
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  void *v62;
  _QWORD v63[2];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v10, "macOS"))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v12 = objc_msgSend(v11, "iOS");

    if (!v12)
      goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getAppList"));
  v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("com.retailtech.arkenstone")));
  if (v14
    || (v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("com.apple.ist.windward")))) != 0
    || (v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("com.apple.ist.DemoDiscoveryApp")))) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
    v16 = objc_msgSend(v15, "getSavedFlag");

    if ((v16 & 2) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPricingUpdateController sharedInstance](MSDPricingUpdateController, "sharedInstance"));
      v18 = objc_msgSend(v17, "completed");

      if ((v18 & 1) == 0)
      {
        v19 = sub_1000604F0();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v66 = v14;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request builder to defer the update of app: %{public}@", buf, 0xCu);
        }

        objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("AppItemToDefer"));
      }
    }
  }

LABEL_13:
  v21 = -[MSDComponentBuilder initWithSignedManifest:andOptions:]([MSDComponentBuilder alloc], "initWithSignedManifest:andOptions:", v7, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDConfigurationProfileManager sharedInstance](MSDConfigurationProfileManager, "sharedInstance"));
  objc_msgSend(v22, "uninstallAllDemoBundleConfigurationProfiles");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder buildComponentsNotInManifest](v21, "buildComponentsNotInManifest"));
  if (v23)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder buildComponentsFromManifest](v21, "buildComponentsFromManifest"));
    if (v24)
    {
      v25 = v24;
      v47 = a5;
      v50 = v9;
      v51 = v8;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "date"));

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v48 = (void *)v25;
      v49 = v23;
      v63[0] = v23;
      v63[1] = v25;
      obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 2));
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      if (!v27)
      {
        v29 = 0;
LABEL_31:

        v21 = 0;
        v7 = 0;
        v42 = 1;
        v9 = v50;
        v8 = v51;
        v43 = v48;
        v23 = v49;
        goto LABEL_32;
      }
      v28 = v27;
      v29 = 0;
      v30 = *(_QWORD *)v58;
LABEL_17:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v31);
        v33 = objc_autoreleasePoolPush();
        if (objc_msgSend(v32, "count"))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
          v56 = v29;
          v35 = objc_msgSend(v34, "shouldCleanUp:", &v56);
          v36 = v56;

          if (v35)
          {
            v45 = sub_1000604F0();
            v37 = (MSDComponentProcessor *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v66 = "-[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:]";
              _os_log_impl((void *)&_mh_execute_header, &v37->super, OS_LOG_TYPE_DEFAULT, "%s - Content update has been cancelled by users request", buf, 0xCu);
            }
            v29 = v36;
LABEL_37:
            v9 = v50;
            v8 = v51;
            a5 = v47;
            v43 = v48;
            v23 = v49;

            objc_autoreleasePoolPop(v33);
            v21 = 0;
            v7 = 0;
            if (!v47)
              goto LABEL_42;
LABEL_38:
            v29 = objc_retainAutorelease(v29);
            v42 = 0;
            *a5 = v29;
            goto LABEL_32;
          }
          v37 = -[MSDComponentProcessor initWithQoS:]([MSDComponentProcessor alloc], "initWithQoS:", 33);
          v38 = -[MSDComponentManager initWithComponents:andProcessor:]([MSDComponentManager alloc], "initWithComponents:andProcessor:", v32, v37);
          -[MSDDemoUpdateController setComponentManager:](self, "setComponentManager:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));
          objc_msgSend(v39, "startProcessingAllComponents");

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));
          v55 = v36;
          v41 = objc_msgSend(v40, "waitForProcessingCompletionTillDate:outError:", v54, &v55);
          v29 = v55;

          if ((v41 & 1) == 0
            && (objc_msgSend(v29, "code") == (id)3727741184 || objc_msgSend(v29, "code") == (id)3727741185))
          {

            goto LABEL_37;
          }
        }
        else
        {
          v37 = 0;
          v38 = 0;
        }

        objc_autoreleasePoolPop(v33);
        if (v28 == (id)++v31)
        {
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
          if (v28)
            goto LABEL_17;
          goto LABEL_31;
        }
      }
    }
    v61 = 0;
    sub_1000B63A4(&v61, 3727740938, (uint64_t)CFSTR("Manifest is corrupted."));
    v46 = v61;
  }
  else
  {
    v62 = 0;
    sub_1000B63A4(&v62, 3727740938, (uint64_t)CFSTR("Manifest is corrupted."));
    v46 = v62;
  }
  v29 = v46;
  v43 = 0;
  v54 = 0;
  if (a5)
    goto LABEL_38;
LABEL_42:
  v42 = 0;
LABEL_32:

  return v42;
}

- (void)_stageContentPlistForManifest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  __CFString *v13;
  id v14;
  id v15;
  NSObject *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Staging Content.plist...", buf, 2u);
  }

  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController _contentPlistPathForManifest:](self, "_contentPlistPathForManifest:", v4));
  if (!v8)
  {
    v30 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C5D6C();
    goto LABEL_25;
  }
  v9 = objc_msgSend(v5, "fileExistsAtPath:", v8);
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C5F54();
LABEL_25:
    v13 = 0;
    v19 = 0;
    v14 = 0;
LABEL_35:

    goto LABEL_20;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    v44 = 2114;
    v45 = CFSTR("/private/var/mobile/backup/var/mobile/Media/Content.plist");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Copying %{public}@ to %{public}@...", buf, 0x16u);
  }

  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/backup/var/mobile/Media/Content.plist"), "stringByDeletingLastPathComponent"));
  if ((objc_msgSend(v5, "fileExistsAtPath:", v13) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating %{public}@...", buf, 0xCu);
    }

    v41 = 0;
    v17 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v41);
    v14 = v41;
    if ((v17 & 1) == 0)
    {
      v32 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000C5EE8();
      v19 = 0;
      goto LABEL_35;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](NSURL, "fileURLWithString:", v8));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fileHash"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](self, "helperAgent"));
  v21 = objc_msgSend(v20, "cloneFile:to:expectingHash:", v8, CFSTR("/private/var/mobile/backup/var/mobile/Media/Content.plist"), v19);

  v22 = sub_1000604F0();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v12 = v23;
  if ((v21 & 1) == 0)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C5E78();
    goto LABEL_35;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    v44 = 2114;
    v45 = CFSTR("/private/var/demo_backup/Metadata/.Content.plist");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Copying %{public}@ to %{public}@...", buf, 0x16u);
  }

  if ((objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/private/var/demo_backup/Metadata")) & 1) == 0)
  {
    v24 = sub_1000604F0();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = CFSTR("/private/var/demo_backup/Metadata");
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Creating %{public}@...", buf, 0xCu);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](self, "helperAgent"));
    v27 = objc_msgSend(v26, "prepareWorkDirectory:writableByNonRoot:", CFSTR("/private/var/demo_backup/Metadata"), 0);

    if ((v27 & 1) == 0)
    {
      v33 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000C5E08(v12, v34, v35, v36, v37, v38, v39, v40);
      goto LABEL_35;
    }
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](self, "helperAgent"));
  v29 = objc_msgSend(v28, "cloneFile:to:expectingHash:", v8, CFSTR("/private/var/demo_backup/Metadata/.Content.plist"), v19);

  if ((v29 & 1) == 0)
  {
    v31 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C5D98();
    goto LABEL_35;
  }
LABEL_20:

}

- (id)_selectCachedManifestWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  unsigned __int8 v55;
  unsigned __int8 v56;
  id v57;
  id v58;
  NSObject *v59;
  void *v60;
  unsigned __int8 v61;
  void *v62;
  id v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  id *v72;
  MSDDemoUpdateController *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  _QWORD v89[2];
  void *v90;
  uint8_t buf[4];
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  _BYTE v97[128];

  v5 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manifestPath"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));
  v79 = (void *)objc_opt_new(NSMutableArray, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getCurrentDevicePreferredLanguage"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getCurrentDeviceRegion"));

  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v92 = v76;
    v93 = 2114;
    v94 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Selecting cached bundle with preferred language code %{public}@; region %{public}@",
      buf,
      0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactoryMetadata loadManifestMetadata:](MSDSignedManifestFactoryMetadata, "loadManifestMetadata:", CFSTR("/var/MSDWorkContainer/.MSD_cache_content_plist")));
  v74 = v14;
  v75 = (void *)v5;
  if (!v14 && objc_msgSend(0, "count"))
  {
    v70 = sub_1000604F0();
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      sub_1000C6200();

    v88 = 0;
    sub_1000B63A4(&v88, 3727740942, (uint64_t)CFSTR("Failed to load cached manifest file"));
    v57 = v88;
    v18 = 0;
    v37 = 0;
    v50 = 0;
    v47 = 0;
    if (a3)
      goto LABEL_67;
    goto LABEL_71;
  }
  v72 = a3;
  v73 = self;
  v78 = v7;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v85 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "supportedRegions"));
        v23 = objc_msgSend(v22, "containsObject:", v11);

        if (v23)
          objc_msgSend(v79, "addObject:", v21);
        if (objc_msgSend(v21, "isPrimaryBundle"))
        {
          v24 = v21;

          v25 = sub_1000604F0();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v92 = v24;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found default primary bundle: %{public}@", buf, 0xCu);
          }

          v18 = v24;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  v7 = v78;
  if (objc_msgSend(v79, "count"))
  {
    v27 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v79, "count");
      *(_DWORD *)buf = 134218498;
      v92 = v29;
      v93 = 2114;
      v94 = v11;
      v95 = 2114;
      v96 = v79;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found %lu bundles for region %{public}@: %{public}@", buf, 0x20u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactoryMetadata languageIdentifiersForMetadataList:](MSDSignedManifestFactoryMetadata, "languageIdentifiersForMetadataList:", v79));
    v90 = v76;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v90, 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale matchedLanguagesFromAvailableLanguages:forPreferredLanguages:](NSLocale, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v30, v31));

    if (objc_msgSend(v32, "count"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
      v34 = sub_1000604F0();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v92 = v33;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found matched language code: %{public}@", buf, 0xCu);
      }

      v36 = objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactoryMetadata metadataWithLanugageIdentifier:fromList:](MSDSignedManifestFactoryMetadata, "metadataWithLanugageIdentifier:fromList:", v33, v79));
      if (v36)
      {
        v37 = (id)v36;

        goto LABEL_35;
      }
      v38 = sub_1000604F0();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_1000C61A0();

    }
  }
  v40 = sub_1000604F0();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Did not find matching bundle; selecting default primary bundle",
      buf,
      2u);
  }

  v37 = v18;
LABEL_35:
  v42 = sub_1000604F0();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v92 = v37;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Selected bundle metadata: %{public}@", buf, 0xCu);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fileName"));
  if (!v44)
  {
    v64 = sub_1000604F0();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_1000C5FB4();

    v83 = 0;
    sub_1000B63A4(&v83, 3727740942, (uint64_t)CFSTR("Selected bundle metadata do not contain file name"));
    v57 = v83;
    v50 = 0;
    v47 = 0;
LABEL_66:
    a3 = v72;
    if (v72)
    {
LABEL_67:
      v57 = objc_retainAutorelease(v57);
      v62 = 0;
      *a3 = v57;
      goto LABEL_53;
    }
LABEL_71:
    v62 = 0;
    goto LABEL_53;
  }
  v89[0] = CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fileName"));
  v89[1] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v46));

  v48 = sub_1000604F0();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v92 = v47;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Loading manifest file from path %{public}@", buf, 0xCu);
  }

  v50 = (id)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactory createSignedManifestFromManifestFile:](MSDSignedManifestFactory, "createSignedManifestFromManifestFile:", v47));
  v51 = sub_1000604F0();
  v52 = objc_claimAutoreleasedReturnValue(v51);
  v53 = v52;
  if (!v50)
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      sub_1000C5FE0();

    v82 = 0;
    sub_1000B63A4(&v82, 3727740942, (uint64_t)CFSTR("Failed to load cached manifest file"));
    v57 = v82;
    v50 = 0;
    goto LABEL_66;
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v92 = v47;
    v93 = 2114;
    v94 = v78;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Copying manifest file from %{public}@ to %{public}@", buf, 0x16u);
  }

  if ((objc_msgSend(v75, "fileExistsAtPath:", v77) & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v73, "helperAgent"));
    v55 = objc_msgSend(v54, "prepareWorkDirectory:writableByNonRoot:", v77, 1);

    if ((v55 & 1) == 0)
    {
      v68 = sub_1000604F0();
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        sub_1000C612C();

      v57 = 0;
      goto LABEL_66;
    }
  }
  if (objc_msgSend(v75, "fileExistsAtPath:", v78))
  {
    v81 = 0;
    v56 = objc_msgSend(v75, "removeItemAtPath:error:", v78, &v81);
    v57 = v81;
    if ((v56 & 1) == 0)
    {
      v58 = sub_1000604F0();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_1000C60A0();

      goto LABEL_66;
    }
  }
  else
  {
    v57 = 0;
  }
  v60 = v57;
  v80 = v57;
  v61 = objc_msgSend(v75, "copyItemAtPath:toPath:error:", v47, v78, &v80);
  v57 = v80;

  if ((v61 & 1) == 0)
  {
    v66 = sub_1000604F0();
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      sub_1000C6040();

    v7 = v78;
    goto LABEL_66;
  }
  v50 = v50;
  v62 = v50;
  v7 = v78;
LABEL_53:

  return v62;
}

- (id)_contentPlistPathForManifest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PartNumber")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Revision")));

  if (!v5)
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C622C(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_9;
  }
  if (!v7)
  {
    v19 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C629C(v11, v20, v21, v22, v23, v24, v25, v26);
LABEL_9:

    v8 = 0;
    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@_%d.plist"), CFSTR("/var/MSDWorkContainer/.MSD_cache_content_plist"), v5, objc_msgSend(v7, "intValue")));
LABEL_4:

  return v8;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)migrationDone
{
  return self->_migrationDone;
}

- (void)setMigrationDone:(BOOL)a3
{
  self->_migrationDone = a3;
}

- (MSDTargetDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (MSDHelperAgent)helperAgent
{
  return self->_helperAgent;
}

- (void)setHelperAgent:(id)a3
{
  objc_storeStrong((id *)&self->_helperAgent, a3);
}

- (MSDComponentManager)componentManager
{
  return self->_componentManager;
}

- (void)setComponentManager:(id)a3
{
  objc_storeStrong((id *)&self->_componentManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentManager, 0);
  objc_storeStrong((id *)&self->_helperAgent, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
