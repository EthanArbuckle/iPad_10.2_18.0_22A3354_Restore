@implementation PKSpendNotificationLimitViewController

- (PKSpendNotificationLimitViewController)initWithTitle:(id)a3 footerText:(id)a4 provider:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSpendNotificationLimitViewController *v11;
  uint64_t v12;
  NSString *footerText;
  PKCurrencyAmountSelectorCustomEntryItem *v14;
  void *v15;
  uint64_t v16;
  PKCurrencyAmountSelectorCustomEntryItem *customEntryItem;
  PKCurrencyAmountSelectorCustomEntryItem *v18;
  uint64_t v19;
  PKCurrencyAmountSelectorCustomEntryItem *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKSpendNotificationLimitViewController;
  v11 = -[PKSpendNotificationLimitViewController initWithStyle:](&v28, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    footerText = v11->_footerText;
    v11->_footerText = (NSString *)v12;

    objc_storeStrong((id *)&v11->_provider, a5);
    v14 = [PKCurrencyAmountSelectorCustomEntryItem alloc];
    -[PKCurrencyAmountSelectorOptionProvider currencyCode](v11->_provider, "currencyCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKCurrencyAmountSelectorCustomEntryItem initWithCurrencyCode:](v14, "initWithCurrencyCode:", v15);
    customEntryItem = v11->_customEntryItem;
    v11->_customEntryItem = (PKCurrencyAmountSelectorCustomEntryItem *)v16;

    objc_initWeak(&location, v11);
    v18 = v11->_customEntryItem;
    v19 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke;
    v25[3] = &unk_1E3E61C58;
    objc_copyWeak(&v26, &location);
    -[PKCurrencyAmountSelectorCustomEntryItem setEditingChangedHandler:](v18, "setEditingChangedHandler:", v25);
    v20 = v11->_customEntryItem;
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke_2;
    v23[3] = &unk_1E3E61C58;
    objc_copyWeak(&v24, &location);
    -[PKCurrencyAmountSelectorCustomEntryItem setInputValueChangedHandler:](v20, "setInputValueChangedHandler:", v23);
    -[PKSpendNotificationLimitViewController setTitle:](v11, "setTitle:", v8);
    -[PKSpendNotificationLimitViewController navigationItem](v11, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v21, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    -[PKSpendNotificationLimitViewController _updateNavigationItemsIsEditing:](v11, "_updateNavigationItemsIsEditing:", 0);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNavigationItemsIsEditing:", a2);

}

void __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", a2);

}

- (void)setMaximumInput:(unint64_t)a3
{
  -[PKCurrencyAmountSelectorCustomEntryItem setMaximumInput:](self->_customEntryItem, "setMaximumInput:", a3);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSpendNotificationLimitViewController;
  -[PKSpendNotificationLimitViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKSpendNotificationLimitViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendNotificationLimitViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKTableViewDiffableDataSource *v8;
  PKTableViewDiffableDataSource *dataSource;
  PKTableViewDiffableDataSource *v10;
  uint64_t v11;
  PKCurrencyAmountSelectorOptionProvider *provider;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKSpendNotificationLimitViewController;
  -[PKSpendNotificationLimitViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PKSpendNotificationLimitViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[PKCurrencyAmountSelectorOption cellReuseIdentifier](PKCurrencyAmountSelectorOption, "cellReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = objc_opt_class();
  +[PKCurrencyAmountSelectorCustomEntryItem cellReuseIdentifier](PKCurrencyAmountSelectorCustomEntryItem, "cellReuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v7);

  v8 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:]([PKTableViewDiffableDataSource alloc], "initWithTableView:cellProvider:", v3, &__block_literal_global_237);
  dataSource = self->_dataSource;
  self->_dataSource = v8;

  -[PKTableViewDiffableDataSource setSectionHeaderProvider:](self->_dataSource, "setSectionHeaderProvider:", &__block_literal_global_239);
  -[PKTableViewDiffableDataSource setSectionFooterProvider:](self->_dataSource, "setSectionFooterProvider:", &__block_literal_global_240_0);
  objc_initWeak(&location, self);
  v10 = self->_dataSource;
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_4;
  v15[3] = &unk_1E3E70C88;
  objc_copyWeak(&v16, &location);
  -[PKTableViewDiffableDataSource setCommitEditingHandler:](v10, "setCommitEditingHandler:", v15);
  provider = self->_provider;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_5;
  v13[3] = &unk_1E3E61BE0;
  objc_copyWeak(&v14, &location);
  -[PKCurrencyAmountSelectorOptionProvider setOptionsUpdateHandler:](provider, "setOptionsUpdateHandler:", v13);
  -[PKSpendNotificationLimitViewController _updateSnapshotAnimated:completion:](self, "_updateSnapshotAnimated:completion:", 0, 0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68148]);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "tableViewCellForTableView:atIndexPath:", a2, a3);
}

uint64_t __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "title");
}

