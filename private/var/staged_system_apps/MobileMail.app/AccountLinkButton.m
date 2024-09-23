@implementation AccountLinkButton

- (AccountLinkButton)initWithFrame:(CGRect)a3
{
  AccountLinkButton *v3;
  AccountLinkButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AccountLinkButton;
  v3 = -[AccountLinkButton initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountLinkButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v5, "setShadowOffset:", 0.0, 1.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccountLinkButton titleLabel](v4, "titleLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.298039228, 0.337254912, 0.423529416, 1.0));
    -[AccountLinkButton setTitleColor:forState:](v4, "setTitleColor:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[AccountLinkButton setTitleShadowColor:forState:](v4, "setTitleShadowColor:forState:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[AccountLinkButton setTitleColor:forState:](v4, "setTitleColor:forState:", v10, 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[AccountLinkButton setTitleShadowColor:forState:](v4, "setTitleShadowColor:forState:", v11, 1);

  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AccountLinkButton;
  -[AccountLinkButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[AccountLinkButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  CGContext *CurrentContext;
  id v15;
  void *v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[AccountLinkButton bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[AccountLinkButton isHighlighted](self, "isHighlighted"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
    objc_msgSend(v12, "set");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v5, v7, v9, v11, 4.0));
    objc_msgSend(v13, "fill");

  }
  CurrentContext = UIGraphicsGetCurrentContext();
  v15 = -[AccountLinkButton state](self, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AccountLinkButton titleColorForState:](self, "titleColorForState:", v15));
  objc_msgSend(v16, "set");

  -[AccountLinkButton contentRectForBounds:](self, "contentRectForBounds:", v5, v7, v9, v11);
  -[AccountLinkButton titleRectForContentRect:](self, "titleRectForContentRect:");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v22 = CGRectGetMaxY(v26) + -2.0;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v23 = CGRectGetWidth(v27);
  v28.size.height = 1.0;
  v28.origin.x = MinX;
  v28.origin.y = v22;
  v28.size.width = v23;
  CGContextFillRect(CurrentContext, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AccountLinkButton titleShadowColorForState:](self, "titleShadowColorForState:", v15));
  objc_msgSend(v24, "set");

  v29.origin.y = v22 + 1.0;
  v29.size.height = 1.0;
  v29.origin.x = MinX;
  v29.size.width = v23;
  CGContextFillRect(CurrentContext, v29);
}

@end
