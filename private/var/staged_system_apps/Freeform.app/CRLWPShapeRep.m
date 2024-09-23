@implementation CRLWPShapeRep

- (CRLWPDragAndDropHelper)dragAndDropHelper
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  CRLWPDragAndDropHelper *v7;
  void *v8;
  CRLWPDragAndDropHelper *dragAndDropHelper;

  if (!self->_dragAndDropHelper)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));

    if (!v8)
    {
      v7 = -[CRLWPDragAndDropHelper initWithOwningRep:]([CRLWPDragAndDropHelper alloc], "initWithOwningRep:", self);
      goto LABEL_9;
    }
    if (!self->_dragAndDropHelper)
      return self->_dragAndDropHelper;
  }
  v3 = objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v6 = objc_msgSend(v5, "supportsInstructionalText");

    if ((v6 & 1) == 0)
    {
      v7 = 0;
LABEL_9:
      dragAndDropHelper = self->_dragAndDropHelper;
      self->_dragAndDropHelper = v7;

    }
  }
  return self->_dragAndDropHelper;
}

- (CRLWPShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLWPShapeRep *v17;
  uint64_t v18;
  NSUUID *scribbleIdentifier;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(CRLWPShapeLayout, v8);
  v10 = sub_100221D0C(v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230F48);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEEF70(v12, v13);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230F68);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeRep initWithLayout:canvas:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 56, 0, "bad layout class");

  }
  v21.receiver = self;
  v21.super_class = (Class)CRLWPShapeRep;
  v17 = -[CRLShapeRep initWithLayout:canvas:](&v21, "initWithLayout:canvas:", v6, v7);
  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    scribbleIdentifier = v17->_scribbleIdentifier;
    v17->_scribbleIdentifier = (NSUUID *)v18;

  }
  return v17;
}

- (CRLWPRep)textRep
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_opt_class(CRLWPRep, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_firstObjectPassingTest:", &stru_101230FA8));
  v6 = sub_100221D0C(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (CRLWPRep *)v7;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPShapeRep;
  -[CRLShapeRep processChangedProperty:](&v6, "processChangedProperty:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep textRep](self, "textRep"));
  objc_msgSend(v5, "processChangedProperty:", a3);

}

- (BOOL)isEditingChildRep
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006CF90;
    v9[3] = &unk_101230FD0;
    v9[4] = self;
    v9[5] = &v10;
    objc_msgSend(v6, "enumerateEditorsOnStackUsingBlock:", v9);

  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)shouldCreateSelectionKnobs
{
  objc_super v4;

  if (-[CRLWPShapeRep isEditingChildRep](self, "isEditingChildRep"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRep;
  return -[CRLCanvasRep shouldCreateSelectionKnobs](&v4, "shouldCreateSelectionKnobs");
}

- (BOOL)shouldCreateLockedKnobs
{
  objc_super v4;

  if (-[CRLWPShapeRep isEditingChildRep](self, "isEditingChildRep"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRep;
  return -[CRLCanvasRep shouldCreateLockedKnobs](&v4, "shouldCreateLockedKnobs");
}

- (unint64_t)enabledKnobMask
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = objc_msgSend(v3, "autosizes");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v6 = objc_msgSend(v5, "textIsVertical");

    if (v6)
      return 772;
    else
      return 592;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLWPShapeRep;
    return -[CRLShapeRep enabledKnobMask](&v8, "enabledKnobMask");
  }
}

- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4
{
  void *v7;
  _BOOL4 v8;
  objc_super v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (objc_msgSend(v7, "autosizes"))
  {
    v8 = sub_100260F28(a4);

    if (v8)
      return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 3, a4, self, CGPointZero.x, CGPointZero.y, 15.0);
  }
  else
  {

  }
  v10.receiver = self;
  v10.super_class = (Class)CRLWPShapeRep;
  return -[CRLCanvasRep newSelectionKnobForType:tag:](&v10, "newSelectionKnobForType:tag:", a3, a4);
}

- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3
{
  return -[CRLWPShapeRep canBeginEditingChildRepOnDoubleTap:ignoreSelectionState:](self, "canBeginEditingChildRepOnDoubleTap:ignoreSelectionState:", a3, 0);
}

- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3 ignoreSelectionState:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned __int8 v21;
  unsigned int v22;
  id v23;
  void *v24;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentEditors"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v26 = a4;
    v12 = v7;
    v13 = v6;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v16, "canBeginEditingRepOnDoubleTap:") & 1) != 0
          && !objc_msgSend(v16, "canBeginEditingRepOnDoubleTap:", self))
        {
          v17 = 0;
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
        continue;
      break;
    }
    v17 = 1;
