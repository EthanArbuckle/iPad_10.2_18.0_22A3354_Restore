@implementation CRLCanvasInteractiveCanvasControllerAccessibility

- (id)_crlaxStoredTrackedChangesRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E0);
}

- (void)_crlaxSetStoredTrackedChangesRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E0, a3);
}

- (id)_crlaxStoredCommentsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E1);
}

- (void)_crlaxSetStoredCommentsRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E1, a3);
}

- (id)_crlaxStoredHighlightsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E2);
}

- (void)_crlaxSetStoredHighlightsRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E2, a3);
}

- (id)_crlaxStoredTrackedChangesRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E3);
}

- (void)_crlaxSetStoredTrackedChangesRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E3, a3);
}

- (id)_crlaxStoredCommentsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E4);
}

- (void)_crlaxSetStoredCommentsRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E4, a3);
}

- (id)_crlaxStoredHighlightsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E5);
}

- (void)_crlaxSetStoredHighlightsRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E5, a3);
}

- (id)_crlaxStoredNearbyElementsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E6);
}

- (void)_crlaxSetStoredNearbyElementsRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E6, a3);
}

- (id)_crlaxStoredNearbyElementsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014152E7);
}

- (void)_crlaxSetStoredNearbyElementsRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014152E7, a3);
}

- (CRLiOSCanvasViewControllerAccessibility)crlaxCanvasViewController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v11;

  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

  objc_opt_class(CRLiOSCanvasViewControllerAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v11)
    abort();
  v9 = (void *)v8;

  return (CRLiOSCanvasViewControllerAccessibility *)v9;
}

- (CRLTextInputResponderAccessibility)crlaxTextInputResponder
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputResponder"));

  objc_opt_class(CRLTextInputResponderAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLTextInputResponderAccessibility *)v8;
}

- (id)_crlaxElementForMovingToSelection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTextInputResponder](self, "crlaxTextInputResponder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxFocusedElement"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusedRep](self, "crlaxFocusedRep"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxFocusedElement"));

  }
  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxConvertBoundsToUnscaledPoint:](self, "crlaxConvertBoundsToUnscaledPoint:", x, y);
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxHitTestWithUnscaledPoint:](self, "crlaxHitTestWithUnscaledPoint:"));
  if ((objc_msgSend(v12, "isAccessibilityElement") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_accessibilityHitTest:withEvent:", v7, v9, v11));

    if (!objc_msgSend(v13, "isAccessibilityElement"))
    {
      v14 = 0;
      goto LABEL_6;
    }
    v12 = v13;
  }
  v14 = v12;
  v13 = v14;
LABEL_6:

  return v14;
}

- (CRLAccessibilityEditMenuControllerItemProvider)crlaxEditMenuItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](self, "crlaxEditorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTextInputEditor"));
  v5 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLAccessibilityEditMenuControllerItemProvider, v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
    v8 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLAccessibilityEditMenuControllerItemProvider, v7, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  return (CRLAccessibilityEditMenuControllerItemProvider *)v6;
}

- (id)crlaxActionMenuItemsForRep:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAddSelectionActionsToArray:forRep:](self, "_crlaxAddSelectionActionsToArray:forRep:", v5, v4);
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAddMultiSelectionActionsToArray:forRep:](self, "_crlaxAddMultiSelectionActionsToArray:forRep:", v5, v4);
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAddArrangeActionsToArray:forRep:](self, "_crlaxAddArrangeActionsToArray:forRep:", v5, v4);

  return v5;
}

- (void)_crlaxAddSelectionActionsToArray:(id)a3 forRep:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "crlaxIsSelected") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxRepForSelecting"));
    if ((objc_msgSend(v8, "crlaxIsSelected") & 1) != 0)
    {

    }
    else
    {
      if (objc_msgSend(v7, "crlaxIsSelectable"))
      {

      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxRepForSelecting"));
        v10 = objc_msgSend(v9, "crlaxIsSelectable");

        if ((v10 & 1) == 0)
          goto LABEL_12;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxElementForMovingToSelection](self, "_crlaxElementForMovingToSelection"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Move to selected item"), 0, 0));

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1002A49B8;
        v20[3] = &unk_10124BB90;
        v21 = v11;
        +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", v6, v13, v20);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxRepForSelecting"));
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Select"), 0, 0));

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1002A49D4;
        v17[3] = &unk_10124BBB8;
        v18 = v14;
        v19 = v7;
        +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", v6, v16, v17);

      }
    }
  }
LABEL_12:

}

- (void)_crlaxAddMultiSelectionActionsToArray:(id)a3 forRep:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void ***v11;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  CRLCanvasInteractiveCanvasControllerAccessibility *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  CRLCanvasInteractiveCanvasControllerAccessibility *v23;
  void *v24;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "crlaxRepForSelecting"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectedReps](self, "crlaxSelectedReps"));
    if (objc_msgSend(v8, "count"))
    {
      if (!objc_msgSend(v7, "crlaxIsSelectedIgnoringLocking"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Add to selection"), 0, 0));

        v13 = _NSConcreteStackBlock;
        v14 = 3221225472;
        v15 = sub_1002A4BAC;
        v16 = &unk_10124BBB8;
        v17 = self;
        v18 = v7;
        v11 = &v13;
        goto LABEL_7;
      }
      if ((unint64_t)objc_msgSend(v8, "count") >= 2)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Remove from selection"), 0, 0));

        v19 = _NSConcreteStackBlock;
        v20 = 3221225472;
        v21 = sub_1002A4B8C;
        v22 = &unk_10124BBB8;
        v23 = self;
        v24 = v7;
        v11 = &v19;
LABEL_7:
        +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", v6, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);

      }
    }

  }
}

- (void)_crlaxAddArrangeActionsToArray:(id)a3 forRep:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[6];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectedReps](self, "crlaxSelectedReps"));
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxRepForSelecting"));
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Arrange"), 0, 0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Align left edges to leftmost edge"), 0, 0));

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1002A4FFC;
      v33[3] = &unk_10124BB90;
      v33[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v26, v12, v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Align to horizontal center"), 0, 0));

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1002A5018;
      v32[3] = &unk_10124BB90;
      v32[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v25, v12, v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Align right edges to rightmost edge"), 0, 0));

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1002A5034;
      v31[3] = &unk_10124BB90;
      v31[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v24, v12, v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Align top edges to topmost edge"), 0, 0));

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1002A5050;
      v30[3] = &unk_10124BB90;
      v30[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v23, v12, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Align to vertical center"), 0, 0));

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1002A506C;
      v29[3] = &unk_10124BB90;
      v29[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v22, v12, v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Align bottom edges to bottommost edge"), 0, 0));

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1002A5088;
      v28[3] = &unk_10124BB90;
      v28[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v19, v12, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Go to arrange inspector"), 0, 0));

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1002A50A4;
      v27[3] = &unk_10124BB90;
      v27[4] = self;
      +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:categoryName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:categoryName:actionBlock:", v6, v21, v12, v27);

    }
  }

}

- (void)_crlaxUpdateSelectionWithRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));

  objc_msgSend(v5, "updateSelectionForInteractionWithRep:extendingSelection:", v6, 1);
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAnnounceSelectedElementCount](self, "_crlaxAnnounceSelectedElementCount");
}

