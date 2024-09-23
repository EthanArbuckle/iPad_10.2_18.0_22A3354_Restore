@implementation CRLUILayoutContainerViewAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UILayoutContainerView");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (BOOL)crlaxShouldPreventSettingSortPriorityForNavigationController
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414C39);
}

- (void)crlaxSetShouldPreventSettingSortPriorityForNavigationController:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414C39, a3);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLUILayoutContainerViewAccessibility;
  -[CRLUILayoutContainerViewAccessibility layoutSubviews](&v8, "layoutSubviews");
  if (-[CRLUILayoutContainerViewAccessibility crlaxShouldPreventSettingSortPriorityForNavigationController](self, "crlaxShouldPreventSettingSortPriorityForNavigationController"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUILayoutContainerViewAccessibility _crlaxNavigationController](self, "_crlaxNavigationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));
    objc_msgSend(v4, "_accessibilitySetSortPriority:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toolbar"));
    objc_msgSend(v5, "_accessibilitySetSortPriority:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUILayoutContainerViewAccessibility _crlaxTopPalette](self, "_crlaxTopPalette"));
    objc_msgSend(v6, "_accessibilitySetSortPriority:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUILayoutContainerViewAccessibility _crlaxNavigationTransitionView](self, "_crlaxNavigationTransitionView"));
    objc_msgSend(v7, "_accessibilitySetSortPriority:", 0);

  }
}

- (UINavigationController)_crlaxNavigationController
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(UINavigationController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUILayoutContainerViewAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("delegate")));
  v5 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (UINavigationController *)v6;
}

- (id)_crlaxTopPalette
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUILayoutContainerViewAccessibility _crlaxNavigationController](self, "_crlaxNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValueForKey:", CFSTR("_topPalette")));

  return v3;
}

- (id)_crlaxNavigationTransitionView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUILayoutContainerViewAccessibility _crlaxNavigationController](self, "_crlaxNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValueForKey:", CFSTR("navigationTransitionView")));

  return v3;
}

@end
