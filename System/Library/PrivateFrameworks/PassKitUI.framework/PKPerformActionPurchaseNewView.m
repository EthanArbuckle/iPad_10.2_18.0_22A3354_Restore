@implementation PKPerformActionPurchaseNewView

- (PKPerformActionPurchaseNewView)init
{
  return -[PKPerformActionPurchaseNewView initWithPass:action:paymentDataProvider:](self, "initWithPass:action:paymentDataProvider:", 0, 0, 0);
}

- (PKPerformActionPurchaseNewView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  id v8;
  id v9;
  PKPerformActionPurchaseNewView *v10;
  PKPerformActionPurchaseNewView *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  PKPurchaseNewActionItem *purchaseNewItem;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPerformActionPurchaseNewView;
  v10 = -[PKPerformActionPurchaseNewView init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeStrong((id *)&v11->_action, a4);
    v12 = -[PKPerformActionPurchaseNewView _shouldReverseLayoutDirection](v11, "_shouldReverseLayoutDirection");
    v13 = 2;
    if (!v12)
      v13 = 0;
    v11->_textAlignment = v13;
    objc_msgSend(v9, "purchaseNewActionItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    purchaseNewItem = v11->_purchaseNewItem;
    v11->_purchaseNewItem = (PKPurchaseNewActionItem *)v15;

    -[PKPerformActionPurchaseNewView setClipsToBounds:](v11, "setClipsToBounds:", 0);
    -[PKPerformActionPurchaseNewView _addSubviews](v11, "_addSubviews");
  }

  return v11;
}

- (void)layoutSubviews
{
  UITableView *tableView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionPurchaseNewView;
  -[PKPerformActionPurchaseNewView layoutSubviews](&v4, sel_layoutSubviews);
  tableView = self->_tableView;
  -[PKPerformActionPurchaseNewView bounds](self, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  PKPerformActionViewDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v6);
  objc_msgSend(v6, "setRightBarButtonEnabled:", self->_purchaseNewItem != 0);

}

- (id)_optionsSectionHeaderText
{
  return (id)-[PKPaymentPassAction headerText](self->_action, "headerText");
}

- (id)_optionsSectionFooterText
{
  return (id)-[PKPaymentPassAction footerText](self->_action, "footerText");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKPaymentPassAction purchaseNewActionItems](self->_action, "purchaseNewActionItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PKPurchaseNewActionItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPerformActionPurchaseNewCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKPerformActionPurchaseNewCellIdentifier"));
  -[PKPaymentPassAction purchaseNewActionItems](self->_action, "purchaseNewActionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (PKPurchaseNewActionItem *)objc_claimAutoreleasedReturnValue();

  -[PKPurchaseNewActionItem amount](v10, "amount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPurchaseNewActionItem currency](v10, "currency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", self->_textAlignment);
  -[PKPurchaseNewActionItem title](v10, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v17);

  objc_msgSend(v14, "setLineBreakMode:", 4);
  objc_msgSend(v15, "setTextAlignment:", self->_textAlignment);
  objc_msgSend(v15, "setText:", v13);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v18);

  objc_msgSend(v7, "setSelectionStyle:", 3);
  if (v10 == self->_purchaseNewItem)
    v19 = 3;
  else
    v19 = 0;
  objc_msgSend(v7, "setAccessoryType:", v19);
  PKProvisioningSecondaryBackgroundColor();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v20);

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PKPurchaseNewActionItem *v7;
  void *v8;
  PKPurchaseNewActionItem *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = self->_purchaseNewItem;
  -[PKPaymentPassAction purchaseNewActionItems](self->_action, "purchaseNewActionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (PKPurchaseNewActionItem *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    objc_storeStrong((id *)&self->_purchaseNewItem, v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", self->_purchaseNewItem != 0);

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadSections:withRowAnimation:", v11, 5);

    -[PKPaymentPassAction purchaseNewActionItems](self->_action, "purchaseNewActionItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, objc_msgSend(v6, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessoryType:", 0);
    -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessoryType:", 3);

  }
}

- (id)pass
{
  return self->_pass;
}

- (id)transactionAmount
{
  PKPurchaseNewActionItem *purchaseNewItem;

  purchaseNewItem = self->_purchaseNewItem;
  if (purchaseNewItem)
    -[PKPurchaseNewActionItem amount](purchaseNewItem, "amount");
  else
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transactionCurrency
{
  void *purchaseNewItem;

  purchaseNewItem = self->_purchaseNewItem;
  if (purchaseNewItem)
  {
    objc_msgSend(purchaseNewItem, "currency");
    purchaseNewItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  return purchaseNewItem;
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPurchaseNewActionItem *purchaseNewItem;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  purchaseNewItem = self->_purchaseNewItem;
  if (purchaseNewItem)
  {
    -[PKPass secureElementPass](self->_pass, "secureElementPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__PKPerformActionPurchaseNewView_fetchServiceProviderDataWithCompletion___block_invoke;
    v8[3] = &unk_1E3E63218;
    v9 = v5;
    -[PKPurchaseNewActionItem serviceProviderDataWithItemForPass:completion:](purchaseNewItem, "serviceProviderDataWithItemForPass:completion:", v7, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __73__PKPerformActionPurchaseNewView_fetchServiceProviderDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UITextField)amountTextField
{
  return 0;
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

  -[PKPerformActionPurchaseNewView addSubview:](self, "addSubview:", self->_tableView);
}

- (PKPerformActionViewDelegate)delegate
{
  return (PKPerformActionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_purchaseNewItem, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
