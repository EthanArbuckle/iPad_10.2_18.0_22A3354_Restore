@implementation TSCarrierItemListViewController

- (TSCarrierItemListViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TSCarrierItemListViewController *v7;
  dispatch_queue_t v8;
  uint64_t v9;
  CoreTelephonyClient *client;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TRAVEL_PURCHASE_PLAN_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRAVEL_PURCHASE_PLAN_BODY"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)TSCarrierItemListViewController;
  v7 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v12, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v4, v6, CFSTR("antenna.radiowaves.left.and.right"), 1);

  v8 = dispatch_queue_create(CFSTR("Core Analytics"), 0);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v8);
  client = v7->_client;
  v7->_client = (CoreTelephonyClient *)v9;

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TSCarrierItemListViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v17, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v6);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollEnabled:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsMultipleSelection:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

  -[TSCarrierItemListViewController updateFooterView](self, "updateFooterView");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  CTCellularPlanCarrierItem *selectedCarrierItem;
  objc_super v6;

  v3 = a3;
  selectedCarrierItem = self->_selectedCarrierItem;
  self->_selectedCarrierItem = 0;

  v6.receiver = self;
  v6.super_class = (Class)TSCarrierItemListViewController;
  -[OBTableWelcomeController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[TSCarrierItemListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v6.receiver = self;
  v6.super_class = (Class)TSCarrierItemListViewController;
  -[TSCarrierItemListViewController updateViewConstraints](&v6, sel_updateViewConstraints);
  v5.receiver = self;
  v5.super_class = (Class)TSCarrierItemListViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
}

- (void)updateFooterView
{
  UITableViewHeaderFooterView *v3;
  UITableViewHeaderFooterView *footer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!self->_footer)
  {
    v3 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x24BEBDA18]);
    footer = self->_footer;
    self->_footer = v3;

    -[UITableViewHeaderFooterView textLabel](self->_footer, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    -[UITableViewHeaderFooterView textLabel](self->_footer, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineBreakMode:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_footer, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[UITableViewHeaderFooterView textLabel](self->_footer, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PRIVACY_FOOTER"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v11);

    -[UITableViewHeaderFooterView textLabel](self->_footer, "textLabel");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_carrierItems, "count", a3, a4);
}

- (id)getCellTextAt:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  __CFString *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 >= -[NSArray count](self->_carrierItems, "count"))
  {
    v7 = &stru_24DEF4290;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_carrierItems, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v6 = a4;
  v7 = a3;
  -[TSCarrierItemListViewController getCellTextAt:](self, "getCellTextAt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_msgSend(v6, "section");

  objc_msgSend(v10, "stringWithFormat:", CFSTR("options%ld"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeWithFont:constrainedToSize:lineBreakMode:", v9, 0, 235.0, 3.40282347e38);
  v15 = fmax(v14, 60.0);

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;
  id v8;
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

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("options%ld"), objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, v9);
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  objc_msgSend(v10, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v12);

  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  objc_msgSend(v10, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  -[TSCarrierItemListViewController getCellTextAt:](self, "getCellTextAt:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_footer;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  CTCellularPlanCarrierItem *v7;
  CTCellularPlanCarrierItem *selectedCarrierItem;
  NSObject *v9;
  CTCellularPlanCarrierItem *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CTCellularPlanCarrierItem *v19;
  CoreTelephonyClient *client;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  CTCellularPlanCarrierItem *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  if (v6 >= -[NSArray count](self->_carrierItems, "count"))
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSCarrierItemListViewController tableView:didSelectRowAtIndexPath:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_carrierItems, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v7 = (CTCellularPlanCarrierItem *)objc_claimAutoreleasedReturnValue();
    selectedCarrierItem = self->_selectedCarrierItem;
    self->_selectedCarrierItem = v7;

    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_selectedCarrierItem;
      *(_DWORD *)buf = 138412802;
      v27 = v5;
      v28 = 2112;
      v29 = v10;
      v30 = 2080;
      v31 = "-[TSCarrierItemListViewController tableView:didSelectRowAtIndexPath:]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "carrier item at %@: %@ @%s", buf, 0x20u);
    }

  }
  v19 = self->_selectedCarrierItem;
  if (v19)
  {
    client = self->_client;
    -[CTCellularPlanCarrierItem name](v19, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("purchase local plan"), v21, &v25);
    v22 = v25;

    -[TSCarrierItemListViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "viewControllerDidComplete:", self);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)prepare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_carrierItems)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assertUserInPurchaseFlowStartOver:caller:", 0, self);

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__TSCarrierItemListViewController_prepare___block_invoke;
    v7[3] = &unk_24DEF3258;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    v8 = v5;
    -[TSCarrierItemListViewController _fetchCarrierListWithCompletion:](self, "_fetchCarrierListWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __43__TSCarrierItemListViewController_prepare___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deassertUserInPurchaseFlowWithForce:caller:", 0, *(_QWORD *)(a1 + 32));

  if (WeakRetained && v7)
  {
    objc_storeStrong(WeakRetained + 153, a2);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (void)_cancelButtonTapped
{
  CoreTelephonyClient *client;
  void *v4;
  uint64_t v5;

  client = self->_client;
  v5 = 0;
  -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("purchase local plan_Cancel"), &stru_24DEF4290, &v5);
  -[TSCarrierItemListViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidTapCancel");

}

- (void)_fetchCarrierListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke;
  v7[3] = &unk_24DEF32F8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "getSupportedFlowTypes:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD block[4];
  id v5;
  id v6[2];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2;
  block[3] = &unk_24DEF32D0;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v6);
}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((*(_BYTE *)(a1 + 48) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_3;
    v12[3] = &unk_24DEF32A8;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v11, "carrierItemsShouldUpdate:completion:", 0, v12);

  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_4;
  v6[3] = &unk_24DEF3280;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSArray)carrierItems
{
  return self->_carrierItems;
}

- (void)setCarrierItems:(id)a3
{
  objc_storeStrong((id *)&self->_carrierItems, a3);
}

- (CTCellularPlanCarrierItem)selectedCarrierItem
{
  return self->_selectedCarrierItem;
}

- (void)setSelectedCarrierItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCarrierItem, a3);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableViewHeaderFooterView)footer
{
  return (UITableViewHeaderFooterView *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setFooter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedCarrierItem, 0);
  objc_storeStrong((id *)&self->_carrierItems, 0);
}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid row selection @%s", a5, a6, a7, a8, 2u);
}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]CarrierPlanItemFlow is unsupprted @%s", a5, a6, a7, a8, 2u);
}

@end
