@implementation PKPaymentSetupTableViewController

- (PKPaymentSetupTableViewController)initWithContext:(int64_t)a3
{
  return -[PKPaymentSetupTableViewController initWithStyle:context:](self, "initWithStyle:context:", objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), a3);
}

- (PKPaymentSetupTableViewController)initWithStyle:(int64_t)a3 context:(int64_t)a4
{
  PKPaymentSetupTableViewController *v6;
  PKPaymentSetupTableViewController *v7;
  uint64_t v8;
  UITableViewController *tableViewController;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupTableViewController;
  v6 = -[PKPaymentSetupTableViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_context = a4;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithStyle:", a3);
    tableViewController = v7->_tableViewController;
    v7->_tableViewController = (UITableViewController *)v8;

    -[PKPaymentSetupTableViewController navigationItem](v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v10, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupTableViewController;
  -[PKPaymentSetupTableViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;
  UIView *v4;
  UIView *containerView;
  UITableView *v6;
  UITableView *tableView;
  UITableView *v8;
  void *v9;
  uint64_t v10;
  UIView *v11;
  void *v12;
  void *v13;
  id v14;

  -[PKPaymentSetupTableViewController addChildViewController:](self, "addChildViewController:", self->_tableViewController);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  containerView = self->_containerView;
  self->_containerView = v4;

  -[PKPaymentSetupTableViewController setView:](self, "setView:", self->_containerView);
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v6 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v6;

  v8 = self->_tableView;
  PKProvisioningBackgroundColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v10 = *MEMORY[0x1E0D67E60];
  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E60]);
  -[UITableView backgroundColor](self->_tableView, "backgroundColor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v14);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_tableView);
  -[UITableViewController didMoveToParentViewController:](self->_tableViewController, "didMoveToParentViewController:", self);
  v11 = self->_containerView;
  -[PKPaymentSetupTableViewController footerTextView](self, "footerTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v11, "addSubview:", v12);

  -[PKPaymentSetupTableViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", v10);

}

- (BOOL)extendedLayoutIncludesOpaqueBars
{
  return 1;
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  int64_t context;
  void *v6;
  void *v7;
  NSIndexPath *selectedIndexPath;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupTableViewController;
  -[PKPaymentSetupTableViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  context = self->_context;
  -[PKPaymentSetupTableViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(context, v6);

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "allowsMultipleSelection") & 1) == 0)
  {
    selectedIndexPath = self->_selectedIndexPath;
    objc_msgSend(v7, "indexPathForSelectedRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(selectedIndexPath) = -[NSIndexPath isEqual:](selectedIndexPath, "isEqual:", v9);

    if ((_DWORD)selectedIndexPath)
      objc_msgSend(v7, "deselectRowAtIndexPath:animated:", self->_selectedIndexPath, v3);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSIndexPath *selectedIndexPath;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupTableViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UITableView endEditing:](self->_tableView, "endEditing:", 1);
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupTableViewController;
  -[PKPaymentSetupTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  PKPaymentSetupDockView *dockView;
  double v41;
  double v42;
  double height;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  UITableView *tableView;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  UITableView *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double rect;
  objc_super v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v81.receiver = self;
  v81.super_class = (Class)PKPaymentSetupTableViewController;
  -[PKPaymentSetupTableViewController viewWillLayoutSubviews](&v81, sel_viewWillLayoutSubviews);
  -[PKPaymentSetupTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v74 = v12;
  objc_msgSend(v3, "layoutMargins");
  v14 = v13;
  v16 = v15;
  v72 = v9;
  v73 = v7;
  if (PKPaymentSetupContextIsSetupAssistant()
    && -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    v17 = v7;
    v18 = v5 + v14;
    v19 = v17 + 0.0;
    v9 = v9 - (v14 + v16);
    objc_msgSend(v3, "readableContentGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutFrame");
    v22 = fmin(v21, 536.0);

    if (v22 >= v9)
    {
      rect = v19;
      v28 = 1;
      v27 = v11;
    }
    else
    {
      PKSizeAlignedInRect();
      v18 = v23;
      rect = v24;
      v9 = v25;
      v27 = v26;
      v28 = 1;
    }
  }
  else
  {
    v28 = 0;
    v27 = v11;
    rect = v7;
    v18 = v5;
  }
  -[PKHyperlinkTextView attributedText](self->_footerTextView, "attributedText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  v31 = v5;
  if (v30)
  {
    v32 = v14 + v16;
    if (v28)
      v32 = 0.0;
    v33 = v9 - v32;
    v34 = -0.0;
    if (!v28)
      v34 = v14;
    v35 = v18 + v34;
    -[PKHyperlinkTextView sizeThatFits:](self->_footerTextView, "sizeThatFits:", v33, 1.79769313e308);
    PKSizeCeilToPixel();
    v75 = v36;
    v76 = 6.0;
    v27 = v27 - (v74 + 10.0 + v36 + 6.0);
  }
  else
  {
    v35 = *MEMORY[0x1E0C9D648];
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v75 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v76 = 0.0;
  }
  -[UITableView setFrame:](self->_tableView, "setFrame:", v18, rect, v9, v27);
  -[UITableView contentInset](self->_tableView, "contentInset");
  v77 = v38;
  v78 = v37;
  v79 = v39;
  dockView = self->_dockView;
  if (!dockView)
  {
    v82.origin.x = v18;
    v82.origin.y = rect;
    v82.size.width = v9;
    v82.size.height = v27;
    v46 = CGRectGetMaxY(v82) - v76;
    v42 = 0.0;
    goto LABEL_24;
  }
  -[PKPaymentSetupDockView sizeThatFits:](dockView, "sizeThatFits:");
  v71 = v33;
  v42 = v41;
  v70 = v35;
  if (self->_moveFooterWithKeyboard)
  {
    height = self->_keyboardFrame.size.height;
    v44 = rect;
    if (height > 0.0 || v30)
      goto LABEL_17;
LABEL_20:
    v45 = v74;
    goto LABEL_21;
  }
  height = 0.0;
  v44 = rect;
  if (!v30)
    goto LABEL_20;
LABEL_17:
  v45 = 0.0;
LABEL_21:
  v47 = v42 + v45;
  v48 = v18;
  v49 = v9;
  v50 = v27;
  v51 = CGRectGetMaxY(*(CGRect *)(&v44 - 1)) - v47 - height;
  v83.origin.x = v31;
  v83.origin.y = v73;
  v83.size.width = v72;
  v83.size.height = v11;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", v31, v51, v72, CGRectGetMaxY(v83) - v51);
  -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");

  PKSizeAlignedInRect();
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:");
  -[PKPaymentSetupDockView setNeedsLayout](self->_dockView, "setNeedsLayout");
  v84.origin.x = v54;
  v84.origin.y = v56;
  v84.size.width = v58;
  v84.size.height = v60;
  v46 = v76 + CGRectGetMaxY(v84);
  tableView = self->_tableView;
  -[_PKVisibilityBackdropView bounds](self->_blurringView, "bounds");
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", self->_blurringView);
  v63 = v62;
  -[UITableView contentSize](self->_tableView, "contentSize");
  v65 = v64;
  -[UITableView bounds](self->_tableView, "bounds");
  v85.size.height = fmin(v66, v65 - v85.origin.y);
  v67 = fmin(fmax(CGRectGetMaxY(v85) - v63, 0.0), 30.0) / 30.0;
  if (self->_backdropWeight != v67)
  {
    self->_backdropWeight = v67;
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
  }
  v35 = v70;
  v33 = v71;
LABEL_24:
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", v78, v77, v42, v79);
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v78, v77, v42, v79);
  -[PKHyperlinkTextView setFrame:](self->_footerTextView, "setFrame:", v35, v46, v33, v75);
  v68 = self->_tableView;
  -[PKPaymentSetupTableViewController navigationItem](self, "navigationItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:](v68, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v69);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PKPaymentSetupTableViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPaymentSetupTableViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __55__PKPaymentSetupTableViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 1032);
  v4 = *(double *)(v2 + 1040);
  v5 = *(double *)(v2 + 1048);
  v6 = *(double *)(v2 + 1056);
  *(_BYTE *)(v2 + 1064) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1032);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1048) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1032), v16);
}

- (void)_keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__PKPaymentSetupTableViewController__keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKPaymentSetupTableViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __57__PKPaymentSetupTableViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 129;
  v4 = *((double *)v2 + 129);
  v5 = *((double *)v2 + 130);
  v6 = *((double *)v2 + 131);
  v7 = *((double *)v2 + 132);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1032), v13);
}

