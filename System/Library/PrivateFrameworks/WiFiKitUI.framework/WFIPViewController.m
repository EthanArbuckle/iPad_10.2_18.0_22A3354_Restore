@implementation WFIPViewController

- (WFIPViewController)initWithAddresses:(id)a3 prefixLengths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFIPViewController *v9;

  v6 = a4;
  v7 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFIPViewController initWithAddresses:prefixLengths:appearanceProxy:](self, "initWithAddresses:prefixLengths:appearanceProxy:", v7, v6, v8);

  return v9;
}

- (WFIPViewController)initWithAddresses:(id)a3 prefixLengths:(id)a4 appearanceProxy:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  WFIPViewController *v13;
  WFIPViewController *v14;
  WFAppearanceProxy *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17.receiver = self;
    v17.super_class = (Class)WFIPViewController;
    v13 = -[WFIPViewController initWithStyle:](&v17, sel_initWithStyle_, objc_msgSend(v11, "tableViewStyle"));
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_addresses, a3);
      objc_storeStrong((id *)&v14->_prefixes, a4);
      v15 = (WFAppearanceProxy *)v11;
      self = (WFIPViewController *)v14->_appearanceProxy;
      v14->_appearanceProxy = v15;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFIPViewController;
  -[WFIPViewController viewDidLoad](&v11, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocSettingsIPV6AddressesTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIPViewController setTitle:](self, "setTitle:", v4);

  v5 = *MEMORY[0x24BEBE770];
  -[WFIPViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", v5);

  -[WFIPViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", 44.0);

  -[WFIPViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedSectionHeaderHeight:", 0.0);

  -[WFIPViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEstimatedSectionFooterHeight:", 0.0);

  if (objc_msgSend(MEMORY[0x24BEBD538], "currentIsIPad"))
  {
    -[WFIPViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFIPViewController addresses](self, "addresses", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
  -[WFIPViewController addresses](self, "addresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFIPViewController prefixes](self, "prefixes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[WFIPViewController prefixes](self, "prefixes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v5, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), v8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v8;
  }
  objc_msgSend(v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  objc_msgSend(v6, "setSelectionStyle:", 0);
  objc_msgSend(v6, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 0);

  -[WFIPViewController appearanceProxy](self, "appearanceProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cellTextLabelFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[WFIPViewController appearanceProxy](self, "appearanceProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cellTextLabelFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

  }
  return v6;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
  objc_storeStrong((id *)&self->_prefixes, a3);
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
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
