@implementation PSGGeneralController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  PSSpecifier *v31;
  PSSpecifier *airDropSpecifier;
  void *v33;
  char v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  const __CFBoolean *v51;
  const __CFBoolean *v52;
  CFTypeID v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void **v79;
  void *v80;
  id v82;
  void *v83;
  id v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD block[4];
  id v91;
  PSGGeneralController *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE v99[128];
  void *v100;
  const __CFString *v101;
  void *v102;
  _QWORD v103[4];
  _QWORD v104[4];
  __int128 buf;
  Class (*v106)(uint64_t);
  void *v107;
  uint64_t *v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  -[PSGGeneralController bundle](self, "bundle");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sf_isInternalInstall");

  v6 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v85, "pathForResource:ofType:", CFSTR("General"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "initWithContentsOfFile:", v7);

  v94 = 0;
  v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v10 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756C8]);
  v11 = (void *)objc_msgSend(v9, "initWithArray:", *v10);
  v93 = v11;
  v83 = (void *)v8;
  SpecifiersFromPlist();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v93;
  v84 = v93;

  objc_storeStrong(v10, v13);
  -[PSGGeneralController setTitle:](self, "setTitle:", 0, &v93);
  -[PSGGeneralController setSpecifierID:](self, "setSpecifierID:", v94);
  if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
  {
    objc_msgSend(v12, "specifierForID:", CFSTR("Reset"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v14);
    objc_msgSend(v12, "specifierForID:", CFSTR("SHUTDOWN_LABEL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "removeObject:", v15);
  }
  -[PSGGeneralController gameControllersSpecifier](self, "gameControllersSpecifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
  {
    objc_msgSend(v12, "specifierForID:", CFSTR("GAME_CONTROLLER"));
    v18 = objc_claimAutoreleasedReturnValue();
    -[PSGGeneralController setGameControllersSpecifier:](self, "setGameControllersSpecifier:", v18);

    PSBundlePathForPreferenceBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SFRuntimeAbsoluteFilePathForPath();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v20, "fileExistsAtPath:", v21);

    if ((v18 & 1) == 0)
    {
      PSBundlePathForPreferenceBundle();
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v22;
    }
    SFRuntimeAbsoluteFilePathForPath();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGGeneralController gameControllersSpecifier](self, "gameControllersSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE75B68]);

  }
  -[PSGGeneralController _gameControllerDefaults](self, "_gameControllerDefaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLForKey:", CFSTR("showGCPrefsPane"));

  if ((v26 & 1) == 0)
  {
    -[PSGGeneralController gameControllersSpecifier](self, "gameControllersSpecifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    if (!v28)
    {
      -[PSGGeneralController gameControllersSpecifier](self, "gameControllersSpecifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", v29);

    }
  }
  if ((PSGetCapabilityBoolAnswer() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("force-international"), CFSTR("com.apple.preferences"), 0))
  {
    objc_msgSend(v12, "specifierForID:", CFSTR("INTERNATIONAL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v30);

  }
  objc_msgSend(v12, "specifierForID:", CFSTR("AIRDROP_LINK"));
  v31 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  airDropSpecifier = self->_airDropSpecifier;
  self->_airDropSpecifier = v31;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isAirDropAllowed");

  if ((v34 & 1) == 0)
    objc_msgSend(v12, "removeObject:", self->_airDropSpecifier);
  -[PSGGeneralController carPreferences](self, "carPreferences");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  v37 = MEMORY[0x24BDAC760];
  if (v36)
  {
    v95 = 0;
    v96 = &v95;
    v97 = 0x2050000000;
    v38 = (void *)getCRCarPlayPreferencesClass_softClass;
    v98 = getCRCarPlayPreferencesClass_softClass;
    if (!getCRCarPlayPreferencesClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v106 = __getCRCarPlayPreferencesClass_block_invoke;
      v107 = &unk_24F9C8058;
      v108 = &v95;
      __getCRCarPlayPreferencesClass_block_invoke((uint64_t)&buf);
      v38 = (void *)v96[3];
    }
    v39 = objc_retainAutorelease(v38);
    _Block_object_dispose(&v95, 8);
    v40 = objc_alloc_init(v39);
    objc_msgSend(v40, "setPreferencesDelegate:", self);
    -[PSGGeneralController setCarPreferences:](self, "setCarPreferences:", v40);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", self, sel_pairedVehiclesDidChange, CFSTR("CRPairedVehiclesDidChangeNotification"), 0);

  }
  if (!-[PSGGeneralController _hasCarPlayContent](self, "_hasCarPlayContent"))
  {
    objc_msgSend(v12, "specifierForID:", CFSTR("CARPLAY"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v42);

  }
  objc_msgSend(v12, "specifierForID:", CFSTR("SOFTWARE_UPDATE_LINK"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGGeneralController loadingQueue](self, "loadingQueue");
  v44 = objc_claimAutoreleasedReturnValue();
  block[0] = v37;
  block[1] = 3221225472;
  block[2] = __34__PSGGeneralController_specifiers__block_invoke;
  block[3] = &unk_24F9C7E70;
  v82 = v43;
  v91 = v82;
  v92 = self;
  dispatch_async(v44, block);

  objc_msgSend(v12, "specifierForID:", CFSTR("STORAGE_MGMT"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 && _os_feature_enabled_impl())
  {
    PSBundlePathForPreferenceBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    SFRuntimeAbsoluteFilePathForPath();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setProperty:forKey:", v47, *MEMORY[0x24BE75B68]);

  }
  if (!_os_feature_enabled_impl()
    || (objc_msgSend(MEMORY[0x24BE6FB50], "isPictureInPictureSupported") & 1) == 0)
  {
    objc_msgSend(v12, "specifierForID:", CFSTR("PiP_SPEC"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v48);

  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "sf_isiPad"))
  {
    v50 = PSGetCapabilityBoolAnswer();

    if (!v50)
      goto LABEL_32;
    objc_msgSend(v12, "specifierForID:", CFSTR("SHOW_BATTERY_PERCENTAGE"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v49);
  }

LABEL_32:
  if ((PSGetCapabilityBoolAnswer() & 1) == 0)
  {
    v51 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("AllowTelephonyLoggingUI"), CFSTR("com.apple.commcenter"));
    v52 = v51;
    if (v51)
    {
      v53 = CFGetTypeID(v51);
      if (v53 == CFBooleanGetTypeID())
      {
        v54 = CFBooleanGetValue(v52) == 0;
        CFRelease(v52);
        if (!v54)
        {
          v55 = *MEMORY[0x24BE758F8];
          v103[0] = *MEMORY[0x24BE75D08];
          v103[1] = v55;
          v104[0] = CFSTR("PSLinkCell");
          v104[1] = CFSTR("EDGESettings");
          v56 = *MEMORY[0x24BDBD268];
          v57 = *MEMORY[0x24BE75AC0];
          v103[2] = *MEMORY[0x24BE758E0];
          v103[3] = v57;
          v104[2] = v56;
          v104[3] = CFSTR("TELEPHONY_LOGS");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v58;
          v101 = CFSTR("items");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v59;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          SpecifiersFromPlist();
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "specifierForID:", CFSTR("Reset"), 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ps_insertObjectsFromArray:afterObject:", v61, v62);

        }
      }
      else
      {
        CFRelease(v52);
      }
    }
  }
  objc_msgSend(v12, "specifierForID:", CFSTR("Reset"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForGeneral(CFSTR("TRANSFER_OR_RESET_TITLE"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setName:", v64);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v65, "userInterfaceIdiom"))
    v66 = CFSTR("com.apple.graphic-icon.transfer-or-reset-ipad");
  else
    v66 = CFSTR("com.apple.graphic-icon.transfer-or-reset-iphone");
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v66, *MEMORY[0x24BE75AE0]);

  objc_msgSend(v12, "specifierForID:", CFSTR("MATTER_ACCESSORIES"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGGeneralController setMatterSpecifier:](self, "setMatterSpecifier:", v67);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "BOOLForKey:", CFSTR("PSGShouldShowMatter"));

  if ((v69 & 1) == 0)
  {
    -[PSGGeneralController matterSpecifier](self, "matterSpecifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v70);

  }
  if (objc_opt_class() && (objc_msgSend(MEMORY[0x24BE829A0], "isDefaultContactlessAppConfigurationEligible") & 1) == 0)
  {
    _PSGLoggingFacility();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[PSGGeneralController specifiers]";
      _os_log_impl(&dword_22E024000, v71, OS_LOG_TYPE_DEFAULT, "%s: removing CONTACTLESS_NFC", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v12, "specifierForID:", CFSTR("CONTACTLESS_NFC"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v72);

  }
  if (PSIsInEDUMode())
  {
    __34__PSGGeneralController_specifiers__block_invoke_227();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (v74)
    {
      v75 = *(_QWORD *)v87;
      do
      {
        v76 = 0;
        do
        {
          if (*(_QWORD *)v87 != v75)
            objc_enumerationMutation(v73);
          objc_msgSend(v12, "specifierForID:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v76));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
            objc_msgSend(v12, "removeObject:", v77);

          ++v76;
        }
        while (v74 != v76);
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      }
      while (v74);
    }

  }
  -[PSGGeneralController sortDateTimeGroupWithSpecifiers:](self, "sortDateTimeGroupWithSpecifiers:", v12);
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = (void **)((char *)&self->super.super.super.super.super.isa + v3);
  v80 = *v79;
  *v79 = (void *)v78;

  v4 = *v79;
  return v4;
}

- (PSGGeneralController)init
{
  PSGGeneralController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  uint64_t v5;
  NSUserDefaults *gameControllerDefaults;
  void *v7;
  uint64_t v8;
  id gameControllerDefaultsObservationToken;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSGGeneralController;
  v2 = -[PSGGeneralController init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.GeneralSettingsUI.PSGGeneralController.loading", v3);
    -[PSGGeneralController setLoadingQueue:](v2, "setLoadingQueue:", v4);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.GameController"));
    gameControllerDefaults = v2->__gameControllerDefaults;
    v2->__gameControllerDefaults = (NSUserDefaults *)v5;

    -[PSGGeneralController _gameControllerDefaults](v2, "_gameControllerDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGGeneralController na_addNotificationBlockObserverForObject:keyPath:options:usingBlock:](v2, "na_addNotificationBlockObserverForObject:keyPath:options:usingBlock:", v7, CFSTR("showGCPrefsPane"), 1, &__block_literal_global_251);
    v8 = objc_claimAutoreleasedReturnValue();
    gameControllerDefaultsObservationToken = v2->__gameControllerDefaultsObservationToken;
    v2->__gameControllerDefaultsObservationToken = (id)v8;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionRestrictionChangedNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_profileNotification_, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_handleTVProviderStateDidChangeNotifications_, *MEMORY[0x24BDF8E50], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_handleTVProviderStateDidChangeNotifications_, *MEMORY[0x24BDF8DE0], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_launchHasCompleted_, *MEMORY[0x24BE75B60], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_pointerDevicesDidChange, PSGPointerDevicesDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[PSGGeneralController _gameControllerDefaultsObservationToken](self, "_gameControllerDefaultsObservationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGGeneralController na_removeNotificationBlockObserver:](self, "na_removeNotificationBlockObserver:", v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iapd.videoout.SettingsChanged"), 0);
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);

  -[PSGGeneralController carPreferences](self, "carPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferencesDelegate:", 0);

  -[PSGGeneralController setCarPreferences:](self, "setCarPreferences:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PSGGeneralController;
  -[PSGGeneralController dealloc](&v9, sel_dealloc);
}

- (CRCarPlayPreferences)carPreferences
{
  return self->_carPreferences;
}

- (void)reloadAsyncSpecifiersWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  os_signpost_id_t v25;
  _QWORD v26[4];
  NSObject *v27;
  os_signpost_id_t v28;
  _QWORD v29[4];
  NSObject *v30;
  os_signpost_id_t v31;
  _QWORD v32[4];
  NSObject *v33;
  os_signpost_id_t v34;
  uint8_t buf[4];
  PSGGeneralController *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSGGeneralController setSpecifiersHaveLoaded:](self, "setSpecifiersHaveLoaded:", 1);
  _PSGSignpostLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion");

  _PSGSignpostLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    v37 = 2082;
    v38 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]";
    _os_signpost_emit_with_name_impl(&dword_22E024000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}@: %{public}s", buf, 0x16u);
  }

  _PSGLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v36 = (PSGGeneralController *)"-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]";
    _os_log_impl(&dword_22E024000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: async reload started.", buf, 0xCu);
  }

  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke;
  v32[3] = &unk_24F9C7F68;
  v34 = v6;
  v12 = v10;
  v33 = v12;
  -[PSGGeneralController updateTrackpadWithCompletion:](self, "updateTrackpadWithCompletion:", v32);
  if ((PSIsInEDUMode() & 1) == 0)
  {
    dispatch_group_enter(v12);
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_146;
    v29[3] = &unk_24F9C7F68;
    v31 = v6;
    v30 = v12;
    -[PSGGeneralController updateMatterWithCompletion:](self, "updateMatterWithCompletion:", v29);

  }
  if ((PSIsInEDUMode() & 1) == 0)
  {
    dispatch_group_enter(v12);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_147;
    v26[3] = &unk_24F9C7F68;
    v28 = v6;
    v27 = v12;
    -[PSGGeneralController updateTVProviderWithCompletion:](self, "updateTVProviderWithCompletion:", v26);

  }
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_148;
  block[3] = &unk_24F9C88D0;
  v25 = v6;
  v13 = v4;
  v24 = v13;
  dispatch_group_notify(v12, MEMORY[0x24BDAC9B8], block);
  -[PSGGeneralController followUpModel](self, "followUpModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BE1B3E0]);
    -[PSGGeneralController bundle](self, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:clientIdentifier:", v18, 0);
    -[PSGGeneralController setFollowUpModel:](self, "setFollowUpModel:", v19);

    objc_initWeak((id *)buf, self);
    -[PSGGeneralController followUpModel](self, "followUpModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_150;
    v21[3] = &unk_24F9C88F8;
    objc_copyWeak(&v22, (id *)buf);
    objc_msgSend(v20, "setItemChangeHandler:", v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

- (void)insertOrderedSpecifiers:(id)a3 atID:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[5];
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__PSGGeneralController_insertOrderedSpecifiers_atID_animated___block_invoke;
  block[3] = &unk_24F9C7C88;
  block[4] = self;
  if (insertOrderedSpecifiers_atID_animated__onceToken != -1)
    dispatch_once(&insertOrderedSpecifiers_atID_animated__onceToken, block);
  v10 = objc_msgSend((id)insertOrderedSpecifiers_atID_animated__ordering, "indexOfObject:", v9);
  objc_msgSend((id)insertOrderedSpecifiers_atID_animated__ordering, "subarrayWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reverseObjectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[PSGGeneralController specifierForID:](self, "specifierForID:", v19, (_QWORD)v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[PSGGeneralController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v8, v19, v5);
          goto LABEL_13;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)updateSoftwareUpdateBadge
{
  id v3;

  -[PSGGeneralController specifierForID:](self, "specifierForID:", CFSTR("SOFTWARE_UPDATE_LINK"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (SUSUISettingsIsBadgedForSoftwareUpdate())
    objc_msgSend(v3, "setProperty:forKey:", &unk_24F9D43B0, *MEMORY[0x24BE75898]);
  else
    objc_msgSend(v3, "removePropertyForKey:", *MEMORY[0x24BE75898]);
  -[PSGGeneralController reloadSpecifier:](self, "reloadSpecifier:", v3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSGGeneralController;
  -[PSGGeneralController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[PSGGeneralController specifiersHaveLoaded](self, "specifiersHaveLoaded"))
  {
    if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
      -[PSGGeneralController updateSoftwareUpdateBadge](self, "updateSoftwareUpdateBadge");
  }
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: updateTrackpadWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  _PSGSignpostLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_22E024000, v4, OS_SIGNPOST_EVENT, v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}s: updateTrackpadWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  BOOL v12;
  char v13;

  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointerDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMouse");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, CFSTR("HasPointerDevice"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v6, CFSTR("HasMouse"));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke_2;
  block[3] = &unk_24F9C8A10;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v12 = v4;
  v13 = v6;
  v10 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpModel, 0);
  objc_storeStrong(&self->__gameControllerDefaultsObservationToken, 0);
  objc_storeStrong((id *)&self->__gameControllerDefaults, 0);
  objc_storeStrong((id *)&self->_carPreferences, 0);
  objc_storeStrong((id *)&self->_gameControllersSpecifier, 0);
  objc_storeStrong((id *)&self->_matterSpecifier, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_fontSpecifiers, 0);
  objc_storeStrong((id *)&self->_fontBundleControllers, 0);
  objc_storeStrong((id *)&self->_profileSpecifiers, 0);
  objc_storeStrong((id *)&self->_profileBundleControllers, 0);
  objc_storeStrong((id *)&self->_vpnSpecifiers, 0);
  objc_storeStrong((id *)&self->_vpnBundleControllers, 0);
  objc_storeStrong((id *)&self->_airDropSpecifier, 0);
  objc_storeStrong((id *)&self->_usageTimer, 0);
}

- (void)setCarPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_carPreferences, a3);
}

- (void)delayedAsyncLoadSpecifiers
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[PSGGeneralController delayedAsyncLoadSpecifiers]";
  _os_log_error_impl(&dword_22E024000, log, OS_LOG_TYPE_ERROR, "%s: expensive async load started during ppt launch test.", (uint8_t *)&v1, 0xCu);
}

uint64_t __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t result;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "specifierForID:", CFSTR("POINTERS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_BYTE *)(a1 + 48) == 0;
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "removeSpecifierID:animated:", CFSTR("POINTERS"), v5);

  }
  else
  {
    v5 = 1;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x24BE75590];
    if (*(_BYTE *)(a1 + 49))
      v8 = CFSTR("TRACKPAD_MOUSE");
    else
      v8 = CFSTR("TRACKPAD");
    PSG_LocalizedStringForPointers(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, v10, 0, 0, objc_opt_class(), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("POINTERS"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.trackpad-and-mouse"), *MEMORY[0x24BE75AE0]);
    v12 = objc_loadWeakRetained(v2);
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertOrderedSpecifiers:atID:animated:", v13, CFSTR("POINTERS"), v5);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)BOOLeanCapabilitiesToTest
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("DeviceSupportsCarIntegration");
  v3[1] = CFSTR("nVh/gwNpy7Jv1NOk00CMrw");
  v3[2] = CFSTR("fcc-logos-via-software");
  v3[3] = CFSTR("accessibility");
  v3[4] = CFSTR("international-settings");
  v3[5] = CFSTR("cellular-data");
  v3[6] = CFSTR("ringer-switch");
  v3[7] = CFSTR("Jq+xaurJgFzSwxOfTqtBGw");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__PSGGeneralController_insertOrderedSpecifiers_atID_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[40];

  v5[39] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("ABOUT_AND_SOFTWARE_UPDATE_GROUP");
  v5[1] = CFSTR("About");
  v5[2] = CFSTR("SOFTWARE_UPDATE_LINK");
  v5[3] = CFSTR("STORAGE_MGMT");
  v5[4] = CFSTR("COVERAGE_GROUP");
  v5[5] = CFSTR("COVERAGE");
  v5[6] = CFSTR("AIRDROP_GROUP");
  v5[7] = CFSTR("AIRDROP_LINK");
  v5[8] = CFSTR("CONTINUITY_SPEC");
  v5[9] = CFSTR("CONTACTLESS_NFC");
  v5[10] = CFSTR("PiP_SPEC");
  v5[11] = CFSTR("CARPLAY");
  v5[12] = CFSTR("MATTER_ACCESSORIES");
  v5[13] = CFSTR("NFC_LINK");
  v5[14] = CFSTR("HOME_BUTTON_GROUP");
  v5[15] = CFSTR("HOME_BUTTON");
  v5[16] = CFSTR("DATE_AND_TIME_GROUP");
  v5[17] = CFSTR("AUTOFILL");
  v5[18] = CFSTR("AUTO_CONTENT_DOWNLOAD");
  v5[19] = CFSTR("DATE_AND_TIME");
  v5[20] = CFSTR("DICTIONARY");
  v5[21] = CFSTR("FONT_SETTING");
  v5[22] = CFSTR("GAME_CONTROLLER");
  v5[23] = CFSTR("Keyboard");
  v5[24] = CFSTR("INTERNATIONAL");
  v5[25] = CFSTR("POINTERS");
  v5[26] = CFSTR("WINDOW_RESTORATION");
  v5[27] = CFSTR("TV_PROVIDER_GROUP");
  v5[28] = CFSTR("TV_PROVIDER");
  v5[29] = CFSTR("VPN_DEVICE_MANAGEMENT_GROUP");
  v5[30] = CFSTR("ManagedConfigurationList");
  v5[31] = CFSTR("RETAIL_KIOSK_MODE_SETTINGS_BUNDLE_GROUP");
  v5[32] = CFSTR("RETAIL_KIOSK_MODE_SETTINGS");
  v5[33] = CFSTR("LEGAL_AND_REGULATORY_GROUP");
  v5[34] = CFSTR("LEGAL_AND_REGULATORY");
  v5[35] = CFSTR("TRANSFER_ERASE_RESET_GROUP");
  v5[36] = CFSTR("Reset");
  v5[37] = CFSTR("SHUTDOWN_GROUP");
  v5[38] = CFSTR("SHUTDOWN_LABEL");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 39);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sortDateTimeGroupIdentifiers:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)insertOrderedSpecifiers_atID_animated__ordering;
  insertOrderedSpecifiers_atID_animated__ordering = v3;

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19[0] = CFSTR("POINTERS");
  v19[1] = CFSTR("MATTER_ACCESSORIES");
  v19[2] = CFSTR("TV_PROVIDER");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "isEqualToString:", v10, (_QWORD)v14))
        {
          -[PSGGeneralController specifierForID:](self, "specifierForID:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            v12 = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_146(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: updateMattersWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  _PSGSignpostLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_22E024000, v4, OS_SIGNPOST_EVENT, v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}s: updateMattersWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_147(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_22E024000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: updateTVProviderWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  _PSGSignpostLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_22E024000, v4, OS_SIGNPOST_EVENT, v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}s: updateTVProviderWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_148(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t result;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _PSGSignpostLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_22E024000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", ", (uint8_t *)&v7, 2u);
  }

  _PSGLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446210;
    v8 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: async reload completed.", (uint8_t *)&v7, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_150(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSoftwareUpdateBadge");

}

- (void)handleTVProviderStateDidChangeNotifications:(id)a3
{
  -[PSGGeneralController updateTVProviderWithCompletion:](self, "updateTVProviderWithCompletion:", 0);
}

- (void)updateTVProviderWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PSGGeneralController loadingQueue](self, "loadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke;
  block[3] = &unk_24F9C8998;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF8B90], "sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_2;
  v3[3] = &unk_24F9C8970;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "fetchAccountsWithCompletionHandler:", v3);

  objc_destroyWeak(&v5);
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;
  id v6[2];

  objc_msgSend(MEMORY[0x24BDF8C08], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "status");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_3;
  block[3] = &unk_24F9C8948;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = v3;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v6);
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  _QWORD v10[5];
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "beginUpdates");
  objc_msgSend(WeakRetained, "_createTVProviderSpecifiersIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_4;
    v11[3] = &unk_24F9C8920;
    v11[4] = WeakRetained;
    objc_msgSend(v2, "na_each:", v11);
  }
  else
  {
    objc_msgSend(v2, "reverseObjectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_5;
    v10[3] = &unk_24F9C8920;
    v10[4] = WeakRetained;
    objc_msgSend(v4, "na_each:", v10);

  }
  objc_msgSend(WeakRetained, "_updateInteractivityForTVProviderIfNeeded");
  objc_msgSend(WeakRetained, "endUpdates");
  objc_msgSend(WeakRetained, "specifierIDPendingPush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("TV_PROVIDER"), "isEqualToString:", v5) & 1) != 0)
  {
    objc_msgSend(WeakRetained, "specifierIDPendingPush");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "specifierForID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(WeakRetained, "handlePendingURL");
  }
  else
  {

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifierForID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertOrderedSpecifiers:atID:animated:", v8, v9, 1);

  }
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSpecifierID:", v3);

}

- (void)_updateInteractivityForTVProviderIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("TV_PROVIDER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSGGeneralController specifierForID:](self, "specifierForID:", CFSTR("TV_PROVIDER"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]);

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63AC0]);

    v9 = v5 == 1 && v7 == 1;
    objc_opt_class();
    v10 = *MEMORY[0x24BE75A18];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE75A18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;
    v14 = v13;
    if (!v13)
      v13 = (id)MEMORY[0x24BDBD1C8];
    v15 = objc_msgSend(v13, "BOOLValue");

    if (v9 != v15)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v10);

      -[PSGGeneralController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("TV_PROVIDER"));
    }

  }
}

- (void)updateMatterWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PSGGeneralController loadingQueue](self, "loadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__PSGGeneralController_updateMatterWithCompletion___block_invoke;
  block[3] = &unk_24F9C8998;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__PSGGeneralController_updateMatterWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_2;
  v2[3] = &unk_24F9C89E8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  +[PSGMatterController shouldShowMatterControllerWithCompletion:](PSGMatterController, "shouldShowMatterControllerWithCompletion:", v2);

  objc_destroyWeak(&v4);
}

void __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_3;
  block[3] = &unk_24F9C89C0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v6);
}

