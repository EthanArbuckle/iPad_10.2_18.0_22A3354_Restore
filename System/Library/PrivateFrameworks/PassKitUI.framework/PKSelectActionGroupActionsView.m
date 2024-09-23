@implementation PKSelectActionGroupActionsView

- (PKSelectActionGroupActionsView)initWithPass:(id)a3 actionGroup:(id)a4
{
  id v7;
  id v8;
  PKSelectActionGroupActionsView *v9;
  PKSelectActionGroupActionsView *v10;
  PKPaymentPassAction *selectedAction;
  uint64_t v12;
  NSArray *actions;
  PKSelectActionGroupActionsHeader *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PKSelectActionGroupActionsHeader *actionGroupActionsHeader;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKSelectActionGroupActionsView;
  v9 = -[PKSelectActionGroupActionsView init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    selectedAction = v10->_selectedAction;
    v10->_selectedAction = 0;

    objc_storeStrong((id *)&v10->_actionGroup, a4);
    objc_msgSend(v8, "actions");
    v12 = objc_claimAutoreleasedReturnValue();
    actions = v10->_actions;
    v10->_actions = (NSArray *)v12;

    v14 = [PKSelectActionGroupActionsHeader alloc];
    PKLocalizedPaymentString(CFSTR("ACTION_GROUP_CHOOSE_PRODUCT_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ACTION_GROUP_CHOOSE_PRODUCT_DESCRIPTION"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKSelectActionGroupActionsHeader initWithPass:title:subtitle:](v14, "initWithPass:title:subtitle:", v7, v15, v16);
    actionGroupActionsHeader = v10->_actionGroupActionsHeader;
    v10->_actionGroupActionsHeader = (PKSelectActionGroupActionsHeader *)v17;

    -[PKSelectActionGroupActionsView _addSubviews](v10, "_addSubviews");
  }

  return v10;
}

- (void)layoutSubviews
{
  UITableView *tableView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSelectActionGroupActionsView;
  -[PKSelectActionGroupActionsView layoutSubviews](&v4, sel_layoutSubviews);
  tableView = self->_tableView;
  -[PKSelectActionGroupActionsView bounds](self, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  PKSelectActionGroupActionsViewDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v6);
  objc_msgSend(v6, "setRightBarButtonEnabled:", self->_selectedAction != 0);

}

- (void)setLoading:(BOOL)a3
{
  -[PKSelectActionGroupActionsHeader setLoading:](self->_actionGroupActionsHeader, "setLoading:", a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_actions, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PKCommutePlanDetailsTableViewCell *v7;
  PKCommutePlanDetailsTableViewCell *v8;
  PKPaymentPassAction *v9;
  void *v10;
  id v11;
  id v12;
  PKPaymentPassAction *selectedAction;
  uint64_t v15;
  void *v16;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKSelectActionGroupActionCellIdentifier"));
  v7 = (PKCommutePlanDetailsTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[PKCommutePlanDetailsTableViewCell initWithStyle:reuseIdentifier:]([PKCommutePlanDetailsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PKSelectActionGroupActionCellIdentifier"));
  v8 = v7;
  -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction title](v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction actionDescription](v9, "actionDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKCommutePlanFormatTitleFromLabelAndValue();
  v11 = v10;

  v12 = v18;
  -[PKCommutePlanDetailsTableViewCell setPrimaryText:](v8, "setPrimaryText:", v11);
  -[PKCommutePlanDetailsTableViewCell setSecondaryText:](v8, "setSecondaryText:", v12);
  -[PKCommutePlanDetailsTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
  selectedAction = self->_selectedAction;

  if (selectedAction != v9 || selectedAction == 0)
    v15 = 0;
  else
    v15 = 3;
  -[PKCommutePlanDetailsTableViewCell setAccessoryType:](v8, "setAccessoryType:", v15, v18);
  PKProvisioningSecondaryBackgroundColor();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCommutePlanDetailsTableViewCell setBackgroundColor:](v8, "setBackgroundColor:", v16);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v5;
  PKSelectActionGroupActionsHeader *actionGroupActionsHeader;
  double v8;
  double v9;

  if (-[PKSelectActionGroupActionsHeader isLoading](self->_actionGroupActionsHeader, "isLoading", a3, a4))
  {
    -[PKSelectActionGroupActionsView bounds](self, "bounds");
    return v5;
  }
  else
  {
    actionGroupActionsHeader = self->_actionGroupActionsHeader;
    -[PKSelectActionGroupActionsView bounds](self, "bounds");
    -[PKSelectActionGroupActionsHeader sizeThatFits:](actionGroupActionsHeader, "sizeThatFits:", v8, 1.79769313e308);
    return v9;
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_actionGroupActionsHeader;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassAction **p_selectedAction;
  PKPaymentPassAction *v9;
  PKPaymentPassAction *v10;
  PKSelectActionGroupActionsViewDelegate **p_delegate;
  id WeakRetained;
  NSUInteger v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_selectedAction = &self->_selectedAction;
  v9 = self->_selectedAction;
  -[NSArray objectAtIndex:](self->_actions, "objectAtIndex:", objc_msgSend(v7, "row"));
  v10 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_storeStrong((id *)&self->_selectedAction, v10);
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", *p_selectedAction != 0);

    if (v9)
    {
      v13 = -[NSArray indexOfObject:](self->_actions, "indexOfObject:", v9);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, objc_msgSend(v7, "section"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v19[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 5);

    }
    else
    {
      v20[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 5);
    }

    v16 = objc_loadWeakRetained((id *)p_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v18, "selectActionGroupActionsViewDidSelectActionGroupAction:", *p_selectedAction);

    }
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

  -[PKSelectActionGroupActionsView addSubview:](self, "addSubview:", self->_tableView);
}

- (PKPaymentPassAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAction, a3);
}

- (PKSelectActionGroupActionsViewDelegate)delegate
{
  return (PKSelectActionGroupActionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionGroupActionsHeader, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionGroup, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
