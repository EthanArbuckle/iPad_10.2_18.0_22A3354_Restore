@implementation PKPaymentPassActionWidgetView

- (PKPaymentPassActionWidgetView)initWithWidgetViewStyle:(unint64_t)a3
{
  PKPaymentPassActionWidgetView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassActionWidgetView;
  v4 = -[PKPaymentPassActionWidgetView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassActionWidgetView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v4->_widgetViewStyle = a3;
  }
  return v4;
}

- (CGRect)widgetBoundsForRowWithBounds:(CGRect)result
{
  double v3;
  double v4;
  double v5;

  v3 = result.origin.x + 0.0;
  v4 = result.origin.y + 15.0;
  v5 = result.size.height + -30.0;
  result.size.height = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3
{
  double result;

  -[PKPaymentPassActionWidgetView bounds](self, "bounds");
  -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:](self, "targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:", a3);
  return result;
}

- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3 rowSize:(CGSize)a4
{
  double result;

  -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:](self, "targetWidgetWidthForRowWithNumberOfWidgets:rowBounds:", a3, 0.0, 0.0, a4.width, a4.height);
  return result;
}

- (double)targetWidgetWidthForRowWithNumberOfWidgets:(unint64_t)a3 rowBounds:(CGRect)a4
{
  double v5;

  -[PKPaymentPassActionWidgetView widgetBoundsForRowWithBounds:](self, "widgetBoundsForRowWithBounds:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return fmax((v5 + (double)(a3 - 1) * -10.0) / (double)a3, 0.0);
}

- (void)layoutSubviews
{
  NSUInteger v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRectEdge v10;
  unint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t numberOfWidgetsPerRow;
  unint64_t i;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  CGRect slice;
  CGRect v24;
  CGRect remainder;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPassActionWidgetView;
  -[PKPaymentPassActionWidgetView layoutSubviews](&v26, sel_layoutSubviews);
  v3 = -[NSArray count](self->_displayableWidgets, "count");
  -[PKPaymentPassActionWidgetView updateNumberOfWidgetsPerRow](self, "updateNumberOfWidgetsPerRow");
  if (v3)
  {
    -[PKPaymentPassActionWidgetView bounds](self, "bounds");
    -[PKPaymentPassActionWidgetView widgetBoundsForRowWithBounds:](self, "widgetBoundsForRowWithBounds:");
    v5 = v4;
    v7 = v6;
    remainder.origin.x = v8;
    remainder.origin.y = v9;
    v10 = -[PKPaymentPassActionWidgetView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection")? CGRectMaxXEdge: CGRectMinXEdge;
    remainder.size.width = v5;
    remainder.size.height = v7;
    memset(&v24, 0, sizeof(v24));
    memset(&slice, 0, sizeof(slice));
    v11 = -[PKPaymentPassActionWidgetView numberOfRows](self, "numberOfRows");
    -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:](self, "targetWidgetWidthForRowWithNumberOfWidgets:", self->_numberOfWidgetsPerRow);
    v13 = v12;
    +[PKPaymentPassActionWidgetButton widgetHeightWithAccessibilityLayout:](PKPaymentPassActionWidgetButton, "widgetHeightWithAccessibilityLayout:", -[PKPaymentPassActionWidgetView hasSingleColumnLayout](self, "hasSingleColumnLayout"));
    v22 = v11;
    if (v11)
    {
      v15 = v14;
      v16 = 0;
      v17 = v11 - 1;
      do
      {
        CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
        numberOfWidgetsPerRow = self->_numberOfWidgetsPerRow;
        if (numberOfWidgetsPerRow)
        {
          for (i = 0; i < numberOfWidgetsPerRow; ++i)
          {
            if (i + v16 * numberOfWidgetsPerRow < v3)
            {
              -[NSArray objectAtIndex:](self->_displayableWidgets, "objectAtIndex:");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              PKSizeAlignedInRect();
              objc_msgSend(v20, "setFrame:");
              CGRectDivide(slice, &v24, &slice, v13, v10);
              v21 = self->_numberOfWidgetsPerRow;
              if (v21 <= 1)
                v21 = 1;
              if (i != v21 - 1)
                CGRectDivide(slice, &v24, &slice, 10.0, v10);

              numberOfWidgetsPerRow = self->_numberOfWidgetsPerRow;
            }
          }
        }
        if (v17 != v16)
          CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
        ++v16;
      }
      while (v16 != v22);
    }
  }
}

- (BOOL)_bankConnectHasDigitalServicing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PKPaymentPassActionWidgetView bankConnectAccount](self, "bankConnectAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "digitalServicingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canOpenURL:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_determineWidgetContentWithAvailableWidgets
{
  double v3;
  CGFloat v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSArray *v21;
  void *WeakRetained;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  _BOOL4 v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  int v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  char v57;
  int v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  NSArray *v70;
  NSArray *displayableWidgets;

  -[PKPaymentPassActionWidgetView cleanUpExistingWidgets](self, "cleanUpExistingWidgets");
  +[PKPaymentPassActionWidgetButton glyphImageHeight:](PKPaymentPassActionWidgetButton, "glyphImageHeight:", -[PKPaymentPassActionWidgetView hasSingleColumnLayout](self, "hasSingleColumnLayout"));
  v4 = v3;
  if (!self->_account)
    goto LABEL_18;
  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_paymentPass, "associatedAccountServiceAccountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {

LABEL_18:
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
      v23 = objc_opt_respondsToSelector() ^ 1;
    else
      LOBYTE(v23) = 1;
    v24 = -[PKAccount type](self->_account, "type");
    -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_paymentPass, "associatedAccountServiceAccountIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26)
      v27 = 1;
    else
      v27 = v24 == 4;
    v28 = v27 && self->_hasBusinessChatIdentifier;
    if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat")&& !(v23 & 1 | (((v28 | -[PKPaymentPassActionWidgetView _bankConnectHasDigitalServicing](self, "_bankConnectHasDigitalServicing")) & 1) == 0)))
    {
      PKPassKitUIBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URLForResource:withExtension:", CFSTR("MessageWidgetIcon"), CFSTR("pdf"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = PKUIScreenScale();
      PKUIImageFromPDF(v30, 1.79769313e308, v4, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("MESSAGE"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v33, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D58]);
      objc_msgSend(v34, "addTarget:action:forControlEvents:", WeakRetained, sel_openBusinessChat, 64);
      objc_msgSend(v8, "addObject:", v34);

    }
    v35 = -[NSString length](self->_phoneNumber, "length");
    v36 = -[NSString length](self->_website, "length");
    v37 = -[NSString length](self->_email, "length");
    v41 = (unint64_t)objc_msgSend(v8, "count") < 2 && v35 == 0 && v36 == 0 && v37 == 0;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2 && v35 && v36 && v37)
    {
      if (WeakRetained)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_69:
          if ((objc_opt_respondsToSelector() & 1) != 0 && v36)
          {
            PKPassKitUIBundle();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "URLForResource:withExtension:", CFSTR("SafariWidgetIcon"), CFSTR("pdf"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = PKUIScreenScale();
            PKUIImageFromPDF(v65, 1.79769313e308, v4, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            PKLocalizedPaymentString(CFSTR("WEBSITE"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v68, v67);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v69, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681D8]);
            objc_msgSend(v69, "addTarget:action:forControlEvents:", WeakRetained, sel_openIssuerWebsite, 64);
            objc_msgSend(v69, "setEnabled:", 1);
            objc_msgSend(v8, "addObject:", v69);

          }
          goto LABEL_72;
        }
        PKPassKitUIBundle();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "URLForResource:withExtension:", CFSTR("ContactWidgetIcon"), CFSTR("pdf"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = PKUIScreenScale();
        PKUIImageFromPDF(v43, 1.79769313e308, v4, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("CONTACT"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v46, v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A30]);
        objc_msgSend(v47, "addTarget:action:forControlEvents:", WeakRetained, sel_presentContactIssuerSheet, 64);
LABEL_68:
        objc_msgSend(v8, "addObject:", v47);

        goto LABEL_69;
      }
    }
    else if (WeakRetained)
    {
      v48 = objc_opt_respondsToSelector();
      if (v35)
        v49 = 1;
      else
        v49 = v41;
      if ((v48 & 1) != 0 && v49)
      {
        PKPassKitUIBundle();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "URLForResource:withExtension:", CFSTR("PhoneWidgetIcon"), CFSTR("pdf"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = PKUIScreenScale();
        PKUIImageFromPDF(v51, 1.79769313e308, v4, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("CALL"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v54, v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679B8]);
        objc_msgSend(v55, "addTarget:action:forControlEvents:", WeakRetained, sel_callIssuer, 64);
        objc_msgSend(v55, "setEnabled:", v35 != 0);
        objc_msgSend(v8, "addObject:", v55);
        v41 = (unint64_t)objc_msgSend(v8, "count") < 2 && (v36 | v37) == 0;

      }
      v57 = objc_opt_respondsToSelector();
      if (v37)
        v58 = 1;
      else
        v58 = v41;
      if ((v57 & 1) == 0 || !v58)
        goto LABEL_69;
      v59 = v37 != 0;
      PKPassKitUIBundle();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "URLForResource:withExtension:", CFSTR("EmailWidgetIcon"), CFSTR("pdf"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = PKUIScreenScale();
      PKUIImageFromPDF(v61, 1.79769313e308, v4, v62);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("EMAIL"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v63, v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B38]);
      objc_msgSend(v47, "addTarget:action:forControlEvents:", WeakRetained, sel_emailIssuer, 64);
      objc_msgSend(v47, "setEnabled:", v59);
      goto LABEL_68;
    }
LABEL_72:
    v70 = (NSArray *)objc_msgSend(v8, "copy");
    displayableWidgets = self->_displayableWidgets;
    self->_displayableWidgets = v70;

LABEL_73:
    goto LABEL_74;
  }
  v7 = -[PKAccount feature](self->_account, "feature");

  if (v7 != 4)
    goto LABEL_18;
  if (PKCanShowAppleBalanceTopUpOptions())
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[PKAccount supportsAMPRedeemGiftcard](self->_account, "supportsAMPRedeemGiftcard"))
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemImageNamed:withConfiguration:", CFSTR("giftcard.fill"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedLynxString(CFSTR("PASS_DETAILS_REDEEM_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v13, "addTarget:action:forControlEvents:", v14, sel_redeemGiftCard, 64);
      objc_msgSend(v8, "addObject:", v13);

    }
    if ((-[PKAccount supportsTopUp](self->_account, "supportsTopUp") & 1) != 0
      || -[PKAccount supportsAMPTopUp](self->_account, "supportsAMPTopUp"))
    {
      v15 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemImageNamed:withConfiguration:", CFSTR("dollarsign.square.fill"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedLynxString(CFSTR("PASS_DETAILS_ADD_MONEY_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassActionWidgetView _createButtonForTitle:image:](self, "_createButtonForTitle:image:", v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "addTarget:action:forControlEvents:", v20, sel_addMoney, 64);
      objc_msgSend(v8, "addObject:", v19);

    }
    v21 = (NSArray *)objc_msgSend(v8, "copy");
    WeakRetained = self->_displayableWidgets;
    self->_displayableWidgets = v21;
    goto LABEL_73;
  }
