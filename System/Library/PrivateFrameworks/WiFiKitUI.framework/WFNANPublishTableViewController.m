@implementation WFNANPublishTableViewController

- (WFNANPublishTableViewController)initWithContext:(id)a3
{
  id v5;
  void *v6;
  WFNANPublishTableViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSOrderedSet *sections;
  WFNetworkSettingsCellFactory *v12;
  void *v13;
  uint64_t v14;
  WFNetworkSettingsCellFactory *cellFactory;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)WFNANPublishTableViewController;
  v7 = -[WFNANPublishTableViewController initWithStyle:](&v19, sel_initWithStyle_, objc_msgSend(v6, "tableViewStyle"));

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF00];
    -[WFNANPublishTableViewController _defaultSections](v7, "_defaultSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedSetWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    sections = v7->_sections;
    v7->_sections = (NSOrderedSet *)v10;

    objc_storeStrong((id *)&v7->_context, a3);
    v12 = [WFNetworkSettingsCellFactory alloc];
    -[WFNANPublishTableViewController tableView](v7, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFNetworkSettingsCellFactory initWithTableView:](v12, "initWithTableView:", v13);
    cellFactory = v7->_cellFactory;
    v7->_cellFactory = (WFNetworkSettingsCellFactory *)v14;

    -[WFNANPublishTableViewController clearInputFields](v7, "clearInputFields");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__handlePublishersChangedNotification_, CFSTR("WFNANPublishersChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__handleDataSessionsChangedNotification_, CFSTR("WFNANDataSessionsForPublishChangedNotification"), 0);

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
  v9.super_class = (Class)WFNANPublishTableViewController;
  -[WFNANPublishTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPublish"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFNANPublishTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerNib:forCellReuseIdentifier:", v7, CFSTR("kWFTextFieldCellIdentifier"));

  -[WFNANPublishTableViewController _configureDataSource](self, "_configureDataSource");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFNANPublishTableViewController;
  -[WFNANPublishTableViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)dismissKeyboard
{
  id v2;

  -[WFNANPublishTableViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (id)_defaultSections
{
  return &unk_24DB59F80;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFNANPublishSection_%lu"), a3);
}

- (id)createTextFieldCellWithTableView:(id)a3 indexPath:(id)a4 text:(id)a5 placeholder:(id)a6 keyboardType:(int64_t)a7 textChangedHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v13 = a8;
  v14 = a6;
  v15 = a5;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHideLabel:", 1);
  objc_msgSend(v16, "setEditable:", 1);
  objc_msgSend(v16, "textField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v15);

  objc_msgSend(v16, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPlaceholder:", v14);

  objc_msgSend(v16, "textField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKeyboardType:", a7);

  objc_msgSend(v16, "setTextChangeHandler:", v13);
  return v16;
}

- (void)_configureDataSource
{
  WFNANPublishTableViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  WFNANPublishTableViewDataSource *v7;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WFNANPublishTableViewDataSource alloc];
  -[WFNANPublishTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke;
  v40[3] = &unk_24DB37350;
  v40[4] = self;
  v7 = -[WFNANPublishTableViewDataSource initWithTableView:context:sections:cellProvider:](v3, "initWithTableView:context:sections:cellProvider:", v4, v5, v6, v40);
  -[WFNANPublishTableViewController setDataSource:](self, "setDataSource:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BEBD348]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      -[WFNANPublishTableViewController sections](self, "sections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      ++v12;
      -[WFNANPublishTableViewController sections](self, "sections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v18 > v12);
  }
  objc_msgSend(v8, "appendSectionsWithIdentifiers:", v9);
  v50[0] = CFSTR("WFNANPublishServiceNameIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, v20);

  v49 = CFSTR("WFNANPublishServiceTypeIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v21, v22);

  v48 = CFSTR("WFNANPublishInstanceNameIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v23, v24);

  v47 = CFSTR("WFNANPublishServiceSpecificInfoIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v25, v26);

  v46 = CFSTR("WFNANPublishServiceSpecificInfoTypeIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v27, v28);

  v45 = CFSTR("WFNANPublishPortNumberIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v29, v30);

  v44 = CFSTR("WFNANPublishProtocolTypeIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v31, v32);

  v43 = CFSTR("WFNANPublishPassphraseIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v33, v34);

  v42 = CFSTR("WFNANPublishAddIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v35, v36);

  if (-[WFNANTableViewContext getPublishersCount](self->_context, "getPublishersCount") <= 0)
  {
    v41 = CFSTR("WFNANPublishNoPublishersIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  }
  else
  {
    -[WFNANTableViewContext getPublishers](self->_context, "getPublishers");
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v37, v38);

  -[WFNANPublishTableViewController dataSource](self, "dataSource");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySnapshot:animatingDifferences:", v8, 1);

}

id __55__WFNANPublishTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[5];
  _QWORD v88[4];
  id v89;
  _QWORD v90[5];
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[5];
  _QWORD v96[4];
  id v97;
  id location[2];

  v84 = a2;
  v7 = a3;
  v83 = a4;
  objc_msgSend(*(id *)(a1 + 32), "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_initWeak(location, *(id *)(a1 + 32));
  if (v10 == 1)
  {
    objc_msgSend(v84, "dequeueReusableCellWithIdentifier:", CFSTR("WFNANTableViewTextCellIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFNANTableViewTextCellIdentifier"));
    objc_msgSend(v12, "setSelectionStyle:", 0);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "getPublishersCount"))
    {
      v82 = a1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "getPublisherAtIndex:", objc_msgSend(v7, "row"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v28, "configuration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "serviceName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "serviceSpecificInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "instanceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ [%@]"), v31, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v35);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld sessions"), objc_msgSend(*(id *)(*(_QWORD *)(v82 + 32) + 1040), "getDataSessionsCountForPublisher:", v28));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "detailTextLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setText:", v37);

      objc_msgSend(v12, "setAccessoryType:", 1);
      objc_msgSend(v12, "setSelectionStyle:", 1);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("kWFLocNANNoPublishers"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setText:", v47);

    }
  }
  else
  {
    if (v10)
    {
      v12 = 0;
      goto LABEL_19;
    }
    v11 = v7;
    if (!objc_msgSend(v7, "row"))
    {
      v39 = *(_QWORD **)(a1 + 32);
      v40 = v39[133];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocNANServiceName"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = MEMORY[0x24BDAC760];
      v96[1] = 3221225472;
      v96[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_2;
      v96[3] = &unk_24DB37328;
      v43 = &v97;
      objc_copyWeak(&v97, location);
      v44 = v39;
      v7 = v11;
      objc_msgSend(v44, "createTextFieldCellWithTableView:indexPath:text:placeholder:keyboardType:textChangedHandler:", v84, v11, v40, v42, 0, v96);
      v45 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v12 = (void *)v45;

      objc_destroyWeak(v43);
      goto LABEL_19;
    }
    if (objc_msgSend(v7, "row") == 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "segmentedCellAtIndexPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segmentedControl");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllSegments");

      objc_msgSend(v12, "segmentedControl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("kWFLocNANServiceTypeAdaptive"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertSegmentWithTitle:atIndex:animated:", v16, 0, 1);

      objc_msgSend(v12, "segmentedControl");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocNANServiceTypeRealtime"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertSegmentWithTitle:atIndex:animated:", v19, 1, 1);

      objc_msgSend(v12, "segmentedControl");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("kWFLocNANServiceTypeLowLatency"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertSegmentWithTitle:atIndex:animated:", v22, 2, 1);

      v95[0] = MEMORY[0x24BDAC760];
      v95[1] = 3221225472;
      v95[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_3;
      v95[3] = &unk_24DB381C8;
      v95[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "setHandler:", v95);
      objc_msgSend(v12, "segmentedControl");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSelectedSegmentIndex:", 0);

      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segmentedControl");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v24);

      objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBackgroundColor:", v26);
LABEL_6:

      goto LABEL_19;
    }
    if (objc_msgSend(v7, "row") == 2)
    {
      v49 = *(_QWORD **)(a1 + 32);
      v50 = v49[135];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocNANInstanceName"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x24BDAC760];
      v93[1] = 3221225472;
      v93[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_4;
      v93[3] = &unk_24DB37328;
      v43 = &v94;
      objc_copyWeak(&v94, location);
      v51 = v49;
      v7 = v11;
      objc_msgSend(v51, "createTextFieldCellWithTableView:indexPath:text:placeholder:keyboardType:textChangedHandler:", v84, v11, v50, v42, 0, v93);
      v45 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v7, "row") == 3)
    {
      v52 = *(_QWORD **)(a1 + 32);
      v53 = v52[136];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocNANServiceSpecificInfo"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_5;
      v91[3] = &unk_24DB37328;
      v43 = &v92;
      objc_copyWeak(&v92, location);
      v54 = v52;
      v7 = v11;
      objc_msgSend(v54, "createTextFieldCellWithTableView:indexPath:text:placeholder:keyboardType:textChangedHandler:", v84, v11, v53, v42, 0, v91);
      v45 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v7, "row") == 4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "segmentedCellAtIndexPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segmentedControl");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "removeAllSegments");

      objc_msgSend(v12, "segmentedControl");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "insertSegmentWithTitle:atIndex:animated:", CFSTR("Hex"), 0, 1);

      objc_msgSend(v12, "segmentedControl");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "insertSegmentWithTitle:atIndex:animated:", CFSTR("ASCII"), 1, 1);

      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_6;
      v90[3] = &unk_24DB381C8;
      v90[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "setHandler:", v90);
      objc_msgSend(v12, "segmentedControl");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setSelectedSegmentIndex:", 0);

      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segmentedControl");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setBackgroundColor:", v60);

      objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBackgroundColor:", v26);
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "row") == 5)
    {
      v62 = *(_QWORD **)(a1 + 32);
      v63 = v62[137];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPortNumber"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_7;
      v88[3] = &unk_24DB37328;
      v43 = &v89;
      objc_copyWeak(&v89, location);
      v64 = v62;
      v7 = v11;
      objc_msgSend(v64, "createTextFieldCellWithTableView:indexPath:text:placeholder:keyboardType:textChangedHandler:", v84, v11, v63, v42, 4, v88);
      v45 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v7, "row") == 6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "segmentedCellAtIndexPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segmentedControl");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "removeAllSegments");

      objc_msgSend(v12, "segmentedControl");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("kWFLocNANProtocolTypeTCP"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "insertSegmentWithTitle:atIndex:animated:", v68, 0, 1);

      objc_msgSend(v12, "segmentedControl");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("kWFLocNANProtocolTypeUDP"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "insertSegmentWithTitle:atIndex:animated:", v71, 1, 1);

      v87[0] = MEMORY[0x24BDAC760];
      v87[1] = 3221225472;
      v87[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_8;
      v87[3] = &unk_24DB381C8;
      v87[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "setHandler:", v87);
      objc_msgSend(v12, "segmentedControl");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setSelectedSegmentIndex:", 0);

      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "segmentedControl");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setBackgroundColor:", v73);

      objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBackgroundColor:", v26);
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "row") == 7)
    {
      v75 = *(_QWORD **)(a1 + 32);
      v76 = v75[139];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPassphrase"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_9;
      v85[3] = &unk_24DB37328;
      v43 = &v86;
      objc_copyWeak(&v86, location);
      v77 = v75;
      v7 = v11;
      objc_msgSend(v77, "createTextFieldCellWithTableView:indexPath:text:placeholder:keyboardType:textChangedHandler:", v84, v11, v76, v42, 0, v85);
      v45 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v7, "row") == 8)
    {
      objc_msgSend(v84, "dequeueReusableCellWithIdentifier:", CFSTR("WFNANTableViewTextCellIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WFNANTableViewTextCellIdentifier"));
      objc_msgSend(v12, "setSelectionStyle:", 0);
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setTitle:forState:", CFSTR("Add"), 0);
      objc_msgSend(v12, "textLabel");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "font");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "titleLabel");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setFont:", v80);

      objc_msgSend(v78, "sizeToFit");
      objc_msgSend(v78, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__handleAddPublisher, 64);
      objc_msgSend(v12, "setAccessoryView:", v78);

    }
    else
    {
      v12 = 0;
    }
  }
LABEL_19:
  objc_destroyWeak(location);

  return v12;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setServiceName:", v3);

}

uint64_t __55__WFNANPublishTableViewController__configureDataSource__block_invoke_3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1072) = a2;
  return result;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setInstanceName:", v3);

}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setServiceSpecificInfo:", v3);

}