- (void)_crlaxAnnounceSelectedElementCount
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectedReps](self, "crlaxSelectedReps"));
  v4 = objc_msgSend(v3, "count");

  v5 = CRLAccessibilityStringsDictKey(CFSTR("multiselection.elements.selected.announcement"));
  v8 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  CRLAccessibilityPostAnnouncementNotification(v7, v6);

}

- (void)_crlaxAlignSelectionToLeft
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAlignSelectionToEdge:](self, "_crlaxAlignSelectionToEdge:", 0);
}

- (void)_crlaxAlignSelectionToCenter
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAlignSelectionToEdge:](self, "_crlaxAlignSelectionToEdge:", 1);
}

- (void)_crlaxAlignSelectionToRight
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAlignSelectionToEdge:](self, "_crlaxAlignSelectionToEdge:", 2);
}

- (void)_crlaxAlignSelectionToTop
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAlignSelectionToEdge:](self, "_crlaxAlignSelectionToEdge:", 3);
}

- (void)_crlaxAlignSelectionToMiddle
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAlignSelectionToEdge:](self, "_crlaxAlignSelectionToEdge:", 4);
}

- (void)_crlaxAlignSelectionToBottom
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxAlignSelectionToEdge:](self, "_crlaxAlignSelectionToEdge:", 5);
}

- (void)_crlaxAlignSelectionToEdge:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor"));
  v5 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLCanvasEditor, v4, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditorHelper"));
  objc_msgSend(v6, "alignDrawablesByEdge:", v3);

}

- (void)_crlaxGoToArrange
{
  -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxGoToArrangeFormatInspector](self, "crlaxGoToArrangeFormatInspector");
}

- (id)_crlaxTopLevelInspectorViewControllers
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(NSArray, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxValueForKey:", CFSTR("topLevelInspectorViewControllers")));
  v8 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)crlaxCollaboratorDeletedMySelection
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Participant deleted selection"), 0, 0));

  CRLAccessibilityPostHighPriorityAnnouncementNotification(0, v3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);

}

- (void)crlaxWillSelectRep:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController", a3));
  v5 = objc_msgSend(v4, "crlaxIsInEyeDropperMode");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasViewController](self, "crlaxCanvasViewController"));
    objc_msgSend(v6, "crlaxCancelEyeDropperMode");

  }
}

- (BOOL)crlaxKnobElementIsAccessibilityElement:(id)a3
{
  return objc_msgSend(a3, "isAccessibilityElement");
}

- (NSArray)crlaxCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCommentsRotor](self, "crlaxCommentsRotor"));
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxHighlightsRotor](self, "crlaxHighlightsRotor"));
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectedReps](self, "crlaxSelectedReps"));
  v7 = objc_msgSend(v6, "count");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxNearbyElementsRotor](self, "crlaxNearbyElementsRotor"));
    objc_msgSend(v3, "addObject:", v8);

  }
  return (NSArray *)v3;
}

- (UIAccessibilityCustomRotor)crlaxTrackedChangesRotor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredTrackedChangesRotor](self, "_crlaxStoredTrackedChangesRotor"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Tracked Changes"), 0, 0));

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002A55DC;
    v9[3] = &unk_101248BF8;
    objc_copyWeak(&v11, &location);
    v6 = v5;
    v10 = v6;
    v7 = objc_retainBlock(v9);
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", v6, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxCommentsRotor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredCommentsRotor](self, "_crlaxStoredCommentsRotor"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Comments"), 0, 0));

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002A5768;
    v9[3] = &unk_101248BF8;
    objc_copyWeak(&v11, &location);
    v6 = v5;
    v10 = v6;
    v7 = objc_retainBlock(v9);
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", v6, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxHighlightsRotor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredHighlightsRotor](self, "_crlaxStoredHighlightsRotor"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Highlights"), 0, 0));

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002A58F4;
    v9[3] = &unk_101248BF8;
    objc_copyWeak(&v11, &location);
    v6 = v5;
    v10 = v6;
    v7 = objc_retainBlock(v9);
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", v6, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxNearbyElementsRotor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  CRLNearbyElementRotorSearchController *v8;
  void *v9;
  CRLNearbyElementRotorSearchController *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredNearbyElementsRotor](self, "_crlaxStoredNearbyElementsRotor"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Nearby Elements"), 0, 0));

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002A5AE0;
    v12[3] = &unk_101248BF8;
    objc_copyWeak(&v14, &location);
    v6 = v5;
    v13 = v6;
    v7 = objc_retainBlock(v12);
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", v6, v7);
    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetStoredNearbyElementsRotor:](self, "_crlaxSetStoredNearbyElementsRotor:", v3);
    v8 = [CRLNearbyElementRotorSearchController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    v10 = -[CRLRotorSearchController initWithInteractiveCanvasController:](v8, "initWithInteractiveCanvasController:", v9);
    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetStoredNearbyElementsRotorSearchController:](self, "_crlaxSetStoredNearbyElementsRotorSearchController:", v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (id)crlaxCustomRotorResultForRotorName:(id)a3 predicate:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _rotorForName:](self, "_rotorForName:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCustomRotorResultForRotor:predicate:](self, "crlaxCustomRotorResultForRotor:predicate:", v7, v6));

  return v8;
}

- (id)crlaxCustomRotorResultForRotor:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxCurrentSearchReferenceForRotor:](self, "_crlaxCurrentSearchReferenceForRotor:", v6));
  v9 = objc_msgSend(v7, "searchDirection");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxResultSearchReferenceForRotor:fromSearchReference:inDirection:](self, "crlaxResultSearchReferenceForRotor:fromSearchReference:inDirection:", v6, v8, v9));
  if (v10)
  {
    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxScrollAndAnnounceSearchReference:forRotor:](self, "_crlaxScrollAndAnnounceSearchReference:forRotor:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusElementFromSearchReference:](self, "crlaxFocusElementFromSearchReference:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusTextRangeFromSearchReference:](self, "crlaxFocusTextRangeFromSearchReference:", v10));
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v11);
    v13 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotorItemResult), "initWithTargetElement:targetRange:", v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_crlaxCurrentSearchReferenceForRotor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRotorSearchControllerForRotor:](self, "crlaxRotorSearchControllerForRotor:", a3));
  if (objc_msgSend(v4, "shouldChangeSelectionPath"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSearchReferenceForSelectionPath:](self, "crlaxSearchReferenceForSelectionPath:", v8));
  }
  else
  {
    *(_QWORD *)&v10 = objc_opt_class(CRLCanvasRep, v5).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility currentlyFocusedElement](CRLAccessibility, "currentlyFocusedElement", v10));
    v14 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v13, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForSelecting"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasEditor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectionPathWithInfo:", v17));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSearchReferenceForSelectionPath:](self, "crlaxSearchReferenceForSelectionPath:", v8));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
    objc_msgSend(v18, "alignmentFrameInRoot");
    objc_msgSend(v9, "setSearchReferenceLayoutFrame:");

  }
  return v9;
}

- (id)crlaxSearchReferenceForSelectionPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orderedSelections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));

    if (v9)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasSearchReference searchReferenceWithBoardItem:selectionPath:](CRLCanvasSearchReference, "searchReferenceWithBoardItem:selectionPath:", v9, v3));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)crlaxRotorSearchControllerForRotor:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTrackedChangesRotor](self, "crlaxTrackedChangesRotor"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredTrackedChangesRotorSearchController](self, "_crlaxStoredTrackedChangesRotorSearchController"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCommentsRotor](self, "crlaxCommentsRotor"));
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredCommentsRotorSearchController](self, "_crlaxStoredCommentsRotorSearchController"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxHighlightsRotor](self, "crlaxHighlightsRotor"));
      v11 = objc_msgSend(v4, "isEqual:", v10);

      if (v11)
      {
        v7 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredHighlightsRotorSearchController](self, "_crlaxStoredHighlightsRotorSearchController"));
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxNearbyElementsRotor](self, "crlaxNearbyElementsRotor"));
        v13 = objc_msgSend(v4, "isEqual:", v12);

        if (!v13)
        {
          v14 = 0;
          goto LABEL_10;
        }
        v7 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredNearbyElementsRotorSearchController](self, "_crlaxStoredNearbyElementsRotorSearchController"));
      }
    }
  }
  v14 = (void *)v7;
LABEL_10:

  return v14;
}

- (id)crlaxResultSearchReferenceForRotor:(id)a3 fromSearchReference:(id)a4 inDirection:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRotorSearchControllerForRotor:](self, "crlaxRotorSearchControllerForRotor:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchReferenceAfterReference:inRotorDirection:", v8, a5));

  return v10;
}

- (id)crlaxFocusTextRangeFromSearchReference:(id)a3
{
  return 0;
}

- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  double v27;
  objc_class *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTrackedChangesRotor](self, "crlaxTrackedChangesRotor"));
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    goto LABEL_4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCommentsRotor](self, "crlaxCommentsRotor"));
  if (objc_msgSend(v6, "isEqual:", v8))
  {

LABEL_4:
    goto LABEL_5;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxHighlightsRotor](self, "crlaxHighlightsRotor"));
  v23 = objc_msgSend(v6, "isEqual:", v22);

  if ((v23 & 1) != 0)
  {
LABEL_5:
    v15 = __CRLAccessibilityStringForVariables(1, 0, v9, v10, v11, v12, v13, v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v16);
    if (objc_msgSend(0, "length"))
    {
      v18 = v16;
      v19 = 0;
LABEL_7:
      v20 = objc_msgSend(v18, "rangeOfString:", v19);
      objc_msgSend(v17, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenLowPitch"), &__kCFBooleanTrue, v20, v21);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxNearbyElementsRotor](self, "crlaxNearbyElementsRotor"));
  v25 = objc_msgSend(v6, "isEqual:", v24);

  if (!v25)
    goto LABEL_9;
  *(_QWORD *)&v27 = objc_opt_class(CRLNearbyElementRotorSearchController, v26).n128_u64[0];
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxStoredNearbyElementsRotorSearchController](self, "_crlaxStoredNearbyElementsRotorSearchController", v27));
  v31 = __CRLAccessibilityCastAsClass(v29, (uint64_t)v30, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "nearbyDescriptionForSearchReference:", v33));

  v17 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v16);
  if (objc_msgSend(v16, "length"))
  {
    v18 = v16;
    v19 = v16;
    goto LABEL_7;
  }
LABEL_8:
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v17);

LABEL_9:
}

- (id)_rotorForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCustomRotors](self, "crlaxCustomRotors", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_crlaxScrollAndAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v8, "scrollSearchReferenceToVisible:scrollOptions:", v6, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRotorSearchControllerForRotor:](self, "crlaxRotorSearchControllerForRotor:", v7));
  v10 = objc_msgSend(v9, "shouldChangeSelectionPath");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
    objc_msgSend(v11, "setSelectionPath:withFlags:", v12, 0);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002A64F0;
  v15[3] = &unk_10122D3B0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v15, 2.0);

}

- (id)crlaxRepForSearchReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infosForSelectionPath:", v6));

  if (!objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoForSelectionPath"));
    objc_opt_class(NSObject, v10);
    v17 = sub_1002220C8(v9, v11, 1, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v8)
      goto LABEL_6;
LABEL_8:
    v19 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "count") != (id)1)
  {
    v8 = 0;
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  if (!v8)
    goto LABEL_8;
LABEL_6:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "repForInfo:createIfNeeded:", v8, 1));

LABEL_9:
  v20 = v19;

  return v20;
}

- (BOOL)_crlaxElementSupportsChangeTracking:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  objc_opt_class(CRLCanvasRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "crlaxSupportsChangeTracking");
  else
    v8 = 0;

  return v8;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLInteractiveCanvasController");
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
  objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSMutableSet)_crlaxCollaborationModifiers
{
  return (NSMutableSet *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415740);
}

- (void)_crlaxSetCollaborationModifiers:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415740, a3);
}

- (CRLAccessibilityTimer)_crlaxCollaborationOccurredTimer
{
  return (CRLAccessibilityTimer *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415741);
}

- (void)_crlaxSetCollaborationOccurredTimer:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415741, a3);
}

- (NSTimer)_crlaxSelectionAnnouncementTimer
{
  return (NSTimer *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415742);
}

- (void)_crlaxSetSelectionAnnouncmentTimer:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415742, a3);
}

- (BOOL)_crlaxIsObservingRemoteCommands
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415743);
}

- (void)_crlaxSetIsObservingRemoteCommands:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415743, a3);
}

- (BOOL)_crlaxIsTearingDown
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415744);
}

- (void)_crlaxSetIsTearingDown:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415744, a3);
}

- (id)crlaxDelegate
{
  return -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("delegate"));
}

- (id)crlaxCollaboratorCursorDelegate
{
  return -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("collaboratorCursorDelegate"));
}