LABEL_74:
  -[PKPaymentPassActionWidgetView updateUseAccessibilityLayout](self, "updateUseAccessibilityLayout");
  -[PKPaymentPassActionWidgetView updateWidgetsAccessibilityLayoutState](self, "updateWidgetsAccessibilityLayoutState");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v5 = -[PKPaymentPassActionWidgetView numberOfWidgetsPerRowWithSize:](self, "numberOfWidgetsPerRowWithSize:", a3.width, a3.height);
  v6 = -[PKPaymentPassActionWidgetView numberOfRowsWithWidgetsPerRow:](self, "numberOfRowsWithWidgetsPerRow:", v5);
  if (v6)
  {
    v7 = v6;
    v8 = v5 == 1 || self->_usesAccessibilityLayout;
    +[PKPaymentPassActionWidgetButton widgetHeightWithAccessibilityLayout:](PKPaymentPassActionWidgetButton, "widgetHeightWithAccessibilityLayout:", v8);
    v9 = (double)(v7 - 1) * 10.0 + (double)v7 * v10 + 30.0;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v11 = width;
  result.height = v9;
  result.width = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassActionWidgetView;
  v4 = a3;
  -[PKPaymentPassActionWidgetView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PKPaymentPassActionWidgetView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v6);
  if ((v4 & 1) == 0)
  {
    -[PKPaymentPassActionWidgetView updateUseAccessibilityLayout](self, "updateUseAccessibilityLayout");
    -[PKPaymentPassActionWidgetView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPaymentPass:(id)a3
{
  PKPaymentPass **p_paymentPass;
  NSString *v6;
  NSString *phoneNumber;
  NSString *v8;
  NSString *website;
  NSString *v10;
  NSString *email;
  void *v12;
  id WeakRetained;
  id v14;

  p_paymentPass = &self->_paymentPass;
  v14 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_paymentPass, a3);
    -[PKPaymentPass localizedValueForFieldKey:](*p_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    phoneNumber = self->_phoneNumber;
    self->_phoneNumber = v6;

    -[PKPaymentPass localizedValueForFieldKey:](*p_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADF0]);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    website = self->_website;
    self->_website = v8;

    -[PKPaymentPass localizedValueForFieldKey:](*p_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    email = self->_email;
    self->_email = v10;

    -[PKPaymentPass businessChatIdentifier](*p_paymentPass, "businessChatIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasBusinessChatIdentifier = objc_msgSend(v12, "length") != 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
      -[PKPaymentPassActionWidgetView _determineWidgetContentWithAvailableWidgets](self, "_determineWidgetContentWithAvailableWidgets");
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (self->_paymentPass)
    -[PKPaymentPassActionWidgetView _determineWidgetContentWithAvailableWidgets](self, "_determineWidgetContentWithAvailableWidgets");
}

- (void)setAccount:(id)a3
{
  PKAccount **p_account;
  void *v6;
  NSString *v7;
  NSString *phoneNumber;
  void *v9;
  NSString *v10;
  NSString *website;
  void *v12;
  id v13;

  p_account = &self->_account;
  v13 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_account, a3);
    if (-[PKAccount type](*p_account, "type") == 4)
    {
      -[PKAccount savingsDetails](*p_account, "savingsDetails");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contactNumber");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      phoneNumber = self->_phoneNumber;
      self->_phoneNumber = v7;

      objc_msgSend(v6, "contactWebsite");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      website = self->_website;
      self->_website = v10;

      objc_msgSend(v6, "businessChatIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasBusinessChatIdentifier = objc_msgSend(v12, "length") != 0;

    }
    -[PKPaymentPassActionWidgetView _determineWidgetContentWithAvailableWidgets](self, "_determineWidgetContentWithAvailableWidgets");
  }

}

- (void)setPeerPaymentAccount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
    -[PKPaymentPassActionWidgetView _determineWidgetContentWithAvailableWidgets](self, "_determineWidgetContentWithAvailableWidgets");
  }

}

- (void)setBankConnectAccount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bankConnectAccount, a3);
    if (self->_paymentPass)
      -[PKPaymentPassActionWidgetView _determineWidgetContentWithAvailableWidgets](self, "_determineWidgetContentWithAvailableWidgets");
  }

}

