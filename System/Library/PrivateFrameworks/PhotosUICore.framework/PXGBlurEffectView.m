@implementation PXGBlurEffectView

- (void)layoutSubviews
{
  id v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *effectView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGBlurEffectView;
  -[PXGBlurEffectView layoutSubviews](&v10, sel_layoutSubviews);
  if (!self->_effectView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[PXGBlurEffectView bounds](self, "bounds");
    v4 = (UIVisualEffectView *)objc_msgSend(v3, "initWithFrame:");
    effectView = self->_effectView;
    self->_effectView = v4;

    -[UIVisualEffectView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
    -[PXGBlurEffectView addSubview:](self, "addSubview:", self->_effectView);
  }
  v6 = (void *)MEMORY[0x1E0DC3510];
  -[PXGBlurEffectView userData](self, "userData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  objc_msgSend(v6, "effectWithStyle:", 4015);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v8);

  -[PXGBlurEffectView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSubviewToBack:", self);

}

- (void)setUserData:(id)a3
{
  PXGBlurEffectViewConfiguration *v5;
  PXGBlurEffectViewConfiguration *v6;
  BOOL v7;
  PXGBlurEffectViewConfiguration *v8;

  v8 = (PXGBlurEffectViewConfiguration *)a3;
  v5 = self->_userData;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXGBlurEffectViewConfiguration isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      -[PXGBlurEffectView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)prepareForReuse
{
  -[PXGBlurEffectView setUserData:](self, "setUserData:", 0);
}

- (void)addHostedView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGBlurEffectView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

}

- (void)addHostedLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXGBlurEffectView contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v4);

}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGBlurEffectView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromLayer:", v7, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (UIView)contentView
{
  return -[UIVisualEffectView contentView](self->_effectView, "contentView");
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGBlurEffectViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
