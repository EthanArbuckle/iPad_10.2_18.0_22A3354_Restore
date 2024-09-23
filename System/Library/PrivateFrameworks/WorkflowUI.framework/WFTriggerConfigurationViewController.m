@implementation WFTriggerConfigurationViewController

- (WFTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFTriggerConfigurationViewController *v8;
  WFTriggerConfigurationViewController *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  WFTriggerConfigurationViewController *v16;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_trigger, a3);
    v9->_mode = a4;
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "localizedDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController setTitle:](v9, "setTitle:", v10);

      v11 = objc_alloc(MEMORY[0x24BEBD410]);
      v12 = CFSTR("Done");
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x24BEBD410]);
      v12 = CFSTR("Next");
    }
    WFLocalizedString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 2, v9, sel_finish);
    -[WFTriggerConfigurationViewController navigationItem](v9, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v14);

    -[WFTriggerConfigurationViewController updateNextButtonEnabledState](v9, "updateNextButtonEnabledState");
    v16 = v9;
  }

  return v9;
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  UITableView *tableView;
  UITableView *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UITableView setDataSource:](v4, "setDataSource:", self);
  -[UITableView setDelegate:](v4, "setDelegate:", self);
  -[UITableView setRowHeight:](v4, "setRowHeight:", *MEMORY[0x24BEBE770]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WFTriggerConfigurationViewController tableViewCellClasses](self, "tableViewCellClasses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(objc_class **)(*((_QWORD *)&v20 + 1) + 8 * i);
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

  v15 = objc_opt_class();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v15, v17);

  tableView = self->_tableView;
  self->_tableView = v4;
  v19 = v4;

  -[WFTriggerConfigurationViewController setView:](self, "setView:", v19);
}

