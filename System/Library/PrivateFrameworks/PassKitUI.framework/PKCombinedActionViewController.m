@implementation PKCombinedActionViewController

- (PKCombinedActionViewController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 balanceModel:(id)a7 mode:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  PKCombinedActionViewController *v18;
  PKCombinedActionViewController *v19;
  void *v20;
  uint64_t v21;
  NSArray *actions;
  PKCollapsibleHeaderView *v23;
  uint64_t v24;
  PKCollapsibleHeaderView *headerView;
  PKPassView *v26;
  PKPassView *passView;
  void *v28;
  id v29;
  void *v30;
  id v32;
  id v33;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v33 = a5;
  v32 = a6;
  v17 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PKCombinedActionViewController;
  v18 = -[PKDynamicCollectionViewController init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_webService, a6);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v19->_actionGroups, a4);
    v19->_mode = a8;
    objc_msgSend(v17, "displayableCommutePlanActions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pk_objectsPassingTest:", &__block_literal_global_119);
    v21 = objc_claimAutoreleasedReturnValue();
    actions = v19->_actions;
    v19->_actions = (NSArray *)v21;

    v23 = [PKCollapsibleHeaderView alloc];
    v24 = -[PKCollapsibleHeaderView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    headerView = v19->_headerView;
    v19->_headerView = (PKCollapsibleHeaderView *)v24;

    v26 = -[PKPassView initWithPass:content:]([PKPassView alloc], "initWithPass:content:", v15, 5);
    passView = v19->_passView;
    v19->_passView = v26;

    objc_storeStrong((id *)&v19->_transitBalanceModel, a7);
    -[PKCombinedActionViewController navigationItem](v19, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v29, "configureWithTransparentBackground");
    objc_msgSend(v28, "setStandardAppearance:", v29);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v19, sel__cancelButtonPressed_);
    objc_msgSend(v28, "setLeftBarButtonItem:", v30);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v19, "setUseItemIdentityWhenUpdating:", 1);

  }
  return v19;
}

uint64_t __109__PKCombinedActionViewController_initWithPass_actionGroups_paymentDataProvider_webService_balanceModel_mode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 2)
    v3 = objc_msgSend(v2, "isActionAvailable");
  else
    v3 = 0;

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  unint64_t mode;
  void *v6;
  __CFString *v7;
  PKCombinedSelectActionGroupViewControllerListSectionController *v8;
  void *v9;
  void *v10;
  PKCombinedSelectActionGroupViewControllerListSectionController *v11;
  PKCombinedSelectActionGroupViewControllerListSectionController *actionGroupsListController;
  PKCombinedSelectActionViewControllerListSectionController **v13;
  PKCombinedSelectActionViewControllerListSectionController *v14;
  void *v15;
  void *v16;
  PKCombinedSelectActionViewControllerListSectionController *v17;
  PKCombinedSelectActionViewControllerListSectionController *actionsListController;
  void *v19;
  PKPassView *passView;
  void *v21;
  uint64_t v22;
  objc_super v23;
  PKCombinedSelectActionViewControllerListSectionController *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PKCombinedActionViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[PKCombinedActionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCombinedActionViewController setBackgroundColor:](self, "setBackgroundColor:", v4);
  -[PKCombinedActionViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v4);
  mode = self->_mode;
  if (mode == 1)
  {
    PKPassLocalizedStringWithFormat();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = [PKCombinedSelectActionViewControllerListSectionController alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKCombinedSelectActionViewControllerListSectionController initWithIdentifier:pass:actions:](v14, "initWithIdentifier:pass:actions:", v16, self->_pass, self->_actions);
    actionsListController = self->_actionsListController;
    self->_actionsListController = v17;

    -[PKCombinedSelectActionViewControllerListSectionController setDelegate:](self->_actionsListController, "setDelegate:", self);
    v24 = self->_actionsListController;
    v13 = &v24;
  }
  else
  {
    if (mode)
    {
      v7 = &stru_1E3E7D690;
      goto LABEL_9;
    }
    -[NSArray firstObject](self->_actionGroups, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v22 = 0;
      PKPassLocalizedStringWithFormat();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v8 = [PKCombinedSelectActionGroupViewControllerListSectionController alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKCombinedSelectActionGroupViewControllerListSectionController initWithIdentifier:pass:actionGroups:](v8, "initWithIdentifier:pass:actionGroups:", v10, self->_pass, self->_actionGroups);
    actionGroupsListController = self->_actionGroupsListController;
    self->_actionGroupsListController = v11;

    -[PKCombinedSelectActionGroupViewControllerListSectionController setDelegate:](self->_actionGroupsListController, "setDelegate:", self);
    v25[0] = self->_actionGroupsListController;
    v13 = (PKCombinedSelectActionViewControllerListSectionController **)v25;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController setSections:animated:](self, "setSections:animated:", v19, 1);

LABEL_9:
  -[PKCombinedActionViewController setTitleText:](self, "setTitleText:", v7);
  passView = self->_passView;
  -[PKCombinedActionViewController _imageSize](self, "_imageSize");
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](passView, "snapshotOfFrontFaceWithRequestedSize:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCombinedActionViewController setHeaderImage:](self, "setHeaderImage:", v21);

  objc_msgSend(v3, "addSubview:", self->_headerView);
}

