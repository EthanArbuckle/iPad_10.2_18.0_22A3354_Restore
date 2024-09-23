@implementation DBSColorScheduleController

- (DBSColorScheduleController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  DBSColorScheduleController *v8;
  CBClient *v9;
  CBClient *brightnessClient;
  void *v11;
  NSDateFormatter *v12;
  NSDateFormatter *timeFormatter;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DBSColorScheduleController;
  v8 = -[DBSColorScheduleController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = (CBClient *)objc_alloc_init(MEMORY[0x24BE1A2E0]);
    brightnessClient = v8->_brightnessClient;
    v8->_brightnessClient = v9;

    objc_initWeak(&location, v8);
    -[CBClient blueLightClient](v8->_brightnessClient, "blueLightClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __53__DBSColorScheduleController_initWithNibName_bundle___block_invoke;
    v18 = &unk_24F025D30;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v11, "setStatusNotificationBlock:", &v15);

    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    timeFormatter = v8->_timeFormatter;
    v8->_timeFormatter = v12;

    -[NSDateFormatter setTimeStyle:](v8->_timeFormatter, "setTimeStyle:", 1, v15, v16, v17, v18);
    -[NSDateFormatter setDateStyle:](v8->_timeFormatter, "setDateStyle:", 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __53__DBSColorScheduleController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleBlueLightStatusChanged:", a2);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatusNotificationBlock:", 0);

  v4.receiver = self;
  v4.super_class = (Class)DBSColorScheduleController;
  -[DBSColorScheduleController dealloc](&v4, sel_dealloc);
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)DBSColorScheduleController;
  -[DBSColorScheduleController viewDidAppear:](&v21, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display/BLUE_LIGHT_REDUCTION/SCHEDULE"));
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

    v15 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("SCHEDULE_TITLE"), 0, CFSTR("ColorSchedule"), v16, v18);

    v22[0] = v9;
    v22[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSColorScheduleController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v19, v20, v4);

  }
}

