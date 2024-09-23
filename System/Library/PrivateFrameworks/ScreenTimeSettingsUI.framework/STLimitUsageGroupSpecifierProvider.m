@implementation STLimitUsageGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[STRootGroupSpecifierProvider providerWithCoordinator:](STLimitUsageGroupSpecifierProvider, "providerWithCoordinator:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRootViewController:", v5);

  return v6;
}

- (STLimitUsageGroupSpecifierProvider)init
{
  STLimitUsageGroupSpecifierProvider *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  objc_super v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x24BDAC8D0];
  v81.receiver = self;
  v81.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v81, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0x24BE75000uLL;
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LimitUsageGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v7);

    -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _os_feature_enabled_impl();
    v9 = (_QWORD *)MEMORY[0x24BE75D28];
    v73 = v3;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivitySpecifierName"), &stru_24DB8A1D0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivitySpecifierSubtitleText"), &stru_24DB8A1D0, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)v10;
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, v2, 0, 0, 0, 2, objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIdentifier:", CFSTR("APP_AND_WEBSITE_ACTIVITY"));
      v79 = *MEMORY[0x24BE75D50];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v69, *v9);
      v78 = *MEMORY[0x24BE75AC0];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("APP_AND_WEBSITE_ACTIVITY"));
      v12 = objc_opt_class();
      v77 = *MEMORY[0x24BE75948];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A68]), "initWithSymbolName:bundleURL:", CFSTR("chart.bar.xaxis"), 0);
      v14 = (void *)objc_opt_new();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A50]), "initWithSystemColor:", 11);
      v85[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSymbolColors:", v16);

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A50]), "initWithSystemColor:", 6);
      v84 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnclosureColors:", v18);

      objc_msgSend(v14, "setRenderingMode:", 3);
      objc_msgSend(v13, "imageForGraphicSymbolDescriptor:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", objc_msgSend(v19, "CGImage"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_applicationIconImageForFormat:precomposed:", 0, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *MEMORY[0x24BE75AC8];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE75AC8]);
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = *MEMORY[0x24BE75C60];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24);

      v67 = *MEMORY[0x24BE75E18];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24DBBE688);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8]);
      objc_msgSend(v11, "setControllerLoadAction:", sel_setUpAppAndWebsiteActivity_);
      -[STLimitUsageGroupSpecifierProvider setAppAndWebsiteActivitySpecifier:](v2, "setAppAndWebsiteActivitySpecifier:", v11);

      v3 = v73;
      v4 = 0x24BE75000;

      v25 = v79;
    }
    else
    {
      v25 = *MEMORY[0x24BE75D50];
      v78 = *MEMORY[0x24BE75AC0];
      v77 = *MEMORY[0x24BE75948];
      v22 = *MEMORY[0x24BE75AC8];
      v71 = *MEMORY[0x24BE75C60];
      v67 = *MEMORY[0x24BE75E18];
    }
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeSpecifierName"), &stru_24DB8A1D0, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v4 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, v2, 0, 0, 0, 2, objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setIdentifier:", CFSTR("DOWNTIME"));
    v70 = (void *)v26;
    v80 = v25;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v25);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("DOWNTIME"), v78);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_opt_class(), v77);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("DeviceDowntime"), v3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v22;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v22);

    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, v71);

    objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_24DBBE688, v67);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
    objc_msgSend(v27, "setControllerLoadAction:", sel_showDeviceBedtimeViewController_);
    v72 = v27;
    -[STLimitUsageGroupSpecifierProvider setDeviceBedtimeSpecifier:](v2, "setDeviceBedtimeSpecifier:", v27);
    if ((_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v76, "addObject:", v27);
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AppLimitsSpecifierName"), &stru_24DB8A1D0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v4 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, v2, 0, 0, 0, 2, objc_opt_class());
    v33 = v3;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setIdentifier:", CFSTR("APP_LIMITS"));
    v68 = (void *)v32;
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, v80);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("APP_LIMITS"), v78);
    -[STLimitUsageGroupSpecifierProvider appLimitsDetailText](v2, "appLimitsDetailText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x24BE75D28];
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BE75D28]);

    objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_opt_class(), v77);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("AppLimits"), v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v38 = v4;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v39, v75);

    objc_msgSend(v34, "setControllerLoadAction:", sel_showAppLimitsViewController_);
    v66 = v34;
    -[STLimitUsageGroupSpecifierProvider setAppLimitsSpecifier:](v2, "setAppLimitsSpecifier:", v34);
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowedSpecifierName"), &stru_24DB8A1D0, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v38 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v40, v2, 0, 0, 0, 2, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setIdentifier:", CFSTR("ALWAYS_ALLOWED"));
    v65 = (void *)v40;
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, v80);
    objc_msgSend(v41, "setObject:forKeyedSubscript:", CFSTR("ALWAYS_ALLOWED"), v78);
    -[STLimitUsageGroupSpecifierProvider alwaysAllowedDetailText](v2, "alwaysAllowedDetailText");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v36;
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, v36);

    objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_opt_class(), v77);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("AlwaysAllow"), v33);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v44, v75);

    objc_msgSend(v41, "setControllerLoadAction:", sel_showAlwaysAllowedViewController_);
    -[STLimitUsageGroupSpecifierProvider setAlwaysAllowedSpecifier:](v2, "setAlwaysAllowedSpecifier:", v41);
    if ((_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v76, "addObject:", v41);
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceSpecifierName"), &stru_24DB8A1D0, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ScreenDistanceSpecifierSubtitleText"), &stru_24DB8A1D0, 0);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_opt_new();
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A50]), "initWithSystemColor:", 7);
    v83 = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setSymbolColors:", v49);

    v50 = (void *)v46;
    objc_msgSend(MEMORY[0x24BE51A50], "white");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setEnclosureColors:", v52);

    objc_msgSend(v47, "setSymbolSize:", 2);
    objc_msgSend(v47, "setSymbolWeight:", 5);
    objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AF0]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "size");
    objc_msgSend(v47, "setSize:");

    v54 = objc_alloc(MEMORY[0x24BE51A68]);
    objc_msgSend(v33, "bundleURL");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v54, "initWithSymbolName:bundleURL:", CFSTR("screen-distance.symbol"), v55);

    objc_msgSend(v56, "imageForGraphicSymbolDescriptor:", v47);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)MEMORY[0x24BEBD640];
    v59 = objc_msgSend(v57, "CGImage");
    objc_msgSend(v57, "scale");
    objc_msgSend(v58, "imageWithCGImage:scale:orientation:", v59, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v45, v2, 0, 0, objc_opt_class(), 2, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setIdentifier:", CFSTR("EYE_DISTANCE"));
    objc_msgSend(v61, "setObject:forKeyedSubscript:", CFSTR("EYE_DISTANCE"), v78);
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v45, v80);
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v46, v64);
    objc_msgSend(v61, "setObject:forKeyedSubscript:", objc_opt_class(), v77);
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, v75);
    objc_msgSend(v61, "setControllerLoadAction:", sel_setUpScreenDistance_);
    -[STLimitUsageGroupSpecifierProvider setScreenDistanceSpecifier:](v2, "setScreenDistanceSpecifier:", v61);
    if ((_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v76, "addObject:", v61);
    -[STLimitUsageGroupSpecifierProvider scheduleDowntimeRefreshIfNeeded](v2, "scheduleDowntimeRefreshIfNeeded");
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v5, sel_invalidate);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isLocalOrRemotelyManagedUser"), "STLimitUsageGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.screenTimeEnabled"), "STLimitUsageGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.bedtime"), "STLimitUsageGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("viewModel.hasWatchOSDevicesOnly"));
  v6.receiver = self;
  v6.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isLocalOrRemotelyManagedUser"), 4, "STLimitUsageGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.bedtime"), 5, "STLimitUsageGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.screenTimeEnabled"), 4, "STLimitUsageGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.hasWatchOSDevicesOnly"), 5, "STLimitUsageGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  objc_super v24;

  v10 = a3;
  v11 = a5;
  if (a6 == "STLimitUsageGroupSpecifierProviderObservationContext")
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("timeAllowancesCoordinator.viewModel.bedtime")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STLimitUsageGroupSpecifierProvider _deviceBedtimeDidChange:](self, "_deviceBedtimeDidChange:", v13);
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.isLocalOrRemotelyManagedUser")))
        {
          -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "viewModel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isLocalOrRemotelyManagedUser") ^ 1;
          if (v16 == 2)
            v20 = 1;
          else
            v20 = v19;
          -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v20);

        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.screenTimeEnabled")) & 1) != 0
               || objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.hasWatchOSDevicesOnly")))
        {
          -[STLimitUsageGroupSpecifierProvider _isScreenTimeEnabledOrHasWatchOSDevicesOnlyDidChange](self, "_isScreenTimeEnabledOrHasWatchOSDevicesOnlyDidChange");
        }
        goto LABEL_8;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.screenTimeEnabled")))
      {
        objc_msgSend(v12, "viewModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isScreenTimeEnabled");

        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v22 ^ 1u);
        goto LABEL_8;
      }
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.hasWatchOSDevicesOnly")))
        goto LABEL_8;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v23)
      {

        v13 = 0;
      }
      -[STLimitUsageGroupSpecifierProvider _hasWatchOSDevicesOnlyDidChange:](self, "_hasWatchOSDevicesOnlyDidChange:", objc_msgSend(v13, "BOOLValue"));
    }

