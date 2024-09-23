@implementation TSADocumentManagerViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_loadNormalModeToolbarForInterfaceOrientation:(int64_t)a3
{
  id v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSADocumentManagerViewControllerAccessibility;
  -[TSADocumentManagerViewControllerAccessibility _loadNormalModeToolbarForInterfaceOrientation:](&v18, "_loadNormalModeToolbarForInterfaceOrientation:", a3);
  v4 = -[TSADocumentManagerViewControllerAccessibility _tsaxAddButton](self, "_tsaxAddButton");
  if (TSAccessibilityShouldPerformValidationChecks()
    && !v4
    && (ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Add button should not be nil."), v6, v7, v8, v9, v10, (uint64_t)v18.receiver))|| (objc_msgSend(v4, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("create.document.button.label"))), v11 = -[TSADocumentManagerViewControllerAccessibility _tsaxShareButton](self, "_tsaxShareButton"), TSAccessibilityShouldPerformValidationChecks())&& !v11&& (v12 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(), __TSAccessibilityHandleValidationErrorWithDescription(v12,
                        0,
                        (uint64_t)CFSTR("Share button should not be nil."),
                        v13,
                        v14,
                        v15,
                        v16,
                        v17,
                        (uint64_t)v18.receiver)))
  {
    abort();
  }
  objc_msgSend(v11, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("share.button.label")));
}

- (void)_loadEditModeToolbarForInterfaceOrientation:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSADocumentManagerViewControllerAccessibility;
  -[TSADocumentManagerViewControllerAccessibility _loadEditModeToolbarForInterfaceOrientation:](&v4, "_loadEditModeToolbarForInterfaceOrientation:", a3);
  objc_msgSend(-[TSADocumentManagerViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_deleteButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("delete.button")));
  objc_msgSend(-[TSADocumentManagerViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_duplicateButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("duplicate.button")));
}

- (id)_tsaxAddButton
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIBarButtonItem);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADocumentManagerViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_addButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_tsaxShareButton
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIBarButtonItem);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADocumentManagerViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_shareButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