void __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[PSGGeneralController updateMatterWithCompletion:]_block_invoke_3";
      _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Self deallocated during load", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "matterSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "matterSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v21 = "-[PSGGeneralController updateMatterWithCompletion:]_block_invoke";
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Not updating Matter because self.matterSpecifier=%@", buf, 0x16u);

    }
LABEL_9:

    goto LABEL_22;
  }
  objc_msgSend(v3, "specifierForID:", CFSTR("MATTER_ACCESSORIES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "specifierForID:", CFSTR("CARPLAY_MATTER_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 != 0;

  }
  if (!*(_BYTE *)(a1 + 48) && v6)
  {
    objc_msgSend(v3, "matterSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeSpecifier:animated:", v10, 1);
LABEL_19:

    goto LABEL_20;
  }
  if (*(_BYTE *)(a1 + 48))
    v11 = v6;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v3, "matterSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matterSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertOrderedSpecifiers:atID:animated:", v12, v14, 1);

    goto LABEL_19;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBool:forKey:", *(unsigned __int8 *)(a1 + 48), CFSTR("PSGShouldShowMatter"));

  objc_msgSend(v3, "specifierIDPendingPush");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v3, "handlePendingURL");
LABEL_22:
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

- (void)updateTrackpadWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PSGGeneralController loadingQueue](self, "loadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke;
  block[3] = &unk_24F9C8998;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)sortDateTimeGroupIdentifiers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v3, "indexOfObject:", CFSTR("DATE_AND_TIME_GROUP"));
  v6 = objc_msgSend(v3, "indexOfObject:", CFSTR("TV_PROVIDER_GROUP"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v3;
  }
  else
  {
    v8 = v5 + 1;
    objc_msgSend(v3, "subarrayWithRange:", v8, v6 - v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__PSGGeneralController_sortDateTimeGroupIdentifiers___block_invoke_2;
    v14[3] = &unk_24F9C8A78;
    v11 = v4;
    v15 = v11;
    v16 = v8;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
    v12 = v11;

  }
  return v12;
}

uint64_t __53__PSGGeneralController_sortDateTimeGroupIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  PSG_LocalizedStringForGeneral(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForGeneral(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

uint64_t __53__PSGGeneralController_sortDateTimeGroupIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", a2, *(_QWORD *)(a1 + 40) + a3);
}

- (id)sortDateTimeGroupWithSpecifiers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v3, "indexOfSpecifierWithID:", CFSTR("DATE_AND_TIME_GROUP"));
  v6 = objc_msgSend(v3, "indexOfNextGroupStartingAtIndex:", v5);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v5 + 1;
    objc_msgSend(v3, "subarrayWithRange:", v8, v6 - v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_175);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __56__PSGGeneralController_sortDateTimeGroupWithSpecifiers___block_invoke_2;
    v16 = &unk_24F9C8AC0;
    v17 = v4;
    v18 = v8;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v13);

  }
  v11 = (void *)objc_msgSend(v4, "copy", v13, v14, v15, v16);

  return v11;
}

