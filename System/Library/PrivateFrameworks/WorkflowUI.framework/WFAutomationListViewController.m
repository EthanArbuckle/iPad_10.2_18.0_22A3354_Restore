@implementation WFAutomationListViewController

- (WFAutomationListViewController)initWithDatabase:(id)a3
{
  id v5;
  WFAutomationListViewController *v6;
  WFAutomationListViewController *v7;
  NSArray *sortedPersonalAutomations;
  NSArray *v9;
  NSArray *tableSections;
  WFAutomationListViewController *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFAutomationListViewController;
  v6 = -[WFAutomationListViewController initWithStyle:](&v13, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    sortedPersonalAutomations = v7->_sortedPersonalAutomations;
    v9 = (NSArray *)MEMORY[0x24BDBD1A8];
    v7->_sortedPersonalAutomations = (NSArray *)MEMORY[0x24BDBD1A8];

    tableSections = v7->_tableSections;
    v7->_tableSections = v9;

    v11 = v7;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)WFAutomationListViewController;
  -[WFAutomationListViewController loadView](&v22, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationListViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = *MEMORY[0x24BEBE770];
  -[WFAutomationListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", v5);

  -[WFAutomationListViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", 8.0, 0.0, 0.0, 0.0);

  -[WFAutomationListViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedRowHeight:", 100.0);

  -[WFAutomationListViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSeparatorInset:", 0.0, 124.0, 0.0, 0.0);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(objc_class **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        -[WFAutomationListViewController tableView](self, "tableView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v12);
  }

  -[WFAutomationListViewController updateTableViewLayoutMargins](self, "updateTableViewLayoutMargins");
}

- (void)viewDidLoad
{
  WFTriggerManager *v3;
  WFTriggerManager *triggerManager;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAutomationListViewController;
  -[WFAutomationListViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (WFTriggerManager *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4108]), "initWithDatabase:", self->_database);
  triggerManager = self->_triggerManager;
  self->_triggerManager = v3;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAutomationListViewController;
  -[WFAutomationListViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[WFAutomationListViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

}

- (void)updateTableViewLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[UIViewController wf_contentLayoutMargins](self, "wf_contentLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFAutomationListViewController tableView](self, "tableView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", v4, v6, v8, v10);

}

- (void)updateUIWithConfiguredTriggers:(id)a3 homeTriggers:(id)a4
{
  id v5;

  -[WFAutomationListViewController buildTableSectionsWithConfiguredTriggers:homeTriggers:](self, "buildTableSectionsWithConfiguredTriggers:homeTriggers:", a3, a4);
  -[WFAutomationListViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)flashAutomationForTriggerID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_time_t v21;
  void *v22;
  _QWORD block[5];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutomationListViewController.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerID"));

  }
  -[WFAutomationListViewController database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredTriggerForTriggerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFAutomationListViewController sortedPersonalAutomations](self, "sortedPersonalAutomations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      goto LABEL_12;
    v10 = 0;
    while (1)
    {
      -[WFAutomationListViewController sortedPersonalAutomations](self, "sortedPersonalAutomations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v5);

      if ((v14 & 1) != 0)
        break;
      ++v10;
      -[WFAutomationListViewController sortedPersonalAutomations](self, "sortedPersonalAutomations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v10 >= v16)
        goto LABEL_12;
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v10, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationListViewController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "selectRowAtIndexPath:animated:scrollPosition:", v19, 0, 2);

      v21 = dispatch_time(0, 600000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__WFAutomationListViewController_flashAutomationForTriggerID___block_invoke;
      block[3] = &unk_24E604E80;
      block[4] = self;
      v24 = v19;
      v17 = v19;
      dispatch_after(v21, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
LABEL_12:
      getWFTriggersLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFAutomationListViewController flashAutomationForTriggerID:]";
        v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_22007E000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't find indexPath for configuredTrigger: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFAutomationListViewController flashAutomationForTriggerID:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_22007E000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't find configuredTrigger for triggerID: %@", buf, 0x16u);
    }
  }

}

- (void)buildTableSectionsWithConfiguredTriggers:(id)a3 homeTriggers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  WFAutomationListViewController *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _BYTE v42[128];
  _QWORD v43[4];
  _QWORD v44[4];
  __int128 buf;
  uint64_t (*v46)(uint64_t, void *, void *);
  void *v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = CFSTR("items");
  if (objc_msgSend(v6, "count"))
  {
    v10 = v6;
    +[WFAutomationSelectTypeViewController allKnownTriggersSortedAsInUI](WFAutomationSelectTypeViewController, "allKnownTriggersSortedAsInUI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v46 = __WFAutomationsSortForUI_block_invoke;
    v47 = &unk_24E603310;
    v48 = v11;
    v12 = v11;
    objc_msgSend(v10, "sortedArrayUsingComparator:", &buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAutomationListViewController setSortedPersonalAutomations:](self, "setSortedPersonalAutomations:", v13);
    v43[0] = CFSTR("title");
    WFLocalizedString(CFSTR("Personal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v14;
    v43[1] = CFSTR("cellIdentifier");
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v16;
    v43[2] = CFSTR("items");
    -[WFAutomationListViewController sortedPersonalAutomations](self, "sortedPersonalAutomations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = CFSTR("isEditable");
    v44[2] = v17;
    v44[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18);

  }
  if (objc_msgSend(v7, "count"))
  {
    v34 = self;
    v35 = v6;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v7;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          v24 = v9;
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v25, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "home");
            v28 = objc_claimAutoreleasedReturnValue();

            v40[0] = CFSTR("title");
            -[NSObject name](v28, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = v29;
            v40[1] = CFSTR("cellIdentifier");
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v41[1] = v31;
            v41[2] = v28;
            v40[2] = CFSTR("home");
            v40[3] = v24;
            v40[4] = CFSTR("isEditable");
            v41[3] = v25;
            v41[4] = MEMORY[0x24BDBD1C8];
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 5);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v32);

            v9 = v24;
          }
          else
          {
            getWFTriggersLogObject();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              LODWORD(buf) = 136315138;
              *(_QWORD *)((char *)&buf + 4) = "-[WFAutomationListViewController buildTableSectionsWithConfiguredTriggers:homeTriggers:]";
              _os_log_impl(&dword_22007E000, v28, OS_LOG_TYPE_FAULT, "%s Was given an empty array of home triggers", (uint8_t *)&buf, 0xCu);
            }
            v9 = v24;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v21);
    }

    self = v34;
    v6 = v35;
    v7 = v33;
  }
  -[WFAutomationListViewController setTableSections:](self, "setTableSections:", v8);

}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
      objc_msgSend(v9, "workflowID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[WFAutomationListViewController database](self, "database");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "referenceForWorkflowID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x24BEC41B0];
          -[WFAutomationListViewController database](self, "database");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          objc_msgSend(v13, "workflowWithReference:database:error:", v12, v14, &v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v20;

          if (v15)
          {
LABEL_19:
            -[NSObject setConfiguredTrigger:workflow:delegate:](v8, "setConfiguredTrigger:workflow:delegate:", v9, v15, self);

            goto LABEL_20;
          }
LABEL_16:
          getWFTriggersLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "workflowID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v22 = "-[WFAutomationListViewController configureCell:forItem:]";
            v23 = 2112;
            v24 = v19;
            v25 = 2112;
            v26 = v9;
            v27 = 2114;
            v28 = v16;
            _os_log_impl(&dword_22007E000, v18, OS_LOG_TYPE_ERROR, "%s Failed to fetch workflow (%@) for trigger (%@): %{public}@", buf, 0x2Au);

          }
          v15 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        v12 = 0;
      }
      v16 = 0;
      goto LABEL_16;
    }
    getHFTriggerItemClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject setHomeTrigger:](v8, "setHomeTrigger:", v7);
    }
    else
    {
      getWFTriggersLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[WFAutomationListViewController configureCell:forItem:]";
        v23 = 2114;
        v24 = v7;
        _os_log_impl(&dword_22007E000, v17, OS_LOG_TYPE_ERROR, "%s Unexpected item (%{public}@)", buf, 0x16u);
      }

    }
  }
  else
  {
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[WFAutomationListViewController configureCell:forItem:]";
      v23 = 2114;
      v24 = v6;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_ERROR, "%s Unexpected cell (%{public}@) and/or item (%{public}@)", buf, 0x20u);
    }
  }
