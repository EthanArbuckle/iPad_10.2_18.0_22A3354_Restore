@implementation TSWPLayoutInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPLayoutInspectorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_updateAlignmentControl:(id)a3 forVertical:(BOOL)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  Class v11;
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSWPLayoutInspectorControllerAccessibility;
  -[TSWPLayoutInspectorControllerAccessibility p_updateAlignmentControl:forVertical:](&v13, "p_updateAlignmentControl:forVertical:");
  if (a4)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc((Class)NSArray);
    v8 = TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.top"));
    v9 = TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.middle"));
    v6 = objc_msgSend(v7, "initWithObjects:", v8, v9, TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.bottom")), 0);
  }
  v12 = 0;
  v10 = (void *)objc_opt_class(TSKSegmentedControlAccessibility);
  v11 = __TSAccessibilityCastAsSafeCategory(v10, (uint64_t)a3, 1, &v12);
  if (v12)
    abort();
  -[objc_class tsaxSetSegmentDescriptions:](v11, "tsaxSetSegmentDescriptions:", v6);

}

@end
