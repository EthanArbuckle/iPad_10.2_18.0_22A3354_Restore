@implementation VUISpinnerHeaderView

- (VUISpinnerHeaderView)initWithSpecifier:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  VUISpinnerHeaderView *v10;
  void *v11;
  uint64_t v12;
  UILabel *text;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIActivityIndicatorView *spinner;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VUISpinnerHeaderView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[VUISpinnerHeaderView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISpinnerHeaderView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[VUISpinnerHeaderView setAutoresizingMask:](v10, "setAutoresizingMask:", 2);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    text = v10->_text;
    v10->_text = (UILabel *)v12;

    v14 = v10->_text;
    objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultFontForTableViewStyle:isSectionHeader:", 1, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    v16 = v10->_text;
    objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    objc_msgSend(v5, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_text, "setText:", v19);

    -[VUISpinnerHeaderView addSubview:](v10, "addSubview:", v10->_text);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v10->_spinner;
    v10->_spinner = (UIActivityIndicatorView *)v20;

    -[UIActivityIndicatorView setHidesWhenStopped:](v10->_spinner, "setHidesWhenStopped:", 1);
    -[VUISpinnerHeaderView addSubview:](v10, "addSubview:", v10->_spinner);
    -[UIActivityIndicatorView startAnimating](v10->_spinner, "startAnimating");
    objc_storeStrong((id *)&v10->_specifier, a3);
  }

  return v10;
}

- (void)showText
{
  void *v3;
  id v4;

  -[PSSpecifier name](self->_specifier, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_text, "setText:", v3);

}

- (void)hideText
{
  -[UILabel setText:](self->_text, "setText:", &stru_1E9FF3598);
}

- (void)showSpinner
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)hideSpinner
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;

  -[UIActivityIndicatorView frame](self->_spinner, "frame", a3);
  return v3 + 24.0;
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
  id *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27.receiver = self;
  v27.super_class = (Class)VUISpinnerHeaderView;
  -[VUISpinnerHeaderView layoutSubviews](&v27, sel_layoutSubviews);
  -[UILabel sizeToFit](self->_text, "sizeToFit");
  -[UILabel frame](self->_text, "frame");
  v4 = v3;
  v6 = v5;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v8 = v7;
  v10 = v9;
  v11 = (id *)MEMORY[0x1E0DC4730];
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection"))
  {
    -[VUISpinnerHeaderView bounds](self, "bounds");
    v13 = v12;
    -[VUISpinnerHeaderView superview](self, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_backgroundInset");
    v16 = v13 - v15;
    PreferencesTableViewCellLeftPad();
    v18 = v16 - v17 - v4;
  }
  else
  {
    -[VUISpinnerHeaderView superview](self, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_backgroundInset");
    v20 = v19;
    PreferencesTableViewCellLeftPad();
    v18 = v20 + v21;
  }

  -[VUISpinnerHeaderView frame](self, "frame");
  v23 = floor((v22 - v6) * 0.5);
  if (objc_msgSend(*v11, "userInterfaceLayoutDirection"))
    v24 = v18 + -10.0 - v8;
  else
    v24 = v4 + v18 + 10.0;
  -[VUISpinnerHeaderView frame](self, "frame");
  v26 = floor((v25 - v10) * 0.5);
  v28.origin.x = v18;
  v28.origin.y = v23;
  v28.size.width = v4;
  v28.size.height = v6;
  v29 = CGRectIntegral(v28);
  -[UILabel setFrame:](self->_text, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  v30.origin.x = v24;
  v30.origin.y = v26;
  v30.size.width = v8;
  v30.size.height = v10;
  v31 = CGRectIntegral(v30);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
