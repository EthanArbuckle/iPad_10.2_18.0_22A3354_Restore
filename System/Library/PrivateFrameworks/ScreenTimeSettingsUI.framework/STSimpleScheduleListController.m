@implementation STSimpleScheduleListController

- (STSimpleScheduleListController)initWithSimpleSchedule:(id)a3
{
  id v4;
  STSimpleScheduleListController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  STBlueprintScheduleSimpleItem *simpleSchedule;
  uint64_t v14;
  PSSpecifier *simpleScheduleGroupSpecifier;
  void *v16;
  uint64_t v17;
  PSSpecifier *startTimeSpecifier;
  uint64_t v19;
  PSSpecifier *startTimePickerSpecifier;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  PSSpecifier *endTimeSpecifier;
  uint64_t v31;
  PSSpecifier *endTimePickerSpecifier;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v39;
  void *v40;
  id v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)STSimpleScheduleListController;
  v5 = -[STSimpleScheduleListController init](&v42, sel_init);
  if (v5)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeEditScheduleTitle"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSimpleScheduleListController setTitle:](v5, "setTitle:", v7);

    -[STSimpleScheduleListController navigationItem](v5, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v5, sel_cancelButtonTapped_);
    v39 = v8;
    objc_msgSend(v8, "setLeftBarButtonItem:", v9);

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeScheduleDoneBarButtonItemTitle"), &stru_24DB8A1D0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v40, 2, v5, sel_doneButtonTapped_);
    objc_msgSend(v8, "setRightBarButtonItem:", v11);

    v12 = objc_msgSend(v4, "copy");
    simpleSchedule = v5->_simpleSchedule;
    v5->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v12;

    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v14 = objc_claimAutoreleasedReturnValue();
    simpleScheduleGroupSpecifier = v5->_simpleScheduleGroupSpecifier;
    v5->_simpleScheduleGroupSpecifier = (PSSpecifier *)v14;

    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeFromSpecifierName"), &stru_24DB8A1D0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, v5, 0, sel__startTime_, 0, 4, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    startTimeSpecifier = v5->_startTimeSpecifier;
    v5->_startTimeSpecifier = (PSSpecifier *)v17;

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, v5, 0, 0, 0, 4, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    startTimePickerSpecifier = v5->_startTimePickerSpecifier;
    v5->_startTimePickerSpecifier = (PSSpecifier *)v19;

    v41 = v4;
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setIdentifier:](v5->_startTimePickerSpecifier, "setIdentifier:", v22);

    v23 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BE75D10];
    -[PSSpecifier setObject:forKeyedSubscript:](v5->_startTimePickerSpecifier, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE75D10]);

    v26 = objc_opt_class();
    v27 = *MEMORY[0x24BE75948];
    -[PSSpecifier setObject:forKeyedSubscript:](v5->_startTimePickerSpecifier, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE75948]);
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeToSpecifierName"), &stru_24DB8A1D0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, v5, 0, sel__endTime_, 0, 4, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    endTimeSpecifier = v5->_endTimeSpecifier;
    v5->_endTimeSpecifier = (PSSpecifier *)v29;

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, v5, 0, 0, 0, 4, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    endTimePickerSpecifier = v5->_endTimePickerSpecifier;
    v5->_endTimePickerSpecifier = (PSSpecifier *)v31;

    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setIdentifier:](v5->_endTimePickerSpecifier, "setIdentifier:", v34);

    v35 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v35, "numberWithDouble:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v25;
    v4 = v41;
    -[PSSpecifier setObject:forKeyedSubscript:](v5->_endTimePickerSpecifier, "setObject:forKeyedSubscript:", v36, v37);

    -[PSSpecifier setObject:forKeyedSubscript:](v5->_endTimePickerSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), v27);
  }

  return v5;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)doneButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  +[STUILog persistence](STUILog, "persistence", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_INFO, "User saved edited simple Downtime schedule", v7, 2u);
  }

  -[STSimpleScheduleListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "simpleScheduleListController:didSaveSimpleSchedule:", self, v6);

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
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_INFO, "User cancelled editing simple Downtime schedule", v6, 2u);
  }

  -[STSimpleScheduleListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "simpleScheduleListControllerDidCancel:", self);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[STSimpleScheduleListController simpleScheduleGroupSpecifier](self, "simpleScheduleGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    -[STSimpleScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    -[STSimpleScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    -[STSimpleScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
    v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_startTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimeStyle:", 1);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setFormattingContext:", 1);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_endTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimeStyle:", 1);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setFormattingContext:", 1);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  STSimpleScheduleListController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  -[STSimpleScheduleListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    if (-[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v12))
    {
      v14 = 1;
      -[STSimpleScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v12, 1);
    }
    else
    {
      if (-[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v10))
      {
        -[STSimpleScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v10, 1);
        v14 = 0;
LABEL_13:
        v15 = self;
        v16 = v14;
        v17 = v8;
        v18 = v11;
LABEL_17:
        -[STSimpleScheduleListController _updateTimeSpecifierDetailTextLabelColors:selectedSpecifier:unselectedSpecifier:](v15, "_updateTimeSpecifierDetailTextLabelColors:selectedSpecifier:unselectedSpecifier:", v16, v17, v18);
        objc_msgSend(v8, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSimpleScheduleListController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v19);

        goto LABEL_18;
      }
      v14 = 1;
    }
    -[STSimpleScheduleListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v10, v8, 1);
    goto LABEL_13;
  }
  if (v8 == v11)
  {
    if (-[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v10))
    {
      v13 = 1;
      -[STSimpleScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v10, 1);
    }
    else
    {
      if (-[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v12))
      {
        -[STSimpleScheduleListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v12, 1);
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
    -[STSimpleScheduleListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v12, v8, 1);
    goto LABEL_16;
  }
LABEL_18:
  v20.receiver = self;
  v20.super_class = (Class)STSimpleScheduleListController;
  -[STSimpleScheduleListController tableView:didSelectRowAtIndexPath:](&v20, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

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
  -[STSimpleScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);
  if (v11)
  {
    -[STSimpleScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v5))
    {

      goto LABEL_11;
    }
  }
  -[STSimpleScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v13))
  {
    -[STSimpleScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v14);

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
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:", 96, v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[STSimpleScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v7);

  if ((_DWORD)v5)
  {
    -[STSimpleScheduleListController startTimeSpecifier](self, "startTimeSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartTime:", v15);
  }
  else
  {
    -[STSimpleScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[STSimpleScheduleListController containsSpecifier:](self, "containsSpecifier:", v10);

    if (!v11)
      goto LABEL_7;
    -[STSimpleScheduleListController endTimeSpecifier](self, "endTimeSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEndTime:", v15);
  }

  if (v8)
  {
    -[STSimpleScheduleListController reloadSpecifier:](self, "reloadSpecifier:", v8);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

  }
LABEL_7:

}

- (id)datePickerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setPreferredDatePickerStyle:", 1);
  objc_msgSend(v5, "setDatePickerMode:", 0);
  -[STSimpleScheduleListController startTimePickerSpecifier](self, "startTimePickerSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(v5, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTime");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[STSimpleScheduleListController endTimePickerSpecifier](self, "endTimePickerSpecifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    objc_msgSend(v5, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSimpleScheduleListController simpleSchedule](self, "simpleSchedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTime");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;
    objc_msgSend(v8, "dateFromComponents:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v12);

  }
  return v5;
}

- (STSimpleScheduleListControllerDelegate)delegate
{
  return (STSimpleScheduleListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STBlueprintScheduleSimpleItem)simpleSchedule
{
  return (STBlueprintScheduleSimpleItem *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setSimpleSchedule:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1384);
}

- (PSSpecifier)simpleScheduleGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (PSSpecifier)startTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (PSSpecifier)startTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (PSSpecifier)endTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (PSSpecifier)endTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_endTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_simpleScheduleGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_simpleSchedule, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
