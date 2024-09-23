@implementation BEHairlineDividerView

- (BEHairlineDividerView)initWithFrame:(CGRect)a3
{
  BEHairlineDividerView *v3;
  BEHairlineDividerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEHairlineDividerView;
  v3 = -[BEHairlineDividerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BEHairlineDividerView p_init](v3, "p_init");
  return v4;
}

- (BEHairlineDividerView)initWithCoder:(id)a3
{
  BEHairlineDividerView *v3;
  BEHairlineDividerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEHairlineDividerView;
  v3 = -[BEHairlineDividerView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BEHairlineDividerView p_init](v3, "p_init");
  return v4;
}

- (void)p_init
{
  -[BEHairlineDividerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[BEHairlineDividerView setOpaque:](self, "setOpaque:", 0);
}

- (void)setHorizontal:(BOOL)a3
{
  if (self->_horizontal != a3)
  {
    self->_horizontal = a3;
    -[BEHairlineDividerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setDividerColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_dividerColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dividerColor, a3);
    -[CALayer setBackgroundColor:](self->_dividerLayer, "setBackgroundColor:", -[UIColor CGColor](self->_dividerColor, "CGColor"));
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  CALayer *v3;
  CALayer *dividerLayer;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  unsigned int v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double Width;
  CGFloat Height;
  CGFloat v24;
  CGRect v25;
  CGRect v26;

  if (!self->_dividerLayer)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    dividerLayer = self->_dividerLayer;
    self->_dividerLayer = v3;

    -[CALayer setBackgroundColor:](self->_dividerLayer, "setBackgroundColor:", -[UIColor CGColor](self->_dividerColor, "CGColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView layer](self, "layer"));
    objc_msgSend(v5, "addSublayer:", self->_dividerLayer);

  }
  -[BEHairlineDividerView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v14, "scale");
  v16 = 1.0 / v15;

  v17 = -[BEHairlineDividerView isHorizontal](self, "isHorizontal");
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  if (v17)
  {
    Width = CGRectGetWidth(*(CGRect *)&v18);
  }
  else
  {
    Height = CGRectGetHeight(*(CGRect *)&v18);
    Width = v16;
    v16 = Height;
  }
  -[CALayer setBounds:](self->_dividerLayer, "setBounds:", 0.0, 0.0, Width, v16);
  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  v24 = CGRectGetWidth(v25) * 0.5;
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  -[CALayer setPosition:](self->_dividerLayer, "setPosition:", v24, CGRectGetHeight(v26) * 0.5);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)BEHairlineDividerView;
  -[BEHairlineDividerView intrinsicContentSize](&v13, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  v10 = -[BEHairlineDividerView isHorizontal](self, "isHorizontal");
  if (v10)
    v11 = v9;
  else
    v11 = v6;
  if (v10)
    v12 = v4;
  else
    v12 = v9;
  result.height = v11;
  result.width = v12;
  return result;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (BOOL)isHorizontal
{
  return self->_horizontal;
}

- (CALayer)dividerLayer
{
  return self->_dividerLayer;
}

- (void)setDividerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dividerLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividerLayer, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end
