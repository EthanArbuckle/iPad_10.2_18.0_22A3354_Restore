@implementation CRLCanvasRepDragTracker

- (CRLCanvasRepDragTracker)initWithRep:(id)a3
{
  id v4;
  CRLCanvasRepDragTracker *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *mMapRepsToSnapOffsets;
  CRLCanvasHUDController *v11;
  CRLCanvasHUDController *mSecondHUDController;
  UIImpactFeedbackGenerator *v13;
  UIImpactFeedbackGenerator *mImpactFeedbackGenerator;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasRepDragTracker;
  v5 = -[CRLCanvasRepDragTracker init](&v16, "init");
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261498);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E397D0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012614B8);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker initWithRep:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 135, 0, "invalid nil value for '%{public}s'", "rep");

    }
    -[CRLCanvasRepDragTracker setRep:](v5, "setRep:", v4);
    v9 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    mMapRepsToSnapOffsets = v5->mMapRepsToSnapOffsets;
    v5->mMapRepsToSnapOffsets = v9;

    v11 = objc_alloc_init(CRLCanvasHUDController);
    mSecondHUDController = v5->mSecondHUDController;
    v5->mSecondHUDController = v11;

    v5->mShowDragHUD = 0;
    v13 = (UIImpactFeedbackGenerator *)objc_alloc_init((Class)UIImpactFeedbackGenerator);
    mImpactFeedbackGenerator = v5->mImpactFeedbackGenerator;
    v5->mImpactFeedbackGenerator = v13;

    -[UIImpactFeedbackGenerator prepare](v5->mImpactFeedbackGenerator, "prepare");
    v5->mConstraintAngle = -1.0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->mHaveShownHUD || self->mHaveShownSecondHUD)
    -[CRLCanvasRepDragTracker p_hideHUD](self, "p_hideHUD");
  -[CRLCanvasRenderable setDelegate:](self->mGuideRenderable, "setDelegate:", 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepDragTracker;
  -[CRLCanvasRepDragTracker dealloc](&v3, "dealloc");
}

- (void)activateUIFeedback
{
  -[UIImpactFeedbackGenerator impactOccurred](self->mImpactFeedbackGenerator, "impactOccurred");
}

- (void)beginShowingDragUIForInitialDragPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  NSMutableSet *mConnectedLineLayouts;
  NSMutableSet *v15;
  NSMutableSet *mParentLayoutsForInvalidatingForAncestorCollabCursors;

  y = a3.y;
  x = a3.x;
  if (!-[CRLCanvasRepDragTracker p_delegateIsHandlingDrag](self, "p_delegateIsHandlingDrag"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
    if (objc_msgSend(v7, "isInPossibleDynamicOperation"))
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
      v9 = objc_msgSend(v8, "isInOperation");

      if ((v9 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012614D8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3987C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012614F8);
        v10 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker beginShowingDragUIForInitialDragPoint:]"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 205, 0, "showing UI for drag without being in some kind of dynamic operation");

      }
    }
    self->mInitialDragPoint.x = x;
    self->mInitialDragPoint.y = y;
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mConnectedLineLayouts = self->mConnectedLineLayouts;
    self->mConnectedLineLayouts = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mParentLayoutsForInvalidatingForAncestorCollabCursors = self->mParentLayoutsForInvalidatingForAncestorCollabCursors;
    self->mParentLayoutsForInvalidatingForAncestorCollabCursors = v15;

    -[CRLCanvasRepDragTracker didChangeCurrentlyTransformingReps](self, "didChangeCurrentlyTransformingReps");
    -[CRLCanvasRepDragTracker p_updateGuides](self, "p_updateGuides");
    -[CRLCanvasRepDragTracker performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_updateHUDFromTimer", 0, 0.2);

  }
}

- (void)endPossibleRepDragGesture
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  -[CRLCanvasRepDragTracker p_hideHUD](self, "p_hideHUD");
  -[CRLCanvasRepDragTracker p_hideGuideRenderable](self, "p_hideGuideRenderable");
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideController"));
  objc_msgSend(v3, "endAlignmentOperation");

  if (self->mGuideRenderable)
    objc_msgSend(v4, "removeDecorator:", self);

}

- (BOOL)insertInfosAndUpdateDragForDuplicatingDragIfAppropriate
{
  CRLCanvasRepDragTracker *v2;
  void *v3;
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
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
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
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *j;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  CRLCanvasRepDragTracker *v51;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v2 = self;
  if (self->mDidDuplicateWhenDragBegan)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261518);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3997C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261538);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker insertInfosAndUpdateDragForDuplicatingDragIfAppropriate]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 271, 0, "Should only call insertInfosAndUpdateDragForDuplicatingDragIfAppropriate once!");

  }
  if (!-[CRLCanvasRepDragTracker p_delegateIsHandlingDrag](v2, "p_delegateIsHandlingDrag"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v2->mRep, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepDragTracker rep](v2, "rep"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unlockedBoardItemsForSelectionPath:", v11));

    v13 = 0;
    if (objc_msgSend(v7, "canvasEditorCanOptionDragDuplicateWithSender:", 0))
    {
      if (objc_msgSend(v12, "count"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));
        objc_msgSend(v14, "openGroup");
        objc_msgSend(v14, "enableProgressiveEnqueuingInCurrentGroup");
        v2->mDidDuplicateWhenDragBegan = 1;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditorHelper"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "insertCopiesOfInfos:forDuplicatingDragOnRep:", v12, v8));

        objc_msgSend(v6, "layoutIfNeeded");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPathWithInfos:", v13));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
        objc_msgSend(v17, "setSelectionPath:", v16);

      }
      else
      {
        v13 = 0;
      }
    }
    v54 = objc_alloc_init((Class)NSMutableSet);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i)));
          if (v23)
            objc_msgSend(v54, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v20);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
    objc_msgSend(v24, "stopTransformingReps:", v54);

    v52 = v13;
    if (objc_msgSend(v13, "count"))
    {
      v50 = v7;
      v51 = v2;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelZOrderedSiblingsOfInfos:", v18));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "crl_arrayWithObjectsInSet:", v18));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
      v47 = v26;
      v28 = objc_msgSend(v26, "indexOfObjectIdenticalTo:", v27);

      v53 = v28;
      if (v28 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101261558);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E398FC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101261578);
        v29 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker insertInfosAndUpdateDragForDuplicatingDragIfAppropriate]"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 319, 0, "Unable to find index!");

      }
      v48 = v18;
      v49 = v8;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelZOrderedSiblingsOfInfos:", v13));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "crl_arrayWithObjectsInSet:", v13));

      v34 = objc_alloc_init((Class)NSMutableSet);
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v35 = v13;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v36)
      {
        v37 = v36;
        v38 = 0;
        v39 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v37; j = (char *)j + 1)
          {
            if (*(_QWORD *)v56 != v39)
              objc_enumerationMutation(v35);
            v41 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:createIfNeeded:", v41, 1));
            if (v42)
              objc_msgSend(v34, "addObject:", v42);
            if (objc_msgSend(v33, "indexOfObjectIdenticalTo:", v41) == v53)
            {
              v43 = v42;

              v38 = v43;
            }

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v37);
      }
      else
      {
        v38 = 0;
      }

      v44 = v34;
      if (objc_msgSend(v34, "count"))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
        objc_msgSend(v45, "startTransformingReps:", v34);

      }
      v7 = v50;
      v2 = v51;
      v18 = v48;
      if (v38)
        -[CRLCanvasRepDragTracker setRep:](v51, "setRep:", v38);

      v8 = v49;
    }
    else
    {
      v38 = 0;
    }

  }
  return v2->mDidDuplicateWhenDragBegan;
}

