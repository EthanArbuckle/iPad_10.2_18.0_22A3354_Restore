@implementation TSKPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKPopoverController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSUIButtonAccessibility)_tsaxCachedOriginatingButton
{
  return (TSUIButtonAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_5439A0);
}

- (void)_tsaxSetCachedOriginatingButton:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439A0, a3);
}

- (BOOL)tsaxIsPopoverVisible
{
  objc_class *v3;
  void *v4;
  char v6;

  v6 = 0;
  v3 = (objc_class *)objc_opt_class(UIPopoverController);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v6);
  if (v6)
    abort();
  return objc_msgSend(v4, "isPopoverVisible");
}

- (UIViewController)tsaxContentViewController
{
  objc_class *v3;
  void *v4;
  char v6;

  v6 = 0;
  v3 = (objc_class *)objc_opt_class(UIPopoverController);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v6);
  if (v6)
    abort();
  return (UIViewController *)objc_msgSend(v4, "contentViewController");
}

- (void)tsaxPopoverControllerDidBecomeInvisible
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_242304;
  v3[3] = &unk_426DD0;
  v3[4] = -[TSKPopoverControllerAccessibility _tsaxCachedOriginatingButton](self, "_tsaxCachedOriginatingButton");
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  -[TSKPopoverControllerAccessibility _tsaxSetCachedOriginatingButton:](self, "_tsaxSetCachedOriginatingButton:", 0);
  if (qword_5439A8)
  {
    objc_msgSend((id)qword_5439A8, "removeObject:", +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", self));
    if (!objc_msgSend((id)qword_5439A8, "count"))
    {

      qword_5439A8 = 0;
    }
  }
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  TSUIButtonAccessibility *v14;
  objc_super v15;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = -[TSKPopoverControllerAccessibility _tsaxCurrentlyFocusedButton](self, "_tsaxCurrentlyFocusedButton");
  v15.receiver = self;
  v15.super_class = (Class)TSKPopoverControllerAccessibility;
  -[TSKPopoverControllerAccessibility presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v15, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, v6, x, y, width, height);
  if (!-[TSUIButtonAccessibility tsaxPreventPopoverAssociation](v14, "tsaxPreventPopoverAssociation"))
    -[TSKPopoverControllerAccessibility _tsaxPopoverWasPresentedFromOriginatingButton:](self, "_tsaxPopoverWasPresentedFromOriginatingButton:", v14);
}

