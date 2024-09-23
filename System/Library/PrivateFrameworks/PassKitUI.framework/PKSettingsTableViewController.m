@implementation PKSettingsTableViewController

- (void)viewDidLoad
{
  void *v3;
  PKTableViewDiffableDataSource *v4;
  uint64_t v5;
  PKTableViewDiffableDataSource *v6;
  PKTableViewDiffableDataSource *dataSource;
  PKTableViewDiffableDataSource *v8;
  PKTableViewDiffableDataSource *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKSettingsTableViewController;
  -[PKSettingsTableViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[PKSettingsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_setupForReadableContentGuide");
  objc_initWeak(&location, self);
  v4 = [PKTableViewDiffableDataSource alloc];
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__PKSettingsTableViewController_viewDidLoad__block_invoke;
  v17[3] = &unk_1E3E61698;
  objc_copyWeak(&v18, &location);
  v6 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v4, "initWithTableView:cellProvider:", v3, v17);
  dataSource = self->_dataSource;
  self->_dataSource = v6;

  v8 = self->_dataSource;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __44__PKSettingsTableViewController_viewDidLoad__block_invoke_2;
  v15[3] = &unk_1E3E616C0;
  objc_copyWeak(&v16, &location);
  -[PKTableViewDiffableDataSource setSectionHeaderProvider:](v8, "setSectionHeaderProvider:", v15);
  v9 = self->_dataSource;
  v10 = v5;
  v11 = 3221225472;
  v12 = __44__PKSettingsTableViewController_viewDidLoad__block_invoke_3;
  v13 = &unk_1E3E616C0;
  objc_copyWeak(&v14, &location);
  -[PKTableViewDiffableDataSource setSectionFooterProvider:](v9, "setSectionFooterProvider:", &v10);
  -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_dataSource, "setDefaultRowAnimation:", 0, v10, v11, v12, v13);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68038]);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

id __44__PKSettingsTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[128], "rowForItemIdentifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableViewCellForTableView:atIndexPath:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __44__PKSettingsTableViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[128], "sectionForSectionIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __44__PKSettingsTableViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[128], "sectionForSectionIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "footer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)applyConfiguration:(id)a3 animated:(BOOL)a4
{
  -[PKSettingsTableViewController applyConfiguration:reconfigureItems:animated:](self, "applyConfiguration:reconfigureItems:animated:", a3, 1, a4);
}

- (void)applyConfiguration:(id)a3 reconfigureItems:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;
  void *v10;
  PKSettingsTableViewConfiguration **p_currentConfiguration;
  PKSettingsTableViewConfiguration *v12;
  id v13;
  void *v14;
  id v15;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  objc_msgSend(v9, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    p_currentConfiguration = &self->_currentConfiguration;
    if (v6)
    {
      v12 = *p_currentConfiguration;
      if (*p_currentConfiguration)
      {
        v15 = 0;
        -[PKSettingsTableViewConfiguration diff:updatedIdentifiers:](v12, "diff:updatedIdentifiers:", v9, &v15);
        v13 = v15;
      }
      else
      {
        v13 = 0;
      }
      objc_storeStrong((id *)&self->_currentConfiguration, a3);
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reconfigureItemsWithIdentifiers:", v14);

      }
    }
    else
    {
      objc_storeStrong((id *)&self->_currentConfiguration, a3);
    }
    -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v10, v5);
  }

}

- (int64_t)indexOfSectionWithIdentifier:(id)a3
{
  PKTableViewDiffableDataSource *dataSource;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  dataSource = self->_dataSource;
  v4 = a3;
  -[UITableViewDiffableDataSource snapshot](dataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return v7;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[UITableViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sections
{
  return -[PKSettingsTableViewConfiguration sections](self->_currentConfiguration, "sections");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  PKSettingsTableViewConfiguration *currentConfiguration;
  void *v5;
  void *v6;

  currentConfiguration = self->_currentConfiguration;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSettingsTableViewConfiguration rowForItemIdentifier:](currentConfiguration, "rowForItemIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "shouldHighlight");
  return (char)v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PKSettingsTableViewConfiguration *currentConfiguration;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  currentConfiguration = self->_currentConfiguration;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSettingsTableViewConfiguration rowForItemIdentifier:](currentConfiguration, "rowForItemIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "handleCellSelection");
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
