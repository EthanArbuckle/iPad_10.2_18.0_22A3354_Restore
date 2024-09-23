@implementation SKUIProductPageTableInAppPurchasesSection

- (SKUIProductPageTableInAppPurchasesSection)initWithInAppPurchases:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SKUIProductPageTableInAppPurchasesSection *v8;
  SKUIProductPageTableInAppPurchasesSection *v9;
  uint64_t v10;
  NSArray *inAppPurchases;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageTableInAppPurchasesSection;
  v8 = -[SKUIProductPageTableInAppPurchasesSection init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v10 = objc_msgSend(v6, "copy");
    inAppPurchases = v9->_inAppPurchases;
    v9->_inAppPurchases = (NSArray *)v10;

  }
  return v9;
}

- (id)headerViewForTableView:(id)a3
{
  SKUIProductPageTableExpandableHeaderView *v4;
  SKUIProductPageTableExpandableHeaderView *headerView;
  SKUIProductPageTableExpandableHeaderView *v6;
  SKUIClientContext *clientContext;
  void *v8;

  if (!self->_headerView && !-[SKUITableViewSection hidesHeaderView](self, "hidesHeaderView", a3))
  {
    v4 = objc_alloc_init(SKUIProductPageTableExpandableHeaderView);
    headerView = self->_headerView;
    self->_headerView = v4;

    -[SKUIProductPageTableExpandableHeaderView setColorScheme:](self->_headerView, "setColorScheme:", self->_colorScheme);
    v6 = self->_headerView;
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), 0, CFSTR("ProductPage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableExpandableHeaderView setTitle:](v6, "setTitle:", v8);

    -[SKUIProductPageTableExpandableHeaderView sizeToFit](self->_headerView, "sizeToFit");
    -[SKUIProductPageTableInAppPurchasesSection _reloadHeaderView](self, "_reloadHeaderView");
  }
  return self->_headerView;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)numberOfRowsInSection
{
  if (-[SKUIProductPageTableSection isExpanded](self, "isExpanded"))
    return -[NSArray count](self->_inAppPurchases, "count");
  else
    return 0;
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;

  v5 = (SKUIColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SKUIProductPageTableExpandableHeaderView setColorScheme:](self->_headerView, "setColorScheme:", v5);
  }

}

- (void)setExpanded:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPageTableInAppPurchasesSection;
  -[SKUIProductPageTableSection setExpanded:](&v4, sel_setExpanded_, a3);
  -[SKUIProductPageTableInAppPurchasesSection _reloadHeaderView](self, "_reloadHeaderView");
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SKUIProductPageInAppPurchaseTableCell *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v15;
  NSNumberFormatter *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("IA"));
  v7 = (SKUIProductPageInAppPurchaseTableCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:]([SKUIProductPageInAppPurchaseTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("IA"));
    -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SKUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", v9);

    }
  }
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    -[SKUITableViewCell setBorderPaddingLeft:](v7, "setBorderPaddingLeft:", 30.0);
    -[SKUIProductPageInAppPurchaseTableCell setContentInsets:](v7, "setContentInsets:", 0.0, 15.0, 0.0, 0.0);
  }
  v10 = objc_msgSend(v6, "row");
  -[NSArray objectAtIndex:](self->_inAppPurchases, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageInAppPurchaseTableCell setColorScheme:](v7, "setColorScheme:", self->_colorScheme);
  objc_msgSend(v11, "formattedPrice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageInAppPurchaseTableCell setPriceString:](v7, "setPriceString:", v12);

  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageInAppPurchaseTableCell setProductName:](v7, "setProductName:", v13);

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v16 = self->_numberFormatter;
    self->_numberFormatter = v15;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setUsesGroupingSeparator:](self->_numberFormatter, "setUsesGroupingSeparator:", 0);
    numberFormatter = self->_numberFormatter;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageInAppPurchaseTableCell setIndexString:](v7, "setIndexString:", v18);

  return v7;
}

- (void)_reloadHeaderView
{
  _BOOL4 v3;
  SKUIProductPageTableExpandableHeaderView *headerView;
  SKUIClientContext *clientContext;
  void *v6;
  SKUIProductPageTableExpandableHeaderView *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = -[SKUIProductPageTableSection isExpanded](self, "isExpanded");
  headerView = self->_headerView;
  if (v3)
  {
    -[SKUIProductPageTableExpandableHeaderView setActionString:](self->_headerView, "setActionString:", 0);
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_SHOW_IN_APPS_BUTTON"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_SHOW_IN_APPS_BUTTON"), 0, CFSTR("ProductPage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableExpandableHeaderView setActionString:](headerView, "setActionString:", v6);

  }
  v7 = self->_headerView;
  -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v8;
  if (v8)
  {
    -[SKUIProductPageTableExpandableHeaderView setBottomBorderColor:](v7, "setBottomBorderColor:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableExpandableHeaderView setBottomBorderColor:](v7, "setBottomBorderColor:", v9);

  }
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_inAppPurchases, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithInAppPurchases:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:]";
}

@end
