@implementation PLPublicURLActivityView

- (PLPublicURLActivityView)initWithFrame:(CGRect)a3 turningPublicURLON:(BOOL)a4
{
  PLPublicURLActivityView *v4;
  void *v5;
  uint64_t v6;
  UIActivityIndicatorView *spinner;
  UILabel *v8;
  UILabel *infoLabel;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLPublicURLActivityView;
  v4 = -[PLPublicURLActivityView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPublicURLActivityView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[PLPublicURLActivityView setAutoresizingMask:](v4, "setAutoresizingMask:", 2);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v6;

    -[UIActivityIndicatorView startAnimating](v4->_spinner, "startAnimating");
    -[PLPublicURLActivityView addSubview:](v4, "addSubview:", v4->_spinner);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    infoLabel = v4->_infoLabel;
    v4->_infoLabel = v8;

    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->_infoLabel, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_infoLabel, "setBackgroundColor:", v11);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_infoLabel, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_infoLabel, "setTextColor:", v12);

    -[PLPublicURLActivityView addSubview:](v4, "addSubview:", v4->_infoLabel);
  }
  return v4;
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
  double Width;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  UIActivityIndicatorView *spinner;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v22.receiver = self;
  v22.super_class = (Class)PLPublicURLActivityView;
  -[PLPublicURLActivityView layoutSubviews](&v22, sel_layoutSubviews);
  -[PLPublicURLActivityView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  Width = CGRectGetWidth(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v12 = v10;
  v13 = CGRectGetWidth(v24) - Width + -8.0;
  -[UILabel frame](self->_infoLabel, "frame");
  v15 = v14;
  v17 = v16;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v12;
  -[UILabel sizeThatFits:](self->_infoLabel, "sizeThatFits:", v13, CGRectGetHeight(v25));
  v19 = v18;
  v26.size.height = v20;
  v26.origin.x = v15;
  v26.origin.y = v17;
  v26.size.width = v19;
  CGRectGetWidth(v26);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v12;
  CGRectGetMinX(v27);
  spinner = self->_spinner;
  UIRectCenteredYInRect();
  v29 = CGRectIntegral(v28);
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  UIRectCenteredYInRect();
  v31 = CGRectIntegral(v30);
  -[UILabel setFrame:](self->_infoLabel, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
