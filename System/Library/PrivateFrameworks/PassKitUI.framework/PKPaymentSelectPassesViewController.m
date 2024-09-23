@implementation PKPaymentSelectPassesViewController

- (PKPaymentSelectPassesViewController)initWithSecureElementPasses:(id)a3 context:(int64_t)a4 delegate:(id)a5 peerPaymentAccount:(id)a6 reporter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentSelectPassesViewController *v17;
  PKPaymentSelectPassesViewController *v18;
  uint64_t v19;
  NSMutableArray *selectedIndexPaths;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSelectPassesViewController;
  v17 = -[PKPaymentSetupTableViewController initWithContext:](&v25, sel_initWithContext_, a4);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_passes, a3);
    objc_storeWeak((id *)&v18->_delegate, v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    selectedIndexPaths = v18->_selectedIndexPaths;
    v18->_selectedIndexPaths = (NSMutableArray *)v19;

    v18->_minimumSelectionCount = 1;
    objc_storeStrong((id *)&v18->_peerPaymentAccount, a6);
    objc_storeStrong((id *)&v18->_reporter, a7);
    PKLocalizedPaymentString(CFSTR("CONTINUE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSelectPassesViewController setButtonText:](v18, "setButtonText:", v21);

    -[PKPaymentSetupTableViewController dockView](v18, "dockView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "primaryButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", v18, sel__continuousButtonPressed, 64);

    -[PKPaymentSelectPassesViewController _setContinuousButtonEnabledState](v18, "_setContinuousButtonEnabledState");
  }

  return v18;
}

- (void)willMoveToParentViewController:(id)a3
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSelectPassesViewController;
  -[PKPaymentSelectPassesViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "selectPassesViewControllerDidTapBackButton:", self);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSelectPassesViewController;
  -[PKPaymentSelectPassesViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentSelectPassesViewControllerCellIdentifier"));

  -[PKPaymentSelectPassesViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTableHeaderView:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSelectPassesViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSelectPassesViewController;
  -[PKPaymentSelectPassesViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[PKPaymentSelectPassesViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSelectPassesViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v7));

}

- (void)setMinimumSelectionCount:(unint64_t)a3
{
  self->_minimumSelectionCount = a3;
  -[PKPaymentSelectPassesViewController _setContinuousButtonEnabledState](self, "_setContinuousButtonEnabledState");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_passes, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentSelectPassesViewControllerCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPass:", v8);
  objc_msgSend(v7, "setPeerPaymentAccount:", self->_peerPaymentAccount);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  LODWORD(self) = -[NSMutableArray containsObject:](self->_selectedIndexPaths, "containsObject:", v6);
  if ((_DWORD)self)
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v7, "setAccessoryType:", v10);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *selectedIndexPaths;
  int v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSelectPassesViewController;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v22, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_minimumSelectionCount == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_selectedIndexPaths;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v6, "cellForRowAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setAccessoryType:", 0);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    -[NSMutableArray removeAllObjects](self->_selectedIndexPaths, "removeAllObjects");
    selectedIndexPaths = self->_selectedIndexPaths;
    goto LABEL_12;
  }
  v16 = -[NSMutableArray containsObject:](self->_selectedIndexPaths, "containsObject:", v7);
  selectedIndexPaths = self->_selectedIndexPaths;
  if (!v16)
  {
LABEL_12:
    -[NSMutableArray addObject:](selectedIndexPaths, "addObject:", v7, (_QWORD)v18);
    v17 = 3;
    goto LABEL_13;
  }
  -[NSMutableArray removeObject:](selectedIndexPaths, "removeObject:", v7);
  v17 = 0;
LABEL_13:
  objc_msgSend(v8, "setAccessoryType:", v17);
  -[PKPaymentSelectPassesViewController _setContinuousButtonEnabledState](self, "_setContinuousButtonEnabledState");

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[PKPaymentPassTableViewCell heightForCellWithMinimum:hasSubTitle:](PKPaymentPassTableViewCell, "heightForCellWithMinimum:hasSubTitle:", 1, a4, 60.0);
  return result;
}

- (void)setHeaderTitle:(id)a3
{
  NSString **p_headerTitle;
  id v6;

  p_headerTitle = &self->_headerTitle;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_headerTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_headerTitle, a3);
    -[PKPaymentSelectPassesViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", *p_headerTitle, self->_headerSubtitle);
  }

}

- (void)setHeaderSubtitle:(id)a3
{
  NSString **p_headerSubtitle;
  id v6;

  p_headerSubtitle = &self->_headerSubtitle;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_headerSubtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_headerSubtitle, a3);
    -[PKPaymentSelectPassesViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", self->_headerTitle, *p_headerSubtitle);
  }

}