LABEL_12:
    v6 = v13;
    v7 = v12;
    a4 = v26;
  }
  else
  {
    v17 = 1;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v19 = objc_msgSend(v18, "editingDisabled");

  if (v17
    && !a4
    && -[CRLWPShapeRep i_currentSelectionPathPreventsEditingChildRepOnDoubleTap:](self, "i_currentSelectionPathPreventsEditingChildRepOnDoubleTap:", v6))
  {
    v17 = v19;
  }
  if (((v17 ^ 1 | v19) & 1) != 0 || a4)
  {
    if (!v17)
      goto LABEL_21;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v21 = objc_msgSend(v20, "isInTopLevelContainerForEditing");

    if ((v21 & 1) == 0)
    {
LABEL_21:
      LOBYTE(v22) = 0;
      goto LABEL_30;
    }
  }
  v23 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  if (v23 == v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    if ((objc_msgSend(v24, "pathIsLineSegment") & 1) != 0)
      LOBYTE(v22) = 0;
    else
      v22 = !-[CRLCanvasRep isLocked](self, "isLocked");

  }
  else
  {
    LOBYTE(v22) = 0;
  }

LABEL_30:
  return v22;
}

- (void)updateChildrenFromLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLWPShapeRep;
  -[CRLCanvasRep updateChildrenFromLayout](&v13, "updateChildrenFromLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLayout"));

  if (v4 != v6)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230FF0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF018(v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231010);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeRep updateChildrenFromLayout]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 180, 0, "expected equality between %{public}s and %{public}s", "self.containedRep.layout", "self.layout.textLayout");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  objc_msgSend(v12, "updateChildrenFromLayout");

}

- (BOOL)beginEditingAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  CRLWPShapeRep *v11;
  CRLWPShapeRep *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _TtC8Freeform12CRLTextRange *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep shapeItem](self, "shapeItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = +[CRLWPEditor canEditTextIn:using:](_TtC8Freeform11CRLWPEditor, "canEditTextIn:using:", v6, v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitRep:", x, y));
    v11 = (CRLWPShapeRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForSelecting"));
    v12 = v11;
    if (!v11 || v11 == self)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "text"));
      v19 = objc_msgSend(v18, "length");

      if (v19)
      {
        v21 = objc_opt_class(CRLWPShapeLayout, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v23 = sub_100221D0C(v21, v22);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v23);

        v25 = objc_opt_class(_TtC8Freeform11CRLWPLayout, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "textLayout"));
        v27 = sub_100221D0C(v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

        objc_msgSend(v28, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "closestPositionTo:"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep storage](self, "storage"));
        v30 = objc_msgSend(v29, "findRangeOfWordBackwardFromCharIndex:expandingRangeToEndOfWord:", objc_msgSend(v39, "location"), 1);
        v32 = v31;

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "text"));
        -[CRLWPShapeRep willBeginEditingContainedInfo:](self, "willBeginEditingContainedInfo:", v34);

        v35 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v30, v32);
        -[CRLWPShapeRep beginEditingAtRange:](self, "beginEditingAtRange:", v35);

      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "text"));
        -[CRLWPShapeRep willBeginEditingContainedInfo:](self, "willBeginEditingContainedInfo:", v37);

        -[CRLWPShapeRep beginEditingAtBeginningOfText](self, "beginEditingAtBeginningOfText");
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v12, "info"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPathWithInfo:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
      objc_msgSend(v16, "setSelectionPath:", v15);

    }
  }
  return v8;
}

