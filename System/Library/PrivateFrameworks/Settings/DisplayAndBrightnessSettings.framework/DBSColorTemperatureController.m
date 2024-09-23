@implementation DBSColorTemperatureController

- (DBSColorTemperatureController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  DBSColorTemperatureController *v8;
  CBClient *v9;
  CBClient *brightnessClient;
  void *v11;
  void *v12;
  NSDateFormatter *v13;
  NSDateFormatter *timeFormatter;
  void *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DBSColorTemperatureController;
  v8 = -[DBSColorTemperatureController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = (CBClient *)objc_alloc_init(MEMORY[0x24BE1A2E0]);
    brightnessClient = v8->__brightnessClient;
    v8->__brightnessClient = v9;

    objc_initWeak(&location, v8);
    -[DBSColorTemperatureController _brightnessClient](v8, "_brightnessClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "blueLightClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __56__DBSColorTemperatureController_initWithNibName_bundle___block_invoke;
    v21 = &unk_24F025D30;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v12, "setStatusNotificationBlock:", &v18);

    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    timeFormatter = v8->_timeFormatter;
    v8->_timeFormatter = v13;

    -[NSDateFormatter setTimeStyle:](v8->_timeFormatter, "setTimeStyle:", 1, v18, v19, v20, v21);
    -[NSDateFormatter setDateStyle:](v8->_timeFormatter, "setDateStyle:", 0);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "sf_isInternalInstall"))
      v16 = CFPreferencesGetAppBooleanValue(CFSTR("kShowColorTemperature"), CFSTR("com.apple.Preferences"), 0) != 0;
    else
      v16 = 0;
    v8->_showColorTemperature = v16;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __56__DBSColorTemperatureController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleBlueLightStatusChanged:", a2);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blueLightClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusNotificationBlock:", 0);

  -[NSTimer invalidate](self->_blueLightReductionLabelRefreshTimer, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)DBSColorTemperatureController;
  -[DBSColorTemperatureController dealloc](&v5, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)DBSColorTemperatureController;
  -[DBSColorTemperatureController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display/BLUE_LIGHT_REDUCTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("DISPLAY_AND_BRIGHTNESS"), 0, CFSTR("Display"), v6, v8);

    v10 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("BLUE_LIGHT_REDUCTION"), 0, CFSTR("Display"), v11, v13);

    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSColorTemperatureController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v14, v15, v4);

  }
}

