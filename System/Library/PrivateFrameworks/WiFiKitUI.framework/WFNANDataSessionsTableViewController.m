@implementation WFNANDataSessionsTableViewController

- (WFNANDataSessionsTableViewController)initWithContext:(id)a3 forPublisher:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFNANDataSessionsTableViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSOrderedSet *sections;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)WFNANDataSessionsTableViewController;
  v10 = -[WFNANDataSessionsTableViewController initWithStyle:](&v17, sel_initWithStyle_, objc_msgSend(v9, "tableViewStyle"));

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDBCF00];
    -[WFNANDataSessionsTableViewController _defaultSections](v10, "_defaultSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orderedSetWithArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    sections = v10->_sections;
    v10->_sections = (NSOrderedSet *)v13;

    objc_storeStrong((id *)&v10->_context, a3);
    objc_storeStrong((id *)&v10->_publisher, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__handleDataSessionsChangedNotification_, CFSTR("WFNANDataSessionsForPublishChangedNotification"), 0);

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
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFNANDataSessionsTableViewController;
  -[WFNANDataSessionsTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WiFiAwarePublisher configuration](self->_publisher, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublisher configuration](self->_publisher, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceSpecificInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDataSessionsTableViewController setTitle:](self, "setTitle:", v9);

  -[WFNANDataSessionsTableViewController _configureDataSource](self, "_configureDataSource");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFNANDataSessionsTableViewController;
  -[WFNANDataSessionsTableViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (id)_defaultSections
{
  return &unk_24DB59F50;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFNANDataSessionsSection_%lu"), a3);
}

- (void)_configureDataSource
{
  WFNANDataSessionsTableViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFNANDataSessionsTableViewDataSource *v8;
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
  void *v27;
  _QWORD v28[5];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WFNANDataSessionsTableViewDataSource alloc];
  -[WFNANDataSessionsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDataSessionsTableViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDataSessionsTableViewController publisher](self, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDataSessionsTableViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __60__WFNANDataSessionsTableViewController__configureDataSource__block_invoke;
  v28[3] = &unk_24DB37350;
  v28[4] = self;
  v8 = -[WFNANDataSessionsTableViewDataSource initWithTableView:context:publisher:sections:cellProvider:](v3, "initWithTableView:context:publisher:sections:cellProvider:", v4, v5, v6, v7, v28);
  -[WFNANDataSessionsTableViewController setDataSource:](self, "setDataSource:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BEBD348]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANDataSessionsTableViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[WFNANDataSessionsTableViewController sections](self, "sections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      -[WFNANDataSessionsTableViewController _identifierForSection:](self, "_identifierForSection:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

      ++v13;
      -[WFNANDataSessionsTableViewController sections](self, "sections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v19 > v13);
  }
  objc_msgSend(v9, "appendSectionsWithIdentifiers:", v10);
  context = self->_context;
  -[WFNANDataSessionsTableViewController publisher](self, "publisher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[WFNANTableViewContext getDataSessionsCountForPublisher:](context, "getDataSessionsCountForPublisher:", v21);

  if (v22)
  {
    v23 = self->_context;
    -[WFNANDataSessionsTableViewController publisher](self, "publisher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANTableViewContext getDataSessionsForPublisher:](v23, "getDataSessionsForPublisher:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANDataSessionsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v25, v26);

  }
  else
  {
    v29[0] = CFSTR("WFNANDataSessionsNoActiveSessionsIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNANDataSessionsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, v25);
  }

  -[WFNANDataSessionsTableViewController dataSource](self, "dataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySnapshot:animatingDifferences:", v9, 1);

}

id __60__WFNANDataSessionsTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("WFNANTableViewTextCellIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFNANTableViewTextCellIdentifier"));
  objc_msgSend(v11, "setSelectionStyle:", 0);
  if (!v10)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDataSessionsCountForPublisher:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getDataSessionAtIndex:forPublisher:", objc_msgSend(v5, "row"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "initiatorDataAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ipv6LinkLocalAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      stringForIpv6LinkLocalAddress(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocNANNoActiveDataSessions"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v13);
    }

  }
  return v11;
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
  -[WFNANDataSessionsTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedPublisherKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedDataSessionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedOperationTypeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNANDataSessionsTableViewController publisher](self, "publisher");
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

        if (-[WFNANTableViewContext getDataSessionsCountForPublisher:](self->_context, "getDataSessionsCountForPublisher:", self->_publisher))
        {
LABEL_15:
          -[WFNANDataSessionsTableViewController dataSource](self, "dataSource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "applySnapshot:animatingDifferences:", v6, 1);

          goto LABEL_16;
        }
        v22 = CFSTR("WFNANDataSessionsNoActiveSessionsIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNANDataSessionsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
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
        -[WFNANDataSessionsTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, v17);

        if (-[WFNANTableViewContext getDataSessionsCountForPublisher:](self->_context, "getDataSessionsCountForPublisher:", self->_publisher) != 1)goto LABEL_15;
        v24 = CFSTR("WFNANDataSessionsNoActiveSessionsIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsWithIdentifiers:", v18);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

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

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (WFNANDataSessionsTableViewDataSource)dataSource
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
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
