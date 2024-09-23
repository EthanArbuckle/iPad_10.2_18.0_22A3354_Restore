@implementation WFBluetoothTriggerConfigurationViewController

- (WFBluetoothTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFBluetoothTriggerConfigurationViewController *v8;
  NSObject *v9;
  WFBluetoothTriggerConfigurationViewController *v10;
  WFBluetoothTriggerConfigurationViewController *v11;
  void *v13;
  _QWORD block[4];
  WFBluetoothTriggerConfigurationViewController *v15;
  objc_super v16;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBluetoothTriggerConfigurationViewController.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFBluetoothTrigger class]]"));

  }
  v16.receiver = self;
  v16.super_class = (Class)WFBluetoothTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v16, sel_initWithTrigger_mode_, v7, a4);
  if (v8)
  {
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__WFBluetoothTriggerConfigurationViewController_initWithTrigger_mode___block_invoke;
    block[3] = &unk_24E604D88;
    v10 = v8;
    v15 = v10;
    dispatch_async(v9, block);

    v11 = v10;
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
  v13[0] = CFSTR("chooseDevice");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v10[1] = CFSTR("cellIdentifier");
  v11[0] = CFSTR("connectOrDisconnect");
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

- (void)fetchBluetoothDevices
{
  id v3;
  WFBluetoothTriggerConfigurationViewController *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shortcuts-%u"), getpid());
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "cStringUsingEncoding:", 4);
  v4 = self;
  BTSessionAttachWithQueue();

}

- (void)finishWithDevices:(id)a3
{
  id v4;

  objc_msgSend(a3, "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFBluetoothTriggerConfigurationViewController setAllDevices:](self, "setAllDevices:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFBluetoothTriggerConfigurationViewController;
  -[WFBluetoothTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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

  -[WFBluetoothTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  uint64_t v19;
  __CFString *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v6 = a4;
  v7 = a3;
  -[WFBluetoothTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
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
    goto LABEL_23;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("chooseDevice"));

  if (v14)
  {
    v15 = v10;
    WFLocalizedString(CFSTR("Device"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "selection");

    if (v19 == 1)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "selectedDevices");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "selectedDevices");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        if (v30 == 1)
        {
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "selectedDevices");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndex:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("Any of %lu Devices"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "selectedDevices");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringWithFormat:", v31, objc_msgSend(v43, "count"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_22;
      }
      v20 = CFSTR("Choose");
    }
    else
    {
      if (v19)
      {
        v33 = 0;
LABEL_22:
        objc_msgSend(v15, "detailTextLabel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setText:", v33);

        goto LABEL_23;
      }
      v20 = CFSTR("Any Device");
    }
    WFLocalizedString(v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqual:", CFSTR("connectOrDisconnect"));

  if (v22)
  {
    objc_msgSend(v10, "setSelectionStyle:", 0);
    v23 = v10;
    v50 = v9;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v54 = v24;

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "onIcon");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "onLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "onIconTintColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "offIcon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "offLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "offIconTintColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "configureWithLeftGlyph:leftTitle:leftTintColor:rightGlyph:rightTitle:rightTintColor:", v53, v34, v35, v36, v37, v39);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setLeftViewSelected:", objc_msgSend(v40, "onConnect"));

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setRightViewSelected:", objc_msgSend(v41, "onDisconnect"));

    objc_msgSend(v54, "setDelegate:", self);
    v9 = v50;
  }
LABEL_23:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFBluetoothTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL8 v15;
  WFTriggerTableViewController *v16;
  void *v17;
  void *v18;
  WFTriggerTableViewController *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFBluetoothTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("chooseDevice"));

  if (v9)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFBluetoothTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    -[WFBluetoothTriggerConfigurationViewController allDevices](self, "allDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFBluetoothTriggerConfigurationViewController allDevices](self, "allDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __83__WFBluetoothTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v22[3] = &unk_24E6043B0;
      v22[4] = self;
      objc_msgSend(v12, "if_map:", v22);
      v13 = objc_claimAutoreleasedReturnValue();

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "selection") == 0;

      v16 = [WFTriggerTableViewController alloc];
      WFLocalizedStringWithKey(CFSTR("Any Device (bluetooth trigger)"), CFSTR("Any Device"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("My Devices"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WFTriggerTableViewController initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:](v16, "initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:", v13, v15, v17, v18);

      WFLocalizedString(CFSTR("Choose Devices"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerTableViewController setTitle:](v19, "setTitle:", v20);

      -[WFTriggerTableViewController setDelegate:](v19, "setDelegate:", self);
      -[WFBluetoothTriggerConfigurationViewController presentNavControllerWithRootViewController:](self, "presentNavControllerWithRootViewController:", v19);

    }
    else
    {
      getWFTriggersLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[WFBluetoothTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_22007E000, v13, OS_LOG_TYPE_INFO, "%s no bluetooth devices loaded", buf, 0xCu);
      }
    }

  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reloadData");

}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[WFBluetoothTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v14 = a5;
  v8 = a3;
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "setSelection:", 0);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedDevices:", MEMORY[0x24BDBD1A8]);
  }
  else
  {
    objc_msgSend(v9, "setSelection:", 1);

    objc_msgSend(v14, "if_map:", &__block_literal_global_13929);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelectedDevices:", v11);

  }
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
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
  objc_msgSend(v8, "setOnConnect:", v6);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOnDisconnect:", v5);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (NSArray)allDevices
{
  return self->_allDevices;
}

- (void)setAllDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDevices, 0);
}

uint64_t __119__WFBluetoothTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

WFSelectableListOption *__83__WFBluetoothTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFSelectableListOption *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = -[WFSelectableListOption initWithDisplayTitle:value:]([WFSelectableListOption alloc], "initWithDisplayTitle:value:", v3, v3);
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v3);

  -[WFSelectableListOption setSelected:](v4, "setSelected:", v7);
  return v4;
}

uint64_t __70__WFBluetoothTriggerConfigurationViewController_initWithTrigger_mode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchBluetoothDevices");
}

@end