- (void)beginEditingAtBeginningOfText
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeForStartOf:](_TtC8Freeform12CRLTextRange, "textRangeForStartOf:", v3));
  -[CRLWPShapeRep beginEditingAtRange:](self, "beginEditingAtRange:", v4);

}

- (void)beginEditingAtRange:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep shapeItem](self, "shapeItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = +[CRLWPEditor canEditTextIn:using:](_TtC8Freeform11CRLWPEditor, "canEditTextIn:using:", v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionModelTranslator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathForInfos:", v8));

    v12 = objc_msgSend(v21, "nsRange");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", v12, v14, 7, 1, v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "editorController"));
    objc_msgSend(v20, "setSelectionPath:withFlags:", v18, 8710);

  }
}

- (BOOL)shouldHitTestWithFill
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  if ((objc_msgSend(v3, "isAutogrowingTextBox") & 1) != 0
    || (v8.receiver = self,
        v8.super_class = (Class)CRLWPShapeRep,
        -[CRLShapeRep shouldHitTestWithFill](&v8, "shouldHitTestWithFill")))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textStorage"));
    v4 = objc_msgSend(v6, "length") != 0;

  }
  return v4;
}

- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep p_hyperlinkAtUnscaledPoint:](self, "p_hyperlinkAtUnscaledPoint:", a3.x, a3.y));
  v4 = v3 != 0;

  return v4;
}

- (void)handleEditMenuTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep p_hyperlinkAtUnscaledPoint:](self, "p_hyperlinkAtUnscaledPoint:", a4, a3.x, a3.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
  if (v4 && +[CRLURLLauncher canOpenURL:](_TtC8Freeform14CRLURLLauncher, "canOpenURL:", v4))
    +[CRLURLLauncher openURL:](_TtC8Freeform14CRLURLLauncher, "openURL:", v4);

}

- (id)p_hyperlinkAtUnscaledPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v9 = objc_opt_class(CRLWPHyperlinkField, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep textRep](self, "textRep"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "smartFieldAtPoint:", v5, v7));
  v12 = sub_100221D0C(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return -[CRLWPShapeRep beginEditingAtPoint:](self, "beginEditingAtPoint:", a4, a3.x, a3.y);
}

- (void)willBeginEditingContainedInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

  if (v6 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v7, "createTextLayout");

    -[CRLWPShapeRep updateChildrenFromLayout](self, "updateChildrenFromLayout");
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)willEndEditingContainedInfo:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  objc_msgSend(v5, "length");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");

}

- (BOOL)i_currentSelectionPathPreventsEditingChildRepOnDoubleTap:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v6 = objc_msgSend(v4, "currentSelectionPathContainsInfo:", v5) ^ 1;

  return v6;
}

- (void)p_resetOverflowGlyphRenderableIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CRLCanvasRenderable *overflowGlyphRenderable;
  CRLCanvasRenderable *v9;
  CRLCanvasRenderable *v10;
  void *v11;
  id v12;

  if (!self->_overflowGlyphRenderable)
    goto LABEL_5;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v3, "contentsScale");
  v5 = v4;
  -[CRLCanvasRenderable contentsScale](self->_overflowGlyphRenderable, "contentsScale");
  v7 = v6;

  if (v5 != v7)
  {
    -[CRLCanvasRenderable setDelegate:](self->_overflowGlyphRenderable, "setDelegate:", 0);
    overflowGlyphRenderable = self->_overflowGlyphRenderable;
    self->_overflowGlyphRenderable = 0;

  }
  if (!self->_overflowGlyphRenderable)
  {
LABEL_5:
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep p_overflowKnobImage](self, "p_overflowKnobImage"));
    v9 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    v10 = self->_overflowGlyphRenderable;
    self->_overflowGlyphRenderable = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v11, "contentsScale");
    -[CRLCanvasRenderable setContents:](self->_overflowGlyphRenderable, "setContents:", objc_msgSend(v12, "CGImageForContentsScale:"));

    objc_msgSend(v12, "size");
    -[CRLCanvasRenderable setBounds:](self->_overflowGlyphRenderable, "setBounds:", sub_10005FDDC());
    -[CRLCanvasRenderable setDelegate:](self->_overflowGlyphRenderable, "setDelegate:", self);

  }
}

