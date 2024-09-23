@implementation PKSpinnerHeaderView

- (PKSpinnerHeaderView)initWithReuseIdentifier:(id)a3
{
  PKSpinnerHeaderView *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSpinnerHeaderView;
  v3 = -[PKSpinnerHeaderView initWithReuseIdentifier:](&v7, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpinnerHeaderView;
  -[PKSpinnerHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[PKSpinnerHeaderView setShowSpinner:](self, "setShowSpinner:", 0);
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
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  double v32;
  double v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKSpinnerHeaderView;
  -[PKSpinnerHeaderView layoutSubviews](&v34, sel_layoutSubviews);
  -[PKSpinnerHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v33 = v4;
  v6 = v5;
  v31 = v5;
  objc_msgSend(v3, "layoutMargins");
  v8 = v7;
  v30 = v7;
  v10 = v9;
  v32 = v9;
  v11 = -[PKSpinnerHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKSpinnerHeaderView textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  objc_msgSend(v12, "frame");
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v16 = v15;
  v18 = v17;
  v19 = v6 - (v8 + v10);
  v20 = v15 + 10.0;
  v21 = 0.0;
  if (self->_showSpinner)
    v21 = v15 + 10.0;
  objc_msgSend(v12, "sizeThatFits:", v19 - v21, 1.79769313e308);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v23 = v22;
  v25 = v24;
  objc_msgSend(v12, "setFrame:");
  PKFloatRoundToPixel();
  v27 = v26;
  v28 = v33 + v30;
  if (v14)
    v28 = v23 + v25 + 10.0;
  v29 = v33 + v31 - v32 - v16;
  if (v14)
    v29 = v23 - v20;
  if (v11)
    v28 = v29;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v28, v27, v16, v18);

}

- (void)setShowSpinner:(BOOL)a3
{
  UIActivityIndicatorView *spinner;
  void *v5;
  void *v6;

  if (((!self->_showSpinner ^ a3) & 1) == 0)
  {
    self->_showSpinner = a3;
    spinner = self->_spinner;
    if (a3)
    {
      -[UIActivityIndicatorView superview](spinner, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[PKSpinnerHeaderView contentView](self, "contentView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSubview:", self->_spinner);

      }
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
      -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
    }
    -[PKSpinnerHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
