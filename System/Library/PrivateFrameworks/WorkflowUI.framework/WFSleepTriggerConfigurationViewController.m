@implementation WFSleepTriggerConfigurationViewController

- (WFSleepTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFSleepTriggerConfigurationViewController *v8;
  uint64_t v9;
  WFHealthFeatureAvailability *healthFeatureAvailability;
  void *v11;
  WFSleepTriggerConfigurationViewController *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSleepTriggerConfigurationViewController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFSleepTrigger class]]"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFSleepTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v15, sel_initWithTrigger_mode_, v7, a4);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEC3DD0]), "initWithSleepFeature:", 0);
    healthFeatureAvailability = v8->_healthFeatureAvailability;
    v8->_healthFeatureAvailability = (WFHealthFeatureAvailability *)v9;

    -[WFSleepTriggerConfigurationViewController healthFeatureAvailability](v8, "healthFeatureAvailability");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObserver:", v8);

    v12 = v8;
  }

  return v8;
}

- (void)updateUI
{
  id v2;

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)viewDidLoad
{
  uint64_t v2;
  objc_class *v3;
  void *v4;
  id v5;

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forHeaderFooterViewReuseIdentifier:", v2, v4);

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
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("identifier");
  v8 = CFSTR("cellIdentifier");
  v9[0] = CFSTR("triggerParameters");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1, v7, v8, v9[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSleepTriggerConfigurationViewController;
  -[WFSleepTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  char v10;

  -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("triggerDescription"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("triggerParameters"));

    if ((v10 & 1) != 0)
      v8 = 3;
    else
      v8 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);
  }

  return v8;
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
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  WFSleepTriggerConfigurationViewController *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v10, "setSelectionStyle:", 0);
    objc_msgSend(v10, "setAccessoryType:", 0);
  }
  else
  {
    objc_msgSend(v10, "setAccessoryType:", 0);
    -[WFSleepTriggerConfigurationViewController setupParameterSectionCell:atRow:](self, "setupParameterSectionCell:atRow:", v10, objc_msgSend(v7, "row"));
  }
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __77__WFSleepTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v20 = &unk_24E604E80;
  v21 = self;
  v13 = v10;
  v22 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(&v17);
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v13, v7, v8, v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14);

  return v15;
}

- (void)setupParameterSectionCell:(id)a3 atRow:(int64_t)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  switch(a4)
  {
    case 2:
      v6 = CFSTR("Waking Up");
      goto LABEL_7;
    case 1:
      v6 = CFSTR("Bedtime Begins");
      goto LABEL_7;
    case 0:
      v6 = CFSTR("Wind Down Begins");
LABEL_7:
      WFLocalizedString(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v7);

      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid row %li for WFSleepTriggerConfigurationViewController"), a4);
LABEL_9:
  objc_msgSend(v15, "setUserInteractionEnabled:", 1);
  objc_msgSend(v15, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  -[WFSleepTriggerConfigurationViewController healthFeatureAvailability](self, "healthFeatureAvailability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sleepOnboardingStatus");

  if (v11)
  {
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "selection");

    if (v13 == a4)
      objc_msgSend(v15, "setAccessoryType:", 3);
  }
  else
  {
    objc_msgSend(v15, "setUserInteractionEnabled:", 0);
    objc_msgSend(v15, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", 0);

  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("triggerParameters"));

  if (v9)
  {
    -[WFSleepTriggerConfigurationViewController footerLinkViewForTableView:](self, "footerLinkViewForTableView:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)footerLinkViewForTableView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 buf;
  uint64_t v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSleepTriggerConfigurationViewController healthFeatureAvailability](self, "healthFeatureAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepOnboardingStatus");

  if (v6 == 1)
  {
    v7 = 0;
    goto LABEL_18;
  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v11 = (id *)getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr;
  v36 = (void *)getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr;
  if (!getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr)
  {
    v12 = SleepLibrary();
    v11 = (id *)dlsym(v12, "HKSPSleepLaunchURLRouteOnboardSleepCoaching");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
    getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&buf, 8);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "HKSPSleepLaunchURLRoute getHKSPSleepLaunchURLRouteOnboardSleepCoaching(void)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("WFSleepTriggerConfigurationViewController.m"), 25, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v13 = *v11;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v14 = (id *)getHKSPProvenanceSourceShortcutsSymbolLoc_ptr;
  v36 = (void *)getHKSPProvenanceSourceShortcutsSymbolLoc_ptr;
  if (!getHKSPProvenanceSourceShortcutsSymbolLoc_ptr)
  {
    v15 = SleepLibrary();
    v14 = (id *)dlsym(v15, "HKSPProvenanceSourceShortcuts");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v14;
    getHKSPProvenanceSourceShortcutsSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&buf, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "HKSPProvenanceSource getHKSPProvenanceSourceShortcuts(void)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("WFSleepTriggerConfigurationViewController.m"), 27, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v16 = *v14;
  v17 = v13;
  v18 = v16;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v19 = getHKSPSleepURLSymbolLoc_ptr;
  v36 = getHKSPSleepURLSymbolLoc_ptr;
  if (!getHKSPSleepURLSymbolLoc_ptr)
  {
    v20 = SleepLibrary();
    v19 = dlsym(v20, "HKSPSleepURL");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v19;
    getHKSPSleepURLSymbolLoc_ptr = v19;
  }
  _Block_object_dispose(&buf, 8);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSURL *WFHKSPSleepURL(__strong HKSPSleepLaunchURLRoute, __strong HKSPProvenanceSource)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("WFSleepTriggerConfigurationViewController.m"), 26, CFSTR("%s"), dlerror());

LABEL_22:
    __break(1u);
  }
  ((void (*)(id, id))v19)(v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    WFLocalizedString(CFSTR("You can set up a sleep schedule in the Health app."));
    v22 = objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Open Health…"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v22, v23, (_QWORD)buf);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "rangeOfString:", v23);
    objc_msgSend(v10, "setText:URL:linkRange:", v24, v21, v25, v26);
    v7 = v10;

  }
  else
  {
    getWFTriggersLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[WFSleepTriggerConfigurationViewController footerLinkViewForTableView:]";
      _os_log_impl(&dword_22007E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to get onboard sleep coaching url", (uint8_t *)&buf, 0xCu);
    }
    v7 = 0;
  }

LABEL_18:
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("triggerParameters"));

  if (v9)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315394;
      v17 = "-[WFSleepTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    if (objc_msgSend(v6, "row"))
    {
      v11 = objc_msgSend(v6, "row");
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11 == 1)
        v14 = 1;
      else
        v14 = 2;
    }
    else
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0;
    }
    objc_msgSend(v12, "setSelection:", v14);

  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)healthFeatureAvailability:(id)a3 sleepOnboardingStatusDidChange:(unint64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__WFSleepTriggerConfigurationViewController_healthFeatureAvailability_sleepOnboardingStatusDidChange___block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (BOOL)shouldEnableNextButton
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasValidConfiguration"))
  {
    -[WFSleepTriggerConfigurationViewController healthFeatureAvailability](self, "healthFeatureAvailability");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "sleepOnboardingStatus") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (WFHealthFeatureAvailability)healthFeatureAvailability
{
  return self->_healthFeatureAvailability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthFeatureAvailability, 0);
}

uint64_t __102__WFSleepTriggerConfigurationViewController_healthFeatureAvailability_sleepOnboardingStatusDidChange___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateNextButtonEnabledState");
}

void __77__WFSleepTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "healthFeatureAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepOnboardingStatus");

  if (v3 != 1)
    objc_msgSend(*(id *)(a1 + 40), "setAccessoryType:", 0);
}

@end
