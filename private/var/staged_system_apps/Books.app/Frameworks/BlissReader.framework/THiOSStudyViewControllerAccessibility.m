@implementation THiOSStudyViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THiOSStudyViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityPerformEscape
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_25D5BC;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewControllerAccessibility;
  -[THiOSStudyViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(-[THiOSStudyViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view")), "setAccessibilityViewIsModal:", 1);
  -[UIView thaxSetUsesChildrenFramesForSorting:](-[THNoteCardsControllerAccessibility thaxNoteCardsView](-[THiOSStudyViewControllerAccessibility _thaxNoteCardsController](self, "_thaxNoteCardsController"), "thaxNoteCardsView"), "thaxSetUsesChildrenFramesForSorting:", 1);
}

- (void)p_animateTransitionInWithCompletion:(id)a3
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = sub_25D69C;
  v4[3] = &unk_427830;
  v4[4] = a3;
  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewControllerAccessibility;
  v4[0] = _NSConcreteStackBlock;
  -[THiOSStudyViewControllerAccessibility p_animateTransitionInWithCompletion:](&v3, "p_animateTransitionInWithCompletion:", v4);
}

- (void)done:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewControllerAccessibility;
  -[THiOSStudyViewControllerAccessibility done:](&v4, "done:");
  objc_msgSend(a3, "_accessibilityUnregister");
}

- (THNoteCardsControllerAccessibility)_thaxNoteCardsController
{
  void *v3;
  THNoteCardsControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THNoteCardsControllerAccessibility);
  result = (THNoteCardsControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THiOSStudyViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_noteCardsController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
