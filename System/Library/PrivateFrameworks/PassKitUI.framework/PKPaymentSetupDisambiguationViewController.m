@implementation PKPaymentSetupDisambiguationViewController

- (PKPaymentSetupDisambiguationViewController)initWithProducts:(id)a3 context:(int64_t)a4
{
  id v6;
  PKPaymentSetupDisambiguationViewController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  UIBarButtonItem *nextBarButtonItem;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *products;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  v7 = -[PKPaymentSetupTableViewController initWithContext:](&v18, sel_initWithContext_, a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, v7, sel__nextTapped_);
    nextBarButtonItem = v7->_nextBarButtonItem;
    v7->_nextBarButtonItem = (UIBarButtonItem *)v10;

    -[PKPaymentSetupDisambiguationViewController navigationItem](v7, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v7->_nextBarButtonItem);

    -[UIBarButtonItem setEnabled:](v7->_nextBarButtonItem, "setEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("displayName"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    products = v7->_products;
    v7->_products = (NSArray *)v15;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  -[PKPaymentSetupDisambiguationViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupDisambiguationViewController setupHeaderViewForTableView:](self, "setupHeaderViewForTableView:", v3);
  -[PKPaymentSetupDisambiguationViewController setupFooterViewForTableView:](self, "setupFooterViewForTableView:", v3);
  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  objc_msgSend(v3, "setTableFooterView:", self->_footerView);
  objc_msgSend(v3, "setSeparatorStyle:", 1);

}

- (void)setupHeaderViewForTableView:(id)a3
{
  id v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  PKTableHeaderView *headerView;
  uint64_t v8;
  const __CFString *enteredCardNumber;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKTableHeaderView *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v6;

  PKLocalizedPaymentString(CFSTR("SELECT_CARD"));
  v8 = objc_claimAutoreleasedReturnValue();
  enteredCardNumber = (const __CFString *)self->_enteredCardNumber;
  if (!enteredCardNumber)
    enteredCardNumber = CFSTR("--");
  v17 = (id)v8;
  PKLocalizedPaymentString(CFSTR("SELECT_CARD_SUBTITLE"), CFSTR("%@"), enteredCardNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView imageView](self->_headerView, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", 0);

  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v17);

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v10);

  v14 = self->_headerView;
  objc_msgSend(v4, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "colorWithAlphaComponent:", 0.949999988);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView setBackgroundColor:](v14, "setBackgroundColor:", v16);

  -[PKTableHeaderView sizeToFit](self->_headerView, "sizeToFit");
}

- (void)setupFooterViewForTableView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKDisambiguationFooterView *v15;
  PKDisambiguationFooterView *footerView;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v19 = a3;
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3428];
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke;
  v22[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v7, "actionWithHandler:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3428];
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke_2;
  v20[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v10, "actionWithHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SELECT_CARD_DIFFERENT_CARD"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SELECT_CARD_LATER"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SELECT_CARD_FOOTER_DESCRIPTION"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController context](self, "context");
  if (PKPaymentSetupContextIsSetupAssistant())
    v15 = -[PKDisambiguationFooterView initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:]([PKDisambiguationFooterView alloc], "initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:", v9, v11, v12, v13, v14, 0.0, 0.0, v6, 130.0);
  else
    v15 = -[PKDisambiguationFooterView initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:]([PKDisambiguationFooterView alloc], "initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:", v9, 0, v12, 0, v14, 0.0, 0.0, v6, 130.0);
  footerView = self->_footerView;
  self->_footerView = v15;

  -[PKDisambiguationFooterView descriptionLabel](self->_footerView, "descriptionLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SELECT_CARD_FOOTER_DESCRIPTION"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

  -[PKDisambiguationFooterView sizeToFitForTableView:](self->_footerView, "sizeToFitForTableView:", v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_popToCameraCapture:", v4);
}

void __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setupLater:", v4);
}

- (void)viewDidLayoutSubviews
{
  PKDisambiguationFooterView *footerView;
  void *v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  -[PKPaymentSetupDisambiguationViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  footerView = self->_footerView;
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDisambiguationFooterView sizeToFitForTableView:](footerView, "sizeToFitForTableView:", v4);

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDisambiguationFooterView bounds](self->_footerView, "bounds");
  objc_msgSend(v5, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v7));

}