uint64_t __55__WFNANPublishTableViewController__configureDataSource__block_invoke_6(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1024) = a2 == 0;
  return result;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setPortNumber:", v3);

}

uint64_t __55__WFNANPublishTableViewController__configureDataSource__block_invoke_8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1104) = a2;
  return result;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setPassphrase:", v3);

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
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[8];
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANPublishTableViewController dataSource](self, "dataSource");
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
      v21 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteItemsWithIdentifiers:", v17);

      if (!-[WFNANTableViewContext getPublishersCount](self->_context, "getPublishersCount"))
      {
        v20 = CFSTR("WFNANPublishNoPublishersIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, v18);

LABEL_12:
      }
    }
    else if (!v12)
    {
      v24[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNANPublishTableViewController _identifierForSection:](self, "_identifierForSection:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v14);

      if (-[WFNANTableViewContext getPublishersCount](self->_context, "getPublishersCount") == 1)
      {
        v23 = CFSTR("WFNANPublishNoPublishersIdentifier");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsWithIdentifiers:", v15);

      }
      -[WFNANPublishTableViewController clearInputFields](self, "clearInputFields");
      v22[0] = CFSTR("WFNANPublishServiceNameIdentifier");
      v22[1] = CFSTR("WFNANPublishServiceTypeIdentifier");
      v22[2] = CFSTR("WFNANPublishInstanceNameIdentifier");
      v22[3] = CFSTR("WFNANPublishServiceSpecificInfoIdentifier");
      v22[4] = CFSTR("WFNANPublishServiceSpecificInfoTypeIdentifier");
      v22[5] = CFSTR("WFNANPublishPortNumberIdentifier");
      v22[6] = CFSTR("WFNANPublishProtocolTypeIdentifier");
      v22[7] = CFSTR("WFNANPublishPassphraseIdentifier");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v16);
      goto LABEL_12;
    }
    -[WFNANPublishTableViewController dataSource](self, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applySnapshot:animatingDifferences:", v6, 1);

  }
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
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNANPublishTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WFNANTableViewContextChangedPublisherKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v9);

    -[WFNANPublishTableViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applySnapshot:animatingDifferences:", v6, 1);

  }
}

