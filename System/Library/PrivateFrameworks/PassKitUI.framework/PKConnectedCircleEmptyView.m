@implementation PKConnectedCircleEmptyView

- (PKConnectedCircleEmptyView)initWithOuterColor:(id)a3 innerColor:(id)a4
{
  id v7;
  id v8;
  PKConnectedCircleEmptyView *v9;
  PKConnectedCircleEmptyView *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PKConnectedCircleEmptyView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outerColor, a3);
    objc_storeStrong((id *)&v10->_innerColor, a4);
  }

  return v10;
}

- (PKConnectedCircleEmptyView)init
{
  return -[PKConnectedCircleEmptyView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKConnectedCircleEmptyView)initWithFrame:(CGRect)a3
{
  PKConnectedCircleEmptyView *v3;
  PKConnectedCircleEmptyView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKConnectedCircleEmptyView;
  v3 = -[PKConnectedCircleEmptyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKConnectedCircleEmptyView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 24.0;
  v4 = 24.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGContext *CurrentContext;
  UIColor *outerColor;
  UIColor *innerColor;
  CGRect v23;
  CGRect v24;

  PKSizeAlignedInRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PKSizeAlignedInRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  CurrentContext = UIGraphicsGetCurrentContext();
  outerColor = self->_outerColor;
  if (outerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](outerColor, "CGColor"));
    CGContextBeginPath(CurrentContext);
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    CGContextAddEllipseInRect(CurrentContext, v23);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
  innerColor = self->_innerColor;
  if (innerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](innerColor, "CGColor"));
    CGContextBeginPath(CurrentContext);
    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    CGContextAddEllipseInRect(CurrentContext, v24);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
}

- (UIColor)outerColor
{
  return self->_outerColor;
}

- (UIColor)innerColor
{
  return self->_innerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerColor, 0);
  objc_storeStrong((id *)&self->_outerColor, 0);
}

@end