- (void)_keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PKPaymentSetupTableViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E3E61918;
  v3[4] = self;
  -[PKPaymentSetupTableViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
}

BOOL __55__PKPaymentSetupTableViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1032);
  *(_BYTE *)(v1 + 1064) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1032);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (v4 && self->_moveFooterWithKeyboard)
  {
    -[PKPaymentSetupTableViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      if (v4[2](v4))
      {
        objc_msgSend(v6, "setNeedsLayout");
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __68__PKPaymentSetupTableViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E3E612E8;
        v9 = v6;
        objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v8, 0);

      }
    }
    else
    {
      v4[2](v4);
    }

  }
}

uint64_t __68__PKPaymentSetupTableViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (PKPaymentSetupDockView)dockView
{
  PKPaymentSetupDockView *dockView;
  PKPaymentSetupDockView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PKPaymentSetupDockView *v9;
  PKPaymentSetupDockView *v10;
  _PKVisibilityBackdropView *v11;
  _PKVisibilityBackdropView *blurringView;
  void *v13;
  PKHyperlinkTextView *footerTextView;
  void *v15;
  void *v16;

  dockView = self->_dockView;
  if (!dockView)
  {
    -[PKPaymentSetupTableViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v4 = [PKPaymentSetupDockView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[PKPaymentSetupDockView initWithFrame:context:](v4, "initWithFrame:context:", self->_context, *MEMORY[0x1E0C9D648], v6, v7, v8);
    v10 = self->_dockView;
    self->_dockView = v9;

    v11 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v5, v6, v7, v8);
    blurringView = self->_blurringView;
    self->_blurringView = v11;

    -[_PKVisibilityBackdropView setDelegate:](self->_blurringView, "setDelegate:", self);
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, self->_backdropWeight);
    -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_blurringView, "setUserInteractionEnabled:", 1);
    -[_UIBackdropView contentView](self->_blurringView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_dockView);
    objc_msgSend(v13, "addSubview:", self->_footerTextView);
    footerTextView = self->_footerTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHyperlinkTextView setBackgroundColor:](footerTextView, "setBackgroundColor:", v15);

    -[PKPaymentSetupTableViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_blurringView);
    objc_msgSend(v16, "setNeedsLayout");

    dockView = self->_dockView;
  }
  return dockView;
}

