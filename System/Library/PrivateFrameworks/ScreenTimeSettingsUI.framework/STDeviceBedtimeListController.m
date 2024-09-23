@implementation STDeviceBedtimeListController

- (STDeviceBedtimeListController)init
{
  STDeviceBedtimeListController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  id v14;
  NSArray *orderedLocalizedWeekdayNames;
  NSArray *v16;
  NSArray *orderedWeekdayIndexes;
  NSArray *v18;
  _QWORD v20[4];
  NSArray *v21;
  NSArray *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)STDeviceBedtimeListController;
  v2 = -[STDeviceBedtimeListController init](&v26, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeSpecifierName"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController setTitle:](v2, "setTitle:", v4);

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "standaloneWeekdaySymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v7);
    v10 = objc_msgSend(v5, "firstWeekday") - 1;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 0, v7);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __37__STDeviceBedtimeListController_init__block_invoke;
    v20[3] = &unk_24DB871B0;
    v24 = v10;
    v25 = v7;
    v12 = v8;
    v21 = v12;
    v13 = v9;
    v22 = v13;
    v23 = v6;
    v14 = v6;
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v20);
    orderedLocalizedWeekdayNames = v2->_orderedLocalizedWeekdayNames;
    v2->_orderedLocalizedWeekdayNames = v13;
    v16 = v13;

    orderedWeekdayIndexes = v2->_orderedWeekdayIndexes;
    v2->_orderedWeekdayIndexes = v12;
    v18 = v12;

    -[STDeviceBedtimeListController scheduleDowntimeRefreshIfNeeded](v2, "scheduleDowntimeRefreshIfNeeded");
  }
  return v2;
}

