@implementation THWiOSExpandedViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWiOSExpandedViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewControllerAccessibility;
  -[THWiOSExpandedViewControllerAccessibility animationControllerDidPresentPostCommit:](&v4, "animationControllerDidPresentPostCommit:", a3);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    -[THWAdornmentControllerAccessibility thaxSetAlwaysShowPanels:](-[THWiOSExpandedViewControllerAccessibility thaxAdornmentController](self, "thaxAdornmentController"), "thaxSetAlwaysShowPanels:", -[THWiOSExpandedViewControllerAccessibility thaxExpandedRepControllerState](self, "thaxExpandedRepControllerState") == 2);
    -[THWiOSExpandedViewControllerAccessibility thaxSetInsetsNeedUpdate](self, "thaxSetInsetsNeedUpdate");
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
}

- (BOOL)accessibilityPerformEscape
{
  -[THWiOSExpandedViewControllerAccessibility thaxDismiss](self, "thaxDismiss");
  return 1;
}

- (void)thaxDismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_26B468;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)thaxSetInsetsNeedUpdate
{
  id v2;
  void *v3;
  Class v4;
  char v5;

  v2 = -[THWiOSExpandedViewControllerAccessibility thaxExpandedRep](self, "thaxExpandedRep");
  if ((objc_opt_isKindOfClass(v2, +[TSAccessibilitySafeCategory tsaxTargetClass](THWSceneRepAccessibility, "tsaxTargetClass")) & 1) != 0)
  {
    v5 = 0;
    v3 = (void *)objc_opt_class(THWSceneRepAccessibility);
    v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
    if (v5)
      abort();
    -[objc_class thaxSetInsetsNeedUpdate](v4, "thaxSetInsetsNeedUpdate");
  }
}

- (UIView)thaxView
{
  return (UIView *)-[THWiOSExpandedViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view"));
}

- (id)thaxExpandedRep
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWiOSExpandedViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expandedRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDInteractiveCanvasControllerAccessibility)thaxIcc
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWiOSExpandedViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("icc")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDiOSCanvasViewControllerAccessibility)thaxCvc
{
  void *v3;
  TSDiOSCanvasViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDiOSCanvasViewControllerAccessibility);
  result = (TSDiOSCanvasViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWiOSExpandedViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("cvc")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THWAdornmentControllerAccessibility)thaxAdornmentController
{
  void *v3;
  THWAdornmentControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWAdornmentControllerAccessibility);
  result = (THWAdornmentControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWiOSExpandedViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("adornmentController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (int)thaxExpandedRepControllerState
{
  return -[THWiOSExpandedViewControllerAccessibility tsaxIntValueForKey:](self, "tsaxIntValueForKey:", CFSTR("expandedRepControllerState"));
}

@end
