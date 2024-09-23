@implementation WFDiagnosticsTableViewController

- (WFDiagnosticsTableViewController)initWithDiagnosticsContext:(id)a3 detailsProviderContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  WFDiagnosticsTableViewController *v10;

  v6 = (void *)MEMORY[0x24BEC2918];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultAppearanceProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFDiagnosticsTableViewController initWithDiagnosticsContext:detailsProviderContext:appearanceProxy:](self, "initWithDiagnosticsContext:detailsProviderContext:appearanceProxy:", v8, v7, v9);

  return v10;
}

- (WFDiagnosticsTableViewController)initWithDiagnosticsContext:(id)a3 detailsProviderContext:(id)a4 appearanceProxy:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFDiagnosticsTableViewController *v12;
  WFDiagnosticsTableViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSOrderedSet *sections;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)WFDiagnosticsTableViewController;
  v12 = -[WFDiagnosticsTableViewController initWithStyle:](&v25, sel_initWithStyle_, objc_msgSend(v11, "tableViewStyle"));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_detailsContext, a4);
    objc_initWeak(&location, v13);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __102__WFDiagnosticsTableViewController_initWithDiagnosticsContext_detailsProviderContext_appearanceProxy___block_invoke;
    v22 = &unk_24DC347A0;
    objc_copyWeak(&v23, &location);
    -[WFDiagnosticsProviderContext setRefreshHandler:](v13->_context, "setRefreshHandler:", &v19);
    v14 = (void *)MEMORY[0x24BDBCF00];
    -[WFDiagnosticsTableViewController _defaultSections](v13, "_defaultSections", v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orderedSetWithArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    sections = v13->_sections;
    v13->_sections = (NSOrderedSet *)v16;

    objc_storeStrong((id *)&v13->_appearanceProxy, a5);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __102__WFDiagnosticsTableViewController_initWithDiagnosticsContext_detailsProviderContext_appearanceProxy___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refresh");

}

