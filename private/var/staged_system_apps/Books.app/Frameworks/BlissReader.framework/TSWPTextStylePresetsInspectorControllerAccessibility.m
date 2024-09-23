@implementation TSWPTextStylePresetsInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPTextStylePresetsInspectorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (id)cellWithParagraphAlignmentControlsIncludeVerticalAlignment:(BOOL)a3 inspector:(id)a4 editor:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  Class v9;
  Class v10;
  id v11;
  id v12;
  void *v13;
  Class v14;
  char v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___TSWPTextStylePresetsInspectorControllerAccessibility;
  v7 = objc_msgSendSuper2(&v17, "cellWithParagraphAlignmentControlsIncludeVerticalAlignment:inspector:editor:", a3, a4, a5);
  if (!v5)
  {
    v16 = 0;
    v13 = (void *)objc_opt_class(TSDSegmentedControlTableViewCellAccessibility);
    v14 = __TSAccessibilityCastAsSafeCategory(v13, (uint64_t)v7, 1, &v16);
    if (!v16)
    {
      v11 = -[objc_class tsaxSegmentedControl](v14, "tsaxSegmentedControl");
      v12 = 0;
      if (!v11)
        goto LABEL_8;
      goto LABEL_7;
    }
LABEL_11:
    abort();
  }
  v16 = 0;
  v8 = (void *)objc_opt_class(TSDDoubleSegmentedControlTableViewCellAccessibility);
  v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 1, &v16);
  if (v16)
    goto LABEL_11;
  v10 = v9;
  v11 = -[objc_class tsaxLeftSegmentedControl](v9, "tsaxLeftSegmentedControl");
  v12 = -[objc_class tsaxRightSegmentedControl](v10, "tsaxRightSegmentedControl");
  if (v11)
LABEL_7:
    objc_msgSend(a1, "_tsaxLabelOptionsInParagraphAlignSegmentedControl:", v11);
LABEL_8:
  if (v12)
    objc_msgSend(a1, "_tsaxLabelOptionsInVerticalAlignSegmentedControl:", v12);
  return v7;
}

+ (id)cellWithParagraphAlignmentControlsForInspector:(id)a3 editor:(id)a4
{
  id v5;
  void *v6;
  Class v7;
  char v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TSWPTextStylePresetsInspectorControllerAccessibility;
  v5 = objc_msgSendSuper2(&v10, "cellWithParagraphAlignmentControlsForInspector:editor:", a3, a4);
  v9 = 0;
  v6 = (void *)objc_opt_class(TSDSegmentedControlTableViewCellAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v9);
  if (v9)
    abort();
  objc_msgSend(a1, "_tsaxLabelOptionsInParagraphAlignSegmentedControl:", -[objc_class tsaxSegmentedControl](v7, "tsaxSegmentedControl"));
  return v5;
}

+ (id)cellWithVerticalAlignmentControlsForInspector:(id)a3 editor:(id)a4
{
  id v5;
  void *v6;
  Class v7;
  char v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TSWPTextStylePresetsInspectorControllerAccessibility;
  v5 = objc_msgSendSuper2(&v10, "cellWithVerticalAlignmentControlsForInspector:editor:", a3, a4);
  v9 = 0;
  v6 = (void *)objc_opt_class(TSDSegmentedControlTableViewCellAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v9);
  if (v9)
    abort();
  objc_msgSend(a1, "_tsaxLabelOptionsInVerticalAlignSegmentedControl:", -[objc_class tsaxSegmentedControl](v7, "tsaxSegmentedControl"));
  return v5;
}

+ (void)_tsaxLabelOptionsInParagraphAlignSegmentedControl:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  int ShouldCrashOnValidationErrorAfterLaunch;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD v14[5];

  if (objc_msgSend(a3, "tsaxSegmentCount") == (char *)&dword_4 + 1)
  {
    v14[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.left"));
    v14[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.center"));
    v14[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.right"));
    v14[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.natural"));
    v14[4] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.right.to.left"));
    v4 = v14;
    v5 = 5;
LABEL_5:
    objc_msgSend(a3, "tsaxSetSegmentDescriptions:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5));
    return;
  }
  if (objc_msgSend(a3, "tsaxSegmentCount") == &dword_4)
  {
    v13[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.left"));
    v13[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.center"));
    v13[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.right"));
    v13[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.natural"));
    v4 = v13;
    v5 = 4;
    goto LABEL_5;
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v7 = objc_msgSend(a3, "tsaxSegmentCount");
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unexpected segment count: %lu"), v8, v9, v10, v11, v12, (uint64_t)v7))abort();
  }
}

+ (void)_tsaxLabelOptionsInVerticalAlignSegmentedControl:(id)a3
{
  NSArray *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  v5 = TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.top"));
  v6 = TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.middle"));
  v7 = TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.bottom"));
  v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 3);
  objc_msgSend(a3, "tsaxSetSegmentDescriptions:", v4, v5, v6);
}

@end
