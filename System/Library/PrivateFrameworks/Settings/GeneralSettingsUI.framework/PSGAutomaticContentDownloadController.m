@implementation PSGAutomaticContentDownloadController

- (PSGAutomaticContentDownloadController)init
{
  PSGAutomaticContentDownloadController *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSMutableDictionary *applicationStates;
  void *v9;
  _BOOL4 v10;
  void *default_evaluator;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  PSGAutomaticContentDownloadController *v18;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  NSMutableDictionary *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)PSGAutomaticContentDownloadController;
  v2 = -[PSGAutomaticContentDownloadController init](&v20, sel_init);
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
    v4 = v3;
    if (v3)
      v5 = (id)objc_msgSend(v3, "mutableCopy");
    else
      v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = v5;
    objc_storeStrong((id *)&v2->_applicationStates, v5);

    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      applicationStates = v2->_applicationStates;
      *(_DWORD *)buf = 138412290;
      v22 = applicationStates;
      _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "########### _applicationStates %@", buf, 0xCu);
    }

    -[PSGAutomaticContentDownloadController defaultPathEvaluator](v2, "defaultPathEvaluator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      default_evaluator = (void *)nw_path_create_default_evaluator();
      -[PSGAutomaticContentDownloadController setDefaultPathEvaluator:](v2, "setDefaultPathEvaluator:", default_evaluator);

      objc_initWeak((id *)buf, v2);
      -[PSGAutomaticContentDownloadController defaultPathEvaluator](v2, "defaultPathEvaluator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC9B8];
      v17 = MEMORY[0x24BDAC760];
      objc_copyWeak(&v19, (id *)buf);
      v18 = v2;
      nw_path_evaluator_set_update_handler();

      -[PSGAutomaticContentDownloadController defaultPathEvaluator](v18, "defaultPathEvaluator", v17, 3221225472, __45__PSGAutomaticContentDownloadController_init__block_invoke, &unk_24F9C7CB0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = nw_path_evaluator_copy_path();
      -[PSGAutomaticContentDownloadController setInLowDataMode:](v18, "setInLowDataMode:", nw_path_is_constrained(v15));

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }

  }
  return v2;
}

void __45__PSGAutomaticContentDownloadController_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _BOOL8 is_constrained;
  NSObject *path;

  path = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    is_constrained = nw_path_is_constrained(path);
    if (is_constrained != objc_msgSend(WeakRetained, "inLowDataMode"))
    {
      objc_msgSend(WeakRetained, "setInLowDataMode:", is_constrained);
      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
    }
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PSGAutomaticContentDownloadController defaultPathEvaluator](self, "defaultPathEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSGAutomaticContentDownloadController defaultPathEvaluator](self, "defaultPathEvaluator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    nw_path_evaluator_cancel();

    -[PSGAutomaticContentDownloadController setDefaultPathEvaluator:](self, "setDefaultPathEvaluator:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSGAutomaticContentDownloadController;
  -[PSGAutomaticContentDownloadController dealloc](&v5, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id settingsChangedObserver;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_settingsChangedObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE63740];
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__PSGAutomaticContentDownloadController_viewDidAppear___block_invoke;
    v20[3] = &unk_24F9C7CD8;
    v20[4] = self;
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, v7, v8, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    settingsChangedObserver = self->_settingsChangedObserver;
    self->_settingsChangedObserver = v9;

  }
  v19.receiver = self;
  v19.super_class = (Class)PSGAutomaticContentDownloadController;
  -[PSGAutomaticContentDownloadController viewDidAppear:](&v19, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/AUTO_CONTENT_DOWNLOAD"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithKey:table:locale:bundleURL:", CFSTR("AUTO_CONTENT_DOWNLOAD"), CFSTR("General"), v13, v15);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAutomaticContentDownloadController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.background-app-refresh"), v16, v18, v11);

}

