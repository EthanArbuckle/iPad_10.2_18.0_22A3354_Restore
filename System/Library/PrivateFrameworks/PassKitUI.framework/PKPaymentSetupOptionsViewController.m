@implementation PKPaymentSetupOptionsViewController

- (id)_init
{
  PKPaymentSetupOptionsViewController *v2;
  id *p_isa;
  PKCollapsibleHeaderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  PKPaymentSetupNoResultsView *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupOptionsViewController;
  v2 = -[PKDynamicCollectionViewController init](&v18, sel_init);
  p_isa = (id *)&v2->super.super.super.super.isa;
  if (v2)
  {
    v2->_shouldCollapseHeaderOnKeyboardShow = 1;
    v2->_headerMode = 0;
    v4 = [PKCollapsibleHeaderView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[PKCollapsibleHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    v10 = p_isa[149];
    p_isa[149] = (id)v9;

    objc_msgSend(p_isa[149], "setDelegate:", p_isa);
    v11 = -[PKPaymentSetupNoResultsView initWithFrame:]([PKPaymentSetupNoResultsView alloc], "initWithFrame:", v5, v6, v7, v8);
    v12 = p_isa[132];
    p_isa[132] = v11;

    objc_msgSend(p_isa[132], "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setOpacity:", v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", p_isa, sel__keyboardSizeDidChange_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", p_isa, sel__addDockViewToCollectionViewIfNeeded, *MEMORY[0x1E0DC48E8], 0);

  }
  return p_isa;
}

- (PKPaymentSetupOptionsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id *v11;
  PKPaymentSetupOptionsViewController *v12;

  v9 = a3;
  v10 = a5;
  v11 = -[PKPaymentSetupOptionsViewController _init](self, "_init");
  v12 = (PKPaymentSetupOptionsViewController *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 155, a3);
    v12->_context = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_allowsManualEntry = 1;
    v12->_paymentSetupMode = 0;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  UIColor *backgroundColor;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupOptionsViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setBackgroundColor:](self, "setBackgroundColor:", v5);

    backgroundColor = self->_backgroundColor;
  }
  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", backgroundColor);
  objc_msgSend(v3, "addSubview:", self->_headerView);
  if (self->_blurringView)
    objc_msgSend(v3, "bringSubviewToFront:");
  objc_msgSend(v3, "addSubview:", self->_noResultsView);
  -[PKPaymentSetupOptionsViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v6, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  -[PKPaymentSetupOptionsViewController _updateNavigationItem](self, "_updateNavigationItem");

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  char v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupOptionsViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  self->_viewDidAppear = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "viewControllerDidBeginSetupFlow:", self);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupOptionsViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPaymentSetupOptionsViewController _addDockViewToCollectionViewIfNeeded](self, "_addDockViewToCollectionViewIfNeeded");
  -[PKPaymentSetupOptionsViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  PKPaymentSetupDockView *dockView;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat height;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  PKCollapsibleHeaderView *headerView;
  double MaxX;
  double v57;
  PKCollapsibleHeaderView *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat MaxY;
  double v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double MinX;
  double v93;
  double v94;
  double v95;
  objc_super v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v96.receiver = self;
  v96.super_class = (Class)PKPaymentSetupOptionsViewController;
  -[PKDynamicCollectionViewController viewWillLayoutSubviews](&v96, sel_viewWillLayoutSubviews);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "readableContentGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutFrame");
  v83 = v14;
  v84 = v13;
  v81 = v16;
  v82 = v15;

  objc_msgSend(v3, "safeAreaInsets");
  v18 = v17;
  v20 = v19;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v90 = v22;
  v91 = v23;
  v87 = v25;
  v88 = v24;
  objc_msgSend(v21, "contentOffset");
  v85 = v27;
  v86 = v26;
  objc_msgSend(v21, "contentInset");
  v89 = v28;
  v29 = MEMORY[0x1E0DC49E8];
  dockView = self->_dockView;
  if (dockView)
  {
    v75 = v18;
    -[PKPaymentSetupDockView sizeThatFits:](dockView, "sizeThatFits:", v9, 1.79769313e308);
    v32 = v31;
    v97.size.height = v11;
    v34 = v33;
    v35 = v20 + v33;
    v77 = v7;
    v79 = v5;
    v97.origin.x = v5;
    v97.origin.y = v7;
    v97.size.width = v9;
    height = v97.size.height;
    -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", 0.0, CGRectGetMaxY(v97) - v35, v9, v35);
    -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
    v37 = v34;
    -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:", (v9 - v32) * 0.5, 0.0, v32, v34);
    -[PKPaymentSetupDockView layoutIfNeeded](self->_dockView, "layoutIfNeeded");
    objc_msgSend(v21, "bounds");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    objc_msgSend(v21, "contentSize");
    v47 = fmin(v45, v46 - v41);
    -[_PKVisibilityBackdropView bounds](self->_blurringView, "bounds");
    objc_msgSend(v21, "convertRect:fromView:", self->_blurringView);
    v49 = v48;
    v98.origin.x = v39;
    v98.origin.y = v41;
    v98.size.width = v43;
    v98.size.height = v47;
    v50 = fmin(fmax(CGRectGetMaxY(v98) - v49, 0.0), 30.0) / 30.0;
    if (self->_backdropWeight != v50)
    {
      self->_backdropWeight = v50;
      -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
    }
    v51 = v37;
    v7 = v77;
    v5 = v79;
    v11 = height;
    v18 = v75;
  }
  else
  {
    v51 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  }
  if (self->_headerMode)
  {
    -[PKCollapsibleHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v52 = 0.0;
    v53 = 0.0;
  }
  else
  {
    v76 = v11;
    v54 = v18 + self->_headerHeight;
    v99.origin.x = v5;
    v99.origin.y = v91;
    v99.size.width = v9;
    v99.size.height = v54;
    MaxY = CGRectGetMaxY(v99);
    -[PKCollapsibleHeaderView setFrame:](self->_headerView, "setFrame:", v5, v91, v9, v54);
    headerView = self->_headerView;
    v100.origin.x = v84;
    v100.origin.y = v83;
    v100.size.width = v82;
    v100.size.height = v81;
    MinX = CGRectGetMinX(v100);
    v101.origin.x = v5;
    v101.origin.y = v7;
    v101.size.width = v9;
    v101.size.height = v76;
    v93 = MinX - CGRectGetMinX(v101);
    v102.origin.x = v5;
    v102.origin.y = v7;
    v102.size.width = v9;
    v102.size.height = v76;
    MaxX = CGRectGetMaxX(v102);
    v103.origin.x = v84;
    v103.origin.y = v83;
    v103.size.width = v82;
    v103.size.height = v81;
    v57 = MaxX - CGRectGetMaxX(v103);
    v53 = 0.0;
    -[PKCollapsibleHeaderView setReadableContentInsets:](headerView, "setReadableContentInsets:", 0.0, v93, 0.0, v57);
    v58 = self->_headerView;
    v52 = 0.0;
    if (v58)
    {
      -[PKCollapsibleHeaderView heightBoundsForWidth:](v58, "heightBoundsForWidth:", v9);
      v52 = v94;
      v53 = v95;
    }
    v91 = MaxY;
  }
  v59 = *(double *)(v29 + 8);
  v60 = *(double *)(v29 + 24);
  if (self->_isShowingKeyboard
    && +[PKPaymentSetupOptionsViewController _respondToKeyboardPresentationEvents](PKPaymentSetupOptionsViewController, "_respondToKeyboardPresentationEvents"))
  {
    if (self->_shouldCollapseHeaderOnKeyboardShow)
      v53 = v52;
    -[PKPaymentSetupOptionsViewController view](self, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "convertRect:fromView:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
    v63 = v62;
    v65 = v64;
    v80 = v51;
    v67 = v66;
    v69 = v68;

    objc_msgSend(v21, "frame");
    v70 = CGRectGetMaxY(v104);
    v105.origin.x = v63;
    v105.origin.y = v65;
    v105.size.width = v67;
    v105.size.height = v69;
    v51 = fmax(v80, v70 - CGRectGetMinY(v105) + 10.0);
  }
  -[PKPaymentSetupOptionsViewController footerViewContentHeight](self, "footerViewContentHeight");
  v72 = v51 + v71;
  objc_msgSend(v21, "setContentInset:", v53, v59, v51 + v71, v60);
  v73 = v89 - v53;
  if (v89 - v53 != 0.0)
    objc_msgSend(v21, "setContentOffset:", v86, v85 + v73);
  objc_msgSend(v21, "adjustedContentInset", v73);
  -[PKPaymentSetupNoResultsView setFrame:](self->_noResultsView, "setFrame:", v90, v91, v88, v87 - v74 - v72);

}

- (void)setHeaderMode:(unint64_t)a3
{
  if (self->_headerMode != a3)
  {
    self->_headerMode = a3;
    -[PKPaymentSetupOptionsViewController _updateNavigationItem](self, "_updateNavigationItem");
  }
}

- (double)footerViewContentHeight
{
  return 0.0;
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
    -[PKPaymentSetupOptionsViewController view](self, "view");
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
    -[PKPaymentSetupOptionsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setShowSearchBar:(BOOL)a3
{
  if (((!self->_showSearchBar ^ a3) & 1) == 0)
  {
    self->_showSearchBar = a3;
    -[PKCollapsibleHeaderView setShowSearchBar:](self->_headerView, "setShowSearchBar:");
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

    -[PKPaymentSetupOptionsViewController view](self, "view");
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

- (void)setShowNoResultsView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;

  if (((!self->_showNoResultsView ^ a3) & 1) == 0)
  {
    v4 = a4;
    v5 = a3;
    self->_showNoResultsView = a3;
    -[UIView pkui_setAlpha:animated:](self->_noResultsView, "pkui_setAlpha:animated:", a4, (double)a3);
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pkui_setAlpha:animated:", v4, (double)!v5);

  }
}

- (void)setNoResultsIcon:(id)a3
{
  id v4;

  -[PKPaymentSetupNoResultsView setIcon:](self->_noResultsView, "setIcon:", a3);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setNoResultsTitle:(id)a3
{
  id v4;

  -[PKPaymentSetupNoResultsView setTitle:](self->_noResultsView, "setTitle:", a3);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setNoResultsSubtitle:(id)a3
{
  id v4;

  -[PKPaymentSetupNoResultsView setSubtitle:](self->_noResultsView, "setSubtitle:", a3);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setNoResultsActionButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v6;

  -[PKPaymentSetupNoResultsView setActionButtonTitle:addTarget:action:](self->_noResultsView, "setActionButtonTitle:addTarget:action:", a3, a4, a5);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)setSearchBarDefaultText:(id)a3
{
  -[PKCollapsibleHeaderView setSearchBarDefaultText:](self->_headerView, "setSearchBarDefaultText:", a3);
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
  void *v14;

  dockView = self->_dockView;
  if (!dockView)
  {
    -[PKPaymentSetupOptionsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
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

    -[PKPaymentSetupOptionsViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_blurringView);
    objc_msgSend(v14, "setNeedsLayout");

    dockView = self->_dockView;
  }
  return dockView;
}

- (void)removeSetupDockView
{
  _PKVisibilityBackdropView *blurringView;
  PKPaymentSetupDockView *dockView;
  id v5;

  -[PKPaymentSetupDockView removeFromSuperview](self->_dockView, "removeFromSuperview");
  -[_PKVisibilityBackdropView removeFromSuperview](self->_blurringView, "removeFromSuperview");
  blurringView = self->_blurringView;
  self->_blurringView = 0;

  dockView = self->_dockView;
  self->_dockView = 0;

  -[PKPaymentSetupOptionsViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)setShowHeaderSpinner:(BOOL)a3
{
  if (((!self->_showHeaderSpinner ^ a3) & 1) == 0)
  {
    self->_showHeaderSpinner = a3;
    -[PKCollapsibleHeaderView setShowSpinner:](self->_headerView, "setShowSpinner:");
  }
}

- (void)setShowNavigationBarSpinner:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *hiddenRightBarButtonItem;
  _BOOL8 wasBackHidden;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *activityIndicatorView;
  UIBarButtonItem *v16;
  UIBarButtonItem *spinningNavBarItem;
  id v18;

  if (self->_showNavigationBarSpinner != a3)
  {
    self->_showNavigationBarSpinner = a3;
    v4 = !a3;
    -[PKPaymentSetupOptionsViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKPaymentSetupOptionsViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v8;

    objc_msgSend(v18, "setUserInteractionEnabled:", v4);
    -[PKPaymentSetupDockView setButtonsEnabled:](self->_dockView, "setButtonsEnabled:", v4);
    -[PKPaymentSetupOptionsViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_showNavigationBarSpinner)
    {
      self->_wasBackHidden = objc_msgSend(v9, "hidesBackButton");
      objc_msgSend(v10, "rightBarButtonItem");
      v11 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v11;

      if (!self->_spinningNavBarItem)
      {
        v14 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        v16 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicatorView);
        spinningNavBarItem = self->_spinningNavBarItem;
        self->_spinningNavBarItem = v16;

      }
      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      objc_msgSend(v10, "setRightBarButtonItem:", self->_spinningNavBarItem);
      wasBackHidden = 1;
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
      objc_msgSend(v10, "setRightBarButtonItem:", self->_hiddenRightBarButtonItem);
      wasBackHidden = self->_wasBackHidden;
    }
    objc_msgSend(v10, "setHidesBackButton:", wasBackHidden);
    -[PKPaymentSetupOptionsViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v4);
    objc_msgSend(v18, "setNeedsLayout");

  }
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
  -[PKPaymentSetupOptionsViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKPaymentSetupOptionsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)setPrivacyLink:(id)a3
{
  OBPrivacyLinkController **p_privacyLink;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_privacyLink = &self->_privacyLink;
  v6 = PKEqualObjects();
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (*p_privacyLink)
    {
      -[OBPrivacyLinkController willMoveToParentViewController:](*p_privacyLink, "willMoveToParentViewController:", 0);
      -[OBPrivacyLinkController view](*p_privacyLink, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[OBPrivacyLinkController removeFromParentViewController](*p_privacyLink, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_privacyLink, a3);
    if (*p_privacyLink)
      -[PKPaymentSetupOptionsViewController addChildViewController:](self, "addChildViewController:");
    -[PKPaymentSetupOptionsViewController _addDockViewToCollectionViewIfNeeded](self, "_addDockViewToCollectionViewIfNeeded");
    -[OBPrivacyLinkController didMoveToParentViewController:](*p_privacyLink, "didMoveToParentViewController:", self);
    v7 = v9;
  }

}

- (void)setSections:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  PKPaymentSetupPrivacyLinkSectionController *privacyLinkSectionController;
  void *v7;
  objc_super v8;
  objc_super v9;

  v4 = a4;
  privacyLinkSectionController = self->_privacyLinkSectionController;
  if (privacyLinkSectionController)
  {
    objc_msgSend(a3, "arrayByAddingObject:", privacyLinkSectionController);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentSetupOptionsViewController;
    -[PKDynamicCollectionViewController setSections:animated:](&v9, sel_setSections_animated_, v7, v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentSetupOptionsViewController;
    -[PKDynamicCollectionViewController setSections:animated:](&v8, sel_setSections_animated_, a3, a4);
  }
}

- (void)setIsShowingKeyboard:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_isShowingKeyboard != a3)
  {
    self->_isShowingKeyboard = a3;
    if (+[PKPaymentSetupOptionsViewController _respondToKeyboardPresentationEvents](PKPaymentSetupOptionsViewController, "_respondToKeyboardPresentationEvents"))
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __60__PKPaymentSetupOptionsViewController_setIsShowingKeyboard___block_invoke;
      v4[3] = &unk_1E3E612E8;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.25);
    }
  }
}

void __60__PKPaymentSetupOptionsViewController_setIsShowingKeyboard___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

+ (BOOL)_respondToKeyboardPresentationEvents
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  PKCollapsibleHeaderView *headerView;
  double v13;
  double v14;
  double v15;
  double headerHeight;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  int v23;
  void *v24;
  int v25;
  NSString *titleText;
  objc_super v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  double v31;

  if (self->_headerMode)
  {
    -[PKPaymentSetupOptionsViewController navigationItem](self, "navigationItem", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 1.0);

  }
  else
  {
    objc_msgSend(a3, "contentOffset");
    v7 = v6;
    -[PKPaymentSetupOptionsViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9;

    v11 = v7 + v10;
    v31 = 0.0;
    v29 = 0u;
    v30 = 0u;
    headerView = self->_headerView;
    -[PKCollapsibleHeaderView bounds](headerView, "bounds");
    if (headerView)
    {
      -[PKCollapsibleHeaderView heightBoundsForWidth:](headerView, "heightBoundsForWidth:", v13);
      v14 = *(double *)&v29;
      v15 = v31;
    }
    else
    {
      v31 = 0.0;
      v15 = 0.0;
      v14 = 0.0;
      v29 = 0u;
      v30 = 0u;
    }
    headerHeight = self->_headerHeight;
    if (v14 == 0.0)
      v14 = -v10;
    v17 = fmin(v15, fmax(-v11, v14));
    if (v17 != headerHeight)
    {
      self->_headerHeight = v17;
      v18 = v15 - v17;
      v19 = headerHeight == 0.0 ? 0.0 : v18;
      v20 = fmin(fmax((v19 - *((double *)&v29 + 1)) / 20.0, 0.0), 1.0);
      -[PKPaymentSetupOptionsViewController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_setManualScrollEdgeAppearanceProgress:", v20);

      v22 = *(double *)&v30;
      v23 = *(double *)&v30 <= v19;
      v28.receiver = self;
      v28.super_class = (Class)PKPaymentSetupOptionsViewController;
      -[PKPaymentSetupOptionsViewController title](&v28, sel_title);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 != 0;

      if (v23 != v25)
      {
        if (v22 > v19)
          titleText = 0;
        else
          titleText = self->_titleText;
        v27.receiver = self;
        v27.super_class = (Class)PKPaymentSetupOptionsViewController;
        -[PKPaymentSetupOptionsViewController setTitle:](&v27, sel_setTitle_, titleText);
      }
    }
  }
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)searchTextDidChangeTo:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v5 = -v4;
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  objc_msgSend(v8, "setContentOffset:animated:", 1, 0.0, v5 - v7);

}

- (void)searchBarTextDidBeginEditing
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  -[PKPaymentSetupOptionsViewController setIsShowingKeyboard:](self, "setIsShowingKeyboard:", 1);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInset");
  v4 = -v3;
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  objc_msgSend(v7, "setContentOffset:animated:", 1, 0.0, v4 - v6);

}

- (void)searchBarTextDidEndEditing
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  -[PKPaymentSetupOptionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUserInteractionEnabled");

  if (v4)
  {
    -[PKPaymentSetupOptionsViewController setIsShowingKeyboard:](self, "setIsShowingKeyboard:", 0);
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInset");
    v6 = -v5;
    -[PKPaymentSetupOptionsViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaInsets");
    objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, v6 - v8);

  }
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

- (void)_keyboardSizeDidChange:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  self->_keyboardFrame.origin.x = v5;
  self->_keyboardFrame.origin.y = v6;
  self->_keyboardFrame.size.width = v7;
  self->_keyboardFrame.size.height = v8;
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

}

- (void)_addDockViewToCollectionViewIfNeeded
{
  OBPrivacyLinkController *privacyLink;
  OBPrivacyLinkController *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKPaymentSetupPrivacyLinkSectionController *privacyLinkSectionController;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentSetupPrivacyLinkSectionController *v17;
  PKPaymentSetupPrivacyLinkSectionController *v18;
  OBPrivacyLinkController *v19;
  OBPrivacyLinkController *v20;
  void *v21;
  objc_super v22;

  privacyLink = self->_privacyLink;
  if (privacyLink)
  {
    v4 = privacyLink;
  }
  else
  {
    -[PKPaymentSetupDockView privacyLink](self->_dockView, "privacyLink");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      return;
    v4 = (OBPrivacyLinkController *)v5;
  }
  -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", v4);
  -[PKPaymentSetupOptionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v8, 1.79769313e308);
  privacyLinkSectionController = self->_privacyLinkSectionController;
  if (v12 <= v10 * 0.5)
  {
    self->_privacyLinkSectionController = 0;

    if (privacyLinkSectionController)
    {
      -[PKDynamicCollectionViewController sections](self, "sections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pk_objectsPassingTest:", &__block_literal_global_32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v16, 1);
    }
  }
  else
  {
    if (privacyLinkSectionController)
    {
      -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", 0);
      -[PKPaymentSetupPrivacyLinkSectionController setPrivacyLink:](self->_privacyLinkSectionController, "setPrivacyLink:", v4);
      -[PKPaymentSetupListSectionController identifiers](self->_privacyLinkSectionController, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDynamicCollectionViewController reloadDataForSectionIdentifier:animated:](self, "reloadDataForSectionIdentifier:animated:", v14, 1);
    }
    else
    {
      v17 = objc_alloc_init(PKPaymentSetupPrivacyLinkSectionController);
      v18 = self->_privacyLinkSectionController;
      self->_privacyLinkSectionController = v17;

      -[PKPaymentSetupDockView setPrivacyLink:](self->_dockView, "setPrivacyLink:", 0);
      -[PKPaymentSetupPrivacyLinkSectionController setPrivacyLink:](self->_privacyLinkSectionController, "setPrivacyLink:", v4);
      -[PKDynamicCollectionViewController sections](self, "sections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObject:", self->_privacyLinkSectionController);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22.receiver = self;
      v22.super_class = (Class)PKPaymentSetupOptionsViewController;
      -[PKDynamicCollectionViewController setSections:animated:](&v22, sel_setSections_animated_, v14, 1);
    }

  }
  v19 = self->_privacyLink;
  self->_privacyLink = v4;
  v20 = v4;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", v21);

}

BOOL __75__PKPaymentSetupOptionsViewController__addDockViewToCollectionViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_updateNavigationItem
{
  void *v3;
  void *v4;
  unint64_t headerMode;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[PKPaymentSetupOptionsViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaymentSetupOptionsViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      headerMode = self->_headerMode;
      v10 = v4;
      objc_msgSend(v4, "navigationBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (headerMode == 2)
      {
        v8 = 1;
        if ((objc_msgSend(v6, "prefersLargeTitles") & 1) == 0)
          objc_msgSend(v7, "setPrefersLargeTitles:", 1);
      }
      else
      {
        v8 = 2;
      }
      -[PKPaymentSetupOptionsViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "largeTitleDisplayMode") != v8)
        objc_msgSend(v9, "setLargeTitleDisplayMode:", v8);

      v4 = v10;
    }

  }
}

- (unint64_t)headerMode
{
  return self->_headerMode;
}

- (PKCollapsibleHeaderView)headerView
{
  return self->_headerView;
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

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (int64_t)paymentSetupMode
{
  return self->_paymentSetupMode;
}

- (void)setPaymentSetupMode:(int64_t)a3
{
  self->_paymentSetupMode = a3;
}

- (BOOL)isShowingKeyboard
{
  return self->_isShowingKeyboard;
}

- (BOOL)shouldCollapseHeaderOnKeyboardShow
{
  return self->_shouldCollapseHeaderOnKeyboardShow;
}

- (void)setShouldCollapseHeaderOnKeyboardShow:(BOOL)a3
{
  self->_shouldCollapseHeaderOnKeyboardShow = a3;
}

- (BOOL)showSearchBar
{
  return self->_showSearchBar;
}

- (BOOL)showHeaderSpinner
{
  return self->_showHeaderSpinner;
}

- (BOOL)showNavigationBarSpinner
{
  return self->_showNavigationBarSpinner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_privacyLinkSectionController, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningNavBarItem, 0);
  objc_storeStrong((id *)&self->_noResultsView, 0);
}

@end
