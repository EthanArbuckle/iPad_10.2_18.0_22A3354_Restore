@implementation CRLCanvasViewAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasView");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLCanvasViewAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLCanvasAccessibility)crlaxCanvas
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxCanvas"));

  return (CRLCanvasAccessibility *)v3;
}

- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "controller"));

  v5 = (void *)objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v8;
}

- (CRLCanvasLayerAccessibility)crlaxCanvasLayer
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasLayer"));

  v5 = (void *)objc_opt_class(CRLCanvasLayerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasLayerAccessibility *)v8;
}

- (id)crlaxEnclosingScrollView
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));

  if (!v4)
  {
    if (-[CRLCanvasViewAccessibility crlaxRespondsToSelector:fromOptionalExtrasProtocol:](self, "crlaxRespondsToSelector:fromOptionalExtrasProtocol:", "crlaxSearchForAncestorViewOfType:", &OBJC_PROTOCOL___CRLCanvasViewAccessibilityExtras))
    {
      v5 = -[CRLCanvasViewAccessibility crlaxSearchForAncestorViewOfType:](self, "crlaxSearchForAncestorViewOfType:", NSClassFromString(CFSTR("CRLScrollView")));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)crlaxLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility crlaxLoadAccessibilityInformation](&v5, "crlaxLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxCanvas](self, "crlaxCanvas"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxAllReps"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "crlaxLoadAccessibilityInformation");

}

- (BOOL)_crlaxIsBeingDeallocated
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415398);
}

- (void)_crlaxSetBeingDeallocated:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415398, a3);
}

- (BOOL)_crlaxHasEnqueuedBlockToLoadChildren
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415399);
}

- (void)_crlaxSetHasEnqueuedBlockToLoadChildren:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415399, a3);
}

- (BOOL)crlaxShouldPreventReloadingChildren
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_10141539A);
}

- (void)crlaxSetShouldPreventReloadingChildren:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_10141539A, a3);
}

- (BOOL)crlaxHitTestingShouldReplaceElement:(id)a3 withTouchContainerView:(id)a4
{
  return 0;
}

- (BOOL)crlaxViewCanBeAddedToContainerElements:(id)a3
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxChildren](self, "crlaxChildren"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)accessibilityElements
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxChildren](self, "crlaxChildren"));
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v2, "count"))
  {
    v5 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", v5));
      objc_opt_class(_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        objc_msgSend(v3, "addObject:", v7);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
          v6 = v5;
      }
      else
      {
        objc_msgSend(v4, "addObject:", v7);
      }

      ++v5;
    }
    while (v5 < (unint64_t)objc_msgSend(v2, "count"));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v6, objc_msgSend(v3, "count")));
      objc_msgSend(v4, "insertObjects:atIndexes:", v3, v10);
      v11 = objc_msgSend(v4, "copy");

      v2 = v11;
    }
  }

  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  double v7;
  double v8;
  objc_super v9;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v6 = objc_msgSend(v5, "isInDrawingMode");

  v7 = -1.0;
  v8 = -1.0;
  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLCanvasViewAccessibility;
    -[CRLCanvasViewAccessibility accessibilityActivationPoint](&v9, "accessibilityActivationPoint", -1.0, -1.0);
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)crlaxIsReadyToLoadChildren
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  if ((objc_msgSend(v3, "crlaxCurrentlyWaitingOnThreadedLayoutAndRender") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = !-[CRLCanvasViewAccessibility crlaxShouldPreventReloadingChildren](self, "crlaxShouldPreventReloadingChildren");

  return v4;
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v4 = a3;
  if ((-[CRLCanvasViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) == 0)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v50 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxTarget](self, "crlaxTarget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));

    objc_opt_class(NSArray, v7);
    v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v50);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (v50)
LABEL_39:
      abort();
    v11 = (void *)v10;

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v16, "accessibilityElementsHidden") & 1) == 0
            && (objc_msgSend(v16, "isHidden") & 1) == 0)
          {
            objc_msgSend(v16, "alpha");
            if (v17 > 0.0)
            {
              if (objc_msgSend(v16, "isAccessibilityElement"))
                objc_msgSend(v4, "addObject:", v16);
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v13);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "crlaxFilteredTopLevelReps"));

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
          if ((objc_opt_respondsToSelector(v25, "crlaxAccessibilityElement") & 1) != 0)
          {
            v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "crlaxAccessibilityElement"));
          }
          else
          {
            objc_opt_class(_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton, v26);
            if ((objc_opt_isKindOfClass(v25, v28) & 1) == 0)
              goto LABEL_26;
            v27 = v25;
          }
          v29 = v27;
          if (v27)
          {
            objc_msgSend(v4, "addObject:", v27);

            continue;
          }