- (CGSize)_imageSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = PKUIGetMinScreenWidthType();
  v3 = dbl_19DF14E90[v2 < 4];
  v4 = dbl_19DF14EA0[v2 < 4];
  if (!v2)
  {
    v4 = 81.0;
    v3 = 51.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCombinedActionViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_viewDidAppear = 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double headerHeight;
  PKCollapsibleHeaderView *headerView;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)PKCombinedActionViewController;
  -[PKDynamicCollectionViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[PKCombinedActionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readableContentGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "safeAreaInsets");
  v10 = v9;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  objc_msgSend(v11, "contentOffset");
  v25 = v15;
  v26 = v14;
  objc_msgSend(v11, "contentInset");
  v17 = v16;
  v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v21 = v10 + v13;
  headerHeight = self->_headerHeight;
  v29.origin.x = v6;
  v29.origin.y = v21;
  v29.size.width = v8;
  v29.size.height = headerHeight;
  CGRectGetMaxY(v29);
  -[PKCollapsibleHeaderView setFrame:](self->_headerView, "setFrame:", v6, v21, v8, headerHeight);
  headerView = self->_headerView;
  if (headerView)
  {
    -[PKCollapsibleHeaderView heightBoundsForWidth:](headerView, "heightBoundsForWidth:", v8);
    v24 = v27;
  }
  else
  {
    v24 = 0.0;
  }
  objc_msgSend(v11, "setContentInset:", v24, v18, v19, v20);
  if (v17 - v24 != 0.0)
    objc_msgSend(v11, "setContentOffset:", v26, v25 + v17 - v24);

}

- (void)setTitleFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PKCollapsibleHeaderView titleFont](self->_headerView, "titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
    -[PKCollapsibleHeaderView setTitleFont:](self->_headerView, "setTitleFont:", v6);

}

- (UIFont)titleFont
{
  return -[PKCollapsibleHeaderView titleFont](self->_headerView, "titleFont");
}