uint64_t __56__PSGGeneralController_sortDateTimeGroupWithSpecifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForGeneral(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PSG_LocalizedStringForGeneral(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedCompare:", v8);

  return v9;
}

uint64_t __56__PSGGeneralController_sortDateTimeGroupWithSpecifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", a2, *(_QWORD *)(a1 + 40) + a3);
}

- (void)reloadSpecifiers
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_22E024000, v1, v2, "%{public}s: called off main thread with backtrace: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)pairedVehiclesDidChange
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[PSGGeneralController pairedVehiclesDidChange]";
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: reloading specifiers because paired cars changed.", (uint8_t *)&v4, 0xCu);
  }

  -[PSGGeneralController reloadSpecifiers](self, "reloadSpecifiers");
}

void __34__PSGGeneralController_specifiers__block_invoke(uint64_t a1)
{
  char IsBadgedForSoftwareUpdate;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  char v8;

  IsBadgedForSoftwareUpdate = SUSUISettingsIsBadgedForSoftwareUpdate();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__PSGGeneralController_specifiers__block_invoke_2;
  block[3] = &unk_24F9C8AE8;
  v8 = IsBadgedForSoftwareUpdate;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

char *__34__PSGGeneralController_specifiers__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  char *result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "setProperty:forKey:", &unk_24F9D43B0, *MEMORY[0x24BE75898]);
  else
    objc_msgSend(v3, "removePropertyForKey:", *MEMORY[0x24BE75898]);
  result = *(char **)(a1 + 40);
  if (*(_QWORD *)&result[*MEMORY[0x24BE756E0]])
    return (char *)objc_msgSend(result, "reloadSpecifier:", *(_QWORD *)(a1 + 32));
  return result;
}

