@implementation WFNANSubscribeTableViewController

- (WFNANSubscribeTableViewController)initWithContext:(id)a3
{
  id v5;
  void *v6;
  WFNANSubscribeTableViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSOrderedSet *sections;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BEC2918], "defaultAppearanceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)WFNANSubscribeTableViewController;
  v7 = -[WFNANSubscribeTableViewController initWithStyle:](&v15, sel_initWithStyle_, objc_msgSend(v6, "tableViewStyle"));

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF00];
    -[WFNANSubscribeTableViewController _defaultSections](v7, "_defaultSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedSetWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    sections = v7->_sections;
    v7->_sections = (NSOrderedSet *)v10;

    objc_storeStrong((id *)&v7->_context, a3);
    -[WFNANSubscribeTableViewController clearInputFields](v7, "clearInputFields");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__handleSubscribersChangedNotification_, CFSTR("WFNANSubscribersChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__handleDiscoveryResultsChangedNotification_, CFSTR("WFNANDiscoveryResultsChangedNotification"), 0);

    -[WFInsetTableViewController setReloadDataOnUpdateSectionContentInset:](v7, "setReloadDataOnUpdateSectionContentInset:", 0);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFNANSubscribeTableViewController;
  -[WFNANSubscribeTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocNANSubscribe"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)MEMORY[0x24BDF6C08];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNANSubscribeTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerNib:forCellReuseIdentifier:", v7, CFSTR("kWFTextFieldCellIdentifier"));

  -[WFNANSubscribeTableViewController _configureDataSource](self, "_configureDataSource");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFNANSubscribeTableViewController;
  -[WFNANSubscribeTableViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)dismissKeyboard
{
  id v2;

  -[WFNANSubscribeTableViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (id)_defaultSections
{
  return &unk_24DC5DC00;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFNANSubscribeSection_%lu"), a3);
}

- (void)_configureDataSource
{
  WFNANSubscribeTableViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  WFNANSubscribeTableViewDataSource *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  const __CFString *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WFNANSubscribeTableViewDataSource alloc];
  -[WFNANSubscribeTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke;
  v26[3] = &unk_24DC34648;
  v26[4] = self;
  v7 = -[WFNANSubscribeTableViewDataSource initWithTableView:context:sections:cellProvider:](v3, "initWithTableView:context:sections:cellProvider:", v4, v5, v6, v26);
  -[WFNANSubscribeTableViewController setDataSource:](self, "setDataSource:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDF6720]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      -[WFNANSubscribeTableViewController sections](self, "sections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      -[WFNANSubscribeTableViewController _identifierForSection:](self, "_identifierForSection:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      ++v12;
      -[WFNANSubscribeTableViewController sections](self, "sections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v18 > v12);
  }
  objc_msgSend(v8, "appendSectionsWithIdentifiers:", v9);
  v29[0] = CFSTR("WFNANSubscribeServiceNameIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, v20);

  v28 = CFSTR("WFNANSubscribeAddIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v21, v22);

  if (-[WFNANTableViewContext getSubscribersCount](self->_context, "getSubscribersCount") <= 0)
  {
    v27 = CFSTR("WFNANSubscribeNoSubscribersIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  }
  else
  {
    -[WFNANTableViewContext getSubscribers](self->_context, "getSubscribers");
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANSubscribeTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v23, v24);

  -[WFNANSubscribeTableViewController dataSource](self, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "applySnapshot:animatingDifferences:", v8, 1);

}

id __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 == 1)
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFNANTableViewTextCellIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFNANTableViewTextCellIdentifier"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getSubscribersCount"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("kWFLocNANNoSubscribers"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v29);

      objc_msgSend(v13, "setSelectionStyle:", 0);
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getSubscriberAtIndex:", objc_msgSend(v8, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serviceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld results"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDiscoveryResultsCountForSubscriber:", v14));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "detailTextLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    objc_msgSend(v13, "setAccessoryType:", 1);
    objc_msgSend(v13, "setSelectionStyle:", 1);
    goto LABEL_13;
  }
  if (!v12)
  {
    if (!objc_msgSend(v8, "row"))
    {
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHideLabel:", 1);
      objc_msgSend(v13, "setEditable:", 1);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048);
      objc_msgSend(v13, "textField");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v23);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("kWFLocNANServiceName"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textField");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPlaceholder:", v26);

      objc_initWeak(&location, *(id *)(a1 + 32));
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke_2;
      v32[3] = &unk_24DC35768;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v13, "setTextChangeHandler:", v32);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      goto LABEL_16;
    }
    if (objc_msgSend(v8, "row") == 1)
    {
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFNANTableViewTextCellIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFNANTableViewTextCellIdentifier"));
      objc_msgSend(v13, "setSelectionStyle:", 0);
      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:forState:", CFSTR("Add"), 0);
      objc_msgSend(v13, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "font");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFont:", v16);

      objc_msgSend(v14, "sizeToFit");
      objc_msgSend(v14, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__handleAddSubscriber, 64);
      objc_msgSend(v13, "setAccessoryView:", v14);
LABEL_13:

      goto LABEL_16;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

void __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setServiceName:", v3);

}

- (void)_handleSubscribersChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANSubscribeTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedSubscriberKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedOperationTypeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = objc_msgSend(v10, "unsignedIntegerValue");
    if (v12 == 1)
    {
      v22 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteItemsWithIdentifiers:", v16);

      if (-[WFNANTableViewContext getSubscribersCount](self->_context, "getSubscribersCount"))
      {
LABEL_12:
        -[WFNANSubscribeTableViewController clearInputFields](self, "clearInputFields");
        v20 = CFSTR("WFNANSubscribeServiceNameIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v18);

        -[WFNANSubscribeTableViewController dataSource](self, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "applySnapshot:animatingDifferences:", v6, 1);

        goto LABEL_13;
      }
      v21 = CFSTR("WFNANSubscribeNoSubscribersIdentifier");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNANSubscribeTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v17);

    }
    else
    {
      if (v12)
        goto LABEL_12;
      v24[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNANSubscribeTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v14);

      if (-[WFNANTableViewContext getSubscribersCount](self->_context, "getSubscribersCount") != 1)
        goto LABEL_12;
      v23 = CFSTR("WFNANSubscribeNoSubscribersIdentifier");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteItemsWithIdentifiers:", v15);
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_handleDiscoveryResultsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANSubscribeTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedSubscriberKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v9);

    -[WFNANSubscribeTableViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applySnapshot:animatingDifferences:", v6, 1);

  }
}

- (void)clearInputFields
{
  NSString *serviceName;

  serviceName = self->_serviceName;
  self->_serviceName = (NSString *)&stru_24DC36C30;

}

- (void)_handleAddSubscriber
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x24BEC2A48]);
  -[WFNANSubscribeTableViewController serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "initWithServiceName:", v4);

  objc_msgSend(v7, "setAuthenticationType:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2A50]), "initWithConfiguration:", v7);
  objc_msgSend(v5, "setDelegate:", self->_context);
  -[WFNANSubscribeTableViewController clearInputFields](self, "clearInputFields");
  -[WFNANSubscribeTableViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubscriber:", v5);

  -[WFNANSubscribeTableViewController dismissKeyboard](self, "dismissKeyboard");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  WFNANDiscoveryResultsTableViewController *v8;
  WFNANTableViewContext *context;
  void *v10;
  WFNANDiscoveryResultsTableViewController *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[WFNANSubscribeTableViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 1 && -[WFNANTableViewContext getSubscribersCount](self->_context, "getSubscribersCount") >= 1)
  {
    v8 = [WFNANDiscoveryResultsTableViewController alloc];
    context = self->_context;
    -[WFNANTableViewContext getSubscriberAtIndex:](context, "getSubscriberAtIndex:", objc_msgSend(v13, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFNANDiscoveryResultsTableViewController initWithContext:forSubscriber:](v8, "initWithContext:forSubscriber:", context, v10);

    -[WFNANSubscribeTableViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

  }
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (WFNANTableViewContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (WFNANSubscribeTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
