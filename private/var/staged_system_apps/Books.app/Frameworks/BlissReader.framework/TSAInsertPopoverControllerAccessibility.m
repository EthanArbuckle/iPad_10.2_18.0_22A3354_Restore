@implementation TSAInsertPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAInsertPopoverController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  -[TSAInsertPopoverControllerAccessibility viewDidLoad](&v2, "viewDidLoad");
}

- (void)p_populateShapeView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  -[TSAInsertPopoverControllerAccessibility p_populateShapeView:pane:withPresetIndex:](&v7, "p_populateShapeView:pane:withPresetIndex:", a3, a4, a5);
  -[TSAInsertPopoverControllerAccessibility _tsaxApplyOrderedLabels:toButtons:](self, "_tsaxApplyOrderedLabels:toButtons:", -[TSSThemeAccessibility tsaxOrderedShapeDescriptions](-[TSAInsertPopoverControllerAccessibility _tsaxTheme](self, "_tsaxTheme"), "tsaxOrderedShapeDescriptions"), objc_msgSend(a3, "subviews"));
  -[TSAInsertPopoverControllerAccessibility _tsaxMarkViewAsNestedVerticalScrollView:](self, "_tsaxMarkViewAsNestedVerticalScrollView:", a3);
}

- (void)p_populateTablesView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  -[TSAInsertPopoverControllerAccessibility p_populateTablesView:pane:withPresetIndex:](&v7, "p_populateTablesView:pane:withPresetIndex:", a3, a4, a5);
  -[TSAInsertPopoverControllerAccessibility _tsaxApplyOrderedLabels:toButtons:](self, "_tsaxApplyOrderedLabels:toButtons:", -[TSSThemeAccessibility tsaxOrderedTableDescriptions](-[TSAInsertPopoverControllerAccessibility _tsaxTheme](self, "_tsaxTheme"), "tsaxOrderedTableDescriptions"), objc_msgSend(a3, "subviews"));
  -[TSAInsertPopoverControllerAccessibility _tsaxMarkViewAsNestedVerticalScrollView:](self, "_tsaxMarkViewAsNestedVerticalScrollView:", a3);
}

- (void)p_populateTextboxView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  -[TSAInsertPopoverControllerAccessibility p_populateTextboxView:pane:withPresetIndex:](&v7, "p_populateTextboxView:pane:withPresetIndex:", a3, a4, a5);
  -[TSAInsertPopoverControllerAccessibility _tsaxApplyOrderedLabels:toButtons:](self, "_tsaxApplyOrderedLabels:toButtons:", -[TSSThemeAccessibility tsaxOrderedTextboxDescriptions](-[TSAInsertPopoverControllerAccessibility _tsaxTheme](self, "_tsaxTheme"), "tsaxOrderedTextboxDescriptions"), objc_msgSend(a3, "subviews"));
  -[TSAInsertPopoverControllerAccessibility _tsaxMarkViewAsNestedVerticalScrollView:](self, "_tsaxMarkViewAsNestedVerticalScrollView:", a3);
}

- (void)p_populateChartsView:(id)a3 pane:(id)a4 withPresetIndex:(int64_t)a5 chartPage:(unint64_t)a6
{
  id v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TSAInsertPopoverControllerAccessibility;
  -[TSAInsertPopoverControllerAccessibility p_populateChartsView:pane:withPresetIndex:chartPage:](&v19, "p_populateChartsView:pane:withPresetIndex:chartPage:", a3, a4, a5);
  v9 = objc_msgSend(a3, "subviews");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = sub_22F70C;
  v17 = sub_22F71C;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_22F728;
  v12[3] = &unk_428E60;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();
  v10 = v14[5];
  _Block_object_dispose(&v13, 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_22F75C;
  v11[3] = &unk_4278B0;
  v11[4] = v10;
  v11[5] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);
  -[TSAInsertPopoverControllerAccessibility _tsaxMarkViewAsNestedVerticalScrollView:](self, "_tsaxMarkViewAsNestedVerticalScrollView:", a3);
}

- (TSSThemeAccessibility)_tsaxTheme
{
  void *v3;
  TSSThemeAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSSThemeAccessibility);
  result = (TSSThemeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(objc_msgSend(-[TSAInsertPopoverControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mDelegate")), "tsaxValueForKey:", CFSTR("documentRoot")), "tsaxValueForKey:", CFSTR("theme")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)_tsaxApplyOrderedLabels:(id)a3 toButtons:(id)a4
{
  id v7;
  int ShouldCrashOnValidationErrorAfterLaunch;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];

  v7 = objc_msgSend(a3, "count");
  if (v7 == objc_msgSend(a4, "count"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_22F98C;
    v15[3] = &unk_4278B0;
    v15[4] = a3;
    v15[5] = self;
    objc_msgSend(a4, "enumerateObjectsUsingBlock:", v15);
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v9 = objc_msgSend(a3, "count");
    objc_msgSend(a4, "count");
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Number of buttons has changed from %lu to %lu"), v10, v11, v12, v13, v14, (uint64_t)v9))abort();
  }
}

- (void)_tsaxApplyLabel:(id)a3 toButton:(id)a4
{
  unint64_t v6;

  objc_msgSend(a4, "setIsAccessibilityElement:", 1);
  objc_msgSend(a4, "setAccessibilityLabel:", a3);
  v6 = (unint64_t)objc_msgSend(a4, "accessibilityTraits");
  objc_msgSend(a4, "setAccessibilityTraits:", UIAccessibilityTraitButton | v6);
}

- (void)_tsaxMarkViewAsNestedVerticalScrollView:(id)a3
{
  objc_msgSend(a3, "setAccessibilityIdentifier:", CFSTR("nestedVScrollView"));
}

@end
