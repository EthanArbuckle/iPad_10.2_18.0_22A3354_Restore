@implementation DBSDeviceAppearanceScheduleController

- (DBSDeviceAppearanceScheduleController)initWithNibName:(id)a3 bundle:(id)a4
{
  DBSDeviceAppearanceScheduleController *v4;
  NSDateFormatter *v5;
  NSDateFormatter *timeFormatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DBSDeviceAppearanceScheduleController;
  v4 = -[DBSDeviceAppearanceScheduleController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    timeFormatter = v4->__timeFormatter;
    v4->__timeFormatter = v5;

    -[NSDateFormatter setTimeStyle:](v4->__timeFormatter, "setTimeStyle:", 1);
    -[NSDateFormatter setDateStyle:](v4->__timeFormatter, "setDateStyle:", 0);
  }
  return v4;
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
  v16.super_class = (Class)DBSDeviceAppearanceScheduleController;
  -[DBSDeviceAppearanceScheduleController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display/APPEARANCE_OPTIONS"));
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
    v14 = (void *)objc_msgSend(v10, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("APPEARANCE_SCHEDULE"), 0, CFSTR("DeviceAppearanceSchedule"), v11, v13);

    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v14, v15, v4);

  }
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSDeviceAppearanceScheduleController;
  v4 = a3;
  -[DBSDeviceAppearanceScheduleController setSpecifier:](&v6, sel_setSpecifier_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", DBSStyleModeKey[0], v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSDeviceAppearanceScheduleController set_styleMode:](self, "set_styleMode:", v5);
}