void __37__STDeviceBedtimeListController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (unint64_t)(*(_QWORD *)(a1 + 56) + a2) % *(_QWORD *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)scheduleDowntimeRefreshAndReloadSpecifiers
{
  -[STDeviceBedtimeListController scheduleDowntimeRefreshIfNeeded](self, "scheduleDowntimeRefreshIfNeeded");
  -[STDeviceBedtimeListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)scheduleDowntimeRefreshIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[STDeviceBedtimeListController downtimeScheduleRefreshTimer](self, "downtimeScheduleRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STDeviceBedtimeListController downtimeScheduleRefreshTimer](self, "downtimeScheduleRefreshTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[STDeviceBedtimeListController setDowntimeScheduleRefreshTimer:](self, "setDowntimeScheduleRefreshTimer:", 0);
  }
  -[STDeviceBedtimeListController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeAllowancesCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeToNextExpectedStateChange");
  v8 = v7;

  if (v8 >= 0.0)
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x24BDBCF40];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __64__STDeviceBedtimeListController_scheduleDowntimeRefreshIfNeeded__block_invoke;
    v14 = &unk_24DB86750;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController setDowntimeScheduleRefreshTimer:](self, "setDowntimeScheduleRefreshTimer:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __64__STDeviceBedtimeListController_scheduleDowntimeRefreshIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scheduleDowntimeRefreshAndReloadSpecifiers");

}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint8_t buf[16];

  v3 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    -[STDeviceBedtimeListController reloadSpecifiers](self, "reloadSpecifiers");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STDeviceBedtimeListController.viewWillAppear", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)STDeviceBedtimeListController;
  -[STDeviceBedtimeListController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
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
  v16.super_class = (Class)STDeviceBedtimeListController;
  -[STDeviceBedtimeListController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.ScreenTime/DOWNTIME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("DeviceDowntimeSpecifierName"), CFSTR("Localizable"), v6, v8);

  v10 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithKey:table:locale:bundleURL:", CFSTR("ScreenTimeControllerTitle"), CFSTR("Localizable"), v11, v13);

  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.screen-time"), v9, v15, v4);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
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
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeTitleFooterText"), &stru_24DB8A1D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE75A68];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A68]);

    -[STDeviceBedtimeListController setInformativeTextGroupSpecifier:](self, "setInformativeTextGroupSpecifier:", v5);
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController setDownTimeGroupSpecifier:](self, "setDownTimeGroupSpecifier:");
    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController downTimeGroupSpecifier](self, "downTimeGroupSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController _deviceBedtimeSpecifierWithBedtime:downtimeGroupSpecifier:](self, "_deviceBedtimeSpecifierWithBedtime:downtimeGroupSpecifier:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v84 = (void *)v11;
    -[STDeviceBedtimeListController setDeviceBedtimeSpecifier:](self, "setDeviceBedtimeSpecifier:", v11);
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeScheduledFooterText"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v8);

    -[STDeviceBedtimeListController setScheduleSwitchGroupSpecifier:](self, "setScheduleSwitchGroupSpecifier:", v12);
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeScheduledSpecifierName"), &stru_24DB8A1D0, 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController setScheduledSwitchSpecifier:](self, "setScheduledSwitchSpecifier:");
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController atDowntimeFooterText](self, "atDowntimeFooterText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v8);

    v81 = v14;
    -[STDeviceBedtimeListController setAtBedtimeGroupSpecifier:](self, "setAtBedtimeGroupSpecifier:", v14);
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BlockAtDowntime"), &stru_24DB8A1D0, 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    v79 = v16;
    -[STDeviceBedtimeListController setAtBedtimeSpecifier:](self, "setAtBedtimeSpecifier:", v16);
    v86 = v6;
    if (objc_msgSend(v87, "deviceBedtimeEnabled"))
    {
      v72 = v12;
      v73 = v5;
      v74 = v3;
      objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController setScheduleTypeGroupSpecifier:](self, "setScheduleTypeGroupSpecifier:");
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeEveryDaySpecifierName"), &stru_24DB8A1D0, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BE75A18];
      v19 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
      v69 = v17;
      -[STDeviceBedtimeListController setEveryDaySpecifier:](self, "setEveryDaySpecifier:", v17);
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeCustomizeDaysSpecifierName"), &stru_24DB8A1D0, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v18;
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v18);
      v67 = v20;
      -[STDeviceBedtimeListController setCustomizeDaysSpecifier:](self, "setCustomizeDaysSpecifier:", v20);
      objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController timeFooterText](self, "timeFooterText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v8);

      v66 = v21;
      -[STDeviceBedtimeListController setTimeGroupSpecifier:](self, "setTimeGroupSpecifier:", v21);
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeDailyScheduleSpecifierName"), &stru_24DB8A1D0, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setControllerLoadAction:", sel__showEditSimpleScheduleListController_);
      v64 = v23;
      -[STDeviceBedtimeListController setDailyScheduleSpecifier:](self, "setDailyScheduleSpecifier:", v23);
      -[STDeviceBedtimeListController orderedLocalizedWeekdayNames](self, "orderedLocalizedWeekdayNames");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v24, "count"));
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v94 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i), self, 0, sel__customScheduleTime_, 0, 2, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setControllerLoadAction:", sel__showCustomizeDailyScheduleListController_);
            objc_msgSend(v25, "addObject:", v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        }
        while (v28);
      }

      -[STDeviceBedtimeListController setWeekdaySpecifiers:](self, "setWeekdaySpecifiers:", v25);
      v75 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[STDeviceBedtimeListController informativeTextGroupSpecifier](self, "informativeTextGroupSpecifier");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController downTimeGroupSpecifier](self, "downTimeGroupSpecifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController deviceBedtimeSpecifier](self, "deviceBedtimeSpecifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController scheduleSwitchGroupSpecifier](self, "scheduleSwitchGroupSpecifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController scheduledSwitchSpecifier](self, "scheduledSwitchSpecifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController scheduleTypeGroupSpecifier](self, "scheduleTypeGroupSpecifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController everyDaySpecifier](self, "everyDaySpecifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController timeGroupSpecifier](self, "timeGroupSpecifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)objc_msgSend(v75, "initWithObjects:", v78, v77, v32, v33, v34, v35, v36, v37, v38, 0);

      v39 = v87;
      objc_msgSend(v87, "scheduleByWeekdayIndex");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        -[STDeviceBedtimeListController weekdaySpecifiers](self, "weekdaySpecifiers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v76;
        objc_msgSend(v76, "addObjectsFromArray:", v41);
      }
      else
      {
        -[STDeviceBedtimeListController dailyScheduleSpecifier](self, "dailyScheduleSpecifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v76;
        objc_msgSend(v76, "addObject:", v41);
      }

      v53 = v86;
      v12 = v72;
      if (-[STDeviceBedtimeListController canAskForMoreTime](self, "canAskForMoreTime"))
      {
        -[STDeviceBedtimeListController atBedtimeGroupSpecifier](self, "atBedtimeGroupSpecifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v54);

        -[STDeviceBedtimeListController atBedtimeSpecifier](self, "atBedtimeSpecifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v55);

      }
      if ((objc_msgSend(v87, "shouldAllowEditing") & 1) == 0)
      {
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v56 = v42;
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v90;
          v60 = MEMORY[0x24BDBD1C0];
          do
          {
            for (j = 0; j != v58; ++j)
            {
              if (*(_QWORD *)v90 != v59)
                objc_enumerationMutation(v56);
              objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "setObject:forKeyedSubscript:", v60, v88);
            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          }
          while (v58);
        }

        v53 = v86;
        v39 = v87;
        v42 = v76;
      }
      v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v74);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v74) = (Class)v42;
      v3 = v74;

      v5 = v73;
    }
    else
    {
      v43 = objc_alloc(MEMORY[0x24BDBCEB8]);
      -[STDeviceBedtimeListController informativeTextGroupSpecifier](self, "informativeTextGroupSpecifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController downTimeGroupSpecifier](self, "downTimeGroupSpecifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController deviceBedtimeSpecifier](self, "deviceBedtimeSpecifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController scheduleSwitchGroupSpecifier](self, "scheduleSwitchGroupSpecifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController scheduledSwitchSpecifier](self, "scheduledSwitchSpecifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v43, "initWithObjects:", v44, v45, v46, v47, v48, 0);

      if (-[STDeviceBedtimeListController canAskForMoreTime](self, "canAskForMoreTime"))
      {
        -[STDeviceBedtimeListController atBedtimeGroupSpecifier](self, "atBedtimeGroupSpecifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v50);

        -[STDeviceBedtimeListController atBedtimeSpecifier](self, "atBedtimeSpecifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v51);

      }
      v52 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v49;

      v53 = v86;
      v39 = v87;
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_deviceBedtimeSpecifierWithBedtime:(id)a3 downtimeGroupSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;

  v6 = a4;
  v7 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "deviceBedtimeEnabled");
  -[STDeviceBedtimeListController affectedUser](self, "affectedUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRemoteUser");
  v12 = objc_msgSend(v7, "askForMoreTime");

  -[STDeviceBedtimeListController coordinator](self, "coordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeAllowancesCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDowntimeActive");

  v16 = (void *)MEMORY[0x24BE75590];
  if (v15)
  {
    if (v9)
      v17 = CFSTR("DeviceDowntimeDisableButtonWithScheduleName");
    else
      v17 = CFSTR("DeviceDowntimeDisableButtonWithoutScheduleName");
    if (v9)
      v18 = CFSTR("WithSchedule");
    else
      v18 = CFSTR("WithoutSchedule");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v17, &stru_24DB8A1D0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deleteButtonSpecifierWithName:target:action:", v19, self, sel__toggleDowntimeEnabled);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24DBBE940, *MEMORY[0x24BE75860]);
    v21 = CFSTR("RemoteUser");
    if (!v11)
      v21 = CFSTR("LocalUser");
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("DeviceDowntimeDisableButton%@%@Footer"), v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "localizedStringForKey:value:table:", v22, &stru_24DB8A1D0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "givenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringWithFormat:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE75A68]);

  }
  else
  {
    if (v9)
      v27 = CFSTR("DeviceDowntimeEnableButtonWithScheduleName");
    else
      v27 = CFSTR("DeviceDowntimeEnableButtonWithoutScheduleName");
    if (v9)
      v28 = CFSTR("WithSchedule");
    else
      v28 = CFSTR("WithoutSchedule");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v27, &stru_24DB8A1D0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, 0, 0, 0, 13, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = CFSTR("BlockedUser");
    if (!v12)
      v30 = CFSTR("UnblockedUser");
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("DeviceDowntimeEnableButton%@%@Footer"), v30, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v22, &stru_24DB8A1D0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE75A68]);

    objc_msgSend(v20, "setButtonAction:", sel__toggleDowntimeEnabled);
  }

  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  return v20;
}

