@implementation PSUICellularDataPlanListGroup

+ (id)key
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
}

+ (id)groupWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PSUICellularDataPlanListGroup *v10;
  PSUICellularDataPlanListGroup *v11;

  v5 = a3;
  v6 = a4;
  +[PSUICellularDataPlanListGroup key](PSUICellularDataPlanListGroup, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = -[PSUICellularDataPlanListGroup initWithListController:groupSpecifier:]([PSUICellularDataPlanListGroup alloc], "initWithListController:groupSpecifier:", v5, v6);
  v11 = v10;

  return v11;
}

- (PSUICellularDataPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUICellularDataPlanListGroup *v8;
  PSUICellularDataPlanListGroup *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDataPlanListGroup;
  v8 = -[PSUICellularDataPlanListGroup init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__infoSymbolTapped_, CFSTR("PSDataPlanInfoSymbolTappedNotification"), 0);

  return v9;
}

- (void)turnOnLocationServicesPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularDataPlanListGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[PSUICellularDataPlanListGroup turnOnLocationServicesPressed:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v8, 0);

}

- (id)specifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  PSSpecifier *v24;
  PSSpecifier *addNewPlanSpecifier;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  objc_class *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  uint64_t v74;
  id obj;
  void *v76;
  id v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[8];
  uint8_t *v84;
  uint64_t v85;
  void *v86;
  _BYTE v87[128];
  uint64_t v88;
  NSRange v89;
  NSRange v90;

  v88 = *MEMORY[0x24BDAC8D0];
  v77 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "planItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionsInUse");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v73, "count"))
  {
    objc_msgSend(v73, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptionContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v80;
    v9 = *MEMORY[0x24BE75948];
    v10 = *MEMORY[0x24BE75958];
    v11 = *MEMORY[0x24BE75CE8];
    v74 = *MEMORY[0x24BE75C20];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v80 != v8)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 3, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), v9);
        +[PSUICellularPlanUniversalReference referenceFromPlanItem:](PSUICellularPlanUniversalReference, "referenceFromPlanItem:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setProperty:forKey:", v17, v10);

        objc_msgSend(v16, "setProperty:forKey:", v76, v11);
        objc_msgSend(v16, "setUserInfo:", v13);
        if (objc_msgSend(v13, "isSelected"))
        {
          objc_msgSend(v77, "insertObject:atIndex:", v16, 0);
          WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
          objc_msgSend(WeakRetained, "setProperty:forKey:", v16, v74);

        }
        else
        {
          objc_msgSend(v77, "addObject:", v16);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    }
    while (v7);
  }

  if (+[SettingsCellularUtils shouldShowPendingTransferPlanOnPad](SettingsCellularUtils, "shouldShowPendingTransferPlanOnPad"))
  {
    -[PSUICellularDataPlanListGroup setUpPendingTransferPlanSpecifiers:](self, "setUpPendingTransferPlanSpecifiers:", v77);
  }
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldShowAddPlan");

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_NEW"), &stru_24D5028C8, CFSTR("Cellular"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 13, 0);
    v24 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    addNewPlanSpecifier = self->_addNewPlanSpecifier;
    self->_addNewPlanSpecifier = v24;

    -[PSSpecifier setIdentifier:](self->_addNewPlanSpecifier, "setIdentifier:", CFSTR("CELLULAR_PLAN_NEW"));
    -[PSSpecifier setButtonAction:](self->_addNewPlanSpecifier, "setButtonAction:", sel_addNewPlanPressed_);
    objc_msgSend(v77, "addObject:", self->_addNewPlanSpecifier);
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend(v26, "isSingleActivationCodeFlowSupported");

    if ((_DWORD)v21)
    {
      *(_QWORD *)buf = 0;
      v84 = buf;
      v85 = 0x2020000000;
      v27 = getCLCopyAppsUsingLocationSymbolLoc_ptr;
      v86 = getCLCopyAppsUsingLocationSymbolLoc_ptr;
      if (!getCLCopyAppsUsingLocationSymbolLoc_ptr)
      {
        v28 = (void *)CoreLocationLibrary();
        v27 = dlsym(v28, "CLCopyAppsUsingLocation");
        *((_QWORD *)v84 + 3) = v27;
        getCLCopyAppsUsingLocationSymbolLoc_ptr = v27;
      }
      _Block_object_dispose(buf, 8);
      if (!v27)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      v29 = (id)((uint64_t (*)(void))v27)();
      objc_msgSend(v29, "objectForKey:", CFSTR("/System/Library/Frameworks/CoreTelephony.framework"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(v29, "objectForKey:", CFSTR("com.apple.locationd.bundle-/System/Library/Frameworks/CoreTelephony.framework"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31 = objc_msgSend(getCLLocationManagerClass(), "locationServicesEnabled");
      if ((v31 & objc_msgSend(getCLLocationManagerClass(), "isEntityAuthorizedForLocationDictionary:", v30) & 1) != 0)
      {
        v32 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE"), &stru_24D5028C8, CFSTR("Cellular"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setProperty:forKey:", v34, *MEMORY[0x24BE75A68]);
      }
      else
      {
        -[PSUICellularDataPlanListGroup getLogger](self, "getLogger");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2161C6000, v35, OS_LOG_TYPE_DEFAULT, "Cellular: Location Services off", buf, 2u);
        }

        if (v31)
          v36 = CFSTR("prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES");
        else
          v36 = CFSTR("prefs:root=Privacy&path=LOCATION");
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", v40, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setProperty:forKey:", v43, *MEMORY[0x24BE75A30]);

        v44 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        objc_msgSend(v44, "setProperty:forKey:", v33, *MEMORY[0x24BE75A58]);

        v45 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v89.location = objc_msgSend(v33, "rangeOfString:", v32);
        NSStringFromRange(v89);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setProperty:forKey:", v46, *MEMORY[0x24BE75A40]);

        v47 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v36);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setProperty:forKey:", v48, *MEMORY[0x24BE75A60]);

        v49 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setProperty:forKey:", v50, *MEMORY[0x24BE75A50]);

        v34 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        objc_msgSend(v34, "setProperty:forKey:", CFSTR("turnOnLocationServicesPressed:"), *MEMORY[0x24BE75A38]);
      }

    }
    else
    {
      v29 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE"), &stru_24D5028C8, CFSTR("Cellular"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setProperty:forKey:", v32, *MEMORY[0x24BE75A68]);
    }

  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "userInterfaceIdiom");

  if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isAnyLocalFlowTypeSupported");

    if ((v54 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24D5028C8, CFSTR("Cellular"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("APPLE_SIM_MESSAGE"), &stru_24D5028C8, CFSTR("Cellular"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringByAppendingString:", CFSTR("\n"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringByAppendingString:", v56);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      objc_msgSend(v61, "setProperty:forKey:", v60, *MEMORY[0x24BE75A58]);

      v62 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v90.location = objc_msgSend(v60, "rangeOfString:", v56);
      NSStringFromRange(v90);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setProperty:forKey:", v63, *MEMORY[0x24BE75A40]);

      v64 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setProperty:forKey:", v66, *MEMORY[0x24BE75A30]);

      v67 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v68 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("APPLE_SIM_LEARN_MORE_URL"), &stru_24D5028C8, CFSTR("Cellular"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "URLWithString:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setProperty:forKey:", v71, *MEMORY[0x24BE75A60]);

    }
  }

  return v77;
}

