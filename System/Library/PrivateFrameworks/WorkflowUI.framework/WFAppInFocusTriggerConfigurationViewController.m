@implementation WFAppInFocusTriggerConfigurationViewController

- (WFAppInFocusTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFAppInFocusTriggerConfigurationViewController *v8;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *selectedApps;
  NSMutableArray *v11;
  NSMutableArray *displayNameOfSelectedApps;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  WFAppInFocusTriggerConfigurationViewController *v17;
  void *v19;
  objc_super v20;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAppInFocusTriggerConfigurationViewController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFAppInFocusTrigger class]]"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFAppInFocusTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v20, sel_initWithTrigger_mode_, v7, a4);
  if (v8)
  {
    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    selectedApps = v8->_selectedApps;
    v8->_selectedApps = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    displayNameOfSelectedApps = v8->_displayNameOfSelectedApps;
    v8->_displayNameOfSelectedApps = v11;

    objc_msgSend(v7, "selectedBundleIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v7, "selectedBundleIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "if_compactMap:", &__block_literal_global_7674);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableOrderedSet addObjectsFromArray:](v8->_selectedApps, "addObjectsFromArray:", v16);
      -[WFAppInFocusTriggerConfigurationViewController updateDisplayNameOfSelectedApps](v8, "updateDisplayNameOfSelectedApps");

    }
    v17 = v8;
  }

  return v8;
}

- (id)tableViewCellClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)customSections
{
  objc_class *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("cellIdentifier");
  v13[0] = CFSTR("chooseApps");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v10[1] = CFSTR("cellIdentifier");
  v11[0] = CFSTR("triggerParameters");
  v10[0] = CFSTR("identifier");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAppInFocusTriggerConfigurationViewController;
  -[WFAppInFocusTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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
  int64_t v6;

  -[WFAppInFocusTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);

  return v6;
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;

  v6 = a4;
  v7 = a3;
  -[WFAppInFocusTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v10, "setSelectionStyle:", 0);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("chooseApps"));

    v15 = v10;
    v16 = v15;
    if (v14)
    {
      WFLocalizedString(CFSTR("App"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectedBundleIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "selectedBundleIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24 == 1)
        {
          -[WFAppInFocusTriggerConfigurationViewController displayNameOfSelectedApps](self, "displayNameOfSelectedApps");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "detailTextLabel");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setText:", v26);

        }
        else
        {
          v39 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("Any of %lu Apps"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "selectedBundleIdentifiers");
          v52 = v9;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringWithFormat:", v25, objc_msgSend(v40, "count"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "detailTextLabel");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setText:", v41);

          v9 = v52;
        }
      }
      else
      {
        WFLocalizedString(CFSTR("Choose"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "detailTextLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setText:", v25);
      }

    }
    else
    {
      v51 = v9;
      v48 = v6;
      v45 = v8;
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v16;
        else
          v28 = 0;
      }
      else
      {
        v28 = 0;
      }
      v53 = v28;

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "onIcon");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "onLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "onIconTintColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "offIcon");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "offLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "offIconTintColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "configureWithLeftGlyph:leftTitle:leftTintColor:rightGlyph:rightTitle:rightTintColor:", v29, v30, v31, v32, v34, v36);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setLeftViewSelected:", objc_msgSend(v37, "onFocus"));

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setRightViewSelected:", objc_msgSend(v38, "onBackground"));

      objc_msgSend(v53, "setDelegate:", self);
      v9 = v51;
      v6 = v48;
      v8 = v45;
    }
  }
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFAppInFocusTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  WFAppSearchViewController *v11;
  void *v12;
  void *v13;
  WFAppSearchViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFAppInFocusTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("chooseApps"));

  if (v9)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFAppInFocusTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    v11 = [WFAppSearchViewController alloc];
    v17 = *MEMORY[0x24BEC1780];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppInFocusTriggerConfigurationViewController selectedApps](self, "selectedApps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFAppSearchViewController initWithAppSearchType:omittedAppBundleIDs:allowMultipleSelection:selectedApps:](v11, "initWithAppSearchType:omittedAppBundleIDs:allowMultipleSelection:selectedApps:", 0, v12, 1, v13);

    -[WFAppSearchViewController setDelegate:](v14, "setDelegate:", self);
    WFLocalizedString(CFSTR("Choose Apps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppSearchViewController setTitle:](v14, "setTitle:", v15);

    -[WFAppInFocusTriggerConfigurationViewController presentNavControllerWithRootViewController:](self, "presentNavControllerWithRootViewController:", v14);
  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[WFAppInFocusTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)updateDisplayNameOfSelectedApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFAppInFocusTriggerConfigurationViewController displayNameOfSelectedApps](self, "displayNameOfSelectedApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFAppInFocusTriggerConfigurationViewController selectedApps](self, "selectedApps", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[WFAppInFocusTriggerConfigurationViewController displayNameOfSelectedApps](self, "displayNameOfSelectedApps");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)appSearchViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)appSearchViewController:(id)a3 didFinishWithApps:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "if_map:", &__block_literal_global_148);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedBundleIdentifiers:", v8);

  -[WFAppInFocusTriggerConfigurationViewController selectedApps](self, "selectedApps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        -[WFAppInFocusTriggerConfigurationViewController selectedApps](self, "selectedApps", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[WFAppInFocusTriggerConfigurationViewController updateDisplayNameOfSelectedApps](self, "updateDisplayNameOfSelectedApps");
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  -[WFTriggerConfigurationViewController trigger](self, "trigger", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnFocus:", v6);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOnBackground:", v5);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (NSMutableOrderedSet)selectedApps
{
  return self->_selectedApps;
}

- (void)setSelectedApps:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApps, a3);
}

- (NSMutableArray)displayNameOfSelectedApps
{
  return self->_displayNameOfSelectedApps;
}

- (void)setDisplayNameOfSelectedApps:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameOfSelectedApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameOfSelectedApps, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
}

uint64_t __92__WFAppInFocusTriggerConfigurationViewController_appSearchViewController_didFinishWithApps___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

uint64_t __71__WFAppInFocusTriggerConfigurationViewController_initWithTrigger_mode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a2);
}

@end
