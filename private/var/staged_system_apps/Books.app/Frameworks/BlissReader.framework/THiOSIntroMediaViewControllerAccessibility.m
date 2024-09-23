@implementation THiOSIntroMediaViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THiOSIntroMediaViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)loadView
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSIntroMediaViewControllerAccessibility;
  -[THiOSIntroMediaViewControllerAccessibility loadView](&v4, "loadView");
  -[THiOSIntroMediaViewAccessibility thaxSetDelegate:](-[THiOSIntroMediaViewControllerAccessibility _thaxView](self, "_thaxView"), "thaxSetDelegate:", self);
  if (-[THiOSIntroMediaViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("p_isImage")))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_259C54;
    v3[3] = &unk_426DD0;
    v3[4] = self;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
      abort();
  }
}

- (void)dealloc
{
  objc_super v3;

  if (-[THiOSIntroMediaViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isViewLoaded")))-[THiOSIntroMediaViewAccessibility thaxSetDelegate:](-[THiOSIntroMediaViewControllerAccessibility _thaxView](self, "_thaxView"), "thaxSetDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THiOSIntroMediaViewControllerAccessibility;
  -[THiOSIntroMediaViewControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)thaxIntroMediaViewDidPerformEscapeGesture
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_259EBC;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (THiOSIntroMediaViewAccessibility)_thaxView
{
  void *v3;
  THiOSIntroMediaViewAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THiOSIntroMediaViewAccessibility);
  result = (THiOSIntroMediaViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THiOSIntroMediaViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