- (PKHyperlinkTextView)footerTextView
{
  PKHyperlinkTextView *footerTextView;
  PKHyperlinkTextView *v4;
  PKHyperlinkTextView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PKPaymentSetupTableViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  footerTextView = self->_footerTextView;
  if (!footerTextView)
  {
    v4 = objc_alloc_init(PKHyperlinkTextView);
    v5 = self->_footerTextView;
    self->_footerTextView = v4;

    PKGenericOnboardingPresenter(self, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPaymentSetupTableViewController context](self, "context");
    -[PKPaymentSetupTableViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKOpenURLModallyHyperlinkAction(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKGenericHyperlinkAction(v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHyperlinkTextView setAction:](self->_footerTextView, "setAction:", v10);

    footerTextView = self->_footerTextView;
  }
  return footerTextView;
}

- (NSAttributedString)footerAttributedText
{
  void *v2;
  void *v3;

  -[PKPaymentSetupTableViewController footerTextView](self, "footerTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setFooterAttributedText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PKPaymentSetupTableViewController addFooterStyleAttributes:](self, "addFooterStyleAttributes:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController footerTextView](self, "footerTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (id)addFooterStyleAttributes:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    v5 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v5, "setLineBreakMode:", 0);
    objc_msgSend(v5, "setAlignment:", 1);
    v12[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DC1178];
    v13[0] = v6;
    v13[1] = v5;
    v8 = *MEMORY[0x1E0DC1140];
    v12[1] = v7;
    v12[2] = v8;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addAttributes:range:", v10, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)setClearsSelectionOnViewWillAppear:(BOOL)a3
{
  self->_clearsSelectionOnViewWillAppear = a3;
  -[UITableViewController setClearsSelectionOnViewWillAppear:](self->_tableViewController, "setClearsSelectionOnViewWillAppear:");
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v3;

  if (self->_dockView)
  {
    -[PKPaymentSetupTableViewController view](self, "view", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  char v7;
  NSIndexPath *v8;
  NSIndexPath *selectedIndexPath;
  void *v10;

  v6 = a4;
  if (self->_tableView == a3)
  {
    v10 = v6;
    v7 = objc_msgSend(a3, "allowsMultipleSelection");
    v6 = v10;
    if ((v7 & 1) == 0)
    {
      v8 = (NSIndexPath *)objc_msgSend(v10, "copy");
      selectedIndexPath = self->_selectedIndexPath;
      self->_selectedIndexPath = v8;

      v6 = v10;
    }
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  PKPaymentSetupApplyContextAppearance(self->_context, a4);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKPaymentSetupTableViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v4;
  int64_t v5;

  v4 = a4;
  if ((PKPaymentSetupForceBridgeAppearance() & 1) != 0 || (PKPaymentSetupContextIsBridge() & 1) != 0)
  {
    v5 = 2030;
  }
  else if (objc_msgSend(v4, "userInterfaceStyle") == 2)
  {
    v5 = 2030;
  }
  else
  {
    v5 = 2010;
  }

  return v5;
}

- (unint64_t)paymentSetupMarker
{
  return 2;
}

- (BOOL)paymentSetupMarkerRemovalIsInclusive
{
  return 1;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)clearsSelectionOnViewWillAppear
{
  return self->_clearsSelectionOnViewWillAppear;
}

- (BOOL)moveFooterWithKeyboard
{
  return self->_moveFooterWithKeyboard;
}

- (void)setMoveFooterWithKeyboard:(BOOL)a3
{
  self->_moveFooterWithKeyboard = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
