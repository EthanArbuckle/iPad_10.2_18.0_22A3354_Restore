@implementation CRLKeyboardMovementManipulator

- (CRLKeyboardMovementManipulator)initWithInteractiveCanvasController:(id)a3
{
  CRLInteractiveCanvasController *v4;
  CRLKeyboardMovementManipulator *v5;
  CRLKeyboardMovementManipulator *v6;
  CRLCanvasRepDragTracker *mTracker;
  objc_super v9;

  v4 = (CRLInteractiveCanvasController *)a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLKeyboardMovementManipulator;
  v5 = -[CRLKeyboardMovementManipulator init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    mTracker = v5->mTracker;
    v5->mICC = v4;
    v5->mTracker = 0;

  }
  return v6;
}

- (double)p_movementFactorInPixelSpace:(int64_t)a3
{
  double v3;
  double v4;

  v3 = (double)a3;
  -[CRLInteractiveCanvasController viewScale](self->mICC, "viewScale");
  return v3 / v4;
}

- (void)moveSelectionByDelta:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CRLCanvasRepDragTracker *v32;
  void *v33;
  CRLCanvasRepDragTracker *v34;
  CRLCanvasRepDragTracker *mTracker;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CRLCanvasCommandSelectionBehavior *v46;
  void *v47;
  void *v48;
  void *v49;
  CRLCanvasCommandSelectionBehavior *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CRLCanvasRepDragTracker *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self->mICC, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self->mICC, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unlockedBoardItemsForSelectionPath:", v7));

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v58;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v58 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](self->mICC, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v17)));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layout"));
        if (objc_msgSend(v19, "isDraggable"))
        {
          v20 = -[CRLInteractiveCanvasController isInDynamicOperation](self->mICC, "isInDynamicOperation");

          if ((v20 & 1) == 0)
          {
            v21 = objc_msgSend(v4, "count");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layout"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geometryInRoot"));
            objc_msgSend(v23, "frame");
            v25 = v24;
            v27 = v26;
            v29 = v28;
            v31 = v30;
            if (v21)
            {
              v62.origin.x = x;
              v62.origin.y = y;
              v62.size.width = width;
              v62.size.height = height;
              v64.origin.x = v25;
              v64.origin.y = v27;
              v64.size.width = v29;
              v64.size.height = v31;
              v63 = CGRectUnion(v62, v64);
              v25 = v63.origin.x;
              v27 = v63.origin.y;
              v29 = v63.size.width;
              v31 = v63.size.height;
            }

            objc_msgSend(v4, "addObject:", v18);
            height = v31;
            width = v29;
            y = v27;
            x = v25;
          }
        }
        else
        {

        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v4, "count"))
  {
    v32 = [CRLCanvasRepDragTracker alloc];
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
    v34 = -[CRLCanvasRepDragTracker initWithRep:](v32, "initWithRep:", v33);
    mTracker = self->mTracker;
    self->mTracker = v34;

    -[CRLCanvasRepDragTracker setShowDragHUD:](self->mTracker, "setShowDragHUD:", 0);
    -[CRLCanvasRepDragTracker setShouldSnapToGuides:](self->mTracker, "setShouldSnapToGuides:", 0);
    -[CRLCanvasRepDragTracker setIsArrowkeyDrivenTracking:](self->mTracker, "setIsArrowkeyDrivenTracking:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"));
    objc_msgSend(v36, "registerTrackerManipulator:", self);
    objc_msgSend(v36, "takeControlWithTrackerManipulator:", self);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"));
    -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 0, a3.x, a3.y);
    v38 = sub_100061400(x, y, width, height);
    v40 = v39;
    -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:");
    v42 = v41;
    v44 = v43;
    -[CRLCanvasRepDragTracker setLogicalDragPoint:](self->mTracker, "setLogicalDragPoint:");
    -[CRLCanvasRepDragTracker setActualDragPoint:](self->mTracker, "setActualDragPoint:", v42, v44);
    objc_msgSend(v37, "beginOperation");
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController commandController](self->mICC, "commandController"));
    v46 = [CRLCanvasCommandSelectionBehavior alloc];
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self->mICC, "editorController"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "selectionPath"));
    v50 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](v46, "initWithCanvasEditor:type:selectionPath:selectionFlags:", v47, 2, v49, 4);

    objc_msgSend(v45, "openGroupWithSelectionBehavior:", v50);
    objc_msgSend(v37, "startTransformingReps:", v4);
    -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:", sub_1000603D0(v38, v40, a3.x));
    v52 = v51;
    v54 = v53;
    -[CRLCanvasRepDragTracker setLogicalDragPoint:](self->mTracker, "setLogicalDragPoint:");
    -[CRLCanvasRepDragTracker setActualDragPoint:](self->mTracker, "setActualDragPoint:", v52, v54);
    objc_msgSend(v37, "handleTrackerManipulator:", self);
    objc_msgSend(v45, "closeGroup");
    v55 = self->mTracker;
    self->mTracker = 0;

  }
}

