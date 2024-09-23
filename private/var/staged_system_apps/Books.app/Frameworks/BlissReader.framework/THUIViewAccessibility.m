@implementation THUIViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THUIViewAccessibility;
  objc_msgSendSuper2(&v4, "tsaxAddSafeCategoryDependenciesToCollection:");
  objc_msgSend(a3, "addObject:", CFSTR("TSUIViewAccessibility"));
}

- (void)dealloc
{
  objc_super v3;

  -[THUIViewAccessibility thaxSetPresentedWidgetPopoverController:](self, "thaxSetPresentedWidgetPopoverController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THUIViewAccessibility;
  -[THUIViewAccessibility dealloc](&v3, "dealloc");
}

- (THUIViewAccessibilityContainerElementsDataSource)thaxContainerElementsDataSource
{
  return (THUIViewAccessibilityContainerElementsDataSource *)__TSAccessibilityGetAssociatedObject(self, &unk_543A43);
}

- (void)thaxSetContainerElementsDataSource:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A43, a3);
}

- (BOOL)thaxCoversParentView
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A44);
}

- (void)thaxSetCoversParentView:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A44, a3);
}

- (BOOL)thaxShouldPreceedSiblingsForHitTesting
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A45);
}

- (void)thaxSetShouldPreceedSiblingsForHitTesting:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A45, a3);
}

- (BOOL)_thaxIsPerformingHitTest
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A46);
}

- (void)_thaxSetPerformingHitTest:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A46, a3);
}

- (id)_thaxPresentedWidgetPopoverController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A47);
}

- (void)_thaxSetPresentedWidgetPopoverController:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A47, a3);
}

- (void)thaxSetPresentedWidgetPopoverController:(id)a3
{
  objc_msgSend(-[THUIViewAccessibility _thaxPresentedWidgetPopoverController](self, "_thaxPresentedWidgetPopoverController"), "thaxSetPopoverParentView:", 0);
  objc_msgSend(a3, "thaxSetPopoverParentView:", self);
  -[THUIViewAccessibility _thaxSetPresentedWidgetPopoverController:](self, "_thaxSetPresentedWidgetPopoverController:", a3);
}

- (id)thaxDocumentViewController
{
  return objc_msgSend(objc_msgSend(-[objc_class tsaxValueForKey:](NSClassFromString(CFSTR("THApplePubAssetPlugin")), "tsaxValueForKey:", CFSTR("sharedPlugin")), "tsaxValueForKey:", CFSTR("currentBook")), "tsaxValueForKey:", CFSTR("documentViewController"));
}

