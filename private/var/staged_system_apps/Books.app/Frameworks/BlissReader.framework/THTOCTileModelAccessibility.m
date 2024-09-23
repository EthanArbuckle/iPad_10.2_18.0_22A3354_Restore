@implementation THTOCTileModelAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THTOCTileModel");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTOCModelAccessibility, a2);
}

- (NSArray)thaxLandscapeEntries
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTOCTileModelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("landscapeEntries")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
