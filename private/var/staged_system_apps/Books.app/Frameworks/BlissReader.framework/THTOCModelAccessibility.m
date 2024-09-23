@implementation THTOCModelAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THTOCModel");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSArray)thaxTiles
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTOCModelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tiles")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
