@implementation PKPerformActionLoadingView

- (PKPerformActionLoadingView)initWithFrame:(CGRect)a3
{
  PKPerformActionLoadingView *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  id v6;
  uint64_t v7;
  UILabel *loadingLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPerformActionLoadingView;
  v3 = -[PKPerformActionLoadingView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    -[PKPerformActionLoadingView addSubview:](v3, "addSubview:", v3->_spinner);
    -[UIActivityIndicatorView startAnimating](v3->_spinner, "startAnimating");
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    loadingLabel = v3->_loadingLabel;
    v3->_loadingLabel = (UILabel *)v7;

    v9 = v3->_loadingLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = v3->_loadingLabel;
    PKLocalizedPaymentString(CFSTR("PERFORM_ACTION_LOADING"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v12);

    v13 = v3->_loadingLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[PKPerformActionLoadingView addSubview:](v3, "addSubview:", v3->_loadingLabel);
  }
  return v3;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)PKPerformActionLoadingView;
  -[PKPerformActionLoadingView layoutSubviews](&v17, sel_layoutSubviews);
  -[PKPerformActionLoadingView bounds](self, "bounds");
  PKFloatRoundToPixel();
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
  -[UILabel sizeToFit](self->_loadingLabel, "sizeToFit");
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel frame](self->_loadingLabel, "frame");
  UIRectCenteredXInRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v12, CGRectGetMaxY(v18) + 10.0, v14, v16);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (UILabel)loadingLabel
{
  return self->_loadingLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
