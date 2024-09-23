@implementation CRLCanvasRepAccessibility

- (id)_crlaxRepContainerElementCache
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101414EA0);
}

- (void)_crlaxSetRepContainerElementCache:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101414EA0, a3);
}

- (double)_crlaxLastBoundsAnnouncementTime
{
  double result;

  __CRLAccessibilityGetAssociatedTimeInterval(self, &unk_101414EA1);
  return result;
}

- (void)_crlaxSetLastBoundsAnnouncementTime:(double)a3
{
  __CRLAccessibilitySetAssociatedTimeInterval(self, &unk_101414EA1, a3);
}

+ (CGPoint)crlaxCurrentRepDragOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)&qword_101414EA8;
  v3 = *(double *)&qword_101414EB0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (void)crlaxSetCurrentRepDragOffset:(CGPoint)a3
{
  xmmword_101414EA8 = (__int128)a3;
}

- (BOOL)crlaxNeedsEditRotorMenu
{
  return 1;
}

- (CRLRepContainerAccessibilityElement)crlaxAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  CRLRepContainerAccessibilityElement *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepContainerElementCache](self, "_crlaxRepContainerElementCache"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCanvasContainerView"));

    if (v5)
    {
      v6 = -[CRLRepContainerAccessibilityElement initWithRep:accessibilityParent:]([CRLRepContainerAccessibilityElement alloc], "initWithRep:accessibilityParent:", self, v5);
      -[CRLCanvasRepAccessibility _crlaxSetRepContainerElementCache:](self, "_crlaxSetRepContainerElementCache:", v6);

    }
  }
  return (CRLRepContainerAccessibilityElement *)-[CRLCanvasRepAccessibility _crlaxRepContainerElementCache](self, "_crlaxRepContainerElementCache");
}

- (CRLiOSCanvasViewControllerAccessibility)crlaxCanvasViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxCanvasViewController"));

  return (CRLiOSCanvasViewControllerAccessibility *)v3;
}

- (BOOL)crlaxIsInDrawingMode
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  return v5;
}

- (BOOL)crlaxNeedsFormatEditOperation
{
  _BOOL4 v3;

  if (-[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected")
    || (v3 = -[CRLCanvasRepAccessibility crlaxIsSelectedIgnoringLocking](self, "crlaxIsSelectedIgnoringLocking")))
  {
    LOBYTE(v3) = !-[CRLCanvasRepAccessibility crlaxIsInDrawingMode](self, "crlaxIsInDrawingMode");
  }
  return v3;
}

- (id)crlaxLayoutDescription
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
  objc_msgSend(v4, "alignmentFrameInRoot");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxFirstSelectedRep"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crlaxLayout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxTarget"));
  objc_msgSend(v16, "alignmentFrameInRoot");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  return +[CRLNearbyElementRotorSearchController nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:](CRLNearbyElementRotorSearchController, "nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:", v6, v8, v10, v12, v18, v20, v22, v24);
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 0;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;

  if (-[CRLCanvasRepAccessibility crlaxSupportsPublicCustomRotors](self, "crlaxSupportsPublicCustomRotors"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxCustomRotors"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)crlaxReaderModeCopyOperationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Copy"), 0, 0));

  return v3;
}

- (id)crlaxReaderModeEditOperationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Edit"), 0, 0));

  return v3;
}

- (id)crlaxReaderModeEditOperations
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxReaderModeCopyOperationTitle](self, "crlaxReaderModeCopyOperationTitle"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxReaderModeEditOperationTitle](self, "crlaxReaderModeEditOperationTitle"));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return v5;
}

- (id)hitRep:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  void *v8;
  id v10;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  if (objc_msgSend(v6, "needsAccessibilityElements")
    && !-[CRLCanvasRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v10 = -[CRLCanvasRepAccessibility accessibilityElementCount](self, "accessibilityElementCount");

    if ((uint64_t)v10 <= 0)
    {
      v8 = 0;
      return v8;
    }
  }
  else
  {

  }
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasRepAccessibility;
  v7 = -[CRLCanvasRepAccessibility hitRep:](&v11, "hitRep:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  return v8;
}

- (id)_accessibilityTextOperations
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
  v6 = objc_msgSend(v5, "documentIsSharedReadOnly");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Copy"), 0, 0));
    objc_msgSend(v3, "addObject:", v8);

  }
  else if (-[CRLCanvasRepAccessibility crlaxNeedsEditRotorMenu](self, "crlaxNeedsEditRotorMenu"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibilityEditMenuController sharedController](CRLAccessibilityEditMenuController, "sharedController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentEditors"));

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v18, "crlaxAddContextualMenuOptionsToArray:atPoint:") & 1) != 0)
          {
            -[CRLCanvasRepAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
            objc_msgSend(v18, "crlaxAddContextualMenuOptionsToArray:atPoint:", v9);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v15);
    }

    v20 = (void *)objc_opt_class(CRLiOSCanvasViewControllerAccessibility, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
    v22 = __CRLAccessibilityCastAsSafeCategory(v20, (uint64_t)v21, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "crlaxBasicEditMenuItemNames"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v24));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    objc_msgSend(v25, "intersectSet:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));
    v28 = objc_msgSend(v27, "mutableCopy");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "crlaxEditMenuItemProvider"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "editMenuTitlesForItemProvider:", v30));
    objc_msgSend(v28, "addObjectsFromArray:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v28));
    v33 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _adjustActionNamesForSet:](self, "_adjustActionNamesForSet:", v32));

    v3 = (void *)v33;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v35 = objc_msgSend(v34, "copy");

  return v35;
}

- (id)_adjustActionNamesForSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Front"), 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "member:", v5));

  if (v6)
  {
    objc_msgSend(v3, "removeObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Bring To Front"), 0, 0));
    objc_msgSend(v3, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Back"), 0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "member:", v10));

  if (v11)
  {
    objc_msgSend(v3, "removeObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Send To Back"), 0, 0));
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;

  v4 = a3;
  if (-[CRLCanvasRepAccessibility crlaxNeedsFormatEditOperation](self, "crlaxNeedsFormatEditOperation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility CRLAXShowFormatOptionsString](CRLCanvasRepAccessibility, "CRLAXShowFormatOptionsString"));
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      -[CRLCanvasRepAccessibility _crlaxGoToFormatInspector](self, "_crlaxGoToFormatInspector");
      LOBYTE(v7) = 1;
      goto LABEL_15;
    }
  }
  if (!-[CRLCanvasRepAccessibility crlaxNeedsEditRotorMenu](self, "crlaxNeedsEditRotorMenu"))
  {
    LOBYTE(v7) = 0;
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Send To Back"), 0, 0));
  v10 = objc_msgSend(v4, "isEqualToString:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if (v10)
  {
    v13 = CFSTR("Back");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Bring To Front"), 0, 0));
    v15 = objc_msgSend(v4, "isEqualToString:", v14);

    if (!v15)
      goto LABEL_11;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("Front");
  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, 0, 0));

  v4 = (id)v16;
LABEL_11:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibilityEditMenuController sharedController](CRLAccessibilityEditMenuController, "sharedController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "crlaxEditMenuItemProvider"));
  v7 = objc_msgSend(v17, "performActionTitled:forEditMenuProvider:", v4, v19);

  if (v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
    v21 = objc_msgSend(v20, "crlaxIsInEyeDropperMode");

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
      objc_msgSend(v22, "crlaxCancelEyeDropperMode");

    }
  }

LABEL_15:
  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[CRLCanvasRepAccessibility crlaxIsSelectedIgnoringLocking](self, "crlaxIsSelectedIgnoringLocking");
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityElements
{
  void *v3;

  if (-[CRLCanvasRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxChildren](self, "crlaxChildren"));
  return v3;
}

- (id)accessibilityContainer
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  objc_msgSend(v3, "crlaxEnsureChildrenAreLoaded");

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasRepAccessibility;
  v4 = -[CRLCanvasRepAccessibility accessibilityContainer](&v6, "accessibilityContainer");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)accessibilityPath
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  double v42;
  double v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  if (-[CRLCanvasRepAccessibility crlaxUsesAccessibilityPath](self, "crlaxUsesAccessibilityPath"))
  {
    if (-[CRLCanvasRepAccessibility crlaxUsesParentAccessibilityPath](self, "crlaxUsesParentAccessibilityPath"))
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityPath"));
LABEL_23:

      return v4;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxTarget"));
    v7 = objc_msgSend(v6, "isInGroup");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxTarget"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForClippingConnectionLines"));
      v3 = objc_msgSend(v10, "copy");

      if ((objc_msgSend(v3, "isEmpty") & 1) != 0)
      {
        v4 = 0;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
        v40 = *(_OWORD *)&CGAffineTransformIdentity.c;
        v41 = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&v46.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&v46.c = v40;
        v39 = *(_OWORD *)&CGAffineTransformIdentity.tx;
        *(_OWORD *)&v46.tx = v39;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxInspectorGeometry"));
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "crlaxAngleInRadians");
          *(_OWORD *)&v45.a = v41;
          *(_OWORD *)&v45.c = v40;
          *(_OWORD *)&v45.tx = v39;
          CGAffineTransformRotate(&v46, &v45, -v14);
          v45 = v46;
          objc_msgSend(v3, "transformUsingAffineTransform:", &v45);
          *(_OWORD *)&v46.a = v41;
          *(_OWORD *)&v46.c = v40;
          *(_OWORD *)&v46.tx = v39;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
          v16 = v15;
          if (!v15
            || (objc_msgSend(v15, "crlaxViewScale"),
                v44 = v46,
                CGAffineTransformScale(&v45, &v44, v17, v17),
                v46 = v45,
                objc_msgSend(v3, "transformUsingAffineTransform:", &v45),
                objc_msgSend(v3, "bounds"),
                v19 == CGSizeZero.width)
            && v18 == CGSizeZero.height)
          {
            v4 = 0;
          }
          else
          {
            *(_OWORD *)&v46.a = v41;
            *(_OWORD *)&v46.c = v40;
            *(_OWORD *)&v46.tx = v39;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));
            v21 = v20;
            if (v20)
            {
              objc_msgSend(v20, "transform");
              v22 = v43;
              objc_msgSend(v21, "transform");
              v23 = v42;
            }
            else
            {
              v23 = 0.0;
              v22 = 0.0;
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
            objc_msgSend(v24, "crlaxScreenPointFromUnscaledCanvas:", v22, v23);
            v26 = v25;
            v28 = v27;

            v44 = v46;
            CGAffineTransformTranslate(&v45, &v44, v26, v28);
            v46 = v45;
            objc_msgSend(v3, "transformUsingAffineTransform:", &v45);
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(objc_retainAutorelease(v3), "CGPath")));
            -[CRLCanvasRepAccessibility accessibilityFrame](self, "accessibilityFrame");
            v48 = CGRectInset(v47, -1.0, -1.0);
            x = v48.origin.x;
            y = v48.origin.y;
            width = v48.size.width;
            height = v48.size.height;
            objc_msgSend(v29, "bounds");
            v50.origin.x = v34;
            v50.origin.y = v35;
            v50.size.width = v36;
            v50.size.height = v37;
            v49.origin.x = x;
            v49.origin.y = y;
            v49.size.width = width;
            v49.size.height = height;
            if (CGRectContainsRect(v49, v50))
              v4 = v29;
            else
              v4 = 0;

          }
        }
        else
        {
          v4 = 0;
        }

      }
      goto LABEL_23;
    }
  }
  v4 = 0;
  return v4;
}