LABEL_26:
          if (CRLAccessibilityShouldPerformValidationChecks())
          {
            ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("crlaxAccessibilityElement must return an element!"), v31, v32, v33, v34, v35, v42))goto LABEL_39;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v22);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v36 = v4;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(_QWORD *)v43 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v41, "crlaxEnsureChildrenAreLoaded", (_QWORD)v42);
          objc_msgSend(v41, "setAccessibilityContainer:", self);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v38);
    }

  }
}

- (void)crlaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)crlaxDidInvalidateChildren
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "applicationState");

  if (!-[CRLCanvasViewAccessibility _crlaxHasEnqueuedBlockToLoadChildren](self, "_crlaxHasEnqueuedBlockToLoadChildren")
    && !-[CRLCanvasViewAccessibility _crlaxIsBeingDeallocated](self, "_crlaxIsBeingDeallocated")
    && !-[CRLCanvasViewAccessibility crlaxShouldPreventReloadingChildren](self, "crlaxShouldPreventReloadingChildren")
    && v4 != (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxCanvas"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxTarget"));

    -[CRLCanvasViewAccessibility _crlaxSetHasEnqueuedBlockToLoadChildren:](self, "_crlaxSetHasEnqueuedBlockToLoadChildren:", 1);
    objc_msgSend(v7, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002F1A80;
    v8[3] = &unk_10122D4C0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "afterLayoutIncludingLayers:performBlock:", 1, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
  CRLAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  CRLCanvasViewAccessibility *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CRLCanvasViewAccessibility *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CRLCanvasViewAccessibility *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  id v36;
  uint64_t v37;
  objc_class *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *j;
  void *v51;
  id v52;
  uint64_t v53;
  objc_class *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  CRLCanvasViewAccessibility *v64;
  CRLCanvasViewAccessibility *v65;
  void *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  CGPoint v90;
  CGRect v91;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[CRLCanvasViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility subviews](v8, "subviews"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v83;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v83 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v13);
        objc_msgSend(v14, "convertPoint:fromView:", v8, x, y);
        v15 = (CRLCanvasViewAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "__accessibilityHitTest:withEvent:", v7));
        if (-[CRLCanvasViewAccessibility isAccessibilityElement](v15, "isAccessibilityElement")
          || (v17 = -[CRLCanvasViewAccessibility accessibilityTraits](v15, "accessibilityTraits"),
              (CRLAccessibilityTraitTouchContainer & v17) != 0))
        {
          objc_opt_class(UIView, v16);
          if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0
            || (-[CRLCanvasViewAccessibility isHidden](v15, "isHidden") & 1) == 0)
          {
            break;
          }
        }

        if (v11 == (id)++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      v19 = -[CRLCanvasViewAccessibility isAccessibilityElement](v15, "isAccessibilityElement");

      if ((v19 & 1) != 0)
        goto LABEL_71;
    }
    else
    {
LABEL_13:

      v15 = 0;
    }
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility subviews](v8, "subviews"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v79;
LABEL_18:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v79 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v24);
        objc_msgSend(v25, "convertPoint:fromView:", v8, x, y);
        v26 = (CRLCanvasViewAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "__accessibilityHitTest:withEvent:", v7));
        if (-[CRLCanvasViewAccessibility isAccessibilityElement](v26, "isAccessibilityElement"))
        {
          objc_opt_class(UIView, v27);
          if ((objc_opt_isKindOfClass(v26, v28) & 1) == 0
            || !-[CRLCanvasViewAccessibility isHidden](v26, "isHidden"))
          {
            break;
          }
        }

        if (v22 == (id)++v24)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
          if (v22)
            goto LABEL_18;
          goto LABEL_26;
        }
      }
    }
    else
    {
LABEL_26:

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxCanvas](v8, "crlaxCanvas"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "crlaxMiniFormatterElements"));

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v20 = v30;
      v31 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v75;
        while (2)
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v75 != v33)
              objc_enumerationMutation(v20);
            v35 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
            v73 = 0;
            v36 = v35;
            objc_opt_class(UIView, v37);
            v39 = __CRLAccessibilityCastAsClass(v38, (uint64_t)v36, 1, &v73);
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (v73)
LABEL_74:
              abort();
            v41 = (id)v40;

            if (v41)
            {
              objc_msgSend(v41, "convertPoint:fromView:", v8, x, y);
              v26 = (CRLCanvasViewAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "__accessibilityHitTest:withEvent:", v7));
              if (-[CRLCanvasViewAccessibility isAccessibilityElement](v26, "isAccessibilityElement"))
              {
                objc_opt_class(UIView, v42);
                if ((objc_opt_isKindOfClass(v26, v43) & 1) == 0
                  || !-[CRLCanvasViewAccessibility isHidden](v26, "isHidden"))
                {
                  v45 = v20;
                  goto LABEL_68;
                }
              }

            }
          }
          v32 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
          if (v32)
            continue;
          break;
        }
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxCanvas](v8, "crlaxCanvas"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "crlaxMiniFormatterView"));

      if (v45 && (objc_msgSend(v45, "frame"), v90.x = x, v90.y = y, CGRectContainsPoint(v91, v90)))
      {
        v26 = 0;
      }
      else
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxCanvas](v8, "crlaxCanvas", v45));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "crlaxTopLevelRepsOmittingMiniFormatterElements"));

        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v41 = v47;
        v48 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
        if (v48)
        {
          v49 = v48;
          v68 = *(_QWORD *)v70;
          while (2)
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(_QWORD *)v70 != v68)
                objc_enumerationMutation(v41);
              v51 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
              v73 = 0;
              v52 = v51;
              objc_opt_class(UIView, v53);
              v55 = __CRLAccessibilityCastAsClass(v54, (uint64_t)v52, 1, &v73);
              v56 = objc_claimAutoreleasedReturnValue(v55);
              if (v73)
                goto LABEL_74;
              v57 = (void *)v56;

              if (v57)
              {
                objc_msgSend(v57, "convertPoint:fromView:", v8, x, y);
                v26 = (CRLCanvasViewAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "__accessibilityHitTest:withEvent:", v7));
                if (-[CRLCanvasViewAccessibility isAccessibilityElement](v26, "isAccessibilityElement"))
                {
                  objc_opt_class(UIView, v58);
                  if ((objc_opt_isKindOfClass(v26, v59) & 1) == 0
                    || !-[CRLCanvasViewAccessibility isHidden](v26, "isHidden"))
                  {
                    v60 = v41;
                    v45 = v67;
                    goto LABEL_67;
                  }
                }

              }
            }
            v49 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
            if (v49)
              continue;
            break;
          }
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](v8, "crlaxInteractiveCanvasController"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "_accessibilityHitTest:withEvent:", v7, x, y));
        v62 = v61;
        if (v61
          && ((objc_msgSend(v61, "isAccessibilityElement") & 1) != 0
           || (v63 = (unint64_t)objc_msgSend(v62, "accessibilityTraits"),
               (CRLAccessibilityTraitTouchContainer & v63) != 0))
          || (v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility __accessibilityHitTest:withEvent:](v8, "__accessibilityHitTest:withEvent:", v7, x, y)), v62, (v62 = v57) != 0))
        {
          v64 = v62;

          v57 = v64;
        }
        else
        {
          v64 = v8;
        }
        v45 = v67;
        if (v15
          && (!v64
           || -[CRLCanvasViewAccessibility crlaxHitTestingShouldReplaceElement:withTouchContainerView:](v8, "crlaxHitTestingShouldReplaceElement:withTouchContainerView:", v64, v15)))
        {
          v65 = v15;

          v64 = v65;
        }
        v8 = v64;
        v26 = v8;