- (id)p_overflowKnobImage
{
  return +[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("ios-canvas-handle-overflow"));
}

- (unint64_t)overflowKnobTag
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  if (objc_msgSend(v2, "textIsVertical"))
    v3 = 4;
  else
    v3 = 8;

  return v3;
}

- (BOOL)hasTextOverflowGlyph
{
  void *v3;
  BOOL v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if (objc_msgSend(v3, "shouldShowTextOverflowGlyphs")
    && !-[CRLShapeRep isEditingPath](self, "isEditingPath"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep textRep](self, "textRep"));
    if (objc_msgSend(v5, "isOverflowing"))
    {
      v7.receiver = self;
      v7.super_class = (Class)CRLWPShapeRep;
      v4 = -[CRLShapeRep shouldShowKnobs](&v7, "shouldShowKnobs");
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowSelectionHighlight
{
  objc_super v4;

  if (-[CRLWPShapeRep isEditingChildRep](self, "isEditingChildRep"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRep;
  return -[CRLShapeRep shouldShowSelectionHighlight](&v4, "shouldShowSelectionHighlight");
}

- (id)overlayRenderables
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  objc_super v35;

  v3 = -[CRLWPShapeRep overflowKnobTag](self, "overflowKnobTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", v3));
  v5 = -[CRLWPShapeRep hasTextOverflowGlyph](self, "hasTextOverflowGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderable"));
  objc_msgSend(v6, "setHidden:", v5);

  v35.receiver = self;
  v35.super_class = (Class)CRLWPShapeRep;
  v7 = -[CRLShapeRep overlayRenderables](&v35, "overlayRenderables");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (-[CRLWPShapeRep hasTextOverflowGlyph](self, "hasTextOverflowGlyph")
    && -[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
  {
    -[CRLWPShapeRep p_resetOverflowGlyphRenderableIfNecessary](self, "p_resetOverflowGlyphRenderableIfNecessary");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", sub_100260E54(v3, v10, v11, v12, v13));
    objc_msgSend(v9, "convertUnscaledToBoundsPoint:");
    v15 = v14;
    v17 = v16;
    -[CRLCanvasRenderable bounds](self->_overflowGlyphRenderable, "bounds");
    v22 = sub_100061400(v18, v19, v20, v21);
    v23 = sub_1000603B8(v15, v17, v22);
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
    objc_msgSend(v26, "contentsScale");
    v28 = sub_1000630F8(v23, v25, v27);
    v30 = sub_1000603D0(v28, v29, v22);
    v32 = v31;

    -[CRLCanvasRenderable setPosition:](self->_overflowGlyphRenderable, "setPosition:", v30, v32);
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", self->_overflowGlyphRenderable));

    v8 = (void *)v33;
  }

  return v8;
}

- (id)additionalRenderablesOverRenderable
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CRLWPShapeRep;
  v3 = -[CRLShapeRep additionalRenderablesOverRenderable](&v36, "additionalRenderablesOverRenderable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CRLWPShapeRep hasTextOverflowGlyph](self, "hasTextOverflowGlyph")
    && !-[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
  {
    -[CRLWPShapeRep p_resetOverflowGlyphRenderableIfNecessary](self, "p_resetOverflowGlyphRenderableIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = -[CRLWPShapeRep overflowKnobTag](self, "overflowKnobTag");
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", sub_100260E54(v6, v7, v8, v9, v10));
    objc_msgSend(v5, "convertUnscaledToBoundsPoint:");
    v12 = v11;
    v14 = v13;
    -[CRLCanvasRenderable bounds](self->_overflowGlyphRenderable, "bounds");
    v19 = sub_100061400(v15, v16, v17, v18);
    v20 = sub_1000603B8(v12, v14, v19);
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      objc_msgSend(v24, "layerFrameInScaledCanvas");
      v20 = sub_1000603B8(v20, v22, v25);
      v22 = v26;

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
    objc_msgSend(v27, "contentsScale");
    v29 = sub_1000630F8(v20, v22, v28);
    v31 = sub_1000603D0(v29, v30, v19);
    v33 = v32;

    -[CRLCanvasRenderable setPosition:](self->_overflowGlyphRenderable, "setPosition:", v31, v33);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", self->_overflowGlyphRenderable));

    v4 = (void *)v34;
  }
  return v4;
}

- (double)pParagraphAlignmentOffset
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  double v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep shapeItem](self, "shapeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "paragraphStyleAtParIndex:effectiveRange:", 0, 0));

  v6 = objc_msgSend(v5, "intValueForProperty:", 29);
  if (v6 == 1)
  {
    v7 = 1.0;
  }
  else if (v6 == 2)
  {
    v7 = 0.5;
  }
  else
  {
    v7 = 0.0;
    if (v6 == 4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep shapeItem](self, "shapeItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
      v10 = objc_msgSend(v9, "isWritingDirectionRightToLeftForParagraphAtParIndex:", 0);

      if (v10)
        v7 = 1.0;
      else
        v7 = 0.0;
    }
  }

  return v7;
}

- (id)dynamicResizeDidBegin
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLWPShapeRep;
  v3 = -[CRLShapeRep dynamicResizeDidBegin](&v12, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (!objc_msgSend(v5, "autosizes"))
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  v8 = objc_msgSend(v7, "widthValid");

  if ((v8 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v5, "autosizePositionOffsetForFixedWidth:height:", 1, 1);
    self->_originalAutosizePositionOffset.x = v9;
    self->_originalAutosizePositionOffset.y = v10;
LABEL_4:

  }
  return v4;
}

- (void)dynamicOperationDidEnd
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPShapeRep;
  -[CRLShapeRep dynamicOperationDidEnd](&v3, "dynamicOperationDidEnd");
  -[CRLCanvasRep recursivelyPerformSelectorIfImplemented:](self, "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unsigned int v27;
  unsigned int v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v39;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));

  memset(&v39, 0, sizeof(v39));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originalPureGeometry"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "fullTransform");
  else
    memset(&t1, 0, sizeof(t1));
  v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v39, &t1, &t2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v12 = objc_msgSend(v11, "textIsVertical");

  if (v12)
  {
    if ((objc_msgSend(v6, "widthValid") & 1) != 0)
      goto LABEL_26;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v14 = objc_msgSend(v13, "verticalAlignment");

    v15 = 0.5;
    v16 = 0.0;
    if (v14 == (id)2)
      v15 = 0.0;
    if (v14)
      v17 = v15;
    else
      v17 = 1.0;
    if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated", v15)
      && (objc_msgSend(v6, "heightValid") & 1) == 0)
    {
      -[CRLWPShapeRep pParagraphAlignmentOffset](self, "pParagraphAlignmentOffset");
      v16 = v18;
    }
    memset(&t2, 0, sizeof(t2));
    v19 = v17;
    v20 = v16;
  }
  else
  {
    if ((objc_msgSend(v6, "heightValid") & 1) != 0)
      goto LABEL_26;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v22 = objc_msgSend(v21, "verticalAlignment");

    v23 = 0.5;
    if (v22 == (id)2)
      v23 = 1.0;
    v24 = 0.0;
    if (v22)
      v25 = v23;
    else
      v25 = 0.0;
    if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated", v23)
      && (objc_msgSend(v6, "widthValid") & 1) == 0)
    {
      -[CRLWPShapeRep pParagraphAlignmentOffset](self, "pParagraphAlignmentOffset");
      v24 = v26;
    }
    memset(&t2, 0, sizeof(t2));
    v19 = v24;
    v20 = v25;
  }
  CGAffineTransformMakeTranslation(&t2, v19, v20);
  v35 = t2;
  v34 = v39;
  CGAffineTransformConcat(&v36, &v35, &v34);
  v39 = v36;
LABEL_26:
  v27 = objc_msgSend(v6, "widthValid");
  v28 = objc_msgSend(v6, "heightValid");
  v29 = -[CRLCanvasRep isBeingRotated](self, "isBeingRotated");
  if ((v29 & 1) != 0)
    v30 = v27;
  else
    v30 = v12 ^ 1 | v27;
  if ((v29 & 1) != 0)
    v31 = v28;
  else
    v31 = v12 | v28;
  t2 = v39;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &t2, v30, v31));

  return v32;
}

