@implementation STNoUsageReportedGroupSpecifierProvider

- (STNoUsageReportedGroupSpecifierProvider)init
{
  STNoUsageReportedGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v8, sel_init);
  v3 = (void *)MEMORY[0x24BE75590];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  objc_super v4;

  -[STNoUsageReportedGroupSpecifierProvider setCoordinator:](self, "setCoordinator:", 0);
  v4.receiver = self;
  v4.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider invalidate](&v4, sel_invalidate);
  v3.receiver = self;
  v3.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v3, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("usageDetailsCoordinator.devices"));
  v6.receiver = self;
  v6.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.devices"), 5, "KVOContextNoUsageReportedGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a5;
  if (a6 == "KVOContextNoUsageReportedGroupSpecifierProvider")
  {
    v12 = a3;
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("usageDetailsCoordinator.devices"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STNoUsageReportedGroupSpecifierProvider _devicesDidChange:](self, "_devicesDidChange:", v14);

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
    v11 = a3;
    -[STNoUsageReportedGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_devicesDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isRemoteUser"))
    v7 = objc_msgSend(v6, "isScreenTimeEnabled") ^ 1;
  else
    v7 = 1;
  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v7);
  if (!-[STGroupSpecifierProvider isHidden](self, "isHidden"))
  {
    v47 = v6;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startOfDayForDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v8;
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "usageDetailsCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "devices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v49 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v21, "lastFamilyCheckinDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v11, "compare:", v22);

          if (v23 == 1)
          {
            objc_msgSend(v21, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v24);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v18);
    }

    v25 = objc_msgSend(v12, "count");
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v25 == 0);
    v6 = v47;
    if (-[STGroupSpecifierProvider isHidden](self, "isHidden"))
      goto LABEL_25;
    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v12);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("NoUsageReportedSingleDeviceAlertFormat");
    if (v25 > 1)
      v27 = CFSTR("NoUsageReportedMultipleDevicesAlertFormat");
    v28 = v27;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", v28, &stru_24DB8A1D0, 0);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v47, "givenName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v26;
    v43 = (void *)v30;
    objc_msgSend(v31, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@ %@"), 0, v26, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageReportedGroupSpecifierProvider noUsageReportedAlertSpecifier](self, "noUsageReportedAlertSpecifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "indexOfObject:", v35);

    v44 = v34;
    v45 = (void *)v33;
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v37 = *MEMORY[0x24BE75D28];
    }
    else
    {
      objc_msgSend(v34, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *MEMORY[0x24BE75D28];
      objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqual:", v33);

      if ((v40 & 1) != 0)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, self, 0, 0, 0, -1, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, v37);
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v44, "addObject:", v41);
    else
      objc_msgSend(v44, "replaceObjectAtIndex:withObject:", v36, v41);
    -[STNoUsageReportedGroupSpecifierProvider setNoUsageReportedAlertSpecifier:](self, "setNoUsageReportedAlertSpecifier:", v41);

    goto LABEL_24;
  }
LABEL_26:

}

- (PSSpecifier)noUsageReportedAlertSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNoUsageReportedAlertSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noUsageReportedAlertSpecifier, 0);
}

@end
