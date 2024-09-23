@implementation VUIAppSpinnerView

- (void)layoutSubviews
{
  void *v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *spinner;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIAppSpinnerView;
  -[VUIAppSpinnerView layoutSubviews](&v12, sel_layoutSubviews);
  if (!self->_didLayout)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppSpinnerView setBackgroundColor:](self, "setBackgroundColor:", v3);

    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v4;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    -[VUIAppSpinnerView addSubview:](self, "addSubview:", self->_spinner);
    -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppSpinnerView centerXAnchor](self, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppSpinnerView centerYAnchor](self, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    self->_didLayout = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
