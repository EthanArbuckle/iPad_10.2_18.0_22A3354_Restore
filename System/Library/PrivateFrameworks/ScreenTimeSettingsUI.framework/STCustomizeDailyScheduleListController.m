@implementation STCustomizeDailyScheduleListController

- (STCustomizeDailyScheduleListController)initWithDailySchedule:(id)a3 weekdayIndex:(unint64_t)a4 weekdayName:(id)a5 minimumStartTime:(id)a6
{
  id v10;
  id v11;
  id v12;
  STCustomizeDailyScheduleListController *v13;
  STCustomizeDailyScheduleListController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  STBlueprintScheduleCustomDayItem *dailySchedule;
  uint64_t v21;
  NSDateComponents *minimumStartTime;
  uint64_t v23;
  PSSpecifier *dailyScheduleGroupSpecifier;
  void *v25;
  void *v26;
  uint64_t v27;
  PSSpecifier *startTimeSpecifier;
  uint64_t v29;
  PSSpecifier *startTimePickerSpecifier;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  PSSpecifier *endTimeSpecifier;
  uint64_t v41;
  PSSpecifier *endTimePickerSpecifier;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  void *v51;
  id v52;
  id v53;
  objc_super v54;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v54.receiver = self;
  v54.super_class = (Class)STCustomizeDailyScheduleListController;
  v13 = -[STCustomizeDailyScheduleListController init](&v54, sel_init);
  v14 = v13;
  if (v13)
  {
    -[STCustomizeDailyScheduleListController setTitle:](v13, "setTitle:", v11);
    -[STCustomizeDailyScheduleListController navigationItem](v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v14, sel_cancelButtonTapped_);
    v50 = v15;
    objc_msgSend(v15, "setLeftBarButtonItem:", v16);

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeScheduleDoneBarButtonItemTitle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v51, 2, v14, sel_doneButtonTapped_);
    objc_msgSend(v15, "setRightBarButtonItem:", v18);

    v14->_weekdayEnabled = v10 != 0;
    v19 = objc_msgSend(v10, "copy");
    dailySchedule = v14->_dailySchedule;
    v14->_dailySchedule = (STBlueprintScheduleCustomDayItem *)v19;

    v14->_weekdayIndex = a4;
    v21 = objc_msgSend(v12, "copy");
    minimumStartTime = v14->_minimumStartTime;
    v14->_minimumStartTime = (NSDateComponents *)v21;

    v52 = v12;
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v23 = objc_claimAutoreleasedReturnValue();
    dailyScheduleGroupSpecifier = v14->_dailyScheduleGroupSpecifier;
    v14->_dailyScheduleGroupSpecifier = (PSSpecifier *)v23;

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeFromSpecifierName"), &stru_24DB8A1D0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, v14, 0, sel__startTime_, 0, 4, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    startTimeSpecifier = v14->_startTimeSpecifier;
    v14->_startTimeSpecifier = (PSSpecifier *)v27;

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, v14, 0, 0, 0, 4, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    startTimePickerSpecifier = v14->_startTimePickerSpecifier;
    v14->_startTimePickerSpecifier = (PSSpecifier *)v29;

    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "UUIDString");
    v53 = v10;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setIdentifier:](v14->_startTimePickerSpecifier, "setIdentifier:", v32);

    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v33, "numberWithDouble:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x24BE75D10];
    -[PSSpecifier setObject:forKeyedSubscript:](v14->_startTimePickerSpecifier, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE75D10]);

    v36 = objc_opt_class();
    v37 = *MEMORY[0x24BE75948];
    -[PSSpecifier setObject:forKeyedSubscript:](v14->_startTimePickerSpecifier, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BE75948]);
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeToSpecifierName"), &stru_24DB8A1D0, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v38, v14, 0, sel__endTime_, 0, 4, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    endTimeSpecifier = v14->_endTimeSpecifier;
    v14->_endTimeSpecifier = (PSSpecifier *)v39;

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, v14, 0, 0, 0, 4, 0);
    v41 = objc_claimAutoreleasedReturnValue();
    endTimePickerSpecifier = v14->_endTimePickerSpecifier;
    v14->_endTimePickerSpecifier = (PSSpecifier *)v41;

    v43 = (void *)objc_opt_new();
    objc_msgSend(v43, "UUIDString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setIdentifier:](v14->_endTimePickerSpecifier, "setIdentifier:", v44);

    v45 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](v14->_endTimePickerSpecifier, "setObject:forKeyedSubscript:", v46, v35);

    v12 = v52;
    v47 = objc_opt_class();
    v48 = v37;
    v10 = v53;
    -[PSSpecifier setObject:forKeyedSubscript:](v14->_endTimePickerSpecifier, "setObject:forKeyedSubscript:", v47, v48);

  }
  return v14;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)doneButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint8_t v8[16];

  +[STUILog persistence](STUILog, "persistence", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_INFO, "User saved edited custom Downtime schedule", v8, 2u);
  }

  -[STCustomizeDailyScheduleListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[STCustomizeDailyScheduleListController isWeekdayEnabled](self, "isWeekdayEnabled");
    if (v6)
    {
      -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "customizeDailyScheduleListController:didSaveDailySchedule:forWeekdayIndex:", self, v7, -[STCustomizeDailyScheduleListController weekdayIndex](self, "weekdayIndex"));
    if (v6)

  }
}

