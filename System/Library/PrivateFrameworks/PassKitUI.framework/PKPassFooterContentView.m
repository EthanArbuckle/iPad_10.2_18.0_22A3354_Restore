@implementation PKPassFooterContentView

- (PKPassFooterContentView)init
{

  return 0;
}

- (PKPassFooterContentView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPassFooterContentView)initWithCoder:(id)a3
{

  return 0;
}

- (PKPassFooterContentView)initWithPass:(id)a3 presentationContext:(id)a4
{
  id v7;
  id v8;
  PKPassFooterContentView *v9;
  PKPassFooterContentView *v10;
  id *p_pass;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  UIView *v16;
  UIView *bottomRule;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIButton *infoButton;
  uint64_t v29;
  int64_t style;
  PKLinkedApplication *v31;
  PKLinkedAppIconView *v32;
  PKLinkedAppIconView *appIconView;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PKPassFooterContentView;
  v9 = -[PKPassFooterContentView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (!v9)
    goto LABEL_19;
  p_pass = (id *)&v9->_pass;
  objc_storeStrong((id *)&v9->_pass, a3);
  if (*p_pass)
  {
    if (objc_msgSend(*p_pass, "passType") == 1)
    {
      objc_storeStrong((id *)&v10->_secureElementPass, *p_pass);
      if (v8 && objc_msgSend(v8, "isFieldDetect") && objc_msgSend(v8, "terminalType") == 4)
        goto LABEL_12;
      objc_msgSend(*p_pass, "barcodeSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = 3;
        goto LABEL_14;
      }
      -[PKSecureElementPass devicePrimaryContactlessPaymentApplication](v10->_secureElementPass, "devicePrimaryContactlessPaymentApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "requiresConsentForDataRelease");

      if ((v15 & 1) != 0)
LABEL_12:
        v13 = 4;
      else
        v13 = objc_msgSend(*p_pass, "style") == 7;
    }
    else
    {
      v13 = 2;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_14:
  v10->_style = v13;
  v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  bottomRule = v10->_bottomRule;
  v10->_bottomRule = v16;

  v18 = v10->_bottomRule;
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

  PKUIBigInfoButtonImageWithDefaultConfiguration();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3520];
  objc_msgSend(v20, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v10);
  v25 = (void *)MEMORY[0x1E0DC3428];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __60__PKPassFooterContentView_initWithPass_presentationContext___block_invoke;
  v35[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v25, "actionWithHandler:", v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v24, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  infoButton = v10->_infoButton;
  v10->_infoButton = (UIButton *)v27;

  -[UIButton setConfigurationUpdateHandler:](v10->_infoButton, "setConfigurationUpdateHandler:", &__block_literal_global_207);
  v29 = *MEMORY[0x1E0DC4918];
  -[UIButton setMaximumContentSizeCategory:](v10->_infoButton, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  -[UIButton setMinimumContentSizeCategory:](v10->_infoButton, "setMinimumContentSizeCategory:", v29);
  -[UIButton sizeToFit](v10->_infoButton, "sizeToFit");
  style = v10->_style;
  if (style && style != 3 && PKRunningInRemoteContext())
  {
    v31 = -[PKLinkedApplication initWithPass:]([PKLinkedApplication alloc], "initWithPass:", v7);
    -[PKLinkedApplication setUseSmallIcon:](v31, "setUseSmallIcon:", 1);
    v32 = -[PKLinkedAppIconView initWithLinkedApplication:]([PKLinkedAppIconView alloc], "initWithLinkedApplication:", v31);
    appIconView = v10->_appIconView;
    v10->_appIconView = v32;

    -[PKLinkedAppIconView setAlpha:](v10->_appIconView, "setAlpha:", 0.0);
    -[PKPassFooterContentView addSubview:](v10, "addSubview:", v10->_bottomRule);
    -[PKPassFooterContentView addSubview:](v10, "addSubview:", v10->_appIconView);
    -[PKPassFooterContentView addSubview:](v10, "addSubview:", v10->_infoButton);

  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_19:
  return v10;
}

void __60__PKPassFooterContentView_initWithPass_presentationContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_infoButtonPressed:", v4);
}

void __60__PKPassFooterContentView_initWithPass_presentationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[PKPassFooterContentView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPassFooterContentView;
  -[PKPassFooterContentView dealloc](&v3, sel_dealloc);
}

- (void)setInfoButtonAlpha:(double)a3
{
  -[UIButton setAlpha:](self->_infoButton, "setAlpha:", a3);
}

- (double)infoButtonAlpha
{
  double result;

  -[UIButton alpha](self->_infoButton, "alpha");
  return result;
}

- (CGRect)infoButtonFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIButton frame](self->_infoButton, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (PKPaymentPass)paymentPass
{
  return (PKPaymentPass *)self->_secureElementPass;
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
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double MaxY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v39.receiver = self;
  v39.super_class = (Class)PKPassFooterContentView;
  -[PKPassFooterContentView layoutSubviews](&v39, sel_layoutSubviews);
  -[PKPassFooterContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = PKUIGetMinScreenWidthType();
  v12 = 4.0;
  if (!v11)
    v12 = 20.0;
  v13 = v4 + v12;
  v14 = v6 + 0.0;
  v15 = 40.0;
  if (v11)
    v15 = 8.0;
  v16 = v8 - v15;
  v17 = -[PKPassFooterContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v40.origin.x = v4;
  v40.origin.y = v6;
  v18 = v10 + -27.0;
  v40.size.width = v8;
  v40.size.height = v10;
  MaxY = CGRectGetMaxY(v40);
  v34 = PKUIPixelLength();
  v38 = PKUIPixelLength();
  -[PKLinkedAppIconView intrinsicContentSize](self->_appIconView, "intrinsicContentSize");
  v21 = v20;
  v37 = v22;
  v23 = v13;
  if (v17)
  {
    v41.origin.x = v13;
    v41.origin.y = v14;
    v41.size.width = v16;
    v41.size.height = v10 + -27.0;
    v23 = CGRectGetMaxX(v41) - v21;
  }
  v35 = v23;
  v36 = v21;
  v42.origin.x = v13;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v10 + -27.0;
  v24 = CGRectGetMaxY(v42);
  -[UIButton frame](self->_infoButton, "frame");
  v32 = v25;
  v33 = v26;
  v28 = v27;
  v29 = v13;
  if ((v17 & 1) == 0)
  {
    v43.origin.x = v13;
    v43.origin.y = v14;
    v43.size.width = v16;
    v43.size.height = v18;
    v29 = CGRectGetMaxX(v43) - v28;
  }
  v44.origin.y = v14;
  v44.origin.x = v13;
  v44.size.width = v16;
  v44.size.height = v18;
  v30 = CGRectGetMaxY(v44);
  v45.origin.x = v29;
  v45.size.width = v28;
  v45.origin.y = v32;
  v45.size.height = v33;
  v31 = v30 - CGRectGetHeight(v45);
  -[UIView setFrame:](self->_bottomRule, "setFrame:", v13, MaxY + -60.0 - v34, v16, v38);
  -[PKLinkedAppIconView setFrame:](self->_appIconView, "setFrame:", v35, v24 - v37, v36, v37);
  -[UIButton setFrame:](self->_infoButton, "setFrame:", v29, v31, v28, v33);
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKPassFooterContentView _didInvalidate](self, "_didInvalidate");
  }
}

- (BOOL)isPassAuthorized
{
  return 0;
}

- (void)_setPhysicalButtonRequired:(BOOL)a3
{
  id WeakRetained;

  if (((!self->_physicalButtonRequired ^ a3) & 1) == 0)
  {
    self->_physicalButtonRequired = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passFooterContentViewDidChangePhysicalButtonRequirement:", self);

  }
}

- (void)_setCoachingState:(int64_t)a3
{
  id WeakRetained;

  if (self->_coachingState != a3)
  {
    self->_coachingState = a3;
    -[PKPassFooterContentView coachingStateDidChange](self, "coachingStateDidChange");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passFooterContentViewDidChangeCoachingState:", self);

  }
}

- (void)_setRequestPileSuppression:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  if (self->_requestPileSuppression != a3)
  {
    self->_requestPileSuppression = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v6 = objc_opt_respondsToSelector();
      v5 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "passFooterContentViewDidChangePileSuppressionRequirement:", self);
        v5 = v7;
      }
    }

  }
}

- (void)_infoButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  int v14;
  void *v15;
  PKBarcodePassDetailViewController *v16;
  id WeakRetained;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void (**v24)(_QWORD);
  void *v25;
  PKNavigationController *v26;
  PKPaymentPassDetailViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  PKPaymentPassDetailViewController *v31;
  void *v32;
  PKNavigationController *v33;
  void *v34;
  void *v35;
  _QWORD aBlock[4];
  id v37;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D67480], "sharedService", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerPaymentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedPassUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPass uniqueID](self->_pass, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKStoreDemoModeEnabled())
  {
    v10 = v7;
    v11 = v8;
    if (v10 == v11)
    {

LABEL_11:
      PKUIStoreDemoGatewayViewController();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentViewController:animated:completion:", v15, 1, 0);

      goto LABEL_26;
    }
    v12 = v11;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13)
    {

    }
    else
    {
      v14 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v14)
        goto LABEL_11;
    }
  }
  if (self->_style == 2)
  {
    v16 = -[PKBarcodePassDetailViewController initWithPass:]([PKBarcodePassDetailViewController alloc], "initWithPass:", self->_pass);
    -[PKBarcodePassDetailViewController setShowDoneButton:](v16, "setShowDoneButton:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = objc_msgSend(WeakRetained, "suppressedContentForContentView:", self);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Assuming all sensitive content is suppressed.", buf, 2u);
      }

      v18 = 275;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PKPassFooterContentView__infoButtonPressed___block_invoke;
    aBlock[3] = &unk_1E3E78130;
    v23 = v9;
    v37 = v23;
    v24 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PKBarcodePassDetailViewController setSuppressedContent:](v16, "setSuppressedContent:", v18);
    v24[2](v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBarcodePassDetailViewController setDeleteOverrider:](v16, "setDeleteOverrider:", v25);

    v26 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v16);
    objc_msgSend(v23, "presentViewController:animated:completion:", v26, 1, 0);

  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    v20 = objc_alloc_init(MEMORY[0x1E0D67100]);
    objc_opt_class();
    v34 = v8;
    v35 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "groupsController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v27 = [PKPaymentPassDetailViewController alloc];
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:](v27, "initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:", v28, 0, v21, v29, v30, 0, v19, v20);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "groupStackView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController setDeleteOverrider:](v31, "setDeleteOverrider:", v32);

    }
    v33 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v31);
    objc_msgSend(v9, "presentViewController:animated:completion:", v33, 1, 0);

    v8 = v34;
    v7 = v35;
  }
LABEL_26:
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68330], 0);

}

id __46__PKPassFooterContentView__infoButtonPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupStackView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = *(id *)(a1 + 32);
    else
      v2 = 0;
  }
  return v2;
}

- (id)_buttonWithTitle:(id)a3 action:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0DC3520];
  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = (void *)*MEMORY[0x1E0DC48D8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v7, 18.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_plainConfigurationWithTitle:font:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setConfigurationUpdateHandler:", &__block_literal_global_34);
  objc_msgSend(v12, "sizeToFit");

  return v12;
}

void __51__PKPassFooterContentView__buttonWithTitle_action___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 4);

  objc_msgSend(v2, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMinimumScaleFactor:", 0.5);
}

- (int64_t)style
{
  return self->_style;
}

- (PKPassFooterContentViewDelegate)delegate
{
  return (PKPassFooterContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPass)pass
{
  return self->_pass;
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (PKLinkedAppIconView)appIconView
{
  return self->_appIconView;
}

- (UIView)bottomRule
{
  return self->_bottomRule;
}

- (BOOL)isPhysicalButtonRequired
{
  return self->_physicalButtonRequired;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)requestPileSuppression
{
  return self->_requestPileSuppression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRule, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_infoButton, 0);
}

@end
