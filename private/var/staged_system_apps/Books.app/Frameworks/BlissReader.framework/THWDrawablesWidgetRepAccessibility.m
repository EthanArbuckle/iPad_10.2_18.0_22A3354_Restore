@implementation THWDrawablesWidgetRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return -[THWDrawablesWidgetRepAccessibility thaxWidgetDescription](self, "thaxWidgetDescription");
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWDrawablesWidgetRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (NSString)thaxWidgetDescription
{
  return -[THWDrawablesWidgetInfoAccessibility thaxWidgetDescription](-[THWDrawablesWidgetRepAccessibility thaxDrawablesWidgetInfo](self, "thaxDrawablesWidgetInfo"), "thaxWidgetDescription");
}

- (THWDrawablesWidgetInfoAccessibility)thaxDrawablesWidgetInfo
{
  void *v3;

  v3 = (void *)objc_opt_class(THWDrawablesWidgetInfoAccessibility);
  return (THWDrawablesWidgetInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), 0, 0);
}

@end