- (BOOL)crlaxShapeRepsAreIgnored
{
  return 0;
}

- (CRLCanvasViewAccessibility)crlaxCanvasView
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));

  objc_opt_class(CRLCanvasViewAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasViewAccessibility *)v8;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvas"));

  objc_opt_class(CRLCanvasAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasAccessibility *)v8;
}

- (CRLEditorControllerAccessibility)crlaxEditorController
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController"));

  objc_opt_class(CRLEditorControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLEditorControllerAccessibility *)v8;
}

- (id)crlaxCanvasEditor
{
  void *v2;
  Protocol *v3;
  void *v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("canvasEditor")));
  v3 = NSProtocolFromString(CFSTR("CRLCanvasEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ((objc_msgSend(v2, "conformsToProtocol:", v4) & 1) == 0)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Object doesn't conform to CRLCanvasEditor protocol!"), v6, v7, v8, v9, v10, v12))abort();
    }

    v2 = 0;
  }

  return v2;
}

- (CRLKeyboardMovementManipulatorAccessibility)crlaxKeyboardMovementManipulator
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValueForKey:", CFSTR("canvasEditorHelper")));

  v11 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxValueForKey:", CFSTR("keyboardMovementManipulator")));
  objc_opt_class(CRLKeyboardMovementManipulatorAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v11)
    abort();
  v9 = (void *)v8;

  return (CRLKeyboardMovementManipulatorAccessibility *)v9;
}

- (NSArray)crlaxTopLevelRepsForHitTesting
{
  void *v3;

  if (-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCurrentlyWaitingOnThreadedLayoutAndRender](self, "crlaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("topLevelRepsForHitTesting")));
  }
  return (NSArray *)v3;
}

- (NSSet)crlaxSelectedReps
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:](self, "_crlaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:", v3, 0));

  return (NSSet *)v4;
}

- (CRLCanvasRepAccessibility)crlaxFirstSelectedRep
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxFirstSelectedRepInCanvasEditor:preferExplicitlyFocusedReps:](self, "_crlaxFirstSelectedRepInCanvasEditor:preferExplicitlyFocusedReps:", v3, 0));

  return (CRLCanvasRepAccessibility *)v4;
}

- (CRLSubselectionAccessibility)crlaxCanvasSelection
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValueForKey:", CFSTR("canvasSelection")));

  objc_opt_class(CRLSubselectionAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLSubselectionAccessibility *)v8;
}

- (BOOL)crlaxCurrentlyWaitingOnThreadedLayoutAndRender
{
  return 0;
}

- (id)_crlaxSelectedRepsInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  CRLCanvasInteractiveCanvasControllerAccessibility *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  id v45;
  CRLCanvasInteractiveCanvasControllerAccessibility *v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v47 = a4;
  v5 = a3;
  v59 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
  v46 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](self, "crlaxEditorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxSelectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxTarget"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemsForSelectionPath:", v10));

  v12 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, v11, 1, &v59);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (v59)
LABEL_36:
    abort();
  v14 = (void *)v13;
  v44 = v5;

  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v56;
    v20 = v47;
    v21 = v46;
    v49 = *(_QWORD *)v56;
    v45 = v15;
    while (1)
    {
      v22 = 0;
      v50 = v17;
      do
      {
        if (*(_QWORD *)v56 != v19)
          objc_enumerationMutation(v15);
        v23 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v22);
        if (!v20)
          goto LABEL_27;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRepsForInfo:](v21, "crlaxRepsForInfo:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v22)));
        v25 = objc_msgSend(v24, "count");
        if (v25 == (id)1)
        {
          v59 = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "anyObject"));
          objc_opt_class(CRLCanvasRepAccessibility, v27);
          v29 = __CRLAccessibilityCastAsSafeCategory(v28, (uint64_t)v26, 1, &v59);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (v59)
            goto LABEL_36;
          v31 = (void *)v30;

        }
        else
        {
          if (!v25)
          {

            v17 = v50;
LABEL_27:
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRepForInfo:](v21, "crlaxRepForInfo:", v23));
            if (!v31)
              goto LABEL_31;
            goto LABEL_28;
          }
          v48 = v18;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v32 = v24;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(_QWORD *)v52 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
                v59 = 0;
                v38 = v37;
                objc_opt_class(CRLCanvasRepAccessibility, v39);
                v41 = __CRLAccessibilityCastAsSafeCategory(v40, (uint64_t)v38, 1, &v59);
                v42 = objc_claimAutoreleasedReturnValue(v41);
                if (v59)
                  goto LABEL_36;
                v31 = (void *)v42;

                if ((objc_msgSend(v31, "crlaxWasExplicitlyFocused") & 1) != 0)
                  goto LABEL_23;

              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            }
            while (v34);
            v31 = 0;
LABEL_23:
            v20 = v47;
            v15 = v45;
            v21 = v46;
          }
          else
          {
            v31 = 0;
          }

          v18 = v48;
        }
        v19 = v49;

        v17 = v50;
        if (!v31)
          goto LABEL_27;
LABEL_28:
        if (!v18)
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        objc_msgSend(v18, "addObject:", v31);

LABEL_31:
        v22 = (char *)v22 + 1;
      }
      while (v22 != v17);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (!v17)
        goto LABEL_35;
    }
  }
  v18 = 0;
LABEL_35:

  return v18;
}

- (id)_crlaxFirstSelectedRepInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:](self, "_crlaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:", a3, a4));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_1012571D0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CRLCanvasRepAccessibility)crlaxFocusedRep
{
  __objc2_prot *v3;
  void *v4;
  void *v5;
  __objc2_prot *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __objc2_prot *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  __objc2_prot *v38;
  CRLCanvasInteractiveCanvasControllerAccessibility *v39;
  uint64_t *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = sub_10039132C;
  v45 = sub_10039133C;
  v46 = 0;
  v3 = &OBJC_PROTOCOL___CRLCanvasEditor;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](self, "crlaxEditorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCurrentEditors"));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100391344;
  v37[3] = &unk_1012571F8;
  v40 = &v41;
  v6 = v3;
  v38 = v6;
  v39 = self;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v37);
  v7 = v42[5];
  if (!v7)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxInfosForCurrentSelectionPath](self, "crlaxInfosForCurrentSelectionPath"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v34;
      do
      {
        v11 = 0;
        v27 = v9;
        do
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRepsForInfo:](self, "crlaxRepsForInfo:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11), v27));
          v28 = v11;
          v13 = v6;
          v14 = v5;
          v15 = v8;
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v16 = v12;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v30;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v20, "crlaxWasExplicitlyFocused"))
                {
                  objc_storeStrong(v42 + 5, v20);
                  v8 = v15;
                  v5 = v14;
                  v6 = v13;

                  goto LABEL_19;
                }
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
              if (v17)
                continue;
              break;
            }
          }

          v8 = v15;
          v5 = v14;
          v6 = v13;

          v11 = v28 + 1;
        }
        while ((id)(v28 + 1) != v27);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
      }
      while (v9);
    }
