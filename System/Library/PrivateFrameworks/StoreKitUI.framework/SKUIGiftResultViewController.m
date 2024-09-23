@implementation SKUIGiftResultViewController

- (SKUIGiftResultViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIGiftResultViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftResultViewController initWithGift:configuration:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftResultViewController;
  v8 = -[SKUIGiftStepViewController initWithGift:configuration:](&v13, sel_initWithGift_configuration_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "localizedStringForKey:inTable:", CFSTR("GIFTING_RESULT_TITLE"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_RESULT_TITLE"), 0, CFSTR("Gifting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftResultViewController setTitle:](v8, "setTitle:", v11);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_giftAgainButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftResultViewController;
  -[SKUIGiftResultViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  SKUIGiftResultView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(SKUIGiftResultView);
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftResultView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[SKUIGiftStepViewController gift](self, "gift");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SKUIGiftResultViewController _itemView](self, "_itemView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftResultView setItemView:](v5, "setItemView:", v9);

    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("GIFTING_RESULT_ITEM_MESSAGE"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_RESULT_ITEM_MESSAGE"), 0, CFSTR("Gifting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftResultView setTitle:](v5, "setTitle:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("RedemptionCardStack"), v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftResultView setImage:](v5, "setImage:", v10);

    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("GIFTING_RESULT_AMOUNT_MESSAGE"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_RESULT_AMOUNT_MESSAGE"), 0, CFSTR("Gifting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[SKUIGiftStepViewController gift](self, "gift");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "totalGiftAmountString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftResultView setTitle:](v5, "setTitle:", v15);

  }
  -[SKUIGiftResultView giftAgainButton](v5, "giftAgainButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__giftAgainAction_, 64);
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("GIFTING_RESULT_SEND_ANOTHER_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_RESULT_SEND_ANOTHER_BUTTON"), 0, CFSTR("Gifting"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  objc_msgSend(v16, "sizeToFit");
  -[SKUIGiftResultViewController setView:](self, "setView:", v5);
  -[SKUIGiftResultViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidesBackButton:", 1);
  v19 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v19, "setAction:", sel__doneButtonAction_);
  objc_msgSend(v19, "setStyle:", 2);
  objc_msgSend(v19, "setTarget:", self);
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("GIFTING_DONE_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_DONE_BUTTON"), 0, CFSTR("Gifting"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v20);

  objc_msgSend(v18, "setRightBarButtonItem:", v19);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a3;
  -[SKUIGiftResultViewController _itemView](self, "_itemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !self->_itemImage)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__SKUIGiftResultViewController_viewWillAppear___block_invoke;
    v8[3] = &unk_1E73A1EE0;
    objc_copyWeak(&v9, &location);
    -[SKUIGiftStepViewController loadItemArtworkWithArtworkContext:completionBlock:](self, "loadItemArtworkWithArtworkContext:completionBlock:", v6, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftResultViewController;
  -[SKUIGiftResultViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);

}

void __47__SKUIGiftResultViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setItemImage:error:", v6, v5);

}

- (void)_doneButtonAction:(id)a3
{
  -[SKUIGiftStepViewController finishGiftingWithResult:](self, "finishGiftingWithResult:", 1);
}

- (void)_giftAgainAction:(id)a3
{
  void *v4;
  void *v5;
  SKUIGiftComposeViewController *v6;
  void *v7;
  SKUIGiftComposeViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[SKUIGiftStepViewController gift](self, "gift", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "reset");
  v6 = [SKUIGiftComposeViewController alloc];
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKUIGiftComposeViewController initWithGift:configuration:](v6, "initWithGift:configuration:", v5, v7);

  -[SKUIGiftStepViewController operationQueue](self, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftStepViewController setOperationQueue:](v8, "setOperationQueue:", v9);

  -[SKUIGiftResultViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setViewControllers:animated:", v11, 1);

}

- (id)_itemImage
{
  UIImage *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = self->_itemImage;
  if (!v3)
  {
    -[SKUIGiftItemView artworkContext](self->_itemView, "artworkContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController gift](self, "gift");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeholderImageForItem:", v6);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_itemView
{
  void *v3;
  void *v4;
  SKUIGiftItemView *v5;
  void *v6;
  void *v7;
  SKUIGiftItemView *v8;
  SKUIGiftItemView *itemView;
  SKUIGiftItemView *v10;
  void *v11;
  SKUIGiftItemView *v12;
  void *v13;
  SKUIGiftItemView *v14;
  void *v15;
  SKUIGiftItemView *v16;
  void *v17;
  void *v18;
  SKUIGiftItemView *v19;
  void *v20;
  SKUIGiftItemView *v21;
  float v22;
  double v23;
  SKUIGiftItemView *v24;

  -[SKUIGiftStepViewController gift](self, "gift");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !self->_itemView)
  {
    v5 = [SKUIGiftItemView alloc];
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUIGiftItemView initWithStyle:item:clientContext:](v5, "initWithStyle:item:clientContext:", 2, v4, v7);
    itemView = self->_itemView;
    self->_itemView = v8;

    v10 = self->_itemView;
    objc_msgSend(v4, "artistName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setArtistName:](v10, "setArtistName:", v11);

    v12 = self->_itemView;
    objc_msgSend(v4, "categoryName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setCategoryName:](v12, "setCategoryName:", v13);

    v14 = self->_itemView;
    -[SKUIGiftResultViewController _itemImage](self, "_itemImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setItemImage:](v14, "setItemImage:", v15);

    -[SKUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", objc_msgSend(v4, "numberOfUserRatings"));
    v16 = self->_itemView;
    objc_msgSend(v4, "primaryItemOffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buttonText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setPrice:](v16, "setPrice:", v18);

    v19 = self->_itemView;
    objc_msgSend(v4, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftItemView setTitle:](v19, "setTitle:", v20);

    v21 = self->_itemView;
    objc_msgSend(v4, "userRating");
    *(float *)&v23 = v22 / 5.0;
    -[SKUIGiftItemView setUserRating:](v21, "setUserRating:", v23);
    -[SKUIGiftItemView sizeToFit](self->_itemView, "sizeToFit");
  }
  v24 = self->_itemView;

  return v24;
}

- (void)_setItemImage:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_itemImage, a3);
    -[SKUIGiftItemView setItemImage:](self->_itemView, "setItemImage:", self->_itemImage);
    v6 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_giftAgainButton, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftResultViewController initWithGift:configuration:]";
}

@end
