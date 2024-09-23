@implementation PSUICellularDiagnosticsController

- (PSUICellularDiagnosticsController)init
{
  PSUICellularDiagnosticsController *v2;
  PSUICellularDiagnosticsController *v3;
  PSSpecifier *appViewSpecifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUICellularDiagnosticsController;
  v2 = -[PSUICellularDiagnosticsController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PSUICellularDiagnosticsController set_appLockupViewNotAvailable:](v2, "set_appLockupViewNotAvailable:", 0);
    appViewSpecifier = v3->_appViewSpecifier;
    v3->_appViewSpecifier = 0;

  }
  return v3;
}

- (id)initAppInstallViewSpecifier:(id)a3
{
  id v5;
  PSUICellularDiagnosticsController *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICellularDiagnosticsController;
  v6 = -[PSUICellularDiagnosticsController init](&v9, sel_init);
  p_isa = (id *)&v6->super.super.super.super.super.isa;
  if (v6)
  {
    -[PSUICellularDiagnosticsController set_appLockupViewNotAvailable:](v6, "set_appLockupViewNotAvailable:", 1);
    objc_storeStrong(p_isa + 172, a3);
  }

  return p_isa;
}

- (id)diagnosticsStatus
{
  return (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "getDiagnosticsStatusText");
}

- (id)getAppViewSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  PSSpecifier *appViewSpecifier;
  PSSpecifier *v7;
  PSUICellularDiagnosticsController *v8;
  BOOL v9;
  NSObject *v10;
  PSUIAppInstallLockupViewSpecifier *v11;
  uint64_t v12;
  id *p_appViewSpecifier;
  id v14;
  _QWORD v16[5];
  id v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularDiagnosticsController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUICellularDiagnosticsController getAppViewSpecifier:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  appViewSpecifier = self->_appViewSpecifier;
  if (appViewSpecifier)
  {
    v7 = appViewSpecifier;
  }
  else
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = -[PSUICellularDiagnosticsController _appLockupViewNotAvailable](v8, "_appLockupViewNotAvailable");
    objc_sync_exit(v8);

    if (v9)
    {
      v7 = 0;
    }
    else
    {
      -[PSUICellularDiagnosticsController getLogger](v8, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[PSUICellularDiagnosticsController getAppViewSpecifier:]";
        _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s create new app view", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, v8);
      v11 = [PSUIAppInstallLockupViewSpecifier alloc];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke;
      v16[3] = &unk_24D5018A8;
      objc_copyWeak(&v17, (id *)buf);
      v16[4] = v8;
      v12 = -[PSUIAppInstallLockupViewSpecifier initWithFailureHandler:diagCode:OpenAppURL:appId:AnalyticsEventForApp:](v11, "initWithFailureHandler:diagCode:OpenAppURL:appId:AnalyticsEventForApp:", v16, v4, CFSTR("applesupport://getsupport.apple.com/?caller=settings.cellular"), CFSTR("1130498044"), 0x24D508468);
      p_appViewSpecifier = (id *)&self->_appViewSpecifier;
      v14 = *p_appViewSpecifier;
      *p_appViewSpecifier = (id)v12;

      v7 = (PSSpecifier *)*p_appViewSpecifier;
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }

  return v7;
}