- (void)addUnscaledDragDelta:(CGPoint)a3 roundDeltaToViewScale:(BOOL)a4
{
  CGFloat v5;

  self->mRoundDragDelta = a4;
  self->mUnscaledDragDelta.x = sub_1000603D0(self->mUnscaledDragDelta.x, self->mUnscaledDragDelta.y, a3.x);
  self->mUnscaledDragDelta.y = v5;
}

- (void)setActualDragPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  id v8;

  y = a3.y;
  x = a3.x;
  if (!self->mHaveSetPreviousActualDragPoint)
    self->mPreviousActualDragPoint = self->mActualDragPoint;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  objc_msgSend(v8, "convertBoundsToUnscaledPoint:", x, y);
  self->mActualDragPoint.x = v6;
  self->mActualDragPoint.y = v7;

}

- (void)setLogicalDragPoint:(CGPoint)a3
{
  self->mLogicalDragPoint = a3;
}

- (void)setShouldConstrain:(BOOL)a3
{
  if (self->mShouldConstrain != a3)
  {
    self->mShouldConstrain = a3;
    if (!self->mDidBeginDrag)
    {
      if (a3)
      {
        if (!self->mConstraintGuidesShowing)
          -[CRLCanvasRepDragTracker p_showGuideRenderable](self, "p_showGuideRenderable");
      }
      else if (self->mConstraintGuidesShowing)
      {
        -[CRLCanvasRepDragTracker p_hideGuideRenderable](self, "p_hideGuideRenderable");
      }
    }
  }
}

- (void)setSnapLevel:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (a3 != 0.0 && !self->mShouldConstrain)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261598);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E399FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012615B8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker setSnapLevel:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 380, 0, "non-zero snap level when we aren't constraining the drag. that doesn't make sense.");

  }
  if (self->mSnapLevel != a3)
    self->mSnapLevel = a3;
}

- (void)setConstrainingPoint:(CGPoint)a3
{
  self->mConstrainingPoint = a3;
}

- (void)preventOpeningCommandGroupWhenCommittingChangesForReps
{
  self->mPreventOpeningCommandGroupWhenCommittingChangesForReps = 1;
}

- (void)p_didBeginDrag
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (!self->mDidBeginDrag)
  {
    self->mDidBeginDrag = 1;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepDragTracker rep](self, "rep"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));
    objc_msgSend(v4, "hideEditMenu");

  }
}

- (void)setShouldShowGuides:(BOOL)a3
{
  BOOL v3;

  self->mShouldShowGuides = a3;
  v3 = self->mShowDragHUD || !a3;
  if (!v3 && !-[CRLCanvasRepDragTracker shouldSnapToGuides](self, "shouldSnapToGuides"))
    self->mShowDragHUD = 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;

  if (!self->mIsEnqueueingCommandsInRealTime)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController", a3));
    if (!objc_msgSend(v4, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime"))
    {
LABEL_5:

      goto LABEL_6;
    }
    v5 = -[CRLCanvasRep allowsSupportedDynamicOperationsToBeRealTime](self->mRep, "allowsSupportedDynamicOperationsToBeRealTime");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));

      objc_msgSend(v4, "openGroup");
      objc_msgSend(v4, "enableRealTimeSyncProgressiveEnqueuingInCurrentGroup");
      self->mIsEnqueueingCommandsInRealTime = 1;
      goto LABEL_5;
    }
  }
