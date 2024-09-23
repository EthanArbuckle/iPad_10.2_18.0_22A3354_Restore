@implementation WFAutomationSelectTypeViewController

- (WFAutomationSelectTypeViewController)initWithTriggerManager:(id)a3
{
  id v5;
  WFAutomationSelectTypeViewController *v6;
  WFAutomationSelectTypeViewController *v7;
  uint64_t v8;
  WFHomeManager *homeManager;
  UISearchController *v10;
  UISearchController *searchController;
  uint64_t v12;
  NSArray *tableContent;
  WFAutomationSelectTypeViewController *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFAutomationSelectTypeViewController;
  v6 = -[WFAutomationSelectTypeViewController initWithStyle:](&v16, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_triggerManager, a3);
    objc_msgSend(MEMORY[0x24BEC3DE0], "sharedManager");
    v8 = objc_claimAutoreleasedReturnValue();
    homeManager = v7->_homeManager;
    v7->_homeManager = (WFHomeManager *)v8;

    -[WFHomeManager addEventObserver:](v7->_homeManager, "addEventObserver:", v7);
    v10 = (UISearchController *)objc_alloc_init(MEMORY[0x24BEBD928]);
    searchController = v7->_searchController;
    v7->_searchController = v10;

    -[WFAutomationSelectTypeViewController buildTableContent](v7, "buildTableContent");
    v12 = objc_claimAutoreleasedReturnValue();
    tableContent = v7->_tableContent;
    v7->_tableContent = (NSArray *)v12;

    v14 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WFAutomationSelectTypeViewController;
  -[WFAutomationSelectTypeViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[WFAutomationSelectTypeViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v6);

  -[WFAutomationSelectTypeViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", v8, v10);

  -[WFAutomationSelectTypeViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("header"));

  v12 = *MEMORY[0x24BEBE770];
  -[WFAutomationSelectTypeViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRowHeight:", v12);

  -[WFAutomationSelectTypeViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEstimatedRowHeight:", 60.0);

  -[WFAutomationSelectTypeViewController searchController](self, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSearchResultsUpdater:", self);

  -[WFAutomationSelectTypeViewController searchController](self, "searchController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObscuresBackgroundDuringPresentation:", 0);

  -[WFAutomationSelectTypeViewController searchController](self, "searchController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSelectTypeViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSearchController:", v17);

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__WFAutomationSelectTypeViewController_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WFAutomationSelectTypeViewController homeManager](self, "homeManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_accentColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSelectTypeViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFAutomationSelectTypeViewController currentSections](self, "currentSections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int64_t v12;

  -[WFAutomationSelectTypeViewController currentSections](self, "currentSections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("triggerTypes"));

  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("triggerClasses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", objc_opt_class()))
    {
      -[WFAutomationSelectTypeViewController availableFocusModes](self, "availableFocusModes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    else
    {
      v12 = objc_msgSend(v10, "count");
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = a4;
  -[WFAutomationSelectTypeViewController currentSections](self, "currentSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("triggerTypes"));

  -[WFAutomationSelectTypeViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAutomationSelectTypeViewController triggerForIndexPath:](self, "triggerForIndexPath:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTrigger:", v14);

    objc_msgSend(v13, "setAccessoryType:", 1);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", v15, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_opt_class();
    -[WFAutomationSelectTypeViewController homeManager](self, "homeManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "automationTypeForHomeManager:", v17);

    objc_msgSend(v13, "configureForAutomationType:buttonTarget:action:", v18, self, sel_chooseHomeAutomation_);
    objc_msgSend(v13, "setSelectionStyle:", 0);
  }

  return v13;
}

- (void)chooseHomeAutomation:(id)a3
{
  id v4;

  -[WFAutomationSelectTypeViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectTypeViewController:didChooseAutomationType:", self, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFAutomationSelectTypeViewController triggerForIndexPath:](self, "triggerForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFAutomationSelectTypeViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectTypeViewController:didChooseTrigger:", self, v8);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;

  v6 = a3;
  -[WFAutomationSelectTypeViewController currentSections](self, "currentSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("homePlatter"));

  if (v10)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD728], "extraProminentInsetGroupedHeaderConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Home Automation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v13);

    v14 = 8.0;
    v15 = 8.0;
    v16 = 12.0;
LABEL_9:
    objc_msgSend(v12, "setDirectionalLayoutMargins:", v14, v15, v16, 8.0);
    objc_msgSend(v11, "setContentConfiguration:", v12);

    goto LABEL_10;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("triggerTypes"));

  v11 = 0;
  if (!a4 && v18)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD728], "extraProminentInsetGroupedHeaderConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Personal Automation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v19);

    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "idiom");

    if (v21 > 4)
      v22 = CFSTR("An automation that runs on your device.");
    else
      v22 = *(&off_24E604F78 + v21);
    WFLocalizedString(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v23);

    v14 = 8.0;
    v15 = 8.0;
    v16 = 14.0;
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)currentSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  -[WFAutomationSelectTypeViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isActive") & 1) != 0)
  {
    -[WFAutomationSelectTypeViewController searchController](self, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[WFAutomationSelectTypeViewController searchController](self, "searchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAutomationSelectTypeViewController tableContent](self, "tableContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __55__WFAutomationSelectTypeViewController_currentSections__block_invoke;
      v15[3] = &unk_24E604228;
      v16 = v10;
      v12 = v10;
      objc_msgSend(v11, "if_compactMap:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {

  }
  -[WFAutomationSelectTypeViewController tableContent](self, "tableContent");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)triggerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFAutomationSelectTypeViewController currentSections](self, "currentSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggerClasses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

  if (v8 == (id)objc_opt_class())
  {
    -[WFAutomationSelectTypeViewController availableFocusModes](self, "availableFocusModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v4, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4148]), "initWithActivity:", v11);
  }
  else
  {
    v9 = (void *)objc_opt_new();
  }

  return v9;
}

- (id)allTriggerTypeGroups
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  uint64_t v33;
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[10];

  v36[8] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BEC4728]);

  if (v5)
    objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x24BEC4730]);

  if (v7)
    objc_msgSend(v3, "addObject:", objc_opt_class());
  v8 = (void *)objc_opt_new();
  -[WFAutomationSelectTypeViewController availableFocusModes](self, "availableFocusModes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 1)
  {
    v11 = v10;
    do
    {
      objc_msgSend(v8, "addObject:", objc_opt_class());
      --v11;
    }
    while (v11);
  }
  v25 = v10;
  v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v24;
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v13;
  v36[2] = v3;
  v26 = v3;
  v33 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v14;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v15;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v16;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v17;
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v12, "initWithArray:", v19);

  if (v25 > 0)
    objc_msgSend(v20, "addObject:", v8);
  v28 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

  v27 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "insertObject:atIndex:", v22, 3);

  return v20;
}

- (id)buildTableContent
{
  NSArray *v3;
  NSArray *availableFocusModes;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC3D40], "availableModesForAutomationsDisplay");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableFocusModes = self->_availableFocusModes;
  self->_availableFocusModes = v3;

  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFAutomationSelectTypeViewController allTriggerTypeGroups](self, "allTriggerTypeGroups", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "if_objectsPassingTest:", &__block_literal_global_171);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v22[0] = CFSTR("sectionIdentifier");
          v22[1] = CFSTR("triggerClasses");
          v23[0] = CFSTR("triggerTypes");
          v23[1] = v11;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  v20 = CFSTR("sectionIdentifier");
  v21 = CFSTR("homePlatter");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v3;

  -[WFAutomationSelectTypeViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (WFAutomationSelectTypeViewControllerDelegate)delegate
{
  return (WFAutomationSelectTypeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (NSArray)tableContent
{
  return self->_tableContent;
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (NSArray)availableFocusModes
{
  return self->_availableFocusModes;
}

- (void)setAvailableFocusModes:(id)a3
{
  objc_storeStrong((id *)&self->_availableFocusModes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableFocusModes, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __57__WFAutomationSelectTypeViewController_buildTableContent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSupportedOnThisDevice");
}

id __55__WFAutomationSelectTypeViewController_currentSections__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("triggerTypes"));

  if (v5)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("triggerClasses"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__WFAutomationSelectTypeViewController_currentSections__block_invoke_2;
    v12[3] = &unk_24E604200;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v7, "if_objectsPassingTest:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("triggerClasses"));
      v9 = v6;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    WFLocalizedString(CFSTR("Home"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32)))
      v10 = v3;
    else
      v10 = 0;
    v9 = v10;

  }
  return v9;
}

uint64_t __55__WFAutomationSelectTypeViewController_currentSections__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "localizedDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __66__WFAutomationSelectTypeViewController_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

+ (unint64_t)automationTypeForHomeManager:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "homesToWhichWeHaveAdminAccess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "homesToWhichWeCanAddHomeAutomations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      v8 = 1;
    else
      v8 = 3;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

+ (id)allKnownTriggersSortedAsInUI
{
  WFAutomationSelectTypeViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(WFAutomationSelectTypeViewController);
  objc_msgSend(MEMORY[0x24BEC3D40], "availableModesForAutomationsDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSelectTypeViewController setAvailableFocusModes:](v2, "setAvailableFocusModes:", v3);

  -[WFAutomationSelectTypeViewController allTriggerTypeGroups](v2, "allTriggerTypeGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_flatMap:", &__block_literal_global_12176);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __68__WFAutomationSelectTypeViewController_allKnownTriggersSortedAsInUI__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end
