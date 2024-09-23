@implementation PKEnterCurrencyAmountPassView

- (PKEnterCurrencyAmountPassView)initWithCurrenyAmount:(id)a3 pass:(id)a4 withdrawal:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PKEnterCurrencyAmountPassView *v10;
  PKEnterCurrencyAmountPassView *v11;
  double v12;
  void *v13;
  void *v14;
  PKEnterCurrencyAmountView *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  PKEnterValueNewBalanceView *v20;
  void *v21;
  uint64_t v22;
  PKEnterValueNewBalanceView *balanceView;
  PKEnterValueNewBalanceView *v24;
  void *v25;
  PKEnterValueNewBalanceView *v26;
  void *v27;
  PKEnterValueNewBalanceView *v28;
  void *v29;
  UIImageView *v30;
  UIImageView *passView;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v38;
  _QWORD v39[4];
  PKEnterCurrencyAmountPassView *v40;
  objc_super v41;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v41.receiver = self;
  v41.super_class = (Class)PKEnterCurrencyAmountPassView;
  v10 = -[PKEnterCurrencyAmountPassView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a4);
    v12 = *MEMORY[0x1E0DC1448];
    PKRoundedSystemFontOfSizeAndWeight(60.0, *MEMORY[0x1E0DC1448]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKRoundedSystemFontOfSizeAndWeight(36.0, v12);
    v38 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [PKEnterCurrencyAmountView alloc];
    objc_msgSend(v8, "currency");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "amount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKEnterCurrencyAmountView initWithCurrency:amount:](v15, "initWithCurrency:amount:", v16, v17);
    enterCurrencyAmountView = v11->_enterCurrencyAmountView;
    v11->_enterCurrencyAmountView = (PKEnterCurrencyAmountView *)v18;

    -[PKEnterCurrencyAmountView setShowsDecimalPointButton:](v11->_enterCurrencyAmountView, "setShowsDecimalPointButton:", 1);
    -[PKEnterCurrencyAmountView setAmountFont:](v11->_enterCurrencyAmountView, "setAmountFont:", v13);
    -[PKEnterCurrencyAmountView setCurrencySymbolFont:](v11->_enterCurrencyAmountView, "setCurrencySymbolFont:", v14);
    -[PKEnterCurrencyAmountView setKerning:](v11->_enterCurrencyAmountView, "setKerning:", &unk_1E3FAC9F0);
    -[PKEnterCurrencyAmountView sizeToFit](v11->_enterCurrencyAmountView, "sizeToFit");
    v20 = [PKEnterValueNewBalanceView alloc];
    objc_msgSend(v8, "currency");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PKEnterValueNewBalanceView initWithCurrencyCode:](v20, "initWithCurrencyCode:", v21);
    balanceView = v11->_balanceView;
    v11->_balanceView = (PKEnterValueNewBalanceView *)v22;

    v24 = v11->_balanceView;
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_CURRENT_APPLE_PAYMENT_CASH_BALANCE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterValueNewBalanceView setPromptText:](v24, "setPromptText:", v25);

    v26 = v11->_balanceView;
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_NEW_APPLE_PAYMENT_CASH_BALANCE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterValueNewBalanceView setUpdatedBalancePromptText:](v26, "setUpdatedBalancePromptText:", v27);

    v28 = v11->_balanceView;
    PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_ENTERED_VALUE_MAXIMUM_TRANSFER"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterValueNewBalanceView setMaxLoadAmountText:](v28, "setMaxLoadAmountText:", v29);

    -[PKEnterValueNewBalanceView sizeToFit](v11->_balanceView, "sizeToFit");
    -[PKEnterValueNewBalanceView setAmountIsWithdrawal:](v11->_balanceView, "setAmountIsWithdrawal:", v38);
    v30 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    passView = v11->_passView;
    v11->_passView = v30;

    -[UIImageView setContentMode:](v11->_passView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v11->_passView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKEnterCurrencyAmountPassView addSubview:](v11, "addSubview:", v11->_enterCurrencyAmountView);
    -[PKEnterCurrencyAmountPassView addSubview:](v11, "addSubview:", v11->_balanceView);
    -[PKEnterCurrencyAmountPassView addSubview:](v11, "addSubview:", v11->_passView);
    if (v11->_pass)
    {
      v11->_loadingSnapshot = 1;
      +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEnterCurrencyAmountPassView _passViewSize](v11, "_passViewSize");
      v34 = v33;
      v36 = v35;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __71__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal___block_invoke;
      v39[3] = &unk_1E3E613B0;
      v40 = v11;
      objc_msgSend(v32, "snapshotWithPass:size:completion:", v9, v39, v34, v36);

    }
  }

  return v11;
}