- (void)willResignActive
{
  id v2;

  -[DBSColorScheduleController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *radioGroup;
  PSSpecifier *v8;
  PSSpecifier **p_sunsetToSunriseRadioSpecifier;
  PSSpecifier *sunsetToSunriseRadioSpecifier;
  PSSpecifier *v11;
  PSSpecifier *scheduleRadioSpecifier;
  PSSpecifier *v13;
  PSSpecifier *timeGroup;
  void *v15;
  PSSpecifier *v16;
  void *v17;
  PSSpecifier *v18;
  void *v19;
  void *v20;
  PSSpecifier *v21;
  PSSpecifier *startTimePickerSpecifier;
  uint64_t v23;
  PSSpecifier *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PSSpecifier *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  PSSpecifier *v33;
  PSSpecifier *endTimePickerSpecifier;
  PSSpecifier *v35;
  void *v36;
  void *v37;
  PSSpecifier *v38;
  void *v39;
  void *v40;
  id v41;
  PSSpecifier *v43;
  uint64_t v44;
  _OWORD v45[2];
  uint64_t v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  -[DBSColorScheduleController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("ColorSchedule"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("SCHEDULE_GROUP"));
  v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  radioGroup = self->_radioGroup;
  self->_radioGroup = v6;

  if (!self->_radioGroup)
    -[DBSColorScheduleController specifiers].cold.1();
  objc_msgSend(v5, "specifierForID:", CFSTR("FROM_SUNSET_TO_SUNRISE"));
  v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  p_sunsetToSunriseRadioSpecifier = &self->_sunsetToSunriseRadioSpecifier;
  sunsetToSunriseRadioSpecifier = self->_sunsetToSunriseRadioSpecifier;
  self->_sunsetToSunriseRadioSpecifier = v8;

  if (!self->_sunsetToSunriseRadioSpecifier)
    -[DBSColorScheduleController specifiers].cold.2();
  objc_msgSend(v5, "specifierForID:", CFSTR("SCHEDULE"));
  v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  scheduleRadioSpecifier = self->_scheduleRadioSpecifier;
  self->_scheduleRadioSpecifier = v11;

  if (!self->_scheduleRadioSpecifier)
    -[DBSColorScheduleController specifiers].cold.3();
  objc_msgSend(v5, "specifierForID:", CFSTR("TIME_GROUP"));
  v13 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  timeGroup = self->_timeGroup;
  self->_timeGroup = v13;

  if (!self->_timeGroup)
    -[DBSColorScheduleController specifiers].cold.4();
  v46 = 0;
  memset(v45, 0, sizeof(v45));
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getBlueLightStatus:", v45);

  if (!BYTE2(v45[0]))
  {
    objc_msgSend(v5, "removeObject:", *p_sunsetToSunriseRadioSpecifier);
    objc_msgSend(v5, "removeObject:", self->_scheduleRadioSpecifier);
    objc_msgSend(v5, "removeObject:", self->_radioGroup);
    v16 = self->_timeGroup;
    DBS_LocalizedStringForColorSchedule(CFSTR("BLUE_LIGHT_REDUCTION_SCHEDULE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75D50]);

  }
  v44 = v3;
  if (DWORD1(v45[0]) != 1)
  {
    if (DWORD1(v45[0]) != 2)
    {
      v18 = 0;
      goto LABEL_13;
    }
    p_sunsetToSunriseRadioSpecifier = &self->_scheduleRadioSpecifier;
  }
  v18 = *p_sunsetToSunriseRadioSpecifier;
LABEL_13:
  v43 = v18;
  -[PSSpecifier setProperty:forKey:](self->_radioGroup, "setProperty:forKey:", v18, *MEMORY[0x24BE75C20]);
  self->_showingScheduleSpecifiers = DWORD1(v45[0]) == 2;
  v19 = (void *)MEMORY[0x24BE75590];
  DBS_LocalizedStringForColorSchedule(CFSTR("TURN_ON"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, 0, 4, 0);
  v21 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  startTimePickerSpecifier = self->_startTimePickerSpecifier;
  self->_startTimePickerSpecifier = v21;

  v23 = *MEMORY[0x24BE759D8];
  -[PSSpecifier setProperty:forKey:](self->_startTimePickerSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759D8]);
  -[PSSpecifier setIdentifier:](self->_startTimePickerSpecifier, "setIdentifier:", CFSTR("STARTS"));
  v24 = self->_startTimePickerSpecifier;
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BE75D10];
  -[PSSpecifier setProperty:forKey:](v24, "setProperty:forKey:", v26, *MEMORY[0x24BE75D10]);

  v28 = self->_startTimePickerSpecifier;
  v29 = objc_opt_class();
  v30 = *MEMORY[0x24BE75948];
  -[PSSpecifier setProperty:forKey:](v28, "setProperty:forKey:", v29, *MEMORY[0x24BE75948]);
  v31 = (void *)MEMORY[0x24BE75590];
  DBS_LocalizedStringForColorSchedule(CFSTR("TURN_OFF"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, self, 0, 0, 0, 4, 0);
  v33 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  endTimePickerSpecifier = self->_endTimePickerSpecifier;
  self->_endTimePickerSpecifier = v33;

  -[PSSpecifier setProperty:forKey:](self->_endTimePickerSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v23);
  -[PSSpecifier setIdentifier:](self->_endTimePickerSpecifier, "setIdentifier:", CFSTR("ENDS"));
  v35 = self->_endTimePickerSpecifier;
  v36 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v35, "setProperty:forKey:", v37, v27);

  -[PSSpecifier setProperty:forKey:](self->_endTimePickerSpecifier, "setProperty:forKey:", objc_opt_class(), v30);
  if (self->_showingScheduleSpecifiers)
  {
    v38 = self->_endTimePickerSpecifier;
    v47[0] = self->_startTimePickerSpecifier;
    v47[1] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v39);

  }
  v40 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v44) = (Class)v5;
  v41 = v5;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
  return v4;
}

- (void)showScheduleSpecifiers:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  PSSpecifier *endTimePickerSpecifier;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (self->_showingScheduleSpecifiers != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_showingScheduleSpecifiers = a3;
    endTimePickerSpecifier = self->_endTimePickerSpecifier;
    v9[0] = self->_startTimePickerSpecifier;
    v9[1] = endTimePickerSpecifier;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[DBSColorScheduleController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v8, -[DBSColorScheduleController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("TIME_GROUP")) + 1, v4);
    else
      -[DBSColorScheduleController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v8, v4);

  }
}