- (BOOL)crlaxUsesAccessibilityPath
{
  return 1;
}

- (id)accessibilityHint
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = objc_msgSend(v3, "crlaxIsInFollowingMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFollowAccessibilityExperienceCoordinator magicTapInstruction](_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator, "magicTapInstruction"));
  }
  else if (-[CRLCanvasRepAccessibility _crlaxCanBeSelected](self, "_crlaxCanBeSelected"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxSelectedReps"));
    v8 = objc_msgSend(v7, "count");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if (v8)
      v11 = CFSTR("Use the actions rotor to add to selection");
    else
      v11 = CFSTR("Double tap to select.");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, 0, 0));

  }
  else
  {
    v5 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLockedHint](self, "crlaxLockedHint"));
  v19 = __CRLAccessibilityStringForVariables(1, v12, v13, v14, v15, v16, v17, v18, (uint64_t)v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return v20;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  CGFloat MidX;
  double MidY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
  v7 = objc_msgSend(v6, "isCurrentlyInQuickSelectMode");

  MidX = -1.0;
  MidY = -1.0;
  if ((v7 & 1) == 0)
  {
    -[CRLCanvasRepAccessibility crlaxCGRectValueForKey:](self, "crlaxCGRectValueForKey:", CFSTR("_accessibilityVisibleFrame"));
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    MidX = CGRectGetMidX(v16);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MidY = CGRectGetMidY(v17);
  }
  v14 = MidX;
  result.y = MidY;
  result.x = v14;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  if (-[CRLCanvasRepAccessibility _crlaxCanBeSelected](self, "_crlaxCanBeSelected"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasRepAccessibility;
  return -[CRLCanvasRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  objc_msgSend(v3, "setFirstElementForUpcomingScreenChange:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  objc_msgSend(v4, "setShouldPreventFocusingCanvasResponderElementOnScreenChange:", 0);

  return -[CRLCanvasRepAccessibility crlaxSelect](self, "crlaxSelect");
}

- (id)_accessibilityParentView
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility _accessibilityParentView](&v6, "_accessibilityParentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  objc_class *v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *i;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  void *v101;
  _QWORD v102[4];
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  id v110;
  id v111;
  char v112;
  _BYTE v113[128];
  _QWORD v114[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[CRLCanvasRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxActionMenuItemsForRep:", self));
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  if (-[CRLCanvasRepAccessibility crlaxNeedsFormatEditOperation](self, "crlaxNeedsFormatEditOperation"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    if (objc_msgSend(v6, "crlaxIsInFollowingMode"))
    {

    }
    else
    {
      v7 = -[CRLCanvasRepAccessibility crlaxIsSelectable](self, "crlaxIsSelectable");

      if (v7)
      {
        v112 = 0;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
        v10 = (objc_class *)objc_opt_class(CRLiOSCanvasViewController, v9);
        v11 = __CRLAccessibilityCastAsClass(v10, (uint64_t)v8, 1, &v112);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (v112)
          goto LABEL_40;
        v13 = (void *)v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "miniFormatterPresenter"));
        v15 = objc_msgSend(v14, "isPresentingMiniFormatter");

        if (v15)
          v16 = objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility CRLAXJumpToFormatOptionsString](CRLCanvasRepAccessibility, "CRLAXJumpToFormatOptionsString"));
        else
          v16 = objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility CRLAXShowFormatOptionsString](CRLCanvasRepAccessibility, "CRLAXShowFormatOptionsString"));
        v17 = (void *)v16;
        v18 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v16, self, "_crlaxGoToFormatInspector");
        objc_msgSend(v3, "addObject:", v18);

      }
    }
  }
  v112 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInfo](self, "crlaxInfo"));
  v21 = (objc_class *)objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v20);
  v22 = __CRLAccessibilityCastAsClass(v21, (uint64_t)v19, 1, &v112);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (v112)
    goto LABEL_40;
  v24 = (void *)v23;

  if (-[CRLCanvasRepAccessibility crlaxIsInDrawingMode](self, "crlaxIsInDrawingMode") && v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "crlaxEditorController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "crlaxTarget"));
    v29 = objc_msgSend(v27, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLFreehandDrawingEditor, v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (objc_msgSend(v30, "crlaxShouldOfferSnapToShapeFromInfo:", v24))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "snapToShapeActionName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingEditor snapToShapeActionSymbolName](CRLFreehandDrawingEditor, "snapToShapeActionSymbolName"));
      v33 = objc_alloc((Class)UIAccessibilityCustomAction);
      v34 = v24;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v32, v35));
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_100167F24;
      v108[3] = &unk_10123D588;
      v109 = v31;
      v110 = v32;
      v111 = v30;
      v37 = v32;
      v38 = v31;
      v39 = objc_msgSend(v33, "initWithName:image:actionHandler:", v38, v36, v108);

      v24 = v34;
      objc_msgSend(v3, "addObject:", v39);

    }
  }
  if (-[CRLCanvasRepAccessibility crlaxIsSelectable](self, "crlaxIsSelectable")
    && -[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected"))
  {
    v40 = objc_alloc((Class)UIAccessibilityCustomAction);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Deselect All"), 0, 0));
    v43 = objc_msgSend(v40, "initWithName:target:selector:", v42, self, "crlaxDeselectAll");

    objc_msgSend(v3, "addObject:", v43);
  }
  if (-[CRLCanvasRepAccessibility crlaxMayRotate](self, "crlaxMayRotate"))
  {
    v44 = objc_alloc((Class)UIAccessibilityCustomAction);
    v101 = v24;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Rotate 90 degrees clockwise"), 0, 0));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("rotate.right.fill"), v47));
    v49 = objc_msgSend(v44, "initWithName:image:target:selector:", v46, v48, self, "crlaxRotateClockwise");

    v50 = objc_alloc((Class)UIAccessibilityCustomAction);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Rotate 90 degrees counterclockwise"), 0, 0));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("rotate.left.fill"), v53));
    v55 = objc_msgSend(v50, "initWithName:image:target:selector:", v52, v54, self, "crlaxRotateCounterclockwise");

    v24 = v101;
    v114[0] = v49;
    v114[1] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 2));
    objc_msgSend(v3, "addObjectsFromArray:", v56);

  }
  if (!-[CRLCanvasRepAccessibility crlaxIsSelectable](self, "crlaxIsSelectable"))
    goto LABEL_34;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInboundConnectedLayouts](self, "crlaxInboundConnectedLayouts"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility inboundConnectionsString](CRLCanvasRepAccessibility, "inboundConnectionsString"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _makeNavigateToConnectedElementCustomActionsFor:inCategory:directionType:](self, "_makeNavigateToConnectedElementCustomActionsFor:inCategory:directionType:", v57, v58, 2));
  objc_msgSend(v3, "addObjectsFromArray:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxOutboundConnectedLayouts](self, "crlaxOutboundConnectedLayouts"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility outboundConnectionsString](CRLCanvasRepAccessibility, "outboundConnectionsString"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _makeNavigateToConnectedElementCustomActionsFor:inCategory:directionType:](self, "_makeNavigateToConnectedElementCustomActionsFor:inCategory:directionType:", v60, v61, 4));
  objc_msgSend(v3, "addObjectsFromArray:", v62);

  v112 = 0;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v65 = (objc_class *)objc_opt_class(NSSet, v64);
  v66 = __CRLAccessibilityCastAsClass(v65, (uint64_t)v63, 1, &v112);
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  if (v112)
LABEL_40:
    abort();
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v68 = v67;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
  if (v69)
  {
    v71 = v69;
    v72 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v71; i = (char *)i + 1)
      {
        if (*(_QWORD *)v105 != v72)
          objc_enumerationMutation(v68);
        v74 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)i);
        v75 = (void *)objc_opt_class(CRLCanvasLayout, v70);
        v76 = (id)__CRLAccessibilityCastAsSafeCategory(v75, v74, 1, &v112);
        if (v112)
          goto LABEL_40;
      }
      v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
    }
    while (v71);
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("Connection Lines"), 0, 0));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _makeNavigateToConnectedElementCustomActionsFor:inCategory:directionType:](self, "_makeNavigateToConnectedElementCustomActionsFor:inCategory:directionType:", v68, v78, 0));
  objc_msgSend(v3, "addObjectsFromArray:", v79);