LABEL_8:
    goto LABEL_9;
  }
  v24.receiver = self;
  v24.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  -[STLimitUsageGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_9:

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638F0]);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLocalOrRemotelyManagedUser") ^ 1;
    if (v6 == 2)
      v9 = 1;
    else
      v9 = v8;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v9);

  }
}

- (void)_isScreenTimeEnabledOrHasWatchOSDevicesOnlyDidChange
{
  void *v3;
  id v4;

  -[STLimitUsageGroupSpecifierProvider limitUsageSpecifers](self, "limitUsageSpecifers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToArray:", v3) & 1) == 0)
    objc_msgSend(v3, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(v3, "count"), v4);

}

- (id)limitUsageSpecifers
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScreenTimeEnabled");

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasWatchOSDevicesOnly");

  v9 = (void *)MEMORY[0x24BDBCEB8];
  if (v5)
  {
    -[STLimitUsageGroupSpecifierProvider deviceBedtimeSpecifier](self, "deviceBedtimeSpecifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if ((v8 & 1) != 0)
    {
      v20[0] = v10;
      -[STLimitUsageGroupSpecifierProvider alwaysAllowedSpecifier](self, "alwaysAllowedSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21[0] = v10;
      -[STLimitUsageGroupSpecifierProvider appLimitsSpecifier](self, "appLimitsSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v12;
      -[STLimitUsageGroupSpecifierProvider alwaysAllowedSpecifier](self, "alwaysAllowedSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithArray:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[STLimitUsageGroupSpecifierProvider appAndWebsiteActivitySpecifier](self, "appAndWebsiteActivitySpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[STLimitUsageGroupSpecifierProvider screenDistanceSpecifier](self, "screenDistanceSpecifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[STLimitUsageGroupSpecifierProvider screenDistanceSpecifier](self, "screenDistanceSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

  }
  return v14;
}

- (void)setUpAppAndWebsiteActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  -[STLimitUsageGroupSpecifierProvider setAppAndWebsiteActivityOnboardingController:](self, "setAppAndWebsiteActivityOnboardingController:", v5);

  -[STLimitUsageGroupSpecifierProvider appAndWebsiteActivityOnboardingController](self, "appAndWebsiteActivityOnboardingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLimitUsageGroupSpecifierProvider rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke;
  v9[3] = &unk_24DB86728;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "presentOverViewController:completionBlock:", v7, v9);

}

uint64_t __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setScreenTimeEnabled:completionHandler:", 1, &__block_literal_global_0);
  return result;
}

void __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)scheduleDowntimeRefreshAndReloadSpecifiersForBedtime:(id)a3
{
  id v4;

  v4 = a3;
  -[STLimitUsageGroupSpecifierProvider scheduleDowntimeRefreshIfNeeded](self, "scheduleDowntimeRefreshIfNeeded");
  -[STLimitUsageGroupSpecifierProvider _refreshBedtimeSpecifiersForBedtime:](self, "_refreshBedtimeSpecifiersForBedtime:", v4);

}

- (void)scheduleDowntimeRefreshIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[STLimitUsageGroupSpecifierProvider downtimeScheduleRefreshTimer](self, "downtimeScheduleRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STLimitUsageGroupSpecifierProvider downtimeScheduleRefreshTimer](self, "downtimeScheduleRefreshTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[STLimitUsageGroupSpecifierProvider setDowntimeScheduleRefreshTimer:](self, "setDowntimeScheduleRefreshTimer:", 0);
  }
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeAllowancesCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeToNextExpectedStateChange");
  v8 = v7;

  if (v8 >= 0.0)
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x24BDBCF40];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __69__STLimitUsageGroupSpecifierProvider_scheduleDowntimeRefreshIfNeeded__block_invoke;
    v14 = &unk_24DB86750;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STLimitUsageGroupSpecifierProvider setDowntimeScheduleRefreshTimer:](self, "setDowntimeScheduleRefreshTimer:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __69__STLimitUsageGroupSpecifierProvider_scheduleDowntimeRefreshIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeAllowancesCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bedtime");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "scheduleDowntimeRefreshAndReloadSpecifiersForBedtime:", v7);

}