LABEL_67:

LABEL_68:
      }

    }
    v15 = v26;
LABEL_71:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)accessibilityLabel
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = objc_msgSend(v2, "crlaxShouldLabelCanvas");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Canvas"), 0, 0));

    v12 = __CRLAccessibilityStringForVariables(1, v5, v6, v7, v8, v9, v10, v11, (uint64_t)CFSTR("__CRLAccessibilityStringForVariablesSentinel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasViewAccessibility;
  v3 = -[CRLCanvasViewAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[CRLCanvasViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v5 = CRLAccessibilityTraitTouchContainer;
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  return 1;
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasViewAccessibility;
  v2 = -[CRLCanvasViewAccessibility _accessibilitySpeakThisElementsAndStrings](&v6, "_accessibilitySpeakThisElementsAndStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayOfObjectsPassingTest:", &stru_10124F658));

  return v4;
}

- (id)accessibilityDropPointDescriptors
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  id v30;

  -[CRLCanvasViewAccessibility crlaxCGRectValueForKey:](self, "crlaxCGRectValueForKey:", CFSTR("_accessibilityVisibleFrame"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v11, "convertRect:fromView:", 0, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Drop Item"), 0, 0));
  v23 = sub_100061400(v13, v15, v17, v19);
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxTarget](self, "crlaxTarget"));
  v27 = objc_msgSend(v20, "initWithName:point:inView:", v22, v26, v23, v25);

  v30 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));

  return v28;
}