LABEL_20:

}

- (BOOL)showEditViewForItem:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[WFAutomationListViewController showPersonalAutomationEditorForConfiguredTrigger:](self, "showPersonalAutomationEditorForConfiguredTrigger:", v4);
  }
  else
  {
    getHFTriggerItemClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[WFAutomationListViewController showHomeAutomationEditorForTriggerItem:](self, "showHomeAutomationEditorForTriggerItem:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)showPersonalAutomationEditorForConfiguredTrigger:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  WFEditAutomationCoordinator *v12;
  void *v13;
  void *v14;
  WFEditAutomationCoordinator *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  _QWORD block[5];
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutomationListViewController.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

  }
  objc_msgSend(v5, "workflowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFAutomationListViewController database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workflowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "referenceForWorkflowID:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WFAutomationListViewController database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v9, "recordWithDescriptor:error:", v5, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;

  if (v10)
  {
    v12 = [WFEditAutomationCoordinator alloc];
    -[WFAutomationListViewController database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFEditAutomationCoordinator initWithDatabase:triggerRecord:triggerIdentifier:workflowReference:](v12, "initWithDatabase:triggerRecord:triggerIdentifier:workflowReference:", v13, v10, v14, v6);
    -[WFAutomationListViewController setEditAutomationCoordinator:](self, "setEditAutomationCoordinator:", v15);

    -[WFAutomationListViewController editAutomationCoordinator](self, "editAutomationCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

    -[WFAutomationListViewController editAutomationCoordinator](self, "editAutomationCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "start");
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = v18 != 0;
    if (v18)
    {
      -[NSObject setModalPresentationStyle:](v18, "setModalPresentationStyle:", 2);
      -[NSObject presentationController](v18, "presentationController");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        -[NSObject setDelegate:](v20, "setDelegate:", self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__WFAutomationListViewController_showPersonalAutomationEditorForConfiguredTrigger___block_invoke;
      block[3] = &unk_24E604E80;
      block[4] = self;
      v25 = v18;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      getWFTriggersLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFAutomationListViewController showPersonalAutomationEditorForConfiguredTrigger:]";
        _os_log_impl(&dword_22007E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to start the edit coordinator", buf, 0xCu);
      }
    }

  }
  else
  {
    getWFTriggersLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[WFAutomationListViewController showPersonalAutomationEditorForConfiguredTrigger:]";
      v29 = 2112;
      v30 = v5;
      v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_22007E000, v18, OS_LOG_TYPE_ERROR, "%s Failed to get trigger record from descriptor (%@): %{public}@", buf, 0x20u);
    }
    v19 = 0;
  }

  return v19;
}

- (void)automationListCell:(id)a3 didUpdateNotificationsEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WFAutomationListViewController database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredTrigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "recordWithDescriptor:error:", v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
  {
    objc_msgSend(v9, "setShouldNotify:", v4);
    -[WFAutomationListViewController triggerManager](self, "triggerManager");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuredTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject updateConfiguredTrigger:triggerID:notifyDaemon:completion:](v11, "updateConfiguredTrigger:triggerID:notifyDaemon:completion:", v9, v13, 0, &__block_literal_global_754);

LABEL_5:
    goto LABEL_6;
  }
  getWFTriggersLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v6, "configuredTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "-[WFAutomationListViewController automationListCell:didUpdateNotificationsEnabled:]";
    v17 = 2112;
    v18 = v12;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_22007E000, v11, OS_LOG_TYPE_FAULT, "%s Failed to get trigger record from descriptor (%@): %{public}@", buf, 0x20u);
    goto LABEL_5;
  }