- (void)_refreshBedtimeSpecifiersForBedtime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[STLimitUsageGroupSpecifierProvider deviceBedtimeSpecifier](self, "deviceBedtimeSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  if (!v4)
    goto LABEL_4;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isScreenTimeEnabled");

  v5 = v15;
  if ((v8 & 1) != 0)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeAlternateCustomScheduleDetailText"), &stru_24DB8A1D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, 0x24DB94290);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24DBBE6A0, 0x24DB942B0);

  }
  else
  {
LABEL_4:
    objc_msgSend(v5, "removePropertyForKey:", 0x24DB94290);
    objc_msgSend(v15, "removePropertyForKey:", 0x24DB942B0);
  }
  v11 = *MEMORY[0x24BE75D28];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLimitUsageGroupSpecifierProvider _subtitleTextForDeviceBedtime:](self, "_subtitleTextForDeviceBedtime:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v11);
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v15, 0);
    objc_msgSend(v15, "propertyForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v13) & 1) == 0)
      -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v15, 0);

  }
}

- (id)_subtitleTextForDeviceBedtime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;

  v4 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[STRootGroupSpecifierProvider coordinator](self, "coordinator"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "viewModel"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isScreenTimeEnabled"),
        v7,
        v6,
        v8))
  {
    v9 = objc_msgSend(v4, "deviceBedtimeEnabled");
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeAllowancesCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "currentDowntimeState");

    if ((v9 & 1) != 0)
    {
      if (v12 > 4)
      {
        v14 = 0;
        goto LABEL_8;
      }
      v13 = off_24DB86798[v12];
    }
    else if (v12 == 4)
    {
      v13 = CFSTR("DeviceDowntimeStatusScheduleOffWithOverrideOn");
    }
    else
    {
      v13 = CFSTR("DeviceDowntimeDailyScheduleOff");
    }
  }
  else
  {
    v13 = CFSTR("DeviceDowntimeDetailText");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v13, &stru_24DB8A1D0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

- (void)showDeviceBedtimeViewController:(id)a3
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
  id v16;

  v16 = a3;
  if (!-[STLimitUsageGroupSpecifierProvider showDemoModeAlertIfNeeded](self, "showDemoModeAlertIfNeeded"))
  {
    v4 = (void *)objc_opt_new();
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeAllowancesCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bedtime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBedtime:", v8);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "me");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAffectedUser:", v11);

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCanAskForMoreTime:", objc_msgSend(v12, "isPasscodeEnabled"));

    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCoordinator:", v13);

    -[STGroupSpecifierProvider delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParentController:", v14);
    objc_msgSend(v14, "rootController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootController:", v15);

    objc_msgSend(v4, "setSpecifier:", v16);
    -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v4, 1);

  }
}

