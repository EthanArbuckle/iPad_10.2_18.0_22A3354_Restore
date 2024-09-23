@implementation WFAutomationSummaryViewController

- (WFAutomationSummaryViewController)initWithTrigger:(id)a3 triggerIdentifier:(id)a4 workflow:(id)a5 mode:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  WFAutomationSummaryViewController *v15;
  WFAutomationSummaryViewController *v16;
  uint64_t v17;
  NSString *triggerIdentifier;
  void *v19;
  void *v20;
  uint64_t v21;
  WFTrigger *trigger;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  WFAutomationSummaryViewController *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutomationSummaryViewController.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerRecord"));

  }
  v32.receiver = self;
  v32.super_class = (Class)WFAutomationSummaryViewController;
  v15 = -[WFAutomationSummaryViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_triggerRecord, a3);
    v17 = objc_msgSend(v13, "copy");
    triggerIdentifier = v16->_triggerIdentifier;
    v16->_triggerIdentifier = (NSString *)v17;

    v19 = (void *)MEMORY[0x24BEC4100];
    objc_msgSend(v12, "triggerData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "triggerWithSerializedData:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    trigger = v16->_trigger;
    v16->_trigger = (WFTrigger *)v21;

    if (!v16->_trigger)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "triggerData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("WFAutomationSummaryViewController.m"), 87, CFSTR("Failed to deserialize trigger from data (%@)"), v31);

    }
    objc_storeStrong((id *)&v16->_workflow, a5);
    v16->_mode = a6;
    v23 = objc_alloc(MEMORY[0x24BEBD410]);
    WFLocalizedString(CFSTR("Done"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithTitle:style:target:action:", v24, 2, v16, sel_didTapDone_);
    -[WFAutomationSummaryViewController navigationItem](v16, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRightBarButtonItem:", v25);

    v27 = v16;
  }

  return v16;
}

- (id)sections
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[3];
  _QWORD v39[3];
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  void *v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[2];
  _QWORD v49[2];
  void *v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[5];

  v58[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (-[WFAutomationSummaryViewController mode](self, "mode") == 1)
  {
    v4 = (void *)MEMORY[0x24BDBCEB8];
    v57[0] = CFSTR("cellTitle");
    WFLocalizedString(CFSTR("Automation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v5;
    v57[1] = CFSTR("cellIdentifier");
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v7;
    v57[2] = CFSTR("cellClass");
    v58[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = WFRunSelectionForTrigger(v10);

    if (!v11)
    {
      -[WFAutomationSummaryViewController trigger](self, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend((id)objc_opt_class(), "requiresNotification");

      if ((v13 & 1) == 0)
      {
        v55[0] = CFSTR("cellTitle");
        WFLocalizedString(CFSTR("Notify When Run"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v14;
        v55[1] = CFSTR("cellIdentifier");
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v16;
        v55[2] = CFSTR("cellClass");
        v56[2] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v17);

      }
    }
    v53[0] = CFSTR("identifier");
    v53[1] = CFSTR("sectionRows");
    v54[0] = CFSTR("runImmediately");
    v54[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  v52[0] = CFSTR("triggerSummary");
  v51[0] = CFSTR("identifier");
  v51[1] = CFSTR("sectionTitle");
  WFLocalizedString(CFSTR("When"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v19;
  v51[2] = CFSTR("sectionRows");
  v48[0] = CFSTR("cellIdentifier");
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = CFSTR("cellClass");
  v49[0] = v21;
  v49[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v47[0] = CFSTR("workflowSummary");
  v46[0] = CFSTR("identifier");
  v46[1] = CFSTR("sectionTitle");
  WFLocalizedString(CFSTR("Do"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v25;
  v46[2] = CFSTR("sectionRows");
  v43[0] = CFSTR("cellIdentifier");
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = CFSTR("cellClass");
  v44[0] = v27;
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v31, "BOOLForKey:", CFSTR("WFShowTestAutomationButton"));

  if ((_DWORD)v27)
  {
    v41[1] = CFSTR("sectionRows");
    v42[0] = CFSTR("testAutomation");
    v41[0] = CFSTR("identifier");
    v39[0] = CFSTR("Test This Automation");
    v38[0] = CFSTR("cellTitle");
    v38[1] = CFSTR("cellIdentifier");
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v33;
    v38[2] = CFSTR("cellClass");
    v39[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

  }
  return v3;
}

- (void)updateUI
{
  id v2;

  -[WFAutomationSummaryViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)loadView
{
  id v3;
  UITableView *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  UITableView *tableView;
  UITableView *v20;
  WFAutomationSummaryViewController *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UITableView setDataSource:](v4, "setDataSource:", self);
  -[UITableView setDelegate:](v4, "setDelegate:", self);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = self;
  -[WFAutomationSummaryViewController sections](self, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sectionRows"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cellClass"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITableView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", v14, v15);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }

  v16 = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", v16, v18);

  tableView = v21->_tableView;
  v21->_tableView = v4;
  v20 = v4;

  -[WFAutomationSummaryViewController setView:](v21, "setView:", v20);
}

- (void)loadActionDescriptionIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[WFAutomationSummaryViewController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSummaryViewController workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 8)
    v8 = 8;
  else
    v8 = v7;
  objc_msgSend(v4, "subarrayWithRange:", 0, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "if_compactMap:", &__block_literal_global_13352);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSummaryViewController setActionIcons:](self, "setActionIcons:", v9);

  -[WFAutomationSummaryViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFAutomationSummaryViewController;
  -[WFAutomationSummaryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFAutomationSummaryViewController loadActionDescriptionIcons](self, "loadActionDescriptionIcons");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAutomationSummaryViewController;
  -[WFAutomationSummaryViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WFAutomationSummaryViewController loadActionDescriptionIcons](self, "loadActionDescriptionIcons");
}

- (id)infoForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFAutomationSummaryViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFAutomationSummaryViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionRows"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

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
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint8_t buf[4];
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sectionRows"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("runImmediately"));

  if (v14)
  {
    objc_msgSend(v12, "setSelectionStyle:", 0);
    if (objc_msgSend(v6, "row"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cellTitle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

      objc_msgSend(v12, "setSelectionStyle:", 0);
      v12 = v12;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v12;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v48 = v17;

      objc_msgSend(v48, "switchControl");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setOn:", objc_msgSend(v50, "shouldNotify"));

      objc_msgSend(v49, "addTarget:action:forControlEvents:", self, sel_notifySwitchChanged_, 4096);
    }
    else
    {
      v12 = v12;
      v37 = v11;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v38 = v12;
        else
          v38 = 0;
      }
      else
      {
        v38 = 0;
      }
      v51 = v38;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cellTitle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "textLabel");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setText:", v52);

      -[WFAutomationSummaryViewController menuForTrigger](self, "menuForTrigger");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMenu:", v54);

      v11 = v37;
    }
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", CFSTR("triggerSummary"));

    if (v19)
    {
      -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "triggerData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "length")
        && (objc_msgSend(MEMORY[0x24BEC4100], "triggerWithSerializedData:", v21),
            (v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v23 = v22;
        -[NSObject displayGlyph](v22, "displayGlyph");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "UIImage");
        v66 = v10;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject displayGlyphTintColor](v23, "displayGlyphTintColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UIColor");
        v68 = v11;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedDescriptionWithConfigurationSummary](v23, "localizedDescriptionWithConfigurationSummary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "configureWithImage:tintColor:title:numberOfLines:withTrigger:", v24, v26, v27, 3, v23);

        v11 = v68;
        v10 = v66;

      }
      else
      {
        getWFTriggersLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v72 = "-[WFAutomationSummaryViewController tableView:cellForRowAtIndexPath:]";
          _os_log_impl(&dword_22007E000, v23, OS_LOG_TYPE_ERROR, "%s Could not deserialize trigger data from record in Automation Summary", buf, 0xCu);
        }
      }

      v39 = -[WFAutomationSummaryViewController mode](self, "mode");
      v40 = v39 != 0;
      if (v39)
        v41 = 3;
      else
        v41 = 0;
      objc_msgSend(v12, "setSelectionStyle:", v41);
      objc_msgSend(v12, "setAccessoryType:", v40);

    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqual:", CFSTR("workflowSummary"));

      if (v29)
      {
        -[WFAutomationSummaryViewController workflow](self, "workflow");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          -[WFAutomationSummaryViewController workflow](self, "workflow");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "hiddenFromLibraryAndSync");

          -[WFAutomationSummaryViewController workflow](self, "workflow");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v32)
          {
            objc_msgSend(v33, "actionsDescription");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAutomationSummaryViewController actionIcons](self, "actionIcons");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "configureWithTitle:actionIcons:", v35, v36);

          }
          else
          {
            objc_msgSend(v33, "name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAutomationSummaryViewController workflow](self, "workflow");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "icon");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "icon");
            v69 = v11;
            v70 = objc_claimAutoreleasedReturnValue();
            v61 = (void *)v70;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
            v62 = v10;
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "configureWithTitle:actionIcons:", v35, v63);

            v10 = v62;
            v11 = v69;

          }
          if (-[WFAutomationSummaryViewController mode](self, "mode"))
          {
            objc_msgSend(v12, "setSelectionStyle:", 3);
            objc_msgSend(v12, "setAccessoryType:", 1);
          }
          else
          {
            objc_msgSend(v12, "setSelectionStyle:", 0);
          }
        }
        else
        {
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, 0);

          objc_msgSend(v55, "setSelectionStyle:", 0);
          objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "textLabel");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setTextColor:", v56);

          WFLocalizedString(CFSTR("Choose…"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "textLabel");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setText:", v58);

          v12 = v55;
        }
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqual:", CFSTR("testAutomation"));

        if (v43)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cellTitle"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textLabel");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setText:", v44);

          objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textLabel");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setTextColor:", v46);

        }
      }
    }
  }

  return v12;
}