- (BOOL)canMakePathEditable
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v4 = objc_msgSend(v3, "isAutogrowingTextBox");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

    v7 = objc_msgSend(v6, "length") != 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLWPShapeRep;
    return -[CRLShapeRep canMakePathEditable](&v9, "canMakePathEditable");
  }
  return v7;
}

- (CRLContainerInfo)containerInfo
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (CRLContainerInfo *)v10;
}

- (id)shapeItem
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (_TtC8Freeform12CRLWPStorage)storageForDragDropOperation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  if ((sub_1000665A8(v2) & 1) != 0)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textStorage"));

  return (_TtC8Freeform12CRLWPStorage *)v3;
}

- (BOOL)shouldRenderableBeDirectAncestorOfRenderableForChild:(id)a3
{
  return 1;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLWPShapeRep;
  v8 = -[CRLShapeRep dragOperationForDragInfo:atUnscaledPoint:](&v12, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep textRep](self, "textRep"));

    if (v9)
    {
      v8 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep dragAndDropHelper](self, "dragAndDropHelper"));
      v8 = objc_msgSend(v10, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);

    }
  }

  return (unint64_t)v8;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  objc_super v17;
  objc_super v18;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRLWPShapeRep;
  if (-[CRLShapeRep dragOperationForDragInfo:atUnscaledPoint:](&v18, "dragOperationForDragInfo:atUnscaledPoint:", v9, x, y))
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLWPShapeRep;
    v10 = -[CRLShapeRep handleDragOperation:withDragInfo:atUnscaledPoint:](&v17, "handleDragOperation:withDragInfo:atUnscaledPoint:", a3, v9, x, y);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep textRep](self, "textRep"));
    if (v11
      && (v12 = (void *)v11,
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout")),
          v14 = objc_msgSend(v13, "supportsInstructionalText"),
          v13,
          v12,
          !v14))
    {
      v10 = 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep dragAndDropHelper](self, "dragAndDropHelper"));
      v10 = objc_msgSend(v15, "handleDragOperation:withDragInfo:atUnscaledPoint:", a3, v9, x, y);

    }
  }

  return v10;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textStorage"));

  return (_TtC8Freeform12CRLWPStorage *)v3;
}