- (id)appLimitsDetailText
{
  void *v2;
  void *v3;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppLimitsDetailText"), &stru_24DB8A1D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)showAppLimitsViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[STLimitUsageGroupSpecifierProvider showDemoModeAlertIfNeeded](self, "showDemoModeAlertIfNeeded"))
  {
    v4 = (void *)objc_opt_new();
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCoordinator:", v5);

    -[STGroupSpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParentController:", v6);
    objc_msgSend(v6, "rootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootController:", v7);

    objc_msgSend(v4, "setSpecifier:", v8);
    -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v4, 1);

  }
}

- (void)_hasWatchOSDevicesOnlyDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a3;
  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STLimitUsageGroupSpecifierProvider appLimitsSpecifier](self, "appLimitsSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "containsObject:", v5);
  if (v6 && v3)
  {
    objc_msgSend(v8, "removeObject:", v5);
  }
  else if (((v6 | v3) & 1) == 0)
  {
    -[STLimitUsageGroupSpecifierProvider deviceBedtimeSpecifier](self, "deviceBedtimeSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ps_insertObject:afterObject:", v5, v7);

  }
}

- (id)alwaysAllowedDetailText
{
  void *v2;
  void *v3;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AlwaysAllowDetailText"), &stru_24DB8A1D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)showAlwaysAllowedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  uint8_t buf[16];

  v4 = a3;
  if (!-[STLimitUsageGroupSpecifierProvider showDemoModeAlertIfNeeded](self, "showDemoModeAlertIfNeeded"))
  {
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeAllowancesCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v7;
    objc_msgSend(v7, "alwaysAllowList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[STUILog alwaysAllowed](STUILog, "alwaysAllowed");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219AB4000, v9, OS_LOG_TYPE_DEFAULT, "View model has no existing Always Allow list. Creating view controller with default Always Allow list.", buf, 2u);
      }

      v8 = (void *)objc_opt_new();
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setAlwaysAllowList:", v8);
    v29 = v5;
    objc_msgSend(v10, "setCoordinator:", v5);
    objc_msgSend(v10, "setDelegate:", self);
    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE15820], "systemUnblockableBundleIdentifiersForDeviceFamily:", 102);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "unionSet:", v12);
    }
    else
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v11, "unionSet:", v13);

    }
    objc_msgSend(MEMORY[0x24BE15820], "systemBlockableBundleIdentifiersForDeviceFamily:", 102);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "unionSet:", v14);
    }
    else
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v11, "unionSet:", v15);

    }
    objc_msgSend(MEMORY[0x24BE15820], "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v11, "unionSet:", v16);
    }
    else
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(v11, "unionSet:", v17);

    }
    v18 = objc_alloc(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v8, "allowedBundleIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithArray:", v19);

    objc_msgSend(v20, "unionSet:", v11);
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "installedBundleIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setInstalledBundleIDs:", v23);
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    objc_msgSend(v24, "minusSet:", v20);
    objc_msgSend(v24, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setChooseBundleIDs:", v25);

    -[STGroupSpecifierProvider delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParentController:", v26);
    objc_msgSend(v26, "rootController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRootController:", v27);

    objc_msgSend(v10, "setSpecifier:", v4);
    -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v10, 1);

  }
}

