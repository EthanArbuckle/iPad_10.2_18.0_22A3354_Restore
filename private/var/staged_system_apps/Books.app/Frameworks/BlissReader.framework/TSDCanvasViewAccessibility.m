@implementation TSDCanvasViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCanvasView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)tsaxTarget
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(TSDCanvasView);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDCanvasAccessibility)tsaxCanvas
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxCanvas](-[TSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCanvas");
}

- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("controller")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (CALayer)tsaxCanvasLayer
{
  objc_class *v3;
  CALayer *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(CALayer);
  result = (CALayer *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layer")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxEnclosingScrollView
{
  id result;
  Class v4;

  result = -[TSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("enclosingScrollView"));
  if (!result)
  {
    if (-[TSDCanvasViewAccessibility tsaxRespondsToSelector:fromOptionalExtrasProtocol:](self, "tsaxRespondsToSelector:fromOptionalExtrasProtocol:", "tsaxSearchForAncestorViewOfType:", &OBJC_PROTOCOL___TSDCanvasViewAccessibilityExtras))
    {
      v4 = NSClassFromString(CFSTR("TSKScrollView"));
      return -[TSDCanvasViewAccessibility tsaxSearchForAncestorViewOfType:](self, "tsaxSearchForAncestorViewOfType:", v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[NSSet makeObjectsPerformSelector:](-[TSDCanvasAccessibility tsaxAllReps](-[TSDCanvasViewAccessibility tsaxCanvas](self, "tsaxCanvas"), "tsaxAllReps"), "makeObjectsPerformSelector:", "tsaxLoadAccessibilityInformation");
}

- (BOOL)_tsaxIsBeingDeallocated
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439F0);
}

- (void)_tsaxSetBeingDeallocated:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439F0, a3);
}

- (BOOL)tsaxCanMoveAXFocusIntoContent
{
  TSDCanvasViewAccessibility *v2;
  unsigned __int8 v3;

  if (!self)
    return 1;
  v2 = self;
  do
  {
    v3 = -[TSDCanvasViewAccessibility accessibilityElementsHidden](v2, "accessibilityElementsHidden");
    if ((v3 & 1) != 0)
      break;
    v2 = (TSDCanvasViewAccessibility *)-[TSDCanvasViewAccessibility accessibilityContainer](v2, "accessibilityContainer");
  }
  while (v2);
  return v3 ^ 1;
}

- (BOOL)tsaxHitTestingShouldReplaceElement:(id)a3 withTouchContainerView:(id)a4
{
  return 0;
}

- (BOOL)tsaxViewCanBeAddedToContainerElements:(id)a3
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return !-[TSDInteractiveCanvasControllerAccessibility tsaxCurrentlyWaitingOnThreadedLayoutAndRender](-[TSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCurrentlyWaitingOnThreadedLayoutAndRender");
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];

  if ((-[TSDCanvasViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) == 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v39 = 0;
    v5 = (objc_class *)objc_opt_class(NSArray);
    v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)-[TSDCanvasViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("subviews")), 1, &v39);
    if (v39)
LABEL_34:
      abort();
    v7 = v6;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "accessibilityElementsHidden") & 1) == 0
            && (objc_msgSend(v12, "isHidden") & 1) == 0)
          {
            objc_msgSend(v12, "alpha");
            if (v13 > 0.0)
            {
              if (objc_msgSend(v12, "isAccessibilityElement"))
                objc_msgSend(a3, "addObject:", v12);
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v9);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = -[TSDCanvasAccessibility tsaxTopLevelReps](-[TSDCanvasViewAccessibility tsaxCanvas](self, "tsaxCanvas"), "tsaxTopLevelReps");
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v19 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "tsaxAccessibilityElement");
          if (v19)
          {
            objc_msgSend(a3, "addObject:", v19);
          }
          else if (TSAccessibilityShouldPerformValidationChecks())
          {
            ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("tsaxAccessibilityElement must return an element!"), v21, v22, v23, v24, v25, v31))goto LABEL_34;
          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v16);
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(a3);
          v30 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v30, "tsaxEnsureChildrenAreLoaded");
          objc_msgSend(v30, "setAccessibilityContainer:", self);
        }
        v27 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v27);
    }
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)tsaxDidInvalidateChildren
{
  if (!-[TSDCanvasViewAccessibility _tsaxIsBeingDeallocated](self, "_tsaxIsBeingDeallocated"))
    -[TSDCanvasViewAccessibility tsaxEnsureChildrenAreLoaded](self, "tsaxEnsureChildrenAreLoaded");
  TSAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TSDCanvasViewAccessibility *v14;
  uint64_t v15;
  TSDCanvasViewAccessibility *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  TSDCanvasViewAccessibility *v24;
  TSDCanvasViewAccessibility *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  y = a3.y;
  x = a3.x;
  if (!-[TSDCanvasViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:"))
    return 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = -[TSDCanvasViewAccessibility subviews](self, "subviews");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
LABEL_4:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
      objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
      v14 = (TSDCanvasViewAccessibility *)objc_msgSend(v13, "__accessibilityHitTest:withEvent:", a4);
      if (-[TSDCanvasViewAccessibility isAccessibilityElement](v14, "isAccessibilityElement")
        || (int *)-[TSDCanvasViewAccessibility accessibilityContainerType](v14, "accessibilityContainerType") == &dword_4)
      {
        v15 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0
          || (-[TSDCanvasViewAccessibility isHidden](v14, "isHidden") & 1) == 0)
        {
          break;
        }
      }
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v10)
          goto LABEL_4;
        goto LABEL_13;
      }
    }
    v16 = v14;
    if (-[TSDCanvasViewAccessibility isAccessibilityElement](v14, "isAccessibilityElement"))
      return v16;
  }
  else
  {
LABEL_13:
    v14 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = -[TSDCanvasViewAccessibility subviews](self, "subviews", 0);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
LABEL_18:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v21);
      objc_msgSend(v22, "convertPoint:fromView:", self, x, y);
      v16 = (TSDCanvasViewAccessibility *)objc_msgSend(v22, "__accessibilityHitTest:withEvent:", a4);
      if (-[TSDCanvasViewAccessibility isAccessibilityElement](v16, "isAccessibilityElement"))
      {
        v23 = objc_opt_class(UIView);
        if ((objc_opt_isKindOfClass(v16, v23) & 1) == 0
          || !-[TSDCanvasViewAccessibility isHidden](v16, "isHidden"))
        {
          break;
        }
      }
      if (v19 == (id)++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v19)
          goto LABEL_18;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v24 = -[TSDInteractiveCanvasControllerAccessibility _accessibilityHitTest:withEvent:](-[TSDCanvasViewAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "_accessibilityHitTest:withEvent:", a4, x, y);
    if (!v24
      || (v16 = v24, !-[TSDCanvasViewAccessibility isAccessibilityElement](v24, "isAccessibilityElement"))
      && (int *)-[TSDCanvasViewAccessibility accessibilityContainerType](v16, "accessibilityContainerType") != &dword_4)
    {
      v25 = (TSDCanvasViewAccessibility *)-[TSDCanvasViewAccessibility __accessibilityHitTest:withEvent:](self, "__accessibilityHitTest:withEvent:", a4, x, y);
      if (v25)
        v16 = v25;
      else
        v16 = self;
    }
    if (v14
      && (!v16
       || -[TSDCanvasViewAccessibility tsaxHitTestingShouldReplaceElement:withTouchContainerView:](self, "tsaxHitTestingShouldReplaceElement:withTouchContainerView:", v16, v14)))
    {
      return v14;
    }
  }
  return v16;
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("canvas.general.description"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility didAddSubview:](&v4, "didAddSubview:", a3);
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](self, "tsaxInvalidateChildrenEventually");
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility willRemoveSubview:](&v4, "willRemoveSubview:", a3);
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](self, "tsaxInvalidateChildrenEventually");
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility exchangeSubviewAtIndex:withSubviewAtIndex:](&v5, "exchangeSubviewAtIndex:withSubviewAtIndex:", a3, a4);
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](self, "tsaxInvalidateChildrenEventually");
}

- (void)bringSubviewToFront:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility bringSubviewToFront:](&v4, "bringSubviewToFront:", a3);
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](self, "tsaxInvalidateChildrenEventually");
}

- (void)sendSubviewToBack:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility sendSubviewToBack:](&v4, "sendSubviewToBack:", a3);
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](self, "tsaxInvalidateChildrenEventually");
}

- (void)dealloc
{
  objc_super v3;

  -[TSDCanvasViewAccessibility _tsaxSetBeingDeallocated:](self, "_tsaxSetBeingDeallocated:", 1);
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenImmediately](self, "tsaxInvalidateChildrenImmediately");
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasViewAccessibility;
  -[TSDCanvasViewAccessibility dealloc](&v3, "dealloc");
}

@end
