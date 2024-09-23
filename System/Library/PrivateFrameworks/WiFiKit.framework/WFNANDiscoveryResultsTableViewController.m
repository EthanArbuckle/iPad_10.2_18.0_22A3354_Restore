@implementation WFNANDiscoveryResultsTableViewController

- (WFNANDiscoveryResultsTableViewController)initWithContext:(id)a3 forSubscriber:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFNANDiscoveryResultsTableViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSOrderedSet *sections;
  NSString *passphrase;
  void *v16;
  void *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BEC2918], "defaultAppearanceProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)WFNANDiscoveryResultsTableViewController;
  v10 = -[WFNANDiscoveryResultsTableViewController initWithStyle:](&v19, sel_initWithStyle_, objc_msgSend(v9, "tableViewStyle"));

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDBCF00];
    -[WFNANDiscoveryResultsTableViewController _defaultSections](v10, "_defaultSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orderedSetWithArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    sections = v10->_sections;
    v10->_sections = (NSOrderedSet *)v13;

    objc_storeStrong((id *)&v10->_context, a3);
    objc_storeStrong((id *)&v10->_subscriber, a4);
    passphrase = v10->_passphrase;
    v10->_passphrase = (NSString *)&stru_24DC36C30;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v10, sel__handleDiscoveryResultsChangedNotification_, CFSTR("WFNANDiscoveryResultsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel__handleDataSessionsChangedNotification_, CFSTR("WFNANDataSessionsForSubscribeChangedNotification"), 0);

    -[WFInsetTableViewController setReloadDataOnUpdateSectionContentInset:](v10, "setReloadDataOnUpdateSectionContentInset:", 0);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFNANDiscoveryResultsTableViewController;
  -[WFNANDiscoveryResultsTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WiFiAwareSubscriber configuration](self->_subscriber, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDiscoveryResultsTableViewController setTitle:](self, "setTitle:", v6);

  -[WFNANDiscoveryResultsTableViewController _configureDataSource](self, "_configureDataSource");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFNANDiscoveryResultsTableViewController;
  -[WFNANDiscoveryResultsTableViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (id)_defaultSections
{
  return &unk_24DC5DB40;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFNANDiscoveryResultsSection_%lu"), a3);
}

- (void)_configureDataSource
{
  WFNANDiscoveryResultsTableViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFNANDiscoveryResultsTableViewDataSource *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  WFNANTableViewContext *context;
  void *v21;
  uint64_t v22;
  WFNANTableViewContext *v23;
  void *v24;
  void *v25;
  void *v26;
  WFNANTableViewContext *v27;
  void *v28;
  uint64_t v29;
  WFNANTableViewContext *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WFNANDiscoveryResultsTableViewDataSource alloc];
  -[WFNANDiscoveryResultsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDiscoveryResultsTableViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDiscoveryResultsTableViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __64__WFNANDiscoveryResultsTableViewController__configureDataSource__block_invoke;
  v35[3] = &unk_24DC34648;
  v35[4] = self;
  v8 = -[WFNANDiscoveryResultsTableViewDataSource initWithTableView:context:subscriber:sections:cellProvider:](v3, "initWithTableView:context:subscriber:sections:cellProvider:", v4, v5, v6, v7, v35);
  -[WFNANDiscoveryResultsTableViewController setDataSource:](self, "setDataSource:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDF6720]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDiscoveryResultsTableViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[WFNANDiscoveryResultsTableViewController sections](self, "sections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

      ++v13;
      -[WFNANDiscoveryResultsTableViewController sections](self, "sections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v19 > v13);
  }
  objc_msgSend(v9, "appendSectionsWithIdentifiers:", v10);
  context = self->_context;
  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[WFNANTableViewContext getDiscoveryResultsCountForSubscriber:](context, "getDiscoveryResultsCountForSubscriber:", v21);

  if (v22 <= 0)
  {
    v37[0] = CFSTR("WFNANDiscoveryResultsNoDiscoveryResultsIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, v25);
  }
  else
  {
    v23 = self->_context;
    -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANTableViewContext getDiscoveryResultsForSubscriber:](v23, "getDiscoveryResultsForSubscriber:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v25, v26);

  }
  v27 = self->_context;
  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[WFNANTableViewContext getDataSessionsCountForSubscriber:](v27, "getDataSessionsCountForSubscriber:", v28);

  if (v29 < 1)
  {
    v36 = CFSTR("WFNANDiscoveryResultsNoDataSessionsIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v31, v32);
  }
  else
  {
    v30 = self->_context;
    -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANTableViewContext getDataSessionsForSubscriber:](v30, "getDataSessionsForSubscriber:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v32, v33);

  }
  -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "applySnapshot:animatingDifferences:", v9, 1);

}

id __64__WFNANDiscoveryResultsTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("WFNANTableViewTextCellIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFNANTableViewTextCellIdentifier"));
  objc_msgSend(v12, "setSelectionStyle:", 0);
  if (v11 == 1)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDataSessionsCountForSubscriber:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040)) >= 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDataSessionAtIndex:forSubscriber:", objc_msgSend(v6, "row"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "discoveryResult");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "serviceSpecificInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "instanceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");
      if (v19)
      {
        objc_msgSend(v13, "discoveryResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serviceSpecificInfo");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "instanceName");
      }
      else
      {
        objc_msgSend(v13, "localDataAddress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "description");
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v21);

      if (v19)
      {

        v21 = v3;
      }

      objc_msgSend(v13, "localDataAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ipv6LinkLocalAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      stringForIpv6LinkLocalAddress(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "detailTextLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v16);
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    v23 = CFSTR("kWFLocNANNoActiveDataSessions");
LABEL_13:
    objc_msgSend(v22, "localizedStringForKey:value:table:", v23, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);
LABEL_21:

    goto LABEL_22;
  }
  if (!v11)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDiscoveryResultsCountForSubscriber:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDiscoveryResultAtIndex:forSubscriber:", objc_msgSend(v6, "row"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceSpecificInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "instanceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(v13, "serviceSpecificInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "instanceName");
      }
      else
      {
        objc_msgSend(v13, "publisherAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "description");
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v24);

LABEL_20:
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    v23 = CFSTR("kWFLocNANNoDiscoveryResults");
    goto LABEL_13;
  }
