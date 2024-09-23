@implementation WFProxyConfigViewController

- (WFProxyConfigViewController)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  WFProxyConfigViewController *v6;

  v4 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFProxyConfigViewController initWithConfig:appearanceProxy:](self, "initWithConfig:appearanceProxy:", v4, v5);

  return v6;
}

- (WFProxyConfigViewController)initWithConfig:(id)a3 appearanceProxy:(id)a4
{
  id v7;
  id v8;
  WFProxyConfigViewController *v9;
  WFProxyConfigViewController *v10;
  uint64_t v11;
  WFNetworkSettingsConfig *modifiedConfig;
  WFAppearanceProxy *v13;
  void *appearanceProxy;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFProxyConfigViewController;
  v9 = -[WFProxyConfigViewController initWithStyle:](&v16, sel_initWithStyle_, objc_msgSend(v8, "tableViewStyle"));
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v9->_originalConfig, a3);
      v11 = objc_msgSend(v7, "copy");
      modifiedConfig = v10->_modifiedConfig;
      v10->_modifiedConfig = (WFNetworkSettingsConfig *)v11;

      v13 = (WFAppearanceProxy *)v8;
      appearanceProxy = v10->_appearanceProxy;
      v10->_appearanceProxy = v13;
    }
    else
    {
      appearanceProxy = 0;
    }
  }
  else
  {
    appearanceProxy = v9;
    v10 = 0;
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
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WFProxyConfigViewController;
  -[WFProxyConfigViewController viewDidLoad](&v19, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyConfigureTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFProxyConfigViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_save_);
  -[WFProxyConfigViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[WFProxyConfigViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  v9 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFProxyConfigViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerNib:forCellReuseIdentifier:", v11, CFSTR("kWFTextFieldCellIdentifier"));

  v13 = *MEMORY[0x24BEBE770];
  -[WFProxyConfigViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRowHeight:", v13);

  -[WFProxyConfigViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEstimatedRowHeight:", 44.0);

  -[WFProxyConfigViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEstimatedSectionHeaderHeight:", 0.0);

  -[WFProxyConfigViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEstimatedSectionFooterHeight:", 0.0);

  if (objc_msgSend(MEMORY[0x24BEBD538], "currentIsIPad"))
  {
    -[WFProxyConfigViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);

  }
}

- (void)_updateSaveEnabled
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFProxyConfigViewController originalConfig](self, "originalConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "validProxyConfiguration");

  }
  -[WFProxyConfigViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

}

- (void)save:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;
  id v8;

  -[WFProxyConfigViewController saveHandler](self, "saveHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFProxyConfigViewController saveHandler](self, "saveHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  -[WFProxyConfigViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "httpProxyConfig") == 1)
  {

    return 2;
  }
  -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "httpProxyConfig");

  if (v6 == 2)
    return 2;
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;

  v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "httpProxyConfig");

      -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == 1)
      {
        v11 = objc_msgSend(v9, "httpProxyAuthenticationRequired");

        if (v11)
          v12 = 5;
        else
          v12 = 3;
      }
      else
      {
        v12 = objc_msgSend(v9, "httpProxyConfig") == 2;

      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 3;
  }

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
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
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a4;
  if (!objc_msgSend(v5, "section"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
    if (objc_msgSend(v5, "row"))
    {
      if (objc_msgSend(v5, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyConfigManualTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v11);

        -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "httpProxyConfig") == 1;
      }
      else
      {
        if (objc_msgSend(v5, "row") != 2)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyConfigAutomaticTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setText:", v21);

        -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "httpProxyConfig") == 2;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyConfigOffTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);

      -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "httpProxyConfig") == 0;
    }
    if (v14)
      v23 = 3;
    else
      v23 = 0;
    objc_msgSend(v9, "setAccessoryType:", v23);
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "section") != 1)
    goto LABEL_29;
  -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "httpProxyConfig");

  if (v7 != 2)
  {
    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "httpProxyConfig");

    if (v16 != 1)
      goto LABEL_29;
    if (!objc_msgSend(v5, "row"))
    {
      -[WFProxyConfigViewController serverCell](self, "serverCell");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "row") == 1)
    {
      -[WFProxyConfigViewController portCell](self, "portCell");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "row") != 2)
    {
      if (objc_msgSend(v5, "row") == 3)
      {
        -[WFProxyConfigViewController userCell](self, "userCell");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (objc_msgSend(v5, "row") == 4)
      {
        -[WFProxyConfigViewController passwordCell](self, "passwordCell");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      goto LABEL_29;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyAuthenticationCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

    v27 = objc_alloc(MEMORY[0x24BEBD9B8]);
    v13 = (void *)objc_msgSend(v27, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOn:", objc_msgSend(v28, "httpProxyAuthenticationRequired"));

    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__changeProxyAuthentication_, 4096);
    objc_msgSend(v9, "setAccessoryView:", v13);
    objc_msgSend(v9, "setSelectionStyle:", 0);
LABEL_20:

    goto LABEL_30;
  }
  if (!objc_msgSend(v5, "row"))
  {
    -[WFProxyConfigViewController urlCell](self, "urlCell");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v9 = (void *)v8;
    goto LABEL_30;
  }
LABEL_29:
  v9 = 0;
LABEL_30:
  -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "cellTextLabelFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "cellTextLabelFont");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFont:", v32);

  }
  return v9;
}