- (BOOL)_thaxIsDescendentOfExpandedViewController
{
  THUIViewAccessibility *v2;
  id v3;
  THUIViewAccessibility *v4;

  v2 = self;
  v3 = objc_msgSend(-[THUIViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController"), "thaxExpandedViewController");
  if (v3)
  {
    v4 = (THUIViewAccessibility *)objc_msgSend(v3, "view");
    LOBYTE(v3) = v2 != 0;
    if (v2)
    {
      if (v4 != v2)
      {
        do
        {
          v2 = (THUIViewAccessibility *)-[THUIViewAccessibility superview](v2, "superview");
          LOBYTE(v3) = v2 != 0;
        }
        while (v2 && v2 != v4);
      }
    }
  }
  return (char)v3;
}

- (BOOL)_thaxDismissPresentedWidgetPopoverControllerIfAppropriate
{
  id v2;
  char v3;

  v2 = -[THUIViewAccessibility thaxPresentedWidgetPopoverController](self, "thaxPresentedWidgetPopoverController");
  v3 = objc_opt_respondsToSelector(v2, "dismissPopoverAnimated:");
  if ((v3 & 1) != 0)
    objc_msgSend(v2, "dismissPopoverAnimated:", 1);
  return v3 & 1;
}

- (BOOL)_thaxCanDismissPresentedWidgetPopoverController
{
  return objc_opt_respondsToSelector(-[THUIViewAccessibility thaxPresentedWidgetPopoverController](self, "thaxPresentedWidgetPopoverController"), "dismissPopoverAnimated:") & 1;
}

- (id)accessibilityLabel
{
  objc_super v4;

  if (-[THUIViewAccessibility _thaxCanDismissPresentedWidgetPopoverController](self, "_thaxCanDismissPresentedWidgetPopoverController"))
  {
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("popover.view.dimiss.region"));
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIViewAccessibility;
  return -[THUIViewAccessibility accessibilityLabel](&v4, "accessibilityLabel");
}

- (id)accessibilityHint
{
  objc_super v4;

  if (-[THUIViewAccessibility _thaxCanDismissPresentedWidgetPopoverController](self, "_thaxCanDismissPresentedWidgetPopoverController"))
  {
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("popover.view.dimiss.region.hint.iOS"));
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIViewAccessibility;
  return -[THUIViewAccessibility accessibilityHint](&v4, "accessibilityHint");
}

- (int64_t)accessibilityContainerType
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THUIViewAccessibility;
  v3 = -[THUIViewAccessibility accessibilityContainerType](&v5, "accessibilityContainerType");
  if (-[THUIViewAccessibility _thaxCanDismissPresentedWidgetPopoverController](self, "_thaxCanDismissPresentedWidgetPopoverController"))
  {
    return 4;
  }
  else
  {
    return (int64_t)v3;
  }
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  unsigned int v4;
  id v5;
  Class v6;
  objc_super v8;

  if (-[THUIViewAccessibility _thaxDismissPresentedWidgetPopoverControllerIfAppropriate](self, "_thaxDismissPresentedWidgetPopoverControllerIfAppropriate"))
  {
    goto LABEL_9;
  }
  v8.receiver = self;
  v8.super_class = (Class)THUIViewAccessibility;
  if (-[THUIViewAccessibility accessibilityPerformEscape](&v8, "accessibilityPerformEscape"))
    goto LABEL_9;
  if (-[THUIViewAccessibility _thaxIsDescendentOfExpandedViewController](self, "_thaxIsDescendentOfExpandedViewController"))
  {
    v3 = -[THUIViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
    if (v3)
    {
      objc_msgSend(v3, "thaxDismissExpandedViewController");
LABEL_9:
      LOBYTE(v4) = 1;
      return v4;
    }
  }
  v4 = objc_msgSend(-[THUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqualToString:", CFSTR("ChapterFlipView"));
  if (v4)
  {
    v5 = -[THUIViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("superview"));
    v6 = NSClassFromString(CFSTR("THFlipViewTransition"));
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      objc_msgSend(v5, "tsaxValueForKey:", CFSTR("flipClosed"));
      UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
      goto LABEL_9;
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  if (-[THUIViewAccessibility _thaxCanDismissPresentedWidgetPopoverController](self, "_thaxCanDismissPresentedWidgetPopoverController"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIViewAccessibility;
  return -[THUIViewAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction");
}

- (void)accessibilityActivate
{
  objc_super v3;

  if (!-[THUIViewAccessibility _thaxDismissPresentedWidgetPopoverControllerIfAppropriate](self, "_thaxDismissPresentedWidgetPopoverControllerIfAppropriate"))
  {
    v3.receiver = self;
    v3.super_class = (Class)THUIViewAccessibility;
    -[THUIViewAccessibility accessibilityActivate](&v3, "accessibilityActivate");
  }
}

- (id)accessibilityElements
{
  THUIViewAccessibilityContainerElementsDataSource *v3;
  objc_super v5;

  v3 = -[THUIViewAccessibility thaxContainerElementsDataSource](self, "thaxContainerElementsDataSource");
  if ((objc_opt_respondsToSelector(v3, "thaxContainerElementsForView:") & 1) != 0)
    return -[THUIViewAccessibilityContainerElementsDataSource thaxContainerElementsForView:](v3, "thaxContainerElementsForView:", self);
  v5.receiver = self;
  v5.super_class = (Class)THUIViewAccessibility;
  return -[THUIViewAccessibility accessibilityElements](&v5, "accessibilityElements");
}

- (id)__accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BOOL8 v8;
  id v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v8 = -[THUIViewAccessibility _thaxIsPerformingHitTest](self, "_thaxIsPerformingHitTest");
  -[THUIViewAccessibility _thaxSetPerformingHitTest:](self, "_thaxSetPerformingHitTest:", 1);
  v11.receiver = self;
  v11.super_class = (Class)THUIViewAccessibility;
  v9 = -[THUIViewAccessibility __accessibilityHitTest:withEvent:](&v11, "__accessibilityHitTest:withEvent:", a4, x, y);
  -[THUIViewAccessibility _thaxSetPerformingHitTest:](self, "_thaxSetPerformingHitTest:", v8);
  return v9;
}

- (id)subviews
{
  NSArray *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v27.receiver = self;
  v27.super_class = (Class)THUIViewAccessibility;
  v3 = -[THUIViewAccessibility subviews](&v27, "subviews");
  if (-[THUIViewAccessibility _thaxIsPerformingHitTest](self, "_thaxIsPerformingHitTest"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "thaxShouldPreceedSiblingsForHitTesting"))
          {
            if (!v6)
              v6 = (void *)objc_opt_new(NSMutableArray, v10);
            objc_msgSend(v6, "addObject:", v9);
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v5);
      if (v6)
      {
        v12 = (void *)objc_opt_new(NSMutableArray, v11);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v3);
              v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v17, "thaxShouldPreceedSiblingsForHitTesting") & 1) == 0)
                objc_msgSend(v12, "addObject:", v17);
            }
            v14 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
          }
          while (v14);
        }
        objc_msgSend(v12, "addObjectsFromArray:", v6);
        v3 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v12);

      }
    }
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  if (-[THUIViewAccessibility thaxCoversParentView](self, "thaxCoversParentView")
    && -[THUIViewAccessibility _thaxIsPerformingHitTest](self, "_thaxIsPerformingHitTest"))
  {
    v8 = -[THUIViewAccessibility superview](self, "superview");
    objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
    return objc_msgSend(v8, "pointInside:withEvent:", a4);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THUIViewAccessibility;
    return -[THUIViewAccessibility pointInside:withEvent:](&v10, "pointInside:withEvent:", a4, x, y);
  }
}

@end