- (id)_productAtIndexPath:(id)a3
{
  return -[NSArray objectAtIndex:](self->_products, "objectAtIndex:", objc_msgSend(a3, "row"));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_products, "count", a3, a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PKPaymentSetupProduct *v7;
  void *v8;
  PKPaymentSetupProductCell *v9;
  uint64_t v10;

  v6 = a3;
  -[PKPaymentSetupDisambiguationViewController _productAtIndexPath:](self, "_productAtIndexPath:", a4);
  v7 = (PKPaymentSetupProduct *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSetupProductCell reuseIdentifier](PKPaymentSetupProductCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (PKPaymentSetupProductCell *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = objc_alloc_init(PKPaymentSetupProductCell);
  -[PKPaymentSetupProductCell setProduct:](v9, "setProduct:", v7);
  -[PKPaymentSetupProductCell setTextLabelOffset:](v9, "setTextLabelOffset:", 50.0);
  if (self->_selectedProduct == v7)
    v10 = 3;
  else
    v10 = 0;
  -[PKPaymentSetupProductCell setAccessoryType:](v9, "setAccessoryType:", v10);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  v6 = a4;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v9, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[PKPaymentSetupDisambiguationViewController _productAtIndexPath:](self, "_productAtIndexPath:", v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupDisambiguationViewController _updateSelectedProduct:](self, "_updateSelectedProduct:", v7);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 0);

}

- (void)setEnteredCardNumber:(id)a3
{
  NSString *v4;
  NSString *enteredCardNumber;
  const __CFString *v6;
  void *v7;
  id v8;

  if (self->_enteredCardNumber != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    enteredCardNumber = self->_enteredCardNumber;
    self->_enteredCardNumber = v4;

    v6 = (const __CFString *)self->_enteredCardNumber;
    if (!v6)
      v6 = CFSTR("--");
    PKLocalizedPaymentString(CFSTR("SELECT_CARD_SUBTITLE"), CFSTR("%@"), v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

  }
}

- (void)setProducts:(id)a3
{
  NSArray *v4;
  NSArray *products;
  void *v6;
  PKDisambiguationFooterView *footerView;
  void *v8;
  id v9;
  CGRect v10;

  if (self->_products != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    products = self->_products;
    self->_products = v4;

    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    footerView = self->_footerView;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDisambiguationFooterView sizeToFitForTableView:](footerView, "sizeToFitForTableView:", v8);

    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDisambiguationFooterView bounds](self->_footerView, "bounds");
    objc_msgSend(v9, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v10));

  }
}

- (void)_updateSelectedProduct:(id)a3
{
  PKPaymentSetupProduct *v5;
  void *v6;
  PKPaymentSetupProduct *v7;

  v5 = (PKPaymentSetupProduct *)a3;
  if (self->_selectedProduct != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_selectedProduct, a3);
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    -[UIBarButtonItem setEnabled:](self->_nextBarButtonItem, "setEnabled:", self->_selectedProduct != 0);
    v5 = v7;
  }

}

- (void)clearSelectedProduct
{
  -[PKPaymentSetupDisambiguationViewController _updateSelectedProduct:](self, "_updateSelectedProduct:", 0);
}

- (void)_nextTapped:(id)a3
{
  void *v4;
  void *v5;

  -[PKPaymentSetupDisambiguationViewController selectedProduct](self, "selectedProduct", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[PKPaymentSetupDisambiguationViewController _notifyDelegateDidSelectProduct:](self, "_notifyDelegateDidSelectProduct:", v4);
    v4 = v5;
  }

}

- (void)_notifyDelegateDidSelectProduct:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "disambiguationViewController:didSelectProduct:", self, v9);

    }
  }

}

- (void)_popToCameraCapture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[PKPaymentSetupDisambiguationViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v8, "count") - 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupDisambiguationViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popToViewController:animated:", v5, 1);

}

- (void)_setupLater:(id)a3
{
  PKPaymentSetupDisambiguationViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "disambiguationViewControllerSetUpLater:", self);

    }
  }
}

- (PKPaymentSetupDisambiguationViewControllerDelegate)delegate
{
  return (PKPaymentSetupDisambiguationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)products
{
  return self->_products;
}

- (PKPaymentSetupProduct)selectedProduct
{
  return self->_selectedProduct;
}

- (NSString)enteredCardNumber
{
  return self->_enteredCardNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredCardNumber, 0);
  objc_storeStrong((id *)&self->_selectedProduct, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_nextBarButtonItem, 0);
  objc_storeStrong((id *)&self->_products, 0);
}

@end
