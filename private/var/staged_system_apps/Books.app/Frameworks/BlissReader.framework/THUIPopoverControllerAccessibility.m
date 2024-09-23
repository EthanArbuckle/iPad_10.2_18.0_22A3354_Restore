@implementation THUIPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIPopoverController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_thaxOriginatingButton
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A3F);
}

- (void)_thaxSetOriginatingButton:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A3F, a3);
}

- (void)_axWillPresentPopover
{
  -[THUIPopoverControllerAccessibility _thaxSetOriginatingButton:](self, "_thaxSetOriginatingButton:", -[TSAccessibility currentlyFocusedElement](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "currentlyFocusedElement"));
}

- (void)_axWillDismissPopover
{
  -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", -[THUIPopoverControllerAccessibility _thaxOriginatingButton](self, "_thaxOriginatingButton"));
  -[THUIPopoverControllerAccessibility _thaxSetOriginatingButton:](self, "_thaxSetOriginatingButton:", 0);
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  objc_super v14;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(a4, "window"))
  {
    -[THUIPopoverControllerAccessibility _axWillPresentPopover](self, "_axWillPresentPopover");
    v14.receiver = self;
    v14.super_class = (Class)THUIPopoverControllerAccessibility;
    -[THUIPopoverControllerAccessibility presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v14, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, v6, x, y, width, height);
  }
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[THUIPopoverControllerAccessibility _axWillDismissPopover](self, "_axWillDismissPopover");
  v5.receiver = self;
  v5.super_class = (Class)THUIPopoverControllerAccessibility;
  -[THUIPopoverControllerAccessibility dismissPopoverAnimated:](&v5, "dismissPopoverAnimated:", v3);
}

- (void)dimmingViewWasTapped:(id)a3
{
  objc_super v5;

  -[THUIPopoverControllerAccessibility _axWillDismissPopover](self, "_axWillDismissPopover");
  v5.receiver = self;
  v5.super_class = (Class)THUIPopoverControllerAccessibility;
  -[THUIPopoverControllerAccessibility dimmingViewWasTapped:](&v5, "dimmingViewWasTapped:", a3);
}

@end
