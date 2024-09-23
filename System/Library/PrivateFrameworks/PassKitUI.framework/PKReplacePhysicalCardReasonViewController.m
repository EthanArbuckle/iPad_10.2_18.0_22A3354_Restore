@implementation PKReplacePhysicalCardReasonViewController

- (PKReplacePhysicalCardReasonViewController)initWithPhysicalCardController:(id)a3 context:(int64_t)a4
{
  id v7;
  PKReplacePhysicalCardReasonViewController *v8;
  PKReplacePhysicalCardReasonViewController *v9;
  void *v10;
  uint64_t v11;
  UIBarButtonItem *cancelButton;
  id v13;
  void *v14;
  uint64_t v15;
  UIBarButtonItem *nextButton;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKReplacePhysicalCardReasonViewController;
  v8 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v20, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a3);
    v9->_context = a4;
    objc_msgSend(v7, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_feature = objc_msgSend(v10, "feature");

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v9, sel__cancelButtonPressed_);
    cancelButton = v9->_cancelButton;
    v9->_cancelButton = (UIBarButtonItem *)v11;

    v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, v9, sel__nextButtonPressed_);
    nextButton = v9->_nextButton;
    v9->_nextButton = (UIBarButtonItem *)v15;

    -[PKReplacePhysicalCardReasonViewController navigationItem](v9, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v17, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    objc_msgSend(v17, "setLeftBarButtonItem:", v9->_cancelButton);
    objc_msgSend(v17, "setRightBarButtonItem:", v9->_nextButton);
    PKLocalizedFeatureString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v18);

    -[PKReplacePhysicalCardReasonViewController _updateNavigationButtons](v9, "_updateNavigationButtons");
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKReplacePhysicalCardReasonViewController;
  -[PKSectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKReplacePhysicalCardReasonViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPhysicalCardReasonTableViewCellReuseIdentifier"));

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKReplacePhysicalCardReasonViewController;
  -[PKReplacePhysicalCardReasonViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKReplacePhysicalCardReasonViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKReplacePhysicalCardReasonViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKReplacePhysicalCardReasonViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[PKReplacePhysicalCardReasonViewController _cellForReasonAtIndexPath:inTableView:](self, "_cellForReasonAtIndexPath:inTableView:", a4, a3);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return !self->_loadingCustomizationOptions;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)PKLocalizedFeatureString();
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedFeatureString();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[PKReplacePhysicalCardReasonViewController _reasonRowSelectedAtIndexPath:inTableView:](self, "_reasonRowSelectedAtIndexPath:inTableView:", a4, a3);
}

- (void)_reasonRowSelectedAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  int64_t v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v12, "row");
  objc_msgSend(v12, "section");
  if (!self->_hasSelectedRow || self->_selectedRow != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessoryType:", 0);
    objc_msgSend(v6, "cellForRowAtIndexPath:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessoryType:", 3);
    self->_hasSelectedRow = 1;
    self->_selectedRow = v7;
    -[PKReplacePhysicalCardReasonViewController _updateNavigationButtons](self, "_updateNavigationButtons");

  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v12, 1);

}

- (id)_cellForReasonAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t selectedRow;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPhysicalCardReasonTableViewCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "row") > 4)
  {
    v8 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  if (self->_hasSelectedRow)
  {
    selectedRow = self->_selectedRow;
    if (selectedRow == objc_msgSend(v6, "row"))
      v11 = 3;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v11);

  return v7;
}

- (void)_updateNavigationButtons
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", !self->_loadingCustomizationOptions);
  v3 = self->_hasSelectedRow && !self->_loadingCustomizationOptions;
  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", v3);
  if (self->_loadingCustomizationOptions)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v6, "startAnimating");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v6);
    -[PKReplacePhysicalCardReasonViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

  }
  else
  {
    -[PKReplacePhysicalCardReasonViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", self->_nextButton);
  }

}

- (void)_cancelButtonPressed:(id)a3
{
  -[PKReplacePhysicalCardReasonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_nextButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t selectedRow;
  uint64_t v10;
  int64_t context;
  void *v12;
  void *v13;
  PKOrderPhysicalCardController *v14;
  PKOrderPhysicalCardController *orderController;
  PKOrderPhysicalCardController *v16;
  uint64_t v17;
  PKOrderPhysicalCardController *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  if (!self->_loadingCustomizationOptions && self->_hasSelectedRow)
  {
    self->_loadingCustomizationOptions = 1;
    -[PKReplacePhysicalCardReasonViewController _updateNavigationButtons](self, "_updateNavigationButtons");
    v18 = [PKOrderPhysicalCardController alloc];
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicalCardController paymentPass](self->_controller, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicalCardController account](self->_controller, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicalCardController accountUser](self->_controller, "accountUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    selectedRow = self->_selectedRow;
    if (selectedRow > 4)
      v10 = 5;
    else
      v10 = qword_19DF17CB0[selectedRow];
    v17 = v10;
    context = self->_context;
    -[PKPhysicalCardController primaryPhysicalCard](self->_controller, "primaryPhysicalCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      -[PKPhysicalCardController unactivatedPhysicalCard](self->_controller, "unactivatedPhysicalCard");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = -[PKOrderPhysicalCardController initWithAccountService:paymentWebService:paymentPass:account:accountUser:orderReason:context:currentPhysicalCard:](v18, "initWithAccountService:paymentWebService:paymentPass:account:accountUser:orderReason:context:currentPhysicalCard:", v19, v5, v6, v7, v8, v17, context, v13);
    orderController = self->_orderController;
    self->_orderController = v14;

    if (!v12)
    objc_initWeak(&location, self);
    v16 = self->_orderController;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke;
    v20[3] = &unk_1E3E65F18;
    objc_copyWeak(&v21, &location);
    -[PKOrderPhysicalCardController updateCustomizationOptionsWithCompletion:](v16, "updateCustomizationOptionsWithCompletion:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_2;
    block[3] = &unk_1E3E612E8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_2(uint64_t a1)
{
  PKOrderPhysicalCardAddressConfirmationViewController *v2;
  PKOrderPhysicalCardAddressConfirmationViewController *v3;
  _QWORD v4[5];
  PKOrderPhysicalCardAddressConfirmationViewController *v5;

  v2 = -[PKOrderPhysicalCardAddressConfirmationViewController initWithOrderPhysicalCardController:]([PKOrderPhysicalCardAddressConfirmationViewController alloc], "initWithOrderPhysicalCardController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_3;
  v4[3] = &unk_1E3E619E0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  -[PKOrderPhysicalCardAddressConfirmationViewController preflightWithCompletion:](v3, "preflightWithCompletion:", v4);

}

void __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_4;
  block[3] = &unk_1E3E64908;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_4(uint64_t a1)
{
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1136) = 0;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateNavigationButtons");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderController, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
