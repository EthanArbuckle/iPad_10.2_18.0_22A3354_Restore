@implementation WFTriggerTableViewController

- (WFTriggerTableViewController)initWithOptions:(id)a3 anySelected:(BOOL)a4 nameOfAnyOption:(id)a5 mainSectionTitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFTriggerTableViewController *v14;
  uint64_t v15;
  NSArray *options;
  uint64_t v17;
  NSString *nameOfAnyOption;
  uint64_t v19;
  NSString *mainSectionTitle;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *sections;
  WFTriggerTableViewController *v34;
  void *v36;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerTableViewController.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v37.receiver = self;
  v37.super_class = (Class)WFTriggerTableViewController;
  v14 = -[WFTriggerTableViewController initWithStyle:](&v37, sel_initWithStyle_, 2);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    options = v14->_options;
    v14->_options = (NSArray *)v15;

    v14->_anyOptionSelected = a4;
    v17 = objc_msgSend(v12, "copy");
    nameOfAnyOption = v14->_nameOfAnyOption;
    v14->_nameOfAnyOption = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    mainSectionTitle = v14->_mainSectionTitle;
    v14->_mainSectionTitle = (NSString *)v19;

    -[WFTriggerTableViewController navigationItem](v14, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v14, sel_cancel_);
    objc_msgSend(v21, "setLeftBarButtonItem:", v22);

    -[WFTriggerTableViewController navigationItem](v14, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v14, sel_done_);
    objc_msgSend(v23, "setRightBarButtonItem:", v24);

    v25 = (void *)objc_opt_new();
    if (v12)
    {
      v40[1] = CFSTR("cellIdentifier");
      v41[0] = CFSTR("anyOption");
      v40[0] = CFSTR("identifier");
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v28);

    }
    v38[1] = CFSTR("cellIdentifier");
    v39[0] = CFSTR("options");
    v38[0] = CFSTR("identifier");
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v31);

    v32 = objc_msgSend(v25, "copy");
    sections = v14->_sections;
    v14->_sections = (NSArray *)v32;

    v34 = v14;
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFTriggerTableViewController;
  -[WFTriggerTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[WFTriggerTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTriggerTableViewController;
  -[WFTriggerTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFTriggerTableViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
}

- (id)infoForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFTriggerTableViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFTriggerTableViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int64_t v9;

  -[WFTriggerTableViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("options"));

  if (v7)
  {
    -[WFTriggerTableViewController options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 1;
  }

  return v9;
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
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v6 = a4;
  v7 = a3;
  -[WFTriggerTableViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("anyOption"));

  if (v12)
  {
    -[WFTriggerTableViewController nameOfAnyOption](self, "nameOfAnyOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    if (-[WFTriggerTableViewController anyOptionSelected](self, "anyOptionSelected"))
      objc_msgSend(v10, "setAccessoryType:", 3);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("options"));

    if (v16)
    {
      -[WFTriggerTableViewController options](self, "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "displayTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      if (-[WFTriggerTableViewController anyOptionSelected](self, "anyOptionSelected"))
      {
        v21 = 0;
      }
      else if (objc_msgSend(v18, "isSelected"))
      {
        v21 = 3;
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v10, "setAccessoryType:", v21);

    }
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[WFTriggerTableViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("options"));

  if (v7)
  {
    -[WFTriggerTableViewController mainSectionTitle](self, "mainSectionTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerTableViewController infoForSection:](self, "infoForSection:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFTriggerTableViewController tableView:didSelectRowAtIndexPath:]";
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("anyOption"));

  if (v12)
  {
    -[WFTriggerTableViewController setAnyOptionSelected:](self, "setAnyOptionSelected:", 1);
    objc_msgSend(v8, "setAccessoryType:", 3);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[WFTriggerTableViewController options](self, "options", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setSelected:", 0);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }
    goto LABEL_17;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("options"));

  if (v19)
  {
    -[WFTriggerTableViewController setAnyOptionSelected:](self, "setAnyOptionSelected:", 0);
    -[WFTriggerTableViewController options](self, "options");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSelected:", objc_msgSend(v13, "isSelected") ^ 1);
    if (objc_msgSend(v13, "isSelected"))
      v21 = 3;
    else
      v21 = 0;
    objc_msgSend(v8, "setAccessoryType:", v21);
LABEL_17:

  }
  -[WFTriggerTableViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
  -[WFTriggerTableViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reloadData");

}

- (void)updateDoneButtonEnabledState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[WFTriggerTableViewController anyOptionSelected](self, "anyOptionSelected"))
  {
    v3 = 1;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[WFTriggerTableViewController options](self, "options", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isSelected") & 1) != 0)
          {
            v3 = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  -[WFTriggerTableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

}

- (void)cancel:(id)a3
{
  id v4;

  -[WFTriggerTableViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerTableViewControllerDidCancel:", self);

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[WFTriggerTableViewController anyOptionSelected](self, "anyOptionSelected", a3))
  {
    v6 = 0;
  }
  else
  {
    -[WFTriggerTableViewController options](self, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_7946);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[WFTriggerTableViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerTableViewController:didFinishWithAnySelected:orSelectedOptions:", self, -[WFTriggerTableViewController anyOptionSelected](self, "anyOptionSelected"), v6);

}

- (WFTriggerTableViewControllerDelegate)delegate
{
  return (WFTriggerTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)anyOptionSelected
{
  return self->_anyOptionSelected;
}

- (void)setAnyOptionSelected:(BOOL)a3
{
  self->_anyOptionSelected = a3;
}

- (NSString)nameOfAnyOption
{
  return self->_nameOfAnyOption;
}

- (NSString)mainSectionTitle
{
  return self->_mainSectionTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSectionTitle, 0);
  objc_storeStrong((id *)&self->_nameOfAnyOption, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __37__WFTriggerTableViewController_done___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "isSelected"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end