uint64_t __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "footer");
}

void __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a3 == 1 && WeakRetained)
    objc_msgSend(WeakRetained, "_deleteOptionAtIndexPath:", v8);

}

void __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_6;
    v3[3] = &unk_1E3E612E8;
    v3[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSnapshotAnimated:completion:", 0, v3);
  }

}

void __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 1048))
  {
    objc_msgSend(*(id *)(v1 + 1024), "selectedOption");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) + 16))();

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v17, 1);
  -[PKCurrencyAmountSelectorCustomEntryItem clear](self->_customEntryItem, "clear");
  -[PKCurrencyAmountSelectorCustomEntryItem endEditing](self->_customEntryItem, "endEditing");
  v6 = objc_msgSend(v17, "section");
  -[UITableViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = v11;
  if (v11 == CFSTR("SpendLimitOptionsSectionIdentifier")
    || v11
    && (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("SpendLimitOptionsSectionIdentifier")),
        v12,
        v13))
  {
    -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currencyAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "amount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKCurrencyAmountSelectorOptionProvider selectAmount:](self->_provider, "selectAmount:", v16);
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldHighlight");

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  int64_t v5;

  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "editingStyle");

  return v5;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  char v12;

  v5 = objc_msgSend(a4, "section", a3);
  -[UITableViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  v11 = v10;
  if (v10 == CFSTR("SpendLimitOptionsSectionIdentifier"))
  {
    v12 = 1;
  }
  else if (v10)
  {
    v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("SpendLimitOptionsSectionIdentifier"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_deleteOptionAtIndexPath:(id)a3
{
  PKCurrencyAmountSelectorOptionProvider *provider;
  void *v5;
  void *v6;
  id v7;

  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  provider = self->_provider;
  objc_msgSend(v7, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmountSelectorOptionProvider removeCustomAmount:](provider, "removeCustomAmount:", v6);

}

- (void)_updateNavigationItemsIsEditing:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
    objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B30]);
    -[PKSpendNotificationLimitViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v7;
  }
  else
  {
    -[PKSpendNotificationLimitViewController navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKSpendNotificationLimitViewController editButtonItem](self, "editButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    v6 = v5;
  }
  objc_msgSend(v4, "setRightBarButtonItem:", v6);

}

- (void)_doneButtonTapped:(id)a3
{
  id v4;

  -[PKCurrencyAmountSelectorCustomEntryItem endEditing](self->_customEntryItem, "endEditing", a3);
  -[PKCurrencyAmountSelectorCustomEntryItem decimalNumberValue](self->_customEntryItem, "decimalNumberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PKCurrencyAmountSelectorOptionProvider insertCustomAmount:](self->_provider, "insertCustomAmount:", v4);
  -[PKCurrencyAmountSelectorCustomEntryItem clear](self->_customEntryItem, "clear");

}

- (void)_updateSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  PKTableViewDiffableDataSourceSection *v8;
  PKTableViewDiffableDataSourceSection *v9;
  void *v10;
  void *v11;
  PKTableViewDiffableDataSourceSection *v12;
  void *v13;
  void *v14;
  PKCurrencyAmountSelectorCustomEntryItem *customEntryItem;
  PKTableViewDiffableDataSourceSection *v16;
  _QWORD v17[2];

  v4 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v8 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("SpendLimitOptionsSectionIdentifier"));
  v9 = v8;
  if (!self->_customEntryItem)
    -[PKTableViewDiffableDataSourceSection setFooter:](v8, "setFooter:", self->_footerText);
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", v10);

  -[PKCurrencyAmountSelectorOptionProvider options](self->_provider, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v11, v9);

  if (self->_customEntryItem)
  {
    v12 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("CustomOptionEntrySectionIdentifier"));
    -[PKTableViewDiffableDataSourceSection setFooter:](v12, "setFooter:", self->_footerText);
    v16 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", v13);

    customEntryItem = self->_customEntryItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &customEntryItem, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, v12);

  }
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](self->_dataSource, "applySnapshot:animatingDifferences:completion:", v7, v4, v6);

}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_customEntryItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
}

@end