LABEL_34:
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v81 = objc_msgSend(v80, "crlaxIsInFollowingMode");

  if (v81)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "crlaxTarget"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "editingCoordinator"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "followCoordinator"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "accessibilityExperienceCoordinator"));

    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "lastFollowedParticipant"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "shortDisplayName"));

    v89 = objc_msgSend(v88, "length");
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v91 = v90;
    if (v89)
    {
      v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("Pause following %@"), 0, 0));

      v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v92, v88));
      v91 = (void *)v92;
    }
    else
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("Pause following"), 0, 0));
    }

    v94 = objc_alloc((Class)UIAccessibilityCustomAction);
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("pause.fill"), v95));
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_100167FA4;
    v102[3] = &unk_10122D588;
    v103 = v86;
    v97 = v86;
    v98 = objc_msgSend(v94, "initWithName:image:actionHandler:", v93, v96, v102);

    objc_msgSend(v3, "addObject:", v98);
  }
  v99 = objc_msgSend(v3, "copy");

  return v99;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  id v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForDragging"));

  v6 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
  v8 = sub_100221D0C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxTarget"));

  if (objc_msgSend(v4, "isSelected") && objc_msgSend(v9, "allowedToBeDragAndDropped"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));
    v13 = objc_msgSend(v12, "canvasEditorCanCopyWithSender:", 0);

    v14 = 0;
    if (v13)
    {
      objc_msgSend(v4, "crlaxCGRectValueForKey:", CFSTR("_accessibilityVisibleFrame"));
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "crlaxTarget"));
      objc_msgSend(v24, "convertRect:fromView:", 0, v16, v18, v20, v22);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      v33 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Drag Item"), 0, 0));
      v36 = sub_100061400(v26, v28, v30, v32);
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
      v40 = objc_msgSend(v33, "initWithName:point:inView:", v35, v39, v36, v38);

      v42 = v40;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  id v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForSelecting"));

  objc_msgSend(v4, "crlaxCGRectValueForKey:", CFSTR("_accessibilityVisibleFrame"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
  objc_msgSend(v14, "convertRect:fromView:", 0, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Drop Item"), 0, 0));
  v26 = sub_100061400(v16, v18, v20, v22);
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v30 = objc_msgSend(v23, "initWithName:point:inView:", v25, v29, v26, v28);

  v33 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));

  return v31;
}

- (BOOL)crlaxIsReadyToLoadChildren
{
  return +[NSThread isMainThread](NSThread, "isMainThread");
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4;
  CRLCanvasRepAccessibility *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  char *v24;
  id v25;
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
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v45 = 0;
  v5 = self;
  v7 = (objc_class *)objc_opt_class(CRLCanvasRep, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v45);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v45)
    goto LABEL_30;
  v10 = (void *)v9;

  v30 = v10;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childReps"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "crlaxAccessibilityElement"));
        if (v16)
        {
          objc_msgSend(v4, "addObject:", v16);
          objc_msgSend(v16, "crlaxEnsureChildrenAreLoaded");
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v13);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100168704;
  v39[3] = &unk_10122D3D8;
  v39[4] = v5;
  v17 = objc_alloc_init((Class)NSMutableArray);
  v40 = v17;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v39))
LABEL_30:
    abort();

  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v24 = (char *)objc_msgSend(v23, "accessibilityElementCount");
        if ((objc_msgSend(v23, "isAccessibilityElement") & 1) != 0
          || (unint64_t)(v24 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
        {
          objc_msgSend(v4, "addObject:", v23);
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v20);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v4;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)k), "setAccessibilityContainer:", v5);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
    }
    while (v27);
  }

}

- (void)crlaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)crlaxDidInvalidateChildren
{
  CRLAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (BOOL)crlaxSelect
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  BOOL v25;
  _QWORD v27[4];
  id v28;
  char v29;
  id v30;

  v30 = 0;
  v3 = -[CRLCanvasRepAccessibility _crlaxCanBeSelectedWithSelectableRepReference:](self, "_crlaxCanBeSelectedWithSelectableRepReference:", &v30);
  v5 = v30;
  if (v3)
  {
    v6 = objc_opt_class(CRLGroupRep, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0 && objc_msgSend(v5, "crlaxIsSelected"))
    {
      v29 = 0;
      v7 = v5;
      v9 = (objc_class *)objc_opt_class(CRLGroupRep, v8);
      v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v7, 1, &v29);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!v29)
      {
        v12 = (id)v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
        -[CRLCanvasRepAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
        objc_msgSend(v14, "convertPoint:fromView:", 0);
        v16 = v15;
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
        objc_msgSend(v19, "crlaxConvertBoundsToUnscaledPoint:", v16, v18);
        v21 = v20;
        v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:", 0, v21, v23));
        v25 = v24 != 0;

LABEL_9:
        goto LABEL_10;
      }
    }
    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100168900;
      v27[3] = &unk_10122D110;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
      v28 = v12;
      if (!__CRLAccessibilityPerformSafeBlock((uint64_t)v27))
      {

        objc_msgSend(v12, "crlaxSelectRep:", v5);
        CRLAccessibilityPostLayoutChangedNotification(0);
        v25 = 1;
        goto LABEL_9;
      }
    }
    abort();
  }
  v25 = 0;
LABEL_10:

  return v25;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvasRepAccessibility crlaxAccessibilityUnregister](self, "crlaxAccessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility dealloc](&v3, "dealloc");
}

- (void)dynamicDragDidBegin
{
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility dynamicDragDidBegin](&v5, "dynamicDragDidBegin");
  objc_opt_class(self, v3);
  objc_msgSend(v4, "crlaxSetCurrentRepDragOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  double Current;
  double v10;
  void *v11;
  const __CFString *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility dynamicallyResizingWithTracker:](&v26, "dynamicallyResizingWithTracker:", v4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    if (!objc_msgSend(v5, "isBeingResized"))
    {
LABEL_9:

      goto LABEL_10;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxTarget"));
    v8 = objc_msgSend(v7, "isBeingResized");

    if ((v8 & 1) == 0)
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[CRLCanvasRepAccessibility _crlaxLastBoundsAnnouncementTime](self, "_crlaxLastBoundsAnnouncementTime");
      if (Current - v10 > 0.5)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxRulerUnitsInstance"));

        if ((unint64_t)objc_msgSend(v5, "crlaxRulerUnits") >= 2)
          v12 = CFSTR("%.0f %@");
        else
          v12 = CFSTR("%.2f %@");
        objc_msgSend(v4, "crlaxCGRectValueForKey:", CFSTR("currentBoundsForStandardKnobs"));
        v14 = v13;
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxLocalizedCompatibleRulerUnitsForCanvas"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));

        objc_msgSend(v5, "crlaxConvertPointsToRulerUnits:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v19, v18));
        objc_msgSend(v5, "crlaxConvertPointsToRulerUnits:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v21, v18));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Width: %1$@, Height: %2$@"), 0, 0));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v20, v22));

        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v25);
        -[CRLCanvasRepAccessibility _crlaxSetLastBoundsAnnouncementTime:](self, "_crlaxSetLastBoundsAnnouncementTime:", Current);

        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (id)crlaxCompleteConnectionsCustomContent
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInboundConnectedLayouts](self, "crlaxInboundConnectedLayouts"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility inboundConnectionsString](CRLCanvasRepAccessibility, "inboundConnectionsString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v7, v6));
    -[NSMutableArray addObject:](v3, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxOutboundConnectedLayouts](self, "crlaxOutboundConnectedLayouts"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility outboundConnectionsString](CRLCanvasRepAccessibility, "outboundConnectionsString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v12, v11));
    -[NSMutableArray addObject:](v3, "addObject:", v13);

  }
  return v3;
}

- (void)crlaxPerformExtraCleanupTasksPriorToRemovalFromCanvas
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CRLCanvasRepAccessibility setAccessibilityContainer:](self, "setAccessibilityContainer:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
  objc_msgSend(v3, "crlaxInvalidateChildren");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepContainerElementCache](self, "_crlaxRepContainerElementCache"));
  objc_msgSend(v4, "crlaxInvalidateChildren");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepContainerElementCache](self, "_crlaxRepContainerElementCache"));
  objc_msgSend(v5, "setRep:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepContainerElementCache](self, "_crlaxRepContainerElementCache"));
  objc_msgSend(v6, "crlaxAccessibilityUnregister");

  -[CRLCanvasRepAccessibility crlaxAccessibilityUnregister](self, "crlaxAccessibilityUnregister");
}

