@implementation PKConnectedCircleTargetView

- (PKConnectedCircleTargetView)initWithOuterColor:(id)a3 innerColor:(id)a4
{
  id v7;
  id v8;
  PKConnectedCircleTargetView *v9;
  PKConnectedCircleTargetView *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PKConnectedCircleTargetView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outerColor, a3);
    objc_storeStrong((id *)&v10->_innerColor, a4);
  }

  return v10;
}

- (PKConnectedCircleTargetView)init
{
  return -[PKConnectedCircleTargetView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKConnectedCircleTargetView)initWithFrame:(CGRect)a3
{
  PKConnectedCircleTargetView *v3;
  PKConnectedCircleTargetView *v4;
  void *v5;
  id v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKConnectedCircleTargetView;
  v3 = -[PKConnectedCircleTargetView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKConnectedCircleTargetView setOpaque:](v3, "setOpaque:", 0);
    -[PKConnectedCircleTargetView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowRadius:", 4.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", 0.0, 0.0);
    LODWORD(v7) = 0.25;
    objc_msgSend(v5, "setShadowOpacity:", v7);
    objc_msgSend(v5, "setMasksToBounds:", 0);

  }
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGContext *CurrentContext;
  UIColor *outerColor;
  UIColor *innerColor;
  UIColor *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  PKSizeAlignedInRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PKSizeAlignedInRect();
  v30 = v13;
  v31 = v12;
  v28 = v15;
  v29 = v14;
  PKSizeAlignedInRect();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  CurrentContext = UIGraphicsGetCurrentContext();
  outerColor = self->_outerColor;
  if (outerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](outerColor, "CGColor"));
    CGContextBeginPath(CurrentContext);
    v32.origin.x = v5;
    v32.origin.y = v7;
    v32.size.width = v9;
    v32.size.height = v11;
    CGContextAddEllipseInRect(CurrentContext, v32);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
  innerColor = self->_innerColor;
  if (innerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](innerColor, "CGColor"));
    CGContextBeginPath(CurrentContext);
    v33.origin.y = v30;
    v33.origin.x = v31;
    v33.size.height = v28;
    v33.size.width = v29;
    CGContextAddEllipseInRect(CurrentContext, v33);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
  v27 = self->_outerColor;
  if (v27)
  {
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](v27, "CGColor"));
    CGContextBeginPath(CurrentContext);
    v34.origin.x = v17;
    v34.origin.y = v19;
    v34.size.width = v21;
    v34.size.height = v23;
    CGContextAddEllipseInRect(CurrentContext, v34);
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