LABEL_19:

    v7 = v42[5];
    if (!v7)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxInfosForCurrentSelectionPath](self, "crlaxInfosForCurrentSelectionPath"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anyObject"));
      v23 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRepForInfo:](self, "crlaxRepForInfo:", v22));
      v24 = v42[5];
      v42[5] = (id)v23;

      v7 = v42[5];
    }
  }
  v25 = v7;

  _Block_object_dispose(&v41, 8);
  return (CRLCanvasRepAccessibility *)v25;
}

- (NSArray)crlaxFilteredTopLevelReps
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvas](self, "crlaxCanvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTopLevelReps"));

  return (NSArray *)v3;
}

- (BOOL)crlaxDocumentIsSharedReadOnly
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "documentIsSharedReadOnly");

  return v3;
}

- (BOOL)crlaxAllowsCaptionEditing
{
  return 0;
}

- (BOOL)crlaxShouldLabelCanvas
{
  return 1;
}

- (CGPoint)crlaxConvertBoundsToUnscaledPoint:(CGPoint)a3
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
  v7[2] = sub_100391570;
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

- (CGRect)crlaxConvertBoundsToUnscaledRect:(CGRect)a3
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
  v11[2] = sub_100391688;
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

- (CGPoint)crlaxConvertUnscaledToBoundsPoint:(CGPoint)a3
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
  v7[2] = sub_10039178C;
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
  v11[2] = sub_1003918A4;
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

- (id)crlaxRepForInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCurrentlyWaitingOnThreadedLayoutAndRender](self, "crlaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    v5 = 0;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_10039132C;
    v20 = sub_10039133C;
    v21 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100391A34;
    v13[3] = &unk_101230370;
    v15 = &v16;
    v13[4] = self;
    v14 = v4;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v13))
      abort();

    v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

    LOBYTE(v16) = 0;
    v7 = v6;
    objc_opt_class(CRLCanvasRepAccessibility, v8);
    v10 = __CRLAccessibilityCastAsSafeCategory(v9, (uint64_t)v7, 1, &v16);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if ((_BYTE)v16)
      abort();
    v5 = (void *)v11;

  }
  return v5;
}

- (id)crlaxRepsForInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCurrentlyWaitingOnThreadedLayoutAndRender](self, "crlaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    v5 = 0;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_10039132C;
    v20 = sub_10039133C;
    v21 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100391BC4;
    v13[3] = &unk_101230370;
    v15 = &v16;
    v13[4] = self;
    v14 = v4;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v13))
      abort();

    v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

    LOBYTE(v16) = 0;
    v7 = v6;
    objc_opt_class(NSSet, v8);
    v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v7, 1, &v16);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if ((_BYTE)v16)
      abort();
    v5 = (void *)v11;

  }
  return v5;
}

- (id)crlaxRepForLayout:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10039132C;
  v19 = sub_10039133C;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100391D40;
  v12[3] = &unk_101230370;
  v14 = &v15;
  v12[4] = self;
  v3 = a3;
  v13 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();

  v4 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  LOBYTE(v15) = 0;
  v5 = v4;
  objc_opt_class(CRLCanvasRepAccessibility, v6);
  v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if ((_BYTE)v15)
    abort();
  v10 = (void *)v9;

  return v10;
}

- (id)crlaxHitTestWithUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  char v32;

  y = a3.y;
  x = a3.x;
  v32 = 0;
  v31 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility hitKnobAtPoint:inputType:returningRep:](self, "hitKnobAtPoint:inputType:returningRep:", 1, &v31));
  v7 = v31;
  objc_opt_class(CRLCanvasKnobAccessibility, v8);
  v10 = __CRLAccessibilityCastAsSafeCategory(v9, (uint64_t)v6, 1, &v32);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v32)
    goto LABEL_19;
  v12 = (void *)v11;

  if (!v12)
    goto LABEL_14;
  if (CRLAccessibilityShouldPerformValidationChecks()
    && !v7
    && (ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("A knob was hit, but no rep returned!"), v14, v15, v16, v17, v18, (uint64_t)v31))|| (v19 = objc_msgSend(v12, "crlaxKnobTag"), v20 = objc_msgSend(v12, "crlaxNodeIndex"), v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxIdentifier")), v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxKnobElementForTag:index:identifier:", v19, v20, v21)), v21, CRLAccessibilityShouldPerformValidationChecks())&& !v22&& (v23 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(), __CRLAccessibilityHandleValidationErrorWithDescription(v23,
                        0,
                        (uint64_t)CFSTR("Knob element not found!"),
                        v24,
                        v25,
                        v26,
                        v27,
                        v28,
                        (uint64_t)v31)))
  {
LABEL_19:
    abort();
  }
  if (-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxKnobElementIsAccessibilityElement:", &OBJC_PROTOCOL___CRLCanvasInteractiveCanvasControllerAccessibilityExtras)&& -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxKnobElementIsAccessibilityElement:](self, "crlaxKnobElementIsAccessibilityElement:", v22))
  {
    if (v22)
      goto LABEL_18;
  }
  else
  {

  }
LABEL_14:
  if ((objc_opt_respondsToSelector(self, "hitRep:allowsAllReps:") & 1) != 0)
    v29 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y));
  else
    v29 = objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility hitRep:](self, "hitRep:", x, y));
  v22 = (void *)v29;
LABEL_18:

  return v22;
}

- (void)crlaxSelectRep:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

    -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectReps:](self, "crlaxSelectReps:", v5, v6);
  }
}

- (void)crlaxAddRepToSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectedReps](self, "crlaxSelectedReps"));
    if ((objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObject:", v8));
      -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectReps:](self, "crlaxSelectReps:", v7);

    }
    v4 = v8;
  }

}

- (void)crlaxSelectReps:(id)a3
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLCanvasRepAccessibility, v7);
        v14 = __CRLAccessibilityCastAsSafeCategory(v13, v12, 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (objc_msgSend(v15, "crlaxIsSelectable"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxTarget"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));

          if (v17)
          {
            -[NSMutableSet addObject:](v4, "addObject:", v17);
            if (!v9)
              v9 = v15;
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (-[NSMutableSet count](v4, "count"))
  {
    if (-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxWillSelectRep:", &OBJC_PROTOCOL___CRLCanvasInteractiveCanvasControllerAccessibilityExtras))-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxWillSelectRep:](self, "crlaxWillSelectRep:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectionPathWithInfos:](self, "crlaxSelectionPathWithInfos:", v4));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](self, "crlaxEditorController"));
    objc_msgSend(v19, "crlaxSetSelectionPath:", v18);

    -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxDidFocusRep:](self, "crlaxDidFocusRep:", v9);
  }

}

