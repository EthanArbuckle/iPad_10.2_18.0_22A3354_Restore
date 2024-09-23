@implementation PKSelectActionGroupView

- (PKSelectActionGroupView)initWithPass:(id)a3 actionGroups:(id)a4
{
  id v7;
  id v8;
  PKSelectActionGroupView *v9;
  PKSelectActionGroupView *v10;
  PKPaymentPassActionGroup *selectedActionGroup;
  uint64_t v12;
  NSArray *actionGroups;
  PKSelectActionGroupHeader *v14;
  PKSelectActionGroupHeader *actionGroupHeader;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKSelectActionGroupView;
  v9 = -[PKSelectActionGroupView init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    selectedActionGroup = v10->_selectedActionGroup;
    v10->_selectedActionGroup = 0;

    v12 = objc_msgSend(v8, "copy");
    actionGroups = v10->_actionGroups;
    v10->_actionGroups = (NSArray *)v12;

    v14 = -[PKSelectActionGroupHeader initWithTitle:subtitle:]([PKSelectActionGroupHeader alloc], "initWithTitle:subtitle:", CFSTR("Choose Group"), CFSTR("Choose an action group for which to see actions."));
    actionGroupHeader = v10->_actionGroupHeader;
    v10->_actionGroupHeader = v14;

    -[PKSelectActionGroupView _addSubviews](v10, "_addSubviews");
  }

  return v10;
}

- (void)layoutSubviews
{
  UITableView *tableView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSelectActionGroupView;
  -[PKSelectActionGroupView layoutSubviews](&v4, sel_layoutSubviews);
  tableView = self->_tableView;
  -[PKSelectActionGroupView bounds](self, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  PKSelectActionGroupViewDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v6);
  objc_msgSend(v6, "setRightBarButtonEnabled:", self->_selectedActionGroup != 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_actionGroups, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  PKPaymentPassActionGroup *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentPassActionGroup *selectedActionGroup;
  uint64_t v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKSelectActionGroupCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PKSelectActionGroupCellIdentifier"));
  -[NSArray objectAtIndexedSubscript:](self->_actionGroups, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (PKPaymentPassActionGroup *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassActionGroup title](v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassActionGroup actionGroupDescription](v8, "actionGroupDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v13);

  objc_msgSend(v7, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v10);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v16);

  objc_msgSend(v7, "setSelectionStyle:", 0);
  selectedActionGroup = self->_selectedActionGroup;
  if (selectedActionGroup != v8 || selectedActionGroup == 0)
    v19 = 0;
  else
    v19 = 3;
  objc_msgSend(v7, "setAccessoryType:", v19);
  PKProvisioningSecondaryBackgroundColor();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v20);

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 120.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_actionGroupHeader;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassActionGroup **p_selectedActionGroup;
  PKPaymentPassActionGroup *v9;
  PKPaymentPassActionGroup *v10;
  id WeakRetained;
  id v12;
  char v13;
  id v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  p_selectedActionGroup = &self->_selectedActionGroup;
  v9 = self->_selectedActionGroup;
  -[NSArray objectAtIndex:](self->_actionGroups, "objectAtIndex:", objc_msgSend(v7, "row"));
  v10 = (PKPaymentPassActionGroup *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_storeStrong((id *)&self->_selectedActionGroup, v10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", *p_selectedActionGroup != 0);

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "selectActionGroupViewDidSelectActionGroup:", *p_selectedActionGroup);

    }
    v15 = -[NSArray indexOfObject:](self->_actionGroups, "indexOfObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, objc_msgSend(v7, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v16;
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v17, 5);

  }
}

- (void)_addSubviews
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  UITableView *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 1);
  -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 1);
  v6 = self->_tableView;
  PKProvisioningBackgroundColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[PKSelectActionGroupView addSubview:](self, "addSubview:", self->_tableView);
}

- (PKPaymentPassActionGroup)selectedActionGroup
{
  return self->_selectedActionGroup;
}

- (void)setSelectedActionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_selectedActionGroup, a3);
}

- (PKSelectActionGroupViewDelegate)delegate
{
  return (PKSelectActionGroupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedActionGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionGroupHeader, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
