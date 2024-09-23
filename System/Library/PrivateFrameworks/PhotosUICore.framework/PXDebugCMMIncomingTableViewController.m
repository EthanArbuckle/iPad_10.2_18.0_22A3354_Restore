@implementation PXDebugCMMIncomingTableViewController

- (PXDebugCMMIncomingTableViewController)initWithDataSourceManager:(id)a3
{
  id v5;
  PXDebugCMMIncomingTableViewController *v6;
  PXDebugCMMIncomingTableViewController *v7;
  uint64_t v8;
  PXCMMInvitationsDataSource *dataSource;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXDebugCMMIncomingTableViewController;
  v6 = -[PXDebugCMMIncomingTableViewController initWithStyle:](&v11, sel_initWithStyle_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v7->_dataSourceManager, "registerChangeObserver:context:", v7, PXDataSourceManagerObservationContext);
    objc_msgSend(v5, "dataSource");
    v8 = objc_claimAutoreleasedReturnValue();
    dataSource = v7->_dataSource;
    v7->_dataSource = (PXCMMInvitationsDataSource *)v8;

    -[UIViewController px_enableExtendedTraitCollection](v7, "px_enableExtendedTraitCollection");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXDebugCMMIncomingTableViewController;
  -[PXDebugCMMIncomingTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PXDebugCMMIncomingTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXDebugCMMIncomingTableViewCellReuseIdentifier"));

  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerChangeObserver:context:", self, PXExtendedTraitCollectionObservationContext_77237);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXDebugCMMIncomingTableViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PXDebugCMMIncomingTableViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v19[32];

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXDebugCMMIncomingTableViewCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugCMMIncomingTableViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugCMMIncomingTableViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  PXSimpleIndexPathFromIndexPath();

  objc_msgSend(v8, "invitationAtItemIndexPath:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "owner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "count");
  objc_msgSend(v10, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ want to share %lu asset(s) about \"%@\" with you."), v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
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
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  if ((void *)PXDataSourceManagerObservationContext == a5)
  {
    -[PXDebugCMMIncomingTableViewController tableView](self, "tableView", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDebugCMMIncomingTableViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDebugCMMIncomingTableViewController dataSourceManager](self, "dataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXDebugCMMIncomingTableViewController dataSourceManager](self, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v7, "identifier"), objc_msgSend(v9, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v13, "itemChangesInSection:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "hasIncrementalChanges"))
    {
      v16 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke;
      v20[3] = &unk_1E513DD48;
      v20[4] = self;
      v21 = v9;
      v22 = v15;
      v23 = v6;
      v17[0] = v16;
      v17[1] = 3221225472;
      v17[2] = __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke_2;
      v17[3] = &unk_1E5144558;
      v18 = v22;
      v19 = v23;
      objc_msgSend(v19, "performBatchUpdates:completion:", v20, v17);

    }
    else
    {
      -[PXDebugCMMIncomingTableViewController setDataSource:](self, "setDataSource:", v9);
      objc_msgSend(v6, "reloadData");
    }

  }
}

- (PXCMMInvitationsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXCMMInvitationsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removedIndexes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v2 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v7, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v3, 100);

  }
  objc_msgSend(*(id *)(a1 + 48), "insertedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v6, 100);

  }
}

void __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "changedIndexes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v3, 100);

  }
}

@end