- (void)_setFirstResponderAfterCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[WFProxyConfigViewController serverCell](self, "serverCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[WFProxyConfigViewController portCell](self, "portCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v4 != v11)
  {

    if (v5 == v11)
    {
      -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "httpProxyAuthenticationRequired");

      if (v9)
      {
        -[WFProxyConfigViewController userCell](self, "userCell");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v5 = (id)v10;
        v6 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      -[WFProxyConfigViewController userCell](self, "userCell");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[WFProxyConfigViewController passwordCell](self, "passwordCell");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (v7 == v11)
        goto LABEL_10;

      v6 = v11;
      if (v5 != v11)
        goto LABEL_12;
    }
    -[WFProxyConfigViewController serverCell](self, "serverCell");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  if (v5)
  {
    objc_msgSend(v5, "becomeFirstResponder");

    v6 = v11;
  }
LABEL_12:

}

- (WFTextFieldCell)serverCell
{
  WFTextFieldCell *serverCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WFTextFieldCell *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  serverCell = self->_serverCell;
  if (!serverCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyServerCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFProxyConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFTextFieldCell textField](v6, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeyboardType:", 3);

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "httpProxyServerAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_initWeak(&location, self);
    v16 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __41__WFProxyConfigViewController_serverCell__block_invoke;
    v26[3] = &unk_24DB37328;
    objc_copyWeak(&v27, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v26);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __41__WFProxyConfigViewController_serverCell__block_invoke_2;
    v24[3] = &unk_24DB37BD8;
    objc_copyWeak(&v25, &location);
    -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v24);
    -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellTextLabelFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cellTextLabelFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v20);

    }
    v22 = self->_serverCell;
    self->_serverCell = v6;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    serverCell = self->_serverCell;
  }
  return serverCell;
}

void __41__WFProxyConfigViewController_serverCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(WeakRetained, "modifiedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHttpProxyServerAddress:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __41__WFProxyConfigViewController_serverCell__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (WFTextFieldCell)portCell
{
  WFTextFieldCell *portCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WFTextFieldCell *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  portCell = self->_portCell;
  if (!portCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyPortCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFProxyConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "httpProxyServerPort");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setKeyboardType:", 4);

    objc_initWeak(&location, self);
    v16 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __39__WFProxyConfigViewController_portCell__block_invoke;
    v26[3] = &unk_24DB37328;
    objc_copyWeak(&v27, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v26);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __39__WFProxyConfigViewController_portCell__block_invoke_2;
    v24[3] = &unk_24DB37BD8;
    objc_copyWeak(&v25, &location);
    -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v24);
    -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellTextLabelFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cellTextLabelFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v20);

    }
    v22 = self->_portCell;
    self->_portCell = v6;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    portCell = self->_portCell;
  }
  return portCell;
}

