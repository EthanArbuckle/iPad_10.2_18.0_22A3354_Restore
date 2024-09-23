@implementation WFDNSConfigViewController

- (WFDNSConfigViewController)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  WFDNSConfigViewController *v6;

  v4 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFDNSConfigViewController initWithConfig:appearanceProxy:](self, "initWithConfig:appearanceProxy:", v4, v5);

  return v6;
}

- (WFDNSConfigViewController)initWithConfig:(id)a3 appearanceProxy:(id)a4
{
  id v6;
  id v7;
  WFDNSConfigViewController *v8;
  WFDNSConfigViewController *v9;
  char v10;
  uint64_t v11;
  NSArray *originalServers;
  void *v13;
  uint64_t v14;
  NSMutableArray *servers;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  NSArray *originalDomains;
  void *v20;
  uint64_t v21;
  NSMutableArray *domains;
  uint64_t v23;
  NSMutableArray *v24;
  void *v25;
  os_log_type_t v26;
  NSObject *v27;
  NSMutableArray *v28;
  NSObject *v29;
  os_log_type_t v30;
  NSMutableArray *v31;
  NSObject *p_super;
  os_log_type_t v33;
  NSMutableArray *v34;
  objc_super v36;
  uint8_t buf[4];
  NSMutableArray *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WFDNSConfigViewController;
  v8 = -[WFDNSConfigViewController initWithStyle:](&v36, sel_initWithStyle_, objc_msgSend(v7, "tableViewStyle"));
  v9 = v8;
  if (v6)
  {
    if (v8)
    {
      v8->_originalDNSConfig = objc_msgSend(v6, "dnsConfig");
      v9->_dnsConfig = objc_msgSend(v6, "dnsConfig");
      v9->_deviceCapability = WFCurrentDeviceCapability();
      if (objc_msgSend(v6, "privacyProxyTierStatus") == 2)
        v10 = objc_msgSend(v6, "privacyProxyEnabled");
      else
        v10 = 0;
      v9->_shouldShowPrivacyRelayHeader = v10;
      objc_msgSend(v6, "dnsServerAddresses");
      v11 = objc_claimAutoreleasedReturnValue();
      originalServers = v9->_originalServers;
      v9->_originalServers = (NSArray *)v11;

      objc_msgSend(v6, "dnsServerAddresses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "mutableCopy");
      servers = v9->_servers;
      v9->_servers = (NSMutableArray *)v14;

      if (!v9->_servers)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v9->_servers;
        v9->_servers = (NSMutableArray *)v16;

      }
      objc_msgSend(v6, "dnsSearchDomains");
      v18 = objc_claimAutoreleasedReturnValue();
      originalDomains = v9->_originalDomains;
      v9->_originalDomains = (NSArray *)v18;

      objc_msgSend(v6, "dnsSearchDomains");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "mutableCopy");
      domains = v9->_domains;
      v9->_domains = (NSMutableArray *)v21;

      if (!v9->_domains)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v9->_domains;
        v9->_domains = (NSMutableArray *)v23;

      }
      objc_storeStrong((id *)&v9->_appearanceProxy, a4);
      WFLogForCategory(0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25)
      {
        v27 = v25;
        if (os_log_type_enabled(v27, v26))
        {
          objc_msgSend(v6, "ssid");
          v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v28;
          _os_log_impl(&dword_2196CC000, v27, v26, "show DNS config view controller for network='%@'", buf, 0xCu);

        }
      }

      WFLogForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v30))
      {
        v31 = v9->_servers;
        *(_DWORD *)buf = 138412290;
        v38 = v31;
        _os_log_impl(&dword_2196CC000, v29, v30, "DNS servers='%@'", buf, 0xCu);
      }

      WFLogForCategory(0);
      p_super = objc_claimAutoreleasedReturnValue();
      v33 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v33))
      {
        v34 = v9->_domains;
        *(_DWORD *)buf = 138412290;
        v38 = v34;
        _os_log_impl(&dword_2196CC000, p_super, v33, "DNS domains='%@'", buf, 0xCu);
      }
    }
    else
    {
      p_super = 0;
    }
  }
  else
  {
    p_super = &v8->super.super.super.super.super;
    v9 = 0;
  }

  return v9;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WFDNSConfigViewController;
  -[WFDNSConfigViewController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSConfigureTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDNSConfigViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_save_);
  -[WFDNSConfigViewController setSaveButton:](self, "setSaveButton:", v5);

  -[WFDNSConfigViewController saveButton](self, "saveButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[WFDNSConfigViewController saveButton](self, "saveButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDNSConfigViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDNSConfigViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerNib:forCellReuseIdentifier:", v11, CFSTR("kWFTextFieldCellIdentifier"));

  -[WFDNSConfigViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsSelectionDuringEditing:", 1);

  v14 = *MEMORY[0x24BEBE770];
  -[WFDNSConfigViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRowHeight:", v14);

  -[WFDNSConfigViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEstimatedRowHeight:", 44.0);

  -[WFDNSConfigViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEstimatedSectionHeaderHeight:", 0.0);

  -[WFDNSConfigViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEstimatedSectionFooterHeight:", 0.0);

  if (-[WFDNSConfigViewController dnsConfig](self, "dnsConfig") == 1)
    -[WFDNSConfigViewController setEditing:](self, "setEditing:", 1);
  if (objc_msgSend(MEMORY[0x24BEBD538], "currentIsIPad"))
  {
    -[WFDNSConfigViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);

  }
}

- (int64_t)sectionNumberForSection:(int64_t)a3
{
  return self->_shouldShowPrivacyRelayHeader + a3 - 1;
}

- (int64_t)sectionForSectionNumber:(int64_t)a3
{
  if (self->_shouldShowPrivacyRelayHeader)
    return a3;
  else
    return a3 + 1;
}

- (void)save:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  NSMutableArray *servers;
  NSObject *v16;
  os_log_type_t v17;
  NSMutableArray *domains;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  id v21;
  int v22;
  NSMutableArray *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[WFDNSConfigViewController saveHandler](self, "saveHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDNSConfigViewController servers](self, "servers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[WFDNSConfigViewController servers](self, "servers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayAfterFilteringOutEmptyStrings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

    -[WFDNSConfigViewController domains](self, "domains");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[WFDNSConfigViewController domains](self, "domains");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayAfterFilteringOutEmptyStrings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2196CC000, v11, v12, "saving DNS servers and domains", (uint8_t *)&v22, 2u);
    }

    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
    {
      servers = self->_servers;
      v22 = 138412290;
      v23 = servers;
      _os_log_impl(&dword_2196CC000, v13, v14, "DNS servers='%@'", (uint8_t *)&v22, 0xCu);
    }

    WFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      domains = self->_domains;
      v22 = 138412290;
      v23 = domains;
      _os_log_impl(&dword_2196CC000, v16, v17, "DNS domains='%@'", (uint8_t *)&v22, 0xCu);
    }

    -[WFDNSConfigViewController saveHandler](self, "saveHandler");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, int64_t, void *, void *))v19)[2](v19, -[WFDNSConfigViewController dnsConfig](self, "dnsConfig"), v7, v10);

  }
  -[WFDNSConfigViewController navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "popViewControllerAnimated:", 1);

}

