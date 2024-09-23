@implementation PKPerformActionSelectItemView

- (PKPerformActionSelectItemView)init
{
  return -[PKPerformActionSelectItemView initWithPass:action:paymentDataProvider:](self, "initWithPass:action:paymentDataProvider:", 0, 0, 0);
}

- (PKPerformActionSelectItemView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  id v8;
  id v9;
  PKPerformActionSelectItemView *v10;
  PKPerformActionSelectItemView *v11;
  void *v12;
  uint64_t v13;
  PKSelectedItemActionItem *selectedItem;
  int v15;
  uint64_t v16;
  NSDateFormatter *v17;
  NSDateFormatter *dateFormatter;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPerformActionSelectItemView;
  v10 = -[PKPerformActionSelectItemView init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeStrong((id *)&v11->_action, a4);
    objc_msgSend(v9, "selectedActionItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    selectedItem = v11->_selectedItem;
    v11->_selectedItem = (PKSelectedItemActionItem *)v13;

    v15 = -[PKPerformActionSelectItemView _shouldReverseLayoutDirection](v11, "_shouldReverseLayoutDirection");
    v16 = 2;
    if (!v15)
      v16 = 0;
    v11->_textAlignment = v16;
    -[PKPerformActionSelectItemView setClipsToBounds:](v11, "setClipsToBounds:", 0);
    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v17;

    -[NSDateFormatter setDateStyle:](v11->_dateFormatter, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](v11->_dateFormatter, "setTimeStyle:", 0);
    -[PKPerformActionSelectItemView _addSubviews](v11, "_addSubviews");
  }

  return v11;
}

- (void)layoutSubviews
{
  UITableView *tableView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionSelectItemView;
  -[PKPerformActionSelectItemView layoutSubviews](&v4, sel_layoutSubviews);
  tableView = self->_tableView;
  -[PKPerformActionSelectItemView bounds](self, "bounds");
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
  objc_msgSend(v6, "setRightBarButtonEnabled:", self->_selectedItem != 0);

}

- (BOOL)_showsExpirationSection
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKPass paymentPass](self->_pass, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSuicaPass") && objc_msgSend(v3, "transitCommutePlanType") == 1)
  {
    v4 = PKPaymentPassCommuteRouteIsValid() != 0;
  }
  else
  {
    -[PKPaymentPassAction associatedPlan](self->_action, "associatedPlan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "properties") & 3) == 1)
    {
      objc_msgSend(v5, "passFieldForKey:", CFSTR("expiryDate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6 != 0;
    }
    else
    {
      v4 = 0;
    }

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKPaymentPassAction selectedActionItems](self->_action, "selectedActionItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "newExpirationDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v12 != 0;

        }
        else
        {
          v4 = 0;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v4;
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
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  if (a4 == 1)
  {
    -[PKPaymentPassAction selectedActionItems](self->_action, "selectedActionItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[PKPerformActionSelectItemView _showsExpirationSection](self, "_showsExpirationSection");
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKSelectedItemActionItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDateFormatter *dateFormatter;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSDateFormatter *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PKPerformActionSelectItemOptionsCellIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PKPerformActionSelectItemOptionsCellIdentifier"));
    -[PKPaymentPassAction selectedActionItems](self->_action, "selectedActionItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
    v10 = (PKSelectedItemActionItem *)objc_claimAutoreleasedReturnValue();

    -[PKSelectedItemActionItem amount](v10, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectedItemActionItem currency](v10, "currency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKFormattedCurrencyStringFromNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailTextLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextAlignment:", self->_textAlignment);
    -[PKSelectedItemActionItem title](v10, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v17);

    objc_msgSend(v14, "setLineBreakMode:", 4);
    objc_msgSend(v15, "setTextAlignment:", self->_textAlignment);
    objc_msgSend(v15, "setText:", v13);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v19);

    objc_msgSend(v8, "setSelectionStyle:", 3);
    if (v10 == self->_selectedItem)
      v20 = 3;
    else
      v20 = 0;
    objc_msgSend(v8, "setAccessoryType:", v20);
  }
  else
  {
    v35 = v6;
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PKPerformActionSelectItemExpiresCellIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKPerformActionSelectItemExpiresCellIdentifier"));
    -[PKPaymentPassAction associatedPlan](self->_action, "associatedPlan");
    v10 = (PKSelectedItemActionItem *)objc_claimAutoreleasedReturnValue();
    -[PKSelectedItemActionItem passFieldForKey:](v10, "passFieldForKey:", CFSTR("expiryDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", objc_msgSend(v34, "dateStyle"));
    objc_msgSend(v8, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailTextLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dateFormatter = self->_dateFormatter;
    -[PKSelectedItemActionItem expiryDate](v10, "expiryDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v23);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v24);

    v25 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v26);

    objc_msgSend(v14, "setTextAlignment:", self->_textAlignment);
    v27 = self->_dateFormatter;
    -[PKSelectedItemActionItem newExpirationDate](self->_selectedItem, "newExpirationDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](v27, "stringFromDate:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v29);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v30);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v31);

    v13 = v34;
    objc_msgSend(v15, "setTextAlignment:", self->_textAlignment);
    objc_msgSend(v8, "setSelectionStyle:", 0);
    objc_msgSend(v8, "setAccessoryType:", 0);
    v6 = v35;
  }

  PKProvisioningSecondaryBackgroundColor();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v32);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6;
  void *v7;

  v6 = -[PKPerformActionSelectItemView tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3);
  v7 = 0;
  if (a4 == 1 && v6 >= 1)
  {
    -[PKPerformActionSelectItemView _optionsSectionHeaderText](self, "_optionsSectionHeaderText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  PKPerformActionSelectItemExpiresHeader *v4;
  PKPerformActionSelectItemExpiresHeader *expiresHeader;
  PKPerformActionSelectItemExpiresHeader *v7;
  PKPerformActionSelectItemExpiresHeader *v8;
  PKPerformActionSelectItemExpiresHeader *v9;
  void *v10;
  PKPerformActionSelectItemExpiresHeader *v11;
  void *v12;

  if (a4)
  {
    v4 = 0;
  }
  else if (-[PKPerformActionSelectItemView _showsExpirationSection](self, "_showsExpirationSection", a3))
  {
    expiresHeader = self->_expiresHeader;
    if (!expiresHeader)
    {
      v7 = objc_alloc_init(PKPerformActionSelectItemExpiresHeader);
      v8 = self->_expiresHeader;
      self->_expiresHeader = v7;

      v9 = self->_expiresHeader;
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_SELECT_ITEM_EXPIRES"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPerformActionSelectItemExpiresHeader setLeadingString:](v9, "setLeadingString:", v10);

      v11 = self->_expiresHeader;
      PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_SELECT_ITEM_NEW_EXPIRATION"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPerformActionSelectItemExpiresHeader setTrailingString:](v11, "setTrailingString:", v12);

      expiresHeader = self->_expiresHeader;
    }
    v4 = expiresHeader;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v6;
  void *v7;

  v6 = -[PKPerformActionSelectItemView tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3);
  v7 = 0;
  if (a4 == 1 && v6 >= 1)
  {
    -[PKPerformActionSelectItemView _optionsSectionFooterText](self, "_optionsSectionFooterText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  PKSelectedItemActionItem *v8;
  void *v9;
  PKSelectedItemActionItem *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (objc_msgSend(v7, "section"))
  {
    v8 = self->_selectedItem;
    -[PKPaymentPassAction selectedActionItems](self->_action, "selectedActionItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    v10 = (PKSelectedItemActionItem *)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      objc_storeStrong((id *)&self->_selectedItem, v10);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", self->_selectedItem != 0);

      if (-[PKPerformActionSelectItemView _showsExpirationSection](self, "_showsExpirationSection"))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 5);

      }
      -[PKPaymentPassAction selectedActionItems](self->_action, "selectedActionItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "indexOfObject:", v8);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, objc_msgSend(v7, "section"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessoryType:", 0);
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAccessoryType:", 3);

    }
  }

}

- (id)pass
{
  return self->_pass;
}

- (id)transactionAmount
{
  PKSelectedItemActionItem *selectedItem;

  selectedItem = self->_selectedItem;
  if (selectedItem)
    -[PKSelectedItemActionItem amount](selectedItem, "amount");
  else
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transactionCurrency
{
  void *selectedItem;

  selectedItem = self->_selectedItem;
  if (selectedItem)
  {
    objc_msgSend(selectedItem, "currency");
    selectedItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  return selectedItem;
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKSelectedItemActionItem *selectedItem;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D66D98], "passPropertiesForPass:", self->_pass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  selectedItem = self->_selectedItem;
  if (selectedItem)
  {
    -[PKPass secureElementPass](self->_pass, "secureElementPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__PKPerformActionSelectItemView_fetchServiceProviderDataWithCompletion___block_invoke;
    v9[3] = &unk_1E3E63218;
    v10 = v4;
    -[PKSelectedItemActionItem serviceProviderDataWithPass:currentLocalBalance:completion:](selectedItem, "serviceProviderDataWithPass:currentLocalBalance:completion:", v8, v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __72__PKPerformActionSelectItemView_fetchServiceProviderDataWithCompletion___block_invoke(uint64_t a1)
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

  -[PKPerformActionSelectItemView addSubview:](self, "addSubview:", self->_tableView);
}

- (PKPerformActionViewDelegate)delegate
{
  return (PKPerformActionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expiresHeader, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
