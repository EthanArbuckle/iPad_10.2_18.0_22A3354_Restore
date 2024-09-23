@implementation TSWPListStylePresetsInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPListStylePresetsInspectorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)p_listIndentCells
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPListStylePresetsInspectorControllerAccessibility;
  v2 = -[TSWPListStylePresetsInspectorControllerAccessibility p_listIndentCells](&v11, "p_listIndentCells");
  v3 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    if (objc_msgSend(v2, "count"))
    {
      v4 = objc_msgSend(objc_msgSend(objc_msgSend(v2, "objectAtIndex:", 0), "tsaxValueForKey:", CFSTR("segmentedControl")), "tsaxValueForKey:", CFSTR("mButtonSegments"));
      v5 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      {
        v6 = objc_msgSend(v4, "objectAtIndex:", 0);
        v7 = objc_msgSend(v4, "objectAtIndex:", 1);
        v8 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
          objc_msgSend(v6, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("outdent.button")));
        v9 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
          objc_msgSend(v7, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("indent.button")));
      }
    }
  }
  return v2;
}

@end