- (void)setCurrentUser:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentUser, a3);
    if (self->_paymentPass)
      -[PKPaymentPassActionWidgetView _determineWidgetContentWithAvailableWidgets](self, "_determineWidgetContentWithAvailableWidgets");
  }

}

- (BOOL)hasEnabledWidgets
{
  return -[NSArray pk_containsObjectPassingTest:](self->_displayableWidgets, "pk_containsObjectPassingTest:", &__block_literal_global_112);
}

uint64_t __50__PKPaymentPassActionWidgetView_hasEnabledWidgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

- (id)_createButtonForTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassActionWidgetButton *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPaymentPassActionWidgetButton initWithWidgetViewStyle:]([PKPaymentPassActionWidgetButton alloc], "initWithWidgetViewStyle:", self->_widgetViewStyle);
  -[PKPaymentPassActionWidgetButton setUsesAccessibilityLayout:](v8, "setUsesAccessibilityLayout:", -[PKPaymentPassActionWidgetView hasSingleColumnLayout](self, "hasSingleColumnLayout"));
  -[PKPaymentPassActionWidgetButton setTitle:forState:](v8, "setTitle:forState:", v7, 0);

  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassActionWidgetButton setImage:forState:](v8, "setImage:forState:", v9, 0);
  -[PKPaymentPassActionWidgetView addSubview:](self, "addSubview:", v8);

  return v8;
}

