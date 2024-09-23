@implementation _UIPopoverSlidingChromeView

+ (double)arrowHeight
{
  return 0.0;
}

+ (double)arrowBase
{
  return 0.0;
}

+ (double)cornerRadius
{
  return 0.0;
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[UISplitViewControllerClassicImpl _defaultGutterWidthInView:](UISplitViewControllerClassicImpl, "_defaultGutterWidthInView:", 0);
  v3 = v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_contentViewInsets
{
  double v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  +[UISplitViewControllerClassicImpl _defaultGutterWidthInView:](UISplitViewControllerClassicImpl, "_defaultGutterWidthInView:", self);
  v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  v5 = 0.0;
  if ((v4 & 0x80000) != 0)
    v6 = v3;
  else
    v6 = 0.0;
  if ((*(_QWORD *)&v4 & 0x80000) != 0)
    v7 = 0.0;
  else
    v7 = v3;
  v8 = 0.0;
  result.right = v7;
  result.bottom = v5;
  result.left = v6;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)_shadowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPathForRect:(CGRect)a3 arrowDirection:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v8);
}

- (double)arrowOffset
{
  return 0.0;
}

- (unint64_t)arrowDirection
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPopoverSlidingChromeView;
  -[UIPopoverBackgroundView layoutSubviews](&v6, sel_layoutSubviews);
  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor systemGrayColor](UIColor, "systemGrayColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 10.0);

}

@end
