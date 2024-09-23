@implementation WFNANTableViewController

- (WFNANTableViewController)init
{
  void *v3;
  WFNANTableViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSOrderedSet *sections;
  WFNANTableViewContext *v9;
  WFNANTableViewContext *context;
  void *v11;
  void *v12;
  objc_super v14;

  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)WFNANTableViewController;
  v4 = -[WFNANTableViewController initWithStyle:](&v14, sel_initWithStyle_, objc_msgSend(v3, "tableViewStyle"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF00];
    -[WFNANTableViewController _defaultSections](v4, "_defaultSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedSetWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    sections = v4->_sections;
    v4->_sections = (NSOrderedSet *)v7;

    v9 = objc_alloc_init(WFNANTableViewContext);
    context = v4->_context;
    v4->_context = v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__handlePublishersChangedNotification_, CFSTR("WFNANPublishersChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel__handleSubscribersChangedNotification_, CFSTR("WFNANSubscribersChangedNotification"), 0);

    -[WFInsetTableViewController setReloadDataOnUpdateSectionContentInset:](v4, "setReloadDataOnUpdateSectionContentInset:", 0);
  }
  return v4;
}

- (void)viewDidLoad
{
  uint64_t v3;
  _BOOL4 IsChinaDevice;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFNANTableViewController;
  -[WFNANTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = WFCurrentDeviceCapability();
  IsChinaDevice = WFCapabilityIsChinaDevice(v3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (IsChinaDevice)
    v7 = CFSTR("kWFLocNAN_CH");
  else
    v7 = CFSTR("kWFLocNAN");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewController setTitle:](self, "setTitle:", v8);

  -[WFNANTableViewController _configureDataSource](self, "_configureDataSource");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFNANTableViewController;
  -[WFNANTableViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (id)_defaultSections
{
  return &unk_24DB59E60;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFNANSection_%lu"), a3);
}

- (void)_configureDataSource
{
  WFNANTableViewDataSource *v3;
  void *v4;
  void *v5;
  WFNANTableViewDataSource *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WFNANTableViewDataSource alloc];
  -[WFNANTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __48__WFNANTableViewController__configureDataSource__block_invoke;
  v25[3] = &unk_24DB37350;
  v25[4] = self;
  v6 = -[WFNANTableViewDataSource initWithTableView:sections:cellProvider:](v3, "initWithTableView:sections:cellProvider:", v4, v5, v25);
  -[WFNANTableViewController setDataSource:](self, "setDataSource:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BEBD348]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      -[WFNANTableViewController sections](self, "sections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      -[WFNANTableViewController _identifierForSection:](self, "_identifierForSection:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v15);

      ++v11;
      -[WFNANTableViewController sections](self, "sections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v17 > v11);
  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", v8);
  v28[0] = CFSTR("WFNANTableViewControllerNANState");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v18, v19);

  v27 = CFSTR("WFNANTableViewControllerSubscribersCount");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewController _identifierForSection:](self, "_identifierForSection:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v20, v21);

  v26 = CFSTR("WFNANTableViewControllerPublishersCount");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v22, v23);

  -[WFNANTableViewController dataSource](self, "dataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySnapshot:animatingDifferences:", v7, 1);

}

id __48__WFNANTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

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
  if (v10 == 2)
  {
    if (objc_msgSend(v5, "row"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getSubscriberAtIndex:", objc_msgSend(v5, "row") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serviceName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

LABEL_15:
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("kWFLocNANSubscribers"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

    v32 = (void *)MEMORY[0x24BDD17C8];
    v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getSubscribersCount");
LABEL_18:
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%ld"), v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v37);

    objc_msgSend(v11, "setAccessoryType:", 1);
    v17 = v11;
    v18 = 1;
LABEL_19:
    objc_msgSend(v17, "setSelectionStyle:", v18);
    goto LABEL_20;
  }
  if (v10 == 1)
  {
    if (objc_msgSend(v5, "row"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getPublisherAtIndex:", objc_msgSend(v5, "row") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v19, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serviceName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "serviceSpecificInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "instanceName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ [%@]"), v21, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setText:", v27);

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPublishers"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v35);

    v32 = (void *)MEMORY[0x24BDD17C8];
    v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "getPublishersCount");
    goto LABEL_18;
  }
  if (!v10 && !objc_msgSend(v5, "row"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocNANState"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    if (objc_msgSend(*(id *)(a1 + 32), "_isNANEnabled"))
      v15 = CFSTR("Enabled");
    else
      v15 = CFSTR("Disabled");
    objc_msgSend(v11, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    v17 = v11;
    v18 = 0;
    goto LABEL_19;
  }
LABEL_20:

  return v11;
}

- (void)_handlePublishersChangedNotification:(id)a3
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
  _QWORD v17[2];
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedPublisherKey"));
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
      v18 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteItemsWithIdentifiers:", v13);
    }
    else
    {
      if (v12)
      {
LABEL_10:
        v17[0] = CFSTR("WFNANTableViewControllerNANState");
        v17[1] = CFSTR("WFNANTableViewControllerPublishersCount");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v15);

        -[WFNANTableViewController dataSource](self, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "applySnapshot:animatingDifferences:", v6, 1);

        goto LABEL_11;
      }
      v19[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNANTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v14);

    }
    goto LABEL_10;
  }
LABEL_11:

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
  _QWORD v17[2];
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANTableViewController dataSource](self, "dataSource");
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
      v18 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteItemsWithIdentifiers:", v13);
    }
    else
    {
      if (v12)
      {
LABEL_10:
        v17[0] = CFSTR("WFNANTableViewControllerNANState");
        v17[1] = CFSTR("WFNANTableViewControllerSubscribersCount");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v15);

        -[WFNANTableViewController dataSource](self, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "applySnapshot:animatingDifferences:", v6, 1);

        goto LABEL_11;
      }
      v19[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNANTableViewController _identifierForSection:](self, "_identifierForSection:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v14);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)_isNANEnabled
{
  int64_t v3;
  int64_t v4;

  v3 = -[WFNANTableViewContext getPublishersCount](self->_context, "getPublishersCount");
  v4 = -[WFNANTableViewContext getSubscribersCount](self->_context, "getSubscribersCount");
  return !((v4 + v3 < 0) ^ __OFADD__(v4, v3) | (v4 + v3 == 0));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  __objc2_class *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[WFNANTableViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 2)
  {
    if (!objc_msgSend(v11, "row"))
    {
      v8 = WFNANSubscribeTableViewController;
      goto LABEL_7;
    }
  }
  else if (v7 == 1 && !objc_msgSend(v11, "row"))
  {
    v8 = WFNANPublishTableViewController;
LABEL_7:
    v9 = (void *)objc_msgSend([v8 alloc], "initWithContext:", self->_context);
    -[WFNANTableViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

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

- (WFNANTableViewDataSource)dataSource
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
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
