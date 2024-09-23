@implementation SCLCustomDayDataSource

- (SCLCustomDayDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  SCLCustomDayDataSource *v4;
  id v5;
  void *v6;
  SCLCustomDayDataSource *v7;
  id v8;
  uint64_t v9;
  NSArray *weekdaySpecifiers;
  uint64_t v11;
  PSSpecifier *groupSpecifier;
  SCLTimeIntervalsFormatter *v13;
  SCLTimeIntervalsFormatter *formatter;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  SCLCustomDayDataSource *v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SCLCustomDayDataSource;
  v4 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v22, sel_initWithListController_viewModel_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __59__SCLCustomDayDataSource_initWithListController_viewModel___block_invoke;
    v19 = &unk_24E712190;
    v7 = v4;
    v20 = v7;
    v21 = v5;
    v8 = v5;
    objc_msgSend(v6, "SCL_enumerateWeekdaysUsingBlock:", &v16);
    v9 = objc_msgSend(v8, "copy", v16, v17, v18, v19);
    weekdaySpecifiers = v7->_weekdaySpecifiers;
    v7->_weekdaySpecifiers = (NSArray *)v9;

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CUSTOM_DAY_SELECTION_GROUP"));
    v11 = objc_claimAutoreleasedReturnValue();
    groupSpecifier = v7->_groupSpecifier;
    v7->_groupSpecifier = (PSSpecifier *)v11;

    v13 = (SCLTimeIntervalsFormatter *)objc_alloc_init(MEMORY[0x24BE84220]);
    formatter = v7->_formatter;
    v7->_formatter = v13;

    -[SCLCustomDayDataSource updateSpecifiersWithCurrentCalendar](v7, "updateSpecifiersWithCurrentCalendar");
  }
  return v4;
}

void __59__SCLCustomDayDataSource_initWithListController_viewModel___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("CUSTOM_DAY_%@"), v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24E712518, *(_QWORD *)(a1 + 32), 0, sel_scheduleIntervalForSpecifier_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setControllerLoadAction:", sel_showEditorForSpecifier_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75DA0]);

  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v6, "setProperty:forKey:", &unk_24E716C10, *MEMORY[0x24BE75850]);
  objc_msgSend(v6, "setIdentifier:", v8);
  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)updateSpecifiersWithCurrentCalendar
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SCLCustomDayDataSource weekdaySpecifiers](self, "weekdaySpecifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = -[SCLCustomDayDataSource dayForSpecifier:](self, "dayForSpecifier:", v9) - 1;
        objc_msgSend(v3, "weekdaySymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setName:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLCustomDayDataSource groupSpecifier](self, "groupSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  -[SCLCustomDayDataSource weekdaySpecifiers](self, "weekdaySpecifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  -[SCLSpecifierDataSource setSpecifiers:](self, "setSpecifiers:", v13);
}

- (int64_t)dayForSpecifier:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)specifierForDay:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SCLCustomDayDataSource weekdaySpecifiers](self, "weekdaySpecifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[SCLCustomDayDataSource dayForSpecifier:](self, "dayForSpecifier:", v10) == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)scheduleIntervalForSpecifier:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[SCLCustomDayDataSource dayForSpecifier:](self, "dayForSpecifier:", a3);
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalsForDay:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLCustomDayDataSource formatter](self, "formatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromTimeIntervals:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)showEditorForSpecifier:(id)a3
{
  id v4;
  int64_t v5;
  SCLSettingsViewModel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SCLCustomDayViewController *v14;
  void *v15;
  SCLCustomDayViewController *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SCLCustomDayDataSource dayForSpecifier:](self, "dayForSpecifier:", v4);
  v6 = objc_alloc_init(SCLSettingsViewModel);
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSettingsViewModel setRepeatSchedule:](v6, "setRepeatSchedule:", SCLRepeatScheduleForDay());
  objc_msgSend(v8, "timeIntervalsForDay:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsViewModel setTimeIntervals:](v6, "setTimeIntervals:", v9);

  -[SCLSettingsViewModel timeIntervals](v6, "timeIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    +[SCLTimeIntervalModel defaultTimeInterval](SCLTimeIntervalModel, "defaultTimeInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSettingsViewModel setTimeIntervals:](v6, "setTimeIntervals:", v13);

  }
  -[SCLSettingsViewModel setEnabled:](v6, "setEnabled:", objc_msgSend(v8, "isScheduledForDay:", v5));
  v14 = [SCLCustomDayViewController alloc];
  objc_msgSend(v4, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SCLCustomDayViewController initWithViewModel:title:](v14, "initWithViewModel:title:", v6, v15);
  -[SCLCustomDayViewController setDelegate:](v16, "setDelegate:", self);
  -[SCLSpecifierDataSource listController](self, "listController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "showController:animate:", v16, 1);

}

- (void)customDayViewControllerWillDismiss:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[10];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  objc_msgSend(v22, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  objc_msgSend(v4, "repeatSchedule");
  v5 = MEMORY[0x24BDAC760];
  v27[5] = MEMORY[0x24BDAC760];
  v27[6] = 3221225472;
  v27[7] = __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke;
  v27[8] = &unk_24E712168;
  v27[9] = &v28;
  SCLEnumerateDaysInRepeatSchedule();
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customSchedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke_2;
  v27[3] = &unk_24E7121B8;
  v27[4] = &v28;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsAtIndexes:", v10);
  if (objc_msgSend(v4, "isEnabled"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "timeIntervals");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
          v16 = objc_alloc(MEMORY[0x24BE841E8]);
          v17 = (void *)objc_msgSend(v16, "initWithTimeInterval:day:", v15, v29[3]);
          objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v12);
    }

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841D8]), "initWithRecurrences:", v9);
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCustomSchedule:", v18);

  -[SCLSpecifierDataSource listController](self, "listController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLCustomDayDataSource specifierForDay:](self, "specifierForDay:", v29[3]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadSpecifier:animated:", v21, 0);

  _Block_object_dispose(&v28, 8);
}

uint64_t __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "day") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (NSArray)weekdaySpecifiers
{
  return self->_weekdaySpecifiers;
}

- (void)setWeekdaySpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_weekdaySpecifiers, a3);
}

- (SCLTimeIntervalsFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_weekdaySpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end
