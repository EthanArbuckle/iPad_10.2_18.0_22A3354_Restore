@implementation ICQUpgradeOfferViewController

- (ICQUpgradeOfferViewController)initWithPageSpecification:(id)a3
{
  id v4;
  void *v5;
  ICQUpgradeOfferViewController *v6;

  v4 = a3;
  objc_msgSend(v4, "pageClassIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICQUpgradeOfferViewController initWithUpgradeOfferPageSpecification:](self, "initWithUpgradeOfferPageSpecification:", v4);

  return v6;
}

- (ICQUpgradeOfferViewController)initWithUpgradeOfferPageSpecification:(id)a3
{
  ICQUpgradeOfferViewController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUpgradeOfferViewController;
  v3 = -[ICQViewController initWithPageSpecification:](&v7, sel_initWithPageSpecification_, a3);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v3, sel_cancel_);
    -[ICQUpgradeOfferViewController navigationItem](v3, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  }
  return v3;
}

- (BOOL)isCancelEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[ICQUpgradeOfferViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (void)setCancelEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[ICQUpgradeOfferViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

+ (BOOL)supportsPageClassIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("_ICQUpgradeOfferPageSpecification"));
}

- (void)loadView
{
  ICQUpgradeOfferView *v3;
  void *v4;
  void *v5;
  ICQUpgradeOfferView *v6;

  v3 = [ICQUpgradeOfferView alloc];
  v6 = -[ICQUpgradeOfferView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[ICQUpgradeOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeOfferView setUpgradeOfferPageSpecification:](v6, "setUpgradeOfferPageSpecification:", v4);

  -[ICQViewController buttonTintColor](self, "buttonTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeOfferView setButtonTintColor:](v6, "setButtonTintColor:", v5);

  -[ICQUpgradeOfferViewController setView:](self, "setView:", v6);
  -[ICQUpgradeOfferView setDelegate:](v6, "setDelegate:", self);

}

- (void)cancel:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "user canceled upgrade offer", (uint8_t *)&v15, 2u);
  }

  -[ICQViewController pageDelegate](self, "pageDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v9 = MEMORY[0x24BDBD1B8];
      -[ICQViewController pageDelegate](self, "pageDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQStringForAction();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v15, 0x20u);

    }
    -[ICQViewController pageDelegate](self, "pageDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject sender:action:parameters:](v7, "sender:action:parameters:", self, 1, MEMORY[0x24BDBD1B8]);
  }
  else if (v8)
  {
    -[ICQViewController pageDelegate](self, "pageDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "page delegate %@ does not respond to selector sender:action:paramters", (uint8_t *)&v15, 0xCu);

  }
}

@end
