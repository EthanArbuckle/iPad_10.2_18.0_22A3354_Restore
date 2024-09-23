@implementation SKUIDeveloperInfoView

- (SKUIDeveloperInfoView)initWithDeveloperInfo:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUIDeveloperInfoView *v9;
  SKUIDeveloperInfoView *v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SKUIProductInformationView *v29;
  SKUIProductInformationView *infoView;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  UIView *infoSeparatorView;
  UIView *v37;
  void *v38;
  NSMutableArray *v39;
  NSMutableArray *lineViews;
  void *v41;
  void *v42;
  SKUIDeveloperInfoLineItemView *v43;
  void *v44;
  void *v45;
  SKUIDeveloperInfoLineItemView *v46;
  objc_super v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDeveloperInfoView initWithDeveloperInfo:clientContext:].cold.1();
  }
  v48.receiver = self;
  v48.super_class = (Class)SKUIDeveloperInfoView;
  v9 = -[SKUIDeveloperInfoView init](&v48, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_developerInfo, a3);
    v11 = SKUIUserInterfaceIdiom(v8);
    if (v11 == 1)
      v12 = 0.0;
    else
      v12 = 15.0;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "tradeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_TRADE_NAME"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_TRADE_NAME"), 0, CFSTR("ProductPage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v15;
      v53[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);

    }
    objc_msgSend(v7, "tradeRepresentativeName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_TRADE_REP"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_TRADE_REP"), 0, CFSTR("ProductPage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v18;
      v52[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v19);

    }
    objc_msgSend(v7, "formattedAddressString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_ADDRESS"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_ADDRESS"), 0, CFSTR("ProductPage"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v21;
      v51[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v22);

    }
    objc_msgSend(v7, "phoneNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_PHONE"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_PHONE"), 0, CFSTR("ProductPage"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v24;
      v50[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v25);

    }
    objc_msgSend(v7, "emailAddress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_EMAIL"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_EMAIL"), 0, CFSTR("ProductPage"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v27;
      v49[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v28);

    }
    if (objc_msgSend(v13, "count"))
    {
      v29 = objc_alloc_init(SKUIProductInformationView);
      infoView = v10->_infoView;
      v10->_infoView = v29;

      v31 = 15.0;
      if (v11 == 1)
        v31 = 0.0;
      -[SKUIProductInformationView setContentInset:](v10->_infoView, "setContentInset:", v31, v31, 17.0, 15.0);
      -[SKUIProductInformationView setHidesSeparatorView:](v10->_infoView, "setHidesSeparatorView:", 1);
      -[SKUIProductInformationView setInformationLines:](v10->_infoView, "setInformationLines:", v13);
      -[SKUIDeveloperInfoView addSubview:](v10, "addSubview:", v10->_infoView);
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scale");
      v34 = 1.0 / v33;

      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, 0.0, 0.0, v34);
      infoSeparatorView = v10->_infoSeparatorView;
      v10->_infoSeparatorView = (UIView *)v35;

      v37 = v10->_infoSeparatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v37, "setBackgroundColor:", v38);

      -[SKUIDeveloperInfoView addSubview:](v10, "addSubview:", v10->_infoSeparatorView);
    }
    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lineViews = v10->_lineViews;
    v10->_lineViews = v39;

    objc_msgSend(v7, "ECommerceRegistrationIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_ECOMMERCE_REGISTRATION_ID"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_ECOMMERCE_REGISTRATION_ID"), 0, CFSTR("ProductPage"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SKUIDeveloperInfoLineItemView initWithLabel:value:]([SKUIDeveloperInfoLineItemView alloc], "initWithLabel:value:", v42, v41);
      -[SKUIDeveloperInfoLineItemView setContentInset:](v43, "setContentInset:", 11.0, v12, 11.0, 15.0);
      -[NSMutableArray addObject:](v10->_lineViews, "addObject:", v43);
      -[SKUIDeveloperInfoView addSubview:](v10, "addSubview:", v43);

    }
    objc_msgSend(v7, "businessRegistrationIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      if (v8)
        objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("DEVELOPER_INFO_LABEL_BUSINESS_REGISTRATION_ID"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DEVELOPER_INFO_LABEL_BUSINESS_REGISTRATION_ID"), 0, CFSTR("ProductPage"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[SKUIDeveloperInfoLineItemView initWithLabel:value:]([SKUIDeveloperInfoLineItemView alloc], "initWithLabel:value:", v45, v44);
      -[SKUIDeveloperInfoLineItemView setContentInset:](v46, "setContentInset:", 11.0, v12, 11.0, 15.0);
      -[NSMutableArray addObject:](v10->_lineViews, "addObject:", v46);
      -[SKUIDeveloperInfoView addSubview:](v10, "addSubview:", v46);

    }
  }

  return v10;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double MaxY;
  double v15;
  double v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x1E0C80C00];
  -[SKUIDeveloperInfoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SKUIProductInformationView frame](self->_infoView, "frame");
  v8 = v7;
  -[SKUIProductInformationView sizeThatFits:](self->_infoView, "sizeThatFits:", v4, v6);
  v10 = v9;
  v12 = v11;
  *(float *)&v9 = (v4 - v9) * 0.5;
  v13 = floorf(*(float *)&v9);
  -[SKUIProductInformationView setFrame:](self->_infoView, "setFrame:", v13, v8, v10, v11);
  v35.origin.x = v13;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  MaxY = CGRectGetMaxY(v35);
  -[UIView frame](self->_infoSeparatorView, "frame");
  -[UIView setFrame:](self->_infoSeparatorView, "setFrame:", v16, MaxY - v15, v4 - v16);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = self->_lineViews;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v22, "frame", (_QWORD)v29);
        v24 = v23;
        objc_msgSend(v22, "sizeThatFits:", v4, v6);
        v26 = v25;
        v28 = v27;
        objc_msgSend(v22, "setFrame:", v24, MaxY, v25, v27);
        v36.origin.x = v24;
        v36.origin.y = MaxY;
        v36.size.width = v26;
        v36.size.height = v28;
        MaxY = CGRectGetMaxY(v36);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIProductInformationView setBackgroundColor:](self->_infoView, "setBackgroundColor:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_lineViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setBackgroundColor:", v4);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SKUIDeveloperInfoView;
  -[SKUIDeveloperInfoView setBackgroundColor:](&v10, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  -[SKUIProductInformationView sizeThatFits:](self->_infoView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = self->_lineViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "sizeThatFits:", width, height, (_QWORD)v18);
        v9 = v9 + v15;
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = v7;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineViews, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_infoSeparatorView, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithDeveloperInfo:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDeveloperInfoView initWithDeveloperInfo:clientContext:]";
}

@end