- (void)_updateSaveEnabled
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;

  -[WFDNSConfigViewController originalServers](self, "originalServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDNSConfigViewController servers](self, "servers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToArray:", v4)
    && (v5 = -[WFDNSConfigViewController dnsConfig](self, "dnsConfig"),
        v5 == -[WFDNSConfigViewController originalDNSConfig](self, "originalDNSConfig")))
  {
    -[WFDNSConfigViewController originalDomains](self, "originalDomains");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDNSConfigViewController domains](self, "domains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToArray:", v7) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[WFDNSConfigViewController originalDomains](self, "originalDomains");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v8 = 1;
      }
      else
      {
        -[WFDNSConfigViewController domains](self, "domains");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v10, "count") != 0;

      }
    }

  }
  else
  {
    v8 = 1;
  }

  -[WFDNSConfigViewController saveButton](self, "saveButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v8);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_shouldShowPrivacyRelayHeader)
    return 4;
  else
    return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;

  v6 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", a4);
  v7 = -[WFDNSConfigViewController sectionNumberForSection:](self, "sectionNumberForSection:", 1);
  if (v6 == 3)
  {
    -[WFDNSConfigViewController domains](self, "domains");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 != 2)
    {
      if (v6 == 1)
        v8 = 2;
      else
        v8 = 0;
      goto LABEL_9;
    }
    -[WFDNSConfigViewController servers](self, "servers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v8 = objc_msgSend(v9, "count");

LABEL_9:
  v11 = -[WFDNSConfigViewController isEditing](self, "isEditing");
  if (v7 < a4)
    v12 = v11;
  else
    v12 = 0;
  return v8 + v12;
}

- (BOOL)_isChinaDevice
{
  return WFCapabilityIsChinaDevice(-[WFDNSConfigViewController deviceCapability](self, "deviceCapability"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  int v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v50[4];
  id v51[2];
  _QWORD v52[4];
  id v53[2];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "row");
  v9 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", objc_msgSend(v7, "section"));
  switch(v9)
  {
    case 3:
      -[WFDNSConfigViewController domains](self, "domains");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)v8 >= objc_msgSend(v16, "count"))
      {
        v27 = -[WFDNSConfigViewController isEditing](self, "isEditing");

        if (v27)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, 0);
          objc_msgSend(v10, "setAccessoryType:", 0);
          -[WFDNSConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
          objc_msgSend(v10, "setLayoutMargins:", 0.0, v28, 0.0, 0.0);
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSAddSearchDomain"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "textLabel");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setText:", v30);

          objc_msgSend(v10, "setSelectionStyle:", 1);
          objc_msgSend(v10, "setIndentationLevel:", 5);
          break;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHideLabel:", 1);
      objc_msgSend(v10, "setEditable:", -[WFDNSConfigViewController isEditing](self, "isEditing"));
      -[WFDNSConfigViewController domains](self, "domains");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textField");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setText:", v33);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSSearchDomainPlaceholder"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textField");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setPlaceholder:", v36);

      -[WFDNSConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
      objc_msgSend(v10, "setLayoutMargins:", 0.0, v38, 0.0, 0.0);
      objc_initWeak(&location, self);
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
      v50[3] = &unk_24DB37AF0;
      objc_copyWeak(v51, &location);
      v51[1] = v8;
      objc_msgSend(v10, "setTextChangeHandler:", v50);
      objc_destroyWeak(v51);
      objc_destroyWeak(&location);
      break;
    case 2:
      -[WFDNSConfigViewController servers](self, "servers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)v8 >= objc_msgSend(v17, "count")
        && -[WFDNSConfigViewController isEditing](self, "isEditing"))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, 0);
        objc_msgSend(v10, "setAccessoryType:", 0);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSAddServer"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setText:", v19);

        objc_msgSend(v10, "setSelectionStyle:", 1);
        -[WFDNSConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
        objc_msgSend(v10, "setLayoutMargins:", 0.0, v21, 0.0, 0.0);
        objc_msgSend(v10, "setIndentationLevel:", 5);
      }
      else
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setHideLabel:", 1);
        objc_msgSend(v10, "setEditable:", -[WFDNSConfigViewController isEditing](self, "isEditing"));
        objc_msgSend(v17, "objectAtIndexedSubscript:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textField");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setText:", v22);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d.%d.%d"), 0, 0, 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textField");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPlaceholder:", v24);

        -[WFDNSConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
        objc_msgSend(v10, "setLayoutMargins:", 0.0, v26, 0.0, 0.0);
        objc_initWeak(&location, self);
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v52[3] = &unk_24DB37AF0;
        objc_copyWeak(v53, &location);
        v53[1] = v8;
        objc_msgSend(v10, "setTextChangeHandler:", v52);
        objc_destroyWeak(v53);
        objc_destroyWeak(&location);
      }

      break;
    case 1:
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
      if (!objc_msgSend(v7, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSConfigureAutomatic"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setText:", v40);

        if (-[WFDNSConfigViewController dnsConfig](self, "dnsConfig"))
          v42 = 0;
        else
          v42 = 3;
        objc_msgSend(v10, "setAccessoryType:", v42);
        v15 = -[WFDNSConfigViewController dnsConfig](self, "dnsConfig") == 0;
        goto LABEL_25;
      }
      if (objc_msgSend(v7, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsDNSConfigureManual"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v12);

        if (-[WFDNSConfigViewController dnsConfig](self, "dnsConfig") == 1)
          v14 = 3;
        else
          v14 = 0;
        objc_msgSend(v10, "setAccessoryType:", v14);
        v15 = -[WFDNSConfigViewController dnsConfig](self, "dnsConfig") == 1;
LABEL_25:
        if (v15)
          v43 = 3;
        else
          v43 = 0;
        objc_msgSend(v10, "setEditingAccessoryType:", v43);
      }
      break;
    default:
      v10 = 0;
      break;
  }
  -[WFDNSConfigViewController appearanceProxy](self, "appearanceProxy");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "cellTextLabelFont");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[WFDNSConfigViewController appearanceProxy](self, "appearanceProxy");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "cellTextLabelFont");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFont:", v47);

  }
  return v10;
}