id __34__PSGGeneralController_specifiers__block_invoke_227()
{
  if (PSGTVProviderItemIdentifier_block_invoke_na_once_token_23 != -1)
    dispatch_once(&PSGTVProviderItemIdentifier_block_invoke_na_once_token_23, &__block_literal_global_231);
  return (id)PSGTVProviderItemIdentifier_block_invoke_na_once_object_23;
}

void __34__PSGGeneralController_specifiers__block_invoke_2_230()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("STORAGE_MGMT"), CFSTR("COVERAGE_GROUP"), CFSTR("COVERAGE"), CFSTR("CONTINUITY_SPEC"), CFSTR("CONTACTLESS_NFC"), CFSTR("PiP_SPEC"), CFSTR("CARPLAY"), CFSTR("MATTER_ACCESSORIES"), CFSTR("NFC_LINK"), CFSTR("HOME_BUTTON_GROUP"), CFSTR("HOME_BUTTON"), CFSTR("WINDOW_RESTORATION"), CFSTR("TV_PROVIDER_GROUP"), CFSTR("TV_PROVIDER"), CFSTR("RETAIL_KIOSK_MODE_SETTINGS_BUNDLE_GROUP"), CFSTR("RETAIL_KIOSK_MODE_SETTINGS"), CFSTR("TRANSFER_ERASE_RESET_GROUP"),
    CFSTR("Reset"),
    CFSTR("SHUTDOWN_GROUP"),
    CFSTR("SHUTDOWN_LABEL"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PSGTVProviderItemIdentifier_block_invoke_na_once_object_23;
  PSGTVProviderItemIdentifier_block_invoke_na_once_object_23 = v0;

}

