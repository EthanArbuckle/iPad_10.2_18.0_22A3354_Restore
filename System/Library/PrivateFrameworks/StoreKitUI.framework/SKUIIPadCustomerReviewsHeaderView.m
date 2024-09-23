@implementation SKUIIPadCustomerReviewsHeaderView

- (SKUIIPadCustomerReviewsHeaderView)initWithClientContext:(id)a3
{
  id v5;
  SKUIIPadCustomerReviewsHeaderView *v6;
  SKUIIPadCustomerReviewsHeaderView *v7;
  uint64_t v8;
  UIButton *appSupportButton;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  UIButton *v14;
  void *v15;
  uint64_t v16;
  UIButton *writeAReviewButton;
  void *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  UILabel *v24;
  UILabel *titleLabel;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  UIView *v33;
  UIView *separatorView;
  UIView *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPadCustomerReviewsHeaderView initWithClientContext:].cold.1();
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIIPadCustomerReviewsHeaderView;
  v6 = -[SKUIIPadCustomerReviewsHeaderView init](&v39, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    appSupportButton = v7->_appSupportButton;
    v7->_appSupportButton = (UIButton *)v8;

    -[UIButton titleLabel](v7->_appSupportButton, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    v12 = v7->_appSupportButton;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_APP_SUPPORT"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_APP_SUPPORT"), 0, CFSTR("ProductPage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

    -[UIButton sizeToFit](v7->_appSupportButton, "sizeToFit");
    v14 = v7->_appSupportButton;
    -[SKUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v14, "setTintColor:", v15);

    -[SKUIIPadCustomerReviewsHeaderView addSubview:](v7, "addSubview:", v7->_appSupportButton);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    writeAReviewButton = v7->_writeAReviewButton;
    v7->_writeAReviewButton = (UIButton *)v16;

    -[UIButton titleLabel](v7->_writeAReviewButton, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v19);

    v20 = v7->_writeAReviewButton;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPAD"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_HEADER_BUTTON_WRITE_A_REVIEW_IPAD"), 0, CFSTR("ProductPage"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v20, "setTitle:forState:", v21, 0);

    -[UIButton sizeToFit](v7->_writeAReviewButton, "sizeToFit");
    v22 = v7->_writeAReviewButton;
    -[SKUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v22, "setTintColor:", v23);

    -[SKUIIPadCustomerReviewsHeaderView addSubview:](v7, "addSubview:", v7->_writeAReviewButton);
    v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v24;

    v26 = v7->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v26, "setFont:", v27);

    v28 = v7->_titleLabel;
    -[SKUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      -[UILabel setTextColor:](v28, "setTextColor:", v29);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v28, "setTextColor:", v30);

    }
    v31 = v7->_titleLabel;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("REVIEWS_HEADER_TITLE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_HEADER_TITLE"), 0, CFSTR("ProductPage"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v31, "setText:", v32);

    -[UILabel sizeToFit](v7->_titleLabel, "sizeToFit");
    -[SKUIIPadCustomerReviewsHeaderView addSubview:](v7, "addSubview:", v7->_titleLabel);
    v33 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v33;

    v35 = v7->_separatorView;
    -[SKUIColorScheme primaryTextColor](v7->_colorScheme, "primaryTextColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v36);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v37);

    }
    -[SKUIIPadCustomerReviewsHeaderView addSubview:](v7, "addSubview:", v7->_separatorView);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIButton removeTarget:action:forControlEvents:](self->_sortButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[UIPopoverController contentViewController](self->_sortPopoverController, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_sortPopoverController, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIIPadCustomerReviewsHeaderView;
  -[SKUIIPadCustomerReviewsHeaderView dealloc](&v4, sel_dealloc);
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  SKUIColorScheme **p_colorScheme;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  UILabel *sortLabel;
  void *v11;
  void *v12;
  void *v13;
  UIView *separatorView;
  void *v15;
  void *v16;
  UIButton *appSupportButton;
  void *v18;
  UIButton *writeAReviewButton;
  void *v20;
  UIButton *sortButton;
  void *v22;
  SKUIColorScheme *v23;

  v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v23 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v9);

    }
    sortLabel = self->_sortLabel;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIColorWithAlpha(v11, 0.6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[UILabel setTextColor:](sortLabel, "setTextColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](sortLabel, "setTextColor:", v13);

    }
    separatorView = self->_separatorView;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v16);

    }
    appSupportButton = self->_appSupportButton;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](appSupportButton, "setTintColor:", v18);

    writeAReviewButton = self->_writeAReviewButton;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](writeAReviewButton, "setTintColor:", v20);

    sortButton = self->_sortButton;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](sortButton, "setTintColor:", v22);

    v5 = v23;
  }

}