- (void)duplicateSelectionMovingByDelta:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  Class v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  double v43;
  objc_class *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  CRLCanvasRepDragTracker *mTracker;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self->mICC, "selectionModelTranslator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self->mICC, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unlockedBoardItemsForSelectionPath:", v8));

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  v12 = v10;
  if (!v11)
    goto LABEL_25;
  v13 = v11;
  v14 = 0;
  v15 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v60 != v15)
        objc_enumerationMutation(v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](self->mICC, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i)));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layout"));
      v19 = objc_msgSend(v18, "isDraggable");

      v14 += v19;
    }
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  }
  while (v13);

  if (v14)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController commandController](self->mICC, "commandController"));
    objc_msgSend(v20, "openGroup");
    objc_msgSend(v20, "enableProgressiveEnqueuingInCurrentGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, CFSTR("UndoStrings")));
    v57 = v20;
    objc_msgSend(v20, "setCurrentGroupActionString:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard pasteboardWithName:create:](CRLPasteboard, "pasteboardWithName:create:", CFSTR("com.apple.freeform.Canvas.CRLCanvasRepNoPositionOffsetPasteboardName"), 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self->mICC, "editorController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "editorForEditAction:withSender:", "copy:", 0));
    v58 = v25;
    if ((objc_opt_respondsToSelector(v25, "copyForKeyboardMovementDuplicationToPasteboard:") & 1) == 0)
    {
      v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124D128);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E19AD4(v27, (uint64_t)v25, v26);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124D148);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v28, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLKeyboardMovementManipulator duplicateSelectionMovingByDelta:]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLKeyboardMovementManipulator.m"));
      objc_opt_class(v25, v31);
      v33 = NSStringFromClass(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 143, 0, "Editor (%{public}@) responds to copy: but not copyForKeyboardMovementDuplicationToPasteboard:. Falling back to canvas editor.", v34);

      v25 = v12;
    }
    objc_msgSend(v25, "copyForKeyboardMovementDuplicationToPasteboard:", v23);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPath"));
    *(_QWORD *)&v37 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v36).n128_u64[0];
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mostSpecificSelectionOfClass:", v38, v37));
    if (v39)
    {
      v40 = (void *)v39;
      v41 = objc_msgSend(v35, "indexForSelection:", v39);
      *(_QWORD *)&v43 = objc_opt_class(CRLGroupEditor, v42).n128_u64[0];
      v45 = v44;
      v56 = v24;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentEditors", v43));
      v47 = v23;
      v48 = v46;
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", v41));
      v50 = sub_1002223BC(v45, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

      v23 = v47;
      if (objc_msgSend(v51, "canPasteWithPasteboard:", v47))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "pasteNativeInfosFromPasteboard:", v47));

        v24 = v56;
LABEL_24:
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v52));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathWithInfos:", v53));
        objc_msgSend(v24, "setSelectionPath:", v54);

        -[CRLInteractiveCanvasController layoutIfNeeded](self->mICC, "layoutIfNeeded");
        -[CRLKeyboardMovementManipulator moveSelectionByDelta:](self, "moveSelectionByDelta:", x, y);
        objc_msgSend(v57, "closeGroup");
        mTracker = self->mTracker;
        self->mTracker = 0;

LABEL_25:
        goto LABEL_26;
      }

      v24 = v56;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pasteNativeInfosFromPasteboard:allowImageReplacement:", v23, 0));
    goto LABEL_24;
  }
LABEL_26:

}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->mTracker;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (BOOL)readyToEndOperation
{
  return 1;
}

- (void)operationDidEnd
{
  -[CRLCanvasRepDragTracker endPossibleRepDragGesture](self->mTracker, "endPossibleRepDragGesture");
}

- (CRLInteractiveCanvasController)i_ICC
{
  return self->mICC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTracker, 0);
}

@end