void __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "servers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(WeakRetained, "servers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 >= v7)
    objc_msgSend(v8, "addObject:", v4);
  else
    objc_msgSend(v8, "setObject:atIndexedSubscript:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "domains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", objc_msgSend(v7, "section"));
  if (a4 != 2)
  {
    if (a4 != 1)
      goto LABEL_17;
    if (v8 == 3)
    {
      -[WFDNSConfigViewController domains](self, "domains");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8 != 2)
      {
LABEL_11:
        v11 = v7;
        -[WFDNSConfigViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(v11, "section"));

        if (v13 >= 1)
        {
          if (objc_msgSend(v11, "row") >= v13)
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v13 - 1, objc_msgSend(v11, "section"));
            v14 = objc_claimAutoreleasedReturnValue();

            v11 = (id)v14;
          }
          -[WFDNSConfigViewController tableView](self, "tableView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 100);

          -[WFDNSConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
        }

        goto LABEL_17;
      }
      -[WFDNSConfigViewController servers](self, "servers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v7, "row"));

    goto LABEL_11;
  }
  if (v8 == 3)
  {
    -[WFDNSConfigViewController _addDomainAtIndexPath:](self, "_addDomainAtIndexPath:", v7);
  }
  else if (v8 == 2)
  {
    -[WFDNSConfigViewController _addServerAtIndexPath:](self, "_addServerAtIndexPath:", v7);
  }
LABEL_17:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
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
  uint64_t v31;
  void *v32;
  uint64_t v33;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  unint64_t v62;
  void *v63;
  unint64_t v64;
  void *v65;
  unint64_t v66;
  void *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  unint64_t v74;
  void *v75;
  unint64_t v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  unint64_t v84;
  void *v85;
  unint64_t v86;
  void *v87;
  unint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[2];
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[2];
  uint8_t buf[4];
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      *(_DWORD *)buf = 134218240;
      v106 = objc_msgSend(v7, "section");
      v107 = 2048;
      v108 = objc_msgSend(v7, "row");
      _os_log_impl(&dword_2196CC000, v10, v9, "tapped DNS config s=%ld r=%ld", buf, 0x16u);
    }

  }
  v11 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", objc_msgSend(v7, "section"));
  v12 = objc_msgSend(v7, "row");
  v13 = -[WFDNSConfigViewController sectionNumberForSection:](self, "sectionNumberForSection:", 1);
  v14 = -[WFDNSConfigViewController sectionNumberForSection:](self, "sectionNumberForSection:", 2);
  v15 = -[WFDNSConfigViewController sectionNumberForSection:](self, "sectionNumberForSection:", 3);
  if (v11 != 1)
  {
    -[WFDNSConfigViewController servers](self, "servers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 >= objc_msgSend(v30, "count") && -[WFDNSConfigViewController isEditing](self, "isEditing"))
    {
      v31 = objc_msgSend(v7, "section");

      if (v31 == v14)
      {
        -[WFDNSConfigViewController _addServerAtIndexPath:](self, "_addServerAtIndexPath:", v7);
        goto LABEL_47;
      }
    }
    else
    {

    }
    -[WFDNSConfigViewController domains](self, "domains");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 >= objc_msgSend(v32, "count") && -[WFDNSConfigViewController isEditing](self, "isEditing"))
    {
      v33 = objc_msgSend(v7, "section");

      if (v33 == v15)
      {
        -[WFDNSConfigViewController _addDomainAtIndexPath:](self, "_addDomainAtIndexPath:", v7);
        goto LABEL_47;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v34, "becomeFirstResponder");
    goto LABEL_46;
  }
  if (v12 != -[WFDNSConfigViewController dnsConfig](self, "dnsConfig"))
  {
    -[WFDNSConfigViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginUpdates");

    if (v12)
    {
      if (objc_msgSend(v7, "row") != 1)
      {
LABEL_45:
        -[WFDNSConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
        -[WFDNSConfigViewController tableView](self, "tableView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "endUpdates");
LABEL_46:

        goto LABEL_47;
      }
      -[WFDNSConfigViewController setDnsConfig:](self, "setDnsConfig:", 1);
      -[WFDNSConfigViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAccessoryType:", 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEditingAccessoryType:", 0);

      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAccessoryType:", 3);

      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setEditingAccessoryType:", 3);

      v23 = (void *)MEMORY[0x24BDD15D8];
      -[WFDNSConfigViewController servers](self, "servers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "indexPathForRow:inSection:", objc_msgSend(v24, "count"), v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD15D8];
      -[WFDNSConfigViewController domains](self, "domains", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "indexPathForRow:inSection:", objc_msgSend(v27, "count"), v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v29, 100);

    }
    else
    {
      -[WFDNSConfigViewController setDnsConfig:](self, "setDnsConfig:", 0);
      -[WFDNSConfigViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
      -[WFDNSConfigViewController tableView](self, "tableView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "beginUpdates");

      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAccessoryType:", 3);

      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setEditingAccessoryType:", 3);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAccessoryType:", 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, v13);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setEditingAccessoryType:", 0);

      v42 = (void *)MEMORY[0x24BDD15D8];
      -[WFDNSConfigViewController servers](self, "servers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "indexPathForRow:inSection:", objc_msgSend(v43, "count"), v14);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v104[0] = v44;
      v45 = (void *)MEMORY[0x24BDD15D8];
      -[WFDNSConfigViewController domains](self, "domains");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "indexPathForRow:inSection:", objc_msgSend(v46, "count"), v15);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v47;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v48, 100);

      -[WFDNSConfigViewController servers](self, "servers");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");
      -[WFDNSConfigViewController originalServers](self, "originalServers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      if (v50 <= v52)
      {
        -[WFDNSConfigViewController servers](self, "servers");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "count");
        -[WFDNSConfigViewController originalServers](self, "originalServers");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "count");

        if (v62 < v64)
        {
          -[WFDNSConfigViewController servers](self, "servers");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "count");

          while (1)
          {
            -[WFDNSConfigViewController originalServers](self, "originalServers");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "count");

            if (v66 >= v68)
              break;
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v66, v14);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v69;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v102, 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v70, 0);

            ++v66;
          }
        }
      }
      else
      {
        -[WFDNSConfigViewController originalServers](self, "originalServers");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "count");

        -[WFDNSConfigViewController servers](self, "servers");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count");

        if (v54 < v56)
        {
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v54, v14);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v57;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v58, 0);

            ++v54;
            -[WFDNSConfigViewController servers](self, "servers");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "count");

          }
          while (v54 < v60);
        }
      }
      -[WFDNSConfigViewController domains](self, "domains");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "count");
      -[WFDNSConfigViewController originalDomains](self, "originalDomains");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "count");

      if (v72 <= v74)
      {
        -[WFDNSConfigViewController domains](self, "domains");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "count");
        -[WFDNSConfigViewController originalDomains](self, "originalDomains");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "count");

        if (v82 < v84)
        {
          -[WFDNSConfigViewController domains](self, "domains");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "count");

          while (1)
          {
            -[WFDNSConfigViewController originalDomains](self, "originalDomains");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "count");

            if (v86 >= v88)
              break;
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v86, v15);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = v89;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v90, 0);

            ++v86;
          }
        }
      }
      else
      {
        -[WFDNSConfigViewController originalDomains](self, "originalDomains");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "count");

        while (1)
        {
          -[WFDNSConfigViewController domains](self, "domains");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "count");

          if (v76 >= v78)
            break;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v76, v15);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v79;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v80, 0);

          ++v76;
        }
      }
      -[WFDNSConfigViewController originalServers](self, "originalServers");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)objc_msgSend(v91, "mutableCopy");
      -[WFDNSConfigViewController setServers:](self, "setServers:", v92);

      -[WFDNSConfigViewController servers](self, "servers");
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v93)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDNSConfigViewController setServers:](self, "setServers:", v94);

      }
      -[WFDNSConfigViewController originalDomains](self, "originalDomains");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = (void *)objc_msgSend(v95, "mutableCopy");
      -[WFDNSConfigViewController setDomains:](self, "setDomains:", v96);

      -[WFDNSConfigViewController domains](self, "domains");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v97)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDNSConfigViewController setDomains:](self, "setDomains:", v98);

      }
      -[WFDNSConfigViewController tableView](self, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endUpdates");
    }

    goto LABEL_45;
  }
