@implementation PKAccountBillPaymentAmountContainerView

- (PKAccountBillPaymentAmountContainerView)initWithCurrencyCode:(id)a3 minimumAmount:(id)a4
{
  id v6;
  id v7;
  PKAccountBillPaymentAmountContainerView *v8;
  PKAccountBillPaymentAmountContainerView *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKEnterCurrencyAmountView *v17;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  PKEnterCurrencyAmountView *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKAccountBillPaymentAmountContainerView;
  v8 = -[PKAccountBillPaymentAmountContainerView init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PKAccountBillPaymentAmountContainerView _amountLabelFontSize](v8, "_amountLabelFontSize");
    v11 = v10;
    v12 = *MEMORY[0x1E0DC1438];
    PKRoundedSystemFontOfSizeAndWeight(v10, *MEMORY[0x1E0DC1438]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pk_fixedWidthFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    PKRoundedSystemFontOfSizeAndWeight(v11 * 0.5, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pk_fixedWidthFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[PKEnterCurrencyAmountView initWithCurrency:amount:]([PKEnterCurrencyAmountView alloc], "initWithCurrency:amount:", v6, v7);
    enterCurrencyAmountView = v9->_enterCurrencyAmountView;
    v9->_enterCurrencyAmountView = v17;

    v19 = v9->_enterCurrencyAmountView;
    +[PKAccountBillPaymentViewController backgroundColor](PKAccountBillPaymentViewController, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterCurrencyAmountView setKeyboardColor:](v19, "setKeyboardColor:", v20);

    -[PKEnterCurrencyAmountView setShowsDecimalPointButton:](v9->_enterCurrencyAmountView, "setShowsDecimalPointButton:", 1);
    -[PKEnterCurrencyAmountView setAmountFont:](v9->_enterCurrencyAmountView, "setAmountFont:", v14);
    -[PKEnterCurrencyAmountView setCurrencySymbolFont:](v9->_enterCurrencyAmountView, "setCurrencySymbolFont:", v16);
    -[PKEnterCurrencyAmountView setKerning:](v9->_enterCurrencyAmountView, "setKerning:", &unk_1E3FACA50);
    -[PKEnterCurrencyAmountView setIgnoreIntegralNumber:](v9->_enterCurrencyAmountView, "setIgnoreIntegralNumber:", 1);
    -[PKEnterCurrencyAmountView sizeToFit](v9->_enterCurrencyAmountView, "sizeToFit");
    -[PKEnterCurrencyAmountView setShowsDecimalPointButton:](v9->_enterCurrencyAmountView, "setShowsDecimalPointButton:", 1);
    -[PKEnterCurrencyAmountView setClearAmountOnFirstKeyboardInput:](v9->_enterCurrencyAmountView, "setClearAmountOnFirstKeyboardInput:", 1);
    -[PKAccountBillPaymentAmountContainerView addSubview:](v9, "addSubview:", v9->_enterCurrencyAmountView);
    -[PKAccountBillPaymentAmountContainerView setHidden:](v9, "setHidden:", !v9->_showAmount);

  }
  return v9;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  CGAffineTransform *v23;
  PKEnterCurrencyAmountView *v24;
  double MidX;
  double v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29.receiver = self;
  v29.super_class = (Class)PKAccountBillPaymentAmountContainerView;
  -[PKAccountBillPaymentAmountContainerView layoutSubviews](&v29, sel_layoutSubviews);
  -[PKAccountBillPaymentAmountContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v7, 1.79769313e308);
  PKRectCenteredXInRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (self->_showAmount)
  {
    PKRectCenteredYInRect();
    v12 = v17;
    v19 = v18;
    v14 = v20;
    v16 = v21;
    enterCurrencyAmountView = self->_enterCurrencyAmountView;
    CGAffineTransformMakeScale(&v28, 1.0, 1.0);
    v23 = &v28;
  }
  else
  {
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    v19 = v16 + CGRectGetMaxY(v30);
    enterCurrencyAmountView = self->_enterCurrencyAmountView;
    CGAffineTransformMakeScale(&v27, 0.05, 0.05);
    v23 = &v27;
  }
  -[PKEnterCurrencyAmountView setTransform:](enterCurrencyAmountView, "setTransform:", v23);
  -[PKEnterCurrencyAmountView setBounds:](self->_enterCurrencyAmountView, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v16);
  v24 = self->_enterCurrencyAmountView;
  v31.origin.x = v12;
  v31.origin.y = v19;
  v31.size.width = v14;
  v31.size.height = v16;
  MidX = CGRectGetMidX(v31);
  v32.origin.x = v12;
  v32.origin.y = v19;
  v32.size.width = v14;
  v32.size.height = v16;
  -[PKEnterCurrencyAmountView setCenter:](v24, "setCenter:", MidX, CGRectGetMidY(v32));
  v26 = 1.0;
  if (!self->_showAmount)
    v26 = 0.0;
  -[PKEnterCurrencyAmountView setAlpha:](self->_enterCurrencyAmountView, "setAlpha:", v26);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setShowAmount:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  _QWORD v7[5];

  if (((!self->_showAmount ^ a3) & 1) == 0)
  {
    -[PKAccountBillPaymentAmountContainerView layoutIfNeeded](self, "layoutIfNeeded");
    self->_showAmount = a3;
    -[PKAccountBillPaymentAmountContainerView setNeedsLayout](self, "setNeedsLayout");
    -[PKAccountBillPaymentAmountContainerView setHidden:](self, "setHidden:", 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke;
    v7[3] = &unk_1E3E612E8;
    v7[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke_2;
    v5[3] = &unk_1E3E65288;
    v5[4] = self;
    v6 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, v5);
  }
}

uint64_t __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

- (double)_amountLabelFontSize
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 57.0;
  if (!v2)
    return 42.0;
  return result;
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (void)setEnterCurrencyAmountView:(id)a3
{
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, a3);
}

- (BOOL)showAmount
{
  return self->_showAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
}

@end
