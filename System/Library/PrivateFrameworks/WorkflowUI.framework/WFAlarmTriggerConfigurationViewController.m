@implementation WFAlarmTriggerConfigurationViewController

- (WFAlarmTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFAlarmTriggerConfigurationViewController *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  MTAlarmDataSource *alarmDataSource;
  WFAlarmTriggerConfigurationViewController *v16;
  void *v18;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAlarmTriggerConfigurationViewController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFAlarmTrigger class]]"));

  }
  v19.receiver = self;
  v19.super_class = (Class)WFAlarmTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v19, sel_initWithTrigger_mode_, v7, a4);
  if (v8)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v9 = (void *)getMTAlarmManagerClass_softClass;
    v28 = getMTAlarmManagerClass_softClass;
    if (!getMTAlarmManagerClass_softClass)
    {
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getMTAlarmManagerClass_block_invoke;
      v23 = &unk_24E604F20;
      v24 = &v25;
      __getMTAlarmManagerClass_block_invoke((uint64_t)&v20);
      v9 = (void *)v26[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v25, 8);
    v11 = (void *)objc_opt_new();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v12 = (void *)getMTAlarmDataSourceClass_softClass;
    v28 = getMTAlarmDataSourceClass_softClass;
    if (!getMTAlarmDataSourceClass_softClass)
    {
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getMTAlarmDataSourceClass_block_invoke;
      v23 = &unk_24E604F20;
      v24 = &v25;
      __getMTAlarmDataSourceClass_block_invoke((uint64_t)&v20);
      v12 = (void *)v26[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v25, 8);
    v14 = objc_msgSend([v13 alloc], "initWithAlarmManager:", v11);
    alarmDataSource = v8->_alarmDataSource;
    v8->_alarmDataSource = (MTAlarmDataSource *)v14;

    v16 = v8;
  }

  return v8;
}

- (id)tableViewCellClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)customSections
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[4];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEB8];
  v23[0] = CFSTR("chooseEvent");
  v22[0] = CFSTR("identifier");
  v22[1] = CFSTR("cellIdentifier");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = CFSTR("items");
  v23[1] = v4;
  v23[2] = &unk_24E631850;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCED8];
  v21[0] = CFSTR("chooseAlarm");
  v17 = CFSTR("identifier");
  v18 = CFSTR("sectionTitle");
  WFLocalizedString(CFSTR("Alarms"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  v19 = CFSTR("cellIdentifier");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("items");
  v21[2] = v11;
  v21[3] = &unk_24E631868;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v12, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "idiom");

  if (v15 == 1)
    objc_msgSend(v13, "setObject:forKey:", &unk_24E631880, CFSTR("items"));
  objc_msgSend(v7, "addObject:", v13);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFAlarmTriggerConfigurationViewController;
  -[WFAlarmTriggerConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WFAlarmTriggerConfigurationViewController alarmDataSource](self, "alarmDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "reloadAlarms");

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFTriggerConfigurationViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", CFSTR("triggerDescription")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("chooseAlarm"))
         || objc_msgSend(v6, "isEqual:", CFSTR("chooseEvent")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  else
  {
    v7 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqual:", CFSTR("triggerDescription")))
  {
    objc_msgSend(v11, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v11, "setSelectionStyle:", 0);
    objc_msgSend(v11, "setAccessoryType:", 0);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v6, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAlarmTriggerConfigurationViewController titleForCellInSection:item:](self, "titleForCellInSection:item:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    -[WFAlarmTriggerConfigurationViewController extraTextForCellInSection:item:](self, "extraTextForCellInSection:item:", v9, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    objc_msgSend(v11, "setAccessoryType:", -[WFAlarmTriggerConfigurationViewController accessoryTypeForCellInSection:item:](self, "accessoryTypeForCellInSection:item:", v9, v13));
  }
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v11, v6, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("triggerDescription"));

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)infoForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFTriggerConfigurationViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)titleForCellInSection:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("chooseEvent")))
  {
    v7 = objc_msgSend(v6, "integerValue");
    switch(v7)
    {
      case 2:
        v8 = CFSTR("Is Stopped");
        goto LABEL_16;
      case 1:
        v8 = CFSTR("Is Snoozed");
        goto LABEL_16;
      case 0:
        v8 = CFSTR("Goes Off");
LABEL_16:
        WFLocalizedString(v8);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("chooseAlarm")))
  {
    v9 = objc_msgSend(v6, "integerValue");
    switch(v9)
    {
      case 2:
        v8 = CFSTR("Wake-Up");
        goto LABEL_16;
      case 1:
        v8 = CFSTR("Existing");
        goto LABEL_16;
      case 0:
        WFLocalizedStringWithKey(CFSTR("Any (alarm trigger)"), CFSTR("Any"));
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v11 = (void *)v10;
        goto LABEL_18;
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (id)extraTextForCellInSection:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("chooseAlarm")) && objc_msgSend(v6, "integerValue") == 1)
  {
    v7 = (void *)objc_opt_new();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedAlarmDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForObjectValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)accessoryTypeForCellInSection:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("chooseAlarm")))
  {
    v8 = objc_msgSend(v7, "integerValue");
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "alarmType");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("chooseEvent")))
    {
LABEL_7:
      v12 = 0;
      goto LABEL_8;
    }
    v8 = objc_msgSend(v7, "integerValue");
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "alarmState");
  }
  v11 = v10;

  if (v11 != v8)
    goto LABEL_7;
  v12 = 3;
