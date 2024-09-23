@implementation _UIStatusBarSystemNavigationItemButton

+ (BOOL)_buttonTypeIsModernUI:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldLayoutImageOnRight
{
  void *v2;
  char v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldLayoutImageOnRight");

  return v3;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarSystemNavigationItemButton;
  -[UIButton imageRectForContentRect:](&v18, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  if (-[_UIStatusBarSystemNavigationItemButton shouldLayoutImageOnRight](self, "shouldLayoutImageOnRight"))
    -[UIView bounds](self, "bounds");
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v8);
  v10 = v9;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v11);
  v13 = v12;

  v14 = v10;
  v15 = v13;
  v16 = v5;
  v17 = v7;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)_UIStatusBarSystemNavigationItemButton;
  -[UIButton titleRectForContentRect:](&v23, sel_titleRectForContentRect_);
  v9 = v8;
  v11 = v10;
  -[_UIStatusBarSystemNavigationItemButton imageRectForContentRect:](self, "imageRectForContentRect:", x, y, width, height);
  v13 = v12;
  if (-[_UIStatusBarSystemNavigationItemButton shouldLayoutImageOnRight](self, "shouldLayoutImageOnRight"))
    v15 = width - v13 + -4.0;
  else
    v15 = v9;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v16);
  v18 = v17;

  v19 = 0.0;
  v20 = v18;
  v21 = v15;
  v22 = v11;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v19;
  result.origin.x = v20;
  return result;
}

@end
