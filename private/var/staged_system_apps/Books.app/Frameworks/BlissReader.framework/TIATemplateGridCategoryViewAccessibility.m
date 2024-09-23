@implementation TIATemplateGridCategoryViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TIATemplateGridCategoryView");
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
  return -[TIATemplateGridCategoryViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("title"));
}

@end
