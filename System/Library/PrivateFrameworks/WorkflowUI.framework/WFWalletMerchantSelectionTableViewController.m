@implementation WFWalletMerchantSelectionTableViewController

- (WFWalletMerchantSelectionTableViewController)initWithTransactionIdentifiers:(id)a3 selectedMerchants:(id)a4
{
  id v6;
  id v7;
  WFWalletMerchantSelectionTableViewController *v8;
  uint64_t v9;
  NSSet *cardIdentifiers;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  uint64_t v21;
  PKPaymentTransactionIconGenerator *generator;
  uint64_t v23;
  NSMutableSet *selectedMerchantIdentifiers;
  WFWalletMerchantSelectionTableViewController *v25;
  objc_super v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)WFWalletMerchantSelectionTableViewController;
  v8 = -[WFWalletMerchantSelectionTableViewController initWithNibName:bundle:](&v27, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    cardIdentifiers = v8->_cardIdentifiers;
    v8->_cardIdentifiers = (NSSet *)v9;

    -[WFWalletMerchantSelectionTableViewController navigationItem](v8, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BEBD410]);
    WFLocalizedString(CFSTR("Clear"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 0, v8, sel_clear_);
    objc_msgSend(v11, "setLeftBarButtonItem:", v14);

    -[WFWalletMerchantSelectionTableViewController navigationItem](v8, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v8, sel_done_);
    objc_msgSend(v15, "setRightBarButtonItem:", v16);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v17 = (void *)getPKPaymentTransactionIconGeneratorClass_softClass;
    v32 = getPKPaymentTransactionIconGeneratorClass_softClass;
    if (!getPKPaymentTransactionIconGeneratorClass_softClass)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __getPKPaymentTransactionIconGeneratorClass_block_invoke;
      v28[3] = &unk_24E604F20;
      v28[4] = &v29;
      __getPKPaymentTransactionIconGeneratorClass_block_invoke((uint64_t)v28);
      v17 = (void *)v30[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v29, 8);
    v19 = [v18 alloc];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    v21 = objc_msgSend(v19, "initWithCache:scale:", 1);
    generator = v8->_generator;
    v8->_generator = (PKPaymentTransactionIconGenerator *)v21;

    v23 = objc_opt_new();
    selectedMerchantIdentifiers = v8->_selectedMerchantIdentifiers;
    v8->_selectedMerchantIdentifiers = (NSMutableSet *)v23;

    v25 = v8;
  }

  return v8;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  id v6;
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
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)WFWalletMerchantSelectionTableViewController;
  -[WFWalletMerchantSelectionTableViewController loadView](&v33, sel_loadView);
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v4, "setTableHeaderView:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v4, "setTableFooterView:", v6);

  -[WFWalletMerchantSelectionTableViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v4);

  -[WFWalletMerchantSelectionTableViewController setTableView:](self, "setTableView:", v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
  objc_msgSend(v8, "setObscuresBackgroundDuringPresentation:", 0);
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutocorrectionType:", 1);

  objc_msgSend(v8, "setHidesNavigationBarDuringPresentation:", 0);
  v32 = v8;
  objc_msgSend(v8, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[WFWalletMerchantSelectionTableViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSearchController:", v8);

  -[WFWalletMerchantSelectionTableViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidesSearchBarWhenScrolling:", 0);

  WFLocalizedString(CFSTR("Merchants"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletMerchantSelectionTableViewController setTitle:](self, "setTitle:", v13);

  v24 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletMerchantSelectionTableViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  objc_msgSend(v4, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletMerchantSelectionTableViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v23;
  objc_msgSend(v4, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletMerchantSelectionTableViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v17;
  objc_msgSend(v4, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletMerchantSelectionTableViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v22);

}

- (id)filteredMerchants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  -[WFWalletMerchantSelectionTableViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[WFWalletMerchantSelectionTableViewController merchants](self, "merchants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__WFWalletMerchantSelectionTableViewController_filteredMerchants__block_invoke;
    v11[3] = &unk_24E604E30;
    v12 = v6;
    objc_msgSend(v8, "if_objectsPassingTest:", v11);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

- (void)fetchTransactions
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = objc_alloc_init(MEMORY[0x24BE6ED30]);
  -[WFWalletMerchantSelectionTableViewController cardIdentifiers](self, "cardIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke;
  v5[3] = &unk_24E604EA8;
  v5[4] = self;
  objc_msgSend(v3, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:completion:", v4, 0, 0, 100, v5);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWalletMerchantSelectionTableViewController;
  -[WFWalletMerchantSelectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WFWalletMerchantSelectionTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));

  -[WFWalletMerchantSelectionTableViewController fetchTransactions](self, "fetchTransactions");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFWalletMerchantSelectionTableViewController filteredMerchants](self, "filteredMerchants", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
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
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  objc_msgSend(v8, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 1);

  objc_msgSend(v8, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setContinuousCornerRadius:", 6.0);

  -[WFWalletMerchantSelectionTableViewController filteredMerchants](self, "filteredMerchants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  -[WFWalletMerchantSelectionTableViewController selectedMerchantIdentifiers](self, "selectedMerchantIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  if (v19)
    v20 = 3;
  else
    v20 = 0;
  objc_msgSend(v8, "setAccessoryType:", v20);
  -[WFWalletMerchantSelectionTableViewController generator](self, "generator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v31 = &unk_24E604EF8;
  v32 = v6;
  v33 = v7;
  v22 = v7;
  v23 = v6;
  objc_msgSend(v21, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v14, 0, 0, &v28, 29.0, 29.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    WFScaledImage(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageView", v28, v29, v30, v31, v32, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setImage:", v25);

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFWalletMerchantSelectionTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

  -[WFWalletMerchantSelectionTableViewController filteredMerchants](self, "filteredMerchants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWalletMerchantSelectionTableViewController selectedMerchantIdentifiers](self, "selectedMerchantIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  -[WFWalletMerchantSelectionTableViewController selectedMerchantIdentifiers](self, "selectedMerchantIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v12, "removeObject:", v13);
  else
    objc_msgSend(v12, "addObject:", v13);

  -[WFWalletMerchantSelectionTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 100);

}

- (void)clear:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_new();
  -[WFWalletMerchantSelectionTableViewController setSelectedMerchantIdentifiers:](self, "setSelectedMerchantIdentifiers:", v4);

  -[WFWalletMerchantSelectionTableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[WFWalletMerchantSelectionTableViewController merchants](self, "merchants", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__WFWalletMerchantSelectionTableViewController_done___block_invoke;
  v7[3] = &unk_24E604E30;
  v7[4] = self;
  objc_msgSend(v4, "if_objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWalletMerchantSelectionTableViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "walletMerchantViewController:didFinishWithMerchants:", self, v5);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4;

  -[WFWalletMerchantSelectionTableViewController tableView](self, "tableView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (WFWalletMerchantSelectionTableViewControllerDelegate)delegate
{
  return (WFWalletMerchantSelectionTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)cardIdentifiers
{
  return self->_cardIdentifiers;
}

- (NSArray)merchants
{
  return self->_merchants;
}

- (PKPaymentTransactionIconGenerator)generator
{
  return self->_generator;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSMutableSet)selectedMerchantIdentifiers
{
  return self->_selectedMerchantIdentifiers;
}

- (void)setSelectedMerchantIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMerchantIdentifiers, a3);
}

- (NSMutableSet)previouslySelectedMerchants
{
  return self->_previouslySelectedMerchants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedMerchants, 0);
  objc_storeStrong((id *)&self->_selectedMerchantIdentifiers, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_merchants, 0);
  objc_storeStrong((id *)&self->_cardIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __53__WFWalletMerchantSelectionTableViewController_done___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedMerchantIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

void __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_24E604ED0;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WFScaledImage(*(void **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

  objc_msgSend(v4, "setNeedsLayout");
}

void __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_2;
  v6[3] = &unk_24E604E80;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_3;
  v12[3] = &unk_24E604E58;
  v13 = v2;
  v14 = v3;
  v5 = v3;
  v11 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 984);
  *(_QWORD *)(v8 + 984) = v7;

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

void __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "merchant");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v8, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((v4 & 1) == 0)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v8, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    }
  }

}

uint64_t __65__WFWalletMerchantSelectionTableViewController_filteredMerchants__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
