@implementation TSDFrameAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDFrame");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDStrokeAccessibility, a2);
}

- (NSString)tsaxFrameDescription
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(-[TSDFrameAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mSpec")), "tsaxValueForKey:", CFSTR("mFrameName")), 1, &v5);
  if (v5)
    abort();
  if (result)
    return TSAccessibilityLocalizedString((uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("frame.%@"), result));
  return result;
}

- (id)accessibilityLabel
{
  return -[TSDFrameAccessibility tsaxFrameDescription](self, "tsaxFrameDescription");
}

@end