- (void)loadHomeButtonSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setDelegate:", self);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75578]), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setSupportedInterfaceOrientations:", 2);
  objc_msgSend(v6, "setModalPresentationStyle:", 0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v7 = (void *)getBFFStyleClass_softClass;
  v14 = getBFFStyleClass_softClass;
  if (!getBFFStyleClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getBFFStyleClass_block_invoke;
    v10[3] = &unk_24F9C8058;
    v10[4] = &v11;
    __getBFFStyleClass_block_invoke((uint64_t)v10);
    v7 = (void *)v12[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v8, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyThemeToNavigationController:", v6);

  objc_msgSend(v5, "setUsesDoneButton:", 1);
  -[PSGGeneralController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)homeButtonCustomizeControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PSGGeneralController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[PSGGeneralController presentedViewController](self, "presentedViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "topViewController"),
        (id)objc_claimAutoreleasedReturnValue() != v10))
  {
    -[PSGGeneralController homeButtonCustomizeControllerDidFinish:].cold.1();
  }

  -[PSGGeneralController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  -[PSGGeneralController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8 == v10)
  {
    -[PSGGeneralController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_7:
    v9 = v10;
  }

}

- (BOOL)_hasCarPlayContent
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  -[PSGGeneralController carPreferences](self, "carPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarPlayAllowed");

  if (!v4)
    return 0;
  -[PSGGeneralController carPreferences](self, "carPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWirelessCarPlayEnabled");

  if ((v6 & 1) != 0)
    return 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v8 = (void *)getCRPairedVehicleManagerClass_softClass;
  v17 = getCRPairedVehicleManagerClass_softClass;
  if (!getCRPairedVehicleManagerClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getCRPairedVehicleManagerClass_block_invoke;
    v13[3] = &unk_24F9C8058;
    v13[4] = &v14;
    __getCRPairedVehicleManagerClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v14, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "allVehicles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "count") != 0;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGGeneralController;
  -[PSGGeneralController tableView:cellForRowAtIndexPath:](&v5, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)profileNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PSGGeneralController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__PSGGeneralController_profileNotification___block_invoke;
  v6[3] = &unk_24F9C7E70;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __44__PSGGeneralController_profileNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE63BA8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "intValue");
  if ((_DWORD)v2 != getpid())
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateInteractivityForTVProviderIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "reload");
  }

}