- (id)_crlaxPrimaryTextEditor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  Protocol *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));

  v6 = NSProtocolFromString(CFSTR("CRLCanvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ((objc_msgSend(v5, "conformsToProtocol:", v7) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxCanvasEditor"));

    if ((objc_msgSend(v8, "conformsToProtocol:", v7) & 1) != 0)
    {
      v5 = v8;
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_crlaxCanBeSelectedWithSelectableRepReference:(id *)a3
{
  CRLCanvasRepAccessibility *v5;
  uint64_t v6;
  CRLCanvasRepAccessibility *v7;
  double v8;
  uint64_t v9;
  CRLCanvasRepAccessibility *v10;
  _BOOL4 v12;
  CRLCanvasRepAccessibility *v13;

  v5 = (CRLCanvasRepAccessibility *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
  v7 = v5;
  if (v5 && !-[CRLCanvasRepAccessibility crlaxIsSelected](v5, "crlaxIsSelected"))
  {
    v12 = 1;
    if (!a3)
      goto LABEL_14;
    goto LABEL_10;
  }
  *(_QWORD *)&v8 = objc_opt_class(CRLGroupRep, v6).n128_u64[0];
  v10 = (CRLCanvasRepAccessibility *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxAncestorOfType:](self, "crlaxAncestorOfType:", v9, v8));
  v12 = v7 != self && v10 == v7;

  if (a3)
  {
LABEL_10:
    if (v12)
      v13 = v7;
    else
      v13 = 0;
    *a3 = objc_retainAutorelease(v13);
  }
LABEL_14:

  return v12;
}

- (BOOL)_crlaxCanBeSelected
{
  return -[CRLCanvasRepAccessibility _crlaxCanBeSelectedWithSelectableRepReference:](self, "_crlaxCanBeSelectedWithSelectableRepReference:", 0);
}

- (void)_crlaxGoToFormatInspector
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v3, "crlaxGoToFormatInspector");

  v20 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
  objc_opt_class(CRLiOSCanvasViewController, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v20);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v20)
    goto LABEL_4;
  v9 = (void *)v8;

  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "miniFormatterPresenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxMiniFormatterViewController"));

  objc_opt_class(_TtC8Freeform33CRLiOSMiniFormatterViewController, v12);
  v14 = __CRLAccessibilityCastAsClass(v13, (uint64_t)v11, 1, &v19);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (v19)
LABEL_4:
    abort();
  v16 = (void *)v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxAccessibilityViews"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v18);
}

- (BOOL)_crlaxReaderModePerformCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxTarget"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPathWithInfo:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  +[CRLAccessibilityReaderModeCopyOperator performCopyOperationWithSelectionPath:interactiveCanvasController:sender:](CRLAccessibilityReaderModeCopyOperator, "performCopyOperationWithSelectionPath:interactiveCanvasController:sender:", v9, v4, v10);

  return 1;
}

- (id)_makeNavigateToConnectedElementCustomActionsFor:(id)a3 inCategory:(id)a4 directionType:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v30;
  void *v31;
  void *v32;
  id obj;
  NSMutableArray *v35;
  void *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v7 = a3;
  v37 = a4;
  v35 = objc_opt_new(NSMutableArray);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:](CRLCanvasRepAccessibility, "crlaxDisambiguatedConnectionDescriptionsForSet:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Go to %@"), 0, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Follow %1$@ to %2$@"), 0, 0));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:](CRLCanvasRepAccessibility, "crlaxBoardItemIDForLayout:", v14));
        if (v15)
        {
          v40 = 0;
          v16 = v14;
          objc_opt_class(CRLCanvasLayoutAccessibility, v17);
          v19 = __CRLAccessibilityCastAsSafeCategory(v18, (uint64_t)v16, 1, &v40);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (v40)
            abort();
          v21 = (void *)v20;

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxDescriptionOfSingleConnectionLineConnectingToLayout:inDirection:](self, "crlaxDescriptionOfSingleConnectionLineConnectingToLayout:inDirection:", v16, a5));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v15));
          if (objc_msgSend(v22, "length"))
            v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v22, v23);
          else
            v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v23, v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v26 = objc_alloc((Class)UIAccessibilityCustomAction);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100169454;
          v38[3] = &unk_10123D5B0;
          v38[4] = self;
          v39 = v21;
          v27 = v21;
          v28 = objc_msgSend(v26, "initWithName:actionHandler:", v25, v38);
          objc_msgSend(v28, "setLocalizedActionRotorCategory:", v37);
          -[NSMutableArray addObject:](v35, "addObject:", v28);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v11);
  }

  return v35;
}

- (NSArray)preferredFocusEnvironments
{
  CRLCanvasRepAccessibility *v3;

  v3 = self;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));

  return (UIFocusEnvironment *)v3;
}

- (UIFocusItemContainer)focusItemContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));

  return (UIFocusItemContainer *)v3;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self));
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self));
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility parentFocusEnvironment](self, "parentFocusEnvironment"));
  v6 = objc_msgSend(v5, "shouldUpdateFocusInContext:", v4);

  return v6;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasRep");
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
  objc_opt_class(CRLCanvasRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxWasExplicitlyFocused
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415A78);
}

- (void)crlaxSetWasExplicitlyFocused:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415A78, a3);
}

- (NSArray)_crlaxKnobAccessibilityElementsCache
{
  return (NSArray *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415A79);
}

- (void)_crlaxSetKnobAccessibilityElementsCache:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415A79, a3);
}

- (BOOL)_crlaxShouldPreventAccessToCanvas
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415A7A);
}

- (void)_crlaxSetShouldPreventAccessToCanvas:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415A7A, a3);
}

- (BOOL)_crlaxKnobElementCacheIsInvalid
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415A7B);
}

- (void)_crlaxSetKnobElementCacheIsInvalid:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415A7B, a3);
}

- (BOOL)crlaxIsBeingRemoved
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415A7C);
}

- (void)crlaxSetIsBeingRemoved:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415A7C, a3);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  char v46;
  char v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLabel](self, "crlaxLabel"));
  if (-[CRLCanvasRepAccessibility crlaxIsContainedTextRep](self, "crlaxIsContainedTextRep"))
  {
    v47 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

    objc_opt_class(CRLCanvasRepAccessibility, v6);
    v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v5, 1, &v47);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (v47)
      goto LABEL_12;
    v10 = (void *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCollaboratorDescription](self, "crlaxCollaboratorDescription"));
    v19 = __CRLAccessibilityStringForVariables(1, v11, v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    v3 = (void *)v20;
  }
  if (v3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxGroupAndLockStatusString](self, "crlaxGroupAndLockStatusString"));
    v28 = __CRLAccessibilityStringForVariables(1, v3, v22, v23, v24, v25, v26, v27, (uint64_t)v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    goto LABEL_11;
  }
  v46 = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "info"));

  objc_opt_class(_TtC8Freeform12CRLBoardItem, v32);
  v34 = __CRLAccessibilityCastAsClass(v33, (uint64_t)v31, 1, &v46);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (v46)
LABEL_12:
    abort();
  v21 = (void *)v35;

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedName"));
  if (objc_msgSend(v36, "length"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxGroupAndLockStatusString](self, "crlaxGroupAndLockStatusString"));
    v44 = __CRLAccessibilityStringForVariables(1, v36, v38, v39, v40, v41, v42, v43, (uint64_t)v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v44);

  }
  else
  {
    v29 = 0;
  }

LABEL_11:
  return v29;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxValue](self, "crlaxValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCollaboratorDescription](self, "crlaxCollaboratorDescription"));
  v11 = __CRLAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxUserInputLabels](self, "crlaxUserInputLabels"));
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLCanvasRepAccessibility;
    v4 = -[CRLCanvasRepAccessibility accessibilityUserInputLabels](&v6, "accessibilityUserInputLabels");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (CRLCanvasRep)crlaxRetainedTarget
{
  void *v3;

  if (-[CRLCanvasRepAccessibility _crlaxShouldPreventAccessToCanvas](self, "_crlaxShouldPreventAccessToCanvas"))
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  return (CRLCanvasRep *)v3;
}

- (CGRect)crlaxFrameInUnscaledCanvas
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "frameInUnscaledCanvasForMarqueeSelecting");
  else
    objc_msgSend(v5, "frameInUnscaledCanvas");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)crlaxLayerFrameInScaledCanvas
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRetainedTarget](self, "crlaxRetainedTarget"));
  objc_msgSend(v2, "layerFrameInScaledCanvas");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)crlaxCenterInUnscaledCanvas
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[CRLCanvasRepAccessibility crlaxFrameInUnscaledCanvas](self, "crlaxFrameInUnscaledCanvas");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (CGRect)crlaxFrameInScreenSpace
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
  -[CRLCanvasRepAccessibility crlaxFrameInUnscaledCanvas](self, "crlaxFrameInUnscaledCanvas");
  objc_msgSend(v3, "crlaxScreenFrameFromUnscaledCanvas:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CRLCanvasAccessibility)crlaxCanvas
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvas"));

  objc_opt_class(CRLCanvasAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasAccessibility *)v8;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxInteractiveCanvasController"));

  objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v8;
}

- (CRLCanvasViewAccessibility)crlaxCanvasView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxCanvasView"));

  return (CRLCanvasViewAccessibility *)v3;
}

- (CRLCanvasRepAccessibility)crlaxParentRep
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentRep"));

  objc_opt_class(CRLCanvasRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasRepAccessibility *)v8;
}

- (CRLCanvasElementInfo)crlaxInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));

  return (CRLCanvasElementInfo *)v3;
}

- (CRLCanvasLayoutAccessibility)crlaxLayout
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));

  objc_opt_class(CRLCanvasLayoutAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasLayoutAccessibility *)v8;
}

- (BOOL)crlaxIsSelectedIgnoringLocking
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "isSelectedIgnoringLocking");

  if ((v4 & 1) != 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxTarget"));
  v8 = objc_msgSend(v7, "isSelectedIgnoringLocking");

  return v8;
}

- (BOOL)crlaxIsSelected
{
  void *v3;
  unsigned __int8 v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "isSelected");

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
    if (objc_msgSend(v6, "crlaxIsSelected"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
      objc_opt_class(CRLGroupRep, v8);
      v5 = objc_opt_isKindOfClass(v7, v9) ^ 1;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5 & 1;
}

- (BOOL)crlaxIsSelectable
{
  CRLCanvasRepAccessibility *v2;
  CRLCanvasRepAccessibility *v3;

  v2 = self;
  v3 = (CRLCanvasRepAccessibility *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (CRLCanvasRepAccessibility)crlaxRepForSelecting
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));

  if (v3)
  {
    v11 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repForSelecting"));

    objc_opt_class(CRLCanvasRepAccessibility, v6);
    v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v5, 1, &v11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (v11)
      abort();
    v3 = (void *)v9;

  }
  return (CRLCanvasRepAccessibility *)v3;
}

