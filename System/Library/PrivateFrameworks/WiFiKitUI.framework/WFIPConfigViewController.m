@implementation WFIPConfigViewController

- (WFIPConfigViewController)initWithConfig:(id)a3 ipType:(int64_t)a4
{
  id v6;
  void *v7;
  WFIPConfigViewController *v8;

  v6 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFIPConfigViewController initWithConfig:ipType:appearanceProxy:](self, "initWithConfig:ipType:appearanceProxy:", v6, a4, v7);

  return v8;
}

- (WFIPConfigViewController)initWithConfig:(id)a3 ipType:(int64_t)a4 appearanceProxy:(id)a5
{
  id v9;
  WFIPConfigViewController *v10;
  WFIPConfigViewController *v11;
  uint64_t v12;
  WFNetworkSettingsConfig *modifiedConfig;
  NSObject *v14;
  os_log_type_t v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFIPConfigViewController;
  v10 = -[WFIPConfigViewController initWithStyle:](&v17, sel_initWithStyle_, objc_msgSend(a5, "tableViewStyle"));
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&v10->_originalConfig, a3);
    v12 = objc_msgSend(v9, "copy");
    modifiedConfig = v11->_modifiedConfig;
    v11->_modifiedConfig = (WFNetworkSettingsConfig *)v12;

    if (!a4 && -[WFNetworkSettingsConfig ipv4Config](v11->_modifiedConfig, "ipv4Config") == -1)
    {
      WFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFIPConfigViewController initWithConfig:ipType:appearanceProxy:]";
        _os_log_impl(&dword_2196CC000, v14, v15, "%s: previous ipv4Config is unknown", buf, 0xCu);
      }

      -[WFNetworkSettingsConfig setIpv4Config:](v11->_modifiedConfig, "setIpv4Config:", 0);
    }
    v11->_type = a4;
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFIPConfigViewController;
  -[WFIPConfigViewController viewDidLoad](&v16, sel_viewDidLoad);
  if (-[WFIPConfigViewController type](self, "type"))
  {
    if (-[WFIPConfigViewController type](self, "type") != 1)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocSettingsIPV6ConfigureTitle");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("kWFLocSettingsIPV4ConfigureTitle");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIPConfigViewController setTitle:](self, "setTitle:", v6);

LABEL_6:
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_save_);
  -[WFIPConfigViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  -[WFIPConfigViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 0);

  v11 = *MEMORY[0x24BEBE770];
  -[WFIPConfigViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRowHeight:", v11);

  -[WFIPConfigViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEstimatedRowHeight:", 44.0);

  -[WFIPConfigViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEstimatedSectionHeaderHeight:", 0.0);

  if (objc_msgSend(MEMORY[0x24BEBD538], "currentIsIPad"))
  {
    -[WFIPConfigViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);

  }
  -[WFIPConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFIPConfigViewController;
  -[WFIPConfigViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)_updateSaveEnabled
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIPConfigViewController originalConfig](self, "originalConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    if (-[WFIPConfigViewController type](self, "type"))
    {
      if (-[WFIPConfigViewController type](self, "type") != 1)
      {
        v6 = 1;
        goto LABEL_9;
      }
      -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "validIPv6Configuration");
    }
    else
    {
      -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "validIPv4Configuration");
    }
    v6 = v8;

  }
LABEL_9:
  -[WFIPConfigViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v6);

}

- (void)save:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;
  id v8;

  -[WFIPConfigViewController saveHandler](self, "saveHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFIPConfigViewController saveHandler](self, "saveHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  -[WFIPConfigViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;

  if (-[WFIPConfigViewController type](self, "type", a3))
  {
    if (-[WFIPConfigViewController type](self, "type") == 1)
    {
      -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "ipv6Config");

      if (v5 == 1)
        return 2;
      else
        return 1;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "ipv4Config") == 1)
      v6 = 1;
    else
      v6 = 2;

  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  if (a4 != 1)
  {
    if (!a4)
    {
      if (-[WFIPConfigViewController type](self, "type"))
      {
        v7 = -[WFIPConfigViewController type](self, "type") == 1;
        goto LABEL_8;
      }
LABEL_13:
      v10 = 3;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  if (!-[WFIPConfigViewController type](self, "type"))
  {
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ipv4Config");

    if (!v12)
    {
      v10 = 1;
      goto LABEL_17;
    }
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ipv4Config");

    if (v14 == 2)
      goto LABEL_13;
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ipv4Config");

    goto LABEL_16;
  }
  if (-[WFIPConfigViewController type](self, "type") != 1)
    goto LABEL_16;
  -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ipv6Config");

  v7 = v9 == 1;
LABEL_8:
  if (v7)
    v10 = 3;
  else
    v10 = 0;
LABEL_17:

  return v10;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    if (objc_msgSend(v5, "section") == 1)
    {
      if (-[WFIPConfigViewController type](self, "type"))
      {
        if (-[WFIPConfigViewController type](self, "type") == 1)
        {
          -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "ipv6Config");

          if (v7 == 1)
          {
            if (objc_msgSend(v5, "row"))
            {
              if (objc_msgSend(v5, "row") == 1)
              {
                -[WFIPConfigViewController prefixCell](self, "prefixCell");
                v8 = objc_claimAutoreleasedReturnValue();
LABEL_39:
                v9 = (void *)v8;
                goto LABEL_41;
              }
LABEL_37:
              if (objc_msgSend(v5, "row") == 2)
              {
                -[WFIPConfigViewController routerCell](self, "routerCell");
                v8 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              }
              goto LABEL_40;
            }
            goto LABEL_36;
          }
        }
      }
      else
      {
        -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "ipv4Config");

        if (!v21)
        {
          if (!objc_msgSend(v5, "row"))
          {
            -[WFIPConfigViewController clientIDCell](self, "clientIDCell");
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_39;
          }
          goto LABEL_40;
        }
        -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "ipv4Config");

        if (v23 == 2)
        {
          if (objc_msgSend(v5, "row"))
          {
            if (objc_msgSend(v5, "row") == 1)
            {
              -[WFIPConfigViewController subnetMaskCell](self, "subnetMaskCell");
              v8 = objc_claimAutoreleasedReturnValue();
              goto LABEL_39;
            }
            goto LABEL_37;
          }
LABEL_36:
          -[WFIPConfigViewController ipAddressCell](self, "ipAddressCell");
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        }
      }
    }
LABEL_40:
    v9 = 0;
    goto LABEL_41;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v9, "setAccessoryType:", 0);
  if (-[WFIPConfigViewController type](self, "type"))
  {
    if (-[WFIPConfigViewController type](self, "type") != 1)
      goto LABEL_41;
    if (objc_msgSend(v5, "row"))
    {
      if (objc_msgSend(v5, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6ConfigureManual"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v11);

        -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "ipv6Config");
        goto LABEL_28;
      }
      if (objc_msgSend(v5, "row") != 2)
        goto LABEL_41;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6ConfigureLinkLocal"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setText:", v38);

      -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "ipv6Config");
