@implementation StackShadowedView

- (StackShadowedView)initWithFrame:(CGRect)a3
{
  StackShadowedView *v3;
  StackShadowedView *v4;
  ShadowView *v5;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)StackShadowedView;
  v3 = -[StackShadowedView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[StackShadowedView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(-[StackShadowedView layer](v4, "layer"), "setShouldRasterize:", 1);
    v5 = objc_opt_new(ShadowView);
    v4->_shadowView = &v5->super;
    -[StackShadowedView bounds](v4, "bounds");
    v9 = CGRectInset(v8, -8.0, -8.0);
    -[ShadowView setFrame:](v5, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
    -[StackShadowedView addSubview:](v4, "addSubview:", v4->_shadowView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StackShadowedView;
  -[StackShadowedView dealloc](&v3, "dealloc");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[StackShadowedView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)StackShadowedView;
    -[StackShadowedView setFrame:](&v12, "setFrame:", x, y, width, height);
    -[StackShadowedView updateShadowView](self, "updateShadowView");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[StackShadowedView bounds](self, "bounds");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)StackShadowedView;
    -[StackShadowedView setBounds:](&v12, "setBounds:", x, y, width, height);
    -[StackShadowedView updateShadowView](self, "updateShadowView");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(objc_msgSend(-[StackShadowedView subviews](self, "subviews"), "lastObject"), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateShadowView
{
  CGRect v3;
  CGRect v4;

  -[StackShadowedView bounds](self, "bounds");
  v4 = CGRectInset(v3, -8.0, -8.0);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

@end