- (void)alwaysAllowListController:(id)a3 didFinishEditingAlwaysAllowList:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a4;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeAllowancesCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__STLimitUsageGroupSpecifierProvider_alwaysAllowListController_didFinishEditingAlwaysAllowList___block_invoke;
  v8[3] = &unk_24DB866E0;
  v8[4] = self;
  objc_msgSend(v7, "saveAlwaysAllowList:completionHandler:", v5, v8);

}

void __96__STLimitUsageGroupSpecifierProvider_alwaysAllowListController_didFinishEditingAlwaysAllowList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "alwaysAllowedDetailText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alwaysAllowedSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *MEMORY[0x24BE75D28]);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "alwaysAllowedSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifier:animated:", v5, 1);

}

- (void)setUpScreenDistance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  STEyeReliefOnboardingController *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eyeReliefCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hasAcknowledgedIntroScreens");
  +[STUILog eyeRelief](STUILog, "eyeRelief");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "isEyeReliefEnabled");
    v11 = CFSTR("no");
    if (v10)
      v12 = CFSTR("yes");
    else
      v12 = CFSTR("no");
    if (v8)
      v11 = CFSTR("yes");
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_219AB4000, v9, OS_LOG_TYPE_DEFAULT, "isEyeReliefEnabled: %@, hasAcknowledgedIntroScreens: %@", buf, 0x16u);
  }

  if ((objc_msgSend(v7, "isEyeReliefEnabled") | v8) == 1 && (objc_msgSend(v7, "inDemoMode") & 1) == 0)
  {
    if ((v8 & 1) == 0)
      objc_msgSend(v7, "acknowledgeIntroScreens");
    -[STLimitUsageGroupSpecifierProvider showScreenDistanceViewController:](self, "showScreenDistanceViewController:", v4);
  }
  else
  {
    v13 = -[STEyeReliefOnboardingController initWithCoordinator:]([STEyeReliefOnboardingController alloc], "initWithCoordinator:", v5);
    -[STLimitUsageGroupSpecifierProvider setEyeReliefOnboardingController:](self, "setEyeReliefOnboardingController:", v13);

    objc_initWeak((id *)buf, self);
    -[STLimitUsageGroupSpecifierProvider eyeReliefOnboardingController](self, "eyeReliefOnboardingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STLimitUsageGroupSpecifierProvider rootViewController](self, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke;
    v16[3] = &unk_24DB86778;
    objc_copyWeak(&v17, (id *)buf);
    objc_msgSend(v14, "presentOverViewController:completionHandler:", v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
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
  char v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_13;
  if (a2 == 1)
  {
    objc_msgSend(WeakRetained, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eyeReliefCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistEyeReliefState:", 0);

    objc_msgSend(v4, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eyeReliefCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "acknowledgeIntroScreens");

  }
  else
  {
    if (a2 != 2)
      goto LABEL_7;
    objc_msgSend(WeakRetained, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eyeReliefCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistEyeReliefState:", 1);

    objc_msgSend(v4, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eyeReliefCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acknowledgeIntroScreens");

    objc_msgSend(v4, "screenDistanceSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showScreenDistanceViewController:", v10);
  }

LABEL_7:
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v18 = objc_msgSend(v15, "saveContext:error:", v17, &v27);
    v19 = v27;

    if ((v18 & 1) == 0)
    {
      +[STUILog communicationSafety](STUILog, "communicationSafety");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke_cold_1((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);

    }
  }
LABEL_13:

}

- (void)showScreenDistanceViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[STLimitUsageGroupSpecifierProvider showDemoModeAlertIfNeeded](self, "showDemoModeAlertIfNeeded"))
  {
    v4 = (void *)objc_opt_new();
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCoordinator:", v5);

    -[STGroupSpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParentController:", v6);
    objc_msgSend(v6, "rootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootController:", v7);

    objc_msgSend(v4, "setSpecifier:", v8);
    -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v4, 1);

  }
}

- (BOOL)showDemoModeAlertIfNeeded
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
  if (v3)
    -[STGroupSpecifierProvider showStoreDemoAlert](self, "showStoreDemoAlert");
  return v3;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (PSSpecifier)appAndWebsiteActivitySpecifier
{
  return self->_appAndWebsiteActivitySpecifier;
}

- (void)setAppAndWebsiteActivitySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_appAndWebsiteActivitySpecifier, a3);
}

- (PSSpecifier)deviceBedtimeSpecifier
{
  return self->_deviceBedtimeSpecifier;
}

- (void)setDeviceBedtimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceBedtimeSpecifier, a3);
}

