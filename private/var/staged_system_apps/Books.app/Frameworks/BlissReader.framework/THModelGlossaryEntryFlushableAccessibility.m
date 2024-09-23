@implementation THModelGlossaryEntryFlushableAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THModelGlossaryEntryFlushable");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_populate
{
  id v3;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THModelGlossaryEntryFlushableAccessibility;
  -[THModelGlossaryEntryFlushableAccessibility p_populate](&v5, "p_populate");
  v3 = objc_msgSend(-[THModelGlossaryEntryFlushableAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("body")), "tsaxValueForKey:", CFSTR("headerInfo"));
  v4 = (unint64_t)objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", TSAccessibilityTraitHeader | v4);
}

@end