- (void)updateUseAccessibilityLayout
{
  NSString *v3;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]) != NSOrderedAscending;
  -[PKPaymentPassActionWidgetView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)hasSingleColumnLayout
{
  return self->_usesAccessibilityLayout || self->_numberOfWidgetsPerRow == 1;
}

- (void)updateNumberOfWidgetsPerRow
{
  double v3;
  double v4;
  unint64_t v5;

  -[PKPaymentPassActionWidgetView bounds](self, "bounds");
  v5 = -[PKPaymentPassActionWidgetView numberOfWidgetsPerRowWithSize:](self, "numberOfWidgetsPerRowWithSize:", v3, v4);
  if (v5 != self->_numberOfWidgetsPerRow)
  {
    self->_numberOfWidgetsPerRow = v5;
    -[PKPaymentPassActionWidgetView updateWidgetsAccessibilityLayoutState](self, "updateWidgetsAccessibilityLayoutState");
  }
}

- (unint64_t)numberOfWidgetsPerRowWithSize:(CGSize)a3
{
  double height;
  double width;
  NSUInteger v6;
  unint64_t v8;
  NSString *v9;
  NSComparisonResult v10;
  unint64_t v12;
  uint64_t v13;
  NSArray *displayableWidgets;
  uint64_t v15;
  unsigned int v16;
  _QWORD v18[7];

  height = a3.height;
  width = a3.width;
  v6 = -[NSArray count](self->_displayableWidgets, "count");
  if (self->_usesAccessibilityLayout && v6 != 0)
    return 1;
  v8 = v6;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]);

  if (v8 == 4 && v10 == NSOrderedDescending)
  {
    v12 = 2;
  }
  else
  {
    v12 = v8;
    if (v8 < 2)
      return v8;
  }
  v13 = MEMORY[0x1E0C809B0];
  do
  {
    if (ldiv(v8, v12).rem == 1)
    {
      --v12;
    }
    else
    {
      -[PKPaymentPassActionWidgetView targetWidgetWidthForRowWithNumberOfWidgets:rowSize:](self, "targetWidgetWidthForRowWithNumberOfWidgets:rowSize:", v12, width, height);
      displayableWidgets = self->_displayableWidgets;
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __63__PKPaymentPassActionWidgetView_numberOfWidgetsPerRowWithSize___block_invoke;
      v18[3] = &__block_descriptor_56_e41_B16__0__PKPaymentPassActionWidgetButton_8l;
      *(double *)&v18[4] = width;
      *(double *)&v18[5] = height;
      v18[6] = v15;
      v16 = -[NSArray pk_containsObjectPassingTest:](displayableWidgets, "pk_containsObjectPassingTest:", v18);
      v12 -= v16;
      if (!v16)
        return v12;
    }
  }
  while (v12 > 1);
  return v12;
}

