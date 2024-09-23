@implementation TSWPListStyleAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPListStyle");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSSStyleAccessibility, a2);
}

- (id)tsaxDescription
{
  return -[TSWPListStyleAccessibility tsaxListType](self, "tsaxListType");
}

- (id)tsaxListType
{
  objc_class *v3;
  void *v4;
  void *v5;
  id result;
  unsigned int v7;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSSStyleAccessibility tsaxObjectForProperty:](self, "tsaxObjectForProperty:", 180), 1, &v8);
  if (v8)
    abort();
  v5 = v4;
  result = objc_msgSend(v4, "count");
  if (result)
  {
    v7 = objc_msgSend(objc_msgSend(v5, "firstObject"), "intValue") - 1;
    if (v7 > 2)
      return 0;
    else
      return TSAccessibilityLocalizedString((uint64_t)off_43C2F8[v7]);
  }
  return result;
}

@end
