@implementation WFPredictedLocationTransitionTriggerConfigurationViewController

- (WFPredictedLocationTransitionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFPredictedLocationTransitionTriggerConfigurationViewController *v8;
  WFPredictedLocationTransitionTriggerConfigurationViewController *v9;
  WFPredictedLocationTransitionTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPredictedLocationTransitionTriggerConfigurationViewController.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFPredictedLocationTransitionTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFPredictedLocationTransitionTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v13, sel_initWithTrigger_mode_, v7, a4);
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
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
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("triggerLocation");
  v13[0] = CFSTR("identifier");
  v13[1] = CFSTR("cellIdentifier");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = CFSTR("items");
  v14[1] = v3;
  v14[2] = &unk_24E631928;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v12[0] = CFSTR("triggerTimeBefore");
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("sectionTitle");
  WFLocalizedStringWithKey(CFSTR("Time (Triggers)"), CFSTR("Time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("cellIdentifier");
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = CFSTR("items");
  v12[2] = v7;
  v12[3] = &unk_24E631940;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateUI
{
  id v2;

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFPredictedLocationTransitionTriggerConfigurationViewController;
  -[WFPredictedLocationTransitionTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

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
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;

  -[WFPredictedLocationTransitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("triggerDescription"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("triggerLocation"));

    if ((v9 & 1) != 0
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqual:", CFSTR("triggerTimeBefore")),
          v10,
          v11))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("items"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v12, "count");

    }
    else
    {
      v7 = 0;
    }
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
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFPredictedLocationTransitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v10, "setSelectionStyle:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    goto LABEL_23;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("triggerLocation"));

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  if (!v14)
  {
    switch(v17)
    {
      case 0:
        v19 = CFSTR("At Predicted Time");
        goto LABEL_19;
      case 1:
        v19 = CFSTR("5 Minutes Before");
        goto LABEL_19;
      case 2:
        v19 = CFSTR("10 Minutes Before");
        goto LABEL_19;
      case 3:
        v19 = CFSTR("15 Minutes Before");
        goto LABEL_19;
      case 4:
        v19 = CFSTR("30 Minutes Before");
        goto LABEL_19;
      case 5:
        v19 = CFSTR("1 Hour Before");
LABEL_19:
        WFLocalizedString(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setText:", v24);

        break;
      default:
        break;
    }
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "minutesBefore");
    goto LABEL_21;
  }
  if (v17)
  {
    if (v17 != 1)
    {
      getWFTriggersLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v28 = 136315394;
        v29 = "-[WFPredictedLocationTransitionTriggerConfigurationViewController tableView:cellForRowAtIndexPath:]";
        v30 = 2048;
        v31 = objc_msgSend(v6, "row");
        _os_log_impl(&dword_22007E000, v20, OS_LOG_TYPE_FAULT, "%s Unexpected destination for WFSectionLocation: %lu", (uint8_t *)&v28, 0x16u);
      }
      goto LABEL_11;
    }
    v18 = CFSTR("To Work");
  }
  else
  {
    v18 = CFSTR("Back Home");
  }
  WFLocalizedString(v18);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

LABEL_11:
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "destinationType");
LABEL_21:
  v26 = v23;

  if (v26 == v17)
    objc_msgSend(v10, "setAccessoryType:", 3);
LABEL_23:

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFPredictedLocationTransitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableViewHeaderString
{
  return WFLocalizedString(CFSTR("Predict"));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFPredictedLocationTransitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315394;
    v18 = "-[WFPredictedLocationTransitionTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("triggerLocation"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("items"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
    objc_msgSend(v14, "setDestinationType:", v13);
  else
    objc_msgSend(v14, "setMinutesBefore:", v13);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

@end