LABEL_8:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

  -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("triggerDescription")) & 1) == 0)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("chooseAlarm")))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("items"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "integerValue");
      switch(v11)
      {
        case 2:
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAlarmType:", 2);

          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCachedAlarmDescriptions:", MEMORY[0x24BDBD1A8]);

          -[WFAlarmTriggerConfigurationViewController alarmDataSource](self, "alarmDataSource");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sleepAlarm");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "alarmID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v55[0] = v24;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFTriggerConfigurationViewController trigger](self, "trigger");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setAlarmIDs:", v25);

          }
          else
          {
            getWFTriggersLogObject();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v54 = "-[WFAlarmTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
              _os_log_impl(&dword_22007E000, v27, OS_LOG_TYPE_ERROR, "%s Failed to find wake up alarm", buf, 0xCu);
            }

            -[WFTriggerConfigurationViewController trigger](self, "trigger");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setAlarmIDs:", MEMORY[0x24BDBD1A8]);
          }

          break;
        case 1:
          -[WFAlarmTriggerConfigurationViewController presentAlarmChooserViewController](self, "presentAlarmChooserViewController");
          break;
        case 0:
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAlarmType:", 0);

          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = MEMORY[0x24BDBD1A8];
          objc_msgSend(v13, "setAlarmIDs:", MEMORY[0x24BDBD1A8]);

          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCachedAlarmDescriptions:", v14);

          break;
      }

    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("chooseEvent")))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("items"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v5, "row"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "integerValue");
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlarmState:", v18);

    }
    v45 = v7;
    v46 = v5;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[WFTriggerConfigurationViewController tableView](self, "tableView", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "indexPathsForVisibleRows");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v29;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v49;
      v33 = CFSTR("identifier");
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v49 != v32)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v35, "section"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v37, "isEqualToString:", CFSTR("triggerDescription")) & 1) == 0)
          {
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("items"));
            v38 = v33;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", objc_msgSend(v35, "row"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            -[WFTriggerConfigurationViewController tableView](self, "tableView");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "cellForRowAtIndexPath:", v35);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = v38;
            objc_msgSend(v42, "setAccessoryType:", -[WFAlarmTriggerConfigurationViewController accessoryTypeForCellInSection:item:](self, "accessoryTypeForCellInSection:item:", v37, v40));

          }
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v31);
    }

    v7 = v45;
    v5 = v46;
    -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v46, v45);
    -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
    -[WFTriggerConfigurationViewController tableView](self, "tableView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "reloadData");

    v8 = v44;
  }

}

- (void)presentAlarmChooserViewController
{
  WFAlarmChooserViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFAlarmChooserViewController *v8;

  v3 = [WFAlarmChooserViewController alloc];
  -[WFAlarmTriggerConfigurationViewController alarmDataSource](self, "alarmDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFAlarmChooserViewController initWithAlarmDataSource:checkedAlarmIDs:](v3, "initWithAlarmDataSource:checkedAlarmIDs:", v4, v6);

  -[WFAlarmChooserViewController setDelegate:](v8, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  -[WFAlarmTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)alarmChooserViewController:(id)a3 didFinishWithChosenAlarms:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFTriggersLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFAlarmTriggerConfigurationViewController alarmChooserViewController:didFinishWithChosenAlarms:]";
    v19 = 2048;
    v20 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_INFO, "%s Got %lu alarms from the chooser", buf, 0x16u);
  }

  objc_msgSend(v5, "if_map:", &__block_literal_global_2458);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlarmIDs:", v7);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDateStyle:", 0);
  objc_msgSend(v9, "setTimeStyle:", 1);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__WFAlarmTriggerConfigurationViewController_alarmChooserViewController_didFinishWithChosenAlarms___block_invoke_2;
  v15[3] = &unk_24E6034D0;
  v16 = v9;
  v10 = v9;
  objc_msgSend(v5, "if_map:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCachedAlarmDescriptions:", v11);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlarmType:", 1);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

  -[WFAlarmTriggerConfigurationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmChooserViewControllerDidCancel:(id)a3
{
  -[WFAlarmTriggerConfigurationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (MTAlarmDataSource)alarmDataSource
{
  return self->_alarmDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
}

id __98__WFAlarmTriggerConfigurationViewController_alarmChooserViewController_didFinishWithChosenAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v3, "nextFireDateAfterDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "stringFromDate:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __98__WFAlarmTriggerConfigurationViewController_alarmChooserViewController_didFinishWithChosenAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmID");
}

@end