- (BOOL)crlaxShouldCreateKnobs
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "shouldCreateKnobs");

  return v3;
}

- (BOOL)crlaxIsDraggable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v3 = objc_msgSend(v2, "crlaxIsDraggable");

  return v3;
}

- (CGRect)crlaxNaturalBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "naturalBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)crlaxHeightDescription
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxInspectorGeometry"));
  objc_msgSend(v4, "crlaxSize");
  v6 = v5;

  if (v6 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxDescriptionOfPointValueConvertedToRulerUnit:", v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%1$@"), v8));
  }
  return (NSString *)v9;
}

- (NSString)crlaxWidthDescription
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxInspectorGeometry"));
  objc_msgSend(v4, "crlaxSize");
  v6 = v5;

  if (v6 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxDescriptionOfPointValueConvertedToRulerUnit:", v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%1$@"), v8));
  }
  return (NSString *)v9;
}

- (NSString)crlaxRotationDescription
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayout](self, "crlaxLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxInspectorGeometry"));
  objc_msgSend(v3, "crlaxAngleInDegrees");
  v5 = v4;

  if (v5 == 0.0)
  {
    v8 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%.0f degrees"), 0, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, *(_QWORD *)&v5));

  }
  return (NSString *)v8;
}

- (id)accessibilityCustomContent
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  _BYTE *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  NSMutableArray *v30;
  CRLCanvasRepAccessibility *v31;

  v3 = objc_opt_new(NSMutableArray);
  if ((objc_opt_respondsToSelector(self, "crlaxLayoutDescription") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxLayoutDescription](self, "crlaxLayoutDescription"));
  else
    v4 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Nearby"), 0, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v6, v4));
    -[NSMutableArray addObject:](v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxHeightDescription](self, "crlaxHeightDescription"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Height"), 0, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v10, v8));
    -[NSMutableArray addObject:](v3, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxWidthDescription](self, "crlaxWidthDescription"));
  if (objc_msgSend(v12, "length"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Width"), 0, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v14, v12));
    -[NSMutableArray addObject:](v3, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRotationDescription](self, "crlaxRotationDescription"));
  if (objc_msgSend(v16, "length"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Rotation"), 0, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v18, v16));
    -[NSMutableArray addObject:](v3, "addObject:", v19);

  }
  if ((objc_opt_respondsToSelector(self, "crlaxCompleteConnectionsCustomContent") & 1) != 0)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1004443C8;
    v29[3] = &unk_10122D3D8;
    v30 = v3;
    v31 = self;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v29))
      abort();

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v21 = objc_msgSend(v20, "count");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedLayouts](self, "crlaxConnectedLayouts"));
  v23 = objc_msgSend(v22, "count");

  if (v21 - v23 >= 1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v21 - v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Incomplete connections"), 0, 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v26, v24));
    -[NSMutableArray addObject:](v3, "addObject:", v27);

  }
  return v3;
}

- (BOOL)crlaxIsLocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isLocked");

  return v3;
}

- (NSString)crlaxLockedLabel
{
  void *v2;
  void *v3;

  if (-[CRLCanvasRepAccessibility crlaxIsLocked](self, "crlaxIsLocked"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Locked"), 0, 0));

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)crlaxLockedHint
{
  void *v2;
  void *v3;

  if (-[CRLCanvasRepAccessibility crlaxIsLocked](self, "crlaxIsLocked"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Locked items cannot be edited"), 0, 0));

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)crlaxContainsTitle
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTitle](self, "crlaxTitle"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)crlaxContainsCaption
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCaption](self, "crlaxCaption"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)crlaxIsTitle
{
  return 0;
}

- (BOOL)crlaxIsCaption
{
  return 0;
}

- (NSString)crlaxTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxDrawableInfoAccessibility](self, "_crlaxDrawableInfoAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxUserProvidedTitle"));

  return (NSString *)v3;
}

- (NSString)crlaxCaption
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxDrawableInfoAccessibility](self, "_crlaxDrawableInfoAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxUserProvidedCaption"));

  return (NSString *)v3;
}

- (NSString)crlaxTitleLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxDrawableInfoAccessibility](self, "_crlaxDrawableInfoAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxUserProvidedTitleLabel"));

  return (NSString *)v3;
}

- (NSString)crlaxCaptionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxDrawableInfoAccessibility](self, "_crlaxDrawableInfoAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxUserProvidedCaptionLabel"));

  return (NSString *)v3;
}

- (NSString)crlaxItemTypeDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxDrawableInfoAccessibility](self, "_crlaxDrawableInfoAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTypeDescription"));

  return (NSString *)v3;
}

- (id)_crlaxDrawableInfo
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInfo](self, "crlaxInfo", v3));
  v7 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)_crlaxDrawableInfoAccessibility
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(CRLBoardItemAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v8 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (BOOL)crlaxInReadOnlyMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = objc_msgSend(v2, "crlaxDocumentIsSharedReadOnly");

  return v3;
}

- (NSArray)crlaxKnobAccessibilityElements
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  id v16;
  CRLCanvasRepAccessibility *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v54;
  void *v55;
  id v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v71 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRetainedTarget](self, "crlaxRetainedTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "knobs"));

  objc_opt_class(NSArray, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v71);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v71)
LABEL_41:
    abort();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLCanvasKnobAccessibility, v10);
        v16 = (id)__CRLAccessibilityCastAsSafeCategory(v15, v14, 1, &v71);
        if (v71)
          goto LABEL_41;
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v11);
  }

  v17 = self;
  if (-[CRLCanvasRepAccessibility _crlaxKnobElementCacheIsInvalid](self, "_crlaxKnobElementCacheIsInvalid")
    || (v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxKnobAccessibilityElementsCache](self, "_crlaxKnobAccessibilityElementsCache")), v19 = objc_msgSend(v18, "count"), v20 = objc_msgSend(v8, "count"), v18, v19 != v20))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v54 = v8;
    v21 = v8;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v64;
      v56 = v21;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j);
          v71 = 0;
          v27 = v26;
          objc_opt_class(CRLCanvasKnobAccessibility, v28);
          v30 = __CRLAccessibilityCastAsSafeCategory(v29, (uint64_t)v27, 1, &v71);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (v71)
            goto LABEL_41;
          v32 = (void *)v31;

          if (v32)
          {
            if (objc_msgSend(v32, "crlaxKnobTag"))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](v17, "crlaxTarget"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "interactiveCanvasController"));
              v35 = objc_msgSend(v34, "documentIsSharedReadOnly");

              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "crlaxTarget"));
              v37 = objc_msgSend(v36, "worksWhenDocumentIsSharedReadOnly");

              if (!v35 || v37)
              {
                if (-[CRLCanvasRepAccessibility crlaxShouldCreateAccessibilityElementForKnob:](v17, "crlaxShouldCreateAccessibilityElementForKnob:", v32, v54))
                {
                  v61 = 0u;
                  v62 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxKnobAccessibilityElementsCache](v17, "_crlaxKnobAccessibilityElementsCache"));
                  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                  if (v39)
                  {
                    v40 = v39;
                    v41 = *(_QWORD *)v60;
LABEL_25:
                    v42 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v60 != v41)
                        objc_enumerationMutation(v38);
                      v43 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v42);
                      if ((objc_msgSend(v43, "isEqualToKnob:", v32) & 1) != 0)
                        break;
                      if (v40 == (id)++v42)
                      {
                        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                        if (v40)
                          goto LABEL_25;
                        goto LABEL_31;
                      }
                    }
                    v44 = v43;

                    v17 = self;
                    if (v44)
                      goto LABEL_34;
                  }
                  else
                  {
LABEL_31:

                    v17 = self;
                  }
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "crlaxIdentifier"));
                  v44 = -[CRLCanvasRepAccessibility crlaxNewKnobElementForKnob:withIdentifier:](v17, "crlaxNewKnobElementForKnob:withIdentifier:", v32, v45);

LABEL_34:
                  objc_msgSend(v44, "setParentRep:", v17);
                  objc_msgSend(v57, "crlaxAddObjectIfNotNil:", v44);

                  v21 = v56;
                }
              }
            }
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v23);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxKnobAccessibilityElementsCache](v17, "_crlaxKnobAccessibilityElementsCache"));
    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxKnobAccessibilityElementsCache](v17, "_crlaxKnobAccessibilityElementsCache"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v47));

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v57));
      objc_msgSend(v48, "minusSet:", v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allObjects"));
      -[CRLCanvasRepAccessibility _crlaxInvalidateKnobAccessibilityElements:](v17, "_crlaxInvalidateKnobAccessibilityElements:", v50);

    }
    -[CRLCanvasRepAccessibility _crlaxSetKnobAccessibilityElementsCache:](v17, "_crlaxSetKnobAccessibilityElementsCache:", v57, v54);
    -[CRLCanvasRepAccessibility _crlaxSetKnobElementCacheIsInvalid:](v17, "_crlaxSetKnobElementCacheIsInvalid:", 0);

    v8 = v55;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxKnobAccessibilityElementsCache](v17, "_crlaxKnobAccessibilityElementsCache"));
  v52 = objc_msgSend(v51, "copy");

  return (NSArray *)v52;
}

- (NSString)crlaxKnobLabel
{
  return (NSString *)&stru_1012A72B0;
}

