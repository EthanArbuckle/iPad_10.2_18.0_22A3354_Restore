@implementation TSWPopoverControllerAccessibility

- (id)thaxPopoverParentView
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A1E);
}

- (void)thaxSetPopoverParentView:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A1E, a3);
}

- (id)_thaxPreviouslyFocusedElement
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A1F);
}

- (void)_thaxSetPreviouslyFocusedElement:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A1F, a3);
}

- (void)loadView
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPopoverControllerAccessibility;
  -[TSWPopoverControllerAccessibility loadView](&v4, "loadView");
  v3 = -[TSWPopoverControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("view"));
  objc_msgSend(v3, "setAccessibilityContainerType:", 4);
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  _QWORD v6[5];

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_25DD24;
  v6[3] = &unk_426DD0;
  v6[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", -[TSWPopoverControllerAccessibility _thaxPreviouslyFocusedElement](self, "_thaxPreviouslyFocusedElement"));
  -[TSWPopoverControllerAccessibility _thaxSetPreviouslyFocusedElement:](self, "_thaxSetPreviouslyFocusedElement:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TSWPopoverControllerAccessibility;
  -[TSWPopoverControllerAccessibility dismissPopoverAnimated:](&v5, "dismissPopoverAnimated:", v3);
}

- (void)p_didFade
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPopoverControllerAccessibility;
  -[TSWPopoverControllerAccessibility p_didFade](&v2, "p_didFade");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)thaxWillPresentPopoverInView:(id)a3
{
  -[TSWPopoverControllerAccessibility _thaxSetPreviouslyFocusedElement:](self, "_thaxSetPreviouslyFocusedElement:", -[TSAccessibility currentlyFocusedElement](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance", a3), "currentlyFocusedElement"));
}

- (void)thaxDidPresentPopoverInView:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_25DE14;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPopoverController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)thaxIsPopoverVisible
{
  return -[TSWPopoverControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isPopoverVisible"));
}

- (THWPopUpContentProviderAccessibility)thaxContentProvider
{
  void *v3;
  THWPopUpContentProviderAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPopUpContentProviderAccessibility);
  result = (THWPopUpContentProviderAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPopoverControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("contentProvider")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)thaxDismissPopoverAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_26914C;
  v3[3] = &unk_427268;
  v3[4] = self;
  v4 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 viewBounds:(CGRect)a5 permittedArrowDirections:(unint64_t)a6 displayMode:(unint64_t)a7 animated:(BOOL)a8
{
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v20;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3.size.height;
  v16 = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  v20 = a8 & ~-[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements");
  if (-[TSWPopoverControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxWillPresentPopoverInView:", &OBJC_PROTOCOL___THWPopoverControllerAccessibilityExtras))-[TSWPopoverControllerAccessibility thaxWillPresentPopoverInView:](self, "thaxWillPresentPopoverInView:", a4);
  v21.receiver = self;
  v21.super_class = (Class)TSWPopoverControllerAccessibility;
  -[TSWPopoverControllerAccessibility presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:](&v21, "presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:", a4, a6, a7, v20, v18, v17, v16, v15, x, y, width, height);
  if (-[TSWPopoverControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxDidPresentPopoverInView:", &OBJC_PROTOCOL___THWPopoverControllerAccessibilityExtras))-[TSWPopoverControllerAccessibility thaxDidPresentPopoverInView:](self, "thaxDidPresentPopoverInView:", a4);
}

@end