- (void)viewDidLoad
{
  WFNetworkSettingsCellFactory *v3;
  void *v4;
  WFNetworkSettingsCellFactory *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDiagnosticsTableViewController;
  -[WFDiagnosticsTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[WFDiagnosticsTableViewController setTitle:](self, "setTitle:", CFSTR("Diagnostics"));
  v3 = [WFNetworkSettingsCellFactory alloc];
  -[WFDiagnosticsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFNetworkSettingsCellFactory initWithTableView:](v3, "initWithTableView:", v4);
  -[WFDiagnosticsTableViewController setCellFactory:](self, "setCellFactory:", v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFDiagnosticsTableViewController;
  -[WFDiagnosticsTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[WFDiagnosticsTableViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)_refresh
{
  id v2;

  -[WFDiagnosticsTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (id)_defaultSections
{
  return &unk_24DC5DCC0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFDiagnosticsTableViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  unint64_t v7;

  -[WFDiagnosticsTableViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 > 5)
    return 0;
  else
    return qword_21A062CA8[v7];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  -[WFDiagnosticsTableViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  switch(v7)
  {
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("kWFLocDiagnosticsCoexistence");
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("kWFLocDiagnosticsLinkLayer");
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("kWFLocDiagnosticsConnectivity");
      break;
    default:
      v11 = 0;
      return v11;
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[WFDiagnosticsTableViewController sections](self, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  switch(v8)
  {
    case 5:
      -[WFDiagnosticsTableViewController context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "coexFooter");
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[WFDiagnosticsTableViewController context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "probeFooter");
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[WFDiagnosticsTableViewController context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cca");
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      return v11;
  }
  v11 = (void *)v10;

  return v11;
}

- (WFHyperlinkFooterView)networkQualityFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WFHyperlinkFooterView *networkQualityFooterView;
  const char *v17;
  NSDate *networkQualityFooterDate;
  WFHyperlinkFooterView *v19;
  WFHyperlinkFooterView *v20;
  _BYTE v22[22];
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  NSDate *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_networkQualityFooterView)
  {
    -[WFDiagnosticsTableViewController context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkQualityDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {

      goto LABEL_16;
    }
    v5 = v4;
    if (self->_networkQualityFooterDate)
    {
      -[WFDiagnosticsTableViewController context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "networkQualityDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_networkQualityFooterDate);

      if ((v8 & 1) != 0)
        goto LABEL_16;
    }
    else
    {

    }
  }
  WFLogForCategory(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9)
  {
    v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      -[WFDiagnosticsTableViewController context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "networkQualityDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsTableViewController context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkQualityResponsiveness");
      networkQualityFooterView = self->_networkQualityFooterView;
      v17 = "YES";
      networkQualityFooterDate = self->_networkQualityFooterDate;
      *(_QWORD *)&v22[4] = "-[WFDiagnosticsTableViewController networkQualityFooterView]";
      *(_DWORD *)v22 = 136316162;
      *(_WORD *)&v22[12] = 2112;
      if (!networkQualityFooterView)
        v17 = "NO";
      *(_QWORD *)&v22[14] = v13;
      v23 = 2048;
      v24 = v15;
      v25 = 2080;
      v26 = v17;
      v27 = 2112;
      v28 = networkQualityFooterDate;
      _os_log_impl(&dword_219FC8000, v11, v10, "NetQuality: %s: Date is %@, responsiveness %.3f, existing view? %s existing date? %@", v22, 0x34u);

    }
  }

  v19 = objc_alloc_init(WFHyperlinkFooterView);
  v20 = self->_networkQualityFooterView;
  self->_networkQualityFooterView = v19;

LABEL_16:
  -[WFDiagnosticsTableViewController _updateNetworkQualityFooterText](self, "_updateNetworkQualityFooterText", *(_OWORD *)v22);
  return self->_networkQualityFooterView;
}

- (void)_networkQualityOpenURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityKBURL"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

}

- (void)_openNetworkQualityDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  id v29;

  v4 = objc_alloc(MEMORY[0x24BE6E448]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v4, "initWithTitle:detailText:symbolName:contentLayout:", v6, 0, 0, 2);

  WFCurrentDeviceCapability();
  LODWORD(v5) = WFCapabilityIsChinaDevice();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection1Title"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v5)
    v11 = CFSTR("kWFLocNetworkQualityLearnMoreSection1TextCH");
  else
    v11 = CFSTR("kWFLocNetworkQualityLearnMoreSection1Text");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSectionWithHeader:content:", v8, v12);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection2Title"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection2Text"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSectionWithHeader:content:", v14, v16);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection3Title"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection3Text"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSectionWithHeader:content:", v18, v20);

  objc_msgSend(MEMORY[0x24BE6E440], "accessoryButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityKBURL"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v23, 0);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__networkQualityOpenURL, 64);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityLearnMoreSection4Text"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSectionWithHeader:content:accessoryButton:", 0, v25, v21);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePressed);
  objc_msgSend(v29, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRightBarButtonItem:", v26);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v29);
  -[WFDiagnosticsTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v28, 1, 0);

}

- (void)donePressed
{
  id v2;

  -[WFDiagnosticsTableViewController presentedViewController](self, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[WFDiagnosticsTableViewController sections](self, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 == 3)
  {
    -[WFDiagnosticsTableViewController networkQualityFooterView](self, "networkQualityFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v8)
  {
    v9 = 0;
  }
  else
  {
    -[WFDiagnosticsTableViewController linkFooterView](self, "linkFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (WFHyperlinkFooterView)linkFooterView
{
  WFHyperlinkFooterView *linkFooterView;
  WFHyperlinkFooterView *v4;
  WFHyperlinkFooterView *v5;

  linkFooterView = self->_linkFooterView;
  if (!linkFooterView)
  {
    v4 = objc_alloc_init(WFHyperlinkFooterView);
    v5 = self->_linkFooterView;
    self->_linkFooterView = v4;

    -[WFHyperlinkFooterView setText:](self->_linkFooterView, "setText:", CFSTR("File a radar here."));
    -[WFHyperlinkFooterView setLinkRange:](self->_linkFooterView, "setLinkRange:", 0, objc_msgSend(CFSTR("File a radar here."), "length"));
    -[WFHyperlinkFooterView setTarget:](self->_linkFooterView, "setTarget:", self);
    linkFooterView = self->_linkFooterView;
  }
  return linkFooterView;
}

- (void)_reloadNetworkQualityCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[WFDiagnosticsTableViewController sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", &unk_24DC5D918);

  -[WFDiagnosticsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

}

- (void)_updateNetworkQualityFooterText
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *networkQualityFooterDate;
  id v21;

  -[WFDiagnosticsTableViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkQualityDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityFooterKnown"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityFooterLink"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocNetworkQualityFooterLastChecked"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setDateStyle:", 1);
    objc_msgSend(v10, "setTimeStyle:", 1);
    objc_msgSend(v10, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v21, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[WFDiagnosticsTableViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "networkQualityDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n%@ %@"), v11, v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDiagnosticsTableViewController context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "networkQualityDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSDate *)objc_msgSend(v18, "copy");
    networkQualityFooterDate = self->_networkQualityFooterDate;
    self->_networkQualityFooterDate = v19;

    -[WFHyperlinkFooterView setText:](self->_networkQualityFooterView, "setText:", v16);
    -[WFHyperlinkFooterView setLinkRange:](self->_networkQualityFooterView, "setLinkRange:", objc_msgSend(v11, "length") - objc_msgSend(v7, "length"), objc_msgSend(v7, "length"));
    -[WFHyperlinkFooterView setTarget:](self->_networkQualityFooterView, "setTarget:", self);
    -[WFHyperlinkFooterView setAction:](self->_networkQualityFooterView, "setAction:", sel__openNetworkQualityDetails_);

  }
  else
  {
    -[WFHyperlinkFooterView setText:](self->_networkQualityFooterView, "setText:", 0);
  }
}

- (void)_runNetworkQuality
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!-[WFDiagnosticsTableViewController networkQualitySpinning](self, "networkQualitySpinning"))
  {
    WFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFDiagnosticsTableViewController _runNetworkQuality]";
      _os_log_impl(&dword_219FC8000, v3, v4, "NetQuality: %s: User scheduled a run", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertText"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertContinue"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityAlertCancel"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v12, 1, &__block_literal_global_9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v14);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_85;
    v16[3] = &unk_24DC36140;
    v16[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v10, 0, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v15);
    objc_msgSend(v13, "setPreferredAction:", v15);
    -[WFDiagnosticsTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

void __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke()
{
  NSObject *v0;
  os_log_type_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v0 && os_log_type_enabled(v0, v1))
  {
    v2 = 136315138;
    v3 = "-[WFDiagnosticsTableViewController _runNetworkQuality]_block_invoke";
    _os_log_impl(&dword_219FC8000, v0, v1, "NetQuality: %s: User canceled test-run", (uint8_t *)&v2, 0xCu);
  }

}

void __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_85(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "setNetworkQualitySpinning:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkQualityCell");
  objc_msgSend(*(id *)(a1 + 32), "detailsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_2;
  v3[3] = &unk_24DC36118;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "runNetworkQualityWithCompletionHandler:", v3);

}

void __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_2(uint64_t a1, int a2, void *a3, double a4)
{
  char v4;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  char v12;

  v4 = a2;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
    objc_msgSend(v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNetworkQualityResponsiveness:", a4);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNetworkQualityDate:", v8);

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_3;
  v11[3] = &unk_24DC35940;
  v12 = v4;
  v11[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
}

uint64_t __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "networkQualitySpinning"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityFailureTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityFailureText"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityFailureOK"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v9);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setNetworkQualitySpinning:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateNetworkQualityFooterText");
  return objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkQualityCell");
}

- (void)_fillNetworkQualityCell:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  if (!-[WFDiagnosticsTableViewController networkQualitySpinning](self, "networkQualitySpinning"))
  {
    -[WFDiagnosticsTableViewController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkQualityResponsiveness");
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 0.0)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityNoData"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
LABEL_14:

      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTitle:forState:", v26, 0);
      objc_msgSend(v4, "setAccessoryView:", v22);
      objc_msgSend(v4, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "font");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFont:", v24);

      objc_msgSend(v22, "sizeToFit");
      objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__runNetworkQuality, 64);

      goto LABEL_15;
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityRPM"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEDCBF8];
    -[WFDiagnosticsTableViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "networkQualityResponsiveness");
    v14 = objc_msgSend(v11, "ratingForResponsivenessScore:", (uint64_t)v13);

    if (v14 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("kWFLocSettingNetworkQualityHigh");
    }
    else if (v14 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("kWFLocSettingNetworkQualityMedium");
    }
    else
    {
      if (v14)
      {
        v18 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("kWFLocSettingNetworkQualityLow");
    }
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[WFDiagnosticsTableViewController context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "networkQualityResponsiveness");
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%u %@)"), v18, v21, v10);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "setAccessoryView:", v26);

  objc_msgSend(v26, "startAnimating");
LABEL_15:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  os_log_type_t v82;
  NSObject *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  _BOOL4 v87;
  const char *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _BYTE v109[22];
  __int16 v110;
  const char *v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFDiagnosticsTableViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(v9, "setSelectionStyle:", 0);
  switch(v8)
  {
    case 0:
      -[WFDiagnosticsTableViewController cellFactory](self, "cellFactory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recommendationCellAtIndexPath:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsDiagnosis"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v13);

      -[WFDiagnosticsTableViewController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "adviceString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptionLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      v9 = v11;
      goto LABEL_57;
    case 1:
      if (!objc_msgSend(v5, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsBSSID"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setText:", v49);

        -[WFDiagnosticsTableViewController context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "BSSID");
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
      if (objc_msgSend(v5, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsChannel"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setText:", v19);

        -[WFDiagnosticsTableViewController context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "channelString");
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
      if (objc_msgSend(v5, "row") == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsSignalStrength"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setText:", v67);

        -[WFDiagnosticsTableViewController context](self, "context");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "rssi");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "detailTextLabel");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setText:", v70);

        -[WFDiagnosticsTableViewController context](self, "context");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "rssi");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v71) = objc_msgSend(v73, "containsString:", CFSTR("Weak"));

        v74 = (void *)MEMORY[0x24BDF6950];
        if (!(_DWORD)v71)
          goto LABEL_49;
        goto LABEL_51;
      }
      goto LABEL_57;
    case 2:
      if (!objc_msgSend(v5, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsSecurity"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setText:", v52);

        -[WFDiagnosticsTableViewController context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "security");
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
      if (objc_msgSend(v5, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsCaptive"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setText:", v24);

        -[WFDiagnosticsTableViewController context](self, "context");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = objc_msgSend(v26, "captive");
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if ((_DWORD)v24)
          v29 = CFSTR("kWFLocDiagnosticsIsCaptive");
        else
          v29 = CFSTR("kWFLocDiagnosticsIsNotCaptive");
        objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "detailTextLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setText:", v30);

      }
      else
      {
        if (objc_msgSend(v5, "row") == 2)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsDeployment"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "textLabel");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setText:", v76);

          -[WFDiagnosticsTableViewController context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "deployment");
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_55;
        }
        if (objc_msgSend(v5, "row") == 3)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsMotion"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "textLabel");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setText:", v100);

          -[WFDiagnosticsTableViewController context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "motion");
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_55;
        }
      }
      goto LABEL_57;
    case 3:
      if (!objc_msgSend(v5, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsGateway"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setText:", v55);

        -[WFDiagnosticsTableViewController context](self, "context");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "gateway");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "detailTextLabel");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setText:", v58);

        -[WFDiagnosticsTableViewController context](self, "context");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "gateway");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v39, "containsString:", CFSTR("Fast")))
        {
          -[WFDiagnosticsTableViewController context](self, "context");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "gateway");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:
          v95 = v41;
          v96 = objc_msgSend(v41, "containsString:", CFSTR("Expected"));

          if (!v96)
          {
            v74 = (void *)MEMORY[0x24BDF6950];
LABEL_51:
            objc_msgSend(v74, "systemRedColor");
            v97 = objc_claimAutoreleasedReturnValue();
            goto LABEL_52;
          }