- (void)presentPopoverFromBarButtonItem:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  TSUIButtonAccessibility *v9;
  objc_super v10;

  v5 = a5;
  v9 = -[TSKPopoverControllerAccessibility _tsaxCurrentlyFocusedButton](self, "_tsaxCurrentlyFocusedButton");
  v10.receiver = self;
  v10.super_class = (Class)TSKPopoverControllerAccessibility;
  -[TSKPopoverControllerAccessibility presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](&v10, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", a3, a4, v5);
  if (!-[TSUIButtonAccessibility tsaxPreventPopoverAssociation](v9, "tsaxPreventPopoverAssociation"))
    -[TSKPopoverControllerAccessibility _tsaxPopoverWasPresentedFromOriginatingButton:](self, "_tsaxPopoverWasPresentedFromOriginatingButton:", v9);
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  _BOOL4 v4;
  TSUIButtonAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKPopoverControllerAccessibility;
  v4 = -[TSKPopoverControllerAccessibility popoverControllerShouldDismissPopover:](&v7, "popoverControllerShouldDismissPopover:", a3);
  if (v4)
  {
    v5 = -[TSKPopoverControllerAccessibility _tsaxCachedOriginatingButton](self, "_tsaxCachedOriginatingButton");
    if (v5)
      -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", v5);
  }
  return v4;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  objc_super v5;

  -[TSKPopoverControllerAccessibility tsaxPopoverControllerDidBecomeInvisible](self, "tsaxPopoverControllerDidBecomeInvisible");
  v5.receiver = self;
  v5.super_class = (Class)TSKPopoverControllerAccessibility;
  -[TSKPopoverControllerAccessibility popoverControllerDidDismissPopover:](&v5, "popoverControllerDidDismissPopover:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[TSUIButtonAccessibility tsaxSetAssociatedPopoverController:](-[TSKPopoverControllerAccessibility _tsaxCachedOriginatingButton](self, "_tsaxCachedOriginatingButton"), "tsaxSetAssociatedPopoverController:", 0);
  -[TSKPopoverControllerAccessibility tsaxPopoverControllerDidBecomeInvisible](self, "tsaxPopoverControllerDidBecomeInvisible");
  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverControllerAccessibility;
  -[TSKPopoverControllerAccessibility dealloc](&v3, "dealloc");
}

- (BOOL)_accessibilityCanDismissPopoverController:(id)a3
{
  id v4;

  v4 = -[TSKPopoverControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mSavedDelegate"));
  if ((objc_opt_respondsToSelector(v4, "popoverControllerShouldDismissPopover:") & 1) != 0)
    return objc_msgSend(v4, "popoverControllerShouldDismissPopover:", a3);
  else
    return 0;
}

- (void)_tsaxPopoverWasPresentedFromOriginatingButton:(id)a3
{
  -[TSKPopoverControllerAccessibility _tsaxAddToVisiblePopoverControllers](self, "_tsaxAddToVisiblePopoverControllers");
  -[TSKPopoverControllerAccessibility _tsaxUpdateOriginatingButton:](self, "_tsaxUpdateOriginatingButton:", a3);
  -[TSKPopoverControllerAccessibility _tsaxUpdatePassthroughViewsWithOriginatingButton:](self, "_tsaxUpdatePassthroughViewsWithOriginatingButton:", a3);
}

- (void)_tsaxAddToVisiblePopoverControllers
{
  void *v3;

  v3 = (void *)qword_5439A8;
  if (!qword_5439A8)
  {
    v3 = (void *)objc_opt_new(NSMutableSet, a2);
    qword_5439A8 = (uint64_t)v3;
  }
  objc_msgSend(v3, "addObject:", +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", self));
}

- (void)_tsaxUpdateOriginatingButton:(id)a3
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2426CC;
  v5[3] = &unk_426E28;
  v5[4] = a3;
  v5[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  -[TSKPopoverControllerAccessibility _tsaxSetCachedOriginatingButton:](self, "_tsaxSetCachedOriginatingButton:", a3);
}

- (void)_tsaxUpdatePassthroughViewsWithOriginatingButton:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  _BOOL4 IsVoiceOverRunning;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  CGRect v38;
  CGRect v39;

  v36 = 0;
  v5 = (objc_class *)objc_opt_class(UIPopoverController);
  v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)self, 1, &v36);
  if (v36)
    abort();
  v7 = v6;
  v8 = (NSArray *)objc_msgSend(v6, "passthroughViews");
  v9 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    v8 = +[NSArray array](NSArray, "array");
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v12 = IsVoiceOverRunning;
  if (a3 && IsVoiceOverRunning && !-[NSArray containsObject:](v8, "containsObject:", a3))
    v8 = -[NSArray arrayByAddingObject:](v8, "arrayByAddingObject:", a3);
  v13 = (void *)objc_opt_new(NSMutableArray, v11);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (!v12)
          goto LABEL_16;
        v19 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
          goto LABEL_16;
        objc_msgSend(v18, "frame");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(objc_msgSend(v18, "window"), "bounds");
        v39.origin.x = v28;
        v39.origin.y = v29;
        v39.size.width = v30;
        v39.size.height = v31;
        v38.origin.x = v21;
        v38.origin.y = v23;
        v38.size.width = v25;
        v38.size.height = v27;
        if (!CGRectContainsRect(v38, v39))
LABEL_16:
          objc_msgSend(v13, "addObject:", v18);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }
  objc_msgSend(v7, "setPassthroughViews:", v13);

}

- (TSUIButtonAccessibility)_tsaxCurrentlyFocusedButton
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(UIButton);
  return (TSUIButtonAccessibility *)__TSAccessibilityCastAsClass(v2, (uint64_t)-[TSAccessibility currentlyFocusedElement](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "currentlyFocusedElement"), 0, 0);
}

@end