BOOL __63__PKPaymentPassActionWidgetView_numberOfWidgetsPerRowWithSize___block_invoke(double *a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "sizeThatFits:", a1[4], a1[5]);
  return v3 > a1[6];
}

- (unint64_t)numberOfRows
{
  return -[PKPaymentPassActionWidgetView numberOfRowsWithWidgetsPerRow:](self, "numberOfRowsWithWidgetsPerRow:", self->_numberOfWidgetsPerRow);
}

- (unint64_t)numberOfRowsWithWidgetsPerRow:(unint64_t)a3
{
  unint64_t result;
  ldiv_t v4;

  if (!a3)
    return 0;
  v4 = ldiv(-[NSArray count](self->_displayableWidgets, "count"), a3);
  result = v4.quot;
  if (v4.rem)
    return v4.quot + 1;
  return result;
}

- (void)updateWidgetsAccessibilityLayoutState
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPaymentPassActionWidgetView hasSingleColumnLayout](self, "hasSingleColumnLayout");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_displayableWidgets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setUsesAccessibilityLayout:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)cleanUpExistingWidgets
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *displayableWidgets;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_displayableWidgets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  displayableWidgets = self->_displayableWidgets;
  self->_displayableWidgets = 0;

}

- (PKAccount)account
{
  return self->_account;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (FKAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKPaymentPassActionWidgetViewDelegate)delegate
{
  return (PKPaymentPassActionWidgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKFamilyMember)currentUser
{
  return self->_currentUser;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_displayableWidgets, 0);
}

@end
