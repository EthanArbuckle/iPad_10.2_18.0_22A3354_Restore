@implementation THBodyRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THBodyRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THWPRepAccessibility, a2);
}

- (BOOL)tsaxNeedsEditRotorMenu
{
  return 1;
}

- (id)_accessibilityScrollAncestorForSelector:(SEL)a3
{
  id result;
  NSString *v6;
  void *v7;
  Class v8;
  unsigned int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THBodyRepAccessibility;
  result = -[THBodyRepAccessibility _accessibilityScrollAncestorForSelector:](&v10, "_accessibilityScrollAncestorForSelector:");
  if (a3 && !result)
  {
    v6 = -[NSString stringByAppendingString:](NSStringFromSelector(a3), "stringByAppendingString:", CFSTR("Supported"));
    v7 = (void *)objc_opt_class(THUIScrollViewAccessibility);
    v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)-[THBodyRepAccessibility _accessibilityScrollParent](self, "_accessibilityScrollParent"), 0, 0);
    v9 = objc_msgSend(-[objc_class thaxScrollingDelegate](v8, "thaxScrollingDelegate"), "tsaxBoolValueForKey:", v6);
    result = 0;
    if (v9)
      return -[objc_class thaxScrollingDelegate](v8, "thaxScrollingDelegate");
  }
  return result;
}

@end