void __28__PSGGeneralController_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "_gameControllerDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("showGCPrefsPane"));

  objc_msgSend(v2, "gameControllersSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v2, "specifierForID:", CFSTR("GAME_CONTROLLER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!v6)
      {
        objc_msgSend(v2, "gameControllersSpecifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "insertOrderedSpecifiers:atID:animated:", v8, CFSTR("GAME_CONTROLLER"), 1);

      }
    }
    else if (v6)
    {
      objc_msgSend(v2, "removeSpecifierID:animated:", CFSTR("GAME_CONTROLLER"), 1);
    }
  }

}

- (void)pointerDevicesDidChange
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE75528], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "launchHasCompleted");

  if (v4)
    -[PSGGeneralController updateTrackpadWithCompletion:](self, "updateTrackpadWithCompletion:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)PSGGeneralController;
  -[PSGGeneralController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BE75528], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "launchHasCompleted");

  if (v5)
  {
    _PSGLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[PSGGeneralController viewDidAppear:]";
      _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "%s: calling delayedAsyncLoadSpecifiers", buf, 0xCu);
    }

    -[PSGGeneralController delayedAsyncLoadSpecifiers](self, "delayedAsyncLoadSpecifiers");
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("General"), CFSTR("General"), v9, v11);

  -[PSGGeneralController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.gear"), v12, MEMORY[0x24BDBD1A8], v7);
}

