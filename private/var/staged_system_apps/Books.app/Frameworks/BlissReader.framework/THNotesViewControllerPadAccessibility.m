@implementation THNotesViewControllerPadAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesViewControllerPad");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_configureToolbarsForEditing:(BOOL)a3 collapsed:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPadAccessibility;
  -[THNotesViewControllerPadAccessibility p_configureToolbarsForEditing:collapsed:](&v5, "p_configureToolbarsForEditing:collapsed:", a3, a4);
  -[THNotesViewControllerPadAccessibility _thaxApplyAccessibilityInfo](self, "_thaxApplyAccessibilityInfo");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)handleAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNotesViewControllerPadAccessibility;
  -[THNotesViewControllerPadAccessibility handleAction:](&v4, "handleAction:", a3);
  UIAccessibilityPostNotification(TSAccessibilityMoveToElementNotification, -[THUIBarButtonItemAccessibility thaxView](-[THNotesViewControllerPadAccessibility _thaxSelectButton](self, "_thaxSelectButton"), "thaxView"));
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)handleStudy:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPadAccessibility;
  -[THNotesViewControllerPadAccessibility handleStudy:](&v3, "handleStudy:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (BOOL)accessibilityPerformEscape
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_264D50;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  return 1;
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPadAccessibility;
  -[THNotesViewControllerPadAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THNotesViewControllerPadAccessibility _thaxApplyAccessibilityInfo](self, "_thaxApplyAccessibilityInfo");
}

- (THUIBarButtonItemAccessibility)_thaxSelectButton
{
  void *v3;
  THUIBarButtonItemAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THUIBarButtonItemAccessibility);
  result = (THUIBarButtonItemAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNotesViewControllerPadAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_selectButtonItem")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THUIBarButtonItemAccessibility)_thaxActionButton
{
  void *v3;
  THUIBarButtonItemAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THUIBarButtonItemAccessibility);
  result = (THUIBarButtonItemAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNotesViewControllerPadAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_actionButtonItem")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)_thaxApplyAccessibilityInfo
{
  -[THUIBarButtonItemAccessibility setAccessibilityHint:](-[THNotesViewControllerPadAccessibility _thaxSelectButton](self, "_thaxSelectButton"), "setAccessibilityHint:", THAccessibilityLocalizedString((uint64_t)CFSTR("notes.select.button.hint.ios")));
}

@end