- (id)headerView
{
  PKTableHeaderView *headerView;
  PKTableHeaderView *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  void *v7;
  uint64_t v8;
  PKTableHeaderView *v9;
  uint64_t IsSetupAssistant;
  void *v11;
  void *v12;
  PKTableHeaderView *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v20;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [PKTableHeaderView alloc];
    v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_headerView;
    self->_headerView = v5;

    -[PKPaymentSelectPassesViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = self->_headerView;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[PKPaymentSetupTableViewController context](self, "context");
      IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else
    {
      IsSetupAssistant = 0;
    }
    -[PKTableHeaderView setStyle:](v9, "setStyle:", IsSetupAssistant);
    -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", self->_headerTitle);

    -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", self->_headerSubtitle);

    v13 = self->_headerView;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[PKTableHeaderView sizeThatFits:](v13, "sizeThatFits:", CGRectGetWidth(v20), 3.40282347e38);
    v16 = v15;
    v18 = v17;

    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v16, v18);
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  NSString *v6;
  void *v7;
  NSString *headerTitle;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a4;
  v6 = (NSString *)a3;
  -[PKPaymentSelectPassesViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  headerTitle = v6;
  if (!v6)
    headerTitle = self->_headerTitle;
  v9 = headerTitle;

  objc_msgSend(v7, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  if (v18)
  {
    objc_msgSend(v7, "subtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v18);

  }
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v14 = v13;
  objc_msgSend(v12, "bounds");
  objc_msgSend(v7, "sizeThatFits:", v15, 1.79769313e308);
  if (v16 > v14)
  {
    v17 = v16;
    objc_msgSend(v12, "_rectForTableHeaderView");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v12, "_tableHeaderHeightDidChangeToHeight:", v17);
  }
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)setButtonText:(id)a3
{
  NSString **p_buttonText;
  void *v6;
  void *v7;
  id v8;

  p_buttonText = &self->_buttonText;
  v8 = a3;
  if (!-[NSString isEqualToString:](*p_buttonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_buttonText, a3);
    -[PKPaymentSetupTableViewController dockView](self, "dockView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", *p_buttonText, 0);

  }
}

- (void)_setContinuousButtonEnabledState
{
  void *v3;
  id v4;

  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", -[NSMutableArray count](self->_selectedIndexPaths, "count") >= self->_minimumSelectionCount);

}

- (void)_continuousButtonPressed
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  __CFString *v17;
  int IsBridge;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = self->_selectedIndexPaths;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "row"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v6);
  }

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke;
  aBlock[3] = &unk_1E3E61388;
  aBlock[4] = self;
  v11 = v3;
  v31 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (self->_confirmIntentToDelete)
  {
    v14 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v15 = objc_msgSend(v11, "count");
    if (v15 > 1)
    {
      PKLocalizedShareableCredentialString(CFSTR("SELECT_PASSES_TO_DELETE_CONFIRMATION_TITLE"), CFSTR("%lu"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("SELECT_PASSES_TO_DELETE_CONFIRMATION_MESSAGE_PLURAL");
    }
    else
    {
      PKLocalizedShareableCredentialString(CFSTR("SELECT_PASSES_TO_DELETE_CONFIRMATION_TITLE_SINGULAR"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("SELECT_PASSES_TO_DELETE_CONFIRMATION_MESSAGE_SINGULAR");
    }
    -[PKPaymentSetupTableViewController context](self, "context");
    IsBridge = PKPaymentSetupContextIsBridge();
    PKDeviceSpecificLocalizedStringKeyForKey(v17, IsBridge);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v16, v20, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedShareableCredentialString(CFSTR("SELECT_PASSES_TO_DELETE_CONFIRMATION_CANCEL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v24);

    v25 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedShareableCredentialString(CFSTR("SELECT_PASSES_DELETE_BUTTON"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_4;
    v28[3] = &unk_1E3E61CA8;
    v29 = v13;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 2, v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v27);

    -[PKPaymentSelectPassesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }

}

void __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_setViewEnabledState:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1112));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_2;
  v5[3] = &unk_1E3E612E8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "selectPassesViewController:didSelectPasses:completion:", v3, v4, v5);

}

void __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_3;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setViewEnabledState:", 1);
}

uint64_t __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setViewEnabledState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKPaymentSelectPassesViewController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", v3);
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKPaymentSelectPassesViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v3);
  if (v3)
  {
    -[PKPaymentSelectPassesViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", 0);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "startAnimating");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
    -[PKPaymentSelectPassesViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKPaymentSelectPassesViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKPaymentSelectPassesViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:", v3 ^ 1);
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)setShowCancelButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (((!self->_showCancelButton ^ a3) & 1) == 0)
  {
    self->_showCancelButton = a3;
    -[PKPaymentSelectPassesViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    if (self->_showCancelButton)
    {
      -[PKPaymentSelectPassesViewController navigationItem](self, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
      objc_msgSend(v5, "setLeftBarButtonItem:", v6);

    }
    else
    {
      objc_msgSend(v4, "setLeftBarButtonItem:", 0);
    }

  }
}

- (void)_cancelPressed
{
  id WeakRetained;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "selectPassesViewControllerDidTapBackButton:", self);

}

- (unint64_t)minimumSelectionCount
{
  return self->_minimumSelectionCount;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)confirmIntentToDelete
{
  return self->_confirmIntentToDelete;
}

- (void)setConfirmIntentToDelete:(BOOL)a3
{
  self->_confirmIntentToDelete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