- (id)_accessibilityTextOperations
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasViewAccessibility;
  v4 = -[CRLCanvasViewAccessibility _accessibilityTextOperations](&v8, "_accessibilityTextOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "crlaxAddObjectsFromArrayIfNotNil:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility selectObjectsActionTitle](self, "selectObjectsActionTitle"));
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

- (BOOL)accessibilityEditOperationAction:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility selectObjectsActionTitle](self, "selectObjectsActionTitle"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxCanvasEditor"));
    objc_msgSend(v8, "enterQuickSelectMode:", 0);

    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLCanvasViewAccessibility;
    v9 = -[CRLCanvasViewAccessibility accessibilityEditOperationAction:](&v11, "accessibilityEditOperationAction:", v4);
  }

  return v9;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coordinateSpace"));

  return (UICoordinateSpace *)v3;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasViewAccessibility _crlaxLeafChildren](self, "_crlaxLeafChildren"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "accessibilityFrame");
        v26.origin.x = v15;
        v26.origin.y = v16;
        v26.size.width = v17;
        v26.size.height = v18;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        if (CGRectContainsRect(v25, v26)
          && objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___UIFocusItem))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_crlaxLeafChildren
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLCanvasViewAccessibility _crlaxInsertLeafElements:intoArray:](self, "_crlaxInsertLeafElements:intoArray:", self, v3);
  objc_msgSend(v3, "removeObject:", self);
  return v3;
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility didAddSubview:](&v4, "didAddSubview:", a3);
  -[CRLCanvasViewAccessibility crlaxInvalidateChildren](self, "crlaxInvalidateChildren");
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility willRemoveSubview:](&v4, "willRemoveSubview:", a3);
  -[CRLCanvasViewAccessibility crlaxInvalidateChildren](self, "crlaxInvalidateChildren");
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility exchangeSubviewAtIndex:withSubviewAtIndex:](&v5, "exchangeSubviewAtIndex:withSubviewAtIndex:", a3, a4);
  -[CRLCanvasViewAccessibility crlaxInvalidateChildren](self, "crlaxInvalidateChildren");
}

- (void)bringSubviewToFront:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility bringSubviewToFront:](&v4, "bringSubviewToFront:", a3);
  -[CRLCanvasViewAccessibility crlaxInvalidateChildren](self, "crlaxInvalidateChildren");
}

- (void)sendSubviewToBack:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility sendSubviewToBack:](&v4, "sendSubviewToBack:", a3);
  -[CRLCanvasViewAccessibility crlaxInvalidateChildren](self, "crlaxInvalidateChildren");
}

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvasViewAccessibility _crlaxSetBeingDeallocated:](self, "_crlaxSetBeingDeallocated:", 1);
  -[CRLCanvasViewAccessibility crlaxInvalidateChildren](self, "crlaxInvalidateChildren");
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasViewAccessibility;
  -[CRLCanvasViewAccessibility dealloc](&v3, "dealloc");
}

- (void)_crlaxInsertLeafElements:(id)a3 intoArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityElements"));
  if (objc_msgSend(v6, "isAccessibilityElement"))
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[CRLCanvasViewAccessibility _crlaxInsertLeafElements:intoArray:](self, "_crlaxInsertLeafElements:intoArray:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), v7, (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)selectObjectsActionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Select Objects…"), 0, 0));

  return v3;
}

- (id)commentActionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Comment"), 0, 0));

  return v3;
}

@end
