@implementation THFlowTOCViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THFlowTOCViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTOCViewControllerAccessibility, a2);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THFlowTOCViewControllerAccessibility;
  -[THFlowTOCViewControllerAccessibility viewWillAppear:](&v4, "viewWillAppear:", a3);
  objc_msgSend(-[THFlowTOCViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("backgroundButton")), "setIsAccessibilityElement:", 0);
  -[THFlowTOCViewControllerAccessibility _thaxApplyAccessibilityInfo](self, "_thaxApplyAccessibilityInfo");
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2644B4;
  v3[3] = &unk_427268;
  v4 = a3;
  v3[4] = self;
  -[THTOCViewControllerAccessibility _axPerformBlockAffectingMediaControllerState:](self, "_axPerformBlockAffectingMediaControllerState:", v3);
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THFlowTOCViewControllerAccessibility;
  -[THFlowTOCViewControllerAccessibility introMediaControllerShouldAdvancePast:](&v5, "introMediaControllerShouldAdvancePast:", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_26456C;
  v4[3] = &unk_426DD0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(v4, 0.75);
}

- (void)accessoryTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCViewControllerAccessibility;
  -[THFlowTOCViewControllerAccessibility accessoryTapped:](&v3, "accessoryTapped:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCViewControllerAccessibility;
  -[THFlowTOCViewControllerAccessibility setIntroMediaViewController:showIt:](&v6, "setIntroMediaViewController:showIt:", a3);
  if (v4)
    -[THTOCViewControllerAccessibility _axHideToolbar](self, "_axHideToolbar");
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCViewControllerAccessibility;
  -[THFlowTOCViewControllerAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THFlowTOCViewControllerAccessibility _thaxApplyAccessibilityInfo](self, "_thaxApplyAccessibilityInfo");
}

- (void)_thaxApplyAccessibilityInfo
{
  UIButton *v3;

  -[UIButton setIsAccessibilityElement:](-[THFlowTOCViewControllerAccessibility _thaxHeaderImageViews](self, "_thaxHeaderImageViews"), "setIsAccessibilityElement:", 1);
  -[UIButton _accessibilitySetRoleDescription:](-[THFlowTOCViewControllerAccessibility _thaxHeaderImageViews](self, "_thaxHeaderImageViews"), "_accessibilitySetRoleDescription:", THAccessibilityLocalizedString((uint64_t)CFSTR("image")));
  v3 = -[THFlowTOCViewControllerAccessibility _thaxHeaderImageViews](self, "_thaxHeaderImageViews");
  -[UIButton setAccessibilityTraits:](v3, "setAccessibilityTraits:", (unint64_t)-[UIButton accessibilityTraits](v3, "accessibilityTraits") & ~UIAccessibilityTraitButton);
}

- (UIButton)_thaxHeaderImageViews
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THFlowTOCViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("headerImageViews")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