LABEL_47:

}

- (void)_addServerAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFDNSConfigViewController servers](self, "servers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", &stru_24DB39F78);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[WFDNSConfigViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "becomeFirstResponder");

  }
  else
  {
    -[WFDNSConfigViewController servers](self, "servers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", &stru_24DB39F78);

    -[WFDNSConfigViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertRowsAtIndexPaths:withRowAnimation:", v12, 100);

    -[WFDNSConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
    -[WFDNSConfigViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForRowAtIndexPath:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "becomeFirstResponder");
  }
}

- (void)_addDomainAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFDNSConfigViewController domains](self, "domains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", &stru_24DB39F78);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[WFDNSConfigViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "becomeFirstResponder");
  }
  else
  {
    -[WFDNSConfigViewController domains](self, "domains");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", &stru_24DB39F78);

    -[WFDNSConfigViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertRowsAtIndexPaths:withRowAnimation:", v12, 100);

    -[WFDNSConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
    -[WFDNSConfigViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForRowAtIndexPath:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "becomeFirstResponder");
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v13;
  void *v14;

  v5 = a4;
  v6 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", objc_msgSend(v5, "section"));
  if (v6 == 1 || (v7 = v6, !-[WFDNSConfigViewController isEditing](self, "isEditing")))
  {
    v11 = 0;
  }
  else if (v7 == 3)
  {
    v13 = objc_msgSend(v5, "row");
    -[WFDNSConfigViewController domains](self, "domains");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = v13 >= objc_msgSend(v14, "count");

    if ((v13 & 1) != 0)
      v11 = 2;
    else
      v11 = 1;
  }
  else if (v7 == 2
         && (v8 = objc_msgSend(v5, "row"),
             -[WFDNSConfigViewController servers](self, "servers"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "count"),
             v9,
             v8 >= v10))
  {
    v11 = 2;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  if (-[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", a4))
  {
    v5 = 0;
  }
  else
  {
    v6 = -[WFDNSConfigViewController _isChinaDevice](self, "_isChinaDevice");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = CFSTR("kWFLocSettingsDNSPrivateRelayFooterCH");
    else
      v9 = CFSTR("kWFLocSettingsDNSPrivateRelayFooter");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", a4);
  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("kWFLocSettingsSearchDomainsSectionHeader");
  }
  else
  {
    if (v4 != 2)
    {
      v8 = 0;
      return v8;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("kWFLocSettingsDNSSectionHeader");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", objc_msgSend(a4, "section", a3)) != 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)_configCellLeadingInset
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v7;
  else
    v8 = v4;
  v9 = v8 >= 414.0 && v8 <= 428.0;
  result = 20.0;
  if (!v9)
    return 16.0;
  return result;
}

- (id)saveHandler
{
  return self->_saveHandler;
}

- (void)setSaveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (int64_t)originalDNSConfig
{
  return self->_originalDNSConfig;
}

- (void)setOriginalDNSConfig:(int64_t)a3
{
  self->_originalDNSConfig = a3;
}

- (int64_t)dnsConfig
{
  return self->_dnsConfig;
}

- (void)setDnsConfig:(int64_t)a3
{
  self->_dnsConfig = a3;
}

- (NSArray)originalServers
{
  return self->_originalServers;
}

- (void)setOriginalServers:(id)a3
{
  objc_storeStrong((id *)&self->_originalServers, a3);
}

- (NSMutableArray)servers
{
  return self->_servers;
}

- (void)setServers:(id)a3
{
  objc_storeStrong((id *)&self->_servers, a3);
}

- (NSArray)originalDomains
{
  return self->_originalDomains;
}

- (void)setOriginalDomains:(id)a3
{
  objc_storeStrong((id *)&self->_originalDomains, a3);
}

- (NSMutableArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProxy, a3);
}

- (BOOL)shouldShowPrivacyRelayHeader
{
  return self->_shouldShowPrivacyRelayHeader;
}

- (void)setShouldShowPrivacyRelayHeader:(BOOL)a3
{
  self->_shouldShowPrivacyRelayHeader = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_originalDomains, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_originalServers, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end