LABEL_6:
  -[CRLCanvasRepDragTracker p_delegateIsHandlingDrag](self, "p_delegateIsHandlingDrag", a3);
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  BOOL v4;
  double x;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  unsigned int v12;
  double v13;
  BOOL v14;
  int v15;
  int v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  CRLCanvasRepDragTracker *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  void *k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unsigned int v57;
  double v58;
  CRLCanvasRepDragTracker *v59;
  double mConstraintAngle;
  double v61;
  double v62;
  __double2 v63;
  double v64;
  double v65;
  double v66;
  double mSnapLevel;
  double v68;
  double v69;
  void *v70;
  unsigned int v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  id v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  void *m;
  void *v108;
  unsigned int v109;
  unsigned int v110;
  char v111;
  double v112;
  double v113;
  id v114;
  id v115;
  uint64_t v116;
  void *n;
  double v118;
  double v119;
  double v120;
  double v121;
  unsigned __int8 v122;
  unsigned __int8 v123;
  char v124;
  void *v125;
  void *v126;
  unsigned int v127;
  unsigned int v128;
  __double2 v129;
  double sinval;
  _BOOL4 v132;
  _BOOL4 v133;
  _BOOL4 v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  id v162;
  id v163;
  uint64_t v164;
  void *ii;
  void *v166;
  void *v167;
  NSMapTable *mMapRepsToSnapOffsets;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double height;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  id v180;
  uint64_t v181;
  void *kk;
  double v183;
  double v184;
  double v185;
  double v186;
  CGFloat v187;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  unsigned int v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  NSString *v196;
  void *v197;
  NSString *v198;
  id v199;
  char *v200;
  void *v201;
  NSMutableSet *v202;
  id v203;
  uint64_t v204;
  void *mm;
  uint64_t v206;
  void *v207;
  id v208;
  void *v209;
  double obj;
  id obja;
  uint64_t v212;
  int v213;
  id v214;
  double v215;
  int v216;
  double v217;
  void *jj;
  void *v219;
  unsigned __int8 v220;
  double width;
  CRLCanvasRepDragTracker *v222;
  double rect;
  void *recta;
  unsigned int v225;
  unsigned int v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  _QWORD v251[5];
  uint64_t v252;
  uint64_t *v253;
  uint64_t v254;
  char v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint8_t v268[128];
  uint8_t buf[4];
  unsigned int v270;
  __int16 v271;
  const char *v272;
  __int16 v273;
  const char *v274;
  __int16 v275;
  int v276;
  __int16 v277;
  id v278;
  __int16 v279;
  void *v280;
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;

  v208 = a3;
  if (self->mDidBeginDrag
    || (self->mUnscaledDragDelta.x == CGPointZero.x ? (v4 = self->mUnscaledDragDelta.y == CGPointZero.y) : (v4 = 0), !v4))
  {
    v222 = self;
    v209 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
    if (self->mRoundDragDelta)
    {
      objc_msgSend(v209, "viewScale");
      x = self->mUnscaledDragDelta.x;
      y = self->mUnscaledDragDelta.y;
      v8 = sub_1000630F8(x, y, v7);
      v10 = v9;
    }
    else
    {
      v8 = self->mUnscaledDragDelta.x;
      v10 = self->mUnscaledDragDelta.y;
      x = v8;
      y = v10;
    }
    self->mUnscaledDragDelta.x = sub_1000603B8(x, y, v8);
    self->mUnscaledDragDelta.y = v11;
    -[CRLCanvasRepDragTracker p_didBeginDrag](self, "p_didBeginDrag");
    if (-[CRLCanvasRepDragTracker p_delegateIsHandlingDrag](self, "p_delegateIsHandlingDrag"))
    {
LABEL_216:
      self->mPreviousActualDragPoint = self->mActualDragPoint;
      self->mHaveSetPreviousActualDragPoint = 1;

      goto LABEL_217;
    }
    v12 = -[CRLCanvasRepDragTracker shouldSnapToGuides](self, "shouldSnapToGuides");
    if ((v12 & 1) != 0)
    {
      v13 = fabs(v10);
      if (fabs(v8) >= 6.0)
      {
        v225 = -[CRLCanvasRepDragTracker shouldShowGuides](self, "shouldShowGuides");
        v15 = 0;
        v220 = 1;
        v14 = v13 < 6.0;
      }
      else
      {
        v225 = 1;
        v14 = v13 < 6.0;
        v15 = 1;
        v220 = 1;
      }
      v16 = 1;
      v226 = 1;
      if (v14)
      {
LABEL_17:
        v216 = v16;
        v266 = 0u;
        v267 = 0u;
        v264 = 0u;
        v265 = 0u;
        v17 = v208;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v264, v288, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v265;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(_QWORD *)v265 != v19)
                objc_enumerationMutation(v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v222->mMapRepsToSnapOffsets, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * (_QWORD)i)));
              if (!v21)
              {
                -[NSMapTable removeAllObjects](v222->mMapRepsToSnapOffsets, "removeAllObjects");
                goto LABEL_27;
              }

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v264, v288, 16);
            if (v18)
              continue;
            break;
          }
        }
