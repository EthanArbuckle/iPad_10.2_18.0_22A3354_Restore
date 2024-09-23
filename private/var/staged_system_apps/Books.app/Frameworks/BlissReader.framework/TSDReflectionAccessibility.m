@implementation TSDReflectionAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDReflection");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxDescription
{
  NSString *v3;

  v3 = TSAccessibilityLocalizedString((uint64_t)CFSTR("reflection.with.opacity %@"));
  -[TSDReflectionAccessibility _tsaxOpacity](self, "_tsaxOpacity");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, TSAccessibilityLocalizedPercent());
}

- (double)_tsaxOpacity
{
  double result;

  -[TSDReflectionAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("mOpacity"));
  return result;
}

@end