LABEL_48:
          v74 = (void *)MEMORY[0x24BDF6950];
LABEL_49:
          objc_msgSend(v74, "systemGreenColor");
          v97 = objc_claimAutoreleasedReturnValue();
LABEL_52:
          v21 = (void *)v97;
          objc_msgSend(v9, "detailTextLabel");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTextColor:", v21);
          goto LABEL_56;
        }
LABEL_25:

        goto LABEL_48;
      }
      if (objc_msgSend(v5, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsInternet"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setText:", v33);

        -[WFDiagnosticsTableViewController context](self, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "internet");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "detailTextLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setText:", v36);

        -[WFDiagnosticsTableViewController context](self, "context");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "internet");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v39, "containsString:", CFSTR("Fast")))
        {
          -[WFDiagnosticsTableViewController context](self, "context");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "internet");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_47;
        }
        goto LABEL_25;
      }
      if (objc_msgSend(v5, "row") == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingNetworkQualityText"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setText:", v79);

        WFLogForCategory(0);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v81)
        {
          v83 = v81;
          if (os_log_type_enabled(v83, v82))
          {
            -[WFDiagnosticsTableViewController context](self, "context");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "networkQualityResponsiveness");
            v86 = v85;
            v87 = -[WFDiagnosticsTableViewController networkQualitySpinning](self, "networkQualitySpinning");
            v88 = "NO";
            *(_QWORD *)&v109[4] = "-[WFDiagnosticsTableViewController tableView:cellForRowAtIndexPath:]";
            *(_DWORD *)v109 = 136315650;
            if (v87)
              v88 = "YES";
            *(_WORD *)&v109[12] = 2048;
            *(_QWORD *)&v109[14] = v86;
            v110 = 2080;
            v111 = v88;
            _os_log_impl(&dword_219FC8000, v83, v82, "NetQuality: %s: Responsiveness is %.1f, execution running? %s", v109, 0x20u);

          }
        }

        -[WFDiagnosticsTableViewController _fillNetworkQualityCell:](self, "_fillNetworkQualityCell:", v9);
      }