- (void)launchHasCompleted:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PSGGeneralController launchHasCompleted:]";
    _os_log_impl(&dword_22E024000, v4, OS_LOG_TYPE_DEFAULT, "%s: calling delayedAsyncLoadSpecifiers", (uint8_t *)&v5, 0xCu);
  }

  -[PSGGeneralController delayedAsyncLoadSpecifiers](self, "delayedAsyncLoadSpecifiers");
}

- (id)EDGEEnabled:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE755C8], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataServiceID");

  objc_msgSend(MEMORY[0x24BE755C8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interfaceConfigurationValueForKey:serviceID:", CFSTR("Available"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enableEdge:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE755C8], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataServiceID");

  objc_msgSend(MEMORY[0x24BE755C8], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterfaceConfigurationValue:forKey:serviceID:", v5, CFSTR("Available"), v4);

}

- (id)_createTVProviderSpecifiersIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if ((PSIsInEDUMode() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "specifierForID:", CFSTR("TV_PROVIDER_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("TV_PROVIDER_GROUP"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "specifierForID:", CFSTR("TV_PROVIDER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = (void *)MEMORY[0x24BE75590];
      PSG_LocalizedStringForGeneral(CFSTR("TV_PROVIDER_LABEL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setIdentifier:", CFSTR("TV_PROVIDER"));
      objc_msgSend(v7, "setControllerLoadAction:", sel_lazyLoadBundle_);
      v10 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.tv-provider"), *MEMORY[0x24BE75AE0]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE758E0]);
      PSBundlePathForPreferenceBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SFRuntimeAbsoluteFilePathForPath();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75B68]);

    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  return v3;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void)setLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loadingQueue, a3);
}