- (id)menuForTrigger
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Run After Confirmation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke;
  v25[3] = &unk_24E604660;
  v25[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("confirmation"), v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Don’t Run"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_2;
  v24[3] = &unk_24E604660;
  v24[4] = self;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCEB8];
  v26[0] = v6;
  v26[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAutomationSummaryViewController trigger](self, "trigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically");

  v15 = 0;
  if (v14)
  {
    v16 = (void *)MEMORY[0x24BEBD388];
    WFLocalizedString(CFSTR("Run Immediately"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_3;
    v23[3] = &unk_24E604660;
    v23[4] = self;
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, 0, 0, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "insertObject:atIndex:", v15, 0);
  }
  -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = WFRunSelectionForTrigger(v18);

  v20 = v15;
  if (v19)
  {
    if (v19 == 2)
    {
      v20 = v9;
    }
    else
    {
      v20 = v6;
      if (v19 != 1)
        goto LABEL_9;
    }
  }
  objc_msgSend(v20, "setState:", 1);
LABEL_9:
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFAutomationTableSectionHeaderViewWithTitle(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");

  -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "isEqual:", CFSTR("triggerSummary"));

  if ((_DWORD)v6)
  {
    -[WFAutomationSummaryViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "automationSummaryViewController:editTrigger:", self, v10);
LABEL_8:

    goto LABEL_13;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("workflowSummary"));

  if (v12)
  {
    -[WFAutomationSummaryViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[WFAutomationSummaryViewController workflow](self, "workflow"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "automationSummaryViewControllerChooseShortcut:", self);
      goto LABEL_13;
    }
    -[WFAutomationSummaryViewController workflow](self, "workflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "automationSummaryViewController:editWorkflow:", self, v10);
    goto LABEL_8;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", CFSTR("testAutomation"));

  if (v15)
    -[WFAutomationSummaryViewController testAutomation](self, "testAutomation");
LABEL_14:

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[WFAutomationSummaryViewController infoForSection:](self, "infoForSection:", objc_msgSend(a4, "section", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("workflowSummary"));

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a4 != 1)
    return;
  objc_msgSend(MEMORY[0x24BEC3C20], "defaultDatabase", a3, 1, a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSummaryViewController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workflowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "referenceForWorkflowID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "hiddenFromLibraryAndSync"))
  {
    -[WFAutomationSummaryViewController triggerIdentifier](self, "triggerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configuredTriggerForTriggerID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(v14, "associateWorkflowToTrigger:workflow:error:", v11, 0, 0);
    goto LABEL_9;
  }
  if ((objc_msgSend(v14, "deleteReference:error:", v8, 0) & 1) != 0)
  {
LABEL_9:
    -[WFAutomationSummaryViewController setWorkflow:](self, "setWorkflow:", 0);
    -[WFAutomationSummaryViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

    return;
  }
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[WFAutomationSummaryViewController tableView:commitEditingStyle:forRowAtIndexPath:]";
    _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to delete workflow reference from trigger summary view", buf, 0xCu);
  }

}

- (void)testAutomation
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSummaryViewController triggerIdentifier](self, "triggerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__WFAutomationSummaryViewController_testAutomation__block_invoke;
  v5[3] = &unk_24E6049E8;
  v5[4] = self;
  objc_msgSend(v3, "fireTriggerWithIdentifier:force:completion:", v4, 1, v5);

}

- (void)handleRunSelection:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (a3 == 2)
  {
    -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    if (a3 == 1)
    {
      -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 1;
    }
    else
    {
      if (a3)
        return;
      -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 0;
    }
    objc_msgSend(v4, "setShouldPrompt:", v6);

    -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setEnabled:", v9);

  -[WFAutomationSummaryViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (void)notifySwitchChanged:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "isOn");
  -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldNotify:", v4);

}

- (void)didTapDone:(id)a3
{
  void *v4;
  id v5;

  -[WFAutomationSummaryViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSummaryViewController triggerRecord](self, "triggerRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "automationSummaryViewController:didFinishWithTrigger:", self, v4);

}

- (WFAutomationSummaryViewControllerDelegate)delegate
{
  return (WFAutomationSummaryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFConfiguredTriggerRecord)triggerRecord
{
  return self->_triggerRecord;
}

- (NSString)triggerIdentifier
{
  return self->_triggerIdentifier;
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSArray)actionIcons
{
  return self->_actionIcons;
}

- (void)setActionIcons:(id)a3
{
  objc_storeStrong((id *)&self->_actionIcons, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionIcons, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_triggerIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__WFAutomationSummaryViewController_testAutomation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE19370], "alertWithError:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    WFUserInterfaceFromViewController();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentAlert:", v4);

  }
}

uint64_t __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRunSelection:", 1);
}

uint64_t __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRunSelection:", 2);
}

uint64_t __51__WFAutomationSummaryViewController_menuForTrigger__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRunSelection:", 0);
}

uint64_t __63__WFAutomationSummaryViewController_loadActionDescriptionIcons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "icon");
}

@end
