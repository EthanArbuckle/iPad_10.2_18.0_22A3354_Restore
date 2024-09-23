@implementation _UICollectionViewListCellContentView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  UIEdgeInsets result;

  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListCellContentView;
  -[UIView _concreteDefaultLayoutMargins](&v15, sel__concreteDefaultLayoutMargins);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = _UIShouldApplyVerticalLayoutMarginsToListHeaderFooterViews();
  v11 = 0.0;
  if (v10)
    v12 = 0.0;
  else
    v12 = v7;
  if (!v10)
    v11 = v3;
  v13 = v5;
  v14 = v9;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

@end
