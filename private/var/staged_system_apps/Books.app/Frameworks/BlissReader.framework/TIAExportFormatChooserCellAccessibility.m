@implementation TIAExportFormatChooserCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TIAExportFormatChooserCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_class *v3;
  void *v4;
  char v6;

  v6 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TIAExportFormatChooserCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("label")), 1, &v6);
  if (v6)
    abort();
  return objc_msgSend(v4, "text");
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIAExportFormatChooserCellAccessibility;
  return UIAccessibilityTraitButton | -[TIAExportFormatChooserCellAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

@end
