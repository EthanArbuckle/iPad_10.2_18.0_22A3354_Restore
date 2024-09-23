@implementation TSTTableCellInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableCellInspectorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)textPropertiesCell
{
  void *v3;
  id v4;
  Class v5;
  uint64_t v6;
  id v7;
  objc_class *v8;
  id result;
  objc_super v10;
  char v11;
  _QWORD v12[4];

  v11 = 0;
  v3 = (void *)objc_opt_class(TSDSegmentedControlTableViewCellAccessibility);
  v10.receiver = self;
  v10.super_class = (Class)TSTTableCellInspectorControllerAccessibility;
  v4 = -[TSTTableCellInspectorControllerAccessibility textPropertiesCell](&v10, "textPropertiesCell");
  v5 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v11);
  if (v11)
    goto LABEL_3;
  v6 = (uint64_t)v5;
  v7 = -[objc_class tsaxSegmentedControl](v5, "tsaxSegmentedControl");
  v12[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("bold"));
  v12[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("italic"));
  v12[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("underline"));
  v12[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("strikethrough"));
  objc_msgSend(v7, "tsaxSetSegmentDescriptions:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
  v11 = 0;
  v8 = (objc_class *)objc_opt_class(UITableViewCell);
  result = (id)__TSAccessibilityCastAsClass(v8, v6, 1, &v11);
  if (v11)
LABEL_3:
    abort();
  return result;
}

@end
