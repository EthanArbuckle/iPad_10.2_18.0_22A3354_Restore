@implementation THMultiLineLabelAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THMultiLineLabel");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxText
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THMultiLineLabelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("text")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
