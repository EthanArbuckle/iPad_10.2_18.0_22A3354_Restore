@implementation SKUIAccountButtonsSection

- (SKUIAccountButtonsSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIAccountButtonsSection *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAccountButtonsSection initWithPageComponent:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIAccountButtonsSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIAccountButtonsViewController setDelegate:](self->_accountButtonsViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIAccountButtonsSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIAccountButtonsSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v13, sel_backgroundColorForIndexPath_, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SKUIAccountButtonsSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIAccountButtonsSection _accountButtonsViewController](self, "_accountButtonsViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentChildView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[SKUIAccountButtonsSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v11);

    objc_msgSend(v7, "setContentChildView:", v9);
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SKUIAccountButtonsSection _accountButtonsViewController](self, "_accountButtonsViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v6, 0.0);
  v10 = v9;

  v11 = v6;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIAccountButtonsSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIAccountButtonsSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SKUIAccountButtonsSectionReuseIdentifier"));
  v6.receiver = self;
  v6.super_class = (Class)SKUIAccountButtonsSection;
  -[SKUIStorePageSection willAppearInContext:](&v6, sel_willAppearInContext_, v4);

}

- (void)accountButtonsViewControllerDidSignIn:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0DAF558]);
  objc_msgSend(v6, "setAccountEventTypeWithEventIdentifier:", 0);
  -[SKUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEvent:", v6);

}

- (void)accountButtonsViewControllerDidSignOut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0DAF558]);
  objc_msgSend(v6, "setAccountEventTypeWithEventIdentifier:", 1);
  -[SKUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEvent:", v6);

}

- (void)accountButtonsViewControllerDidTapECommerceLink:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ECommerceLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    SKUIMetricsOpenURL(v4);
  }
  else if (v5)
  {
    objc_msgSend(v5, "firstChildForElementType:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

  }
}

- (id)_accountButtonsViewController
{
  SKUIAccountButtonsViewController *accountButtonsViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIAccountButtonsViewController *v9;
  SKUIAccountButtonsViewController *v10;
  void *v11;
  void *v12;
  SKUILink *v13;
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
  void *v25;
  void *v26;
  void *v27;

  accountButtonsViewController = self->_accountButtonsViewController;
  if (!accountButtonsViewController)
  {
    -[SKUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(SKUIAccountButtonsViewController);
    v10 = self->_accountButtonsViewController;
    self->_accountButtonsViewController = v9;

    -[SKUIAccountButtonsViewController setClientContext:](self->_accountButtonsViewController, "setClientContext:", v8);
    -[SKUIAccountButtonsViewController setDelegate:](self->_accountButtonsViewController, "setDelegate:", self);
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIAccountButtonsViewController setTermsAndConditionsHidden:](self->_accountButtonsViewController, "setTermsAndConditionsHidden:", objc_msgSend(v11, "hidesTermsAndConditions"));
    objc_msgSend(v6, "firstChildForElementType:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ECommerceLink");
    v13 = (SKUILink *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    if (!v13 && v12)
    {
      objc_msgSend(v12, "buttonText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
        v13 = -[SKUILink initWithURL:title:targetString:]([SKUILink alloc], "initWithURL:title:targetString:", 0, v15, 0);
      else
        v13 = 0;

    }
    -[SKUIAccountButtonsViewController setECommerceLink:](self->_accountButtonsViewController, "setECommerceLink:", v13);
    objc_msgSend(v8, "valueForConfigurationKey:", CFSTR("mgift"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && (objc_msgSend(v16, "BOOLValue") & 1) == 0)
      -[SKUIAccountButtonsViewController setGiftingHidden:](self->_accountButtonsViewController, "setGiftingHidden:", 1);
    v26 = v8;
    objc_msgSend(v7, "addChildViewController:", self->_accountButtonsViewController);
    v27 = v6;
    if (v6)
    {
      objc_msgSend(v6, "style");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ikColor");
      v19 = v7;
      v20 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "color");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v20;
      v7 = v19;
    }
    else
    {
      objc_msgSend(v4, "colorScheme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "primaryTextColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKUIAccountButtonsViewController view](self->_accountButtonsViewController, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v22);

    accountButtonsViewController = self->_accountButtonsViewController;
  }
  return accountButtonsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountButtonsViewController, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAccountButtonsSection initWithPageComponent:]";
}

@end