- (void)crlaxSelectReps:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCanvasInteractiveCanvasControllerAccessibility *v20;
  void *v21;
  void *v22;
  NSMutableSet *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a4;
  v5 = a3;
  v24 = objc_opt_new(NSMutableSet);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLCanvasRepAccessibility, v8);
        v15 = __CRLAccessibilityCastAsSafeCategory(v14, v13, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v4)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxTarget"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "info"));

          if (v19)
          {
            -[NSMutableSet addObject:](v24, "addObject:", v19);
            if (!v10)
              v10 = v17;
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (-[NSMutableSet count](v24, "count"))
  {
    v20 = self;
    if (-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxWillSelectRep:", &OBJC_PROTOCOL___CRLCanvasInteractiveCanvasControllerAccessibilityExtras))-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxWillSelectRep:](self, "crlaxWillSelectRep:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectionPathWithInfos:](self, "crlaxSelectionPathWithInfos:", v24, self));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](v20, "crlaxEditorController"));
    objc_msgSend(v22, "crlaxSetSelectionPath:", v21);

    -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxDidFocusRep:](v20, "crlaxDidFocusRep:", v10);
  }

}

- (id)crlaxSelectionPathWithInfo:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSelectionPathWithInfos:](self, "crlaxSelectionPathWithInfos:", v4));

  return v5;
}

- (id)crlaxSelectionPathWithInfos:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10039132C;
  v19 = sub_10039133C;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100392610;
  v12[3] = &unk_101230370;
  v14 = &v15;
  v12[4] = self;
  v3 = a3;
  v13 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();

  v4 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  LOBYTE(v15) = 0;
  v5 = v4;
  objc_opt_class(CRLSelectionPathAccessibility, v6);
  v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if ((_BYTE)v15)
    abort();
  v10 = (void *)v9;

  return v10;
}

- (void)crlaxDidFocusRep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxInfo"));
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRepsForInfo:](self, "crlaxRepsForInfo:", v5));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
          v18 = 0;
          v12 = v11;
          objc_opt_class(CRLCanvasRepAccessibility, v13);
          v15 = __CRLAccessibilityCastAsSafeCategory(v14, (uint64_t)v12, 1, &v18);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (v18)
            abort();
          v17 = (void *)v16;

          objc_msgSend(v17, "crlaxSetWasExplicitlyFocused:", objc_msgSend(v17, "isEqual:", v4));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
}

- (id)crlaxInfosForSelectionPath:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10039132C;
  v19 = sub_10039133C;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10039292C;
  v12[3] = &unk_101230370;
  v14 = &v15;
  v12[4] = self;
  v3 = a3;
  v13 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();

  v4 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  LOBYTE(v15) = 0;
  v5 = v4;
  objc_opt_class(NSSet, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if ((_BYTE)v15)
    abort();
  v10 = (void *)v9;

  return v10;
}

- (id)crlaxInfosForCurrentSelectionPath
{
  id v2;
  id v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10039132C;
  v15 = sub_10039133C;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100392A7C;
  v10[3] = &unk_10122C5F0;
  v10[4] = self;
  v10[5] = &v11;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10))
    abort();
  v2 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  LOBYTE(v11) = 0;
  v3 = v2;
  objc_opt_class(NSSet, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if ((_BYTE)v11)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (id)crlaxLayoutsForSelectionPath:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10039132C;
  v19 = sub_10039133C;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100392BF4;
  v12[3] = &unk_101230370;
  v14 = &v15;
  v12[4] = self;
  v3 = a3;
  v13 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();

  v4 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  LOBYTE(v15) = 0;
  v5 = v4;
  objc_opt_class(NSSet, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if ((_BYTE)v15)
    abort();
  v10 = (void *)v9;

  return v10;
}

- (void)crlaxScrollCurrentSelectionToVisible
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100392C88;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (BOOL)crlaxScrollLayoutToVisibleAndFocusTheAssociatedRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfo:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v10, "scrollToSelectionPath:scrollOptions:", v9, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v11, "layoutIfNeeded");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxRepForLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxTarget"));

  if (v13)
    v14 = -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxZoomToShowRepForLayoutAndFocus:](self, "_crlaxZoomToShowRepForLayoutAndFocus:", v4);
  else
    v14 = 0;

  return v14;
}

- (BOOL)_crlaxZoomToShowRepForLayoutAndFocus:(id)a3
{
  void *v4;
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
  double v16;
  double v17;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crlaxRepForLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxTarget"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    objc_msgSend(v6, "visibleUnscaledRect");
    v8 = v7;
    v10 = v9;

    objc_msgSend(v5, "frameInUnscaledCanvas");
    if (v14 > v10 || v13 > v8)
    {
      v16 = v11;
      v17 = v12;
      if (v14 >= v10)
        v10 = v14;
      if (v13 >= v8)
        v8 = v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
      objc_msgSend(v18, "zoomWithAnimationToUnscaledRect:withDuration:", v16, v17, v10, v8, 0.0);

    }
    CRLAccessibilityPostLayoutChangedNotification(v5);
  }

  return v5 != 0;
}

- (void)crlaxScrollSelectionPathToVisible:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100392F18;
  v4[3] = &unk_10122D3D8;
  v4[4] = self;
  v3 = a3;
  v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();

}

- (void)crlaxLayoutIfNeeded
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100392F80;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (BOOL)crlaxIsInFollowingMode
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followCoordinator"));
  v5 = objc_msgSend(v4, "isFollowing");

  return v5;
}

- (id)crlaxLocalizedRulerUnitsForCanvas
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRulerUnitsInstance](self, "crlaxRulerUnitsInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxLocalizedCompatibleRulerUnitsForCanvas"));

  return v3;
}

- (CGRect)crlaxConvertUnscaledRectToRulerUnits:(CGRect)a3
{
  double height;
  double width;
  double y;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxConvertPointToRulerValue:](self, "_crlaxConvertPointToRulerValue:", a3.origin.x);
  v8 = v7;
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxConvertPointToRulerValue:](self, "_crlaxConvertPointToRulerValue:", y);
  v10 = v9;
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxConvertPointToRulerValue:](self, "_crlaxConvertPointToRulerValue:", width);
  v12 = v11;
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxConvertPointToRulerValue:](self, "_crlaxConvertPointToRulerValue:", height);
  v14 = v13;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)crlaxDescriptionOfPointValueConvertedToRulerUnit:(double)a3
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  id v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRulerUnitsInstance](self, "crlaxRulerUnitsInstance"));
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxConvertPointToRulerValue:](self, "_crlaxConvertPointToRulerValue:", a3);
  v7 = v6;
  *(_QWORD *)&v9 = objc_opt_class(v5, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxLocalizedDescriptionForUnits:value:", objc_msgSend(v5, "crlaxRulerUnits", v9), v7));

  return v11;
}