LABEL_27:

        v262 = 0u;
        v263 = 0u;
        v260 = 0u;
        v261 = 0u;
        v22 = v17;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v260, v287, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v261;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(_QWORD *)v261 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v26, "isBeingDragged") & 1) == 0)
                objc_msgSend(v26, "dynamicDragDidBegin");
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v260, v287, 16);
          }
          while (v23);
        }

        v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "commandController"));
        v27 = v222;
        if (v222->mIsEnqueueingCommandsInRealTime)
        {
          objc_msgSend(v207, "openGroup");
          v27 = v222;
        }
        v219 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepDragTracker repsForGuidesWhenManipulatingReps:](v27, "repsForGuidesWhenManipulatingReps:", v22));
        v258 = 0u;
        v259 = 0u;
        v256 = 0u;
        v257 = 0u;
        v28 = v22;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v256, v286, 16);
        v31 = CGRectZero.origin.x;
        v30 = CGRectZero.origin.y;
        width = CGRectZero.size.width;
        rect = CGRectZero.size.height;
        if (v29)
        {
          v32 = *(_QWORD *)v257;
          do
          {
            for (k = 0; k != v29; k = (char *)k + 1)
            {
              if (*(_QWORD *)v257 != v32)
                objc_enumerationMutation(v28);
              v34 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * (_QWORD)k);
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layout"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v222->mMapRepsToSnapOffsets, "objectForKey:", v34));
              v37 = v36;
              v38 = CGPointZero.x;
              if (v36)
              {
                objc_msgSend(v36, "CGPointValue");
                v38 = v39;
              }
              v40 = sub_1000603B8(v8, v10, v38);
              v42 = v41;
              if (objc_msgSend(v34, "shouldShowSizesInRulers")
                && objc_msgSend(v219, "containsObject:", v34))
              {
                objc_msgSend(v34, "snapRectForDynamicDragWithOffset:", v40, v42);
                v31 = sub_100060C2C(v31, v30, width, rect, v43, v44, v45, v46);
                v30 = v47;
                width = v48;
                rect = v49;
              }
              objc_msgSend(v35, "dragByUnscaled:", v40, v42);

            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v256, v286, 16);
          }
          while (v29);
        }

        if (v222->mIsEnqueueingCommandsInRealTime)
          objc_msgSend(v207, "closeGroup");
        v51 = CGPointZero.x;
        v50 = CGPointZero.y;
        v215 = v50;
        if (v222->mShouldConstrain)
        {
          -[CRLCanvasRep i_dragOffset](v222->mRep, "i_dragOffset");
          v53 = v52;
          v55 = v54;
          v56 = sub_100061070(v52, v54);
          v57 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
          objc_msgSend(v209, "viewScale");
          if (v56 == 0.0)
          {
            v59 = v222;
            v222->mConstraintAngle = -1.0;
            mConstraintAngle = -1.0;
          }
          else
          {
            v61 = 200.0;
            if (v57)
              v61 = 50.0;
            v59 = v222;
            if (v56 > v61 / v58 || (mConstraintAngle = v222->mConstraintAngle, mConstraintAngle < 0.0))
            {
              v62 = acos(v53 / v56);
              if (v55 < 0.0)
                v62 = 6.28318531 - v62;
              mConstraintAngle = round(v62 / 0.785398163) * 0.785398163;
              v222->mConstraintAngle = mConstraintAngle;
            }
          }
          v63 = __sincos_stret(mConstraintAngle);
          v64 = sub_1000603C4(v63.__cosval, v63.__sinval, v53, v55);
          v65 = sub_1000603DC(v63.__cosval, v63.__sinval, v64);
          mSnapLevel = v59->mSnapLevel;
          if (mSnapLevel != 0.0)
          {
            v65 = mSnapLevel * round(v65 / mSnapLevel);
            v66 = mSnapLevel * round(v66 / mSnapLevel);
          }
          v51 = sub_1000603B8(v65, v66, v53);
          v50 = v68;
          v31 = sub_1000603D0(v31, v30, v51);
          v30 = v69;
        }
        v252 = 0;
        v253 = &v252;
        v254 = 0x2020000000;
        v255 = 0;
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allObjects"));
        v251[0] = _NSConcreteStackBlock;
        v251[1] = 3221225472;
        v251[2] = sub_10048C7F8;
        v251[3] = &unk_1012615E0;
        v251[4] = &v252;
        v71 = objc_msgSend(v70, "crl_allObjectsPassTest:", v251);

        v73 = v215;
        v72 = CGPointZero.x;
        if ((v12 & v71) == 1)
        {
          if (!v222->mShouldConstrain
            || v222->mSnapLevel == 0.0
            || (v73 = v215,
                v72 = CGPointZero.x,
                objc_msgSend(v209, "isCanvasBackgroundAlignmentSnappingEnabled")))
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "guideController"));
            if (objc_msgSend(v209, "isCanvasBackgroundAlignmentSnappingEnabled")
              && objc_msgSend(v28, "count") == (id)1)
            {
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "anyObject"));
              *(_QWORD *)&v77 = objc_opt_class(CRLShapeLayout, v76).n128_u64[0];
              v79 = v78;
              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "layout", v77));
              v81 = sub_100221D0C(v79, v80);
              v82 = (void *)objc_claimAutoreleasedReturnValue(v81);

              if (v82 && objc_msgSend(v82, "pathIsLineSegment"))
              {
                *(_QWORD *)&v84 = objc_opt_class(CRLConnectionLineLayout, v83).n128_u64[0];
                v86 = v85;
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "layout", v84));
                v88 = sub_100221D0C(v86, v87);
                v89 = (void *)objc_claimAutoreleasedReturnValue(v88);

                if (v89 && (objc_msgSend(v89, "isStraightLine") & 1) == 0)
                {
                  objc_msgSend(v74, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:", 0, 1, 1, 0, v31, v30, width, rect, CGPointZero.x, v215, CGPointZero.x, v215);
                }
                else
                {
                  objc_msgSend(v82, "tailPoint");
                  objc_msgSend(v82, "convertNaturalPointToUnscaledCanvas:");
                  v91 = v90;
                  v93 = v92;
                  objc_msgSend(v82, "headPoint");
                  objc_msgSend(v82, "convertNaturalPointToUnscaledCanvas:");
                  objc_msgSend(v74, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:", 0, 1, 1, 1, v31, v30, width, rect, v91, v93, v94, v95);
                }
                v72 = v96;
                v73 = v97;

              }
              else
              {
                LOBYTE(v206) = *((_BYTE *)v253 + 24) == 0;
                objc_msgSend(v74, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", 0, 1, 1, 0, 0, 0, v31, v30, width, rect, CGPointZero.x, v215, CGPointZero.x, v215, v206);
                v72 = v101;
                v73 = v102;
              }

            }
            else
            {
              v98 = objc_msgSend(v209, "isCanvasBackgroundAlignmentSnappingEnabled");
              LOBYTE(v206) = *((_BYTE *)v253 + 24) == 0;
              objc_msgSend(v74, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", 0, 1, v98, 0, 0, 0, v31, v30, width, rect, CGPointZero.x, v215, CGPointZero.x, v215, v206);
              v72 = v99;
              v73 = v100;
            }
            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v249 = 0u;
            v250 = 0u;
            v247 = 0u;
            v248 = 0u;
            v104 = v28;
            v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v247, v285, 16);
            if (v105)
            {
              v106 = *(_QWORD *)v248;
              do
              {
                for (m = 0; m != v105; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v248 != v106)
                    objc_enumerationMutation(v104);
                  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v247 + 1) + 8 * (_QWORD)m), "additionalRectsForSnappingWithOffset:", v51, v50));
                  objc_msgSend(v103, "addObjectsFromArray:", v108);

                }
                v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v247, v285, 16);
              }
              while (v105);
            }

            if (objc_msgSend(v103, "count"))
            {
              v109 = objc_msgSend(v74, "didJustSnapInX");
              v110 = objc_msgSend(v74, "didJustSnapInY");
              v111 = v110;
              if (v109)
                v112 = v72;
              else
                v112 = 1.79769313e308;
              v245 = 0u;
              v246 = 0u;
              if (v110)
                v113 = v73;
              else
                v113 = 1.79769313e308;
              v243 = 0uLL;
              v244 = 0uLL;
              v114 = v103;
              v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v243, v284, 16);
              v213 = v15;
              if (v115)
              {
                v116 = *(_QWORD *)v244;
                do
                {
                  for (n = 0; n != v115; n = (char *)n + 1)
                  {
                    if (*(_QWORD *)v244 != v116)
                      objc_enumerationMutation(v114);
                    objc_msgSend(*(id *)(*((_QWORD *)&v243 + 1) + 8 * (_QWORD)n), "CGRectValue");
                    objc_msgSend(v74, "snapRectToGuides:");
                    v119 = v118;
                    v121 = v120;
                    v122 = objc_msgSend(v74, "didJustSnapInX");
                    v123 = objc_msgSend(v74, "didJustSnapInY");
                    v124 = v122 & (v119 < v112);
                    if (v124)
                      v112 = v119;
                    LOBYTE(v109) = v124 | v109;
                    v111 |= v123 & (v121 < v113);
                    if ((v123 & (v121 < v113)) != 0)
                      v113 = v121;
                  }
                  v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v243, v284, 16);
                }
                while (v115);
              }

              v15 = v213;
              objc_msgSend(v74, "setDidJustSnapInX:", v109 & 1);
              if (v113 == 1.79769313e308)
                v73 = 0.0;
              else
                v73 = v113;
              if (v112 == 1.79769313e308)
                v72 = 0.0;
              else
                v72 = v112;
              objc_msgSend(v74, "setDidJustSnapInY:", v111 & 1);
            }
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "canvasBackground"));
            v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "alignmentProvider"));
            v127 = objc_msgSend(v209, "isCanvasBackgroundAlignmentSnappingEnabled");
            if (v126)
              v128 = v127;
            else
              v128 = 0;
            if (!(v15 | v128))
              v72 = 0.0;
            if (!(v216 | v128))
              v73 = 0.0;

          }
        }
        if (!v222->mShouldConstrain)
          goto LABEL_163;
        v129 = __sincos_stret(v222->mConstraintAngle);
        sinval = v129.__sinval;
        if (v129.__cosval == 0.0 || fabs(v129.__cosval) < 0.00999999978)
        {
          v133 = 0;
          v134 = 0;
          v132 = v73 != 0.0;
          v72 = 0.0;
        }
        else
        {
          if (fabs(v129.__sinval) < 0.00999999978 || v129.__sinval == 0.0)
            v73 = 0.0;
          v132 = v73 != 0.0;
          v133 = v72 != 0.0;
          if (v72 == 0.0 || v73 == 0.0)
          {
            v134 = v72 != 0.0;
          }
          else
          {
            v134 = fabs(v72) < fabs(v73);
            v132 = 1;
            v133 = 1;
          }
        }
        v72 = sub_1000603D0(v72, v73, v51);
        v73 = v135;
        v31 = sub_1000603B8(v31, v30, v51);
        v30 = v136;
        -[CRLCanvasRep i_dragOffset](v222->mRep, "i_dragOffset");
        v217 = v137;
        v139 = sub_1000603D0(v137, v138, v72);
        v141 = v140;
        v142 = sub_100061070(v139, v140);
        v143 = v142;
        if (!v133 && !v132)
        {
LABEL_161:
          if (v143 > 0.0)
          {
            v158 = sub_1000603C4(v129.__cosval, sinval, v139, v141);
            v159 = sub_1000603DC(v129.__cosval, sinval, v158);
            v72 = sub_1000603B8(v159, v160, v217);
            v73 = v161;
          }
LABEL_163:
          -[NSMapTable removeAllObjects](v222->mMapRepsToSnapOffsets, "removeAllObjects");
          if (v222->mIsEnqueueingCommandsInRealTime)
            objc_msgSend(v207, "openGroup");
          v241 = 0u;
          v242 = 0u;
          v239 = 0u;
          v240 = 0u;
          v162 = v28;
          v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v239, v283, 16);
          if (v163)
          {
            v164 = *(_QWORD *)v240;
            do
            {
              for (ii = 0; ii != v163; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v240 != v164)
                  objc_enumerationMutation(v162);
                v166 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * (_QWORD)ii);
                v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "layout"));
                objc_msgSend(v167, "dragByUnscaled:", v72, v73);
                mMapRepsToSnapOffsets = v222->mMapRepsToSnapOffsets;
                v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v72, v73));
                -[NSMapTable setObject:forKey:](mMapRepsToSnapOffsets, "setObject:forKey:", v169, v166);

              }
              v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v239, v283, 16);
            }
            while (v163);
          }

          if (v222->mIsEnqueueingCommandsInRealTime)
            objc_msgSend(v207, "closeGroup");
          v289.origin.x = v31;
          v289.origin.y = v30;
          v289.size.width = width;
          v289.size.height = rect;
          v290 = CGRectOffset(v289, v72, v73);
          v171 = v215;
          v170 = CGPointZero.x;
          if ((v220 & 1) != 0)
          {
            v172 = v290.origin.x;
            v173 = v290.origin.y;
            v174 = v290.size.width;
            height = v290.size.height;
            v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "guideController"));
            objc_msgSend(v176, "showGuidesAlignedWithRect:shouldRenderX:shouldRenderY:", v225, v226, v172, v173, v174, height);
            objc_msgSend(v176, "setDoNotRemoveExistingGuidesWhenDisplaying:", 1);
            recta = v176;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            obja = v162;
            v214 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v235, v282, 16);
            if (v214)
            {
              v212 = *(_QWORD *)v236;
              do
              {
                for (jj = 0; jj != v214; jj = (char *)jj + 1)
                {
                  if (*(_QWORD *)v236 != v212)
                    objc_enumerationMutation(obja);
                  v177 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * (_QWORD)jj);
                  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "additionalRectsForSnappingWithOffset:", v170, v171));
                  v233 = 0u;
                  v234 = 0u;
                  v231 = 0u;
                  v232 = 0u;
                  v179 = v178;
                  v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v231, v281, 16);
                  if (v180)
                  {
                    v181 = *(_QWORD *)v232;
                    do
                    {
                      for (kk = 0; kk != v180; kk = (char *)kk + 1)
                      {
                        if (*(_QWORD *)v232 != v181)
                          objc_enumerationMutation(v179);
                        objc_msgSend(*(id *)(*((_QWORD *)&v231 + 1) + 8 * (_QWORD)kk), "CGRectValue");
                        v187 = v183;
                        v188 = v184;
                        v189 = v185;
                        v190 = v186;
                        if (v185 <= 0.0 || v186 <= 0.0)
                        {
                          v191 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                          if (qword_10147E370 != -1)
                            dispatch_once(&qword_10147E370, &stru_101261680);
                          v192 = off_1013D9070;
                          if (os_log_type_enabled((os_log_t)v192, OS_LOG_TYPE_ERROR))
                          {
                            v292.origin.x = v187;
                            v292.origin.y = v188;
                            v292.size.width = v189;
                            v292.size.height = v190;
                            v198 = NSStringFromCGRect(v292);
                            v199 = (id)objc_claimAutoreleasedReturnValue(v198);
                            *(_DWORD *)buf = 67110402;
                            v270 = v191;
                            v271 = 2082;
                            v272 = "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]";
                            v273 = 2082;
                            v274 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m";
                            v275 = 1024;
                            v276 = 945;
                            v277 = 2112;
                            v278 = v199;
                            v279 = 2112;
                            v280 = v177;
                            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v192, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid additional snapping rect %@ from rep %@! Ignoring.", buf, 0x36u);

                          }
                          if (qword_10147E370 != -1)
                            dispatch_once(&qword_10147E370, &stru_1012616A0);
                          v193 = off_1013D9070;
                          if (os_log_type_enabled((os_log_t)v193, OS_LOG_TYPE_ERROR))
                          {
                            v200 = (char *)(id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                            *(_DWORD *)buf = 67109378;
                            v270 = v191;
                            v271 = 2114;
                            v272 = v200;
                            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v193, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                          }
                          v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]"));
                          v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
                          v291.origin.x = v187;
                          v291.origin.y = v188;
                          v291.size.width = v189;
                          v291.size.height = v190;
                          v196 = NSStringFromCGRect(v291);
                          v197 = (void *)objc_claimAutoreleasedReturnValue(v196);
                          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v194, v195, 945, 0, "Invalid additional snapping rect %@ from rep %@! Ignoring.", v197, v177);

                        }
                        else
                        {
                          objc_msgSend(recta, "showGuidesAlignedWithRect:shouldRenderX:shouldRenderY:", v225, v226, v183, v184, v185, v186);
                        }
                      }
                      v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v231, v281, 16);
                    }
                    while (v180);
                  }

                  v171 = v215;
                  v170 = CGPointZero.x;
                }
                v214 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v235, v282, 16);
              }
              while (v214);
            }

            v201 = recta;
            objc_msgSend(recta, "setDoNotRemoveExistingGuidesWhenDisplaying:", 0);
          }
          else
          {
            v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "guideController", v290.origin.x, v290.origin.y, v290.size.width, v290.size.height));
            objc_msgSend(v201, "hideAlignmentGuides");
          }

          if (v222->mShouldConstrain)
          {
            if (!v222->mConstraintGuidesShowing)
              -[CRLCanvasRepDragTracker p_showGuideRenderable](v222, "p_showGuideRenderable");
          }
          else if (v222->mConstraintGuidesShowing)
          {
            -[CRLCanvasRepDragTracker p_hideGuideRenderable](v222, "p_hideGuideRenderable");
          }
          v229 = 0u;
          v230 = 0u;
          v227 = 0u;
          v228 = 0u;
          v202 = v222->mParentLayoutsForInvalidatingForAncestorCollabCursors;
          v203 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v202, "countByEnumeratingWithState:objects:count:", &v227, v268, 16);
          if (v203)
          {
            v204 = *(_QWORD *)v228;
            do
            {
              for (mm = 0; mm != v203; mm = (char *)mm + 1)
              {
                if (*(_QWORD *)v228 != v204)
                  objc_enumerationMutation(v202);
                objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * (_QWORD)mm), "invalidateFrame");
              }
              v203 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v202, "countByEnumeratingWithState:objects:count:", &v227, v268, 16);
            }
            while (v203);
          }

          -[CRLCanvasRepDragTracker p_updateHUDAtPoint:](v222, "p_updateHUDAtPoint:", v222->mLogicalDragPoint.x, v222->mLogicalDragPoint.y);
          _Block_object_dispose(&v252, 8);

          self = v222;
          goto LABEL_216;
        }
        if (v134)
        {
          if (v129.__cosval != 0.0)
          {
            v144 = v139 / v129.__cosval;
LABEL_140:
            v145 = fabs(v144);
LABEL_160:
            v156 = v143;
            v139 = sub_1000603DC(v139, v141, v145 / v143);
            v141 = v157;
            v143 = v156;
            sinval = v129.__sinval;
            goto LABEL_161;
          }
          obj = v142;
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101261600);
          v146 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v146, OS_LOG_TYPE_ERROR))
            sub_100E39A7C();

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101261620);
          v147 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v147, OS_LOG_TYPE_ERROR))
          {
            v148 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DFC2A8(v148);
          }

          v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]"));
          v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v149, v150, 791, 0, "prioritizing X offset with a unit direction that doesn't have an X value!");

        }
        else
        {
          if (v129.__sinval != 0.0)
          {
            v144 = v141 / v129.__sinval;
            goto LABEL_140;
          }
          obj = v142;
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101261640);
          v151 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v151, OS_LOG_TYPE_ERROR))
            sub_100E39AFC();

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101261660);
          v152 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v152, OS_LOG_TYPE_ERROR))
          {
            v153 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DFC2A8(v153);
          }

          v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]"));
          v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v154, v155, 799, 0, "prioritizing Y offset with a unit direction that doesn't have an Y value!");

        }
        v143 = obj;
        v145 = obj;
        goto LABEL_160;
      }
    }
    else
    {
      v220 = -[CRLCanvasRepDragTracker shouldShowGuides](self, "shouldShowGuides");
      v225 = -[CRLCanvasRepDragTracker shouldShowGuides](self, "shouldShowGuides");
      v15 = 0;
    }
    v226 = -[CRLCanvasRepDragTracker shouldShowGuides](self, "shouldShowGuides");
    v16 = 0;
    goto LABEL_17;
  }
