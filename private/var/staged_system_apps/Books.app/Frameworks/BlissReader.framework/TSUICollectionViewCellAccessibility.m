@implementation TSUICollectionViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UICollectionViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (CGRect)accessibilityFrame
{
  id v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  Class v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v3 = -[TSUICollectionViewCellAccessibility accessibilityContainer](self, "accessibilityContainer");
  v21.receiver = self;
  v21.super_class = (Class)TSUICollectionViewCellAccessibility;
  -[TSUICollectionViewCellAccessibility accessibilityFrame](&v21, "accessibilityFrame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  v12 = NSClassFromString(CFSTR("UICollectionViewCellAccessibilityElement"));
  if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
    v3 = objc_msgSend(v3, "accessibilityContainer");
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
    v25.origin.x = v13;
    v25.origin.y = v14;
    v25.size.width = v15;
    v25.size.height = v16;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectIntersection(v22, v25);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