- (id)crlaxKnobForTag:(unint64_t)a3 index:(unint64_t)a4 identifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v8 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "knobs"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v24;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v10);
      v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
      objc_opt_class(CRLCanvasKnobAccessibility, v12);
      v18 = __CRLAccessibilityCastAsSafeCategory(v17, v16, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v19)
      {
        if (objc_msgSend(v19, "crlaxKnobTag") == (id)a3 && objc_msgSend(v20, "crlaxNodeIndex") == (id)a4)
        {
          v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crlaxIdentifier"));

          if (v21 == v8)
            break;
        }
      }

      if (v13 == (id)++v15)
      {
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v20 = 0;
  }

  return v20;
}

- (id)crlaxKnobElementForTag:(unint64_t)a3 index:(unint64_t)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v8 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxKnobAccessibilityElements](self, "crlaxKnobAccessibilityElements"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "knobTag", (_QWORD)v18) == (id)a3 && objc_msgSend(v14, "knobNodeIndex") == (id)a4)
        {
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crlaxIdentifier"));

          if (v15 == v8)
          {
            v16 = v14;
            goto LABEL_13;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)crlaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (NSString)crlaxSummaryDescription
{
  void *v3;

  if ((objc_opt_respondsToSelector(self, "accessibilityLabel") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility accessibilityLabel](self, "accessibilityLabel"));
  else
    v3 = 0;
  return (NSString *)v3;
}

- (NSString)crlaxCollaboratorDescriptionDirect
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "shouldShowCollaboratorCursorHighlight");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "p_currentCollaboratorPresence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Selected by %@"), 0, 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7));
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (BOOL)crlaxSupportsChangeTracking
{
  return 0;
}

- (CGAffineTransform)crlaxTransformToConvertNaturalFromLayerRelative
{
  uint64_t *v4;
  __int128 v5;
  CGAffineTransform *result;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x5010000000;
  v11 = &unk_1010E66AB;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100445180;
  v7[3] = &unk_10122C5F0;
  v7[4] = self;
  v7[5] = &v8;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v4 = v9;
  v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v4 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (BOOL)crlaxIsInGroup
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));
  v4 = objc_msgSend(v3, "isInGroup");

  return v4;
}

- (NSString)crlaxGroupAndLockStatusString
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = -[CRLCanvasRepAccessibility crlaxIsLockedDirectly](self, "crlaxIsLockedDirectly");
  if (!-[CRLCanvasRepAccessibility crlaxIsLocked](self, "crlaxIsLocked"))
  {
    v5 = 0;
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = !-[CRLCanvasRepAccessibility crlaxIsLockedDirectly](self, "crlaxIsLockedDirectly");
  if (v4)
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("locked"), 0, 0));
    objc_msgSend(v3, "addObject:", v7);

  }
LABEL_6:
  if (-[CRLCanvasRepAccessibility crlaxIsInGroup](self, "crlaxIsInGroup"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxMostDirectGroupAccessibilityDescription](self, "crlaxMostDirectGroupAccessibilityDescription"));
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("in %@, group"), 0, 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8));
      objc_msgSend(v3, "addObject:", v11);

      if (!v5)
        goto LABEL_14;
    }
    else if ((v5 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("in group");
      goto LABEL_13;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = v12;
    v14 = CFSTR("in locked group");
LABEL_13:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, 0, 0));
    objc_msgSend(v3, "addObject:", v15);

LABEL_14:
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));

  return (NSString *)v16;
}

- (BOOL)crlaxIsLockedDirectly
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInfo](self, "crlaxInfo"));
  objc_opt_class(NSObject, v3);
  v5 = __CRLAccessibilityCastAsClassAndProtocol(v4, (Protocol *)&OBJC_PROTOCOL___CRLCanvasLockableElementInfo, v2, 1, &v10);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v10)
    abort();
  v7 = (void *)v6;

  if (v7)
    v8 = objc_msgSend(v7, "locked");
  else
    v8 = 0;

  return v8;
}

- (void)crlaxDeselectAll
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v2, "crlaxDeselectAll");

}

- (void)crlaxDeselectRep
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v3, "crlaxDeselectRep:", self);

}

- (void)crlaxAddToSelection
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v3, "crlaxAddRepToSelection:", self);

}

- (void)crlaxRotateClockwise
{
  -[CRLCanvasRepAccessibility _crlaxRotateClockwiseByDegrees:](self, "_crlaxRotateClockwiseByDegrees:", 90.0);
}

- (void)crlaxRotateCounterclockwise
{
  -[CRLCanvasRepAccessibility _crlaxRotateClockwiseByDegrees:](self, "_crlaxRotateClockwiseByDegrees:", -90.0);
}

- (void)_crlaxRotateClockwiseByDegrees:(double)a3
{
  void *v5;
  void *v6;
  CRLCanvasRepRotateTracker *v7;
  CRLCanvasRepAccessibilityRotationTrackerManipulator *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForRotating"));

  v7 = -[CRLCanvasRepRotateTracker initWithRep:]([CRLCanvasRepRotateTracker alloc], "initWithRep:", v6);
  v8 = objc_alloc_init(CRLCanvasRepAccessibilityRotationTrackerManipulator);
  -[CRLCanvasRepAccessibilityRotationTrackerManipulator setRotationTracker:](v8, "setRotationTracker:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxTarget"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tmCoordinator"));
  objc_msgSend(v11, "registerTrackerManipulator:", v8);
  objc_msgSend(v11, "takeControlWithTrackerManipulator:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dynamicOperationController"));
  objc_msgSend(v12, "beginOperation");
  v13 = objc_alloc((Class)NSSet);
  v16 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v15 = objc_msgSend(v13, "initWithArray:", v14);

  objc_msgSend(v12, "startTransformingReps:", v15);
  -[CRLCanvasRepRotateTracker addRotateDelta:](v7, "addRotateDelta:", a3 * 0.0174532925);
  objc_msgSend(v12, "handleTrackerManipulator:", v8);
  -[CRLCanvasRepAccessibilityRotationTrackerManipulator setDoneWithDynamicOperation:](v8, "setDoneWithDynamicOperation:", 1);
  objc_msgSend(v12, "handleTrackerManipulator:", v8);
  objc_msgSend(v10, "layoutIfNeeded");

}

- (BOOL)crlaxMayRotate
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForRotating"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  if (v4 != v5
    || -[CRLCanvasRepAccessibility crlaxIsInGroup](self, "crlaxIsInGroup")
    || -[CRLCanvasRepAccessibility crlaxIsLocked](self, "crlaxIsLocked")
    || -[CRLCanvasRepAccessibility crlaxInReadOnlyMode](self, "crlaxInReadOnlyMode"))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    if ((objc_msgSend(v8, "containsUnknownContent") & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
      v6 = objc_msgSend(v9, "crlaxIsInFollowingMode") ^ 1;

    }
  }

  return v6;
}

- (BOOL)crlaxIsContainedTextRep
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentRep"));

  if (v3)
  {
    objc_opt_class(CRLWPShapeRep, v4);
    isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)crlaxNewKnobElementForKnob:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  CRLCanvasKnobAccessibilityElement *v8;
  id v9;
  id v10;
  CRLCanvasKnobAccessibilityElement *v11;

  v6 = a4;
  v7 = a3;
  v8 = [CRLCanvasKnobAccessibilityElement alloc];
  v9 = objc_msgSend(v7, "crlaxKnobTag");
  v10 = objc_msgSend(v7, "crlaxNodeIndex");

  v11 = -[CRLCanvasKnobAccessibilityElement initWithKnobTag:nodeIndex:parentRep:identifier:](v8, "initWithKnobTag:nodeIndex:parentRep:identifier:", v9, v10, self, v6);
  return v11;
}

- (CGPoint)crlaxConvertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  CGPoint v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1010E66AB;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10044598C;
  v7[3] = &unk_1012348A0;
  v7[4] = self;
  v7[5] = &v9;
  v8 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v10[4];
  v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  v5 = v3;
  v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)crlaxConvertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGRect v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = &unk_1010E66AB;
  v17 = 0u;
  v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100445AA4;
  v11[3] = &unk_101257220;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)crlaxConvertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  CGPoint v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1010E66AB;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100445BA8;
  v7[3] = &unk_1012348A0;
  v7[4] = self;
  v7[5] = &v9;
  v8 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v10[4];
  v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  v5 = v3;
  v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)crlaxConvertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGRect v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = &unk_1010E66AB;
  v17 = 0u;
  v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100445CC0;
  v11[3] = &unk_101257220;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)crlaxConvertNaturalPointToScreenSpace:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToScreenSpace:](self, "crlaxConvertNaturalRectToScreenSpace:", a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)crlaxConvertNaturalRectToScreenSpace:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToUnscaledCanvas:](self, "crlaxConvertNaturalRectToUnscaledCanvas:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v12, "crlaxConvertUnscaledToBoundsRect:", v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crlaxCanvasView"));

  objc_msgSend(v22, "crlaxFrameFromBounds:", v14, v16, v18, v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)crlaxConvertLayerRelativeRectToNaturalRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvasRepAccessibility crlaxTransformToConvertNaturalFromLayerRelative](self, "crlaxTransformToConvertNaturalFromLayerRelative");
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)crlaxBezierPathContainsUnscaledCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  CRLCanvasRepAccessibility *v5;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathForClippingConnectionLines"));

  -[CRLCanvasRepAccessibility crlaxConvertNaturalPointFromUnscaledCanvas:](v5, "crlaxConvertNaturalPointFromUnscaledCanvas:", x, y);
  LOBYTE(v5) = objc_msgSend(v8, "containsPoint:");

  return (char)v5;
}