LABEL_217:

}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return self->mDidBeginDrag
      && !self->mPreventOpeningCommandGroupWhenCommittingChangesForReps
      && !self->mDidDuplicateWhenDragBegan
      && !self->mIsEnqueueingCommandsInRealTime;
}

- (void)commitChangesForReps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  CRLCanvasCommandSelectionBehavior *v18;
  void *v19;
  CRLCanvasCommandSelectionBehavior *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v6, "openGroup");
  if (self->mDidDuplicateWhenDragBegan)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Duplicate");
  }
  else
  {
    if (objc_msgSend(v4, "count") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionStringForDrag"));
      goto LABEL_7;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Move");
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, 0, CFSTR("UndoStrings")));
LABEL_7:
  v11 = (void *)v10;
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "isBeingDragged", (_QWORD)v21))
          objc_msgSend(v17, "dynamicDragDidEnd");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  objc_msgSend(v6, "closeGroup");
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    v18 = [CRLCanvasCommandSelectionBehavior alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
    v20 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v18, "initWithCanvasEditor:type:", v19, 2);

    objc_msgSend(v6, "closeGroupWithSelectionBehavior:", v20);
  }

}

- (id)repsForGuidesWhenManipulatingReps:(id)a3
{
  return objc_msgSend(a3, "mutableCopy");
}

