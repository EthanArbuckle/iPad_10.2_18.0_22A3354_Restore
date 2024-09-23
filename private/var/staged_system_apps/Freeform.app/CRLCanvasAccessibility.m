@implementation CRLCanvasAccessibility

- (BOOL)p_updateRepsFromLayouts
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasAccessibility;
  v3 = -[CRLCanvasAccessibility p_updateRepsFromLayouts](&v7, "p_updateRepsFromLayouts");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCanvasView"));
    objc_msgSend(v5, "crlaxInvalidateChildren");

  }
  return v3;
}

- (void)i_registerRep:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasAccessibility;
  -[CRLCanvasAccessibility i_registerRep:](&v6, "i_registerRep:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCanvasView"));
  objc_msgSend(v5, "crlaxInvalidateChildren");

}

- (void)i_unregisterRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxCanvasView"));
  v7 = objc_msgSend(v6, "crlaxShouldPreventReloadingChildren");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxCanvasView"));
  objc_msgSend(v9, "crlaxSetShouldPreventReloadingChildren:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxCanvasView"));
  objc_msgSend(v11, "crlaxInvalidateChildren");

  v14.receiver = self;
  v14.super_class = (Class)CRLCanvasAccessibility;
  -[CRLCanvasAccessibility i_unregisterRep:](&v14, "i_unregisterRep:", v4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxCanvasView"));
  objc_msgSend(v13, "crlaxSetShouldPreventReloadingChildren:", v7);

}

- (BOOL)crlaxIsPreventingReloadingChildren
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxCanvasContainerView](self, "crlaxCanvasContainerView"));
  objc_opt_class(CRLCanvasViewAccessibility, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v10);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v10)
    abort();
  v7 = (void *)v6;

  if (v7)
    v8 = objc_msgSend(v7, "crlaxShouldPreventReloadingChildren");
  else
    v8 = 0;

  return v8;
}

- (void)crlaxPreventReloadingChildren
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasAccessibility;
  -[CRLCanvasAccessibility crlaxPreventReloadingChildren](&v10, "crlaxPreventReloadingChildren");
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxCanvasContainerView](self, "crlaxCanvasContainerView"));
  objc_opt_class(CRLCanvasViewAccessibility, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v9)
    abort();
  v8 = (void *)v7;

  objc_msgSend(v8, "crlaxSetShouldPreventReloadingChildren:", 1);
}

- (void)crlaxRevertReloadingChildrenTo:(BOOL)a3 andReloadForChanges:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  objc_super v14;

  v4 = a4;
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLCanvasAccessibility;
  -[CRLCanvasAccessibility crlaxRevertReloadingChildrenTo:andReloadForChanges:](&v14, "crlaxRevertReloadingChildrenTo:andReloadForChanges:");
  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxCanvasContainerView](self, "crlaxCanvasContainerView"));
  objc_opt_class(CRLCanvasViewAccessibility, v8);
  v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v7, 1, &v13);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v13)
    abort();
  v12 = (void *)v11;

  objc_msgSend(v12, "crlaxSetShouldPreventReloadingChildren:", v5);
  if (v4 && !v5)
    objc_msgSend(v12, "crlaxInvalidateChildren");

}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvas");
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
  objc_opt_class(CRLCanvasAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasController"));

  objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v8;
}

- (BOOL)crlaxIsDoingLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "i_inLayout");

  return v3;
}

- (NSArray)crlaxMiniFormatterElements
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility _crlaxMiniFormatterVC](self, "_crlaxMiniFormatterVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxAccessibilityViews"));

  return (NSArray *)v3;
}

- (NSArray)crlaxTopLevelReps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTopLevelRepsOmittingMiniFormatterElements](self, "crlaxTopLevelRepsOmittingMiniFormatterElements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility _crlaxMiniFormatterVC](self, "_crlaxMiniFormatterVC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCurrentPresentedRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxAccessibilityViews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility _adjustRepOrderForMiniFormatterWith:forResults:withFormatterViews:](self, "_adjustRepOrderForMiniFormatterWith:forResults:withFormatterViews:", v5, v3, v6));

  return (NSArray *)v7;
}

