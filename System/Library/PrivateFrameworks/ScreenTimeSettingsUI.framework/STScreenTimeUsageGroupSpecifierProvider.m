@implementation STScreenTimeUsageGroupSpecifierProvider

- (STScreenTimeUsageGroupSpecifierProvider)init
{
  STScreenTimeUsageGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)STScreenTimeUsageGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v17, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ScreenTimeGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75AA0]);

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75A30]);

    objc_msgSend(v5, "setTarget:", v2);
    objc_msgSend(v5, "setButtonAction:", sel__headerButtonPressed_);
    -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v5);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Screen Time Summary"), v2, 0, sel__usageDetailsCoordinator_, 0, -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    -[STScreenTimeUsageGroupSpecifierProvider setUsageSummaryGraphSpecifier:](v2, "setUsageSummaryGraphSpecifier:", v10);
    v11 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WeeklyTotalSpecifierName"), &stru_24DB8A1D0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, v2, 0, sel__weeklyTotal_, 0, 4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[STScreenTimeUsageGroupSpecifierProvider setWeeklyTotalSpecifier:](v2, "setWeeklyTotalSpecifier:", v13);
    -[STGroupSpecifierProvider mutableSpecifiers](v2, "mutableSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);
    objc_msgSend(v14, "addObject:", v13);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__specifierIdentifierDidChange_, 0x24DB8F8F0, 0);

  }
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), "KVOContextScreenTimeUsageGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.lastUpdatedDate"), "KVOContextScreenTimeUsageGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextScreenTimeUsageGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.refreshing"), "KVOContextScreenTimeUsageGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STScreenTimeUsageGroupSpecifierProvider;
  -[STUsageGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), 7, "KVOContextScreenTimeUsageGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.lastUpdatedDate"), 7, "KVOContextScreenTimeUsageGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), 7, "KVOContextScreenTimeUsageGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.refreshing"), 5, "KVOContextScreenTimeUsageGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextScreenTimeUsageGroupSpecifierProvider")
  {
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.hasUsageData")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v12, "BOOLValue") ^ 1);
    }
    else
    {
      -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.lastUpdatedDate")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v14)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v16)
        {

          v15 = 0;
        }
        -[STScreenTimeUsageGroupSpecifierProvider _lastUpdatedDateDidChangeFrom:to:](self, "_lastUpdatedDateDidChangeFrom:to:", v12, v15);
      }
      else
      {
        -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport")))
        {
          -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.refreshing")))
            goto LABEL_21;
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v19)
          {

            v12 = 0;
          }
          -[STScreenTimeUsageGroupSpecifierProvider _refreshingDidChange:](self, "_refreshingDidChange:", objc_msgSend(v12, "BOOLValue"));
          goto LABEL_20;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v17)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v18)
        {

          v15 = 0;
        }
        -[STScreenTimeUsageGroupSpecifierProvider _selectedUsageReportDidChangeFrom:to:](self, "_selectedUsageReportDidChangeFrom:to:", v12, v15);
      }

    }
LABEL_20:

    goto LABEL_21;
  }
  v20.receiver = self;
  v20.super_class = (Class)STScreenTimeUsageGroupSpecifierProvider;
  -[STScreenTimeUsageGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_21:

}

- (void)_lastUpdatedDateDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (v19 != v6 && (objc_msgSend(v19, "isEqual:", v6) & 1) == 0)
  {
    v7 = v6;
    if (v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setTimeStyle:", 1);
      objc_msgSend(v8, "setDateStyle:", 2);
      objc_msgSend(v8, "setDoesRelativeDateFormatting:", 1);
      objc_msgSend(v8, "setFormattingContext:", 5);
      objc_msgSend(v8, "stringFromDate:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LastUpdatedDateFormat"), &stru_24DB8A1D0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFormat:locale:", v11, v13, v9);

    }
    else
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NoLastUpdatedDate"), &stru_24DB8A1D0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE75A68];
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);
    if (v17)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE75A78]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reloadFromSpecifier");

    }
    else
    {
      -[STGroupSpecifierProvider reloadSectionHeaderFootersWithAnimation:](self, "reloadSectionHeaderFootersWithAnimation:", 0);
    }

  }
}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (v24 == v6 || (objc_msgSend(v24, "isEqual:", v6) & 1) != 0)
    goto LABEL_19;
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75AB0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "type");
  objc_msgSend(v6, "reportDateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9 == 1)
    {
      if ((objc_msgSend(v12, "isDateInToday:", v11) & 1) == 0)
      {
        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ShowTodayButtonText"), &stru_24DB8A1D0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, 0x24DB92470);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], 0x24DB92490);
        v18 = &unk_24DBBEB38;
        goto LABEL_11;
      }
    }
    else
    {
      if (v9)
      {
LABEL_12:

        goto LABEL_13;
      }
      v14 = (void *)objc_opt_new();
      v15 = objc_msgSend(v13, "isDate:equalToDate:toUnitGranularity:", v11, v14, 0x2000);

      if ((v15 & 1) == 0)
      {
        +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ShowThisWeekButtonText"), &stru_24DB8A1D0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, 0x24DB92470);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], 0x24DB92490);
        v18 = &unk_24DBBEB20;
LABEL_11:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, 0x24DB924B0);

        goto LABEL_12;
      }
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB92490);
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v8, "reloadFromSpecifier");
  v20 = objc_msgSend(v24, "type") == v9;
  -[STScreenTimeUsageGroupSpecifierProvider usageSummaryGraphSpecifier](self, "usageSummaryGraphSpecifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v21, v20);
  -[STScreenTimeUsageGroupSpecifierProvider weeklyTotalSpecifier](self, "weeklyTotalSpecifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type"))
  {
    objc_msgSend(v23, "removeObject:", v22);
  }
  else if ((objc_msgSend(v23, "containsObject:", v22) & 1) != 0)
  {
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v22, 1);
  }
  else
  {
    objc_msgSend(v23, "ps_insertObject:afterObject:", v22, v21);
  }

LABEL_19:
}

- (void)_refreshingDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75A78]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v5, "startAnimatingSpinner");
  else
    objc_msgSend(v5, "stopAnimatingSpinner");

}

- (id)_usageDetailsCoordinator:(id)a3
{
  void *v3;
  void *v4;

  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_weeklyTotal:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedUsageReport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalScreenTime");
  v8 = v7;

  if (v8 >= 60.0)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setAllowedUnits:", 96);
    objc_msgSend(v9, "setUnitsStyle:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "stringFromTimeInterval:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_headerButtonPressed:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "usageDetailsCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "tag");
  if (v8 == 1)
  {
    objc_msgSend(v11, "selectToday");
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STScreenTimeUsageGroupSpecifierProvider.m"), 235, CFSTR("Unknown button tag: %lu"), v8);

  }
  else
  {
    objc_msgSend(v11, "setSelectedWeek:", 0);
  }
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB92490);

}

- (void)_specifierIdentifierDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB8F910);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STScreenTimeUsageGroupSpecifierProvider usageSummaryGraphSpecifier](self, "usageSummaryGraphSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v4);

}

- (PSSpecifier)usageSummaryGraphSpecifier
{
  return self->_usageSummaryGraphSpecifier;
}

- (void)setUsageSummaryGraphSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_usageSummaryGraphSpecifier, a3);
}

- (PSSpecifier)weeklyTotalSpecifier
{
  return self->_weeklyTotalSpecifier;
}

- (void)setWeeklyTotalSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_weeklyTotalSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyTotalSpecifier, 0);
  objc_storeStrong((id *)&self->_usageSummaryGraphSpecifier, 0);
}

@end
