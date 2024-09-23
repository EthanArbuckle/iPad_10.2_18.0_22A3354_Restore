@implementation THToolbarControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THToolbarController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)thaxForceSetToolbarHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THToolbarControllerAccessibility;
  -[THToolbarControllerAccessibility setToolbarHidden:animated:duration:completion:](&v3, "setToolbarHidden:animated:duration:completion:", a3, 0, 0, 0.0);
}

- (void)setCenterTitle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THToolbarControllerAccessibility;
  -[THToolbarControllerAccessibility setCenterTitle:](&v9, "setCenterTitle:", a3);
  v4 = objc_msgSend(objc_msgSend(-[THToolbarControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("toolbar")), "tsaxValueForKey:", CFSTR("centerItem")), "tsaxValueForKey:", CFSTR("customView"));
  v5 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "subviews");
    if (objc_msgSend(v6, "count") == (char *)&dword_0 + 1)
    {
      v7 = objc_msgSend(v6, "lastObject");
      v8 = (unint64_t)objc_msgSend(v7, "accessibilityTraits");
      objc_msgSend(v7, "setAccessibilityTraits:", UIAccessibilityTraitSummaryElement | v8 | TSAccessibilityTraitHeader);
    }
  }
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  _BOOL8 v8;
  _BOOL8 v9;
  objc_super v11;

  v8 = a4;
  v9 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    if (!UIAccessibilityIsSwitchControlRunning() || !v9)
      goto LABEL_7;
LABEL_6:
    if (!-[THToolbarControllerAccessibility _thaxAllowsToolbarHideRequests](self, "_thaxAllowsToolbarHideRequests"))
      return;
    goto LABEL_7;
  }
  if (v9)
    goto LABEL_6;
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)THToolbarControllerAccessibility;
  -[THToolbarControllerAccessibility setToolbarHidden:animated:duration:completion:](&v11, "setToolbarHidden:animated:duration:completion:", v9, v8, a6, a5);
  objc_msgSend(-[THToolbarControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("toolbar")), "setAccessibilityElementsHidden:", v9);
}

- (BOOL)_thaxAllowsToolbarHideRequests
{
  void *v3;
  Class v4;

  v3 = (void *)objc_opt_class(THDocumentViewControllerAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[THToolbarControllerAccessibility _thaxDelegate](self, "_thaxDelegate"), "tsaxValueForKey:", CFSTR("documentViewController")), 0, 0);
  return -[objc_class thaxAllowsToolbarHideRequests](v4, "thaxAllowsToolbarHideRequests");
}

- (id)_thaxDelegate
{
  return -[THToolbarControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

@end
