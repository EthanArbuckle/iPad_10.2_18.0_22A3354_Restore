@implementation DBSBrightnessManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  return (id)defaultManager_defaultManager;
}

void __38__DBSBrightnessManager_defaultManager__block_invoke()
{
  DBSBrightnessManager *v0;
  void *v1;

  v0 = objc_alloc_init(DBSBrightnessManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

- (DBSBrightnessManager)init
{
  DBSBrightnessManager *v2;
  void *v3;
  CBClient *v4;
  CBClient *brightnessClient;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DBSBrightnessManager;
  v2 = -[DBSBrightnessManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_handleBrightnessChangedExternallyNotification_, *MEMORY[0x24BEBE718], 0);

    v4 = (CBClient *)objc_alloc_init(MEMORY[0x24BE1A2E0]);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[DBSBrightnessManager _cleanupTransactionRef](self, "_cleanupTransactionRef");
  v3.receiver = self;
  v3.super_class = (Class)DBSBrightnessManager;
  -[DBSBrightnessManager dealloc](&v3, sel_dealloc);
}

+ (BOOL)specifiersPresentIn:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "specifierForID:", CFSTR("BRIGHTNESS_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)removeSpecifiersFrom:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierForID:", CFSTR("BRIGHTNESS_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(v7, "specifierForID:", CFSTR("BRIGHTNESS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v7, "specifierForID:", CFSTR("WHITE_BALANCE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v7, "removeContiguousSpecifiers:animated:", v3, 1);

}

- (id)mainDisplayBrightnessSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  -[DBSBrightnessManager specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BRIGHTNESS_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForConnectedDisplays(CFSTR("BRIGHTNESS_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v6);

    objc_msgSend(MEMORY[0x24BE75498], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE75890];
    v9 = objc_msgSend(v7, "capabilityBoolAnswer:", *MEMORY[0x24BE75890]);

    if (v9)
    {
      DBS_LocalizedStringForDisplays(CFSTR("WHITE_BALANCE_FOOTER"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);

    }
    objc_msgSend(v4, "addObject:", v5);
    -[DBSBrightnessManager _generateMainBrightnessSpecifier](self, "_generateMainBrightnessSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);
    objc_msgSend(MEMORY[0x24BE75498], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "capabilityBoolAnswer:", v8);

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BE75590];
      DBS_LocalizedStringForDisplays(CFSTR("WHITE_BALANCE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, sel_setAutoWhiteBalanceEnabled_forSpecifier_, sel_getAutoWhiteBalanceEnabled_, 0, 6, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("WHITE_BALANCE"), *MEMORY[0x24BE75AC0]);
      objc_msgSend(v4, "addObject:", v16);

    }
    -[DBSBrightnessManager setSpecifiers:](self, "setSpecifiers:", v4);

  }
  return -[DBSBrightnessManager specifiers](self, "specifiers");
}

- (id)_generateMainBrightnessSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setBacklightValue_specifier_, sel_backlightValue_, 0, 5, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24F02FB58, *MEMORY[0x24BE759B0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24F02FB68, *MEMORY[0x24BE759A8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24F02FB78, *MEMORY[0x24BE759E0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C80]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("BRIGHTNESS"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(MEMORY[0x24BEBD640], "dbs_minSliderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75C90]);

  objc_msgSend(MEMORY[0x24BEBD640], "dbs_maxSliderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75CA0]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75CB8]);
  return v2;
}

- (void)_cleanupTransactionRef
{
  if (gTransactionRef)
  {
    CFRelease((CFTypeRef)gTransactionRef);
    gTransactionRef = 0;
  }
}

- (id)backlightValue:(id)a3
{
  void *v3;
  float v4;

  v3 = (void *)MEMORY[0x24BDD16E0];
  BKSDisplayBrightnessGetCurrent();
  return (id)objc_msgSend(v3, "numberWithDouble:", v4);
}

- (void)setBacklightValue:(id)a3 specifier:(id)a4
{
  id v6;
  char v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "floatValue");
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v8, "isTracking");
  if (gTransactionRef || (gTransactionRef = BKSDisplayBrightnessTransactionCreate()) != 0)
    BKSDisplayBrightnessSet();
  if ((v7 & 1) == 0)
    -[DBSBrightnessManager _cleanupTransactionRef](self, "_cleanupTransactionRef");

}

- (void)brightnessChangedExternally
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[DBSBrightnessManager specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", CFSTR("BRIGHTNESS"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BE75D18];
  objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "control");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isTracking") & 1) == 0 && !gTransactionRef && v9)
  {
    -[DBSBrightnessManager backlightValue:](self, "backlightValue:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:", v7);
    objc_msgSend(v8, "layoutSubviews");

  }
}

- (id)getAutoWhiteBalanceEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[DBSBrightnessManager brightnessClient](self, "brightnessClient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adaptationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "getEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAutoWhiteBalanceEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  char v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke;
  v15[3] = &unk_24F025D80;
  objc_copyWeak(&v16, &location);
  v17 = v8;
  v10 = (void (**)(_QWORD))MEMORY[0x22E2A2908](v15);
  if (v8 && _AXSScreenFilterApplied())
  {
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_2;
    v13[3] = &unk_24F025EC8;
    v14 = v10;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_3;
    v11[3] = &unk_24F025DA8;
    v11[4] = self;
    v12 = v7;
    -[DBSBrightnessManager showAlertToDisableAccessibilityFilters:cancel:](self, "showAlertToDisableAccessibilityFilters:cancel:", v13, v11);

  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "brightnessClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adaptationClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifier:", *(_QWORD *)(a1 + 40));

}

- (void)showAlertToDisableAccessibilityFilters:(id)a3 cancel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BEBD3B0];
  DBS_LocalizedStringForDisplays(CFSTR("DISABLE_AX_FILTERS_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DBS_LocalizedStringForDisplays(CFSTR("DISABLE_AX_FILTERS_MESSAGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  DBS_LocalizedStringForDisplays(CFSTR("DISABLE_AX_FILTERS_ENABLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke;
  v27[3] = &unk_24F025DD0;
  v28 = v6;
  v15 = v6;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BEBD3A8];
  DBS_LocalizedStringForDisplays(CFSTR("DISABLE_AX_FILTERS_CANCEL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14;
  v23 = 3221225472;
  v24 = __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke_2;
  v25 = &unk_24F025DD0;
  v26 = v7;
  v19 = v7;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, &v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v20, v22, v23, v24, v25);

  -[DBSBrightnessManager delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke(uint64_t a1)
{
  _AXSDisableScreenFilters();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CBClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessClient, a3);
}

- (PSListController)delegate
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_specifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end
