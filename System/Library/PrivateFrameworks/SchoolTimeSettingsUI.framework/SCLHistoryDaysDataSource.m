@implementation SCLHistoryDaysDataSource

- (SCLHistoryDaysDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  id v6;
  SCLHistoryDaysDataSource *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCLHistoryDaysDataSource;
  v7 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v10, sel_initWithListController_viewModel_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v7, CFSTR("scheduleType"), 1, kOtherContext);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v7, CFSTR("timeIntervals"), 1, kOtherContext);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v7, CFSTR("customSchedule"), 1, kOtherContext);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v7, CFSTR("historyItems"), 5, kItemsContext);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v7, CFSTR("enabled"), 5, kOtherContext);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_handleSignificantTimeChange_, *MEMORY[0x24BDF75A0], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("historyItems"), kItemsContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("enabled"), kOtherContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("scheduleType"), kOtherContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("timeIntervals"), kOtherContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("customSchedule"), kOtherContext);

  v4.receiver = self;
  v4.super_class = (Class)SCLHistoryDaysDataSource;
  -[SCLSpecifierDataSource dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kItemsContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      -[SCLHistoryDaysDataSource updateHistoryGroupsWithItems:](self, "updateHistoryGroupsWithItems:", v14);
    goto LABEL_7;
  }
  if ((void *)kOtherContext == a6)
  {
    -[SCLSpecifierDataSource viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "historyItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryDaysDataSource updateHistoryGroupsWithItems:](self, "updateHistoryGroupsWithItems:", v15);

LABEL_7:
    goto LABEL_8;
  }
  v16.receiver = self;
  v16.super_class = (Class)SCLHistoryDaysDataSource;
  -[SCLSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_8:

}

- (void)updateHistoryGroupsWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  SCLSettingsViewModel *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  SCLHistoryDayDataSource *v29;
  void *v30;
  SCLHistoryDayDataSource *v31;
  void *v32;
  void *v33;
  id obj;
  void *v35;
  void *v36;
  id v37;
  SCLHistoryDaysDataSource *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE841F0];
  v38 = self;
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleSettingsWithViewModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v4;
  v33 = v7;
  if (objc_msgSend(v4, "count") || objc_msgSend(v7, "isEnabled"))
  {
    v8 = (void *)MEMORY[0x24BE841C8];
    objc_msgSend(v7, "schedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "historyGroupsByPrioritizingSchedule:forDate:inCalendar:items:", v9, v10, v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }
  v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDD17A0]);
  objc_msgSend(v14, "setCalendar:", v13);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  objc_msgSend(v14, "setDateTimeStyle:", 1);
  v36 = v14;
  objc_msgSend(v14, "setUnitsStyle:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v12;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v20, "items");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {

        }
        else
        {
          v22 = objc_msgSend(v33, "isEnabled");

          if ((v22 & 1) == 0)
            continue;
        }
        v23 = objc_alloc_init(SCLSettingsViewModel);
        objc_msgSend(v20, "referenceDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "components:fromDate:toDate:options:", 16, v35, v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v25, "day"))
        {
          objc_msgSend(v20, "referenceDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v13, "isDateInYesterday:", v26);

          if (v27)
            objc_msgSend(v25, "setDay:", -1);
        }
        objc_msgSend(v36, "localizedStringFromDateComponents:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = [SCLHistoryDayDataSource alloc];
        -[SCLSpecifierDataSource listController](v38, "listController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[SCLHistoryDayDataSource initWithListController:viewModel:historyGroup:title:](v29, "initWithListController:viewModel:historyGroup:title:", v30, v23, v20, v28);

        -[SCLSpecifierDataSource setActive:](v31, "setActive:", 1);
        objc_msgSend(v37, "addObject:", v31);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v17);
  }

  -[SCLSpecifierDataSource setChildDataSources:](v38, "setChildDataSources:", v37);
}

- (void)handleSignificantTimeChange:(id)a3
{
  void *v4;
  id v5;

  -[SCLSpecifierDataSource viewModel](self, "viewModel", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "historyItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLHistoryDaysDataSource updateHistoryGroupsWithItems:](self, "updateHistoryGroupsWithItems:", v4);

}

@end