- (void)crlaxClearKnobAccessibilityElementCache
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxKnobAccessibilityElementsCache](self, "_crlaxKnobAccessibilityElementsCache"));
  -[CRLCanvasRepAccessibility _crlaxInvalidateKnobAccessibilityElements:](self, "_crlaxInvalidateKnobAccessibilityElements:", v3);

  -[CRLCanvasRepAccessibility _crlaxSetKnobAccessibilityElementsCache:](self, "_crlaxSetKnobAccessibilityElementsCache:", 0);
}

- (BOOL)crlaxShouldCreateAccessibilityElementForKnob:(id)a3
{
  return objc_msgSend(a3, "crlaxKnobTag") != 0;
}

- (BOOL)crlaxOpenURL
{
  CRLCanvasRepAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = self;
  objc_opt_class(_TtC8Freeform9CRLURLRep, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v10);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v10)
    abort();
  v7 = (void *)v6;

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "item"));
    +[CRLURLEditor openItemURLFor:](_TtC8Freeform12CRLURLEditor, "openItemURLFor:", v8);

  }
  return v7 != 0;
}

- (NSString)crlaxDescriptionForConnections
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility accessibilityLabel](self, "accessibilityLabel"));
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility accessibilityValue](self, "accessibilityValue"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  if (objc_msgSend(v3, "count"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSSet)crlaxConnectedConnectionLines
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepForConnectionLineMapping](self, "_crlaxRepForConnectionLineMapping"));
  v23 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedLayouts"));

  objc_opt_class(NSSet, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v23)
LABEL_11:
    abort();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLConnectionLineAbstractLayoutAccessibility, v11);
        v17 = (id)__CRLAccessibilityCastAsSafeCategory(v16, v15, 1, &v23);
        if (v23)
          goto LABEL_11;
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v12);
  }

  return (NSSet *)v9;
}

- (NSSet)crlaxConnectedLayouts
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepForConnectionLineMapping](self, "_crlaxRepForConnectionLineMapping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v5 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxOppositeConnectedLayoutFrom:", v12));

        if (v13)
          -[NSMutableSet addObject:](v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return (NSSet *)v5;
}

- (NSSet)crlaxInboundConnectedLayouts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxBidirectionallyConnectedLayouts](self, "crlaxBidirectionallyConnectedLayouts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxStrictlyInboundConnectedLayouts](self, "crlaxStrictlyInboundConnectedLayouts"));
  objc_msgSend(v4, "unionSet:", v5);

  return (NSSet *)v4;
}

- (NSSet)crlaxStrictlyInboundConnectedLayouts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxLayoutsConnectedByStrictlyInboundConnectionLines](self, "_crlaxLayoutsConnectedByStrictlyInboundConnectionLines"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxBidirectionallyConnectedLayouts](self, "crlaxBidirectionallyConnectedLayouts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_setBySubtractingSet:", v4));

  return (NSSet *)v5;
}

- (NSSet)crlaxOutboundConnectedLayouts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxBidirectionallyConnectedLayouts](self, "crlaxBidirectionallyConnectedLayouts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxStrictlyOutboundConnectedLayouts](self, "crlaxStrictlyOutboundConnectedLayouts"));
  objc_msgSend(v4, "unionSet:", v5);

  return (NSSet *)v4;
}

- (NSSet)crlaxStrictlyOutboundConnectedLayouts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxLayoutsConnectedByStrictlyOutboundConnectionLines](self, "_crlaxLayoutsConnectedByStrictlyOutboundConnectionLines"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxBidirectionallyConnectedLayouts](self, "crlaxBidirectionallyConnectedLayouts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_setBySubtractingSet:", v4));

  return (NSSet *)v5;
}

- (NSSet)crlaxBidirectionallyConnectedLayouts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxBidirectionallyConnectedLayoutsViaSingleBidirectionalConnectionLines](self, "_crlaxBidirectionallyConnectedLayoutsViaSingleBidirectionalConnectionLines"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxBidirectionallyConnectedLayoutsViaMultipleUnidirectionalConnectionLines](self, "_crlaxBidirectionallyConnectedLayoutsViaMultipleUnidirectionalConnectionLines"));
  objc_msgSend(v4, "unionSet:", v5);

  return (NSSet *)v4;
}

- (id)crlaxAvailableRepsForConnecting
{
  return -[CRLCanvasRepAccessibility _crlaxAvailableRepsForConnectingSorted](self, "_crlaxAvailableRepsForConnectingSorted");
}

- (BOOL)crlaxHasAvailableRepsForConnecting
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxAvailableRepsForConnecting](self, "_crlaxAvailableRepsForConnecting"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)crlaxDescriptionOfSingleConnectionLineConnectingToLayout:(id)a3 inDirection:(int)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxConnectionLinesConnectingToLayout:inDirection:](self, "_crlaxConnectionLinesConnectingToLayout:inDirection:", a3, *(_QWORD *)&a4));
  if (objc_msgSend(v4, "count") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxTarget"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shapeInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityDescription"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)clraxNumberOfStrictlyInboundConnectionsFromLayout:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxConnectionLinesConnectingToLayout:inDirection:](self, "_crlaxConnectionLinesConnectingToLayout:inDirection:", a3, 1));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unint64_t)clraxNumberOfStrictlyOutboundConnectionsToLayout:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxConnectionLinesConnectingToLayout:inDirection:](self, "_crlaxConnectionLinesConnectingToLayout:inDirection:", a3, 3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unint64_t)clraxNumberOfBidirectionalSingleConnectionsForLayout:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxConnectionLinesConnectingToLayout:inDirection:](self, "_crlaxConnectionLinesConnectingToLayout:inDirection:", a3, 5));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

+ (id)crlaxDisambiguatedConnectionDescriptionsForSet:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  NSString *v40;
  void *v41;
  void *v42;
  id v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  char v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  CGPoint v70;

  v3 = a3;
  v53 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v66 = 0;
  v5 = v3;
  objc_opt_class(NSSet, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v66);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v66)
LABEL_35:
    abort();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLCanvasLayoutAccessibility, v12);
        v18 = (id)__CRLAccessibilityCastAsSafeCategory(v17, v16, 1, &v66);
        if (v66)
          goto LABEL_35;
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v13);
  }

  v47 = v5;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v59 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "crlaxDescriptionForConnections"));
        v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v25));
        if (!v26)
          v26 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v26, "addObject:", v24);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v21);
  }
  v46 = v19;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v55;
    v50 = v4;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v55 != v49)
          objc_enumerationMutation(obj);
        v52 = v27;
        v28 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v28));
        if (objc_msgSend(v29, "count"))
        {
          v30 = 1;
          do
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v30 - 1));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "crlaxTarget"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:](CRLCanvasRepAccessibility, "crlaxBoardItemIDForLayout:", v32));

            if (v33)
            {
              if (objc_msgSend(v29, "count") == (id)1)
              {
                objc_msgSend(v53, "setObject:forKeyedSubscript:", v28, v33);
              }
              else
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility disambiguatedConnectionDescriptionFormat](CRLCanvasRepAccessibility, "disambiguatedConnectionDescriptionFormat"));
                v35 = v28;
                v36 = objc_msgSend(v29, "count");
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "crlaxTarget"));
                objc_msgSend(v37, "frameInRoot");
                v70.x = sub_1000630C4(v38, v39);
                v40 = NSStringFromCGPoint(v70);
                v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                v45 = v36;
                v28 = v35;
                v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v34, v35, v30, v45, v41));
                objc_msgSend(v53, "setObject:forKeyedSubscript:", v42, v33);

              }
            }

          }
          while (v30++ < (unint64_t)objc_msgSend(v29, "count"));
        }

        v27 = v52 + 1;
        v4 = v50;
      }
      while ((id)(v52 + 1) != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v51);
  }

  return v53;
}

+ (id)crlaxBoardItemIDForLayout:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v12;

  v3 = a3;
  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  objc_opt_class(_TtC8Freeform12CRLBoardItem, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v12)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
  return v10;
}

- (BOOL)crlaxFullscreenPreviewFile
{
  CRLCanvasRepAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = self;
  objc_opt_class(_TtC8Freeform10CRLFileRep, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  if (v7)
    objc_msgSend(v7, "enterPreviewMode");

  return v7 != 0;
}

- (void)i_willBeRemoved
{
  objc_super v3;
  _QWORD v4[5];

  -[CRLCanvasRepAccessibility crlaxSetIsBeingRemoved:](self, "crlaxSetIsBeingRemoved:", 1);
  -[CRLCanvasRepAccessibility _crlaxSetShouldPreventAccessToCanvas:](self, "_crlaxSetShouldPreventAccessToCanvas:", 1);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100446D18;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  CRLAccessibilityPerformBlockOnMainThread(v4);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility i_willBeRemoved](&v3, "i_willBeRemoved");
}

- (void)invalidateKnobs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility invalidateKnobs](&v3, "invalidateKnobs");
  -[CRLCanvasRepAccessibility _crlaxSetKnobElementCacheIsInvalid:](self, "_crlaxSetKnobElementCacheIsInvalid:", 1);
}

- (void)becameSelected
{
  void *v3;
  dispatch_time_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility becameSelected](&v5, "becameSelected");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  objc_msgSend(v3, "setFirstElementForUpcomingScreenChange:", self);

  v4 = dispatch_time(0, 500000000);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &stru_10125E7B0);
}

- (void)becameNotSelected
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepAccessibility;
  -[CRLCanvasRepAccessibility becameNotSelected](&v3, "becameNotSelected");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  objc_msgSend(v2, "setFirstElementForUpcomingScreenChange:", 0);

}