- (PSSpecifier)appLimitsSpecifier
{
  return self->_appLimitsSpecifier;
}

- (void)setAppLimitsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_appLimitsSpecifier, a3);
}

- (PSSpecifier)alwaysAllowedSpecifier
{
  return self->_alwaysAllowedSpecifier;
}

- (void)setAlwaysAllowedSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysAllowedSpecifier, a3);
}

- (PSSpecifier)screenDistanceSpecifier
{
  return self->_screenDistanceSpecifier;
}

- (void)setScreenDistanceSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_screenDistanceSpecifier, a3);
}

- (NSTimer)downtimeScheduleRefreshTimer
{
  return self->_downtimeScheduleRefreshTimer;
}

- (void)setDowntimeScheduleRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_downtimeScheduleRefreshTimer, a3);
}

- (STAppAndWebsiteActivityOnboardingController)appAndWebsiteActivityOnboardingController
{
  return self->_appAndWebsiteActivityOnboardingController;
}

- (void)setAppAndWebsiteActivityOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_appAndWebsiteActivityOnboardingController, a3);
}

- (STEyeReliefOnboardingController)eyeReliefOnboardingController
{
  return self->_eyeReliefOnboardingController;
}

- (void)setEyeReliefOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_eyeReliefOnboardingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeReliefOnboardingController, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivityOnboardingController, 0);
  objc_storeStrong((id *)&self->_downtimeScheduleRefreshTimer, 0);
  objc_storeStrong((id *)&self->_screenDistanceSpecifier, 0);
  objc_storeStrong((id *)&self->_alwaysAllowedSpecifier, 0);
  objc_storeStrong((id *)&self->_appLimitsSpecifier, 0);
  objc_storeStrong((id *)&self->_deviceBedtimeSpecifier, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivitySpecifier, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
}

void __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, a2, a3, "failed to set screen time enabled: %{public}@", a5, a6, a7, a8, 2u);
}

void __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, a2, a3, "Failed to save Communication Safety settings: %{public}@", a5, a6, a7, a8, 2u);
}

@end