LABEL_34:
      v40 = v19;

      if (v40 != 2)
        goto LABEL_41;
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6ConfigureAutomatic"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "ipv6Config");
LABEL_24:
    v32 = v28;

    if (v32)
      goto LABEL_41;
    goto LABEL_35;
  }
  if (!objc_msgSend(v5, "row"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4ConfigureAutomatic"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "ipv4Config");
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "row") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4ConfigureManual"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "ipv4Config");
    goto LABEL_34;
  }
  if (objc_msgSend(v5, "row") != 2)
    goto LABEL_41;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4ConfigureBootP"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setText:", v34);

  -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ipv4Config");
LABEL_28:
  v36 = v14;

  if (v36 == 1)
LABEL_35:
    objc_msgSend(v9, "setAccessoryType:", 3);
LABEL_41:
  -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "cellTextLabelFont");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "cellTextLabelFont");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFont:", v44);

  }
  return v9;
}

- (void)_setFirstResponderAfterCell:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WFIPConfigViewController ipAddressCell](self, "ipAddressCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v10)
  {
    if (-[WFIPConfigViewController type](self, "type"))
    {
      if (-[WFIPConfigViewController type](self, "type") != 1)
        goto LABEL_14;
      -[WFIPConfigViewController prefixCell](self, "prefixCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFIPConfigViewController subnetMaskCell](self, "subnetMaskCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  -[WFIPConfigViewController prefixCell](self, "prefixCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v10)
  {

    goto LABEL_10;
  }
  -[WFIPConfigViewController subnetMaskCell](self, "subnetMaskCell");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {
LABEL_10:
    -[WFIPConfigViewController routerCell](self, "routerCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[WFIPConfigViewController routerCell](self, "routerCell");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v10)
    goto LABEL_14;
  -[WFIPConfigViewController ipAddressCell](self, "ipAddressCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "becomeFirstResponder");

  }
LABEL_14:

}

- (WFTextFieldCell)ipAddressCell
{
  WFTextFieldCell *ipAddressCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  WFTextFieldCell *v39;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id from;
  _QWORD v46[4];
  id v47;
  id location;

  ipAddressCell = self->_ipAddressCell;
  if (ipAddressCell)
    return ipAddressCell;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

  -[WFTextFieldCell textField](v6, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 2);

  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __41__WFIPConfigViewController_ipAddressCell__block_invoke;
  v46[3] = &unk_24DB37BD8;
  objc_copyWeak(&v47, &location);
  -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v46);
  if (!-[WFIPConfigViewController type](self, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4AddressCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ipv4AddressManual");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    -[WFIPConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v30, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setKeyboardType:", 2);

    objc_initWeak(&from, self);
    v43[0] = v8;
    v43[1] = 3221225472;
    v43[2] = __41__WFIPConfigViewController_ipAddressCell__block_invoke_2;
    v43[3] = &unk_24DB37328;
    v23 = &v44;
    objc_copyWeak(&v44, &from);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v43);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d.%d.%d"), 0, 0, 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPlaceholder:", v32);

LABEL_8:
    objc_destroyWeak(v23);
    objc_destroyWeak(&from);
    goto LABEL_9;
  }
  if (-[WFIPConfigViewController type](self, "type") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6AddressCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ipv6AddressManual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[WFIPConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v15, 0.0, 0.0);
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ipv6Addresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ipv6Addresses");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textField](v6, "textField");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPlaceholder:", v21);

    }
    objc_initWeak(&from, self);
    v41[0] = v8;
    v41[1] = 3221225472;
    v41[2] = __41__WFIPConfigViewController_ipAddressCell__block_invoke_3;
    v41[3] = &unk_24DB37328;
    v23 = &v42;
    objc_copyWeak(&v42, &from);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v41);
    goto LABEL_8;
  }
LABEL_9:
  -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "cellTextLabelFont");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "cellTextLabelFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textLabel](v6, "textLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFont:", v37);

  }
  v39 = self->_ipAddressCell;
  self->_ipAddressCell = v6;

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
  ipAddressCell = self->_ipAddressCell;
  return ipAddressCell;
}