void __71__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __71__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setImage:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 432));
  objc_msgSend(WeakRetained, "enterCurrencyAmountPassViewDidLoadPassSnapshot:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKEnterCurrencyAmountPassView _newBalanceHorizontalPadding](self, "_newBalanceHorizontalPadding");
  -[PKEnterValueNewBalanceView sizeThatFits:](self->_balanceView, "sizeThatFits:", width + v6 * -2.0, 1.79769313e308);
  v8 = v7 + 0.0;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", width, 1.79769313e308);
  v10 = v8 + v9;
  -[PKEnterCurrencyAmountPassView _amountPassViewSizeInfoForSize:](self, "_amountPassViewSizeInfoForSize:", width, height - (v8 + v9));
  v11 = 0.0;
  if (*(double *)(MEMORY[0x1E0C9D820] + 8) == 0.0 && *MEMORY[0x1E0C9D820] == 0.0)
    v11 = -0.0;
  v13 = v10 + v11 + 0.0 + 0.0 + 0.0;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32.receiver = self;
  v32.super_class = (Class)PKEnterCurrencyAmountPassView;
  -[PKEnterCurrencyAmountPassView layoutSubviews](&v32, sel_layoutSubviews);
  -[PKEnterCurrencyAmountPassView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v7, 1.79769313e308);
  v12 = v11;
  -[PKEnterCurrencyAmountPassView _newBalanceHorizontalPadding](self, "_newBalanceHorizontalPadding");
  -[PKEnterValueNewBalanceView sizeThatFits:](self->_balanceView, "sizeThatFits:", v8 + v13 * -2.0, 1.79769313e308);
  -[PKEnterCurrencyAmountPassView _amountPassViewSizeInfoForSize:](self, "_amountPassViewSizeInfoForSize:", v8, v10 - v12 - v14);
  if (*MEMORY[0x1E0C9D820] == 0.0 && *(double *)(MEMORY[0x1E0C9D820] + 8) == 0.0)
  {
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[UIImageView setAlpha:](self->_passView, "setAlpha:", 0.0, 0.0);
  }
  else
  {
    -[UIImageView setAlpha:](self->_passView, "setAlpha:", 1.0, 0.0);
    PKSizeAlignedInRect();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[UIImageView setFrame:](self->_passView, "setFrame:");
  }
  v33.origin.x = v17;
  v33.origin.y = v19;
  v33.size.width = v21;
  v33.size.height = v23;
  CGRectGetMaxY(v33);
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  CGRectGetMinX(v34);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  CGRectGetWidth(v35);
  PKRectCenteredXInRect();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PKEnterCurrencyAmountView setFrame:](self->_enterCurrencyAmountView, "setFrame:");
  v36.origin.x = v25;
  v36.origin.y = v27;
  v36.size.width = v29;
  v36.size.height = v31;
  CGRectGetMaxY(v36);
  PKRectCenteredXInRect();
  -[PKEnterValueNewBalanceView setFrame:](self->_balanceView, "setFrame:");
}

- (void)shakePassView
{
  -[UIImageView pkui_shakeWithCompletion:](self->_passView, "pkui_shakeWithCompletion:", 0);
}

- (CGSize)_passViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 156.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_newBalanceHorizontalPadding
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 20.0;
  if (!v2)
    return 10.0;
  return result;
}

- ($39E3A1BE27F4D54DDE9E95526D5A3B5F)_amountPassViewSizeInfoForSize:(SEL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat height;
  double v10;
  double v11;

  retstr->var3.height = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var1 = 8.0;
  if (a4.height <= 8.0)
  {
    if (a4.height > 0.0)
    {
      retstr->var0 = a4.height;
      a4.height = 0.0;
    }
  }
  else
  {
    retstr->var0 = 8.0;
    a4.height = a4.height + -8.0;
  }
  if (*(_QWORD *)&self[11].var2)
  {
    v5 = a4.height + -8.0;
    self = ($39E3A1BE27F4D54DDE9E95526D5A3B5F *)-[$39E3A1BE27F4D54DDE9E95526D5A3B5F _passViewSize](self, "_passViewSize");
    if (v7 <= v5)
    {
      retstr->var3.width = v6;
      retstr->var3.height = v7;
      v10 = v5 - v7;
      if (v5 - v7 >= 24.0)
      {
        retstr->var1 = 32.0;
        v11 = v10 + -24.0;
        if (v11 >= 32.0)
          retstr->var2 = 32.0;
        else
          retstr->var2 = v11;
      }
      else
      {
        retstr->var1 = v10 + 8.0;
      }
    }
    else
    {
      v8 = v5 / v7;
      if (v8 >= 0.8)
      {
        retstr->var3.width = v6 * v8;
        retstr->var3.height = v5;
      }
      else
      {
        retstr->var3 = (CGSize)*MEMORY[0x1E0C9D820];
      }
    }
  }
  else
  {
    height = 32.0;
    if (a4.height <= 32.0)
      height = a4.height;
    retstr->var1 = height;
    retstr->var2 = 0.0;
    retstr->var3 = (CGSize)*MEMORY[0x1E0C9D820];
  }
  return self;
}

- (PKEnterCurrencyAmountPassViewDelegate)delegate
{
  return (PKEnterCurrencyAmountPassViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (PKEnterValueNewBalanceView)balanceView
{
  return self->_balanceView;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_balanceView, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