- (void)_saveDowntimeAndReloadSpecifiers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  v3 = a3;
  -[STDeviceBedtimeListController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeAllowancesCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[STDeviceBedtimeListController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeAllowancesCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke;
    v11[3] = &unk_24DB86B58;
    v12 = v3;
    v11[4] = self;
    objc_msgSend(v9, "saveDeviceBedtime:completionHandler:", v10, v11);

  }
  else if (v3)
  {
    -[STDeviceBedtimeListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

void __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84498], "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v14 = objc_msgSend(v11, "saveContext:error:", v13, &v23);
    v15 = v23;

    if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");

}

- (void)simpleScheduleListControllerDidCancel:(id)a3
{
  -[STDeviceBedtimeListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)simpleScheduleListController:(id)a3 didSaveSimpleSchedule:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSimpleSchedule:", v5);

  -[STDeviceBedtimeListController _saveDowntimeAndReloadSpecifiers:](self, "_saveDowntimeAndReloadSpecifiers:", 1);
  -[STDeviceBedtimeListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)customizeDailyScheduleListControllerDidCancel:(id)a3
{
  -[STDeviceBedtimeListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)customizeDailyScheduleListController:(id)a3 didSaveDailySchedule:(id)a4 forWeekdayIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v7 = a4;
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleByWeekdayIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v29)
  {
    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "simpleSchedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController _createDefaultCustomScheduleFromSimpleSchedule:](self, "_createDefaultCustomScheduleFromSimpleSchedule:", v11);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v7, v12);

  -[STDeviceBedtimeListController orderedWeekdayIndexes](self, "orderedWeekdayIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (a5 + 1) % v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = STCompareHourMinuteTimeComponents();
  if (v18 == 1)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19
      && (objc_msgSend(v19, "startTime"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = STCompareHourMinuteTimeComponents(),
          v21,
          v22 == 1))
    {
      objc_msgSend(v20, "setStartTime:", v16);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, v15);
    }
    else
    {
      LODWORD(v22) = 0;
    }

  }
  else
  {
    LODWORD(v22) = 0;
  }
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setScheduleByWeekdayIndex:", v29);

  -[STDeviceBedtimeListController weekdaySpecifiers](self, "weekdaySpecifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v13, "indexOfObject:", v25);

  objc_msgSend(v24, "objectAtIndexedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController reloadSpecifier:](self, "reloadSpecifier:", v27);

  if ((_DWORD)v22)
  {
    objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v13, "indexOfObject:", v15));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController reloadSpecifier:](self, "reloadSpecifier:", v28);

  }
  -[STDeviceBedtimeListController _saveDowntimeAndReloadSpecifiers:](self, "_saveDowntimeAndReloadSpecifiers:", 1);
  -[STDeviceBedtimeListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.bedtime"), CFSTR("TimeAllowanceViewModelBlueprintContext"));
  -[STDeviceBedtimeListController downtimeScheduleRefreshTimer](self, "downtimeScheduleRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STDeviceBedtimeListController downtimeScheduleRefreshTimer](self, "downtimeScheduleRefreshTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  v5.receiver = self;
  v5.super_class = (Class)STDeviceBedtimeListController;
  -[STDeviceBedtimeListController dealloc](&v5, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  STRootViewModelCoordinator *v5;
  STRootViewModelCoordinator *coordinator;
  STRootViewModelCoordinator *v7;

  v5 = (STRootViewModelCoordinator *)a3;
  coordinator = self->_coordinator;
  if (coordinator != v5)
  {
    v7 = v5;
    -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.bedtime"), CFSTR("TimeAllowanceViewModelBlueprintContext"));
    objc_storeStrong((id *)&self->_coordinator, a3);
    -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](self->_coordinator, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.bedtime"), 0, CFSTR("TimeAllowanceViewModelBlueprintContext"));
    v5 = v7;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  if (a6 == CFSTR("TimeAllowanceViewModelBlueprintContext"))
  {
    if (-[STDeviceBedtimeListController isViewLoaded](self, "isViewLoaded", a3, a4, a5))
    {
      -[STDeviceBedtimeListController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[STDeviceBedtimeListController coordinator](self, "coordinator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeAllowancesCoordinator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bedtime");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v13;
        if (v13)
        {
          -[STDeviceBedtimeListController setBedtime:](self, "setBedtime:", v13);
          -[STDeviceBedtimeListController reloadSpecifiers](self, "reloadSpecifiers");
          -[STDeviceBedtimeListController scheduleDowntimeRefreshIfNeeded](self, "scheduleDowntimeRefreshIfNeeded");
          v12 = v13;
        }

      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)STDeviceBedtimeListController;
    -[STDeviceBedtimeListController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setDeviceBedtimeEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setAskForMoreTime:", -[STDeviceBedtimeListController canAskForMoreTime](self, "canAskForMoreTime"));
    -[STDeviceBedtimeListController setBedtime:](self, "setBedtime:", v6);

  }
  v7 = objc_msgSend(v9, "BOOLValue");
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceBedtimeEnabled:", v7);

  -[STDeviceBedtimeListController _saveDowntimeAndReloadSpecifiers:](self, "_saveDowntimeAndReloadSpecifiers:", 1);
}

- (id)deviceBedtimeEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STDeviceBedtimeListController bedtime](self, "bedtime", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "deviceBedtimeEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createDefaultCustomScheduleFromSimpleSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STDeviceBedtimeListController orderedWeekdayIndexes](self, "orderedWeekdayIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  objc_msgSend(v4, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setStartTime:", v6);
        objc_msgSend(v15, "setEndTime:", v7);
        objc_msgSend(v15, "setDay:", objc_msgSend(v14, "unsignedIntegerValue"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)_toggleDowntimeEnabled
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  STDeviceBedtimeListController *v14;

  objc_msgSend(MEMORY[0x24BE84498], "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BE84680]);
  -[STDeviceBedtimeListController affectedUser](self, "affectedUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDSID:", v7);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke;
  v11[3] = &unk_24DB871D8;
  v12 = v8;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v8;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

void __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  STIOSAlertPresenter *v7;
  _QWORD v8[5];
  id v9;

  v2 = (void *)MEMORY[0x24BE84570];
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v2, "fetchUserWithDSID:inContext:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  v7 = -[STIOSAlertPresenter initWithPresentingViewController:]([STIOSAlertPresenter alloc], "initWithPresentingViewController:", *(_QWORD *)(a1 + 48));
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke_2;
    v8[3] = &unk_24DB86440;
    v8[4] = *(_QWORD *)(a1 + 48);
    +[STTimeAllowancesCompatibilityController showOnDemandDowntimeCompatibilityAlertIfNeededForUser:alertPresenter:completionHandler:](STTimeAllowancesCompatibilityController, "showOnDemandDowntimeCompatibilityAlertIfNeededForUser:alertPresenter:completionHandler:", v5, v7, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_actuallyToggleDowntimeEnabled");
  }

}

uint64_t __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actuallyToggleDowntimeEnabled");
}

- (void)_actuallyToggleDowntimeEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[STDeviceBedtimeListController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeAllowancesCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[STDeviceBedtimeListController coordinator](self, "coordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeAllowancesCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__STDeviceBedtimeListController__actuallyToggleDowntimeEnabled__block_invoke;
    v8[3] = &unk_24DB866E0;
    v8[4] = self;
    objc_msgSend(v7, "toggleDowntimeWithCompletionHandler:", v8);

  }
  else
  {
    -[STDeviceBedtimeListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

uint64_t __63__STDeviceBedtimeListController__actuallyToggleDowntimeEnabled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_simpleScheduleTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BE84510];
  -[STDeviceBedtimeListController bedtime](self, "bedtime", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simpleSchedule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simpleScheduleTimeRangeWithStartTimeComponents:endTimeComponents:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_showEditSimpleScheduleListController:(id)a3
{
  id v4;
  void *v5;
  STSimpleScheduleListController *v6;
  void *v7;
  void *v8;
  STSimpleScheduleListController *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setParentController:", self);
  -[STDeviceBedtimeListController rootController](self, "rootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRootController:", v5);

  objc_msgSend(v11, "setSpecifier:", v4);
  v6 = [STSimpleScheduleListController alloc];
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[STSimpleScheduleListController initWithSimpleSchedule:](v6, "initWithSimpleSchedule:", v8);

  -[STSimpleScheduleListController setDelegate:](v9, "setDelegate:", self);
  -[STSimpleScheduleListController setParentController:](v9, "setParentController:", v11);
  objc_msgSend(v11, "rootController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSimpleScheduleListController setRootController:](v9, "setRootController:", v10);

  -[STSimpleScheduleListController setSpecifier:](v9, "setSpecifier:", v4);
  objc_msgSend(v11, "showController:", v9);
  -[STDeviceBedtimeListController showController:](self, "showController:", v11);

}

- (id)_customScheduleTime:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[STDeviceBedtimeListController weekdaySpecifiers](self, "weekdaySpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDeviceBedtimeListController orderedWeekdayIndexes](self, "orderedWeekdayIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheduleByWeekdayIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BE84510];
      objc_msgSend(v15, "startTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "simpleScheduleTimeRangeWithStartTimeComponents:endTimeComponents:", v17, v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeDailyScheduleOff"), &stru_24DB8A1D0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (void)_showCustomizeDailyScheduleListController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  STCustomizeDailyScheduleListController *v20;
  void *v21;
  STCustomizeDailyScheduleListController *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[STDeviceBedtimeListController weekdaySpecifiers](self, "weekdaySpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v26);

  -[STDeviceBedtimeListController orderedWeekdayIndexes](self, "orderedWeekdayIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleByWeekdayIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "unsignedIntegerValue");
  v11 = v10;
  if (!v10)
    v10 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10 - 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "endTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  if (v13
    && (objc_msgSend(v13, "startTime"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = STCompareHourMinuteTimeComponents(),
        v15,
        v16 == 1))
  {
    v17 = v14;
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setParentController:", self);
  -[STDeviceBedtimeListController rootController](self, "rootController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRootController:", v19);

  objc_msgSend(v18, "setSpecifier:", v26);
  v20 = [STCustomizeDailyScheduleListController alloc];
  objc_msgSend(v26, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[STCustomizeDailyScheduleListController initWithDailySchedule:weekdayIndex:weekdayName:minimumStartTime:](v20, "initWithDailySchedule:weekdayIndex:weekdayName:minimumStartTime:", v24, v11, v21, v17);

  -[STCustomizeDailyScheduleListController setDelegate:](v22, "setDelegate:", self);
  -[STCustomizeDailyScheduleListController setParentController:](v22, "setParentController:", v18);
  objc_msgSend(v18, "rootController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDailyScheduleListController setRootController:](v22, "setRootController:", v23);

  -[STCustomizeDailyScheduleListController setSpecifier:](v22, "setSpecifier:", v26);
  objc_msgSend(v18, "showController:", v22);
  -[STDeviceBedtimeListController showController:](self, "showController:", v18);

}

- (id)timeFooterText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;

  -[STDeviceBedtimeListController affectedUser](self, "affectedUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isRemoteUser"))
  {
    -[STDeviceBedtimeListController coordinator](self, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isCloudSyncEnabled");

    if (!v12)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      v14 = CFSTR("DeviceDowntimeScheduleFooterTextLocal");
      goto LABEL_7;
    }
LABEL_5:
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
    v14 = CFSTR("DeviceDowntimeScheduleFooterTextCloud");
LABEL_7:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_24DB8A1D0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v3, "givenName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeScheduleFooterTextRemote"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

- (void)setAskForMoreTime:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[STDeviceBedtimeListController bedtime](self, "bedtime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAskForMoreTime:", v5);

  -[STDeviceBedtimeListController _saveDowntimeAndReloadSpecifiers:](self, "_saveDowntimeAndReloadSpecifiers:", 1);
}

- (id)askForMoreTime:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STDeviceBedtimeListController bedtime](self, "bedtime", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "askForMoreTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)atDowntimeFooterText
{
  void *v2;
  void *v3;
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
  const __CFString *v14;

  -[STDeviceBedtimeListController affectedUser](self, "affectedUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isRemoteUser") & 1) == 0)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v14 = CFSTR("AtDowntimeLocalFooterText");
LABEL_8:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_24DB8A1D0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v14 = CFSTR("AtDowntimeRemoteGenericFooterText");
    goto LABEL_8;
  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(v2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personNameComponentsFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_7;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AtDowntimeRemoteFooterText"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[STDeviceBedtimeListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STDeviceBedtimeListController dailyScheduleSpecifier](self, "dailyScheduleSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController everyDaySpecifier](self, "everyDaySpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v9 == v11)
  {
    v21 = *MEMORY[0x24BE75D18];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "accessoryType") != 3)
    {
      objc_msgSend(v15, "setAccessoryType:", 3);
      objc_msgSend(v13, "objectForKeyedSubscript:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAccessoryType:", 0);
      -[STDeviceBedtimeListController weekdaySpecifiers](self, "weekdaySpecifiers");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v10;
      v24 = (void *)v22;
      v30 = v23;
      v33[0] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v24, v25, 1);

      -[STDeviceBedtimeListController bedtime](self, "bedtime");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setScheduleByWeekdayIndex:", 0);

      -[STDeviceBedtimeListController _saveDowntimeAndReloadSpecifiers:](self, "_saveDowntimeAndReloadSpecifiers:", 0);
LABEL_12:

      v10 = v30;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v9 == (void *)v12)
  {
    v14 = *MEMORY[0x24BE75D18];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "accessoryType") != 3)
    {
      objc_msgSend(v15, "setAccessoryType:", 3);
      objc_msgSend(v11, "objectForKeyedSubscript:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAccessoryType:", 0);
      -[STDeviceBedtimeListController bedtime](self, "bedtime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scheduleByWeekdayIndex");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v28, "simpleSchedule");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[STDeviceBedtimeListController _createDefaultCustomScheduleFromSimpleSchedule:](self, "_createDefaultCustomScheduleFromSimpleSchedule:", v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setScheduleByWeekdayIndex:", v17);

      }
      v30 = v10;
      v32 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController weekdaySpecifiers](self, "weekdaySpecifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[STDeviceBedtimeListController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v18, v19, 1);

      v20 = v27;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
LABEL_14:
  v31.receiver = self;
  v31.super_class = (Class)STDeviceBedtimeListController;
  -[STDeviceBedtimeListController tableView:didSelectRowAtIndexPath:](&v31, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  -[STDeviceBedtimeListController everyDaySpecifier](self, "everyDaySpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduleByWeekdayIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = 0;
    else
      v13 = 3;
LABEL_9:
    objc_msgSend(v19, "setAccessoryType:", v13);
    goto LABEL_10;
  }
  -[STDeviceBedtimeListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDeviceBedtimeListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "isEqual:", v15);

  if (v16)
  {
    -[STDeviceBedtimeListController bedtime](self, "bedtime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scheduleByWeekdayIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v13 = 3;
    else
      v13 = 0;
    goto LABEL_9;
  }
LABEL_10:

}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (STDeviceBedtime)bedtime
{
  return self->_bedtime;
}

- (void)setBedtime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (STUIUser)affectedUser
{
  return self->_affectedUser;
}

- (void)setAffectedUser:(id)a3
{
  objc_storeStrong((id *)&self->_affectedUser, a3);
}

- (BOOL)canAskForMoreTime
{
  return self->_canAskForMoreTime;
}

- (void)setCanAskForMoreTime:(BOOL)a3
{
  self->_canAskForMoreTime = a3;
}

- (NSArray)orderedWeekdayIndexes
{
  return (NSArray *)objc_getProperty(self, a2, 1408, 1);
}

- (NSArray)orderedLocalizedWeekdayNames
{
  return (NSArray *)objc_getProperty(self, a2, 1416, 1);
}

- (PSSpecifier)deviceBedtimeSpecifier
{
  return self->_deviceBedtimeSpecifier;
}

- (void)setDeviceBedtimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceBedtimeSpecifier, a3);
}

- (PSSpecifier)downTimeGroupSpecifier
{
  return self->_downTimeGroupSpecifier;
}

- (void)setDownTimeGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_downTimeGroupSpecifier, a3);
}

- (PSSpecifier)scheduledSwitchSpecifier
{
  return self->_scheduledSwitchSpecifier;
}

- (void)setScheduledSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledSwitchSpecifier, a3);
}

- (PSSpecifier)scheduleSwitchGroupSpecifier
{
  return self->_scheduleSwitchGroupSpecifier;
}

- (void)setScheduleSwitchGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleSwitchGroupSpecifier, a3);
}

- (PSSpecifier)scheduleTypeGroupSpecifier
{
  return self->_scheduleTypeGroupSpecifier;
}

- (void)setScheduleTypeGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleTypeGroupSpecifier, a3);
}

- (PSSpecifier)informativeTextGroupSpecifier
{
  return self->_informativeTextGroupSpecifier;
}

- (void)setInformativeTextGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, a3);
}