void __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke_2;
  block[3] = &unk_24D501880;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1308]);

    if ((v4 & 1) == 0)
    {
      v5 = WeakRetained;
      objc_sync_enter(v5);
      objc_msgSend(a1[5], "getLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "LockupView is not available", v7, 2u);
      }

      objc_msgSend(v5, "set_appLockupViewNotAvailable:", 1);
      objc_sync_exit(v5);

      objc_msgSend(v5, "reloadSpecifiers");
    }
  }

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  objc_super v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;
  NSRange v71;

  v70 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v63.receiver = self;
  v63.super_class = (Class)PSUICellularDiagnosticsController;
  -[PSUICellularDiagnosticsController specifiers](&v63, sel_specifiers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_DIAGNOSTICS_RESULT_GROUP"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);
  v10 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_STATUS"), &stru_24D5028C8, CFSTR("Cellular"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel_diagnosticsStatus, 0, 4, 0);
  v13 = objc_claimAutoreleasedReturnValue();

  v61 = (void *)v13;
  v62 = (void *)v9;
  objc_msgSend(v7, "ps_addSpecifier:toGroup:", v13, v9);
  +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isConnectedOverWiFi");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "getDiagnosticsDetailsCode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDiagnosticsController set_diagCode:](self, "set_diagCode:", v16);

  if ((v15 & 1) != 0)
  {
    -[PSUICellularDiagnosticsController _diagCode](self, "_diagCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularDiagnosticsController getAppViewSpecifier:](self, "getAppViewSpecifier:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "getDiagnosticsStatusRecommendation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)v18;
      v22 = v3;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_RECOMMEND_RUN_DIAGNOSTICS"), &stru_24D5028C8, CFSTR("Cellular"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ %@"), v20, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v3 = v22;
      v26 = v21;
      v27 = (void *)v25;

      goto LABEL_11;
    }
    objc_msgSend(v8, "getDiagnosticsStatusRecommendation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "sf_isChinaRegionCellularDevice");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
      v32 = CFSTR("CELLULAR_DIAGNOSTICS_RECOMMEND_NO_WLAN");
    else
      v32 = CFSTR("CELLULAR_DIAGNOSTICS_RECOMMEND_NO_WIFI");
    objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_24D5028C8, CFSTR("Cellular"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = 0;
LABEL_11:
  -[PSUICellularDiagnosticsController getLogger](self, "getLogger");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = "No";
    v65 = "-[PSUICellularDiagnosticsController specifiers]";
    if (v15)
      v35 = "Yes";
    else
      v35 = "No";
    *(_DWORD *)buf = 136315650;
    v67 = v35;
    v66 = 2080;
    if (v26)
      v34 = "Yes";
    v68 = 2080;
    v69 = v34;
    _os_log_impl(&dword_2161C6000, v33, OS_LOG_TYPE_DEFAULT, "%s Wifi: %s, AppView: %s", buf, 0x20u);
  }

  v60 = v27;
  if (objc_msgSend(v8, "needToShowHelpLink"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_LEARN_MORE"), &stru_24D5028C8, CFSTR("Cellular"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "stringByAppendingString:", CFSTR(" "));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingString:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "setProperty:forKey:", v39, *MEMORY[0x24BE75A58]);
    v71.location = objc_msgSend(v39, "rangeOfString:", v37);
    NSStringFromRange(v71);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setProperty:forKey:", v40, *MEMORY[0x24BE75A40]);

    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setProperty:forKey:", v42, *MEMORY[0x24BE75A30]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setProperty:forKey:", v43, *MEMORY[0x24BE75A50]);

    objc_msgSend(v62, "setProperty:forKey:", CFSTR("learnMoreLinkTapped"), *MEMORY[0x24BE75A38]);
    if (!v26)
      goto LABEL_23;
    goto LABEL_22;
  }
  objc_msgSend(v62, "setProperty:forKey:", v27, *MEMORY[0x24BE75A68]);
  if (v26)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_DIAGNOSTICS_ACTION_GROUP"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v44);
    v45 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v46 = v7;
    v47 = v8;
    v48 = v3;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_RUN"), &stru_24D5028C8, CFSTR("Cellular"));
    v50 = v26;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v51, self, 0, 0, 0, 4, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v50;
    v3 = v48;
    v8 = v47;
    v7 = v46;
    objc_msgSend(v46, "ps_addSpecifier:toGroup:", v52, v44);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_APP_DESCRIPTION"), &stru_24D5028C8, CFSTR("Cellular"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setProperty:forKey:", v54, *MEMORY[0x24BE75A68]);

    objc_msgSend(v7, "ps_addSpecifier:toGroup:", v50, v44);
  }
LABEL_23:
  if (v7)
  {
    v55 = (objc_class *)objc_msgSend(v7, "copy");
    v56 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v55;

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDiagnosticsController setTitle:](self, "setTitle:", v58);

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

- (void)learnMoreLinkTapped
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  void (*v6)(__CFString *, id);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("OpenMoreLink");
  v17[0] = 0x24D508488;
  v17[1] = 0x24D5084A8;
  -[PSUICellularDiagnosticsController _diagCode](self, "_diagCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("com.apple.Preferences.TelephonyCellularDiagnostics");
  v5 = v3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v6 = (void (*)(__CFString *, id))_MergedGlobals_1;
  v16 = _MergedGlobals_1;
  if (!_MergedGlobals_1)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getAnalyticsSendEventSymbolLoc_block_invoke;
    v12[3] = &unk_24D5018D0;
    v12[4] = &v13;
    __getAnalyticsSendEventSymbolLoc_block_invoke((uint64_t)v12);
    v6 = (void (*)(__CFString *, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v6(v4, v5);

  v7 = (void *)*MEMORY[0x24BEBDF78];
  v8 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_LEARN_MORE_LINK"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:options:completionHandler:", v11, MEMORY[0x24BDBD1B8], 0);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDiagnostics"));
}

- (BOOL)_appLockupViewNotAvailable
{
  return self->__appLockupViewNotAvailable;
}

- (void)set_appLockupViewNotAvailable:(BOOL)a3
{
  self->__appLockupViewNotAvailable = a3;
}

- (NSNumber)_diagCode
{
  return (NSNumber *)objc_getProperty(self, a2, 1392, 1);
}

- (void)set_diagCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__diagCode, 0);
  objc_storeStrong((id *)&self->_appViewSpecifier, 0);
}

@end
