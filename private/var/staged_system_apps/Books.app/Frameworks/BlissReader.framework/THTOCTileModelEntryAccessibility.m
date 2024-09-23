@implementation THTOCTileModelEntryAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THTOCTileModelEntry");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxSectionIdentifier
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTOCTileModelEntryAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("sectionIdentifier")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxTitle
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTOCTileModelEntryAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("title")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxDisplayPageNumber
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTOCTileModelEntryAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("displayPageNumber")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