LABEL_22:

  return v12;
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
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedSubscriberKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedDiscoveryResultKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedOperationTypeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v13 || v12 == 0)
  {

  }
  else
  {

    if (v10)
    {
      v15 = objc_msgSend(v12, "unsignedIntegerValue");
      if (v15 == 1)
      {
        v23 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsWithIdentifiers:", v19);

        if (-[WFNANTableViewContext getDiscoveryResultsCountForSubscriber:](self->_context, "getDiscoveryResultsCountForSubscriber:", v8))
        {
LABEL_15:
          -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "applySnapshot:animatingDifferences:", v6, 1);

          goto LABEL_16;
        }
        v22 = CFSTR("WFNANDiscoveryResultsNoDiscoveryResultsIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v18, v20);

      }
      else
      {
        if (v15)
          goto LABEL_15;
        v25[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, v17);

        if (-[WFNANTableViewContext getDiscoveryResultsCountForSubscriber:](self->_context, "getDiscoveryResultsCountForSubscriber:", v8) != 1)goto LABEL_15;
        v24 = CFSTR("WFNANDiscoveryResultsNoDiscoveryResultsIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsWithIdentifiers:", v18);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)_handleDataSessionsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedSubscriberKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedDataSessionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedOperationTypeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v13 || v12 == 0)
  {

  }
  else
  {

    if (v10)
    {
      if (objc_msgSend(v12, "unsignedIntegerValue") == 1)
      {
        v20[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsWithIdentifiers:", v15);

        if (!-[WFNANTableViewContext getDataSessionsCountForSubscriber:](self->_context, "getDataSessionsCountForSubscriber:", self->_subscriber))
        {
          v19 = CFSTR("WFNANDiscoveryResultsNoDataSessionsIdentifier");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, v17);

        }
      }
      -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applySnapshot:animatingDifferences:", v6, 1);

    }
  }

}