void __39__WFProxyConfigViewController_portCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(WeakRetained, "modifiedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHttpProxyServerPort:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __39__WFProxyConfigViewController_portCell__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (WFTextFieldCell)userCell
{
  WFTextFieldCell *userCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WFTextFieldCell *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  userCell = self->_userCell;
  if (!userCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyUsernameCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFProxyConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFTextFieldCell textField](v6, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextContentType:", *MEMORY[0x24BEBE848]);

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "httpProxyUsername");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_initWeak(&location, self);
    v16 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __39__WFProxyConfigViewController_userCell__block_invoke;
    v26[3] = &unk_24DB37328;
    objc_copyWeak(&v27, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v26);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __39__WFProxyConfigViewController_userCell__block_invoke_2;
    v24[3] = &unk_24DB37BD8;
    objc_copyWeak(&v25, &location);
    -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v24);
    -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellTextLabelFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cellTextLabelFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v20);

    }
    v22 = self->_userCell;
    self->_userCell = v6;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    userCell = self->_userCell;
  }
  return userCell;
}

void __39__WFProxyConfigViewController_userCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(WeakRetained, "modifiedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHttpProxyUsername:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __39__WFProxyConfigViewController_userCell__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (WFTextFieldCell)passwordCell
{
  WFTextFieldCell *passwordCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WFTextFieldCell *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  passwordCell = self->_passwordCell;
  if (!passwordCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyPasswordCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFProxyConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFTextFieldCell textField](v6, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextContentType:", *MEMORY[0x24BEBE810]);

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "httpProxyPassword");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    -[WFTextFieldCell textField](v6, "textField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSecureTextEntry:", 1);

    objc_initWeak(&location, self);
    v17 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __43__WFProxyConfigViewController_passwordCell__block_invoke;
    v27[3] = &unk_24DB37328;
    objc_copyWeak(&v28, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v27);
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __43__WFProxyConfigViewController_passwordCell__block_invoke_2;
    v25[3] = &unk_24DB37BD8;
    objc_copyWeak(&v26, &location);
    -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v25);
    -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cellTextLabelFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cellTextLabelFont");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v21);

    }
    v23 = self->_passwordCell;
    self->_passwordCell = v6;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    passwordCell = self->_passwordCell;
  }
  return passwordCell;
}

void __43__WFProxyConfigViewController_passwordCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(WeakRetained, "modifiedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHttpProxyPassword:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __43__WFProxyConfigViewController_passwordCell__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (WFTextFieldCell)urlCell
{
  WFTextFieldCell *urlCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFTextFieldCell *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id location;

  urlCell = self->_urlCell;
  if (!urlCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    -[WFProxyConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v7, 0.0, 0.0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsProxyURLCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyboardType:", 3);

    -[WFTextFieldCell textField](v6, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 2);

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "httpProxyConfigPAC");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_initWeak(&location, self);
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __38__WFProxyConfigViewController_urlCell__block_invoke;
    v26 = &unk_24DB37328;
    objc_copyWeak(&v27, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", &v23);
    -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy", v23, v24, v25, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cellTextLabelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[WFProxyConfigViewController appearanceProxy](self, "appearanceProxy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cellTextLabelFont");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFont:", v19);

    }
    v21 = self->_urlCell;
    self->_urlCell = v6;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    urlCell = self->_urlCell;
  }
  return urlCell;
}