- (id)specifiers
{
  uint64_t v3;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v26[2];
  uint64_t v27;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    self->_showingScheduleRange = 0;
    -[DBSColorTemperatureController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("ColorTemperature"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("BLUE_LIGHT_REDUCTION_COLOR_TEMP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSColorTemperatureController set_temperatureSlider:](self, "set_temperatureSlider:", v6);

    -[DBSColorTemperatureController _temperatureSlider](self, "_temperatureSlider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      -[DBSColorTemperatureController specifiers].cold.1();

    objc_msgSend(v5, "specifierForID:", CFSTR("SCHEDULED"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSColorTemperatureController set_scheduleSwitchSpecifier:](self, "set_scheduleSwitchSpecifier:", v8);

    -[DBSColorTemperatureController _scheduleSwitchSpecifier](self, "_scheduleSwitchSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      -[DBSColorTemperatureController specifiers].cold.2();

    objc_msgSend(v5, "specifierForID:", CFSTR("MANUAL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSColorTemperatureController set_manualSwitchSpecifier:](self, "set_manualSwitchSpecifier:", v10);

    -[DBSColorTemperatureController _manualSwitchSpecifier](self, "_manualSwitchSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      -[DBSColorTemperatureController specifiers].cold.3();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F026548, self, 0, 0, objc_opt_class(), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSColorTemperatureController set_scheduleRangeSpecifier:](self, "set_scheduleRangeSpecifier:", v12);

    -[DBSColorTemperatureController _scheduleRangeSpecifier](self, "_scheduleRangeSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIdentifier:", CFSTR("SCHEDULE_RANGE"));

    -[DBSColorTemperatureController _scheduleRangeSpecifier](self, "_scheduleRangeSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);

    objc_msgSend(v5, "specifierForID:", CFSTR("COLOR_TEMPERATURE"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      -[DBSColorTemperatureController specifiers].cold.4();
    v16 = (void *)v15;
    -[DBSColorTemperatureController blueLightReductionFooter](self, "blueLightReductionFooter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);

    v27 = 0;
    memset(v26, 0, sizeof(v26));
    -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "blueLightClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "getBlueLightStatus:", v26);

    if ((v20 & 1) == 0)
      -[DBSColorTemperatureController specifiers].cold.5();
    v21 = DWORD1(v26[0]);
    self->_showingScheduleRange = DWORD1(v26[0]) != 0;
    -[DBSColorTemperatureController _scheduleRangeSpecifier](self, "_scheduleRangeSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[DBSColorTemperatureController _scheduleSwitchSpecifier](self, "_scheduleSwitchSpecifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ps_insertObject:afterObject:", v22, v23);

    }
    else
    {
      objc_msgSend(v5, "removeObject:", v22);
    }

    v24 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_printBlueLightStatus:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 var0;
  NSObject *v7;
  _BOOL4 var1;
  NSObject *v9;
  int var3;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  _BOOL4 var2;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    DBSLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_227A37000, v4, OS_LOG_TYPE_DEFAULT, "\\[T]/ STATUS:", (uint8_t *)&v18, 2u);
    }

    DBSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      v18 = 67109120;
      v19 = var0;
      _os_log_impl(&dword_227A37000, v5, OS_LOG_TYPE_DEFAULT, "Active: %d\n", (uint8_t *)&v18, 8u);
    }

    DBSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      var1 = a3->var1;
      v18 = 67109120;
      v19 = var1;
      _os_log_impl(&dword_227A37000, v7, OS_LOG_TYPE_DEFAULT, "Enabled: %d\n", (uint8_t *)&v18, 8u);
    }

    DBSLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      var3 = a3->var3;
      v18 = 67109120;
      v19 = var3;
      _os_log_impl(&dword_227A37000, v9, OS_LOG_TYPE_DEFAULT, "Mode: %d\n", (uint8_t *)&v18, 8u);
    }

    DBSLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a3->var4.var0.var0;
      v13 = a3->var4.var0.var1;
      v14 = a3->var4.var1.var0;
      v15 = a3->var4.var1.var1;
      v18 = 67109888;
      v19 = v12;
      v20 = 1024;
      v21 = v13;
      v22 = 1024;
      v23 = v14;
      v24 = 1024;
      v25 = v15;
      _os_log_impl(&dword_227A37000, v11, OS_LOG_TYPE_DEFAULT, "Schedule: From %02d:%02d to %02d:%02d\n", (uint8_t *)&v18, 0x1Au);
    }

    DBSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      var2 = a3->var2;
      v18 = 67109120;
      v19 = var2;
      _os_log_impl(&dword_227A37000, v16, OS_LOG_TYPE_DEFAULT, "Sunrise/sunset allowed: %d\n\n", (uint8_t *)&v18, 8u);
    }

  }
}

- (void)showScheduleRange:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  id v8;

  if (self->_showingScheduleRange != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_showingScheduleRange = a3;
    -[DBSColorTemperatureController _scheduleRangeSpecifier](self, "_scheduleRangeSpecifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[DBSColorTemperatureController _scheduleSwitchSpecifier](self, "_scheduleSwitchSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DBSColorTemperatureController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v8, v7, v4);

    }
    else
    {
      -[DBSColorTemperatureController removeSpecifier:animated:](self, "removeSpecifier:animated:", v8, v4);
    }

  }
}

- (void)handleBlueLightStatusChanged:(id *)a3
{
  _QWORD block[4];
  id v5[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke;
  block[3] = &unk_24F025D58;
  objc_copyWeak(v5, &location);
  v5[1] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_brightnessClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blueLightClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getBlueLightStatus:", *(_QWORD *)(a1 + 40));

  if ((v4 & 1) == 0)
    __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke_cold_1();
  objc_msgSend(WeakRetained, "_printBlueLightStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "_scheduleSwitchSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v5, 1);

  objc_msgSend(WeakRetained, "_scheduleRangeSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v6, 1);

  objc_msgSend(WeakRetained, "_manualSwitchSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v7, 1);

  objc_msgSend(WeakRetained, "showScheduleRange:animated:", *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4) != 0, 1);
}

- (id)getBlueLightReductionEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v10;

  v4 = a3;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient", 0, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getBlueLightStatus:", &v10);

  -[DBSColorTemperatureController _printBlueLightStatus:](self, "_printBlueLightStatus:", &v10);
  if (!v7)
    -[DBSColorTemperatureController getBlueLightReductionEnabled:].cold.1();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", BYTE1(v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setBlueLightReductionEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke;
  v13[3] = &unk_24F025D80;
  objc_copyWeak(&v14, &location);
  v15 = v8;
  v10 = (void (**)(_QWORD))MEMORY[0x22E2A2908](v13);
  if (v8 && _AXSScreenFilterApplied())
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke_2;
    v11[3] = &unk_24F025DA8;
    v11[4] = self;
    v12 = v7;
    -[DBSColorTemperatureController showAlertToDisableAccessibilityFiltersForBlueLightReduction:cancel:](self, "showAlertToDisableAccessibilityFiltersForBlueLightReduction:cancel:", v10, v11);

  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_brightnessClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blueLightClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

- (id)getBlueLightReductionScheduleEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  __int128 v10;

  v4 = a3;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient", 0, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getBlueLightStatus:", &v10);

  if ((v7 & 1) == 0)
    -[DBSColorTemperatureController getBlueLightReductionScheduleEnabled:].cold.1();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", DWORD1(v10) != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setBlueLightReductionSchedule:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke;
  v13[3] = &unk_24F025D80;
  objc_copyWeak(&v14, &location);
  v15 = v8;
  v10 = (void (**)(_QWORD))MEMORY[0x22E2A2908](v13);
  if (v8 && _AXSScreenFilterApplied())
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke_2;
    v11[3] = &unk_24F025DA8;
    v11[4] = self;
    v12 = v7;
    -[DBSColorTemperatureController showAlertToDisableAccessibilityFiltersForBlueLightReduction:cancel:](self, "showAlertToDisableAccessibilityFiltersForBlueLightReduction:cancel:", v10, v11);

  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_brightnessClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blueLightClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMode:", 2 * *(unsigned __int8 *)(a1 + 40));

  objc_msgSend(WeakRetained, "showScheduleRange:animated:", *(unsigned __int8 *)(a1 + 40), 1);
  objc_msgSend(WeakRetained, "_manualSwitchSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v4, 1);

}

uint64_t __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void)showAlertToDisableAccessibilityFiltersForBlueLightReduction:(id)a3 cancel:(id)a4
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
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BEBD3B0];
  DBS_LocalizedStringForColorTemperature(CFSTR("DISABLE_AX_FILTERS_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DBS_LocalizedStringForColorTemperature(CFSTR("DISABLE_AX_FILTERS_MESSAGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  DBS_LocalizedStringForColorTemperature(CFSTR("DISABLE_AX_FILTERS_ENABLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke;
  v26[3] = &unk_24F025DD0;
  v27 = v6;
  v15 = v6;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BEBD3A8];
  DBS_LocalizedStringForColorTemperature(CFSTR("DISABLE_AX_FILTERS_CANCEL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  v22 = 3221225472;
  v23 = __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke_2;
  v24 = &unk_24F025DD0;
  v25 = v7;
  v19 = v7;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, &v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v20, v21, v22, v23, v24);

  -[DBSColorTemperatureController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke(uint64_t a1)
{
  _AXSDisableScreenFilters();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)temperatureStrength:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  int v11;

  v4 = a3;
  v11 = 0;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getStrength:", &v11);

  if ((v7 & 1) == 0)
    -[DBSColorTemperatureController temperatureStrength:].cold.1();
  LODWORD(v8) = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setTemperatureStrength:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  char v17;
  _BOOL4 temperatureSliderWasTracking;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  char v23;
  NSTimer *v24;
  NSTimer *blueLightReductionLabelRefreshTimer;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v9 = v8;
  v10 = objc_msgSend(v7, "isTracking");
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "blueLightClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v12, "suspendNotifications:", 1);

    -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "blueLightClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = v9;
    v17 = objc_msgSend(v15, "setStrength:commit:", 0, v16);
  }
  else
  {
    objc_msgSend(v12, "suspendNotifications:", 0);

    temperatureSliderWasTracking = self->_temperatureSliderWasTracking;
    -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "blueLightClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (temperatureSliderWasTracking)
    {
      LODWORD(v21) = 1.0;
      LODWORD(v20) = v9;
      v22 = 1;
    }
    else
    {
      LODWORD(v21) = 1045220557;
      LODWORD(v20) = v9;
      v22 = 0;
    }
    v17 = objc_msgSend(v19, "setStrength:withPeriod:commit:", v22, v20, v21);
  }
  v23 = v17;

  -[NSTimer invalidate](self->_blueLightReductionLabelRefreshTimer, "invalidate");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_colorTemperatureSliderDidChange, 0, 0, 0.2);
  v24 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  blueLightReductionLabelRefreshTimer = self->_blueLightReductionLabelRefreshTimer;
  self->_blueLightReductionLabelRefreshTimer = v24;

  if ((v23 & 1) == 0)
    -[DBSColorTemperatureController setTemperatureStrength:specifier:].cold.1();
  self->_temperatureSliderWasTracking = v10;

}

- (void)colorTemperatureSliderDidChange
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  -[DBSColorTemperatureController _temperatureSlider](self, "_temperatureSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v6 = v5;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blueLightClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  LODWORD(v10) = v6;
  objc_msgSend(v8, "setStrength:withPeriod:commit:", 1, v10, v9);

  -[DBSColorTemperatureController specifierForID:](self, "specifierForID:", CFSTR("COLOR_TEMPERATURE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE75A68];
  objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75A68]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSColorTemperatureController blueLightReductionFooter](self, "blueLightReductionFooter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) == 0)
  {
    objc_msgSend(v11, "setProperty:forKey:", v14, v12);
    v17 = 0;
    v18 = 0;
    -[DBSColorTemperatureController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v18, &v17, v11);
    -[DBSColorTemperatureController table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_reloadSectionHeaderFooters:withRowAnimation:", v16, 0);

  }
}

- (id)blueLightReductionFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  float v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  float v16;
  int v17;
  float v18;

  v18 = 0.0;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blueLightClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getStrength:", &v18);

  v17 = 1056964608;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getWarningStrength:", &v17);

  if (v7)
  {
    v8 = *(float *)&v17;
  }
  else
  {
    v17 = 1056964608;
    v8 = 0.5;
  }
  if (v18 <= v8)
  {
    v9 = &stru_24F026548;
  }
  else
  {
    DBS_LocalizedStringForColorTemperature(CFSTR("COLOR_TEMPERATURE_MOTION_WARNING"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_showColorTemperature)
  {
    v16 = 0.0;
    -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blueLightClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getCCT:", &v16);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INTERNAL ONLY:\nWhen Night Shift is enabled, your display's white point is %.0fK."), v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v9, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v9, v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v14 = v13;

    v9 = v14;
  }
  return v9;
}

- (id)localizedTimeForTime:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setHour:", a3.var0);
  objc_msgSend(v5, "setMinute:", *(uint64_t *)&a3 >> 32);
  v6 = objc_alloc(MEMORY[0x24BDBCE48]);
  v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v7, "dateFromComponents:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fromDetailForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  _OWORD v11[2];
  uint64_t v12;

  v4 = a3;
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getBlueLightStatus:", v11);

  if ((v7 & 1) == 0)
    -[DBSColorTemperatureController fromDetailForCell:].cold.1();
  if (!DWORD1(v11[0]) || DWORD1(v11[0]) == 2)
  {
    -[DBSColorTemperatureController localizedTimeForTime:](self, "localizedTimeForTime:", *((_QWORD *)&v11[0] + 1));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (DWORD1(v11[0]) != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    DBS_LocalizedStringForColorTemperature(CFSTR("SUNSET"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

- (id)toDetailForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v4 = a3;
  v13 = 0;
  v12 = 0u;
  -[DBSColorTemperatureController _brightnessClient](self, "_brightnessClient", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blueLightClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getBlueLightStatus:", &v11);

  if ((v7 & 1) == 0)
    -[DBSColorTemperatureController toDetailForCell:].cold.1();
  if (!DWORD1(v11) || DWORD1(v11) == 2)
  {
    -[DBSColorTemperatureController localizedTimeForTime:](self, "localizedTimeForTime:", (_QWORD)v12);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (DWORD1(v11) != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    DBS_LocalizedStringForColorTemperature(CFSTR("SUNRISE"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

- (CBClient)_brightnessClient
{
  return self->__brightnessClient;
}

- (void)set_brightnessClient:(id)a3
{
  objc_storeStrong((id *)&self->__brightnessClient, a3);
}

- (PSSpecifier)_scheduleRangeSpecifier
{
  return self->__scheduleRangeSpecifier;
}

- (void)set_scheduleRangeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__scheduleRangeSpecifier, a3);
}

- (PSSpecifier)_scheduleSwitchSpecifier
{
  return self->__scheduleSwitchSpecifier;
}

- (void)set_scheduleSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__scheduleSwitchSpecifier, a3);
}

- (PSSpecifier)_manualSwitchSpecifier
{
  return self->__manualSwitchSpecifier;
}

- (void)set_manualSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__manualSwitchSpecifier, a3);
}

- (PSSpecifier)_temperatureSlider
{
  return self->__temperatureSlider;
}

- (void)set_temperatureSlider:(id)a3
{
  objc_storeStrong((id *)&self->__temperatureSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__temperatureSlider, 0);
  objc_storeStrong((id *)&self->__manualSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->__scheduleSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->__scheduleRangeSpecifier, 0);
  objc_storeStrong((id *)&self->__brightnessClient, 0);
  objc_storeStrong((id *)&self->_blueLightReductionLabelRefreshTimer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

- (void)specifiers
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController specifiers]", "DBSColorTemperatureController.m", 128, "0");
}

void __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke_cold_1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController handleBlueLightStatusChanged:]_block_invoke", "DBSColorTemperatureController.m", 177, "0");
}

- (void)getBlueLightReductionEnabled:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController getBlueLightReductionEnabled:]", "DBSColorTemperatureController.m", 199, "0");
}

- (void)getBlueLightReductionScheduleEnabled:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController getBlueLightReductionScheduleEnabled:]", "DBSColorTemperatureController.m", 228, "0");
}

- (void)temperatureStrength:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "BLR strength could not be queried.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController temperatureStrength:]", "DBSColorTemperatureController.m", 284, "0");
}

- (void)setTemperatureStrength:specifier:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "BLR strength could not be set.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController setTemperatureStrength:specifier:]", "DBSColorTemperatureController.m", 316, "0");
}

- (void)fromDetailForCell:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController fromDetailForCell:]", "DBSColorTemperatureController.m", 391, "0");
}

- (void)toDetailForCell:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DBSLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1(v1))
    OUTLINED_FUNCTION_0(&dword_227A37000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);

  __assert_rtn("-[DBSColorTemperatureController toDetailForCell:]", "DBSColorTemperatureController.m", 416, "0");
}

@end