- (id)crlaxRulerUnitsInstance
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v2 = -[objc_class crlaxValueForKey:](NSClassFromString(CFSTR("CRLRulerUnits")), "crlaxValueForKey:", CFSTR("instance"));
  v10 = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_opt_class(CRLRulerUnitsAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (double)_crlaxConvertPointToRulerValue:(double)a3
{
  id v4;
  double v5;
  float v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  double v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100393294;
  v9[3] = &unk_10122DC18;
  v11 = &v13;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRulerUnitsInstance](self, "crlaxRulerUnitsInstance"));
  v10 = v4;
  v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v9))
    abort();

  v5 = v14[3];
  _Block_object_dispose(&v13, 8);
  v6 = v5 * 100.0;
  v7 = (float)(roundf(v6) / 100.0);

  return v7;
}

- (id)crlaxCommentEditor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](self, "crlaxEditorController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxEditorForEditAction:withSender:", "addOrShowComment:", 0));

  return v3;
}

- (void)addCommonObservers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  -[CRLCanvasInteractiveCanvasControllerAccessibility addCommonObservers](&v3, "addCommonObservers");
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxRegisterForNotifications](self, "_crlaxRegisterForNotifications");
}

- (void)removeCommonObservers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  -[CRLCanvasInteractiveCanvasControllerAccessibility removeCommonObservers](&v3, "removeCommonObservers");
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxUnregisterForNotifications](self, "_crlaxUnregisterForNotifications");
}

- (void)_crlaxUnregisterForNotifications
{
  void *v3;
  void *v4;

  if (-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxIsObservingRemoteCommands](self, "_crlaxIsObservingRemoteCommands"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("documentRoot")));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CRLCommandControllerReceivedIncomingCommand"), v4);

    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetIsObservingRemoteCommands:](self, "_crlaxSetIsObservingRemoteCommands:", 0);
  }
}

- (void)crlaxCancelCollaborationOccurredTimer
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxCollaborationOccurredTimer](self, "_crlaxCollaborationOccurredTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxCollaborationOccurredTimer](self, "_crlaxCollaborationOccurredTimer"));
    objc_msgSend(v4, "cancel");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxCollaborationModifiers](self, "_crlaxCollaborationModifiers"));
    objc_msgSend(v5, "removeAllObjects");

  }
}

- (void)_crlaxPostCollaborationOccurredSound
{
  CRLAccessibilityTimer *v3;
  _QWORD v4[5];
  id v5;

  v3 = (CRLAccessibilityTimer *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxCollaborationOccurredTimer](self, "_crlaxCollaborationOccurredTimer"));
  if (!v3)
  {
    v3 = -[CRLAccessibilityTimer initWithTargetSerialQueue:]([CRLAccessibilityTimer alloc], "initWithTargetSerialQueue:", &_dispatch_main_q);
    -[CRLAccessibilityTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v3, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetCollaborationOccurredTimer:](self, "_crlaxSetCollaborationOccurredTimer:", v3);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100393570;
  v4[3] = &unk_10122D3D8;
  v4[4] = self;
  v5 = 0;
  -[CRLAccessibilityTimer afterDelay:processBlock:](v3, "afterDelay:processBlock:", v4, 4.0);
  CRLAccessibilityPostHighPriorityAnnouncementNotificationWithSound(0, 0, CFSTR("AXAnnouncementCollaborationOccurredSound"));

}

- (void)_crlaxPostCollaborationOccurredSoundRepeatedly:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  _QWORD block[17];

  if (a3 >= 1)
  {
    block[5] = v6;
    block[6] = v5;
    block[15] = v3;
    block[16] = v4;
    v8 = 0;
    v9 = 500000000 * a3;
    do
    {
      v10 = dispatch_time(0, v8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100393748;
      block[3] = &unk_10122D110;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
      v8 += 500000000;
    }
    while (v9 != v8);
  }
}

- (void)collaboratorCursorSelectionPathChangedFromSelectionPath:(id)a3 toSelectionPath:(id)a4 collaboratorPresence:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  objc_super v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v52.receiver = self;
  v52.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  -[CRLCanvasInteractiveCanvasControllerAccessibility collaboratorCursorSelectionPathChangedFromSelectionPath:toSelectionPath:collaboratorPresence:](&v52, "collaboratorCursorSelectionPathChangedFromSelectionPath:toSelectionPath:collaboratorPresence:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infoForSelectionPath:", v9));

  if (v12)
  {
    v51 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility currentlyFocusedElement](CRLAccessibility, "currentlyFocusedElement"));
    objc_opt_class(CRLCanvasRep, v14);
    v16 = __CRLAccessibilityCastAsClass(v15, (uint64_t)v13, 1, &v51);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!v51)
    {
      v18 = (void *)v17;

      v50 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "repForSelecting"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "info"));

      v51 = 0;
      v21 = v19;
      objc_opt_class(CRLWPShapeRepAccessibility, v22);
      v24 = __CRLAccessibilityCastAsSafeCategory(v23, (uint64_t)v21, 1, &v51);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (!v51)
      {
        v26 = (void *)v25;

        v49 = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "crlaxContainedRep"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "crlaxTarget"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "info"));

        if (v12 == v20)
        {
          -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxPostCollaborationOccurredSound](self, "_crlaxPostCollaborationOccurredSound");
LABEL_21:
          v30 = v50;
          goto LABEL_22;
        }
        if (v12 == v29)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "infoForSelectionPath:", v8));

          v30 = v50;
          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "info"));

            if (v47 == v48)
              -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxPostCollaborationOccurredSoundRepeatedly:](self, "_crlaxPostCollaborationOccurredSoundRepeatedly:", 2);
          }

          goto LABEL_22;
        }
        v30 = v50;
        if (!-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxIsInFollowingMode](self, "crlaxIsInFollowingMode"))
        {
LABEL_22:

          goto LABEL_23;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "editingCoordinator"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "followCoordinator"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "accessibilityExperienceCoordinator"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "owner"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastFollowedParticipant"));

        if (v35 != v36)
        {
LABEL_20:

          goto LABEL_21;
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "repForInfo:", v12));

        if (!v38)
        {
LABEL_19:

          goto LABEL_20;
        }
        v51 = 0;
        v39 = v9;
        objc_opt_class(CRLSelectionPathAccessibility, v40);
        v42 = __CRLAccessibilityCastAsSafeCategory(v41, (uint64_t)v39, 1, &v51);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (!v51)
        {
          v44 = (void *)v43;

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "crlaxMostSpecificTextSelection"));
          if (v45)
            objc_msgSend(v34, "submitEventForEditOf:", v38);
          else
            objc_msgSend(v34, "submitEventForSelectionOf:", v38);

          goto LABEL_19;
        }
      }
    }
    abort();
  }