- (void)cancelButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  +[STUILog persistence](STUILog, "persistence", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_INFO, "User cancelled editing custom Downtime schedule", v6, 2u);
  }

  -[STCustomizeDailyScheduleListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "customizeDailyScheduleListControllerDidCancel:", self);

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

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE75590];
    -[STCustomizeDailyScheduleListController title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, sel__setWeekdayEnabled_specifier_, sel__getWeekdayEnabled_, 0, 6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v5, v8, 0);
    if (-[STCustomizeDailyScheduleListController isWeekdayEnabled](self, "isWeekdayEnabled"))
    {
      -[STCustomizeDailyScheduleListController dailyScheduleGroupSpecifier](self, "dailyScheduleGroupSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      -[STCustomizeDailyScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v13);

    }
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_getWeekdayEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[STCustomizeDailyScheduleListController isWeekdayEnabled](self, "isWeekdayEnabled", a3));
}

- (void)_setWeekdayEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[STCustomizeDailyScheduleListController setWeekdayEnabled:](self, "setWeekdayEnabled:", v5);
  if ((_DWORD)v5)
  {
    -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      +[STDeviceBedtime defaultBedtimeSchedule](STDeviceBedtime, "defaultBedtimeSchedule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCustomizeDailyScheduleListController minimumStartTime](self, "minimumStartTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && STCompareHourMinuteTimeComponents() == 1)
      {
        v11 = v7;
        v12 = v10;
      }
      else
      {
        v11 = v7;
        v12 = v9;
      }
      objc_msgSend(v11, "setStartTime:", v12);
      objc_msgSend(v8, "endTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEndTime:", v19);

      objc_msgSend(v7, "setDay:", -[STCustomizeDailyScheduleListController weekdayIndex](self, "weekdayIndex"));
      -[STCustomizeDailyScheduleListController setDailySchedule:](self, "setDailySchedule:", v7);

    }
    -[STCustomizeDailyScheduleListController dailyScheduleGroupSpecifier](self, "dailyScheduleGroupSpecifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    -[STCustomizeDailyScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v22;
    -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[STCustomizeDailyScheduleListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v24, 1);
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[STCustomizeDailyScheduleListController dailyScheduleGroupSpecifier](self, "dailyScheduleGroupSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDailyScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v13, "initWithObjects:", v14, v15, 0);

    -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v16))
      objc_msgSend(v25, "addObject:", v16);
    -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v17);

    -[STCustomizeDailyScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v18))
      objc_msgSend(v25, "addObject:", v18);
    -[STCustomizeDailyScheduleListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v25, 1);

  }
}