LABEL_57:
      -[WFDiagnosticsTableViewController appearanceProxy](self, "appearanceProxy", *(_OWORD *)v109);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "cellTextLabelFont");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (v104)
      {
        -[WFDiagnosticsTableViewController appearanceProxy](self, "appearanceProxy");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "cellTextLabelFont");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setFont:", v106);

      }
      return v9;
    case 4:
      if (!objc_msgSend(v5, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsBeaconPER"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setText:", v61);

        -[WFDiagnosticsTableViewController context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "beaconPER");
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
      if (objc_msgSend(v5, "row") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsTransmitPER"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setText:", v43);

        -[WFDiagnosticsTableViewController context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "transmitPER");
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
      if (objc_msgSend(v5, "row") != 2)
        goto LABEL_57;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsReceivedFrames"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setText:", v90);

      -[WFDiagnosticsTableViewController context](self, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recvFrames");
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    case 5:
      if (objc_msgSend(v5, "row"))
      {
        if (objc_msgSend(v5, "row") == 1)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsBluetooth"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "textLabel");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setText:", v46);

          -[WFDiagnosticsTableViewController context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bluetooth");
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v5, "row") != 2)
            goto LABEL_57;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsScan"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "textLabel");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setText:", v93);

          -[WFDiagnosticsTableViewController context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scan");
          v22 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsAWDLMode"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textLabel");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setText:", v64);

        -[WFDiagnosticsTableViewController context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "awdl");
        v22 = objc_claimAutoreleasedReturnValue();
      }