void __55__PSGAutomaticContentDownloadController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  pid_t v6;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE63B60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  v6 = getpid();

  if (v5 != v6)
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id settingsChangedObserver;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self->_settingsChangedObserver);

  settingsChangedObserver = self->_settingsChangedObserver;
  self->_settingsChangedObserver = 0;

  v7.receiver = self;
  v7.super_class = (Class)PSGAutomaticContentDownloadController;
  -[PSGAutomaticContentDownloadController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (id)whitelist
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.Passbook");
  v3[1] = CFSTR("com.apple.reminders");
  v4[0] = CFSTR("com.apple.Passbook");
  v4[1] = CFSTR("com.apple.reminders");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
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
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  BOOL v74;
  uint64_t v75;
  char *v76;
  char *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  int v102;
  int v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  PSGAutomaticContentDownloadController *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint8_t v121[128];
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  void *v125;
  _BYTE v126[128];
  _QWORD v127[3];
  _QWORD v128[6];

  v128[3] = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v90 = (int)*MEMORY[0x24BE756E0];
    -[PSGAutomaticContentDownloadController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AutomaticContentDownload"), self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v5, "isAutomaticAppUpdatesAllowed");
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v6, "isLowPowerModeEnabled");

    v7 = -[PSGAutomaticContentDownloadController inLowDataMode](self, "inLowDataMode");
    v94 = v5;
    v95 = objc_msgSend(v5, "isAutomaticAppUpdatesModificationAllowed");
    LODWORD(v5) = MGGetBoolAnswer();
    v92 = v4;
    objc_msgSend(v4, "specifierForID:", CFSTR("AUTO_CONTENT_DOWNLOAD"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v91 = v8;
    v107 = self;
    if ((_DWORD)v5)
    {
      objc_msgSend(v8, "setCellType:", 2);
      objc_msgSend(v9, "setDetailControllerClass:", objc_opt_class());
      objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      PSG_LocalizedStringForAutomaticContentDownload(CFSTR("NONE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v128[0] = v10;
      v105 = v7;
      SFLocalizableWAPIStringKeyForKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PSG_LocalizedStringForAutomaticContentDownload(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v128[1] = v12;
      SFLocalizableWAPIStringKeyForKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PSG_LocalizedStringForAutomaticContentDownload(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v128[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      PSG_LocalizedStringForAutomaticContentDownload(CFSTR("NONE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v127[0] = v16;
      SFLocalizableWAPIStringKeyForKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PSG_LocalizedStringForAutomaticContentDownload(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v127[1] = v18;
      SFLocalizableWAPIStringKeyForKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PSG_LocalizedStringForAutomaticContentDownload(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v127[2] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v105;
      v9 = v91;
      objc_msgSend(v91, "setValues:titles:shortTitles:", &unk_24F9D45A8, v15, v21);

    }
    else
    {
      objc_msgSend(v8, "setCellType:", 6);
    }
    v22 = (uint64_t *)MEMORY[0x24BE75A18];
    if (v102)
    {
      v99 = *MEMORY[0x24BE75A18];
      objc_msgSend(v9, "setProperty:forKey:", &unk_24F9D4230);
      objc_msgSend(v92, "specifierForID:", CFSTR("UPDATE_TYPE_GROUP"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PSG_LocalizedStringForAutomaticContentDownload(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setProperty:forKey:", v26, *MEMORY[0x24BE75A68]);
      v103 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v95);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = *v22;
      objc_msgSend(v9, "setProperty:forKey:", v23);

      objc_msgSend(v92, "specifierForID:", CFSTR("UPDATE_TYPE_GROUP"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v24;
      if (v7)
      {
        SFLocalizableWAPIStringKeyForKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PSG_LocalizedStringForAutomaticContentDownload(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *MEMORY[0x24BE75A68];
      }
      else
      {
        v27 = (uint64_t *)MEMORY[0x24BE75A68];
        SFLocalizableWAPIStringKeyForKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PSG_LocalizedStringForAutomaticContentDownload(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *v27;
      }
      objc_msgSend(v24, "setProperty:forKey:", v26, v28);
    }

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    PSGGreenTeaAppListLog(CFSTR("Reading AppList from LSApplicationWorkspace"), v29, v30, v31, v32, v33, v34, v35, v88);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "applicationsWithUIBackgroundModes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v38 = v37;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
    v104 = v38;
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v117 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          objc_msgSend(v43, "appTags");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "containsObject:", CFSTR("hidden"));

          if ((v45 & 1) == 0)
          {
            objc_msgSend(v43, "UIBackgroundModes");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            _PSGLoggingFacility();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v43, "applicationIdentifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "componentsJoinedByString:", CFSTR(","));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v123 = v48;
              v124 = 2112;
              v125 = v49;
              _os_log_impl(&dword_22E024000, v47, OS_LOG_TYPE_DEFAULT, "############## Checking duet app: %@ with modes: %@", buf, 0x16u);

            }
            objc_msgSend(v43, "bundleIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.webapp"));

            if ((v51 & 1) != 0)
              goto LABEL_36;
            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            v52 = v46;
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
            if (!v53)
              goto LABEL_35;
            v54 = v53;
            v55 = *(_QWORD *)v113;
LABEL_22:
            v56 = 0;
            while (1)
            {
              if (*(_QWORD *)v113 != v55)
                objc_enumerationMutation(v52);
              v57 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v56);
              if ((objc_msgSend(v57, "isEqualToString:", CFSTR("remote-notification")) & 1) != 0
                || (objc_msgSend(v57, "isEqualToString:", CFSTR("newsstand-content")) & 1) != 0
                || (objc_msgSend(v57, "isEqualToString:", CFSTR("fetch")) & 1) != 0
                || objc_msgSend(v57, "isEqualToString:", CFSTR("processing")))
              {
                break;
              }
              if (v54 == ++v56)
              {
                v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
                v38 = v104;
                if (!v54)
                  goto LABEL_35;
                goto LABEL_22;
              }
            }
            _PSGLoggingFacility();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v43, "applicationIdentifier");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v123 = v59;
              v124 = 2112;
              v125 = v57;
              _os_log_impl(&dword_22E024000, v58, OS_LOG_TYPE_DEFAULT, "############## Adding %@ with mode %@", buf, 0x16u);

            }
            objc_msgSend(v43, "applicationIdentifier");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "addObject:", v60);

            v38 = v104;
LABEL_35:

LABEL_36:
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
      }
      while (v40);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "effectiveBlacklistedAppBundleIDs");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v63 = v100;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
    if (!v64)
      goto LABEL_71;
    v65 = v64;
    v66 = *(_QWORD *)v109;
    v67 = 4;
    if (v103)
      v67 = 6;
    v101 = v67;
    v93 = *MEMORY[0x24BE63800];
    v98 = *MEMORY[0x24BE75B88];
    v97 = *MEMORY[0x24BE75B70];
    v96 = *MEMORY[0x24BDBD298];
LABEL_43:
    v68 = 0;
    while (1)
    {
      if (*(_QWORD *)v109 != v66)
        objc_enumerationMutation(v63);
      v69 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v68);
      if ((objc_msgSend(v62, "containsObject:", v69) & 1) != 0)
        goto LABEL_69;
      objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "localizedName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSGAutomaticContentDownloadController whitelist](v107, "whitelist");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKey:", v69);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
        v74 = 1;
      else
        v74 = v71 == 0;
      if (v74)
      {

      }
      else
      {
        v75 = objc_msgSend(v71, "length");

        if (!v75)
          goto LABEL_68;
        if (v103)
          v76 = sel_setApplicationEnabled_forSpecifier_;
        else
          v76 = 0;
        if (v103)
          v77 = sel_applicationEnabled_;
        else
          v77 = 0;
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v71, v107, v76, v77, 0, v101, 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v78;
        if (v102)
        {
          objc_msgSend(v78, "setProperty:forKey:", &unk_24F9D4230, v99);
        }
        else
        {
          v79 = (void *)MEMORY[0x24BDD16E0];
          if (v95)
            v80 = objc_msgSend(v94, "isBoolSettingLockedDownByRestrictions:", v93) ^ 1;
          else
            v80 = 0;
          objc_msgSend(v79, "numberWithBool:", v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setProperty:forKey:", v81, v99);

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setProperty:forKey:", v82, v98);

        objc_msgSend(v72, "setProperty:forKey:", v69, v97);
        objc_msgSend(v72, "setProperty:forKey:", v69, v96);
        objc_msgSend(v106, "addObject:", v72);
      }

LABEL_68:
LABEL_69:
      if (v65 == ++v68)
      {
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
        if (!v65)
        {
LABEL_71:

          CFPreferencesSetAppValue(CFSTR("KeepAppsUpToDateAppList"), v107->_applicationStates, CFSTR("com.apple.mt"));
          CFPreferencesAppSynchronize(CFSTR("com.apple.mt"));
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "sortedArrayUsingComparator:", &__block_literal_global);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "addObjectsFromArray:", v84);

          objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "addObject:", v85);
          objc_msgSend(v92, "addObjectsFromArray:", v83);
          v86 = *(Class *)((char *)&v107->super.super.super.super.super.isa + v90);
          *(Class *)((char *)&v107->super.super.super.super.super.isa + v90) = (Class)v92;

          v3 = *(Class *)((char *)&v107->super.super.super.super.super.isa + v90);
          return v3;
        }
        goto LABEL_43;
      }
    }
  }
  return v3;
}

uint64_t __51__PSGAutomaticContentDownloadController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)setBackgroundRefreshState:(id)a3 withSpecifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CFPropertyListRef *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(a4, "cellType") == 6)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutomaticAppUpdatesAllowed:", objc_msgSend(v6, "BOOLValue"));

    goto LABEL_11;
  }
  v8 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
  }
  else
  {
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAutomaticAppUpdatesAllowed:", 1);

      v12 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
      goto LABEL_10;
    }
    if (v8)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  objc_msgSend(v9, "setAutomaticAppUpdatesAllowed:", v11);

  v12 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
LABEL_10:
  CFPreferencesSetAppValue(CFSTR("WiFiOnly"), *v12, CFSTR("com.apple.mt"));
LABEL_11:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, 0, 1u);
  _PSGLoggingFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = objc_msgSend(v6, "BOOLValue");
    _os_log_impl(&dword_22E024000, v15, OS_LOG_TYPE_DEFAULT, "########### [[MCProfileConnection sharedConnection] setAutomaticAppUpdatesAllowed:[value BOOLValue]] %d", (uint8_t *)v16, 8u);
  }

  -[PSGAutomaticContentDownloadController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)backgroundRefreshState:(id)a3
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v9;
  id v10;
  Boolean keyExistsAndHasValidFormat;

  v3 = objc_msgSend(a3, "cellType");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

  if (v5
    || (objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isAutomaticAppUpdatesAllowed"),
        v6,
        !v7))
  {
    v9 = &unk_24F9D41E8;
    if (v3 == 6)
      v9 = (void *)MEMORY[0x24BDBD1C0];
    v10 = v9;
    return v10;
  }
  else if (v3 == 6)
  {
    return MEMORY[0x24BDBD1C8];
  }
  else
  {
    keyExistsAndHasValidFormat = 1;
    if (CFPreferencesGetAppBooleanValue(CFSTR("WiFiOnly"), CFSTR("com.apple.mt"), &keyExistsAndHasValidFormat))
      return &unk_24F9D4200;
    else
      return &unk_24F9D4218;
  }
}