- (void)setTitleText:(id)a3
{
  NSString **p_titleText;
  void *v6;
  id v7;

  p_titleText = &self->_titleText;
  v7 = a3;
  if (!-[NSString isEqualToString:](*p_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    -[PKCollapsibleHeaderView setTitle:subtitle:](self->_headerView, "setTitle:subtitle:", *p_titleText, self->_subtitleText);
    -[PKCombinedActionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setSubtitleText:(id)a3
{
  NSString **p_subtitleText;
  void *v6;
  id v7;

  p_subtitleText = &self->_subtitleText;
  v7 = a3;
  if (!-[NSString isEqualToString:](*p_subtitleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitleText, a3);
    -[PKCollapsibleHeaderView setTitle:subtitle:](self->_headerView, "setTitle:subtitle:", self->_titleText, *p_subtitleText);
    -[PKCombinedActionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setBackgroundColor:(id)a3
{
  void *v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_backgroundColor != v7)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v7);

    -[PKCombinedActionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)setHeaderBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_headerBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_headerBackgroundColor, a3);
    -[PKCollapsibleHeaderView setBackgroundColor:](self->_headerView, "setBackgroundColor:", self->_headerBackgroundColor);
    v5 = v6;
  }

}

- (id)headerImage
{
  return -[PKCollapsibleHeaderView image](self->_headerView, "image");
}

- (void)setHeaderImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKCollapsibleHeaderView image](self->_headerView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v7);

  if ((v5 & 1) == 0)
  {
    -[PKCollapsibleHeaderView setImage:](self->_headerView, "setImage:", v7);
    -[PKCombinedActionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  PKCollapsibleHeaderView *headerView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSString *titleText;
  int v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  double v25;

  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[PKCombinedActionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v5 + v7;

  v25 = 0.0;
  v23 = 0u;
  v24 = 0u;
  headerView = self->_headerView;
  -[PKCollapsibleHeaderView bounds](headerView, "bounds");
  if (headerView)
  {
    -[PKCollapsibleHeaderView heightBoundsForWidth:](headerView, "heightBoundsForWidth:", v10);
    v11 = v25;
    v12 = *(double *)&v23;
  }
  else
  {
    v25 = 0.0;
    v12 = 0.0;
    v11 = 0.0;
    v23 = 0u;
    v24 = 0u;
  }
  v13 = fmin(v11, fmax(-v8, v12));
  if (v13 != self->_headerHeight)
  {
    self->_headerHeight = v13;
    v14 = v13 + -8.0;
    if (v13 + -8.0 < *((double *)&v24 + 1) && self->_viewDidAppear)
    {
      titleText = self->_titleText;
      v16 = 1;
    }
    else
    {
      v16 = 0;
      titleText = 0;
    }
    v22.receiver = self;
    v22.super_class = (Class)PKCombinedActionViewController;
    -[PKCombinedActionViewController setTitle:](&v22, sel_setTitle_, titleText);
    v17 = (*((double *)&v24 + 1) - v14) * 0.125;
    -[PKCombinedActionViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 0.0;
    if (v16)
      v20 = v17;
    objc_msgSend(v18, "_setManualScrollEdgeAppearanceProgress:", v20);

  }
  -[PKCombinedActionViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNeedsLayout");

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  -[PKCombinedActionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedActionViewControllerDidCancel:", self);

}

- (void)didSelectActionGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKRemoteActionGroupViewController *v8;
  PKRemoteActionGroupViewController *v9;
  id v10;
  _QWORD v11[4];
  PKRemoteActionGroupViewController *v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[PKRemoteActionGroupViewController initWithPass:actionGroup:paymentDataProvider:webService:]([PKRemoteActionGroupViewController alloc], "initWithPass:actionGroup:paymentDataProvider:webService:", self->_pass, v6, self->_paymentDataProvider, self->_webService);
  -[PKRemoteActionGroupViewController setDelegate:](v8, "setDelegate:", self);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PKCombinedActionViewController_didSelectActionGroup_completion___block_invoke;
  v11[3] = &unk_1E3E6F520;
  objc_copyWeak(&v14, &location);
  v9 = v8;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[PKRemoteActionGroupViewController preflightWithCompletion:](v9, "preflightWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __66__PKCombinedActionViewController_didSelectActionGroup_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

    }
    else
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
  }

}

- (void)didSelectAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  PKPaymentPass *pass;
  char v9;
  id v10;
  PKPerformActionViewController *v11;
  PKPerformActionViewController *v12;
  _QWORD v13[4];
  PKPerformActionViewController *v14;
  void (**v15)(_QWORD);
  id v16;
  id location;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v19 = 0;
  pass = self->_pass;
  v18 = 0;
  v9 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](pass, "canPerformAction:unableReason:displayableError:", v6, &v19, &v18);
  v10 = v18;
  if ((v9 & 1) != 0 || v19 == 2)
  {
    v12 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:paymentDataProvider:", self->_pass, v6, self->_paymentDataProvider);
    -[PKPerformActionViewController setDelegate:](v12, "setDelegate:", self);
    -[PKPerformActionViewController setWebService:](v12, "setWebService:", self->_webService);
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__PKCombinedActionViewController_didSelectAction_completion___block_invoke;
    v13[3] = &unk_1E3E6F520;
    objc_copyWeak(&v16, &location);
    v11 = v12;
    v14 = v11;
    v15 = v7;
    -[PKPerformActionViewController preflightWithCompletion:](v11, "preflightWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v19, v6, v10, 0);
    v11 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKCombinedActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
    if (v7)
      v7[2](v7);
  }

}

void __61__PKCombinedActionViewController_didSelectAction_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

    }
    else
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
  }

}

- (void)remoteGroupActionsViewControllerDidCancel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 0);

  -[PKCombinedActionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedActionViewControllerDidCancel:", self);

  objc_msgSend(v7, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 0);

  -[PKCombinedActionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedActionViewControllerDidFinish:", self);

  objc_msgSend(v7, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 0);

  -[PKCombinedActionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedActionViewControllerDidFinish:", self);

  objc_msgSend(v7, "setDelegate:", 0);
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 0);

  -[PKCombinedActionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedActionViewControllerDidCancel:", self);

  objc_msgSend(v7, "setDelegate:", 0);
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKCombinedActionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedActionViewControllerDidFinish:", self);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (PKCollapsibleHeaderView)headerView
{
  return self->_headerView;
}

- (PKCombinedActionViewControllerDelegate)delegate
{
  return (PKCombinedActionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_selectedActionGroup, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_actionsListController, 0);
  objc_storeStrong((id *)&self->_actionGroupsListController, 0);
}

@end