LABEL_6:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFAutomationListViewController tableSections](self, "tableSections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[WFAutomationListViewController tableSections](self, "tableSections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[WFAutomationListViewController tableSections](self, "tableSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("items"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAutomationListViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAutomationListViewController configureCell:forItem:](self, "configureCell:forItem:", v12, v10);
  return v12;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[WFAutomationListViewController tableSections](self, "tableSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isEditable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "BOOLValue");

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a4 == 1)
  {
    v6 = a5;
    -[WFAutomationListViewController tableSections](self, "tableSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "row");

    objc_msgSend(v9, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      objc_msgSend(v12, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        getWFTriggersLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[WFAutomationListViewController tableView:commitEditingStyle:forRowAtIndexPath:]";
          v25 = 2112;
          v26 = v12;
          _os_log_impl(&dword_22007E000, v17, OS_LOG_TYPE_ERROR, "%s failed to get triggerID from WFConfiguredTrigger: %@", buf, 0x16u);
        }
        goto LABEL_8;
      }
      v14 = (void *)v13;
      -[WFAutomationListViewController triggerManager](self, "triggerManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v21[3] = &unk_24E6049E8;
      v16 = &v22;
      v22 = v14;
      v17 = v14;
      objc_msgSend(v15, "deleteTriggerWithIdentifier:notifyDaemon:completion:", v17, 1, v21);
    }
    else
    {
      getHFTriggerItemClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_9:

        return;
      }
      v18 = v11;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("home"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trigger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_149;
      v19[3] = &unk_24E6032A8;
      v16 = (id *)v20;
      v20[0] = v18;
      v20[1] = self;
      v17 = v18;
      objc_msgSend(v12, "removeTrigger:completionHandler:", v15, v19);
    }

LABEL_8:
    goto LABEL_9;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[WFAutomationListViewController tableSections](self, "tableSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WFAutomationListViewController showEditViewForItem:](self, "showEditViewForItem:", v8))
  {
    -[WFAutomationListViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v10, 1);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[WFAutomationListViewController tableSections](self, "tableSections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setDirectionalLayoutMargins:", 4.0, 0.0, 10.0, 0.0);
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE248]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontWithDescriptor:size:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v13);

    objc_msgSend(v9, "setText:", v7);
    objc_msgSend(v8, "addSubview:", v9);
    objc_msgSend(v8, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v9, "wf_addConstraintsToFillLayoutGuide:", v14);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  -[WFAutomationListViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 0);

}

- (void)editAutomationCoordinatorDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFAutomationListViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);

  -[WFAutomationListViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)editAutomationCoordinatorDidCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFAutomationListViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationListViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)showHomeAutomationEditorForTriggerItem:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  Class HFTriggerBuilderClass;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutomationListViewController.m"), 403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerItem"));

  }
  objc_msgSend(v5, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v5 || !v6 || !v7)
  {
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFAutomationListViewController showHomeAutomationEditorForTriggerItem:]";
      v26 = 2114;
      v27 = v5;
      _os_log_impl(&dword_22007E000, v11, OS_LOG_TYPE_ERROR, "%s Missing home or trigger from triggerItem: %{public}@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  HFTriggerBuilderClass = getHFTriggerBuilderClass();
  getHUTriggerBuilderContextClass();
  v10 = (void *)objc_opt_new();
  -[objc_class triggerBuilderForTrigger:inHome:context:](HFTriggerBuilderClass, "triggerBuilderForTrigger:inHome:context:", v6, v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    getWFTriggersLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFAutomationListViewController showHomeAutomationEditorForTriggerItem:]";
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_22007E000, v21, OS_LOG_TYPE_ERROR, "%s Could not create HFTriggerBuilder for trigger: %@", buf, 0x16u);
    }

    v11 = 0;
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v12 = objc_alloc(getHUTriggerSummaryViewControllerClass());
  v13 = (void *)objc_msgSend(objc_alloc(getHUTriggerActionFlowClass()), "initWithFlowState:", 3);
  v14 = (void *)objc_msgSend(v12, "initWithTriggerBuilder:flow:delegate:", v11, v13, self);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v14);
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTintColor:", v16);

  objc_msgSend(v15, "setModalPresentationStyle:", 2);
  objc_msgSend(v15, "presentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v18, "setDelegate:", self);
  v20 = 1;
  -[WFAutomationListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

LABEL_16:
  return v20;
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__WFAutomationListViewController_triggerEditor_didFinishWithTriggerBuilder___block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (WFDatabase)database
{
  return self->_database;
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_triggerManager, a3);
}

- (NSArray)tableSections
{
  return self->_tableSections;
}

- (void)setTableSections:(id)a3
{
  objc_storeStrong((id *)&self->_tableSections, a3);
}

- (NSArray)sortedPersonalAutomations
{
  return self->_sortedPersonalAutomations;
}

- (void)setSortedPersonalAutomations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (WFEditAutomationCoordinator)editAutomationCoordinator
{
  return self->_editAutomationCoordinator;
}

- (void)setEditAutomationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_editAutomationCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editAutomationCoordinator, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_sortedPersonalAutomations, 0);
  objc_storeStrong((id *)&self->_tableSections, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

void __76__WFAutomationListViewController_triggerEditor_didFinishWithTriggerBuilder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v3, 1);

}

void __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[WFAutomationListViewController tableView:commitEditingStyle:forRowAtIndexPath:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete triggerID (%@) error: %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFTriggersLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "trigger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v8 = "-[WFAutomationListViewController tableView:commitEditingStyle:forRowAtIndexPath:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete home trigger (%@) error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_150;
    block[3] = &unk_24E604D88;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __81__WFAutomationListViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_150(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

void __83__WFAutomationListViewController_automationListCell_didUpdateNotificationsEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFAutomationListViewController automationListCell:didUpdateNotificationsEnabled:]_block_invoke";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_22007E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to update configured trigger with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

uint64_t __83__WFAutomationListViewController_showPersonalAutomationEditorForConfiguredTrigger___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __62__WFAutomationListViewController_flashAutomationForTriggerID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);

}

@end