void __41__WFIPConfigViewController_ipAddressCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

void __41__WFIPConfigViewController_ipAddressCell__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIpv4AddressManual:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __41__WFIPConfigViewController_ipAddressCell__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIpv6AddressManual:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

- (WFTextFieldCell)subnetMaskCell
{
  WFTextFieldCell *subnetMaskCell;
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFTextFieldCell *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  subnetMaskCell = self->_subnetMaskCell;
  if (!subnetMaskCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsSubnetMaskCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFIPConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ipv4SubnetMaskManual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setKeyboardType:", 2);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d.%d.%d"), 255, 255, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPlaceholder:", v16);

    objc_initWeak(&location, self);
    v18 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __42__WFIPConfigViewController_subnetMaskCell__block_invoke;
    v28[3] = &unk_24DB37328;
    objc_copyWeak(&v29, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v28);
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __42__WFIPConfigViewController_subnetMaskCell__block_invoke_2;
    v26[3] = &unk_24DB37BD8;
    objc_copyWeak(&v27, &location);
    -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v26);
    -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cellTextLabelFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cellTextLabelFont");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFont:", v22);

    }
    v24 = self->_subnetMaskCell;
    self->_subnetMaskCell = v6;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    subnetMaskCell = self->_subnetMaskCell;
  }
  return subnetMaskCell;
}

