@implementation SKUIGiftConfirmViewController

- (SKUIGiftConfirmViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIGiftConfirmViewController *v8;
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
    -[SKUIGiftConfirmViewController initWithGift:configuration:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftConfirmViewController;
  v8 = -[SKUIGiftStepViewController initWithGift:configuration:](&v13, sel_initWithGift_configuration_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "localizedStringForKey:inTable:", CFSTR("GIFTING_REVIEW_TITLE"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_REVIEW_TITLE"), 0, CFSTR("Gifting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftConfirmViewController setTitle:](v8, "setTitle:", v11);

    -[SKUIGiftConfirmViewController setEdgesForExtendedLayout:](v8, "setEdgesForExtendedLayout:", 0);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SKUIGiftConfirmView termsButton](self->_confirmView, "termsButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](self->_touchRecognizer, "removeTarget:action:", self, 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftConfirmViewController;
  -[SKUIGiftConfirmViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SKUIGiftConfirmView *confirmView;
  SKUIGiftConfirmView *v4;
  void *v5;
  void *v6;
  SKUIGiftConfirmView *v7;
  SKUIGiftConfirmView *v8;
  SKUIGiftConfirmView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  confirmView = self->_confirmView;
  if (!confirmView)
  {
    v4 = [SKUIGiftConfirmView alloc];
    -[SKUIGiftStepViewController gift](self, "gift");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUIGiftConfirmView initWithGift:configuration:](v4, "initWithGift:configuration:", v5, v6);
    v8 = self->_confirmView;
    self->_confirmView = v7;

    v9 = self->_confirmView;
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftConfirmView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[SKUIGiftConfirmView termsButton](self->_confirmView, "termsButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__termsButtonAction_, 64);

    confirmView = self->_confirmView;
  }
  -[SKUIGiftConfirmViewController setView:](self, "setView:", confirmView);
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientContext");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIGiftConfirmViewController _buyButtonTitle](self, "_buyButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SKUIGiftConfirmViewController _newBuyBarButtonItemWithTitle:](self, "_newBuyBarButtonItemWithTitle:", v13);
  -[SKUIGiftConfirmViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

}

- (void)_buyButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SKUIFocusedTouchGestureRecognizer *v7;
  SKUIFocusedTouchGestureRecognizer *v8;
  SKUIFocusedTouchGestureRecognizer *touchRecognizer;
  void *v10;
  id v11;

  if (self->_isShowingConfirmation)
  {
    -[SKUIGiftConfirmViewController _purchaseGift](self, "_purchaseGift", a3);
    -[SKUIGiftConfirmViewController _setShowingConfirmation:animated:](self, "_setShowingConfirmation:animated:", 0, 1);
    -[SKUIGiftConfirmViewController _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
    -[SKUIGiftConfirmViewController navigationItem](self, "navigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);
LABEL_3:

    return;
  }
  -[SKUIGiftConfirmViewController _setShowingConfirmation:animated:](self, "_setShowingConfirmation:animated:", 1, 1);
  if (!self->_touchRecognizer)
  {
    -[SKUIGiftConfirmViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customView");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v7 = [SKUIFocusedTouchGestureRecognizer alloc];
    v8 = -[SKUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    touchRecognizer = self->_touchRecognizer;
    self->_touchRecognizer = v8;

    -[SKUIFocusedTouchGestureRecognizer addTarget:action:](self->_touchRecognizer, "addTarget:action:", self, sel__cancelBuyConfirmation_);
    -[SKUIGiftConfirmViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", self->_touchRecognizer);

    goto LABEL_3;
  }
}

- (void)_cancelBuyConfirmation:(id)a3
{
  -[SKUIGiftConfirmViewController _setShowingConfirmation:animated:](self, "_setShowingConfirmation:animated:", 0, 1);
  -[SKUIGiftConfirmViewController _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
}

- (void)_termsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);

}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SKUIGiftPurchaseRequest *purchaseRequest;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v6 = a4;
  v18 = v6;
  if (v4)
  {
    -[SKUIGiftConfirmViewController _showSuccessPage](self, "_showSuccessPage");
  }
  else if (v6)
  {
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3450];
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_UNABLE_TO_GIFT"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_UNABLE_TO_GIFT"), 0, CFSTR("Gifting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_OK_BUTTON"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_OK_BUTTON"), 0, CFSTR("Gifting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v14);

    -[SKUIGiftConfirmViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;

  -[SKUIGiftConfirmViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rightBarButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", 1);

}

- (void)_purchaseGift
{
  SKUIGiftPurchaseRequest *v3;
  void *v4;
  void *v5;
  SKUIGiftPurchaseRequest *v6;
  SKUIGiftPurchaseRequest *purchaseRequest;
  SKUIGiftPurchaseRequest *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_purchaseRequest)
  {
    objc_initWeak(&location, self);
    v3 = [SKUIGiftPurchaseRequest alloc];
    -[SKUIGiftStepViewController gift](self, "gift");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIGiftPurchaseRequest initWithGift:configuration:](v3, "initWithGift:configuration:", v4, v5);
    purchaseRequest = self->_purchaseRequest;
    self->_purchaseRequest = v6;

    v8 = self->_purchaseRequest;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke;
    v9[3] = &unk_1E73A2F80;
    objc_copyWeak(&v10, &location);
    -[SKUIGiftPurchaseRequest purchaseWithCompletionBlock:](v8, "purchaseWithCompletionBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke_2;
  block[3] = &unk_1E73A2000;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishPurchaseWithResult:errorMessage:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_removeCancelGestureRecognizer
{
  void *v3;
  SKUIFocusedTouchGestureRecognizer *touchRecognizer;

  -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](self->_touchRecognizer, "removeTarget:action:", self, 0);
  -[SKUIFocusedTouchGestureRecognizer view](self->_touchRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_touchRecognizer);

  touchRecognizer = self->_touchRecognizer;
  self->_touchRecognizer = 0;

}

- (void)_setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;

  if (self->_isShowingConfirmation != a3)
  {
    v4 = a4;
    if (a3)
      -[SKUIGiftConfirmViewController _confirmButtonTitle](self, "_confirmButtonTitle");
    else
      -[SKUIGiftConfirmViewController _buyButtonTitle](self, "_buyButtonTitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUIGiftConfirmViewController _newBuyBarButtonItemWithTitle:](self, "_newBuyBarButtonItemWithTitle:", v9);
    -[SKUIGiftConfirmViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:animated:", v7, v4);

    self->_isShowingConfirmation = a3;
  }
}

- (void)_showSuccessPage
{
  SKUIGiftResultViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIGiftResultViewController *v8;

  v3 = [SKUIGiftResultViewController alloc];
  -[SKUIGiftStepViewController gift](self, "gift");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKUIGiftResultViewController initWithGift:configuration:](v3, "initWithGift:configuration:", v4, v5);

  -[SKUIGiftStepViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftStepViewController setOperationQueue:](v8, "setOperationQueue:", v6);

  -[SKUIGiftConfirmViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  -[SKUIGiftConfirmViewController _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
}

- (id)_newBuyBarButtonItemWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0DC3518];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v6, "addTarget:action:forEvents:", self, sel__buyButtonAction_, 64);
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  objc_msgSend(v6, "sizeToFit");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v6);

  return v9;
}

- (id)_buyButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("GIFTING_BUY_GIFT_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_BUY_GIFT_BUTTON"), 0, CFSTR("Gifting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_confirmButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("GIFTING_BUY_CONFIRM_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_BUY_CONFIRM_BUTTON"), 0, CFSTR("Gifting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchRecognizer, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
  objc_storeStrong((id *)&self->_confirmView, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftConfirmViewController initWithGift:configuration:]";
}

@end