- (void)willResignActive
{
  id v2;

  -[DBSDeviceAppearanceScheduleController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

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
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[DBSDeviceAppearanceScheduleController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("DeviceAppearanceSchedule"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("APPEARANCE_SCHEDULE_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForDeviceAppearance(CFSTR("APPEARANCE_SCHEDULE_FOOTER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v6;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "specifierForID:", CFSTR("SCHEDULE_GROUP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController set_radioGroup:](self, "set_radioGroup:", v8);

    objc_msgSend(v5, "specifierForID:", CFSTR("TIME_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController set_timeGroup:](self, "set_timeGroup:", v9);

    objc_msgSend(v5, "specifierForID:", CFSTR("FROM_SUNSET_TO_SUNRISE"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("SCHEDULE"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "suggestedAutomaticModeValue");

    v46 = (void *)v11;
    v47 = (void *)v10;
    if (v13 == 100)
      v14 = (void *)v10;
    else
      v14 = (void *)v11;
    v15 = v14;
    -[DBSDeviceAppearanceScheduleController _radioGroup](self, "_radioGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v15;
    objc_msgSend(v16, "setProperty:forKey:", v15, *MEMORY[0x24BE75C20]);

    -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController set_showingScheduleSpecifiers:](self, "set_showingScheduleSpecifiers:", objc_msgSend(v17, "modeValue") == 102);

    v18 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForDeviceAppearance(CFSTR("LIGHT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, 0, 4, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController set_lightAppearanceTimePickerSpecifier:](self, "set_lightAppearanceTimePickerSpecifier:", v20);

    -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE759D8];
    objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759D8]);

    -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIdentifier:", CFSTR("STARTS"));

    -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BE75D10];
    objc_msgSend(v24, "setProperty:forKey:", v26, *MEMORY[0x24BE75D10]);

    -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_class();
    v30 = *MEMORY[0x24BE75948];
    objc_msgSend(v28, "setProperty:forKey:", v29, *MEMORY[0x24BE75948]);

    v31 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForDeviceAppearance(CFSTR("DARK"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, self, 0, 0, 0, 4, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceAppearanceScheduleController set_darkAppearanceTimePickerSpecifier:](self, "set_darkAppearanceTimePickerSpecifier:", v33);

    -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v22);

    -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setIdentifier:", CFSTR("ENDS"));

    -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v37, "numberWithDouble:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setProperty:forKey:", v38, v27);

    -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setProperty:forKey:", objc_opt_class(), v30);

    if (-[DBSDeviceAppearanceScheduleController _showingScheduleSpecifiers](self, "_showingScheduleSpecifiers"))
    {
      -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v40;
      -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v42);

    }
    v43 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  int v18;
  __int128 v19;
  void *v20;
  objc_super v21;
  _OWORD v22[6];

  v6 = a4;
  v7 = a3;
  -[DBSDeviceAppearanceScheduleController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SCHEDULE"));

  if (v10)
  {
    -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setModeValue:", 102);

    -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "customSchedule");
    else
      memset(&v22[4], 0, 32);
    v17 = *(_OWORD *)(MEMORY[0x24BEBEC98] + 16);
    v22[2] = *MEMORY[0x24BEBEC98];
    v22[3] = v17;
    v18 = UISUserInterfaceStyleModeSchedulesEqual();

    if (v18)
    {
      -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_OWORD *)(MEMORY[0x24BEBEC90] + 16);
      v22[0] = *MEMORY[0x24BEBEC90];
      v22[1] = v19;
      objc_msgSend(v16, "setCustomSchedule:", v22);
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("FROM_SUNSET_TO_SUNRISE"));

    if (v15)
    {
      -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setModeValue:", 100);
LABEL_9:

    }
  }
  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceScheduleController showScheduleSpecifiers:animated:](self, "showScheduleSpecifiers:animated:", objc_msgSend(v20, "modeValue") == 102, 1);

  v21.receiver = self;
  v21.super_class = (Class)DBSDeviceAppearanceScheduleController;
  -[DBSDeviceAppearanceScheduleController tableView:didSelectRowAtIndexPath:](&v21, sel_tableView_didSelectRowAtIndexPath_, v7, v6);

}

- (void)showScheduleSpecifiers:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v4 = a4;
  v5 = a3;
  v10[2] = *MEMORY[0x24BDAC8D0];
  if (-[DBSDeviceAppearanceScheduleController _showingScheduleSpecifiers](self, "_showingScheduleSpecifiers") != a3)
  {
    -[DBSDeviceAppearanceScheduleController set_showingScheduleSpecifiers:](self, "set_showingScheduleSpecifiers:", v5);
    -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[DBSDeviceAppearanceScheduleController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v9, -[DBSDeviceAppearanceScheduleController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("TIME_GROUP"))+ 1, v4);
    else
      -[DBSDeviceAppearanceScheduleController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v9, v4);

  }
}

- (id)_lightAppearanceTimeString
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "customSchedule");
    v6 = v19;
  }
  else
  {
    v6 = 0;
    v18 = 0u;
    v19 = 0u;
  }
  objc_msgSend(v3, "setHour:", v6);

  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "customSchedule");
    v9 = *((_QWORD *)&v17 + 1);
  }
  else
  {
    v9 = 0;
    v16 = 0u;
    v17 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v16, v17, v18, v19);

  v10 = objc_alloc(MEMORY[0x24BDBCE48]);
  v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v11, "dateFromComponents:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceScheduleController _timeFormatter](self, "_timeFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_darkAppearanceTimeString
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "customSchedule");
    v6 = v18;
  }
  else
  {
    v6 = 0;
    v18 = 0u;
    v19 = 0u;
  }
  objc_msgSend(v3, "setHour:", v6);

  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "customSchedule");
    v9 = *((_QWORD *)&v16 + 1);
  }
  else
  {
    v9 = 0;
    v16 = 0u;
    v17 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v16, v17, v18, v19);

  v10 = objc_alloc(MEMORY[0x24BDBCE48]);
  v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v11, "dateFromComponents:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceScheduleController _timeFormatter](self, "_timeFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)datePickerChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  char *v15;
  void *v16;
  _OWORD v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 96, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hour");
  v9 = objc_msgSend(v7, "minute");
  v20 = 0u;
  v21 = 0u;
  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "customSchedule");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }
  v12 = v8;

  -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePicker](self, "_lightAppearanceTimePicker");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v4)
  {
    *(_QWORD *)&v21 = v12;
    v15 = (char *)&v21 + 8;
    goto LABEL_8;
  }
  -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePicker](self, "_darkAppearanceTimePicker");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
  {
    *(_QWORD *)&v20 = v12;
    v15 = (char *)&v20 + 8;
LABEL_8:
    *(_QWORD *)v15 = v9;
  }
  v18 = v20;
  v19 = v21;
  -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v18;
  v17[1] = v19;
  objc_msgSend(v16, "setCustomSchedule:", v17);

}

