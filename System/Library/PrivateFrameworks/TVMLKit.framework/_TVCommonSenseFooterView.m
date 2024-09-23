@implementation _TVCommonSenseFooterView

- (_TVCommonSenseFooterView)initWithFrame:(CGRect)a3
{
  _TVCommonSenseFooterView *v3;
  _TVCommonSenseFooterView *v4;
  UIView *v5;
  UIView *separatorView;
  UIView *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVCommonSenseFooterView;
  v3 = -[_TVCommonSenseFooterView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_TVCommonSenseFooterView setBackgroundColor:](v3, "setBackgroundColor:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v5;

    v7 = v4->_separatorView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[_TVCommonSenseFooterView addSubview:](v4, "addSubview:", v4->_separatorView);
  }
  return v4;
}

- (void)setLogoView:(id)a3
{
  UIView *v5;
  UIView **p_logoView;
  UIView *logoView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_logoView = &self->_logoView;
  logoView = self->_logoView;
  if (logoView != v5)
  {
    v9 = v5;
    if (logoView)
    {
      -[UIView removeFromSuperview](logoView, "removeFromSuperview");
      v8 = *p_logoView;
      *p_logoView = 0;

      v5 = v9;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_logoView, a3);
      -[_TVCommonSenseFooterView addSubview:](self, "addSubview:", *p_logoView);
    }
    -[_TVCommonSenseFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)_TVCommonSenseFooterView;
  -[_TVCommonSenseFooterView layoutSubviews](&v5, sel_layoutSubviews);
  -[_TVCommonSenseFooterView bounds](self, "bounds");
  v4 = v3;
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, 0.0);
  -[UIView tv_margin](self->_logoView, "tv_margin");
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.height = 1.0;
  v6.size.width = v4;
  CGRectGetHeight(v6);
  -[UIView sizeThatFits:](self->_logoView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  UIRectCenteredXInRect();
  -[UIView setFrame:](self->_logoView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[UIView sizeThatFits:](self->_logoView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v5 = v4 + 1.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UIView)logoView
{
  return self->_logoView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