- (BOOL)supportsAlignmentGuides
{
  if (-[CRLCanvasRepDragTracker p_delegateIsHandlingDrag](self, "p_delegateIsHandlingDrag"))
    return 0;
  else
    return !-[CRLCanvasRepDragTracker isArrowkeyDrivenTracking](self, "isArrowkeyDrivenTracking");
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (void)didChangeCurrentlyTransformingReps
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSMutableSet *mParentLayoutsForInvalidatingForAncestorCollabCursors;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  NSMutableSet *v50;
  id obj;
  __int128 v52;
  __int128 v53;
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
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  if ((byte_101415AB8 & 1) != 0)
    return;
  byte_101415AB8 = 1;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "dynamicOperationController"));
  v4 = objc_alloc_init((Class)NSMutableSet);
  v47 = objc_alloc_init((Class)NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentlyTransformingReps"));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        if (-[CRLCanvasRepDragTracker isDragInsertDrivenTracking](self, "isDragInsertDrivenTracking")
          || (objc_msgSend(v10, "isSelected") & 1) != 0)
        {
          if (objc_msgSend(v10, "isSelected"))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "additionalRepsForDragging"));
            objc_msgSend(v4, "unionSet:", v11);

          }
        }
        else
        {
          objc_msgSend(v47, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v7);
  }
  objc_msgSend(v47, "minusSet:", v4);
  objc_msgSend(v4, "minusSet:", v5);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "startTransformingReps:", v4);
  if (objc_msgSend(v47, "count", v4))
    objc_msgSend(v3, "stopTransformingReps:", v47);
  v45 = v3;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layout"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectedLayouts"));

        if (v18)
          -[NSMutableSet unionSet:](self->mConnectedLineLayouts, "unionSet:", v18);
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parentRep"));
        if (v19)
        {
          v20 = (void *)v19;
          while (!objc_msgSend(v20, "shouldShowCollaboratorCursorHighlight"))
          {
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parentRep"));

            v20 = (void *)v21;
            if (!v21)
              goto LABEL_31;
          }
          mParentLayoutsForInvalidatingForAncestorCollabCursors = self->mParentLayoutsForInvalidatingForAncestorCollabCursors;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parentRep"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layout"));
          -[NSMutableSet addObject:](mParentLayoutsForInvalidatingForAncestorCollabCursors, "addObject:", v24);

        }