- (PSSpecifier)everyDaySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setEveryDaySpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1472);
}

- (PSSpecifier)customizeDaysSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setCustomizeDaysSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1480);
}

- (PSSpecifier)timeGroupSpecifier
{
  return self->_timeGroupSpecifier;
}

- (void)setTimeGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_timeGroupSpecifier, a3);
}

- (PSSpecifier)dailyScheduleSpecifier
{
  return self->_dailyScheduleSpecifier;
}

- (void)setDailyScheduleSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_dailyScheduleSpecifier, a3);
}

- (NSArray)weekdaySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setWeekdaySpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1504);
}

- (PSSpecifier)atBedtimeGroupSpecifier
{
  return self->_atBedtimeGroupSpecifier;
}

- (void)setAtBedtimeGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_atBedtimeGroupSpecifier, a3);
}

- (PSSpecifier)atBedtimeSpecifier
{
  return self->_atBedtimeSpecifier;
}

- (void)setAtBedtimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_atBedtimeSpecifier, a3);
}

- (NSTimer)downtimeScheduleRefreshTimer
{
  return self->_downtimeScheduleRefreshTimer;
}

- (void)setDowntimeScheduleRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_downtimeScheduleRefreshTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeScheduleRefreshTimer, 0);
  objc_storeStrong((id *)&self->_atBedtimeSpecifier, 0);
  objc_storeStrong((id *)&self->_atBedtimeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_weekdaySpecifiers, 0);
  objc_storeStrong((id *)&self->_dailyScheduleSpecifier, 0);
  objc_storeStrong((id *)&self->_timeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_customizeDaysSpecifier, 0);
  objc_storeStrong((id *)&self->_everyDaySpecifier, 0);
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_scheduleTypeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_scheduleSwitchGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_scheduledSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_downTimeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_deviceBedtimeSpecifier, 0);
  objc_storeStrong((id *)&self->_orderedLocalizedWeekdayNames, 0);
  objc_storeStrong((id *)&self->_orderedWeekdayIndexes, 0);
  objc_storeStrong((id *)&self->_affectedUser, 0);
  objc_storeStrong((id *)&self->_bedtime, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

void __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Error saving managed object contet: %@", a5, a6, a7, a8, 2u);
}

void __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Error saving device bedtime: %@", a5, a6, a7, a8, 2u);
}

@end
