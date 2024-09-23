@implementation WFWifiTriggerConfigurationViewController

- (WFWifiTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFWifiTriggerConfigurationViewController *v8;
  WFWifiTriggerConfigurationViewController *v9;
  WFWifiTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWifiTriggerConfigurationViewController.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFWifiTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFWifiTriggerConfigurationViewController;
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
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)customSections
{
  void *v2;
  int v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "onConnect");

  if (v3)
  {
    v27[0] = CFSTR("identifier");
    v27[1] = CFSTR("cellIdentifier");
    v28[0] = CFSTR("chooseNetwork");
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v6;
    v25[1] = CFSTR("cellIdentifier");
    v26[0] = CFSTR("connectOrDisconnect");
    v25[0] = CFSTR("identifier");
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v9;
    v23[1] = CFSTR("cellIdentifier");
    v24[0] = CFSTR("switchCell");
    v23[0] = CFSTR("identifier");
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20[0] = CFSTR("identifier");
    v20[1] = CFSTR("cellIdentifier");
    v21[0] = CFSTR("chooseNetwork");
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v18 = CFSTR("cellIdentifier");
    v19[0] = CFSTR("connectOrDisconnect");
    v17 = CFSTR("identifier");
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2, v17, v18, v19[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWifiTriggerConfigurationViewController;
  -[WFWifiTriggerConfigurationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[WFWifiTriggerConfigurationViewController fetchWiFiNetworks](self, "fetchWiFiNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWifiTriggerConfigurationViewController setAllNetworks:](self, "setAllNetworks:", v4);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (id)fetchWiFiNetworks
{
  id v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  unint64_t v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v3 = WiFiManagerClientCreate();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = (void *)WiFiManagerClientCopyNetworks();
    v6 = 0;
    if (!v5)
      goto LABEL_4;
LABEL_3:
    for (i = objc_msgSend(v5, "count"); v6 < i; i = 0)
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      WiFiNetworkGetSSID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v8);

      ++v6;
      if (v5)
        goto LABEL_3;
LABEL_4:
      ;
    }
    CFRelease(v4);

  }
  objc_msgSend(v2, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

  -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;

  v6 = a4;
  v7 = a3;
  -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v10, "setSelectionStyle:", 0);
    goto LABEL_31;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("chooseNetwork"));

  if (v14)
  {
    v15 = v10;
    WFLocalizedString(CFSTR("Network"));
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
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "selectedNetworks");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "selectedNetworks");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");

        if (v37 == 1)
        {
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "selectedNetworks");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndex:", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v51 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("Any of %lu Networks"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "selectedNetworks");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "localizedStringWithFormat:", v38, objc_msgSend(v52, "count"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_29;
      }
      v20 = CFSTR("Choose");
    }
    else
    {
      if (v19)
      {
        v40 = 0;
LABEL_29:
        objc_msgSend(v15, "detailTextLabel");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setText:", v40);

        goto LABEL_30;
      }
      v20 = CFSTR("Any Network");
    }
    WFLocalizedString(v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("connectOrDisconnect"));

  if (!v22)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("switchCell"));

    if (!v26)
      goto LABEL_31;
    objc_msgSend(v10, "setSelectionStyle:", 0);
    WFLocalizedString(CFSTR("Run After Connection Interruption"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v27);

    objc_msgSend(v10, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNumberOfLines:", 2);

    v30 = v10;
    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
    }
    else
    {
      v31 = 0;
    }
    v49 = v31;

    objc_msgSend(v49, "switchControl");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOn:", objc_msgSend(v50, "runAfterConnectionInterruption"));

    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_connectionSwitchChanged_, 4096);
LABEL_30:

    goto LABEL_31;
  }
  objc_msgSend(v10, "setSelectionStyle:", 0);
  v23 = v10;
  v60 = v9;
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
  v63 = v24;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onIcon");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onIconTintColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "offIcon");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "offLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "offIconTintColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "configureWithLeftGlyph:leftTitle:leftTintColor:rightGlyph:rightTitle:rightTintColor:", v62, v41, v42, v43, v44, v46);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setLeftViewSelected:", objc_msgSend(v47, "onConnect"));

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setRightViewSelected:", objc_msgSend(v48, "onDisconnect"));

  objc_msgSend(v63, "setSingleSelection:", 1);
  objc_msgSend(v63, "setDelegate:", self);

  v9 = v60;