- (id)_adjustRepOrderForMiniFormatterWith:(id)a3 forResults:(id)a4 withFormatterViews:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  id obj;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v14);
        if (v15 == v7)
        {
          objc_msgSend(v10, "addObject:", v7);
          objc_msgSend(v10, "addObjectsFromArray:", v9);
        }
        else
        {
          v27 = 0;
          v16 = v15;
          objc_opt_class(CRLGroupRep, v17);
          v19 = __CRLAccessibilityCastAsClass(v18, (uint64_t)v16, 1, &v27);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (v27)
            abort();
          v21 = (void *)v20;

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allRepsContainedInGroup"));
          v23 = objc_msgSend(v22, "containsObject:", v7);

          objc_msgSend(v10, "addObject:", v16);
          if (v23)
            objc_msgSend(v10, "addObjectsFromArray:", v9);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  v24 = objc_msgSend(v10, "copy");
  return v24;
}

- (NSSet)crlaxAllReps
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = objc_msgSend(v3, "crlaxCurrentlyWaitingOnThreadedLayoutAndRender");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allReps"));

  }
  return (NSSet *)v5;
}

- (id)crlaxCanvasContainerView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxCanvasView"));

  return v3;
}

- (CGRect)crlaxScreenFrameFromUnscaledCanvas:(CGRect)a3
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
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[CRLCanvasAccessibility crlaxConvertUnscaledToBoundsRect:](self, "crlaxConvertUnscaledToBoundsRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxCanvasContainerView](self, "crlaxCanvasContainerView"));
  objc_msgSend(v12, "crlaxFrameFromBounds:", v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)crlaxScreenPointFromUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxCanvasView"));
  objc_msgSend(v5, "crlaxConvertUnscaledToBoundsPoint:", x, y);
  objc_msgSend(v6, "crlaxFramePointFromBoundsPoint:");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)crlaxConvertUnscaledToBoundsRect:(CGRect)a3
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
  v11[2] = sub_10048FF60;
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

- (double)crlaxViewScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "viewScale");
  v4 = v3;

  return v4;
}

- (BOOL)crlaxIsAnchoredAtRight
{
  return -[CRLCanvasAccessibility crlaxBoolValueForKey:](self, "crlaxBoolValueForKey:", CFSTR("mIsAnchoredAtRight"));
}

- (UIView)crlaxMiniFormatterView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility _crlaxMiniFormatterVC](self, "_crlaxMiniFormatterVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return (UIView *)v3;
}

- (NSArray)crlaxTopLevelRepsOmittingMiniFormatterElements
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = objc_msgSend(v3, "crlaxCurrentlyWaitingOnThreadedLayoutAndRender");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTarget](self, "crlaxTarget"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelReps"));

  }
  return (NSArray *)v5;
}

- (void)teardown
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxAllReps](self, "crlaxAllReps"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "_crlaxSetShouldPreventAccessToCanvas:") & 1) != 0)
          objc_msgSend(v8, "_crlaxSetShouldPreventAccessToCanvas:", 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)CRLCanvasAccessibility;
  -[CRLCanvasAccessibility teardown](&v9, "teardown");
}

- (id)_crlaxMiniFormatterVC
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v26;
  char v27;
  char v28;

  v28 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  objc_opt_class(CRLInteractiveCanvasController, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v28);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v28)
    goto LABEL_8;
  v8 = (void *)v7;

  v27 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextResponder"));

  objc_opt_class(CRLiOSCanvasViewController, v11);
  v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v27);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (v27)
    goto LABEL_8;
  v15 = (void *)v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "miniFormatterPresenter"));
  v17 = objc_msgSend(v16, "isPresentingMiniFormatter");

  if (!v17)
  {
    v24 = 0;
    goto LABEL_7;
  }
  v26 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "miniFormatterPresenter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "crlaxMiniFormatterViewController"));

  objc_opt_class(_TtC8Freeform33CRLiOSMiniFormatterViewController, v20);
  v22 = __CRLAccessibilityCastAsClass(v21, (uint64_t)v19, 1, &v26);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (v26)
LABEL_8:
    abort();
  v24 = (void *)v23;

LABEL_7:
  return v24;
}

@end