- (void)setUpPendingTransferPlanSpecifiers:(id)a3
{
  id v3;
  void *v4;
  PSUIPlanPendingTransferListGroup *v5;

  v3 = a3;
  v5 = -[PSUIPlanPendingTransferListGroup initWithListController:groupSpecifier:]([PSUIPlanPendingTransferListGroup alloc], "initWithListController:groupSpecifier:", 0, 0);
  -[PSUIPlanPendingTransferListGroup specifiers](v5, "specifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (void)listController:(id)a3 didSelectSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = 0;
  v6 = a3;
  objc_msgSend(v6, "getGroup:row:ofSpecifier:", &v11, 0, a4);
  objc_msgSend(v6, "specifierAtIndex:", objc_msgSend(v6, "indexOfGroup:", v11));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75B28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75C20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularDataPlanListGroup selectPlanWithSpecifier:](self, "selectPlanWithSpecifier:", v10);

  }
}

- (void)addNewPlanPressed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;
  id v8;
  __objc2_class **v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  TSSIMSetupFlow *v21;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[8];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierItemFlowSupported");

  if ((v6 & 1) != 0)
  {
    v7 = _os_feature_enabled_impl();
    v8 = objc_alloc(MEMORY[0x24BEBD7A0]);
    v9 = off_24D500A38;
    if (!v7)
      v9 = off_24D500A48;
    v10 = objc_alloc_init(*v9);
    v11 = (void *)objc_msgSend(v8, "initWithRootViewController:", v10);

    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    -[PSUICellularDataPlanListGroup listController](self, "listController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

  }
  else
  {
    -[PSUICellularDataPlanListGroup getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "CarrierItemFlow is not supported.", buf, 2u);
    }

    if (!self->_flow
      || (-[PSUICellularDataPlanListGroup listController](self, "listController"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "presentedViewController"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = v15 == 0,
          v15,
          v14,
          v16))
    {
      if (+[SettingsCellularUtils noDataConnectivityAvailable](SettingsCellularUtils, "noDataConnectivityAvailable"))
      {
        -[PSUICellularDataPlanListGroup getLogger](self, "getLogger");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "Data connectivity is not available to set up eSIM(s) on iPad", buf, 2u);
        }

        -[PSUICellularDataPlanListGroup _showWifiAlert](self, "_showWifiAlert");
      }
      else
      {
        objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        -[PSUICellularDataPlanListGroup _showSpinner:](self, "_showSpinner:", 1);
        v27 = *MEMORY[0x24BE82B48];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v20);
        v21 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
        flow = self->_flow;
        self->_flow = v21;

        -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v23 = self->_flow;
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __51__PSUICellularDataPlanListGroup_addNewPlanPressed___block_invoke;
        v24[3] = &unk_24D501810;
        objc_copyWeak(&v25, (id *)buf);
        v24[4] = self;
        -[TSSIMSetupFlow firstViewController:](v23, "firstViewController:", v24);
        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);

      }
    }
    else
    {
      -[PSUICellularDataPlanListGroup getLogger](self, "getLogger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2161C6000, v17, OS_LOG_TYPE_ERROR, "Duplicate request to launch SimSetupSupport", buf, 2u);
      }

    }
  }

}

