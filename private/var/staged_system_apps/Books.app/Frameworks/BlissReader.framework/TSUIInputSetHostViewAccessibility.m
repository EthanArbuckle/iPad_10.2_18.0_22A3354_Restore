@implementation TSUIInputSetHostViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIInputSetHostView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityElementsHidden
{
  objc_super v4;

  if ((sub_242A88() & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSUIInputSetHostViewAccessibility;
  return -[TSUIInputSetHostViewAccessibility accessibilityElementsHidden](&v4, "accessibilityElementsHidden");
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  if ((sub_242A88() & 1) != 0)
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)TSUIInputSetHostViewAccessibility;
  return -[TSUIInputSetHostViewAccessibility _accessibilityHitTest:withEvent:](&v9, "_accessibilityHitTest:withEvent:", a4, x, y);
}

@end
