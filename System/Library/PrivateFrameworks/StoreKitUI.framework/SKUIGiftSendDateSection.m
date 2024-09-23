@implementation SKUIGiftSendDateSection

- (UIEdgeInsets)headerInsets
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftSendDateSection headerInsets].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIGiftSendDateSection _headerView](self, "_headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (void)setHeaderInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIGiftSendDateSection setHeaderInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIGiftSendDateSection _headerView](self, "_headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentInsets:", top, left, bottom, right);
  objc_msgSend(v16, "sizeToFit");

}

- (void)setSendDate:(id)a3
{
  NSDate *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSDate *v13;
  NSDate *sendDate;

  v4 = (NSDate *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGiftSendDateSection setSendDate:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_sendDate != v4)
  {
    if (v4)
    {
      v13 = (NSDate *)-[NSDate copy](v4, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    sendDate = self->_sendDate;
    self->_sendDate = v13;

  }
}

- (void)updateCell:(id)a3 forTransitionToSize:(CGSize)a4
{
  objc_msgSend(a3, "setDate:", self->_sendDate, a4.width, a4.height);
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 45.0;
}

- (int64_t)numberOfRowsInSection
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIGiftSendDateSection numberOfRowsInSection].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  SKUIGiftDateTableViewCell *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("GDT"), a4);
  v5 = (SKUIGiftDateTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SKUIGiftDateTableViewCell initWithStyle:reuseIdentifier:]([SKUIGiftDateTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("GDT"));
    -[SKUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftDateTableViewCell setGiftConfiguration:](v5, "setGiftConfiguration:", v6);

  }
  -[SKUIGiftDateTableViewCell setChecked:](v5, "setChecked:", 1);
  -[SKUIGiftDateTableViewCell setDate:](v5, "setDate:", self->_sendDate);
  -[SKUIGiftDateTableViewCell setDelegate:](v5, "setDelegate:", self);
  -[SKUIGiftDateTableViewCell setPlaceholder:](v5, "setPlaceholder:", 0);
  -[SKUIGiftDateTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  return v5;
}

- (id)_headerView
{
  SKUIGiftTableSectionHeaderView *headerView;
  void *v4;
  void *v5;
  SKUIGiftTableSectionHeaderView *v6;
  SKUIGiftTableSectionHeaderView *v7;
  SKUIGiftTableSectionHeaderView *v8;
  void *v9;

  headerView = self->_headerView;
  if (!headerView)
  {
    -[SKUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(SKUIGiftTableSectionHeaderView);
    v7 = self->_headerView;
    self->_headerView = v6;

    v8 = self->_headerView;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("GIFTING_DATE_SECTION_HEADER"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_DATE_SECTION_HEADER"), 0, CFSTR("Gifting"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftTableSectionHeaderView setLabel:](v8, "setLabel:", v9);

    -[SKUIGiftTableSectionHeaderView sizeToFit](self->_headerView, "sizeToFit");
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)giftDateTableViewCell:(id)a3 didChangeDate:(id)a4
{
  id v6;
  id WeakRetained;

  objc_storeStrong((id *)&self->_sendDate, a4);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "giftSendDateSection:didChangeDate:", self, v6);

}

- (SKUIGiftSendDateSectionDelegate)delegate
{
  return (SKUIGiftSendDateSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIItem)giftItem
{
  return self->_giftItem;
}

- (void)setGiftItem:(id)a3
{
  objc_storeStrong((id *)&self->_giftItem, a3);
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (int64_t)sendDateStyle
{
  return self->_sendDateStyle;
}

- (void)setSendDateStyle:(int64_t)a3
{
  self->_sendDateStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_giftItem, 0);
}

- (void)headerInsets
{
  OUTLINED_FUNCTION_1();
}

- (void)setHeaderInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSendDate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfRowsInSection
{
  OUTLINED_FUNCTION_1();
}

@end
