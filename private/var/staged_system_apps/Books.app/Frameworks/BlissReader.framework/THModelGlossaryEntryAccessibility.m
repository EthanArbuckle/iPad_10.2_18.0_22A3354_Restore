@implementation THModelGlossaryEntryAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THModelGlossaryEntry");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxTerm
{
  void *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THModelGlossaryEntryAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("term")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxDefinition
{
  void *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THModelGlossaryEntryAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("summaryText")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