void __42__WFIPConfigViewController_subnetMaskCell__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIpv4SubnetMaskManual:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __42__WFIPConfigViewController_subnetMaskCell__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (WFTextFieldCell)prefixCell
{
  WFTextFieldCell *prefixCell;
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

  prefixCell = self->_prefixCell;
  if (!prefixCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6ConfigurePrefixLength"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFIPConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ipv6PrefixLengthManual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 64);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaceholder:", v15);

    objc_initWeak(&location, self);
    v17 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __38__WFIPConfigViewController_prefixCell__block_invoke;
    v27[3] = &unk_24DB37328;
    objc_copyWeak(&v28, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v27);
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __38__WFIPConfigViewController_prefixCell__block_invoke_2;
    v25[3] = &unk_24DB37BD8;
    objc_copyWeak(&v26, &location);
    -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v25);
    -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cellTextLabelFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cellTextLabelFont");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v21);

    }
    v23 = self->_prefixCell;
    self->_prefixCell = v6;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    prefixCell = self->_prefixCell;
  }
  return prefixCell;
}

void __38__WFIPConfigViewController_prefixCell__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIpv6PrefixLengthManual:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __38__WFIPConfigViewController_prefixCell__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

- (WFTextFieldCell)routerCell
{
  WFTextFieldCell *routerCell;
  void *v4;
  void *v5;
  WFTextFieldCell *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
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
  WFTextFieldCell *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id from;
  _QWORD v40[4];
  id v41;
  id location;

  routerCell = self->_routerCell;
  if (routerCell)
    return routerCell;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

  -[WFTextFieldCell textField](v6, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 2);

  -[WFIPConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
  -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v8, 0.0, 0.0);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __38__WFIPConfigViewController_routerCell__block_invoke;
  v40[3] = &unk_24DB37BD8;
  objc_copyWeak(&v41, &location);
  -[WFTextFieldCell setReturnKeyHandler:](v6, "setReturnKeyHandler:", v40);
  if (!-[WFIPConfigViewController type](self, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4RouterCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ipv4RouterAddressManual");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    -[WFTextFieldCell textField](v6, "textField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setKeyboardType:", 2);

    -[WFTextFieldCell textField](v6, "textField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPlaceholder:", &stru_24DB39F78);

    objc_initWeak(&from, self);
    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __38__WFIPConfigViewController_routerCell__block_invoke_2;
    v37[3] = &unk_24DB37328;
    v19 = &v38;
    objc_copyWeak(&v38, &from);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v37);
    goto LABEL_6;
  }
  if (-[WFIPConfigViewController type](self, "type") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6RouterCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ipv6RouterAddressManual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ipv6RouterAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPlaceholder:", v17);

    objc_initWeak(&from, self);
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __38__WFIPConfigViewController_routerCell__block_invoke_3;
    v35[3] = &unk_24DB37328;
    v19 = &v36;
    objc_copyWeak(&v36, &from);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", v35);
LABEL_6:
    objc_destroyWeak(v19);
    objc_destroyWeak(&from);
  }
  -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "cellTextLabelFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cellTextLabelFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textLabel](v6, "textLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v31);

  }
  v33 = self->_routerCell;
  self->_routerCell = v6;

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
  routerCell = self->_routerCell;
  return routerCell;
}

void __38__WFIPConfigViewController_routerCell__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setFirstResponderAfterCell:", v3);

}

void __38__WFIPConfigViewController_routerCell__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIpv4RouterAddressManual:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

void __38__WFIPConfigViewController_routerCell__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIpv6RouterAddressManual:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

- (WFTextFieldCell)clientIDCell
{
  WFTextFieldCell *clientIDCell;
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
  void *v17;
  void *v18;
  void *v19;
  WFTextFieldCell *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;

  clientIDCell = self->_clientIDCell;
  if (!clientIDCell)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNibNamed:owner:options:", CFSTR("WFTextFieldCell"), self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (WFTextFieldCell *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsClientIDCell"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell label](v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[WFIPConfigViewController _configCellLeadingInset](self, "_configCellLeadingInset");
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    -[WFTextFieldCell textField](v6, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dhcpClientID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextFieldCell textField](v6, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    objc_initWeak(&location, self);
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __40__WFIPConfigViewController_clientIDCell__block_invoke;
    v25 = &unk_24DB37328;
    objc_copyWeak(&v26, &location);
    -[WFTextFieldCell setTextChangeHandler:](v6, "setTextChangeHandler:", &v22);
    -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy", v22, v23, v24, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellTextLabelFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[WFIPConfigViewController appearanceProxy](self, "appearanceProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cellTextLabelFont");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTextFieldCell textLabel](v6, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFont:", v18);

    }
    v20 = self->_clientIDCell;
    self->_clientIDCell = v6;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    clientIDCell = self->_clientIDCell;
  }
  return clientIDCell;
}