LABEL_31:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v13);
  }
  v25 = obj;

  v46 = objc_alloc_init((Class)NSMutableSet);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v50 = self->mConnectedLineLayouts;
  v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  v27 = v48;
  if (!v26)
    goto LABEL_49;
  v28 = v26;
  v29 = *(_QWORD *)v53;
  do
  {
    v30 = 0;
    v49 = v28;
    do
    {
      if (*(_QWORD *)v53 != v29)
        objc_enumerationMutation(v50);
      v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v30);
      objc_msgSend(v31, "checkConnections");
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "connectedTo"));
      if (v32)
      {
        v33 = (void *)v32;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "connectedFrom"));

        if (v34)
        {
          v35 = v29;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "connectedTo"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "info"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForInfo:", v37));
          if ((objc_msgSend(v25, "containsObject:", v38) & 1) != 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "connectedFrom"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "info"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForInfo:", v40));
            v42 = objc_msgSend(obj, "containsObject:", v41);

            v27 = v48;
            v25 = obj;

            v29 = v35;
            v28 = v49;
            if (!v42)
              goto LABEL_47;
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "info"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "repForInfo:", v43));

            if (v36)
              objc_msgSend(v46, "addObject:", v36);
            v27 = v48;
          }
          else
          {

            v29 = v35;
            v28 = v49;
          }

        }
      }
LABEL_47:
      v30 = (char *)v30 + 1;
    }
    while (v28 != v30);
    v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  }
  while (v28);
LABEL_49:

  if (objc_msgSend(v46, "count"))
    objc_msgSend(v45, "startTransformingReps:", v46);
  byte_101415AB8 = 0;

}

- (BOOL)traceIfDesiredForBeginOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E628 != -1)
    dispatch_once(&qword_10147E628, &stru_1012616C0);
  v2 = off_1013DC748;
  if (os_log_type_enabled((os_log_t)off_1013DC748, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin drag operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allTransformedReps"));
  -[CRLCanvasRep i_dragOffset](self->mRep, "i_dragOffset");
  v7 = v6;
  v9 = v8;
  if (qword_10147E628 != -1)
    dispatch_once(&qword_10147E628, &stru_1012616E0);
  v10 = off_1013DC748;
  if (os_log_type_enabled((os_log_t)off_1013DC748, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v13 = 134218496;
    v14 = objc_msgSend(v5, "count");
    v15 = 2048;
    v16 = v7;
    v17 = 2048;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "end drag operation for %zi reps. Offset (%f, %f)", (uint8_t *)&v13, 0x20u);

  }
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;
  CRLCanvasShapeRenderable *mGuideRenderable;

  if (self->mConstraintGuidesShowing)
  {
    mGuideRenderable = self->mGuideRenderable;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mGuideRenderable, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (BOOL)allowsDelegateToDisplayUIForDragOperation
{
  return 1;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (void)p_updateHUDFromTimer
{
  -[CRLCanvasRepDragTracker p_updateHUDAtPoint:](self, "p_updateHUDAtPoint:", self->mLogicalDragPoint.x, self->mLogicalDragPoint.y);
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double MinY;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  unsigned int v18;
  double MaxX;
  void *v20;
  void *v21;
  void *v22;
  double mConstraintAngle;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  CRLCanvasHUDController *mSecondHUDController;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  CGRect v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  v38 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  if (self->mShowDragHUD)
  {
    if (-[CRLCanvasRep shouldShowDragHUD](self->mRep, "shouldShowDragHUD"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dynamicOperationController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentlyTransformingReps"));
      v8 = objc_msgSend(v7, "count");

      if (v8 == (id)1)
      {
        -[CRLCanvasRepDragTracker p_selectedInfosRect](self, "p_selectedInfosRect");
        v10 = v9;
        MinY = v11;
        v14 = v13;
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "canvas"));
        v18 = objc_msgSend(v17, "isAnchoredAtRight");

        if (v18)
        {
          v39.origin.x = v10;
          v39.origin.y = MinY;
          v39.size.width = v14;
          v39.size.height = v16;
          MaxX = CGRectGetMaxX(v39);
          v40.origin.x = v10;
          v40.origin.y = MinY;
          v40.size.width = v14;
          v40.size.height = v16;
          MinY = CGRectGetMinY(v40);
          v10 = -MaxX;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "unitStringForPoint:", v10, MinY));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
        objc_msgSend(v21, "setLabelText:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "canvasView"));
        objc_msgSend(v21, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:", self, v22, x, y, 75.0);

        self->mHaveShownHUD = 1;
        goto LABEL_9;
      }
    }
  }
  if (self->mHaveShownHUD)
  {
    self->mHaveShownHUD = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    objc_msgSend(v20, "hideHUDForKey:", self);
LABEL_9:

  }
  if (self->mShouldConstrain
    && !-[CRLCanvasRepDragTracker shouldSuppressConstrainingHUD](self, "shouldSuppressConstrainingHUD"))
  {
    mConstraintAngle = self->mConstraintAngle;
    if (fabs(mConstraintAngle) >= 0.1
      && fabs(mConstraintAngle + -6.28318531) >= 0.1
      && fabs(mConstraintAngle + -3.14159265) >= 0.1)
    {
      if (fabs(mConstraintAngle + -1.57079633) >= 0.1 && fabs(mConstraintAngle + -4.71238898) >= 0.1)
      {
        if (self->mSnapLevel == 0.0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v25 = v24;
          v26 = CFSTR("Diagonal");
          goto LABEL_19;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v28;
        v29 = CFSTR("Diagonal %i pt");
      }
      else
      {
        if (self->mSnapLevel == 0.0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v25 = v24;
          v26 = CFSTR("Vertical");
          goto LABEL_19;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v28;
        v29 = CFSTR("Vertical %i pt");
      }
    }
    else
    {
      if (self->mSnapLevel == 0.0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v24;
        v26 = CFSTR("Horizontal");
LABEL_19:
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, 0, 0));
LABEL_22:

        -[CRLCanvasHUDController setLabelText:](self->mSecondHUDController, "setLabelText:", v27);
        mSecondHUDController = self->mSecondHUDController;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](mSecondHUDController, "view"));
        objc_msgSend(v32, "frame");
        v34 = sub_1000603D0(self->mConstrainingPoint.x, self->mConstrainingPoint.y, (v33 + v33) / 5.0);
        v36 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "canvasView"));
        -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:](mSecondHUDController, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:", self, v37, v34, v36, 75.0);

        self->mHaveShownSecondHUD = 1;
        goto LABEL_23;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v28;
      v29 = CFSTR("Horizontal %i pt");
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v29, 0, 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, (int)self->mSnapLevel));

    goto LABEL_22;
  }
  if (self->mHaveShownSecondHUD)
  {
    self->mHaveShownSecondHUD = 0;
    -[CRLCanvasHUDController hideHUDForKey:](self->mSecondHUDController, "hideHUDForKey:", self);
  }
LABEL_23:

}

