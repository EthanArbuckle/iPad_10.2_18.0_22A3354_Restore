@implementation THNoteCardContentLayerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNoteCardContentLayer");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxCardNumberString
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THMultiLineLabelAccessibility thaxText](-[THNoteCardContentLayerAccessibility _thaxCardNumberLabel](self, "_thaxCardNumberLabel"), "thaxText"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THMultiLineLabelAccessibility)_thaxCardNumberLabel
{
  void *v3;
  THMultiLineLabelAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THMultiLineLabelAccessibility);
  result = (THMultiLineLabelAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNoteCardContentLayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_cardNumberLabel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