- (void)setSelectedSortIndex:(int64_t)a3
{
  if (self->_selectedSortIndex != a3)
  {
    self->_selectedSortIndex = a3;
    -[SKUIIPadCustomerReviewsHeaderView _reloadSortButton](self, "_reloadSortButton");
  }
}

- (void)setSortTitles:(id)a3
{
  NSArray *v4;
  NSArray *sortTitles;

  if (self->_sortTitles != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    sortTitles = self->_sortTitles;
    self->_sortTitles = v4;

    -[SKUIIPadCustomerReviewsHeaderView _reloadSortButton](self, "_reloadSortButton");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  UIButton *v7;
  UIButton *sortButton;
  objc_super v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SKUIIPadCustomerReviewsHeaderView;
  -[SKUIIPadCustomerReviewsHeaderView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  if (v7 == (UIButton *)self)
  {
    sortButton = self->_sortButton;
    if (sortButton
      && (-[UIButton frame](sortButton, "frame"),
          v13 = CGRectInset(v12, -20.0, -20.0),
          v11.x = x,
          v11.y = y,
          CGRectContainsPoint(v13, v11)))
    {
      v7 = self->_sortButton;

    }
    else
    {
      v7 = (UIButton *)self;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UILabel *titleLabel;
  double v8;
  CGFloat v9;
  double v10;
  UIButton *writeAReviewButton;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  UIButton *appSupportButton;
  UIButton *sortButton;
  double v19;
  double v20;
  double v21;
  UIView *separatorView;
  double v23;
  double v24;
  void *v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;

  -[SKUIIPadCustomerReviewsHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v9 = v8;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 10.0, v4 + -15.0 + -15.0);
    v28.origin.x = 15.0;
    v28.origin.y = 10.0;
    v28.size.width = v4 + -15.0 + -15.0;
    v28.size.height = v9;
    v10 = CGRectGetMaxY(v28) + -5.0 + 19.0 + -11.0;
  }
  else
  {
    v10 = 4.0;
  }
  writeAReviewButton = self->_writeAReviewButton;
  if (writeAReviewButton)
  {
    -[UIButton frame](writeAReviewButton, "frame");
    v13 = v12;
    v15 = v14;
    -[UIButton setFrame:](self->_writeAReviewButton, "setFrame:", 15.0, v10);
    v29.origin.x = 15.0;
    v29.origin.y = v10;
    v29.size.width = v13;
    v29.size.height = v15;
    v16 = CGRectGetMaxX(v29) + 20.0;
  }
  else
  {
    v16 = 15.0;
  }
  appSupportButton = self->_appSupportButton;
  if (appSupportButton)
  {
    -[UIButton frame](appSupportButton, "frame");
    -[UIButton setFrame:](self->_appSupportButton, "setFrame:", v16, v10);
  }
  sortButton = self->_sortButton;
  if (sortButton)
  {
    -[UIButton frame](sortButton, "frame");
    v20 = v4 + -15.0 - v19;
    -[UIButton setFrame:](self->_sortButton, "setFrame:", v20, v10);
    -[UILabel frame](self->_sortLabel, "frame");
    -[UILabel setFrame:](self->_sortLabel, "setFrame:", v20 + -5.0 - v21, v10 + 7.0);
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scale");
    v24 = v6 - 1.0 / v23;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v24, v4 + -15.0, 1.0 / v26);

  }
}

- (void)setBackgroundColor:(id)a3
{
  UIButton *appSupportButton;
  id v5;
  objc_super v6;

  appSupportButton = self->_appSupportButton;
  v5 = a3;
  -[UIButton setBackgroundColor:](appSupportButton, "setBackgroundColor:", v5);
  -[UIButton setBackgroundColor:](self->_sortButton, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_sortLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  -[UIButton setBackgroundColor:](self->_writeAReviewButton, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIIPadCustomerReviewsHeaderView;
  -[SKUIIPadCustomerReviewsHeaderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[UILabel frame](self->_titleLabel, "frame", a3.width, a3.height);
  v6 = v5 + 30.0 + -5.0 + -5.0 + 19.0;
  -[UIButton frame](self->_writeAReviewButton, "frame");
  v8 = v7 + v6 + -11.0 + -10.0;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if (self->_selectedSortIndex != a4)
  {
    self->_selectedSortIndex = a4;
    -[SKUIIPadCustomerReviewsHeaderView _reloadSortButton](self, "_reloadSortButton", a3);
    -[SKUIIPadCustomerReviewsHeaderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  -[UIPopoverController dismissPopoverAnimated:](self->_sortPopoverController, "dismissPopoverAnimated:", 1);
  -[SKUIIPadCustomerReviewsHeaderView _destroySortPopoverController](self, "_destroySortPopoverController");
}

- (void)_sortButtonAction:(id)a3
{
  id v4;
  UIPopoverController *v5;
  UIPopoverController *sortPopoverController;
  UIPopoverController *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  SKUIMenuViewController *v17;

  if (!self->_sortPopoverController)
  {
    v4 = a3;
    v17 = -[SKUIMenuViewController initWithMenuTitles:]([SKUIMenuViewController alloc], "initWithMenuTitles:", self->_sortTitles);
    -[SKUIMenuViewController setDelegate:](v17, "setDelegate:", self);
    -[SKUIMenuViewController setIndexOfCheckedTitle:](v17, "setIndexOfCheckedTitle:", self->_selectedSortIndex);
    v5 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", v17);
    sortPopoverController = self->_sortPopoverController;
    self->_sortPopoverController = v5;

    -[UIPopoverController setDelegate:](self->_sortPopoverController, "setDelegate:", self);
    -[UIPopoverController setPopoverContentSize:](self->_sortPopoverController, "setPopoverContentSize:", 320.0, (double)-[NSArray count](self->_sortTitles, "count") * 44.0);
    v7 = self->_sortPopoverController;
    objc_msgSend(v4, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v7, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v16, 15, 1, v9, v11, v13, v15);
  }
}

- (void)_destroySortPopoverController
{
  UIPopoverController *sortPopoverController;
  id v4;

  -[UIPopoverController contentViewController](self->_sortPopoverController, "contentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_sortPopoverController, "setDelegate:", 0);
  sortPopoverController = self->_sortPopoverController;
  self->_sortPopoverController = 0;

}

- (void)_reloadSortButton
{
  UIButton *v3;
  UIButton *sortButton;
  UIButton *v5;
  void *v6;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *sortLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UIButton *v21;
  void *v22;
  UILabel *v23;
  SKUIClientContext *clientContext;
  void *v25;
  unint64_t selectedSortIndex;
  UIButton *v27;
  void *v28;

  if (-[NSArray count](self->_sortTitles, "count"))
  {
    if (!self->_sortButton)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
      sortButton = self->_sortButton;
      self->_sortButton = v3;

      -[UIButton addTarget:action:forControlEvents:](self->_sortButton, "addTarget:action:forControlEvents:", self, sel__sortButtonAction_, 64);
      v5 = self->_sortButton;
      -[SKUIIPadCustomerReviewsHeaderView backgroundColor](self, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setBackgroundColor:](v5, "setBackgroundColor:", v6);

      v7 = self->_sortButton;
      -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v7, "setTintColor:", v8);

      -[UIButton titleLabel](self->_sortButton, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v10);

      -[SKUIIPadCustomerReviewsHeaderView addSubview:](self, "addSubview:", self->_sortButton);
    }
    if (!self->_sortLabel)
    {
      v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      sortLabel = self->_sortLabel;
      self->_sortLabel = v11;

      v13 = self->_sortLabel;
      -[SKUIIPadCustomerReviewsHeaderView backgroundColor](self, "backgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

      v15 = self->_sortLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v15, "setFont:", v16);

      v17 = self->_sortLabel;
      -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIColorWithAlpha(v18, 0.6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[UILabel setTextColor:](v17, "setTextColor:", v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v17, "setTextColor:", v22);

      }
      v23 = self->_sortLabel;
      clientContext = self->_clientContext;
      if (clientContext)
        -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_HEADER_SORT_BY"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_HEADER_SORT_BY"), 0, CFSTR("ProductPage"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v23, "setText:", v25);

      -[UILabel sizeToFit](self->_sortLabel, "sizeToFit");
      -[SKUIIPadCustomerReviewsHeaderView addSubview:](self, "addSubview:", self->_sortLabel);
    }
    selectedSortIndex = self->_selectedSortIndex;
    if (selectedSortIndex < -[NSArray count](self->_sortTitles, "count"))
    {
      v27 = self->_sortButton;
      -[NSArray objectAtIndex:](self->_sortTitles, "objectAtIndex:", self->_selectedSortIndex);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v27, "setTitle:forState:", v28, 0);

      -[UIButton sizeToFit](self->_sortButton, "sizeToFit");
    }
    -[SKUIIPadCustomerReviewsHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](self->_sortLabel, "removeFromSuperview");
    v20 = self->_sortLabel;
    self->_sortLabel = 0;

    -[UIButton removeTarget:action:forControlEvents:](self->_sortButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
    -[UIButton removeFromSuperview](self->_sortButton, "removeFromSuperview");
    v21 = self->_sortButton;
    self->_sortButton = 0;

  }
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)selectedSortIndex
{
  return self->_selectedSortIndex;
}

- (NSArray)sortTitles
{
  return self->_sortTitles;
}

- (UIControl)appSupportButton
{
  return &self->_appSupportButton->super;
}

- (UIControl)writeAReviewButton
{
  return &self->_writeAReviewButton->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAReviewButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sortTitles, 0);
  objc_storeStrong((id *)&self->_sortLabel, 0);
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_sortPopoverController, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_appSupportButton, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIPadCustomerReviewsHeaderView initWithClientContext:]";
}

@end