- (void)passphraseTextFieldDidChange:(id)a3
{
  NSString *v4;
  NSString *passphrase;

  objc_msgSend(a3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  passphrase = self->_passphrase;
  self->_passphrase = v4;

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];

  v5 = a4;
  -[WFNANDiscoveryResultsTableViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (!v8
    && -[WFNANTableViewContext getDiscoveryResultsCountForSubscriber:](self->_context, "getDiscoveryResultsCountForSubscriber:", self->_subscriber) >= 1)
  {
    v9 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPassphrasePopupTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPassphrasePopupMessage"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v21[3] = &unk_24DC34840;
    v21[4] = self;
    objc_msgSend(v14, "addTextFieldWithConfigurationHandler:", v21);
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Cancel"), 0, &__block_literal_global_0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v16);
    v17 = (void *)MEMORY[0x24BDF67E8];
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
    v19[3] = &unk_24DC348A8;
    v19[4] = self;
    v20 = v5;
    objc_msgSend(v17, "actionWithTitle:style:handler:", CFSTR("Continue"), 0, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v18);
    -[WFNANDiscoveryResultsTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

void __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v6 = a2;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPassphrase"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v5);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_passphraseTextFieldDidChange_, 0x20000);
}

void __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDiscoveryResultAtIndex:forSubscriber:", objc_msgSend(*(id *)(a1 + 40), "row"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      objc_msgSend(v2, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_219FC8000, v5, v4, "Establishing a data session with discovery result %@", (uint8_t *)&v11, 0xCu);

    }
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2A10]), "initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:", v2, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "start");
  v8 = *(_QWORD **)(a1 + 32);
  v9 = (void *)v8[129];
  objc_msgSend(v8, "subscriber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDataSession:forSubscriber:", v7, v10);

}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WFLogForCategory(0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11)
  {
    v13 = v11;
    if (os_log_type_enabled(v13, v12))
    {
      objc_msgSend(v8, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_219FC8000, v13, v12, "NAN data session %@ confirmed for peer (address: %@, serviceSpecificInfo: %@)", buf, 0x20u);

    }
  }

  -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "snapshot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDiscoveryResultsTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, v20);

  if (-[WFNANTableViewContext getDataSessionsCountForSubscriber:](self->_context, "getDataSessionsCountForSubscriber:", self->_subscriber) == 1)
  {
    v23 = CFSTR("WFNANDiscoveryResultsNoDataSessionsIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteItemsWithIdentifiers:", v21);

  }
  -[WFNANDiscoveryResultsTableViewController dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "applySnapshot:animatingDifferences:", v18, 1);

}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  WFNANTableViewContext *context;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_219FC8000, v9, v8, "NAN data session %@ failed to start with error %ld", (uint8_t *)&v13, 0x16u);

    }
  }

  objc_msgSend(v6, "stop");
  context = self->_context;
  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewContext removeDataSession:forSubscriber:](context, "removeDataSession:forSubscriber:", v6, v12);

}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  WFNANTableViewContext *context;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_219FC8000, v9, v8, "NAN data session %@ terminated with reason %ld", (uint8_t *)&v13, 0x16u);

    }
  }

  objc_msgSend(v6, "stop");
  context = self->_context;
  -[WFNANDiscoveryResultsTableViewController subscriber](self, "subscriber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewContext removeDataSession:forSubscriber:](context, "removeDataSession:forSubscriber:", v6, v12);

}

- (void)dataSessionRequestStarted:(id)a3
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_msgSend(v3, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_219FC8000, v6, v5, "NAN data session %@ started", (uint8_t *)&v8, 0xCu);

    }
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

- (WiFiAwareSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  objc_storeStrong((id *)&self->_passphrase, a3);
}

- (WFNANDiscoveryResultsTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