- (BOOL)allowGenericDrags
{
  return 0;
}

- (_TtC8Freeform11CRLWPEditor)textEditor
{
  return 0;
}

- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", a3.x, a3.y));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textStorage"));
  v7 = objc_msgSend(v4, "wpSelectionClassForStorage:", v6);

  return objc_msgSend(v7, "selectionWithRange:", 0, 0);
}

- (id)textEditorForDropIntoStorage:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(_TtC8Freeform11CRLWPEditor, v5);
  v8 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentInfo"));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = [v6 alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editingCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v16 = objc_msgSend(v12, "initWithEditingCoordinator:enclosingShape:icc:", v14, v11, v15);

  return v16;
}

- (BOOL)isDragPoint:(CGPoint)a3 inSelection:(id)a4 includeEndpoints:(BOOL)a5
{
  return 0;
}

- (NSArray)scribbleCapableElements
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  CRLWPShapeRep *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep")),
        v6 = -[CRLWPShapeRep canBeginEditingChildRepOnDoubleTap:ignoreSelectionState:](self, "canBeginEditingChildRepOnDoubleTap:ignoreSelectionState:", v5, 1), v5, v4, !v6))
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    v9 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  return (NSArray *)v7;
}

- (void)p_prepareForScribble
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v4, "createTextLayoutForScribble:", 1);

    -[CRLWPShapeRep updateChildrenFromLayout](self, "updateChildrenFromLayout");
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
    -[CRLShapeRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)prepareForScribbleBlock
{
  void *v3;
  void *v4;

  -[CRLWPShapeRep p_prepareForScribble](self, "p_prepareForScribble");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "prepareForScribbleBlock"));

  return v4;
}