- (void)clearInputFields
{
  NSString *serviceName;
  NSString *instanceName;
  NSString *serviceSpecificInfo;

  serviceName = self->_serviceName;
  self->_serviceName = (NSString *)&stru_24DB39F78;

  self->_serviceType = 0;
  instanceName = self->_instanceName;
  self->_instanceName = (NSString *)&stru_24DB39F78;

  serviceSpecificInfo = self->_serviceSpecificInfo;
  self->_serviceSpecificInfo = (NSString *)&stru_24DB39F78;

  self->_isServiceSpecificInfoHex = 1;
  self->_portNumber = (NSString *)&stru_24DB39F78;
  self->_protocolType = 0;
  self->_passphrase = (NSString *)&stru_24DB39F78;
}

- (id)serviceSpecificInfoFromString
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  char v13;
  char v14;
  void *v15;
  unint64_t v16;
  void *v17;
  char v19;

  if (self->_isServiceSpecificInfoHex)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    -[WFNANPublishTableViewController serviceSpecificInfo](self, "serviceSpecificInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");

    -[WFNANPublishTableViewController serviceSpecificInfo](self, "serviceSpecificInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8 >= 2)
    {
      v9 = 0;
      v10 = (unsigned __int8 *)(v6 + 1);
      while (1)
      {
        v19 = 0;
        v11 = *(v10 - 1);
        v12 = *v10;
        if ((v11 - 48) <= 9)
          break;
        if ((v11 - 97) <= 5)
        {
          v13 = 16 * v11 - 112;
          goto LABEL_8;
        }
        v13 = 0;
LABEL_10:
        if ((v12 - 48) <= 9)
        {
          v14 = v13 | (v12 - 48);
LABEL_14:
          v19 = v14;
          goto LABEL_15;
        }
        if ((v12 - 97) <= 5)
        {
          v14 = v13 | (v12 - 87);
          goto LABEL_14;
        }
LABEL_15:
        v10 += 2;
        objc_msgSend(v3, "appendBytes:length:", &v19, 1);
        ++v9;
        -[WFNANPublishTableViewController serviceSpecificInfo](self, "serviceSpecificInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v9 >= v16 >> 1)
          return v3;
      }
      v13 = 16 * v11;
LABEL_8:
      v19 = v13;
      goto LABEL_10;
    }
  }
  else
  {
    -[WFNANPublishTableViewController serviceSpecificInfo](self, "serviceSpecificInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_handleAddPublisher
{
  NSString *passphrase;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  passphrase = self->_passphrase;
  if (passphrase && -[NSString length](passphrase, "length"))
  {
    v4 = objc_alloc(MEMORY[0x24BEC2A28]);
    v20[0] = self->_passphrase;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithPMKList:passphraseList:", MEMORY[0x24BDBD1A8], v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2A20]), "initWithServiceType:securityConfiguration:", -[WFNANPublishTableViewController serviceType](self, "serviceType"), v6);
  v8 = objc_alloc(MEMORY[0x24BEC2A30]);
  v9 = -[WFNANPublishTableViewController protocolType](self, "protocolType");
  -[WFNANPublishTableViewController portNumber](self, "portNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithProtocolType:servicePort:", v9, (unsigned __int16)objc_msgSend(v10, "integerValue"));

  objc_msgSend(v7, "setServiceSpecificInfo:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BEC2A38]);
  -[WFNANPublishTableViewController instanceName](self, "instanceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInstanceName:", v13);

  -[WFNANPublishTableViewController serviceSpecificInfoFromString](self, "serviceSpecificInfoFromString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBlob:", v14);

  v15 = objc_alloc(MEMORY[0x24BEC2A18]);
  -[WFNANPublishTableViewController serviceName](self, "serviceName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithServiceName:", v16);

  objc_msgSend(v17, "setDatapathConfiguration:", v7);
  objc_msgSend(v17, "setServiceSpecificInfo:", v12);
  objc_msgSend(v17, "setAuthenticationType:", 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2A40]), "initWithConfiguration:", v17);
  objc_msgSend(v18, "setDelegate:", self->_context);
  -[WFNANPublishTableViewController clearInputFields](self, "clearInputFields");
  -[WFNANPublishTableViewController context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addPublisher:", v18);

  -[WFNANPublishTableViewController dismissKeyboard](self, "dismissKeyboard");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  WFNANDataSessionsTableViewController *v8;
  WFNANTableViewContext *context;
  void *v10;
  WFNANDataSessionsTableViewController *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[WFNANPublishTableViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 1 && -[WFNANTableViewContext getPublishersCount](self->_context, "getPublishersCount") >= 1)
  {
    v8 = [WFNANDataSessionsTableViewController alloc];
    context = self->_context;
    -[WFNANTableViewContext getPublisherAtIndex:](context, "getPublisherAtIndex:", objc_msgSend(v13, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFNANDataSessionsTableViewController initWithContext:forPublisher:](v8, "initWithContext:forPublisher:", context, v10);

    -[WFNANPublishTableViewController navigationController](self, "navigationController");
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

- (WFNetworkSettingsCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setCellFactory:(id)a3
{
  objc_storeStrong((id *)&self->_cellFactory, a3);
}

- (WFNANPublishTableViewDataSource)dataSource
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

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
  objc_storeStrong((id *)&self->_instanceName, a3);
}

- (NSString)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSpecificInfo, a3);
}

- (BOOL)isServiceSpecificInfoHex
{
  return self->_isServiceSpecificInfoHex;
}

- (void)setIsServiceSpecificInfoHex:(BOOL)a3
{
  self->_isServiceSpecificInfoHex = a3;
}

- (NSString)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(id)a3
{
  self->_portNumber = (NSString *)a3;
}

- (int64_t)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(int64_t)a3
{
  self->_protocolType = a3;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  self->_passphrase = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