void __38__WFProxyConfigViewController_urlCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "modifiedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHttpProxyConfigPAC:", v3);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  void *v57;
  _QWORD v58[3];
  _QWORD v59[2];
  void *v60;
  _QWORD v61[3];
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (!objc_msgSend(v7, "section"))
  {
    v9 = objc_msgSend(v7, "row");

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "httpProxyConfig");

    if (v11 == v9)
      goto LABEL_31;
    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "httpProxyConfig");

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "httpProxyAuthenticationRequired");

    -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHttpProxyConfig:", v9);

    if (v15 && v9 != 1)
    {
      -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHttpProxyAuthenticationRequired:", 0);

    }
    if (v9 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAccessoryType:", 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAccessoryType:", 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAccessoryType:", 3);

      if (v13)
      {
        if (v13 == 1)
        {
          objc_msgSend(v6, "beginUpdates");
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v33;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v34, 0);

          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = v35;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v56[1] = v36;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v37, 0);

          if (v15)
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = v38;
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 4, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v55[1] = v39;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v40, 0);

          }
          objc_msgSend(v6, "endUpdates");
          objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "reloadSections:withRowAnimation:", v41, 5);

        }
        goto LABEL_30;
      }
      objc_msgSend(v6, "beginUpdates");
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertSections:withRowAnimation:", v52, 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v26, 0);
      goto LABEL_28;
    }
    if (v9 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAccessoryType:", 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAccessoryType:", 3);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAccessoryType:", 0);

      objc_msgSend(v6, "beginUpdates");
      if (v13)
      {
        if (v13 != 2)
          goto LABEL_29;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v48;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v49, 0);

        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v25;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v50, 0);
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertSections:withRowAnimation:", v53, 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v25;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v26;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v50;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v51, 0);
    }
    else
    {
      if (v9)
      {
LABEL_30:
        -[WFProxyConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAccessoryType:", 3);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAccessoryType:", 0);

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAccessoryType:", 0);

      objc_msgSend(v6, "beginUpdates");
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteSections:withRowAnimation:", v24, 0);

      if (v13 != 1)
      {
        if (v13 == 2)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v25;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v26, 0);
LABEL_28:

        }
LABEL_29:
        objc_msgSend(v6, "endUpdates");
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v25;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v26;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v61[2] = v50;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v51, 0);
    }

    goto LABEL_27;
  }
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "becomeFirstResponder");

LABEL_31:
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (a4 == 1
    && (-[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig", a3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "httpProxyAuthenticationRequired"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocProxyAuthenticationWarningFooter"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_changeProxyAuthentication:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "isOn");
  -[WFProxyConfigViewController modifiedConfig](self, "modifiedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setHttpProxyAuthenticationRequired:", 1);

    -[WFProxyConfigViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v10, 0);
  }
  else
  {
    objc_msgSend(v5, "setHttpProxyAuthenticationRequired:", 0);

    -[WFProxyConfigViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 3, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 0);
  }

  -[WFProxyConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
  -[WFProxyConfigViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 5);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (WFNetworkSettingsConfig)originalConfig
{
  return self->_originalConfig;
}

- (void)setOriginalConfig:(id)a3
{
  objc_storeStrong((id *)&self->_originalConfig, a3);
}

- (WFNetworkSettingsConfig)modifiedConfig
{
  return self->_modifiedConfig;
}

- (void)setModifiedConfig:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedConfig, a3);
}

- (UISwitch)authSwitch
{
  return self->_authSwitch;
}

- (void)setAuthSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_authSwitch, a3);
}

- (void)setServerCell:(id)a3
{
  objc_storeStrong((id *)&self->_serverCell, a3);
}

- (void)setPortCell:(id)a3
{
  objc_storeStrong((id *)&self->_portCell, a3);
}

- (void)setUserCell:(id)a3
{
  objc_storeStrong((id *)&self->_userCell, a3);
}

- (void)setPasswordCell:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCell, a3);
}

- (void)setUrlCell:(id)a3
{
  objc_storeStrong((id *)&self->_urlCell, a3);
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_urlCell, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_userCell, 0);
  objc_storeStrong((id *)&self->_portCell, 0);
  objc_storeStrong((id *)&self->_serverCell, 0);
  objc_storeStrong((id *)&self->_authSwitch, 0);
  objc_storeStrong((id *)&self->_modifiedConfig, 0);
  objc_storeStrong((id *)&self->_originalConfig, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end