LABEL_31:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (void)connectionSwitchChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "isOn");
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRunAfterConnectionInterruption:", v4);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  WFTriggerTableViewController *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("chooseNetwork"));

  if (v9)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFWifiTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    -[WFWifiTriggerConfigurationViewController allNetworks](self, "allNetworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFWifiTriggerConfigurationViewController allNetworks](self, "allNetworks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __78__WFWifiTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v21[3] = &unk_24E6043B0;
      v21[4] = self;
      objc_msgSend(v12, "if_map:", v21);
      v13 = objc_claimAutoreleasedReturnValue();

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "selection") == 0;

      v16 = [WFTriggerTableViewController alloc];
      WFLocalizedString(CFSTR("Any Network"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WFTriggerTableViewController initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:](v16, "initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:", v13, v15, v17, 0);

      WFLocalizedString(CFSTR("Choose Networks"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerTableViewController setTitle:](v18, "setTitle:", v19);

      -[WFTriggerTableViewController setDelegate:](v18, "setDelegate:", self);
      -[WFWifiTriggerConfigurationViewController presentNavControllerWithRootViewController:](self, "presentNavControllerWithRootViewController:", v18);

    }
    else
    {
      getWFTriggersLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[WFWifiTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_22007E000, v13, OS_LOG_TYPE_INFO, "%s no wifi networks loaded", buf, 0xCu);
      }
    }

  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadData");

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("switchCell"));

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setHorizontalPadding:", 0.0);
    -[WFWifiTriggerConfigurationViewController textForSummaryFooterView](self, "textForSummaryFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)textForSummaryFooterView
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  int v16;
  __CFString *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "runAfterConnectionInterruption");

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selection");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasCapability:", *MEMORY[0x24BEC1888]);

    if (v16)
    {
      if ((v4 & 1) != 0)
        v17 = CFSTR("If you reconnect to any WLAN network within 3 minutes of being disconnected, this automation will run again.");
      else
        v17 = CFSTR("If you reconnect to any WLAN network within 3 minutes of being disconnected, this automation will not run again.");
    }
    else if ((v4 & 1) != 0)
    {
      v17 = CFSTR("If you reconnect to any Wi-Fi network within 3 minutes of being disconnected, this automation will run again.");
    }
    else
    {
      v17 = CFSTR("If you reconnect to any Wi-Fi network within 3 minutes of being disconnected, this automation will not run again.");
    }
    goto LABEL_27;
  }
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedNetworks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasCapability:", *MEMORY[0x24BEC1888]);

    if (v19)
    {
      if ((v4 & 1) != 0)
        v17 = CFSTR("If you reconnect to a WLAN network within 3 minutes of being disconnected, this automation will run again.");
      else
        v17 = CFSTR("If you reconnect to a WLAN network within 3 minutes of being disconnected, this automation will not run again.");
    }
    else if ((v4 & 1) != 0)
    {
      v17 = CFSTR("If you reconnect to a Wi-Fi network within 3 minutes of being disconnected, this automation will run again.");
    }
    else
    {
      v17 = CFSTR("If you reconnect to a Wi-Fi network within 3 minutes of being disconnected, this automation will not run again.");
    }
LABEL_27:
    WFLocalizedString(v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    return v28;
  }
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedNetworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 == 1)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    if ((v4 & 1) != 0)
      v14 = CFSTR("If you reconnect to “%@” within 3 minutes of being disconnected, this automation will run again.");
    else
      v14 = CFSTR("If you reconnect to “%@” within 3 minutes of being disconnected, this automation will not run again.");
    WFLocalizedString(v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "selectedNetworks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v24, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasCapability:", *MEMORY[0x24BEC1888]);

    v22 = (void *)MEMORY[0x24BDD17C8];
    if (v21)
    {
      if ((v4 & 1) != 0)
        v23 = CFSTR("If you reconnect to any of %lu WLAN networks within 3 minutes of being disconnected, these automations will run again.");
      else
        v23 = CFSTR("If you reconnect to any of %lu WLAN networks within 3 minutes of being disconnected, these automations will not run again.");
    }
    else if ((v4 & 1) != 0)
    {
      v23 = CFSTR("If you reconnect to any of %lu Wi-Fi networks within 3 minutes of being disconnected, these automations will run again.");
    }
    else
    {
      v23 = CFSTR("If you reconnect to any of %lu Wi-Fi networks within 3 minutes of being disconnected, these automations will not run again.");
    }
    WFLocalizedPluralString(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "selectedNetworks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v24, objc_msgSend(v26, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[WFWifiTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
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
    objc_msgSend(v11, "setSelectedNetworks:", MEMORY[0x24BDBD1A8]);
  }
  else
  {
    objc_msgSend(v9, "setSelection:", 1);

    objc_msgSend(v14, "if_map:", &__block_literal_global_5741);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelectedNetworks:", v11);

  }
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a4;
  -[WFTriggerConfigurationViewController trigger](self, "trigger", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnConnect:", v6);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOnDisconnect:", v5);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (NSArray)allNetworks
{
  return self->_allNetworks;
}

- (void)setAllNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_allNetworks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNetworks, 0);
}

uint64_t __114__WFWifiTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

WFSelectableListOption *__78__WFWifiTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "selectedNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v3);

  -[WFSelectableListOption setSelected:](v4, "setSelected:", v7);
  return v4;
}

@end
