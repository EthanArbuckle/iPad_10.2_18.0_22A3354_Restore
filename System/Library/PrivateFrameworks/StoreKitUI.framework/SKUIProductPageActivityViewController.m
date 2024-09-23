@implementation SKUIProductPageActivityViewController

- (SKUIProductPageActivityViewController)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SKUIProductPageActivityViewController *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIProductPageActivityViewController initWithProductPageItem:clientContext:].cold.1();
  }
  -[SKUIProductPageActivityViewController _activityItemsForProductPageItem:clientContext:](self, "_activityItemsForProductPageItem:clientContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageActivityViewController _applicationActivitiesForProductPageItem:clientContext:](self, "_applicationActivitiesForProductPageItem:clientContext:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)SKUIProductPageActivityViewController;
  v11 = -[SKUIProductPageActivityViewController initWithActivityItems:applicationActivities:](&v16, sel_initWithActivityItems_applicationActivities_, v9, v10);
  if (v11)
  {
    v12 = *MEMORY[0x1E0CEB1B8];
    v17[0] = *MEMORY[0x1E0CEB1A8];
    v17[1] = v12;
    v13 = *MEMORY[0x1E0CEB220];
    v17[2] = *MEMORY[0x1E0CEB1F8];
    v17[3] = v13;
    v17[4] = *MEMORY[0x1E0CEB228];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageActivityViewController setExcludedActivityTypes:](v11, "setExcludedActivityTypes:", v14);

    objc_storeStrong((id *)&v11->_clientContext, a4);
  }

  return v11;
}

- (id)_titleForActivity:(id)a3
{
  id v4;
  void *v5;
  SKUIClientContext *clientContext;

  v4 = a3;
  if ((id)*MEMORY[0x1E0CEB1C0] == v4)
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACTIVITY_COPY_LINK"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACTIVITY_COPY_LINK"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_activityItemsForProductPageItem:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SKUIURLActivityItemProvider *v7;
  SKUITextActivityItemProvider *v8;
  SKUIImageActivityItemProvider *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = -[SKUIURLActivityItemProvider initWithProductPageItem:clientContext:]([SKUIURLActivityItemProvider alloc], "initWithProductPageItem:clientContext:", v6, v5);
  v8 = -[SKUIDeferredActivityItemProvider initWithProductPageItem:clientContext:]([SKUITextActivityItemProvider alloc], "initWithProductPageItem:clientContext:", v6, v5);
  v9 = -[SKUIDeferredActivityItemProvider initWithProductPageItem:clientContext:]([SKUIImageActivityItemProvider alloc], "initWithProductPageItem:clientContext:", v6, v5);

  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_activityItemsForProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SKUIURLActivityItemProvider *v7;
  SKUITextActivityItemProvider *v8;
  SKUIImageActivityItemProvider *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = -[SKUIURLActivityItemProvider initWithProductPageItemProvider:clientContext:]([SKUIURLActivityItemProvider alloc], "initWithProductPageItemProvider:clientContext:", v6, v5);
  v8 = -[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:]([SKUITextActivityItemProvider alloc], "initWithProductPageItemProvider:clientContext:", v6, v5);
  v9 = -[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:]([SKUIImageActivityItemProvider alloc], "initWithProductPageItemProvider:clientContext:", v6, v5);

  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_applicationActivitiesForProductPageItem:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SKUIAddToWishlistActivity *v15;
  void *v16;
  char v17;
  SKUIGiftActivity *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryItemOffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "price");
  if (v9 > 0.0)
  {
    v10 = objc_msgSend(v5, "itemIdentifier");
    +[SKUIWishlist activeWishlist](SKUIWishlist, "activeWishlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (objc_msgSend(v11, "containsItemWithIdentifier:", v10) & 1) == 0)
    {
      +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stateForItemWithIdentifier:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "state") & 0xF) == 0)
      {
        v15 = -[SKUIAddToWishlistActivity initWithItem:clientContext:]([SKUIAddToWishlistActivity alloc], "initWithItem:clientContext:", v5, v6);
        objc_msgSend(v7, "addObject:", v15);

      }
    }
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v5, "parentalControlsRank"));

    if ((v17 & 1) == 0)
    {
      v18 = -[SKUIGiftActivity initWithItem:clientContext:]([SKUIGiftActivity alloc], "initWithItem:clientContext:", v5, v6);
      objc_msgSend(v7, "addObject:", v18);

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithProductPageItem:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageActivityViewController initWithProductPageItem:clientContext:]";
}

@end
