@implementation SKUIGiftTermsAndConditionsSection

- (id)headerViewForTableView:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIGiftTermsAndConditionsSection headerViewForTableView:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  -[SKUIGiftTermsAndConditionsSection _headerView](self, "_headerView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_termsAction:(id)a3
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

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftTermsAndConditionsSection _termsAction:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "termsAndConditionsURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v11);

}

- (id)_headerView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIView *headerView;
  UIView *v12;
  UIView *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  SKUILinkButton *v18;
  uint64_t v19;
  SKUILinkButton *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftTermsAndConditionsSection _headerView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  headerView = self->_headerView;
  if (!headerView)
  {
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v13 = self->_headerView;
    self->_headerView = v12;

    -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, 60.0, 45.0);
    -[UIView bounds](self->_headerView, "bounds");
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

    v18 = [SKUILinkButton alloc];
    if (v17)
      v19 = 5;
    else
      v19 = 1;
    v20 = -[SKUILinkButton initWithArrowStyle:](v18, "initWithArrowStyle:", v19);
    -[SKUILinkButton addTarget:action:forControlEvents:](v20, "addTarget:action:forControlEvents:", self, sel__termsAction_, 64);
    -[SKUILinkButton setAutoresizingMask:](v20, "setAutoresizingMask:", 5);
    -[SKUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clientContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (SKUIUserInterfaceIdiom(v22) == 1)
    {
      if (v22)
      {
        v23 = CFSTR("GIFTING_TERMS_LINK_IPAD");
LABEL_14:
        objc_msgSend(v22, "localizedStringForKey:inTable:", v23, CFSTR("Gifting"));
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v26 = (void *)v24;
        -[SKUILinkButton setTitle:forState:](v20, "setTitle:forState:", v24, 0);
        -[SKUILinkButton titleLabel](v20, "titleLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFont:", v28);

        objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUILinkButton setTitleColor:forState:](v20, "setTitleColor:forState:", v29, 0);

        objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUILinkButton setTitleColor:forState:](v20, "setTitleColor:forState:", v30, 1);

        -[SKUILinkButton sizeToFit](v20, "sizeToFit");
        -[SKUILinkButton frame](v20, "frame");
        -[SKUILinkButton setFrame:](v20, "setFrame:", floor((v15 - v31) * 0.5), 25.0);
        -[UIView addSubview:](self->_headerView, "addSubview:", v20);

        headerView = self->_headerView;
        return headerView;
      }
      v25 = CFSTR("GIFTING_TERMS_LINK_IPAD");
    }
    else
    {
      if (v22)
      {
        v23 = CFSTR("GIFTING_TERMS_LINK_IPHONE");
        goto LABEL_14;
      }
      v25 = CFSTR("GIFTING_TERMS_LINK_IPHONE");
    }
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v25, 0, CFSTR("Gifting"));
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  return headerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)headerViewForTableView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)_termsAction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)_headerView
{
  OUTLINED_FUNCTION_1();
}

@end
