@implementation ICQBuddyOfferViewController

- (ICQBuddyOfferViewController)initWithPageSpecification:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICQBuddyOfferViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  OBBoldTrayButton *purchaseButton;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  OBBoldTrayButton *purchase2Button;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  v5 = a3;
  objc_storeStrong((id *)&self->_pageSpecification, a3);
  v6 = v5;
  v7 = (void *)MEMORY[0x24BEC7300];
  objc_msgSend(v6, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithPlaceholderFormat:alternateString:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("iCloudLargeTransparent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45.receiver = self;
  v45.super_class = (Class)ICQBuddyOfferViewController;
  v13 = -[ICQBuddyOfferViewController initWithTitle:detailText:icon:contentLayout:](&v45, sel_initWithTitle_detailText_icon_contentLayout_, v12, v10, v11, 2);

  if (v13)
  {
    objc_msgSend(v6, "purchaseLink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    objc_msgSend(v6, "purchase2Link");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    objc_msgSend(v6, "bottomLink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "purchaseLink");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "text");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTitle:forState:", v25, 0);

      objc_msgSend(v23, "addTarget:action:forControlEvents:", v13, sel_purchaseButtonTapped_, 64);
      -[ICQBuddyOfferViewController buttonTray](v13, "buttonTray");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addButton:", v23);

      purchaseButton = v13->_purchaseButton;
      v13->_purchaseButton = (OBBoldTrayButton *)v23;

    }
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "purchase2Link");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "text");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTitle:forState:", v30, 0);

      objc_msgSend(v28, "addTarget:action:forControlEvents:", v13, sel_purchase2ButtonTapped_, 64);
      -[ICQBuddyOfferViewController buttonTray](v13, "buttonTray");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addButton:", v28);

      purchase2Button = v13->_purchase2Button;
      v13->_purchase2Button = (OBBoldTrayButton *)v28;

    }
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomLink");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "text");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTitle:forState:", v35, 0);

      objc_msgSend(v33, "addTarget:action:forControlEvents:", v13, sel_bottomButtonTapped_, 64);
      -[ICQBuddyOfferViewController buttonTray](v13, "buttonTray");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addButton:", v33);

    }
    objc_msgSend(v6, "fineprintFormat");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");

    if (v38)
    {
      objc_msgSend(v6, "fineprintLinks");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "serverUIURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICQBuddyOfferViewController buttonTray](v13, "buttonTray");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fineprintFormat");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        objc_msgSend(v42, "setCaptionText:learnMoreURL:", v43, v41);
      else
        objc_msgSend(v42, "setCaptionText:", v43);

    }
  }

  return v13;
}

+ (BOOL)supportsPageClassIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("_ICQUpgradeOfferPageSpecification"));
}

- (void)purchaseButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController main button tapped", v11, 2u);
  }

  -[OBBoldTrayButton showsBusyIndicator](self->_purchaseButton, "showsBusyIndicator");
  -[ICQBuddyOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purchaseLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "action");
  -[ICQBuddyOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "purchaseLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBuddyOfferViewController sender:action:parameters:](self, "sender:action:parameters:", self, v7, v10);

}

- (void)purchase2ButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController second button tapped", v11, 2u);
  }

  -[OBBoldTrayButton showsBusyIndicator](self->_purchase2Button, "showsBusyIndicator");
  -[ICQBuddyOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purchase2Link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "action");
  -[ICQBuddyOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "purchase2Link");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBuddyOfferViewController sender:action:parameters:](self, "sender:action:parameters:", self, v7, v10);

}

- (void)bottomButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController bottom button tapped", v11, 2u);
  }

  -[ICQBuddyOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "action");
  -[ICQBuddyOfferViewController upgradeOfferPageSpecification](self, "upgradeOfferPageSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBuddyOfferViewController sender:action:parameters:](self, "sender:action:parameters:", self, v7, v10);

}

- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController sender:action:parameters:", (uint8_t *)&v18, 2u);
  }

  -[ICQBuddyOfferViewController pageDelegate](self, "pageDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      -[ICQBuddyOfferViewController pageDelegate](self, "pageDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQStringForAction();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "pageDelegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v18, 0x20u);

    }
    -[ICQBuddyOfferViewController pageDelegate](self, "pageDelegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject sender:action:parameters:](v11, "sender:action:parameters:", self, a4, v7);
  }
  else if (v12)
  {
    -[ICQBuddyOfferViewController pageDelegate](self, "pageDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v17;
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "ICQViewController - page delegate %@ does not respond to sender:action:parameters:", (uint8_t *)&v18, 0xCu);

  }
}

- (void)hideSpinner
{
  NSObject *v3;
  OBBoldTrayButton *purchaseButton;
  OBBoldTrayButton *purchase2Button;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController remove spinners", v6, 2u);
  }

  purchaseButton = self->_purchaseButton;
  if (purchaseButton)
    -[OBBoldTrayButton hidesBusyIndicator](purchaseButton, "hidesBusyIndicator");
  purchase2Button = self->_purchase2Button;
  if (purchase2Button)
    -[OBBoldTrayButton hidesBusyIndicator](purchase2Button, "hidesBusyIndicator");
}

- (_ICQPageSpecification)pageSpecification
{
  return self->_pageSpecification;
}

- (ICQPageDelegate)pageDelegate
{
  return (ICQPageDelegate *)objc_loadWeakRetained((id *)&self->_pageDelegate);
}

- (void)setPageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageDelegate);
  objc_storeStrong((id *)&self->_pageSpecification, 0);
  objc_storeStrong((id *)&self->_purchase2Button, 0);
  objc_storeStrong((id *)&self->_purchaseButton, 0);
}

@end
