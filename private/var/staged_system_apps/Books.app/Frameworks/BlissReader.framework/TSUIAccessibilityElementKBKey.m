@implementation TSUIAccessibilityElementKBKey

+ (id)tsaxTargetClassName
{
  return CFSTR("UIAccessibilityElementKBKey");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if ((sub_242A88() & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSUIAccessibilityElementKBKey;
  return -[TSUIAccessibilityElementKBKey isAccessibilityElement](&v4, "isAccessibilityElement");
}

@end