- (void)p_hideHUD
{
  void *v3;

  if (self->mHaveShownHUD)
  {
    self->mHaveShownHUD = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    objc_msgSend(v3, "hideHUDForKey:", self);

  }
  if (self->mHaveShownSecondHUD)
  {
    self->mHaveShownSecondHUD = 0;
    -[CRLCanvasHUDController hideHUDForKey:](self->mSecondHUDController, "hideHUDForKey:", self);
  }
}

- (void)p_updateGuides
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideController"));
  -[CRLCanvasRepDragTracker p_selectedInfosRect](self, "p_selectedInfosRect");
  objc_msgSend(v3, "showGuidesAlignedWithRect:shouldRenderX:shouldRenderY:", 1, 1);

}

- (CGRect)p_selectedInfosRect
{
  void *v2;
  double y;
  double x;
  double height;
  double width;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  void *v14;
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
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dynamicOperationController", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentlyTransformingReps"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v12 = CGPointZero.y;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "shouldShowSizesInRulers"))
        {
          objc_msgSend(v14, "snapRectForDynamicDragWithOffset:", CGPointZero.x, v12);
          x = sub_100060C2C(x, y, width, height, v15, v16, v17, v18);
          y = v19;
          width = v20;
          height = v21;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)p_hideGuideRenderable
{
  double v2;

  LODWORD(v2) = 0;
  -[CRLCanvasRenderable setOpacity:](self->mGuideRenderable, "setOpacity:", v2);
  self->mConstraintGuidesShowing = 0;
}

- (BOOL)p_delegateIsHandlingDrag
{
  return 0;
}

- (id)p_infosFromReps:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "info", (_QWORD)v12));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)p_repsForInfos:(id)a3 fromReps:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info", (_QWORD)v17));
        v15 = objc_msgSend(v5, "containsObject:", v14);

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)shouldSuppressConstrainingHUD
{
  return self->mShouldSuppressConstrainingHUD;
}

- (void)setShouldSuppressConstrainingHUD:(BOOL)a3
{
  self->mShouldSuppressConstrainingHUD = a3;
}

- (BOOL)didBeginDrag
{
  return self->mDidBeginDrag;
}

- (BOOL)isDragInsertDrivenTracking
{
  return self->mIsDragInsertDrivenTracking;
}

- (void)setIsDragInsertDrivenTracking:(BOOL)a3
{
  self->mIsDragInsertDrivenTracking = a3;
}

- (BOOL)showDragHUD
{
  return self->mShowDragHUD;
}

- (void)setShowDragHUD:(BOOL)a3
{
  self->mShowDragHUD = a3;
}

- (BOOL)shouldShowGuides
{
  return self->mShouldShowGuides;
}

- (BOOL)shouldSnapToGuides
{
  return self->mShouldSnapToGuides;
}

- (void)setShouldSnapToGuides:(BOOL)a3
{
  self->mShouldSnapToGuides = a3;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mIsInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mIsInspectorDrivenTracking = a3;
}

- (CRLCanvasRep)rep
{
  return self->mRep;
}

- (void)setRep:(id)a3
{
  objc_storeStrong((id *)&self->mRep, a3);
}

- (BOOL)isArrowkeyDrivenTracking
{
  return self->mIsArrowkeyDrivenTracking;
}

- (void)setIsArrowkeyDrivenTracking:(BOOL)a3
{
  self->mIsArrowkeyDrivenTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImpactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->mParentLayoutsForInvalidatingForAncestorCollabCursors, 0);
  objc_storeStrong((id *)&self->mConnectedLineLayouts, 0);
  objc_storeStrong((id *)&self->mGuideRenderable, 0);
  objc_storeStrong((id *)&self->mMapRepsToSnapOffsets, 0);
  objc_storeStrong((id *)&self->mAutoscroll, 0);
  objc_storeStrong((id *)&self->mSecondHUDController, 0);
  objc_storeStrong((id *)&self->mRep, 0);
}

@end
