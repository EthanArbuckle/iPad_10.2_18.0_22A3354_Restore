@implementation THUIButtonAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSUIButtonAccessibility, a2);
}

- (id)thaxParentBooksPopoverController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A3E);
}

- (void)thaxSetParentBooksPopoverController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A3E, a3);
}

- (id)_axParentBooksPopoverController
{
  return 0;
}

- (BOOL)_axDismissParentBooksPopoverControllerIfAppropriate
{
  id v2;
  char v3;

  v2 = -[THUIButtonAccessibility _axParentBooksPopoverController](self, "_axParentBooksPopoverController");
  v3 = objc_opt_respondsToSelector(v2, "dismissPopoverAnimated:");
  if ((v3 & 1) != 0)
    objc_msgSend(v2, "dismissPopoverAnimated:", 1);
  return v3 & 1;
}

- (BOOL)_axCanDismissParentBooksPopoverController
{
  return objc_opt_respondsToSelector(-[THUIButtonAccessibility _axParentBooksPopoverController](self, "_axParentBooksPopoverController"), "dismissPopoverAnimated:") & 1;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[THUIButtonAccessibility _axCanDismissParentBooksPopoverController](self, "_axCanDismissParentBooksPopoverController"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return -[THUIButtonAccessibility isAccessibilityElement](&v4, "isAccessibilityElement");
}

- (id)accessibilityLabel
{
  const __CFString *v3;
  id v4;
  id result;
  objc_super v6;

  if (-[THUIButtonAccessibility _axCanDismissParentBooksPopoverController](self, "_axCanDismissParentBooksPopoverController"))
  {
    v3 = CFSTR("popover.view.dimiss.region");
    goto LABEL_7;
  }
  v4 = objc_msgSend(-[THUIButtonAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_accessibilityImagePath")), "lastPathComponent");
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ib_chevron_toc_down")) & 1) != 0)
  {
    v3 = CFSTR("expand.outline.button");
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ib_chevron_toc_up")))
  {
    v3 = CFSTR("collapse.outline.button");
LABEL_7:
    result = TSAccessibilityLocalizedString((uint64_t)v3);
    if (result)
      return result;
  }
  v6.receiver = self;
  v6.super_class = (Class)THUIButtonAccessibility;
  return -[TSUIButtonAccessibility accessibilityLabel](&v6, "accessibilityLabel");
}

- (id)accessibilityHint
{
  objc_super v4;

  if (-[THUIButtonAccessibility _axCanDismissParentBooksPopoverController](self, "_axCanDismissParentBooksPopoverController"))
  {
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("popover.view.dimiss.region.hint.iOS"));
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return -[THUIButtonAccessibility accessibilityHint](&v4, "accessibilityHint");
}

- (int64_t)accessibilityContainerType
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THUIButtonAccessibility;
  v3 = -[THUIButtonAccessibility accessibilityContainerType](&v5, "accessibilityContainerType");
  if (-[THUIButtonAccessibility _axCanDismissParentBooksPopoverController](self, "_axCanDismissParentBooksPopoverController"))
  {
    return 4;
  }
  else
  {
    return (int64_t)v3;
  }
}

- (BOOL)accessibilityViewIsModal
{
  objc_super v4;

  if (-[THUIButtonAccessibility _axCanDismissParentBooksPopoverController](self, "_axCanDismissParentBooksPopoverController"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return -[THUIButtonAccessibility accessibilityViewIsModal](&v4, "accessibilityViewIsModal");
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v4;

  if (-[THUIButtonAccessibility _axDismissParentBooksPopoverControllerIfAppropriate](self, "_axDismissParentBooksPopoverControllerIfAppropriate"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return -[TSUIButtonAccessibility accessibilityPerformEscape](&v4, "accessibilityPerformEscape");
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  if (-[THUIButtonAccessibility _axCanDismissParentBooksPopoverController](self, "_axCanDismissParentBooksPopoverController"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return -[TSUIButtonAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction");
}

- (void)accessibilityActivate
{
  objc_super v3;

  if (!-[THUIButtonAccessibility _axDismissParentBooksPopoverControllerIfAppropriate](self, "_axDismissParentBooksPopoverControllerIfAppropriate"))
  {
    v3.receiver = self;
    v3.super_class = (Class)THUIButtonAccessibility;
    -[TSUIButtonAccessibility accessibilityActivate](&v3, "accessibilityActivate");
  }
}

@end
