@implementation TSWPLayoutAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPLayout");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDLayoutAccessibility, a2);
}

- (id)tsaxStorage
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPStorageAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPLayoutAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("info")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