- (PSSpecifier)matterSpecifier
{
  return self->_matterSpecifier;
}

- (void)setMatterSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_matterSpecifier, a3);
}

- (PSSpecifier)gameControllersSpecifier
{
  return self->_gameControllersSpecifier;
}

- (void)setGameControllersSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_gameControllersSpecifier, a3);
}

- (BOOL)specifiersHaveLoaded
{
  return self->_specifiersHaveLoaded;
}

- (void)setSpecifiersHaveLoaded:(BOOL)a3
{
  self->_specifiersHaveLoaded = a3;
}

- (NSUserDefaults)_gameControllerDefaults
{
  return self->__gameControllerDefaults;
}

- (void)set_gameControllerDefaults:(id)a3
{
  objc_storeStrong((id *)&self->__gameControllerDefaults, a3);
}

- (id)_gameControllerDefaultsObservationToken
{
  return self->__gameControllerDefaultsObservationToken;
}

- (void)set_gameControllerDefaultsObservationToken:(id)a3
{
  objc_storeStrong(&self->__gameControllerDefaultsObservationToken, a3);
}

- (FLTopLevelViewModel)followUpModel
{
  return self->_followUpModel;
}

- (void)setFollowUpModel:(id)a3
{
  objc_storeStrong((id *)&self->_followUpModel, a3);
}

- (void)homeButtonCustomizeControllerDidFinish:.cold.1()
{
  __assert_rtn("-[PSGGeneralController homeButtonCustomizeControllerDidFinish:]", "PSGGeneralController.m", 782, "[self.presentedViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *)self.presentedViewController topViewController] == controller");
}

@end
