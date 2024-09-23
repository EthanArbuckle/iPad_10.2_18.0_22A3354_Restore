@implementation STDrillInUsageGroupSpecifierProvider

- (STDrillInUsageGroupSpecifierProvider)initWithUsageItem:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  STDrillInUsageGroupSpecifierProvider *v9;
  STDrillInUsageGroupSpecifierProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;

  v7 = a3;
  v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)STDrillInUsageGroupSpecifierProvider;
  v9 = -[STGroupSpecifierProvider init](&v50, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_usageItem, a3);
    objc_storeStrong((id *)&v10->_coordinator, a4);
    objc_msgSend(v8, "usageDetailsCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedUsageReport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "notificationsByTrustIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trustIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "totalUsage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_numberOfNotifications = objc_msgSend(v17, "unsignedIntegerValue");

    v18 = v13;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "itemType") == 6)
      v20 = CFSTR("DrillInPickupGroupSpecifierName");
    else
      v20 = CFSTR("MostUsedScreenTimeGroupSpecifierName");
    v46 = v19;
    objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_24DB8A1D0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE75AA0]);

    objc_msgSend(v13, "lastUpdatedDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v21;
    v49 = v8;
    if (v25)
    {
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "setTimeStyle:", 1);
      objc_msgSend(v26, "setDateStyle:", 2);
      objc_msgSend(v26, "setDoesRelativeDateFormatting:", 1);
      objc_msgSend(v26, "setFormattingContext:", 5);
      objc_msgSend(v26, "stringFromDate:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("LastUpdatedDateFormat"), &stru_24DB8A1D0, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v31 = v18;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v30, "initWithFormat:locale:", v29, v32, v27);

      v18 = v31;
      v34 = v33;
    }
    else
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("NoLastUpdatedDate"), &stru_24DB8A1D0, 0);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v35 = v46;

    v47 = (void *)v34;
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE75A68]);
    -[STGroupSpecifierProvider setGroupSpecifier:](v10, "setGroupSpecifier:", v22);
    -[STGroupSpecifierProvider mutableSpecifiers](v10, "mutableSpecifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Usage Summary"), v10, 0, sel_selectedUsageReport_, 0, -1, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v37, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v7, 0x24DB8EFF0);
    objc_msgSend(v36, "addObject:", v37);
    if (objc_msgSend(v7, "itemType") == 6 && !objc_msgSend(v18, "type"))
    {
      v38 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("DrillInPickupTotalSpecifierName"), &stru_24DB8A1D0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = sel_weeklyPickupTotal_;
    }
    else
    {
      v38 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("MostUsedDailyAverageSpecifierName"), &stru_24DB8A1D0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = sel_dailyAverage_;
    }
    objc_msgSend(v38, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v39, v10, 0, v40, 0, 4, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "addObject:", v41);
    if (v10->_numberOfNotifications)
    {
      v42 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("MostUsedNotificationsSpecifierName"), &stru_24DB8A1D0, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, v10, 0, sel_notifications_, 0, 4, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addObject:", v44);
    }

    v8 = v49;
  }

  return v10;
}

- (id)selectedUsageReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[STDrillInUsageGroupSpecifierProvider usageItem](self, "usageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v5);

  -[STDrillInUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "usageDetailsCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedUsageReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)weeklyPickupTotal:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[STDrillInUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageDetailsCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedWeekUsageReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickupsByTrustIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInUsageGroupSpecifierProvider usageItem](self, "usageItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trustIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "totalUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PickupsCount"), &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)dailyAverage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  __CFString *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;

  -[STDrillInUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageDetailsCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedWeekUsageReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STDrillInUsageGroupSpecifierProvider usageItem](self, "usageItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activePickupDateIntervals");
  if (v9 == 0.0)
  {
    v11 = 1.0;
  }
  else
  {
    objc_msgSend(v7, "activePickupDateIntervals");
    v11 = v10;
  }
  v12 = &stru_24DB8A1D0;
  switch(objc_msgSend(v8, "itemType"))
  {
    case 1:
      objc_msgSend(v7, "totalScreenTime");
      v14 = v13 / v11;
      goto LABEL_10;
    case 2:
      objc_msgSend(v7, "applicationUsageByTrustIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(v7, "categoryUsageByTrustIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(v7, "webUsageByTrustIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v16 = (void *)v15;
      objc_msgSend(v8, "trustIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "totalUsage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      v14 = v21 / v11;
LABEL_10:
      if (v14 >= 60.0)
      {
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "setAllowedUnits:", 96);
        objc_msgSend(v22, "setUnitsStyle:", 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "stringFromTimeInterval:", v14);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 6:
      objc_msgSend(v7, "pickupsByTrustIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trustIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "totalUsage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27 / v11;

      v29 = (void *)MEMORY[0x24BDD17C8];
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PickupsCount"), &stru_24DB8A1D0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringWithFormat:", v30, (unint64_t)fmin(fmax(round(v28), 0.0), 1.79769313e308));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      break;
    default:
      break;
  }

  return v12;
}

- (id)notifications:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[STDrillInUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageDetailsCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedUsageReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "notificationsByTrustIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInUsageGroupSpecifierProvider usageItem](self, "usageItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trustIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "totalUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NotificationsCount"), &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (unint64_t)numberOfNotifications
{
  return self->_numberOfNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);
}

@end
