@implementation PKBorderedButton

+ (id)borderedButtonWithConfiguration:(id)a3 primaryAction:(id)a4
{
  void *v4;

  objc_msgSend(a1, "buttonWithConfiguration:primaryAction:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateForConfigurationChange");
  return v4;
}

- (void)setBorderConfiguration:(id)a3
{
  -[PKBorderedButton setConfiguration:](self, "setConfiguration:", a3);
  -[PKBorderedButton _updateForConfigurationChange](self, "_updateForConfigurationChange");
}

- (void)_updateForConfigurationChange
{
  void *v3;
  char v4;
  void *v5;
  UIView *topBorder;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *bottomBorder;
  UIView *v11;
  UIView *v12;
  UIView *v13;
  UIView *trailingBorder;
  UIView *v15;
  UIView *v16;
  UIView *v17;
  UIView *leadingBorder;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  id v22;

  -[PKBorderedButton borderConfiguration](self, "borderConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = v3;
    v4 = objc_msgSend(v3, "border");
    objc_msgSend(v22, "borderColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    topBorder = self->_topBorder;
    if ((v4 & 1) != 0)
    {
      if (!topBorder)
      {
        v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v9 = self->_topBorder;
        self->_topBorder = v8;

        -[UIView setBackgroundColor:](self->_topBorder, "setBackgroundColor:", v5);
        -[PKBorderedButton addSubview:](self, "addSubview:", self->_topBorder);
      }
    }
    else
    {
      -[UIView removeFromSuperview](topBorder, "removeFromSuperview");
      v7 = self->_topBorder;
      self->_topBorder = 0;

    }
    bottomBorder = self->_bottomBorder;
    if ((v4 & 2) != 0)
    {
      if (!bottomBorder)
      {
        v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v13 = self->_bottomBorder;
        self->_bottomBorder = v12;

        -[UIView setBackgroundColor:](self->_bottomBorder, "setBackgroundColor:", v5);
        -[PKBorderedButton addSubview:](self, "addSubview:", self->_bottomBorder);
      }
    }
    else
    {
      -[UIView removeFromSuperview](bottomBorder, "removeFromSuperview");
      v11 = self->_bottomBorder;
      self->_bottomBorder = 0;

    }
    trailingBorder = self->_trailingBorder;
    if ((v4 & 4) != 0)
    {
      if (!trailingBorder)
      {
        v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v17 = self->_trailingBorder;
        self->_trailingBorder = v16;

        -[UIView setBackgroundColor:](self->_trailingBorder, "setBackgroundColor:", v5);
        -[PKBorderedButton addSubview:](self, "addSubview:", self->_trailingBorder);
      }
    }
    else
    {
      -[UIView removeFromSuperview](trailingBorder, "removeFromSuperview");
      v15 = self->_trailingBorder;
      self->_trailingBorder = 0;

    }
    leadingBorder = self->_leadingBorder;
    if ((v4 & 8) != 0)
    {
      if (!leadingBorder)
      {
        v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v21 = self->_leadingBorder;
        self->_leadingBorder = v20;

        -[UIView setBackgroundColor:](self->_leadingBorder, "setBackgroundColor:", v5);
        -[PKBorderedButton addSubview:](self, "addSubview:", self->_leadingBorder);
      }
    }
    else
    {
      -[UIView removeFromSuperview](leadingBorder, "removeFromSuperview");
      v19 = self->_leadingBorder;
      self->_leadingBorder = 0;

    }
    v3 = v22;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKBorderedButton;
  -[PKBorderedButton layoutSubviews](&v10, sel_layoutSubviews);
  -[PKBorderedButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKBorderedButton borderConfiguration](self, "borderConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "borderWidth");
  v9 = v8;

  -[UIView setFrame:](self->_topBorder, "setFrame:", 0.0, 0.0, v4, v9);
  -[UIView setFrame:](self->_bottomBorder, "setFrame:", 0.0, v6 - v9, v4, v9);
  -[UIView setFrame:](self->_trailingBorder, "setFrame:", v4 - v9, 0.0, v9, v6);
  -[UIView setFrame:](self->_leadingBorder, "setFrame:", 0.0, 0.0, v9, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingBorder, 0);
  objc_storeStrong((id *)&self->_trailingBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
}

@end
