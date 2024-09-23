@implementation _TVLoadingView

- (_TVLoadingView)initWithFrame:(CGRect)a3
{
  _TVLoadingView *v3;
  _TVLoadingView *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVLoadingView;
  v3 = -[_TVLoadingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldShowSpinner = 1;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    -[_TVLoadingView addSubview:](v4, "addSubview:", v5);
    objc_storeWeak((id *)&v4->_spinnerView, v5);
    objc_storeWeak((id *)&v4->_spinnerContainer, v5);
    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  }
  return v4;
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
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)_TVLoadingView;
  -[_TVLoadingView layoutSubviews](&v29, sel_layoutSubviews);
  -[_TVLoadingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_TVLoadingView backgroundImageView](self, "backgroundImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(MEMORY[0x24BDF67D0], "defaultSizeForStyle:", 100);
  -[_TVLoadingView spinnerContainer](self, "spinnerContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectCenteredIntegralRect();
  objc_msgSend(v12, "setFrame:");

  -[_TVLoadingView labelContainer](self, "labelContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");

  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v14 = CGRectGetWidth(v30) + -40.0;
  -[_TVLoadingView labelContainer](self, "labelContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v14, 0.0);
  v17 = v16;

  -[_TVLoadingView spinnerContainer](self, "spinnerContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  CGRectGetMaxY(v31);

  UIRectCenteredIntegralRect();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v17 + v25 + 10.0;
  -[_TVLoadingView labelContainer](self, "labelContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v26, v22, v24);

  -[_TVLoadingView labelContainer](self, "labelContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAutoresizingMask:", 37);

}

- (void)setLoadingTitleLabel:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_loadingTitleLabel);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_loadingTitleLabel);
    objc_msgSend(v5, "removeFromSuperview");

    -[_TVLoadingView addSubview:](self, "addSubview:", obj);
    objc_storeWeak((id *)&self->_labelContainer, obj);
    objc_storeWeak((id *)&self->_loadingTitleLabel, obj);
    -[_TVLoadingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)_showSpinner
{
  void *v3;
  _BOOL4 shouldShowSpinner;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  -[_TVLoadingView spinnerView](self, "spinnerView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    shouldShowSpinner = self->_shouldShowSpinner;

    if (shouldShowSpinner)
    {
      -[_TVLoadingView loadingTitleLabel](self, "loadingTitleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVLoadingView spinnerView](self, "spinnerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDF6F90];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __30___TVLoadingView__showSpinner__block_invoke;
      v11[3] = &unk_24EB848C0;
      v12 = v5;
      v13 = v6;
      v8 = v6;
      v9 = v5;
      objc_msgSend(v7, "animateWithDuration:animations:", v11, 0.4);

    }
  }
  else
  {

  }
}

- (_TVImageView)backgroundImageView
{
  return (_TVImageView *)objc_loadWeakRetained((id *)&self->_backgroundImageView);
}

- (UIView)loadingTitleLabel
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_loadingTitleLabel);
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_spinnerView);
}

- (BOOL)shouldShowSpinner
{
  return self->_shouldShowSpinner;
}

- (void)setShouldShowSpinner:(BOOL)a3
{
  self->_shouldShowSpinner = a3;
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_spinnerContainer);
}

- (UIView)labelContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_labelContainer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_labelContainer);
  objc_destroyWeak((id *)&self->_spinnerContainer);
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_destroyWeak((id *)&self->_loadingTitleLabel);
  objc_destroyWeak((id *)&self->_backgroundImageView);
}

@end
