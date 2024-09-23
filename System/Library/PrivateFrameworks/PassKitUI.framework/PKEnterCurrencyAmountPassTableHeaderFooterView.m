@implementation PKEnterCurrencyAmountPassTableHeaderFooterView

- (PKEnterCurrencyAmountPassTableHeaderFooterView)initWithCurrenyAmount:(id)a3 pass:(id)a4
{
  id v6;
  id v7;
  PKEnterCurrencyAmountPassTableHeaderFooterView *v8;
  PKEnterCurrencyAmountPassView *v9;
  PKEnterCurrencyAmountPassView *amountPassView;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKEnterCurrencyAmountPassTableHeaderFooterView;
  v8 = -[PKEnterCurrencyAmountPassTableHeaderFooterView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    v9 = -[PKEnterCurrencyAmountPassView initWithCurrenyAmount:pass:withdrawal:]([PKEnterCurrencyAmountPassView alloc], "initWithCurrenyAmount:pass:withdrawal:", v6, v7, 1);
    amountPassView = v8->_amountPassView;
    v8->_amountPassView = v9;

    -[PKEnterCurrencyAmountPassTableHeaderFooterView contentView](v8, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v8->_amountPassView);

  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PKEnterCurrencyAmountPassTableHeaderFooterView _bottomPadding](self, "_bottomPadding");
  v9 = v7 + v8;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKEnterCurrencyAmountPassTableHeaderFooterView;
  -[PKEnterCurrencyAmountPassTableHeaderFooterView layoutSubviews](&v14, sel_layoutSubviews);
  -[PKEnterCurrencyAmountPassTableHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "layoutMargins");
  -[PKEnterCurrencyAmountPassView setFrame:](self->_amountPassView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);

}

- (double)_bottomPadding
{
  void *v2;
  double v3;

  -[PKEnterCurrencyAmountPassView pass](self->_amountPassView, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 72.0;
  else
    v3 = 42.0;

  return v3;
}

- (PKEnterCurrencyAmountPassViewDelegate)delegate
{
  return (PKEnterCurrencyAmountPassViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKEnterCurrencyAmountPassView)amountPassView
{
  return self->_amountPassView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountPassView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