- (void)updateNextButtonEnabledState
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasValidConfiguration");

  v5 = -[WFTriggerConfigurationViewController mode](self, "mode");
  -[WFTriggerConfigurationViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setHidesBackButton:", v4 ^ 1);
  }
  else
  {
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v4);

  }
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTriggerConfigurationViewController;
  -[WFTriggerConfigurationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)dismiss:(id)a3
{
  id v3;
  id v4;

  -[WFTriggerConfigurationViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (id)configureAdditionalCellsIfNeeded:(id)a3 indexPath:(id)a4 sectionInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerConfigurationViewController.m"), 95, CFSTR("No cell provided for configuing run immediately"));

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("runImmediately"));

  if (!v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("runRepeatedly"));

    if (!v18 || !_os_feature_enabled_impl())
      goto LABEL_22;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("items"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    objc_msgSend(v9, "setAccessoryType:", 0);
    if ((objc_msgSend(v10, "row") || -[WFTriggerConfigurationViewController shouldRecur](self, "shouldRecur"))
      && (objc_msgSend(v10, "row") != 1 || !-[WFTriggerConfigurationViewController shouldRecur](self, "shouldRecur")))
    {
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("items"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v9, "setAccessoryType:", 0);
  if (!objc_msgSend(v10, "row") && !-[WFTriggerConfigurationViewController runImmediately](self, "runImmediately")
    || objc_msgSend(v10, "row") == 1 && -[WFTriggerConfigurationViewController runImmediately](self, "runImmediately"))
  {
LABEL_8:
    objc_msgSend(v9, "setAccessoryType:", 3);
LABEL_22:
    v29 = v9;
    goto LABEL_23;
  }
  if (objc_msgSend(v10, "row") != 2 || !-[WFTriggerConfigurationViewController runImmediately](self, "runImmediately"))
    goto LABEL_22;
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dequeueReusableCellWithIdentifier:forIndexPath:", v24, v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setSelectionStyle:", 0);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("items"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "textLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v27);

  v29 = v25;
  if (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v32 = v30;

  objc_msgSend(v32, "switchControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setOn:", -[WFTriggerConfigurationViewController shouldNotify](self, "shouldNotify"));
  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel_notifySwitchChanged_, 4096);

LABEL_23:
  return v29;
}

- (void)didSelectRowAtIndexPath:(id)a3 withSectionInfo:(id)a4
{
  id v6;
  void *v7;
  int v8;
  WFTriggerConfigurationViewController *v9;
  uint64_t v10;
  void *v11;
  int v12;
  WFTriggerConfigurationViewController *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("runImmediately"));

  if (v8)
  {
    if (objc_msgSend(v16, "row"))
    {
      v9 = self;
      v10 = 1;
    }
    else
    {
      v9 = self;
      v10 = 0;
    }
    -[WFTriggerConfigurationViewController setRunImmediately:](v9, "setRunImmediately:", v10);
LABEL_12:
    -[WFTriggerConfigurationViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadData");

    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("runRepeatedly"));

  if (v12 && _os_feature_enabled_impl())
  {
    if (objc_msgSend(v16, "row"))
    {
      v13 = self;
      v14 = 1;
    }
    else
    {
      v13 = self;
      v14 = 0;
    }
    -[WFTriggerConfigurationViewController setShouldRecur:](v13, "setShouldRecur:", v14);
    goto LABEL_12;
  }
LABEL_13:

}

- (int64_t)numberOfRowsInSectionWithInfo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("runImmediately"));

  if (v5
    || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("runRepeatedly")),
        v6,
        v7)
    && _os_feature_enabled_impl())
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("items"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    v10 = objc_msgSend(v11, "count");
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)sections
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  -[WFTriggerConfigurationViewController customSections](self, "customSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    WFLocalizedString(CFSTR("Run After Confirmation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    WFLocalizedString(CFSTR("Run Immediately"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithArray:", v10);

    if (-[WFTriggerConfigurationViewController runImmediately](self, "runImmediately"))
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend((id)objc_opt_class(), "requiresNotification");

      if ((v13 & 1) == 0)
      {
        WFLocalizedString(CFSTR("Notify When Run"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v14);

      }
    }
    v29[0] = CFSTR("runImmediately");
    v28[0] = CFSTR("identifier");
    v28[1] = CFSTR("cellIdentifier");
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = CFSTR("items");
    v29[1] = v16;
    v29[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

    if (_os_feature_enabled_impl())
    {
      v27[0] = CFSTR("runRepeatedly");
      v26[0] = CFSTR("identifier");
      v26[1] = CFSTR("cellIdentifier");
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v19;
      v26[2] = CFSTR("items");
      WFLocalizedString(CFSTR("Run Just Once"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v20;
      WFLocalizedString(CFSTR("Run Every Time"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v23);

    }
  }
  return v4;
}

- (id)tableViewCellClasses
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override tableViewCellClasses"));
  __break(1u);
  return result;
}

- (id)customSections
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override custom sections"));
  __break(1u);
  return result;
}

- (void)notifySwitchChanged:(id)a3
{
  -[WFTriggerConfigurationViewController setShouldNotify:](self, "setShouldNotify:", objc_msgSend(a3, "isOn"));
}

- (void)recurSwitchChanged:(id)a3
{
  -[WFTriggerConfigurationViewController setShouldRecur:](self, "setShouldRecur:", objc_msgSend(a3, "isOn"));
}

- (void)finish
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasValidConfiguration");

  if (v4)
  {
    -[WFTriggerConfigurationViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerConfigurationViewController:didFinishWithTrigger:", self, v5);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    -[WFTriggerConfigurationViewController tableViewHeaderString](self, "tableViewHeaderString", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WFAutomationTableSectionHeaderViewWithTitle(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableViewHeaderString
{
  return WFLocalizedString(CFSTR("When"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id result;

  v5 = a3;
  v6 = a4;
  result = (id)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override [WFTriggerConfigurationViewController tableView:cellForRowAtIndexPath:]"));
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4;
  int64_t result;

  v4 = a3;
  result = objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override [WFTriggerConfigurationViewController tableView:numberOfRowsInSection:]"));
  __break(1u);
  return result;
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
}

- (WFTriggerConfigurationViewControllerDelegate)delegate
{
  return (WFTriggerConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)runImmediately
{
  return self->_runImmediately;
}

- (void)setRunImmediately:(BOOL)a3
{
  self->_runImmediately = a3;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

- (BOOL)shouldRecur
{
  return self->_shouldRecur;
}

- (void)setShouldRecur:(BOOL)a3
{
  self->_shouldRecur = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trigger, 0);
}

+ (Class)viewControllerClassForTriggerClass:(Class)a3
{
  objc_class *v3;
  void *v6;
  void *v7;
  Class v8;
  Class v9;
  Class v10;

  v3 = a3;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTriggerConfigurationViewController.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[triggerClass isSubclassOfClass:[WFTrigger class]]"));
  while (1)
  {

LABEL_4:
    if (v3 == (objc_class *)objc_opt_class())
    {
      v10 = 0;
      return v10;
    }
    NSStringFromClass(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("ConfigurationViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = NSClassFromString((NSString *)v6);
    if (v8)
    {
      v9 = v8;
      if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", a1))
        break;
    }
    v3 = (objc_class *)-[objc_class superclass](v3, "superclass");
  }
  v10 = v9;

  return v10;
}

@end
