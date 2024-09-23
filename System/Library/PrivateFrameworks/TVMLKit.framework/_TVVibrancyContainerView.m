@implementation _TVVibrancyContainerView

- (_TVVibrancyContainerView)initWithEffect:(id)a3 containingView:(id)a4
{
  id v6;
  _TVVibrancyContainerView *v7;
  _TVVibrancyContainerView *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_TVVibrancyContainerView;
  v7 = -[_TVVibrancyContainerView initWithEffect:](&v11, sel_initWithEffect_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_containedView, v6);
    -[_TVVibrancyContainerView contentView](v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v6);

  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVVibrancyContainerView containedView](self, "containedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVVibrancyContainerView;
  -[_TVVibrancyContainerView layoutSubviews](&v6, sel_layoutSubviews);
  -[_TVVibrancyContainerView containedView](self, "containedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[_TVVibrancyContainerView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:", v4, v5);

}

- (UIView)containedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containedView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containedView);
}

@end