void __40__WFIPConfigViewController_clientIDCell__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setDhcpClientID:", v4);

  objc_msgSend(WeakRetained, "_updateSaveEnabled");
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a4 == 1
    && !-[WFIPConfigViewController type](self, "type", a3)
    && (-[WFIPConfigViewController modifiedConfig](self, "modifiedConfig"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "ipv4Config"),
        v5,
        v6 == 2))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV4ConfigureManualSectionHeader"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
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
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
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
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  _QWORD v58[4];

  v58[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (objc_msgSend(v7, "section"))
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "becomeFirstResponder");

    goto LABEL_5;
  }
  if (-[WFIPConfigViewController type](self, "type"))
  {
    if (-[WFIPConfigViewController type](self, "type") != 1)
      goto LABEL_5;
    if (!objc_msgSend(v7, "row"))
      goto LABEL_20;
    if (objc_msgSend(v7, "row") == 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 1;
      v12 = 1;
      goto LABEL_21;
    }
    if (objc_msgSend(v7, "row") == 2)
    {
      v11 = 0;
      v9 = 0;
      v10 = 1;
      v12 = 2;
    }
    else
    {
LABEL_20:
      v11 = 0;
      v10 = 0;
      v12 = 0;
      v9 = 1;
    }
LABEL_21:
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "ipv6Config");

    if (v12 == v21)
      goto LABEL_5;
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "ipv6Config");

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIpv6Config:", v12);

    if (v11)
    {
      -[WFIPConfigViewController tableView](self, "tableView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "beginUpdates");

      -[WFIPConfigViewController tableView](self, "tableView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "insertSections:withRowAnimation:", v27, 0);

      -[WFIPConfigViewController tableView](self, "tableView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v29;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v30;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v31;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
      LODWORD(v26) = v9;
      v32 = v10;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "insertRowsAtIndexPaths:withRowAnimation:", v33, 0);

      v10 = v32;
      v9 = (int)v26;
      v34 = 3;

      -[WFIPConfigViewController tableView](self, "tableView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "endUpdates");

      -[WFIPConfigViewController ipAddressCell](self, "ipAddressCell");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "becomeFirstResponder");
    }
    else
    {
      v34 = 0;
      if ((v9 | v10) != 1 || v23 != 1)
      {
LABEL_28:
        if (v9)
          v45 = 3;
        else
          v45 = 0;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cellForRowAtIndexPath:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setAccessoryType:", v45);

        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cellForRowAtIndexPath:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setAccessoryType:", v34);

        if (v10)
          v50 = 3;
        else
          v50 = 0;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cellForRowAtIndexPath:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setAccessoryType:", v50);

        goto LABEL_5;
      }
      -[WFIPConfigViewController tableView](self, "tableView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "beginUpdates");

      -[WFIPConfigViewController tableView](self, "tableView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "deleteSections:withRowAnimation:", v39, 0);

      -[WFIPConfigViewController tableView](self, "tableView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v41;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v42;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v57[2] = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "deleteRowsAtIndexPaths:withRowAnimation:", v44, 0);

      -[WFIPConfigViewController tableView](self, "tableView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "endUpdates");
      v34 = 0;
    }

    goto LABEL_28;
  }
  if (objc_msgSend(v7, "row"))
  {
    if (objc_msgSend(v7, "row") == 1)
      v13 = 2;
    else
      v13 = objc_msgSend(v7, "row") == 2;
  }
  else
  {
    v13 = 0;
  }
  -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "ipv4Config");

  if (v13 != v15)
  {
    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "ipv4Config");

    -[WFIPConfigViewController modifiedConfig](self, "modifiedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIpv4Config:", v13);

    -[WFIPConfigViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __62__WFIPConfigViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v53[3] = &unk_24DB37C58;
    v55 = v13;
    v56 = v17;
    v53[4] = self;
    v54 = v6;
    objc_msgSend(v19, "performBatchUpdates:completion:", v53, &__block_literal_global_3);

  }
LABEL_5:
  -[WFIPConfigViewController _updateSaveEnabled](self, "_updateSaveEnabled");

}

void __62__WFIPConfigViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  void *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[4];

  v56[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  switch(v2)
  {
    case 0:
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v22;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deleteRowsAtIndexPaths:withRowAnimation:", v24, 0);

        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "reloadRowsAtIndexPaths:withRowAnimation:", v27, 5);

        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_reloadSectionHeaderFooters:withRowAnimation:", v15, 0);
        goto LABEL_15;
      }
      if (v11 != 1)
        break;
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSections:withRowAnimation:", v13, 0);

      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertRowsAtIndexPaths:withRowAnimation:", v16, 0);

LABEL_15:
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deleteSections:withRowAnimation:", v15, 0);
      goto LABEL_15;
    case 2:
      v3 = *(_QWORD *)(a1 + 56);
      if (v3)
      {
        if (v3 != 1)
        {
LABEL_13:
          objc_msgSend(*(id *)(a1 + 32), "ipAddressCell");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textField");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "performSelector:withObject:afterDelay:", sel_becomeFirstResponder, 0, 0.1);
          goto LABEL_15;
        }
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "insertSections:withRowAnimation:", v5, 0);

        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v7;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v8;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v56[2] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v10, 0);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v18;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "insertRowsAtIndexPaths:withRowAnimation:", v20, 0);

        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 5);
      }

      goto LABEL_13;
  }
  WFLogForCategory(0);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v28 && os_log_type_enabled(v28, v29))
  {
    v31 = *(_QWORD *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 56);
    v45 = 136315650;
    v46 = "-[WFIPConfigViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v47 = 2048;
    v48 = v30;
    v49 = 2048;
    v50 = v31;
    _os_log_impl(&dword_2196CC000, v28, v29, "%s: IP Config -- previous config: %ld new config: %ld.", (uint8_t *)&v45, 0x20u);
  }

  v32 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 48))
    v33 = 0;
  else
    v33 = 3;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cellForRowAtIndexPath:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAccessoryType:", v33);

  v36 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 48) == 2)
    v37 = 3;
  else
    v37 = 0;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "cellForRowAtIndexPath:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessoryType:", v37);

  v41 = a1 + 40;
  v40 = *(void **)(a1 + 40);
  if (*(_QWORD *)(v41 + 8) == 1)
    v42 = 3;
  else
    v42 = 0;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "cellForRowAtIndexPath:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAccessoryType:", v42);

}

