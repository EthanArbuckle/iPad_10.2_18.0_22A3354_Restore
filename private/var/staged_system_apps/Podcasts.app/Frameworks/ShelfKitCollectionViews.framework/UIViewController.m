@implementation UIViewController

- (CGSize)pageContainerSize
{
  UIViewController *v2;
  UIView *v3;
  double v4;
  double v5;
  UIView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[UIViewController view](v2, "view");
  if (v3)
  {
    v6 = v3;
    -[UIView bounds](v3, "bounds");
    v8 = v7;
    v10 = v9;

    v4 = v8;
    v5 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)pageMarginInsets
{
  UIViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v2 = self;
  -[UIViewController pageContainerSize](v2, "pageContainerSize");
  StandardGridSpec.basePageMargin(for:)(v3);
  v5 = v4;

  v6 = 0.0;
  v7 = 0.0;
  v8 = v5;
  v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

@end