- (id)datePickerForSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BEBD520]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "setDatePickerMode:", 0);
  objc_msgSend(v6, "setPreferredDatePickerStyle:", 3);
  -[DBSDeviceAppearanceScheduleController _darkAppearanceTimePickerSpecifier](self, "_darkAppearanceTimePickerSpecifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "customSchedule");
      v11 = v22;
      v12 = v21;
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    -[DBSDeviceAppearanceScheduleController set_darkAppearanceTimePicker:](self, "set_darkAppearanceTimePicker:", v6);
  }
  else
  {
    -[DBSDeviceAppearanceScheduleController _lightAppearanceTimePickerSpecifier](self, "_lightAppearanceTimePickerSpecifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v4)
      -[DBSDeviceAppearanceScheduleController datePickerForSpecifier:].cold.1();
    -[DBSDeviceAppearanceScheduleController _styleMode](self, "_styleMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "customSchedule");
      v11 = v20;
      v12 = v19;
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    -[DBSDeviceAppearanceScheduleController set_lightAppearanceTimePicker:](self, "set_lightAppearanceTimePicker:", v6);
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v15, "setHour:", v12);
  objc_msgSend(v15, "setMinute:", v11);
  objc_msgSend(v6, "calendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v17);

  return v6;
}

- (PSSpecifier)_radioGroup
{
  return self->__radioGroup;
}

- (void)set_radioGroup:(id)a3
{
  objc_storeStrong((id *)&self->__radioGroup, a3);
}

- (PSSpecifier)_timeGroup
{
  return self->__timeGroup;
}

- (void)set_timeGroup:(id)a3
{
  objc_storeStrong((id *)&self->__timeGroup, a3);
}

- (PSSpecifier)_lightAppearanceTimePickerSpecifier
{
  return self->__lightAppearanceTimePickerSpecifier;
}

- (void)set_lightAppearanceTimePickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__lightAppearanceTimePickerSpecifier, a3);
}

- (PSSpecifier)_darkAppearanceTimePickerSpecifier
{
  return self->__darkAppearanceTimePickerSpecifier;
}

- (void)set_darkAppearanceTimePickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__darkAppearanceTimePickerSpecifier, a3);
}

- (BOOL)_showingScheduleSpecifiers
{
  return self->__showingScheduleSpecifiers;
}

- (void)set_showingScheduleSpecifiers:(BOOL)a3
{
  self->__showingScheduleSpecifiers = a3;
}

- (UISUserInterfaceStyleMode)_styleMode
{
  return (UISUserInterfaceStyleMode *)objc_loadWeakRetained((id *)&self->__styleMode);
}

- (void)set_styleMode:(id)a3
{
  objc_storeWeak((id *)&self->__styleMode, a3);
}

- (NSDateFormatter)_timeFormatter
{
  return self->__timeFormatter;
}

- (void)set_timeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->__timeFormatter, a3);
}

- (UIDatePicker)_lightAppearanceTimePicker
{
  return self->__lightAppearanceTimePicker;
}

- (void)set_lightAppearanceTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->__lightAppearanceTimePicker, a3);
}

- (UIDatePicker)_darkAppearanceTimePicker
{
  return self->__darkAppearanceTimePicker;
}

- (void)set_darkAppearanceTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->__darkAppearanceTimePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__darkAppearanceTimePicker, 0);
  objc_storeStrong((id *)&self->__lightAppearanceTimePicker, 0);
  objc_storeStrong((id *)&self->__timeFormatter, 0);
  objc_destroyWeak((id *)&self->__styleMode);
  objc_storeStrong((id *)&self->__darkAppearanceTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->__lightAppearanceTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->__timeGroup, 0);
  objc_storeStrong((id *)&self->__radioGroup, 0);
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

  __assert_rtn("-[DBSDeviceAppearanceScheduleController datePickerForSpecifier:]", "DBSDeviceAppearanceScheduleController.m", 237, "0");
}

@end
