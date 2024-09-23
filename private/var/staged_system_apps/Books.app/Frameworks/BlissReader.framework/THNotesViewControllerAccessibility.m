@implementation THNotesViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (UIView)_thaxExistingView
{
  if (-[THNotesViewControllerAccessibility _thaxIsViewLoaded](self, "_thaxIsViewLoaded"))
    return -[THNotesViewControllerAccessibility _thaxView](self, "_thaxView");
  else
    return 0;
}

- (BOOL)_thaxIsViewLoaded
{
  return -[THNotesViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isViewLoaded"));
}

- (UIView)_thaxView
{
  objc_class *v3;
  UIView *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THBookViewControllerAccessibility)_thaxBookViewController
{
  void *v3;
  THBookViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THBookViewControllerAccessibility);
  result = (THBookViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNotesViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bookViewController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