- (id)_startTime:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "startTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v6, "setWeekday:", objc_msgSend(v4, "day") + 1);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "nextDateAfterDate:matchingComponents:options:", v8, v6, 1024);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setFormattingContext:", 3);
    objc_msgSend(v11, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEEjmm"));
    objc_msgSend(v11, "stringFromDate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_endTime:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "endTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v4, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = STCompareHourMinuteTimeComponents();

    v9 = objc_msgSend(v4, "day") + 1;
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "maximumRangeOfUnit:", 512);
      v12 = v9 % v11;

      v9 = v12 + 1;
    }
    objc_msgSend(v6, "setWeekday:", v9);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    objc_msgSend(v13, "nextDateAfterDate:matchingComponents:options:", v14, v6, 1024);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setFormattingContext:", 3);
    objc_msgSend(v17, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEEjmm"));
    objc_msgSend(v17, "stringFromDate:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  STCustomizeDailyScheduleListController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  -[STCustomizeDailyScheduleListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v12))
    {
      v14 = 1;
      -[STCustomizeDailyScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v12, 1);
    }
    else
    {
      if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v10))
      {
        -[STCustomizeDailyScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v10, 1);
        v14 = 0;
LABEL_13:
        v15 = self;
        v16 = v14;
        v17 = v8;
        v18 = v11;
LABEL_17:
        -[STCustomizeDailyScheduleListController _updateTimeSpecifierDetailTextLabelColors:selectedSpecifier:unselectedSpecifier:](v15, "_updateTimeSpecifierDetailTextLabelColors:selectedSpecifier:unselectedSpecifier:", v16, v17, v18);
        objc_msgSend(v8, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[STCustomizeDailyScheduleListController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v19);

        goto LABEL_18;
      }
      v14 = 1;
    }
    -[STCustomizeDailyScheduleListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v10, v8, 1);
    goto LABEL_13;
  }
  if (v8 == v11)
  {
    if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v10))
    {
      v13 = 1;
      -[STCustomizeDailyScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v10, 1);
    }
    else
    {
      if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v12))
      {
        -[STCustomizeDailyScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v12, 1);
        v13 = 0;
LABEL_16:
        v15 = self;
        v16 = v13;
        v17 = v8;
        v18 = v9;
        goto LABEL_17;
      }
      v13 = 1;
    }
    -[STCustomizeDailyScheduleListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v12, v8, 1);
    goto LABEL_16;
  }
LABEL_18:
  v20.receiver = self;
  v20.super_class = (Class)STCustomizeDailyScheduleListController;
  -[STCustomizeDailyScheduleListController tableView:didSelectRowAtIndexPath:](&v20, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  -[STCustomizeDailyScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);
  if (v11)
  {
    -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v5))
    {

      goto LABEL_11;
    }
  }
  -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v13))
  {
    -[STCustomizeDailyScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v14);

  }
  else
  {
    v15 = 0;
  }

  if (v11)
  {

    if ((v15 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }

  if (v15)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

  }
LABEL_12:

}

- (void)_updateTimeSpecifierDetailTextLabelColors:(BOOL)a3 selectedSpecifier:(id)a4 unselectedSpecifier:(id)a5
{
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = *MEMORY[0x24BE75D18];
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailTextLabel");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v15, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v13);

    v14 = v11;
  }
  else
  {
    objc_msgSend(v11, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
  }
  objc_msgSend(v14, "setTextColor:", v12);

}

- (void)datePickerChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v4);

  if (v5)
  {
    -[STCustomizeDailyScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 96, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStartTime:", v12);

    v14 = STCompareHourMinuteTimeComponents();
    if (v14 != STCompareHourMinuteTimeComponents())
    {
      -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[STCustomizeDailyScheduleListController reloadSpecifier:](self, "reloadSpecifier:", v15);

    }
  }
  else
  {
    -[STCustomizeDailyScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[STCustomizeDailyScheduleListController containsSpecifier:](self, "containsSpecifier:", v16);

    if (!v17)
      goto LABEL_8;
    -[STCustomizeDailyScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 96, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEndTime:", v9);
  }

  if (v6)
  {
    -[STCustomizeDailyScheduleListController reloadSpecifier:](self, "reloadSpecifier:", v6);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

  }
LABEL_8:

}

- (id)datePickerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setPreferredDatePickerStyle:", 1);
  objc_msgSend(v5, "setDatePickerMode:", 0);
  -[STCustomizeDailyScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(v5, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v14);

    -[STCustomizeDailyScheduleListController minimumStartTime](self, "minimumStartTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumDate:", v10);
    goto LABEL_5;
  }
  -[STCustomizeDailyScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    objc_msgSend(v5, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDailyScheduleListController dailySchedule](self, "dailySchedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v11);

LABEL_5:
  }

  return v5;
}

- (STCustomizeDailyScheduleListControllerDelegate)delegate
{
  return (STCustomizeDailyScheduleListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isWeekdayEnabled
{
  return self->_weekdayEnabled;
}

- (void)setWeekdayEnabled:(BOOL)a3
{
  self->_weekdayEnabled = a3;
}

- (STBlueprintScheduleCustomDayItem)dailySchedule
{
  return (STBlueprintScheduleCustomDayItem *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setDailySchedule:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1392);
}

- (unint64_t)weekdayIndex
{
  return self->_weekdayIndex;
}

- (NSDateComponents)minimumStartTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 1408, 1);
}

- (PSSpecifier)dailyScheduleGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (PSSpecifier)startTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (PSSpecifier)startTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (PSSpecifier)endTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (PSSpecifier)endTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_endTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_dailyScheduleGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_minimumStartTime, 0);
  objc_storeStrong((id *)&self->_dailySchedule, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