LABEL_55:
      v98 = (void *)v22;
      objc_msgSend(v9, "detailTextLabel");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setText:", v98);

LABEL_56:
      goto LABEL_57;
    default:
      goto LABEL_57;
  }
}

- (WFDiagnosticsProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (WFDetailsProviderContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
  objc_storeStrong((id *)&self->_detailsContext, a3);
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (WFNetworkSettingsCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setCellFactory:(id)a3
{
  objc_storeStrong((id *)&self->_cellFactory, a3);
}

- (void)setLinkFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_linkFooterView, a3);
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProxy, a3);
}

- (void)setNetworkQualityFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityFooterView, a3);
}

- (NSDate)networkQualityFooterDate
{
  return self->_networkQualityFooterDate;
}

- (void)setNetworkQualityFooterDate:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityFooterDate, a3);
}

- (UITableViewCell)networkQualityCell
{
  return self->_networkQualityCell;
}

- (void)setNetworkQualityCell:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityCell, a3);
}

- (BOOL)networkQualitySpinning
{
  return self->_networkQualitySpinning;
}

- (void)setNetworkQualitySpinning:(BOOL)a3
{
  self->_networkQualitySpinning = a3;
}

- (BOOL)useInsetGroupedTableView
{
  return self->_useInsetGroupedTableView;
}

- (void)setUseInsetGroupedTableView:(BOOL)a3
{
  self->_useInsetGroupedTableView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkQualityCell, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterDate, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterView, 0);
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_linkFooterView, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