- (id)crlaxValueForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  if (-[CRLCanvasRepAccessibility _crlaxShouldPreventAccessToCanvas](self, "_crlaxShouldPreventAccessToCanvas")
    && -[CRLCanvasRepAccessibility _crlaxKeyCorrespondsToPropertyRequiringAccessToCanvas:](self, "_crlaxKeyCorrespondsToPropertyRequiringAccessToCanvas:", v4))
  {
    v5 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLCanvasRepAccessibility;
    v6 = -[CRLCanvasRepAccessibility crlaxValueForKey:](&v8, "crlaxValueForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (void)_crlaxInvalidateKnobAccessibilityElements:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setParentRep:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)_crlaxKeyCorrespondsToPropertyRequiringAccessToCanvas:(id)a3
{
  unint64_t v4;
  unsigned __int8 v5;
  BOOL v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = 0;
  v9 = *(_OWORD *)off_10125E7D0;
  v10 = *(_OWORD *)off_10125E7E0;
  v11 = *(_OWORD *)off_10125E7F0;
  v12 = *(_OWORD *)off_10125E800;
  do
  {
    v5 = objc_msgSend(a3, "isEqualToString:", *((_QWORD *)&v9 + v4), v9, v10, v11, v12);
    v6 = v5;
    if (v4 > 6)
      break;
    ++v4;
  }
  while ((v5 & 1) == 0);
  for (i = 56; i != -8; i -= 8)

  return v6;
}

- (id)_crlaxRepForConnectionLineMapping
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  if (-[CRLCanvasRepAccessibility crlaxIsContainedTextRep](self, "crlaxIsContainedTextRep"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_crlaxConnectionLinesConnectingToLayout:(id)a3 inDirection:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepForConnectionLineMapping](self, "_crlaxRepForConnectionLineMapping"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxOppositeConnectedLayoutFrom:", v7));
        if (v14 == v5)
        {
          v15 = objc_msgSend(v13, "crlaxIsVisuallyPointingAt:", v7);
          v16 = objc_msgSend(v13, "crlaxIsVisuallyPointingAt:", v5);
          switch(a4)
          {
            case 0:
              goto LABEL_17;
            case 1:
              if (((v15 ^ 1 | v16) & 1) != 0)
                break;
              goto LABEL_17;
            case 2:
              if (!v15)
                break;
              goto LABEL_17;
            case 3:
              if ((v16 & ~v15 & 1) == 0)
                break;
              goto LABEL_17;
            case 4:
              if ((v16 & 1) == 0)
                break;
              goto LABEL_17;
            case 5:
              if ((v15 & v16 & 1) != 0)
LABEL_17:
                objc_msgSend(v18, "addObject:", v13);
              break;
            default:
              break;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v18;
}

- (id)_crlaxAvailableRepsForConnecting
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  char v28;

  v28 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_opt_class(CRLInteractiveCanvasController, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v28);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v28)
    abort();
  v8 = (void *)v7;

  v9 = objc_alloc((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvas"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topLevelReps"));
  v12 = objc_msgSend(v9, "initWithArray:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
  LODWORD(v11) = objc_msgSend(v12, "containsObject:", v13);

  if ((_DWORD)v11)
  {
    if (objc_msgSend(v12, "count"))
    {
      for (i = 0; i < (unint64_t)objc_msgSend(v12, "count"); ++i)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", i));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
        if (v15 == v17)
        {
          isKindOfClass = 1;
        }
        else
        {
          objc_opt_class(CRLConnectionLineRep, v16);
          isKindOfClass = objc_opt_isKindOfClass(v15, v18);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxTarget](self, "crlaxTarget"));
        objc_opt_class(CRLConnectionLineRep, v21);
        v23 = objc_opt_isKindOfClass(v20, v22);

        if ((v23 & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layout"));
          if (objc_msgSend(v24, "isInGroup"))
          {

          }
          else
          {
            v25 = +[CRLConnectionLineRep canConnectToRep:](CRLConnectionLineRep, "canConnectToRep:", v15);

            if (!(isKindOfClass & 1 | ((v25 & 1) == 0)))
              goto LABEL_14;
          }
        }
        else if ((isKindOfClass & 1) == 0
               && (objc_msgSend(v15, "shouldCreateConnectionLineKnobs") & 1) != 0)
        {
          goto LABEL_14;
        }
        objc_msgSend(v12, "removeObjectAtIndex:", i--);
LABEL_14:

      }
    }
    v26 = v12;
  }
  else
  {
    v26 = &__NSArray0__struct;
  }

  return v26;
}

- (id)_crlaxAvailableRepsForConnectingSorted
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[8];

  -[CRLCanvasRepAccessibility crlaxFrameInUnscaledCanvas](self, "crlaxFrameInUnscaledCanvas");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxAvailableRepsForConnecting](self, "_crlaxAvailableRepsForConnecting"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004475E8;
  v14[3] = &unk_10125E810;
  v14[4] = v4;
  v14[5] = v6;
  v14[6] = v8;
  v14[7] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingComparator:", v14));

  return v12;
}

- (id)_crlaxLayoutsConnectedByStrictlyInboundConnectionLines
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepForConnectionLineMapping](self, "_crlaxRepForConnectionLineMapping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v6 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v4, (_QWORD)v15))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxOppositeConnectedLayoutFrom:", v4));
          if (v13 && (objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v13) & 1) == 0)
            -[NSMutableSet addObject:](v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_crlaxLayoutsConnectedByStrictlyOutboundConnectionLines
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepForConnectionLineMapping](self, "_crlaxRepForConnectionLineMapping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v6 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxOppositeConnectedLayoutFrom:", v4, (_QWORD)v15));
        if (v13
          && objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v13)
          && (objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v4) & 1) == 0)
        {
          -[NSMutableSet addObject:](v6, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_crlaxBidirectionallyConnectedLayoutsViaSingleBidirectionalConnectionLines
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxRepForConnectionLineMapping](self, "_crlaxRepForConnectionLineMapping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxConnectedConnectionLines](self, "crlaxConnectedConnectionLines"));
  v6 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxOppositeConnectedLayoutFrom:", v4, (_QWORD)v15));
        if (v13
          && objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v4)
          && objc_msgSend(v12, "crlaxIsVisuallyPointingAt:", v13))
        {
          -[NSMutableSet addObject:](v6, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_crlaxBidirectionallyConnectedLayoutsViaMultipleUnidirectionalConnectionLines
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxLayoutsConnectedByStrictlyInboundConnectionLines](self, "_crlaxLayoutsConnectedByStrictlyInboundConnectionLines"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility _crlaxLayoutsConnectedByStrictlyOutboundConnectionLines](self, "_crlaxLayoutsConnectedByStrictlyOutboundConnectionLines"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_setByIntersectingSet:", v5));

  return v6;
}

- (CGRect)_crlaxFrameByKnobPositions
{
  void *v2;
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxKnobAccessibilityElements](self, "crlaxKnobAccessibilityElements"));
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v3, "accessibilityFrame");
    x = v4;
    y = v6;
    width = v8;
    height = v10;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v2;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16), "accessibilityFrame", (_QWORD)v25);
          v33.origin.x = v17;
          v33.origin.y = v18;
          v33.size.width = v19;
          v33.size.height = v20;
          v30.origin.x = x;
          v30.origin.y = y;
          v30.size.width = width;
          v30.size.height = height;
          v31 = CGRectUnion(v30, v33);
          x = v31.origin.x;
          y = v31.origin.y;
          width = v31.size.width;
          height = v31.size.height;
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)crlaxMostDirectGroupAccessibilityDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v24;
  char v25;
  char v26;

  v26 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
  objc_opt_class(CRLGroupRepAccessibility, v3);
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v2, 1, &v26);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v26)
    goto LABEL_11;
  v7 = (void *)v6;

  if (v7)
  {
    v8 = 0;
    while (1)
    {
      v25 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxTarget"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));

      objc_opt_class(_TtC8Freeform12CRLBoardItem, v11);
      v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v25);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (v25)
        break;
      v15 = (void *)v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accessibilityDescription"));
      if (objc_msgSend(v16, "length"))
        goto LABEL_10;
      v24 = 0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxParentRep"));
      objc_opt_class(CRLGroupRepAccessibility, v18);
      v20 = __CRLAccessibilityCastAsSafeCategory(v19, (uint64_t)v17, 1, &v24);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (v24)
        break;
      v22 = (void *)v21;

      v8 = v16;
      v7 = v22;
      if (!v22)
        goto LABEL_10;
    }
LABEL_11:
    abort();
  }
  v16 = 0;
LABEL_10:

  return v16;
}

- (id)crlaxLabel
{
  return 0;
}

- (id)crlaxValue
{
  return 0;
}

- (id)crlaxUserInputLabels
{
  return 0;
}

+ (id)CRLAXJumpToFormatOptionsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Jump to format options"), 0, 0));

  return v3;
}

+ (id)CRLAXJumpTextToFormatOptionsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Jump to text format options"), 0, 0));

  return v3;
}

+ (id)CRLAXShowFormatOptionsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show format options"), 0, 0));

  return v3;
}

+ (id)inboundConnectionsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Inbound Connections"), 0, 0));

  return v3;
}

+ (id)outboundConnectionsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Outbound Connections"), 0, 0));

  return v3;
}

+ (id)bidirectionalConnectionsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Bidirectional Connections"), 0, 0));

  return v3;
}

+ (id)disambiguatedConnectionDescriptionFormat
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("%1$@ (%2$lu of %3$lu) at %4$@"), 0, 0));

  return v3;
}

- (BOOL)crlaxAllowsCaptionEditing
{
  return self->_crlaxAllowsCaptionEditing;
}

- (NSString)crlaxUploadStatusDescription
{
  return self->_crlaxUploadStatusDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxUploadStatusDescription, 0);
}

@end
