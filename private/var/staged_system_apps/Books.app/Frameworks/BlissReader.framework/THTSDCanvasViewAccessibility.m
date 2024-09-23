@implementation THTSDCanvasViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCanvasView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDCanvasViewAccessibility, a2);
}

- (THTSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  THTSDInteractiveCanvasControllerAccessibility *result;
  objc_super v6;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THTSDInteractiveCanvasControllerAccessibility);
  v6.receiver = self;
  v6.super_class = (Class)THTSDCanvasViewAccessibility;
  v4 = -[TSDCanvasViewAccessibility tsaxInteractiveCanvasController](&v6, "tsaxInteractiveCanvasController");
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7)
    abort();
  return result;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Class v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  if ((-[THTSDCanvasViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) == 0
    && !-[THTSDInteractiveCanvasControllerAccessibility thaxShouldIgnoreCanvas](-[THTSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldIgnoreCanvas"))
  {
    v6 = (void *)objc_opt_new(NSMutableArray, v5);
    v22.receiver = self;
    v22.super_class = (Class)THTSDCanvasViewAccessibility;
    -[TSDCanvasViewAccessibility tsaxLoadChildrenIntoCollection:](&v22, "tsaxLoadChildrenIntoCollection:", v6);
    if (-[THTSDInteractiveCanvasControllerAccessibility thaxShouldFilterOutNonVisibleReps](-[THTSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldFilterOutNonVisibleReps"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v12 = (objc_class *)objc_opt_class(TSDRepContainerAccessibilityElement);
            v13 = __TSAccessibilityCastAsClass(v12, v11, 0, 0);
            if (!v13)
              goto LABEL_12;
            v14 = (void *)v13;
            v17 = 0;
            v15 = (void *)objc_opt_class(THTSDRepAccessibility);
            v16 = __TSAccessibilityCastAsSafeCategory(v15, (uint64_t)objc_msgSend(v14, "rep"), 1, &v17);
            if (v17)
              abort();
            if (-[objc_class thaxIsVisibleOnPage](v16, "thaxIsVisibleOnPage"))
LABEL_12:
              objc_msgSend(a3, "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v8);
      }
    }
    else
    {
      objc_msgSend(a3, "addObjectsFromArray:", v6);
    }

  }
}

- (id)thaxDocumentViewController
{
  id v2;
  Class v3;

  v2 = objc_msgSend(-[THTSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("controller")), "tsaxValueForKey:", CFSTR("delegate"));
  v3 = NSClassFromString(CFSTR("THDocumentViewController"));
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  Class v10;
  double v11;
  double v12;
  id v13;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  if ((-[THTSDCanvasViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) != 0
    || -[THTSDInteractiveCanvasControllerAccessibility thaxShouldIgnoreCanvas](-[THTSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldIgnoreCanvas"))
  {
    return 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)THTSDCanvasViewAccessibility;
  v8 = -[TSDCanvasViewAccessibility _accessibilityHitTest:withEvent:](&v14, "_accessibilityHitTest:withEvent:", a4, x, y);
  if (objc_msgSend(v8, "isAccessibilityElement"))
  {
    v10 = NSClassFromString(CFSTR("TSDRep"));
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      if (objc_msgSend(v8, "tsaxBoolValueForKey:", CFSTR("_axAllowsSubElementHitTesting")))
      {
        if ((objc_opt_respondsToSelector(-[THTSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("controller")), "convertBoundsToUnscaledPoint:") & 1) != 0)
        {
          objc_msgSend(-[THTSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("controller")), "convertBoundsToUnscaledPoint:", x, y);
        }
        else
        {
          v11 = CGPointZero.x;
          v12 = CGPointZero.y;
        }
        v13 = objc_msgSend(v8, "_accessibilityHitTest:withEvent:", a4, v11, v12);
        if (objc_msgSend(v13, "isAccessibilityElement"))
          return v13;
      }
    }
  }
  return v8;
}

- (id)_accessibilityElementsInContainerIncludingContainers:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;

  v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)THTSDCanvasViewAccessibility;
  v5 = -[THTSDCanvasViewAccessibility _accessibilityElementsInContainerIncludingContainers:](&v26, "_accessibilityElementsInContainerIncludingContainers:");
  if (!v3)
    goto LABEL_5;
  if ((objc_msgSend(-[THTSDCanvasViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController"), "tsaxBoolValueForKey:", CFSTR("inFlowMode")) & 1) != 0)goto LABEL_5;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_5;
  if (objc_msgSend(v5, "lastObject") != self)
    goto LABEL_5;
  objc_msgSend(-[TSDCanvasViewAccessibility tsaxEnclosingScrollView](self, "tsaxEnclosingScrollView"), "accessibilityFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[THTSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("subviews"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v18 = v17;
    v6 = 0;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v21, "accessibilityContainerType") == &dword_4)
        {
          objc_msgSend(v21, "accessibilityFrame");
          v29.origin.x = v9;
          v29.origin.y = v11;
          v29.size.width = v13;
          v29.size.height = v15;
          if (CGRectIntersectsRect(v28, v29))
          {
            if (!v6)
              v6 = objc_msgSend(v5, "mutableCopy");
            objc_msgSend(v6, "addObject:", v21);
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v18);
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
  if (v6)
    return v6;
  else
    return v5;
}

- (int64_t)accessibilityContainerType
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTSDCanvasViewAccessibility;
  v3 = -[TSDCanvasViewAccessibility accessibilityContainerType](&v5, "accessibilityContainerType");
  if (-[THTSDInteractiveCanvasControllerAccessibility thaxIsMostOuterICC](-[THTSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxIsMostOuterICC"))
  {
    return (int64_t)v3;
  }
  else
  {
    return 0;
  }
}

- (id)_tsaxDirectChildForElement:(id)a3
{
  Class v5;

  v5 = NSClassFromString(CFSTR("TSDRep"));
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    objc_msgSend(a3, "setAccessibilityContainer:", self);
  return a3;
}

@end