void __51__PSUICellularDataPlanListGroup_addNewPlanPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setFirstViewController:", v3);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
    -[NSObject setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
    objc_msgSend(v5, "listController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
    +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularDataPlanListGroup key](PSUICellularDataPlanListGroup, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v5, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "Invalid PSUICellularDataPlanListGroup", v10, 2u);
    }
  }

}

- (void)selectPlanWithSpecifier:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDataPlanListGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PSUICellularDataPlanListGroup selectPlanWithSpecifier:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s selected plan %@", (uint8_t *)&v7, 0x16u);
  }

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedPlanItem:", v4);

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD block[5];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PSUICellularDataPlanListGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D501A20;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__PSUICellularDataPlanListGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "addNewPlanSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);

    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(*(id *)(a1 + 32), "addNewPlanSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSpecifier:", v7);

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 56);
    *(_QWORD *)(v8 + 56) = 0;

    +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularDataPlanListGroup key](PSUICellularDataPlanListGroup, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    WeakRetained = v12;
  }

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *spinner;
  void *v9;
  void *v10;
  void *v11;
  id originAccessoryView;
  void *v13;
  void *v14;
  _QWORD block[5];

  v3 = a3;
  if (!self->_spinner)
  {
    v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v7;

    -[PSUICellularDataPlanListGroup addNewPlanSpecifier](self, "addNewPlanSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    originAccessoryView = self->_originAccessoryView;
    self->_originAccessoryView = v11;

    if (v3)
      goto LABEL_3;
LABEL_5:
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    -[PSUICellularDataPlanListGroup addNewPlanSpecifier](self, "addNewPlanSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessoryView:", self->_originAccessoryView);

    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  -[PSUICellularDataPlanListGroup addNewPlanSpecifier](self, "addNewPlanSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryView:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
LABEL_6:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PSUICellularDataPlanListGroup__showSpinner___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__PSUICellularDataPlanListGroup__showSpinner___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addNewPlanSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:", v2);

}

- (void)_showWifiAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  _QWORD v23[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOT_CONNECTED_TO_INTERNET"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "sf_isiPhone");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v3)
    v8 = CFSTR("TURN_ON_WIFI_TO_SETUP_ESIM");
  else
    v8 = CFSTR("TURN_ON_WIFI_TO_SETUP_ESIM_IPAD");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v4, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    v15 = CFSTR("CHOOSE_WLAN");
  else
    v15 = CFSTR("CHOOSE_WIFI");
  objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, &__block_literal_global_8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v17);
  v18 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __47__PSUICellularDataPlanListGroup__showWifiAlert__block_invoke_2;
  v23[3] = &unk_24D5017B8;
  v23[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v21);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0);

}

void __47__PSUICellularDataPlanListGroup__showWifiAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void __47__PSUICellularDataPlanListGroup__showWifiAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "user canceled setting up eSIM", v2, 2u);
  }

}

- (void)_infoSymbolTapped:(id)a3
{
  PSUIDataPlanDetailsController *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4 = -[PSUIDataPlanDetailsController initWithParentSpecifier:]([PSUIDataPlanDetailsController alloc], "initWithParentSpecifier:", v7);
    -[PSUIDataPlanDetailsController setSpecifier:](v4, "setSpecifier:", v7);
    -[PSUICellularDataPlanListGroup listController](self, "listController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v4, 1);

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDataPlanListGroup"));
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (UIViewController)firstViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_firstViewController);
}

- (void)setFirstViewController:(id)a3
{
  objc_storeWeak((id *)&self->_firstViewController, a3);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PSSpecifier)addNewPlanSpecifier
{
  return self->_addNewPlanSpecifier;
}

- (void)setAddNewPlanSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_addNewPlanSpecifier, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_firstViewController);
  objc_destroyWeak((id *)&self->_listController);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_addNewPlanSpecifier, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
}

@end