- (id)startTime
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];
  uint64_t v11;

  v11 = 0;
  memset(v10, 0, sizeof(v10));
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getBlueLightStatus:", v10);

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setHour:", SDWORD2(v10[0]));
  objc_msgSend(v4, "setMinute:", SHIDWORD(v10[0]));
  v5 = objc_alloc(MEMORY[0x24BDBCE48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v6, "dateFromComponents:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)endTime
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v11 = 0u;
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getBlueLightStatus:", &v10);

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setHour:", (int)v11);
  objc_msgSend(v4, "setMinute:", SDWORD1(v11));
  v5 = objc_alloc(MEMORY[0x24BDBCE48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v6, "dateFromComponents:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int)blueLightMode
{
  void *v2;
  __int128 v4;

  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBlueLightStatus:", &v4);

  return DWORD1(v4);
}

- (void)handleBlueLightStatusChanged:(id *)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__DBSColorScheduleController_handleBlueLightStatusChanged___block_invoke;
  block[3] = &unk_24F025E70;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__DBSColorScheduleController_handleBlueLightStatusChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  CBClient *brightnessClient;
  id v8;
  void *v9;
  uint64_t v10;
  PSSpecifier *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v17;
  _OWORD v18[2];
  uint64_t v19;

  v6 = a4;
  brightnessClient = self->_brightnessClient;
  v8 = a3;
  -[CBClient blueLightClient](brightnessClient, "blueLightClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suspendNotifications:", 1);

  v10 = -[DBSColorScheduleController indexForIndexPath:](self, "indexForIndexPath:", v6);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v10);
    v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  }
  if (v11 == self->_sunsetToSunriseRadioSpecifier)
  {
    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
    goto LABEL_8;
  }
  if (v11 == self->_scheduleRadioSpecifier)
  {
    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 2;
LABEL_8:
    objc_msgSend(v12, "setMode:", v14);

  }
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getBlueLightStatus:", v18);

  -[DBSColorScheduleController showScheduleSpecifiers:animated:](self, "showScheduleSpecifiers:animated:", DWORD1(v18[0]) == 2, 1);
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "suspendNotifications:", 0);

  v17.receiver = self;
  v17.super_class = (Class)DBSColorScheduleController;
  -[DBSColorScheduleController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v8, v6);

}

- (void)datePickerChanged:(id)a3
{
  id v4;
  void *v5;
  UIDatePicker *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  _DWORD *v13;
  void *v14;
  void *v15;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;

  v4 = a3;
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspendNotifications:", 1);

  v6 = (UIDatePicker *)v4;
  -[UIDatePicker calendar](v6, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker date](v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 96, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "hour");
  v11 = objc_msgSend(v9, "minute");
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getBlueLightStatus:", v17);

  v16 = *(_OWORD *)((char *)v17 + 8);
  if (self->_startTimePicker == v6)
  {
    LODWORD(v16) = v10;
    v13 = (_DWORD *)&v16 + 1;
    goto LABEL_5;
  }
  if (self->_endTimePicker == v6)
  {
    DWORD2(v16) = v10;
    v13 = (_DWORD *)((unint64_t)&v16 | 0xC);
LABEL_5:
    *v13 = v11;
  }
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSchedule:", &v16);

  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "suspendNotifications:", 0);

}

- (id)datePickerForSpecifier:(id)a3
{
  PSSpecifier *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int *v9;
  int *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = (PSSpecifier *)a3;
  v5 = objc_alloc(MEMORY[0x24BEBD520]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "setDatePickerMode:", 0);
  objc_msgSend(v6, "setPreferredDatePickerStyle:", 3);
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getBlueLightStatus:", &v16);

  if (self->_startTimePickerSpecifier == v4)
  {
    v8 = DWORD2(v16);
    v9 = (int *)((unint64_t)&v16 | 0xC);
    v10 = &OBJC_IVAR___DBSColorScheduleController__startTimePicker;
  }
  else
  {
    if (self->_endTimePickerSpecifier != v4)
      -[DBSColorScheduleController datePickerForSpecifier:].cold.1();
    v8 = v17;
    v9 = (int *)&v17 + 1;
    v10 = &OBJC_IVAR___DBSColorScheduleController__endTimePicker;
  }
  v11 = *v9;
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + *v10), v6);
  v12 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v12, "setHour:", v8);
  objc_msgSend(v12, "setMinute:", v11);
  objc_msgSend(v6, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFromComponents:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v14);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimePicker, 0);
  objc_storeStrong((id *)&self->_startTimePicker, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_endTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeGroup, 0);
  objc_storeStrong((id *)&self->_scheduleRadioSpecifier, 0);
  objc_storeStrong((id *)&self->_sunsetToSunriseRadioSpecifier, 0);
  objc_storeStrong((id *)&self->_radioGroup, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

- (void)specifiers
{
  __assert_rtn("-[DBSColorScheduleController specifiers]", "DBSColorScheduleController.m", 112, "_timeGroup");
}

- (void)datePickerForSpecifier:.cold.1()
{
  NSObject *v0;
  uint8_t v1[16];

  DBSLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_227A37000, v0, OS_LOG_TYPE_DEFAULT, "Trying to get date picker for invalid specifier.", v1, 2u);
  }

  __assert_rtn("-[DBSColorScheduleController datePickerForSpecifier:]", "DBSColorScheduleController.m", 288, "0");
}

@end