- (id)willBeginWritingBlock
{
  return 0;
}

- (id)scribbleEditingBlock
{
  void *v3;
  void *v4;

  -[CRLWPShapeRep p_prepareForScribble](self, "p_prepareForScribble");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scribbleEditingBlock"));

  return v4;
}

- (CGRect)scaledScribbleEditingFrame
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

  -[CRLWPShapeRep p_prepareForScribble](self, "p_prepareForScribble");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  objc_msgSend(v3, "scaledScribbleEditingFrame");
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

- (BOOL)shouldDelayScribbleFocus
{
  void *v3;
  unsigned __int8 v4;

  -[CRLWPShapeRep p_prepareForScribble](self, "p_prepareForScribble");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  v4 = objc_msgSend(v3, "shouldDelayScribbleFocus");

  return v4;
}

- (BOOL)scribbleElementIsFocused
{
  void *v3;
  unsigned __int8 v4;

  -[CRLWPShapeRep p_prepareForScribble](self, "p_prepareForScribble");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  v4 = objc_msgSend(v3, "scribbleElementIsFocused");

  return v4;
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
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
  double v19;
  double v20;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CRLWPShapeRep p_prepareForScribble](self, "p_prepareForScribble");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  objc_msgSend(v8, "hitToleranceInsetsWithDefaultInsets:", top, left, bottom, right);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  if (-[CRLWPShapeRep allowDraggingShape](self, "allowDraggingShape"))
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLWPShapeRep;
    v6 = -[CRLCanvasRep dragItemsForBeginningDragAtPoint:](&v9, "dragItemsForBeginningDragAtPoint:", x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)allowDraggingShape
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isBeingEdited") & 1) != 0)
      LOBYTE(v5) = 0;
    else
      v5 = !-[CRLWPShapeRep isReadOnlyAndInstructional](self, "isReadOnlyAndInstructional");
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isReadOnlyAndInstructional
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v3, "editingDisabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeRep containedRep](self, "containedRep"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
    v6 = objc_msgSend(v5, "isInstructional");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSUUID)scribbleIdentifier
{
  return self->_scribbleIdentifier;
}

- (CRLCanvasRenderable)overflowGlyphRenderable
{
  return self->_overflowGlyphRenderable;
}

- (void)setOverflowGlyphRenderable:(id)a3
{
  objc_storeStrong((id *)&self->_overflowGlyphRenderable, a3);
}

- (CGPoint)originalAutosizePositionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalAutosizePositionOffset.x;
  y = self->_originalAutosizePositionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalAutosizePositionOffset:(CGPoint)a3
{
  self->_originalAutosizePositionOffset = a3;
}

- (NSTimer)hyperlinkTimer
{
  return self->_hyperlinkTimer;
}

- (void)setHyperlinkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hyperlinkTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperlinkTimer, 0);
  objc_storeStrong((id *)&self->_overflowGlyphRenderable, 0);
  objc_storeStrong((id *)&self->_scribbleIdentifier, 0);
  objc_storeStrong((id *)&self->_dragAndDropHelper, 0);
}

@end
