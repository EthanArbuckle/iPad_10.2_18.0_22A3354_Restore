@implementation SCLDaySettingsSpecifierSource

- (SCLDaySettingsSpecifierSource)initWithListController:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  SCLDaySettingsSpecifierSource *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PSSpecifier *groupSpecifier;
  void *v13;
  void *v14;
  uint64_t v15;
  SCLTimeIntervalDataSource *v16;
  SCLTimeIntervalDataSource *repeatedDaySource;
  SCLCustomDayDataSource *v18;
  SCLCustomDayDataSource *customDayDataSource;
  void *v20;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SCLDaySettingsSpecifierSource;
  v8 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v22, sel_initWithListController_viewModel_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75598], "loadSpecifiersFromPlist:inBundle:target:stringsTable:", CFSTR("SCLDaySettings"), v9, v8, CFSTR("SchoolTimeSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    groupSpecifier = v8->_groupSpecifier;
    v8->_groupSpecifier = (PSSpecifier *)v11;

    -[SCLSpecifierDataSource setSpecifiers:](v8, "setSpecifiers:", v10);
    objc_msgSend(v7, "timeIntervals");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count"))
    {
      +[SCLTimeIntervalModel defaultTimeInterval](SCLTimeIntervalModel, "defaultTimeInterval");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
    v16 = -[SCLTimeIntervalDataSource initWithListController:timeIntervals:]([SCLTimeIntervalDataSource alloc], "initWithListController:timeIntervals:", v6, v13);
    repeatedDaySource = v8->_repeatedDaySource;
    v8->_repeatedDaySource = v16;

    -[SCLTimeIntervalDataSource setDelegate:](v8->_repeatedDaySource, "setDelegate:", v8);
    v18 = -[SCLCustomDayDataSource initWithListController:viewModel:]([SCLCustomDayDataSource alloc], "initWithListController:viewModel:", v6, v7);
    customDayDataSource = v8->_customDayDataSource;
    v8->_customDayDataSource = v18;

    v23[0] = v8->_repeatedDaySource;
    v23[1] = v8->_customDayDataSource;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSpecifierDataSource setChildDataSources:](v8, "setChildDataSources:", v20);

    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v8, CFSTR("scheduleType"), 5, kScheduleTypeContext);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("scheduleType"), kScheduleTypeContext);

  v4.receiver = self;
  v4.super_class = (Class)SCLDaySettingsSpecifierSource;
  -[SCLSpecifierDataSource dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  objc_super v9;

  if ((void *)kScheduleTypeContext == a6)
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70], a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    -[SCLDaySettingsSpecifierSource updateScheduleType:](self, "updateScheduleType:", v8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCLDaySettingsSpecifierSource;
    -[SCLSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateScheduleType:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[SCLSpecifierDataSource listController](self, "listController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  switch(a3)
  {
    case 1uLL:
      v6 = 127;
      break;
    case 3uLL:
      -[SCLDaySettingsSpecifierSource repeatedDaySource](self, "repeatedDaySource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 0);

      -[SCLDaySettingsSpecifierSource customDayDataSource](self, "customDayDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 1;
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "SCL_nonWeekendDays");

      break;
    default:
      goto LABEL_9;
  }
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRepeatSchedule:", v6);

  -[SCLDaySettingsSpecifierSource repeatedDaySource](self, "repeatedDaySource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeIntervals:", v10);

  -[SCLDaySettingsSpecifierSource repeatedDaySource](self, "repeatedDaySource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[SCLDaySettingsSpecifierSource customDayDataSource](self, "customDayDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = 0;
LABEL_8:
  objc_msgSend(v12, "setActive:", v14);

LABEL_9:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SCLSpecifierDataSource specifiers](self, "specifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    v19 = *MEMORY[0x24BE75DA0];
    v27 = *MEMORY[0x24BE75C20];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v21, "propertyForKey:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = a3;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "isEqual:", v24);

        if (v25)
          -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v21, v27);
        a3 = v23;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }

  -[SCLSpecifierDataSource listController](self, "listController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "endUpdates");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 specifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)SCLDaySettingsSpecifierSource;
  -[SCLSpecifierDataSource tableView:didSelectRowAtIndexPath:specifier:](&v24, sel_tableView_didSelectRowAtIndexPath_specifier_, a3, a4, a5);
  -[SCLDaySettingsSpecifierSource groupSpecifier](self, "groupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75C20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v9 = objc_msgSend(v8, "integerValue");
    -[SCLSpecifierDataSource viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "scheduleType");

    if (v9 == v11)
      goto LABEL_21;
    scl_framework_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSCLSettingsViewModelScheduleType(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSCLSettingsViewModelScheduleType(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_22151E000, v12, OS_LOG_TYPE_DEFAULT, "Switching from schedule type %@ to %@", buf, 0x16u);

    }
    -[SCLSpecifierDataSource viewModel](self, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == 3 && SCLSettingsViewModelScheduleTypeHasRepeatSchedule(v11))
    {
      v16 = -[SCLDaySettingsSpecifierSource repeatScheduleForRepeatingScheduleType:](self, "repeatScheduleForRepeatingScheduleType:", v11);
      v17 = objc_alloc(MEMORY[0x24BE841D8]);
      objc_msgSend(v15, "timeIntervals");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithTimeIntervals:repeatSchedule:", v18, v16);

      objc_msgSend(v15, "setCustomSchedule:", v19);
    }
    else
    {
      if (!SCLSettingsViewModelScheduleTypeHasRepeatSchedule(v9) || v11 != 3)
        goto LABEL_20;
      objc_msgSend(v15, "customSchedule");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniformTimeIntervals");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      scl_framework_log();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22151E000, v22, OS_LOG_TYPE_DEFAULT, "Had uniform time intervals for custom schedule - reusing", buf, 2u);
        }

        objc_msgSend(v15, "setRepeatSchedule:", -[SCLDaySettingsSpecifierSource repeatScheduleForRepeatingScheduleType:](self, "repeatScheduleForRepeatingScheduleType:", v9));
        objc_msgSend(v15, "setTimeIntervals:", v20);
      }
      else
      {
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22151E000, v22, OS_LOG_TYPE_DEFAULT, "Had non-uniform time intervals for custom schedule. The daily schedule will be reverted.", buf, 2u);
        }

      }
    }

LABEL_20:
    objc_msgSend(v15, "setScheduleType:", v9);

LABEL_21:
  }

}

- (int64_t)repeatScheduleForRepeatingScheduleType:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  if (a3 == 1)
    return 127;
  if (a3 != 2)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "SCL_nonWeekendDays");

  return v4;
}

- (void)timeIntervalDataSource:(id)a3 didUpdateTimeIntervals:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeIntervals:", v5);

}

- (NSArray)currentSpecifiers
{
  return self->_currentSpecifiers;
}

- (void)setCurrentSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpecifiers, a3);
}

- (SCLTimeIntervalDataSource)repeatedDaySource
{
  return self->_repeatedDaySource;
}

- (void)setRepeatedDaySource:(id)a3
{
  objc_storeStrong((id *)&self->_repeatedDaySource, a3);
}

- (SCLCustomDayDataSource)customDayDataSource
{
  return self->_customDayDataSource;
}

- (void)setCustomDayDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_customDayDataSource, a3);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_customDayDataSource, 0);
  objc_storeStrong((id *)&self->_repeatedDaySource, 0);
  objc_storeStrong((id *)&self->_currentSpecifiers, 0);
}

@end
