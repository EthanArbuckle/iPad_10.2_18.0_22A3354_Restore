@implementation TSPDataAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSPData");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxLabel
{
  return -[TSPDataAccessibility tsaxFriendlyFilename](self, "tsaxFriendlyFilename");
}

- (NSString)tsaxFriendlyFilename
{
  return (NSString *)TSAccessibilityFriendlyFilename(-[TSPDataAccessibility tsaxFilename](self, "tsaxFilename"));
}

- (NSString)tsaxFilename
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSPDataAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("filename")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