LABEL_23:

}

- (void)crlaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxLoadAccessibilityInformation](&v3, "crlaxLoadAccessibilityInformation");
  if (!-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxIsTearingDown](self, "_crlaxIsTearingDown"))
    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxRegisterForNotifications](self, "_crlaxRegisterForNotifications");
}

- (void)crlaxDeselectAll
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathWithInfos:", 0));

  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxDeselectWithSelectionPath:](self, "_crlaxDeselectWithSelectionPath:", v5);
}

- (void)crlaxDeselectRep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility infosForCurrentSelectionPath](self, "infosForCurrentSelectionPath"));
    v6 = objc_msgSend(v5, "mutableCopy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxInfo"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxInfo"));
      objc_msgSend(v6, "removeObject:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
      v11 = objc_msgSend(v6, "copy");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathWithInfos:", v11));

      -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxDeselectWithSelectionPath:](self, "_crlaxDeselectWithSelectionPath:", v12);
    }

    v4 = v13;
  }

}

- (void)_crlaxDeselectWithSelectionPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  objc_msgSend(v5, "setSelectionPath:withFlags:", v4, 0x2000);

}

- (void)p_editorControllerSelectionPathDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  char v49;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  -[CRLCanvasInteractiveCanvasControllerAccessibility p_editorControllerSelectionPathDidChange:](&v50, "p_editorControllerSelectionPathDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v49 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRLEditorControllerOldSelectionPathKey")));
  objc_opt_class(CRLSelectionPathAccessibility, v7);
  v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v49);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v49)
    abort();
  v11 = (void *)v10;

  v46 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxMostSpecificSelectionOfClass:", +[CRLAccessibilitySafeCategory crlaxTargetClass](CRLBoardItemSelectionAccessibility, "crlaxTargetClass")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxEditorController](self, "crlaxEditorController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxSelectionPath"));

  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crlaxMostSpecificSelectionOfClass:", +[CRLAccessibilitySafeCategory crlaxTargetClass](CRLBoardItemSelectionAccessibility, "crlaxTargetClass")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layerHost"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asiOSCVC"));
  v20 = objc_msgSend(v19, "isCurrentlyInQuickSelectMode");

  if (v20 && v12 != v16)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSelectionAnnouncementTimer](self, "_crlaxSelectionAnnouncementTimer"));
    objc_msgSend(v21, "invalidate");

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100394170;
    v47[3] = &unk_101257248;
    v47[4] = self;
    v22 = v16;
    v48 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v47, 2.0));
    -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetSelectionAnnouncmentTimer:](self, "_crlaxSetSelectionAnnouncmentTimer:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxInfos"));
    v25 = objc_msgSend(v24, "mutableCopy");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "crlaxInfos"));
    objc_msgSend(v25, "minusSet:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "crlaxInfos"));
    v28 = objc_msgSend(v27, "mutableCopy");

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxInfos"));
    objc_msgSend(v28, "minusSet:", v29);

    v30 = (unint64_t)objc_msgSend(v25, "count");
    v31 = (unint64_t)objc_msgSend(v28, "count");
    if (!(v30 | v31))
    {
LABEL_21:

      goto LABEL_22;
    }
    v32 = (id)v31;
    v42 = v25;
    v41 = v15;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Added %@ to selection"), 0, 0));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Removed %@ from selection"), 0, 0));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("%@. %@."), 0, 0));

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Selection changed"), 0, 0));

    if (v30)
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility p_sentenceUsingFormat:toDescribeRepSelectionOrDeltaWith:](self, "p_sentenceUsingFormat:toDescribeRepSelectionOrDeltaWith:", v35, v42));
    else
      v44 = 0;
    v15 = v41;
    if (v32)
    {
      v32 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility p_sentenceUsingFormat:toDescribeRepSelectionOrDeltaWith:](self, "p_sentenceUsingFormat:toDescribeRepSelectionOrDeltaWith:", v43, v28));
      v38 = v45;
      if (v30)
      {
        if (v44)
        {
          v39 = (void *)v40;
          if (v32)
          {
            v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v44, v32));
LABEL_18:

            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else if (v32)
      {
        v32 = v32;
        v38 = v32;
        v39 = (void *)v40;
        goto LABEL_18;
      }
    }
    else
    {
      v38 = v45;
      if (v30)
      {
        v39 = (void *)v40;
        if (v44)
        {
          v38 = v44;
          v32 = 0;
          goto LABEL_18;
        }
LABEL_20:
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v38);

        v25 = v42;
        goto LABEL_21;
      }
    }
    v39 = (void *)v40;
    goto LABEL_20;
  }
LABEL_22:

}

- (id)p_sentenceUsingFormat:(id)a3 toDescribeRepSelectionOrDeltaWith:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, _BYTE *);
  void *v26;
  CRLCanvasInteractiveCanvasControllerAccessibility *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR(", "), 0, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR(" "), 0, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("and %@"), 0, 0));

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_1003944A8;
  v26 = &unk_101257270;
  v27 = self;
  v29 = &v30;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v28 = v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v23);
  if (*((_BYTE *)v31 + 24))
  {
    v15 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      v16 = (char *)objc_msgSend(v14, "count");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v17, v23, v24, v25, v26, v27));
      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v16 - 1, v18);

    }
    if ((unint64_t)objc_msgSend(v14, "count") <= 2)
      v19 = v11;
    else
      v19 = v9;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", v20));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v21));

  }
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (void)teardown
{
  objc_super v3;

  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetIsTearingDown:](self, "_crlaxSetIsTearingDown:", 1);
  -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCancelCollaborationOccurredTimer](self, "crlaxCancelCollaborationOccurredTimer");
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetCollaborationOccurredTimer:](self, "_crlaxSetCollaborationOccurredTimer:", 0);
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetCollaborationModifiers:](self, "_crlaxSetCollaborationModifiers:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasInteractiveCanvasControllerAccessibility;
  -[CRLCanvasInteractiveCanvasControllerAccessibility teardown](&v3, "teardown");
  -[CRLCanvasInteractiveCanvasControllerAccessibility _crlaxSetIsTearingDown:](self, "_crlaxSetIsTearingDown:", 0);
}

- (BOOL)crlaxCurrentSelectionContainsComment
{
  return self->_crlaxCurrentSelectionContainsComment;
}

@end