void __62__WFIPConfigViewController_tableView_didSelectRowAtIndexPath___block_invoke_60()
{
  NSObject *v0;
  os_log_type_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v0 && os_log_type_enabled(v0, v1))
  {
    v2 = 136315138;
    v3 = "-[WFIPConfigViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_2196CC000, v0, v1, "%s: Finished inserting and deleting cells for IP Config.", (uint8_t *)&v2, 0xCu);
  }

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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setIpAddressCell:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddressCell, a3);
}

- (void)setSubnetMaskCell:(id)a3
{
  objc_storeStrong((id *)&self->_subnetMaskCell, a3);
}

- (void)setRouterCell:(id)a3
{
  objc_storeStrong((id *)&self->_routerCell, a3);
}

- (void)setPrefixCell:(id)a3
{
  objc_storeStrong((id *)&self->_prefixCell, a3);
}

- (void)setClientIDCell:(id)a3
{
  objc_storeStrong((id *)&self->_clientIDCell, a3);
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
  objc_storeStrong((id *)&self->_clientIDCell, 0);
  objc_storeStrong((id *)&self->_prefixCell, 0);
  objc_storeStrong((id *)&self->_routerCell, 0);
  objc_storeStrong((id *)&self->_subnetMaskCell, 0);
  objc_storeStrong((id *)&self->_ipAddressCell, 0);
  objc_storeStrong((id *)&self->_modifiedConfig, 0);
  objc_storeStrong((id *)&self->_originalConfig, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end
