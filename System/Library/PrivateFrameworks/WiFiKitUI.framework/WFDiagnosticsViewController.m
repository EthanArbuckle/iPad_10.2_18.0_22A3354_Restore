@implementation WFDiagnosticsViewController

- (WFDiagnosticsViewController)initWithNANUI:(BOOL)a3
{
  WFDiagnosticsViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSOrderedSet *sections;

  v4 = -[WFDiagnosticsViewController initWithStyle:](self, "initWithStyle:", 1);
  v4->_showNANUI = a3;
  v5 = (void *)MEMORY[0x24BDBCF00];
  -[WFDiagnosticsViewController _defaultSections](v4, "_defaultSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  sections = v4->_sections;
  v4->_sections = (NSOrderedSet *)v7;

  return v4;
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
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFDiagnosticsViewController;
  -[WFDiagnosticsViewController viewDidLoad](&v15, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocWiFiDiagnosticsTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiagnosticsViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nibWithNibName:bundle:", CFSTR("WFTextFieldCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDiagnosticsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerNib:forCellReuseIdentifier:", v7, CFSTR("kWFTextFieldCellIdentifier"));

  -[WFDiagnosticsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCellLayoutMarginsFollowReadableWidth:", 0);

  v10 = *MEMORY[0x24BEBE770];
  -[WFDiagnosticsViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRowHeight:", v10);

  -[WFDiagnosticsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEstimatedRowHeight:", 44.0);

  -[WFDiagnosticsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEstimatedSectionHeaderHeight:", 0.0);

  -[WFDiagnosticsViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEstimatedSectionFooterHeight:", 0.0);

}

- (void)setSaving:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  self->_saving = a3;
  -[WFDiagnosticsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 100);

}

- (id)_defaultSections
{
  if (-[WFDiagnosticsViewController showNANUI](self, "showNANUI"))
    return &unk_24DB59E78;
  else
    return &unk_24DB59E90;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFDiagnosticsViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
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
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 IsChinaDevice;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id location;

  v6 = a3;
  v7 = a4;
  -[WFDiagnosticsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 == 2)
  {
    if (!-[WFDiagnosticsViewController showNANUI](self, "showNANUI"))
      goto LABEL_10;
    v19 = WFCurrentDeviceCapability();
    IsChinaDevice = WFCapabilityIsChinaDevice(v19);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (IsChinaDevice)
      v23 = CFSTR("kWFLocDiagnosticsNAN_CH");
    else
      v23 = CFSTR("kWFLocDiagnosticsNAN");
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    objc_msgSend(v11, "setAccessoryType:", 1);
    v26 = v11;
    v27 = 1;
LABEL_18:
    objc_msgSend(v26, "setSelectionStyle:", v27);
    goto LABEL_19;
  }
  if (v10 == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
    v28 = -[WFDiagnosticsViewController saving](self, "saving");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
      v31 = CFSTR("kWFLocDiagnosticsSavingInProgressTitle");
    else
      v31 = CFSTR("kWFLocDiagnosticsSaveLogTitle");
    objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v32);

    if (-[WFDiagnosticsViewController saving](self, "saving"))
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextColor:", v34);

    v27 = -[WFDiagnosticsViewController saving](self, "saving") ^ 1;
    v26 = v11;
    goto LABEL_18;
  }
  if (v10)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kWFTextFieldCellIdentifier"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsCommentTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsCommentPlaceholder"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPlaceholder:", v16);

  objc_msgSend(v11, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextAlignment:", 0);

  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __63__WFDiagnosticsViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v37[3] = &unk_24DB37328;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v11, "setTextChangeHandler:", v37);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
LABEL_19:

  return v11;
}

void __63__WFDiagnosticsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setComment:", v3);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  NSObject *v17;
  os_log_type_t v18;
  WFNANTableViewController *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFDiagnosticsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 == 2)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      v22 = 136315138;
      v23 = "-[WFDiagnosticsViewController tableView:didSelectRowAtIndexPath:]";
      _os_log_impl(&dword_2196CC000, v17, v18, "%s: tapped on NAN row", (uint8_t *)&v22, 0xCu);
    }

    v19 = objc_alloc_init(WFNANTableViewController);
    -[WFDiagnosticsViewController navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pushViewController:animated:", v19, 1);
    goto LABEL_21;
  }
  if (!v10 && !-[WFDiagnosticsViewController saving](self, "saving"))
  {
    WFLogForCategory(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        -[WFDiagnosticsViewController comment](self, "comment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");
        if (v15)
        {
          -[WFDiagnosticsViewController comment](self, "comment");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = CFSTR("<nil>");
        }
        v22 = 138412290;
        v23 = (const char *)v16;
        _os_log_impl(&dword_2196CC000, v13, v12, "Saving logs with comment %@", (uint8_t *)&v22, 0xCu);
        if (v15)

      }
    }

    -[WFDiagnosticsViewController saveHandler](self, "saveHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[WFDiagnosticsViewController saveHandler](self, "saveHandler");
      v19 = (WFNANTableViewController *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsViewController comment](self, "comment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(WFNANTableViewController *, void *))v19->super.super.super.super.__layeringSceneIdentity)(v19, v20);
LABEL_21:

    }
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[WFDiagnosticsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsCommentFooter"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)saveHandler
{
  return self->_saveHandler;
}

- (void)setSaveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (BOOL)saving
{
  return self->_saving;
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (BOOL)showNANUI
{
  return self->_showNANUI;
}

- (void)setShowNANUI:(BOOL)a3
{
  self->_showNANUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end
