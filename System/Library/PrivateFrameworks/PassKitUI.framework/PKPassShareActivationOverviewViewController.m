@implementation PKPassShareActivationOverviewViewController

- (PKPassShareActivationOverviewViewController)init
{

  return 0;
}

- (PKPassShareActivationOverviewViewController)initWithActivationOptions:(id)a3 recipient:(id)a4 isFinalScreen:(BOOL)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPassShareActivationOverviewViewController *v14;
  PKPassShareActivationOverviewViewController *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKPassShareActivationOverviewViewController;
  v14 = -[PKPassShareActivationOverviewViewController init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activationOptions, a3);
    objc_storeStrong((id *)&v15->_recipient, a4);
    v15->_isFinalScreen = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
  }

  return v15;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  PKCollapsibleHeaderView *v14;
  PKCollapsibleHeaderView *headerView;
  PKCollapsibleHeaderView *v16;
  void *v17;
  void *v18;
  PKPassShareActivationShareActivationCodeView *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *contentView;
  __CFString *v24;
  PKPassShareActivationExternalKeyEducationView *v25;
  void *v26;
  void *v27;
  void *v28;
  UIView *v29;
  UIView *v30;
  UIView *v31;
  UIView *v32;
  NSString *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKPassShareActivationOverviewViewController;
  -[PKPassShareActivationOverviewViewController loadView](&v34, sel_loadView);
  -[PKPassShareActivationOverviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if (self->_isFinalScreen)
  {
    -[PKPassShareActivationOverviewViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel_closeButtonPressed);
    objc_msgSend(v5, "setRightBarButtonItem:", v6);
    objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v5, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    objc_msgSend(v5, "setHidesBackButton:", 1);
    -[PKPassShareActivationOverviewViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNavigationBarHidden:", 0);

  }
  -[PKPassShareActivationOptions primaryOption](self->_activationOptions, "primaryOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");
  objc_msgSend(v8, "localizationKeyPostfix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SHARE_ACTIVATION_OVERVIEW_TITLE_"), "stringByAppendingString:", v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[PKPassShareActivationOptions localizationKeyPostfix](self->_activationOptions, "localizationKeyPostfix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SHARE_OVERVIEW_ACTIVATION_FOOTER_"), "stringByAppendingString:", v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(PKCollapsibleHeaderView);
  headerView = self->_headerView;
  self->_headerView = v14;

  v16 = self->_headerView;
  v33 = v11;
  PKLocalizedShareableCredentialString(v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCollapsibleHeaderView setTitle:subtitle:](v16, "setTitle:subtitle:", v17, v18);

  objc_msgSend(v3, "addSubview:", self->_headerView);
  if (PKPassShareActivationOptionTypeIsActivationCode())
  {
    v19 = -[PKPassShareActivationShareActivationCodeView initWithDelegate:]([PKPassShareActivationShareActivationCodeView alloc], "initWithDelegate:", self);
    objc_msgSend(v8, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareActivationShareActivationCodeView setActivationCode:](v19, "setActivationCode:", v20);

    -[PKContact phoneNumber](self->_recipient, "phoneNumber");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 != 0;

    -[PKPassShareActivationShareActivationCodeView setShowPhoneCallButton:](v19, "setShowPhoneCallButton:", v22);
    contentView = self->_contentView;
    self->_contentView = &v19->super;
  }
  else if (v9 == 3)
  {
    if (self->_isFinalScreen)
      v24 = CFSTR("DONE_BUTTON");
    else
      v24 = CFSTR("NEXT");
    PKLocalizedPaymentString(&v24->isa);
    contentView = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PKPassShareActivationExternalKeyEducationView initWithContinueButtonText:delegate:]([PKPassShareActivationExternalKeyEducationView alloc], "initWithContinueButtonText:delegate:", contentView, self);
    v26 = (void *)MEMORY[0x1E0DC3870];
    PKPassKitUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageNamed:inBundle:withConfiguration:", CFSTR("Car-Key-Share-Activation-Key-Fob"), v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassShareActivationExternalKeyEducationView setEducationImage:](v25, "setEducationImage:", v28);
    v29 = self->_contentView;
    self->_contentView = &v25->super;

  }
  else
  {
    v30 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v31 = self->_contentView;
    self->_contentView = v30;

    v32 = self->_contentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    contentView = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v32, "setBackgroundColor:", contentView);
  }

  objc_msgSend(v3, "addSubview:", self->_contentView);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  PKCollapsibleHeaderView *headerView;
  double v18;
  CGFloat v19;
  UIView *contentView;
  CGRect v21;
  CGRect slice;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)PKPassShareActivationOverviewViewController;
  -[PKPassShareActivationOverviewViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  -[PKPassShareActivationOverviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "readableContentGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutFrame");
  v14 = v13;

  memset(&slice, 0, sizeof(slice));
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  -[PKCollapsibleHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v14, v11);
  v16 = v15;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGRectDivide(v24, &slice, &v21, 12.0, CGRectMinYEdge);
  CGRectDivide(v21, &slice, &v21, v16, CGRectMinYEdge);
  headerView = self->_headerView;
  PKSizeAlignedInRect();
  -[PKCollapsibleHeaderView setFrame:](headerView, "setFrame:");
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v14, v11);
  v19 = v18;
  CGRectDivide(v21, &slice, &v21, 16.0, CGRectMinYEdge);
  CGRectDivide(v21, &slice, &v21, v19, CGRectMinYEdge);
  contentView = self->_contentView;
  PKSizeAlignedInRect();
  -[UIView setFrame:](contentView, "setFrame:");

}

- (void)closeButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidFinish:", self);

}

- (void)shareActivationCodeViewDidSelectPhone:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Sharing activation code over the phone", v13, 2u);
  }

  -[PKContact phoneNumber](self->_recipient, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E3E7D690);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(CFSTR("telprompt://"), "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:options:completionHandler:", v11, MEMORY[0x1E0C9AA70], 0);

  }
}

- (void)shareActivationCodeViewDidSelectShare:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Sharing activation code with share sheet", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidSelectShareCode:", self);

}

- (void)shareActivationCodeViewDidSelectCopy:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Copying activation code", v8, 2u);
  }

  -[PKPassShareActivationOptions primaryOption](self->_activationOptions, "primaryOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v7);

}

- (void)externalKeyEdicationViewDidSelectNext:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidFinish:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_activationOptions, 0);
}

@end