- (void)setApplicationEnabled:(id)a3 forSpecifier:(id)a4
{
  NSMutableDictionary *applicationStates;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v13;
  NSMutableDictionary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  applicationStates = self->_applicationStates;
  v7 = *MEMORY[0x24BDBD298];
  v8 = a3;
  objc_msgSend(a4, "propertyForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](applicationStates, "setObject:forKey:", v8, v9);

  _PSGLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_applicationStates;
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "########### _applicationStates %@", (uint8_t *)&v13, 0xCu);
  }

  CFPreferencesSetAppValue(CFSTR("KeepAppsUpToDateAppList"), self->_applicationStates, CFSTR("com.apple.mt"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mt"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, 0, 1u);
}

- (id)applicationEnabled:(id)a3
{
  NSMutableDictionary *applicationStates;
  void *v4;
  void *v5;

  applicationStates = self->_applicationStates;
  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BDBD298]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](applicationStates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSMutableArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_storeStrong((id *)&self->_applications, a3);
}

- (NSMutableDictionary)applicationStates
{
  return self->_applicationStates;
}

- (void)setApplicationStates:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStates, a3);
}

- (OS_nw_path_evaluator)defaultPathEvaluator
{
  return self->_defaultPathEvaluator;
}

- (void)setDefaultPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPathEvaluator, a3);
}

- (BOOL)inLowDataMode
{
  return self->_inLowDataMode;
}

- (void)setInLowDataMode:(BOOL)a3
{
  self->_inLowDataMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPathEvaluator, 0);
  objc_storeStrong((id *)&self->_applicationStates, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong(&self->_settingsChangedObserver, 0);
}

@end
