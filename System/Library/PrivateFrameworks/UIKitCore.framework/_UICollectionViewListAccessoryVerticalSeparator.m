@implementation _UICollectionViewListAccessoryVerticalSeparator

- (_UICollectionViewListAccessoryVerticalSeparator)initWithFrame:(CGRect)a3
{
  _UICollectionViewListAccessoryVerticalSeparator *v3;
  _UICollectionViewListAccessoryVerticalSeparator *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListAccessoryVerticalSeparator;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

  }
  return v4;
}

- (BOOL)_shouldDrawThickSeparators
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  v5 = -[_UICollectionViewListAccessoryVerticalSeparator _shouldDrawThickSeparators](self, "_shouldDrawThickSeparators", a3.width);
  v6 = 1.0;
  if (!v5)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale", 1.0);
    v6 = 1.0 / v7;
  }
  v8 = height;
  result.height = v8;
  result.width = v6;
  return result;
}

@end
