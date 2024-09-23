@implementation ShadowView

- (ShadowView)init
{
  ShadowView *v2;
  ShadowView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ShadowView;
  v2 = -[ShadowView init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[ShadowView setContentMode:](v2, "setContentMode:", 3);
    -[ShadowView setOpaque:](v3, "setOpaque:", 0);
    -[ShadowView setClearsContextBeforeDrawing:](v3, "setClearsContextBeforeDrawing:", 1);
    -[ShadowView setBackgroundColor:](v3, "setBackgroundColor:", 0);
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  CGColor *v8;
  CGSize v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[ShadowView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = CGRectInset(v10, 8.0, 8.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v8 = -[UIColor CGColor](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.7), "CGColor");
  v9.width = 0.0;
  v9.height = 4.0;
  CGContextSetShadowWithColor(CurrentContext, v9, 4.0, v8);
  CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGContextFillRect(CurrentContext, v12);
  CGContextRestoreGState(CurrentContext);
}

@end
