@implementation PKSelectActionView

- (PKSelectActionView)initWithPass:(id)a3 actions:(id)a4 actionType:(unint64_t)a5 balanceDictionary:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKSelectActionView *v14;
  PKSelectActionView *v15;
  PKPaymentPassAction *selectedAction;
  uint64_t v17;
  NSArray *actions;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PKSelectActionHeader *v23;
  PKSelectActionHeader *actionHeader;
  _QWORD v26[5];
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKSelectActionView;
  v14 = -[PKSelectActionView init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    selectedAction = v15->_selectedAction;
    v15->_selectedAction = 0;

    v15->_actionType = a5;
    objc_storeStrong((id *)&v15->_balances, a6);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__PKSelectActionView_initWithPass_actions_actionType_balanceDictionary___block_invoke;
    v26[3] = &__block_descriptor_40_e36_B32__0__PKPaymentPassAction_8Q16_B24l;
    v26[4] = a5;
    objc_msgSend(v12, "pk_objectsPassingTest:", v26);
    v17 = objc_claimAutoreleasedReturnValue();
    actions = v15->_actions;
    v15->_actions = (NSArray *)v17;

    PKLocalizedPaymentString(CFSTR("MULTIPLE_BALANCE_SELECT_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("MULTIPLE_BALANCE_SELECT_DESCRIPTION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15->_actionType == 2)
    {
      PKPassLocalizedStringWithFormat();
      v21 = objc_claimAutoreleasedReturnValue();

      PKPassLocalizedStringWithFormat();
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v21;
      v20 = (void *)v22;
    }
    v23 = -[PKSelectActionHeader initWithTitle:subtitle:]([PKSelectActionHeader alloc], "initWithTitle:subtitle:", v19, v20);
    actionHeader = v15->_actionHeader;
    v15->_actionHeader = v23;

    -[PKSelectActionView _addSubviews](v15, "_addSubviews");
  }

  return v15;
}

BOOL __72__PKSelectActionView_initWithPass_actions_actionType_balanceDictionary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)_balanceForTopUpAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    objc_msgSend(v4, "associatedEnteredValueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
      -[NSDictionary objectForKeyedSubscript:](self->_balances, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "relevantPropertyIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 || !v8)
    {
      if (v5 || v7 || v8)
        goto LABEL_14;
      v11 = objc_alloc(MEMORY[0x1E0C99E60]);
      v10 = objc_msgSend(v11, "initWithObjects:", *MEMORY[0x1E0D6ACB8], 0);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0);
    }
    v12 = (void *)v10;
    -[NSDictionary objectForKeyedSubscript:](self->_balances, "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    goto LABEL_15;
  }
  v7 = 0;
LABEL_15:

  return v7;
}

- (void)layoutSubviews
{
  UITableView *tableView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSelectActionView;
  -[PKSelectActionView layoutSubviews](&v4, sel_layoutSubviews);
  tableView = self->_tableView;
  -[PKSelectActionView bounds](self, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  PKSelectActionViewDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  v9 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v9);
  objc_msgSend(v9, "setRightBarButtonEnabled:", self->_selectedAction != 0);

  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = WeakRetained;
  if (self->_selectedAction)
  {
    objc_msgSend(WeakRetained, "selectActionViewDidSelectAction:");
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectActionViewDidSelectAction:", v8);

  }
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
  void *v7;
  PKPaymentPassAction *v8;
  id v9;
  id v10;
  unint64_t actionType;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PKPaymentPassAction *selectedAction;
  uint64_t v28;
  void *v29;
  void *v31;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKSelectActionCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PKSelectActionCellIdentifier"));
  -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction title](v8, "title");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction actionDescription](v8, "actionDescription");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  actionType = self->_actionType;
  if (actionType == 1)
  {
    -[PKSelectActionView _balanceForTopUpAction:](self, "_balanceForTopUpAction:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v17)
    {
      objc_msgSend(v17, "localizedTitle");
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "formattedValue");
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v19;
      v9 = (id)v18;
    }
  }
  else
  {
    if (actionType != 2)
      goto LABEL_9;
    -[PKPaymentPassAction associatedPlan](v8, "associatedPlan");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    -[PKPass paymentPass](self->_pass, "paymentPass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v15;
    PKCommutePlanFormatTitleFromLabelAndValue();
    v9 = v14;

    v10 = v15;
  }

LABEL_9:
  objc_msgSend(v7, "textLabel", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v21);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v22);

  objc_msgSend(v7, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v10);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v24);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v25);

  objc_msgSend(v7, "setSelectionStyle:", 0);
  selectedAction = self->_selectedAction;
  if (selectedAction != v8 || selectedAction == 0)
    v28 = 0;
  else
    v28 = 3;
  objc_msgSend(v7, "setAccessoryType:", v28);
  PKProvisioningSecondaryBackgroundColor();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v29);

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 120.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_actionHeader;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassAction **p_selectedAction;
  PKPaymentPassAction *v9;
  PKPaymentPassAction *v10;
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
  p_selectedAction = &self->_selectedAction;
  v9 = self->_selectedAction;
  -[NSArray objectAtIndex:](self->_actions, "objectAtIndex:", objc_msgSend(v7, "row"));
  v10 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_storeStrong((id *)&self->_selectedAction, v10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", *p_selectedAction != 0);

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "selectActionViewDidSelectAction:", *p_selectedAction);

    }
    v15 = -[NSArray indexOfObject:](self->_actions, "indexOfObject:", v9);
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

  -[PKSelectActionView addSubview:](self, "addSubview:", self->_tableView);
}

- (PKPaymentPassAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAction, a3);
}

- (PKSelectActionViewDelegate)delegate
{
  return (PKSelectActionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionHeader, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
