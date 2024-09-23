@implementation TSWPBIUInspectorCellControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPBIUInspectorCellController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSWPBIUInspectorCellControllerAccessibility)initWithEditor:(id)a3
{
  TSWPBIUInspectorCellControllerAccessibility *v3;
  TSWPBIUInspectorCellControllerAccessibility *v4;
  id v5;
  objc_super v7;
  _QWORD v8[4];

  v7.receiver = self;
  v7.super_class = (Class)TSWPBIUInspectorCellControllerAccessibility;
  v3 = -[TSWPBIUInspectorCellControllerAccessibility initWithEditor:](&v7, "initWithEditor:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(-[TSWPBIUInspectorCellControllerAccessibility tsaxPropertiesCell](v3, "tsaxPropertiesCell"), "tsaxSegmentedControl");
    v8[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("bold"));
    v8[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("italic"));
    v8[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("underline"));
    v8[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("strikethrough"));
    objc_msgSend(v5, "tsaxSetSegmentDescriptions:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4));
  }
  return v4;
}

- (id)tsaxPropertiesCell
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDSegmentedControlTableViewCellAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPBIUInspectorCellControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_biuPropertiesCell")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
