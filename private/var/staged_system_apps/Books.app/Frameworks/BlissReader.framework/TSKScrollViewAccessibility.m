@implementation TSKScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKScrollView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THAccessibilityTSKScrollViewDelegate)thaxDelegate
{
  THAccessibilityTSKScrollViewDelegate *result;
  char v3;

  v3 = 0;
  result = (THAccessibilityTSKScrollViewDelegate *)__TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___THAccessibilityTSKScrollViewDelegate, -[TSKScrollViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate")), 1, &v3);
  if (v3)
    abort();
  return result;
}

@end
