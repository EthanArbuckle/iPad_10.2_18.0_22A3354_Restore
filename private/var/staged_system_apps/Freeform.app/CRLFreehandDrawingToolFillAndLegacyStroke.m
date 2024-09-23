@implementation CRLFreehandDrawingToolFillAndLegacyStroke

- (CRLFreehandDrawingToolFillAndLegacyStroke)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 insertionToolType:(unint64_t)a5 opacity:(double)a6 unscaledWidth:(double)a7
{
  id v12;
  CRLFreehandDrawingToolFillAndLegacyStroke *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  CRLBezierPath *fullCommittedPath;
  uint64_t v24;
  CRLBezierPath *uncommittedPath;
  PKShapeDrawingTimerHelper *v26;
  PKShapeDrawingTimerHelper *shapeDrawingTimerHelper;
  objc_super v29;

  v12 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  v13 = -[CRLFreehandDrawingTool initWithInteractiveCanvasController:](&v29, "initWithInteractiveCanvasController:", a3);
  if (v13)
  {
    if (a5 >= 8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241068);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E06DF0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241088);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:insertionToolType:opacity:unscaledWidth:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
      v17 = "Path insertion tool only knows how to be a monoline, pen, pencil, crayon, watercolor, fountainPen, marker, or fill tool.";
      v18 = v15;
      v19 = v16;
      v20 = 141;
    }
    else
    {
      if (a5 != 7 || a7 == 0.0)
        goto LABEL_24;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012410A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E06D70();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012410C8);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:insertionToolType:opacity:unscaledWidth:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
      v17 = "Fill tool can't have a width.";
      v18 = v15;
      v19 = v16;
      v20 = 142;
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, v20, 0, v17);

LABEL_24:
    objc_storeWeak((id *)&v13->_pencilKitCanvasViewController, v12);
    v13->_toolType = a5;
    v13->_opacity = a6;
    v13->_unscaledWidth = a7;
    v13->_initialUnscaledPoint = (CGPoint)xmmword_100EEC438;
    v13->_currentUnscaledPoint = (CGPoint)xmmword_100EEC438;
    v13->_initialActionTime = 0.0;
    v13->_currentActionTime = 0.0;
    v22 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    fullCommittedPath = v13->_fullCommittedPath;
    v13->_fullCommittedPath = (CRLBezierPath *)v22;

    v24 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    uncommittedPath = v13->_uncommittedPath;
    v13->_uncommittedPath = (CRLBezierPath *)v24;

    v26 = (PKShapeDrawingTimerHelper *)objc_msgSend(objc_alloc((Class)PKShapeDrawingTimerHelper), "initWithDelegate:", v13);
    shapeDrawingTimerHelper = v13->_shapeDrawingTimerHelper;
    v13->_shapeDrawingTimerHelper = v26;

  }
  return v13;
}

- (BOOL)shouldCommandsEnqueueInRealTime
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  self->_isEnqueueingCommandsInRealTime = objc_msgSend(v3, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime");

  return self->_isEnqueueingCommandsInRealTime;
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  void *v15;
  CRLFreehandDrawingPathCreator *v16;
  CRLFreehandDrawingPathCreator *pathCreator;
  CRLFreehandDrawingPathCreator *v18;
  double v19;
  CRLFreehandDrawingPathCreator *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  CRLFreehandDrawingPathCreator *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  PKShapeDrawingTimerHelper *shapeDrawingTimerHelper;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  CRLFreehandDrawingPathCreator *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  _OWORD v75[8];
  _OWORD v76[8];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85[8];
  objc_super v86;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  -[CRLFreehandDrawingToolAbstractPathInsertion performActionWithInputPoint:isInitialPoint:isFinalPoint:](&v86, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v8, v6, v5);
  objc_msgSend(v8, "unscaledPoint");
  self->_currentUnscaledPoint.x = v9;
  self->_currentUnscaledPoint.y = v10;
  objc_msgSend(v8, "time");
  self->_currentActionTime = v11;
  if (v6)
  {
    objc_msgSend(v8, "unscaledPoint");
    self->_initialUnscaledPoint.x = v12;
    self->_initialUnscaledPoint.y = v13;
    objc_msgSend(v8, "time");
    self->_initialActionTime = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v16 = objc_alloc_init(CRLFreehandDrawingPathCreator);
    pathCreator = self->_pathCreator;
    self->_pathCreator = v16;

    v18 = self->_pathCreator;
    objc_msgSend(v15, "viewScale");
    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](v18, "beginDrawingWithViewScale:inputType:", objc_msgSend(v8, "inputType"), v19);
    v20 = self->_pathCreator;
    objc_msgSend(v8, "unscaledPoint");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v8, "time");
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v20, "drawToPoint:atTime:predicted:", objc_msgSend(v8, "isPredicted"), v22, v24, v25);
    -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathsFromPathCreatorWithCommitBehavior:](self, "p_updatePathsFromPathCreatorWithCommitBehavior:", 0);
    if (-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentColorWithOpacity](self, "p_currentColorWithOpacity"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v26));

      -[CRLFreehandDrawingPathCreator setMinimumLengthForFinalCreatedPath:](self->_pathCreator, "setMinimumLengthForFinalCreatedPath:", 0.100000001);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      objc_msgSend(v28, "addDecorator:", self);

      if ((objc_msgSend(v8, "isPredicted") & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasView"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "unscaledCoordinateSpace"));
        objc_msgSend(v8, "unscaledPoint");
        v32 = v31;
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasView"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "window"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "coordinateSpace"));
        objc_msgSend(v30, "convertPoint:toCoordinateSpace:", v37, v32, v34);
        v39 = v38;
        v41 = v40;

        -[PKShapeDrawingTimerHelper beginStrokeAtPoint:](self->_shapeDrawingTimerHelper, "beginStrokeAtPoint:", v39, v41);
      }
      v42 = 0;
    }
    else
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentStroke](self, "p_currentStroke"));
      v42 = objc_msgSend(v65, "copy");

      objc_opt_class(CRLBrushStroke, v66);
      if ((objc_opt_isKindOfClass(v42, v67) & 1) != 0)
      {
        objc_msgSend(v42, "width");
        v69 = self->_pathCreator;
      }
      else
      {
        v69 = self->_pathCreator;
        v68 = 0.100000001;
      }
      -[CRLFreehandDrawingPathCreator setMinimumLengthForFinalCreatedPath:](v69, "setMinimumLengthForFinalCreatedPath:", v68);
      v27 = 0;
    }
    -[CRLFreehandDrawingToolAbstractPathInsertion openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:stroke:fill:](self, "openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:stroke:fill:", self->_uncommittedPath, v42, v27);

    goto LABEL_29;
  }
  if ((objc_msgSend(v8, "wasAddedByTouchesEnded") & 1) == 0)
  {
    v43 = self->_pathCreator;
    objc_msgSend(v8, "unscaledPoint");
    v45 = v44;
    v47 = v46;
    objc_msgSend(v8, "time");
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v43, "drawToPoint:atTime:predicted:", objc_msgSend(v8, "isPredicted"), v45, v47, v48);
  }
  if (-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool")
    && (objc_msgSend(v8, "isPredicted") & 1) == 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "canvasView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "unscaledCoordinateSpace"));
    objc_msgSend(v8, "unscaledPoint");
    v53 = v52;
    v55 = v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "canvasView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "window"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "coordinateSpace"));
    objc_msgSend(v51, "convertPoint:toCoordinateSpace:", v59, v53, v55);
    v61 = v60;
    v63 = v62;

    shapeDrawingTimerHelper = self->_shapeDrawingTimerHelper;
    if (v8)
      objc_msgSend(v8, "PKInputPoint");
    else
      memset(v85, 0, sizeof(v85));
    -[PKShapeDrawingTimerHelper addStrokePoint:inputPoint:](shapeDrawingTimerHelper, "addStrokePoint:inputPoint:", v85, v61, v63);
    if (objc_msgSend(v8, "inputType") == (id)2)
    {
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "freehandDrawingToolkit"));
      v72 = (void *)v71;
      if (v8)
      {
        objc_msgSend(v8, "PKInputPoint");
        if (v72)
        {
LABEL_21:
          objc_msgSend(v72, "inputPointInPKCanvasViewFromUnscaledSpace:", v76);
LABEL_24:

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "freehandDrawingToolkit"));
          v75[4] = v81;
          v75[5] = v82;
          v75[6] = v83;
          v75[7] = v84;
          v75[0] = v77;
          v75[1] = v78;
          v75[2] = v79;
          v75[3] = v80;
          objc_msgSend(v74, "updatePencilShadowWithInputPoint:", v75);

          goto LABEL_25;
        }
      }
      else
      {
        memset(v76, 0, sizeof(v76));
        if (v71)
          goto LABEL_21;
      }
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      goto LABEL_24;
    }
  }
LABEL_25:
  if (v5)
  {
    -[CRLFreehandDrawingPathCreator endDrawing](self->_pathCreator, "endDrawing");
    -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathsFromPathCreatorWithCommitBehavior:](self, "p_updatePathsFromPathCreatorWithCommitBehavior:", 2);
  }
  -[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded](self, "p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded");
  if (-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v15, "invalidateLayersForDecorator:", self);
LABEL_29:

  }
}

- (void)doWorkBeforeCanvasLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  -[CRLFreehandDrawingTool doWorkBeforeCanvasLayout](&v3, "doWorkBeforeCanvasLayout");
  -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathForDashedOutlineFillRenderable](self, "p_updatePathForDashedOutlineFillRenderable");
  -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathForSnappedOutlineFillRenderable](self, "p_updatePathForSnappedOutlineFillRenderable");
  -[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDottedPathOpacityForCurrentSnapState](self, "p_updateDottedPathOpacityForCurrentSnapState");
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  CRLBezierPath *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _TtC8Freeform23CRLCommandSetPathSource *v24;
  void *v25;
  void *v26;
  void *v27;
  CRLCanvasInfoGeometry *v28;
  void *v29;
  CRLCanvasInfoGeometry *v30;
  void *v31;
  void *v32;
  CRLCanvasInfoGeometry *v33;
  void *v34;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v35;
  void *v36;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v43;
  void *v44;
  void *v45;
  void *v46;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v47;
  CRLFreehandDrawingSnapToShapeHelper *v48;
  void *v49;
  CRLFreehandDrawingSnapToShapeHelper *v50;
  uint64_t v51;
  objc_class *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  CRLFreehandDrawingPathCreator *pathCreator;
  CRLBezierPath *v58;
  CRLBezierPath *fullCommittedPath;
  CRLBezierPath *subpathToCommit;
  CRLBezierPath *v61;
  CRLBezierPath *uncommittedPath;
  CRLCanvasShapeRenderable *dashedOutlineFillRenderable;
  CRLBezierPath *dynamicFillPath;
  uint64_t v65;
  void *v66;
  CRLCanvasShapeRenderable *snappedOutlineFillRenderable;
  void *v69;
  void *v70;
  _TtC8Freeform23CRLCommandSetPathSource *v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  unsigned int v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  objc_super v80;

  v80.receiver = self;
  v80.super_class = (Class)CRLFreehandDrawingToolFillAndLegacyStroke;
  v4 = -[CRLFreehandDrawingTool finalizeAndResetWithSuccess:](&v80, "finalizeAndResetWithSuccess:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
  if (objc_msgSend(v5, "i_currentlySuppressingLayerUpdates"))
    objc_msgSend(v5, "i_endSuppressingLayerUpdates");
  if (-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool"))
  {
    objc_msgSend(v5, "removeDecorator:", self);
    -[PKShapeDrawingTimerHelper teardown](self->_shapeDrawingTimerHelper, "teardown");
  }
  v9 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  v10 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  v11 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  if (!-[CRLBezierPath containsElementsOtherThanMoveAndClose](self->_fullCommittedPath, "containsElementsOtherThanMoveAndClose"))goto LABEL_16;
  v12 = self->_fullCommittedPath;
  v75 = -[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool");
  v76 = v4;
  if (!v75)
  {
    if ((v4 & 1) != 0)
      goto LABEL_12;

LABEL_16:
    -[CRLFreehandDrawingToolAbstractPathInsertion finalizeAndResetAbstractPathInsertionToolWithSuccess:](self, "finalizeAndResetAbstractPathInsertionToolWithSuccess:", 0);
    v12 = 0;
    LOBYTE(v38) = 0;
    goto LABEL_29;
  }
  if (self->_currentActionTime - self->_initialActionTime <= 0.25)
  {
    v13 = sub_10006108C(self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y, self->_currentUnscaledPoint.x, self->_currentUnscaledPoint.y);
    objc_msgSend(v5, "viewScale");
    if (v13 * v14 <= 10.0)
    {
      v43 = [_TtC8Freeform26CRLCommandDeleteBoardItems alloc];
      v44 = v8;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion initialFreehandDrawingItem](self, "initialFreehandDrawingItem"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v45));
      v47 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:](v43, "initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:", v46, 1);

      v8 = v44;
      v9 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
      objc_msgSend(v7, "enqueueCommand:", v47);
      if (v76)
        v38 = -[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:](self, "p_floodFillIfPossibleAtPoint:", self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y);
      else
        v38 = 0;

      -[CRLFreehandDrawingToolAbstractPathInsertion finalizeAndResetAbstractPathInsertionToolWithSuccess:](self, "finalizeAndResetAbstractPathInsertionToolWithSuccess:", v38);
      v12 = 0;
      goto LABEL_28;
    }
  }
  -[CRLBezierPath closePath](v12, "closePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v16 = v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "id"));
  objc_msgSend(v15, "enqueueAnimationForObjectUUID:animation:", v18, CFSTR("CRLFreehandDrawingToolkitAnimationNameOutlineFill"));

  v9 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  v10 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;

  v8 = v16;
  v11 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  if ((v76 & 1) != 0)
  {
LABEL_12:
    if (v12)
    {
      -[CRLBezierPath bounds](v12, "bounds");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v7, "openGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v12));
      v72 = v8;
      v24 = [_TtC8Freeform23CRLCommandSetPathSource alloc];
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
      v70 = v23;
      v71 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:](v24, "initWithShapeItem:pathSource:", v25, v23);

      objc_msgSend(v7, "enqueueCommand:", v71);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutsForInfo:", v26));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "anyObject"));

      v28 = [CRLCanvasInfoGeometry alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bezierPath"));
      objc_msgSend(v29, "bounds");
      v38 = -[CRLCanvasInfoGeometry initWithPosition:size:](v28, "initWithPosition:size:", v20, v22);

      v30 = [CRLCanvasInfoGeometry alloc];
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "parent"));
      v73 = v7;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "geometryInRoot"));
      v33 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v30, "initWithLayoutGeometry:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v38, "geometryRelativeToGeometry:", v33));

      v9 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
      v35 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
      v37 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:](v35, "initWithBoardItem:geometry:", v36, v34);

      v7 = v73;
      objc_msgSend(v73, "enqueueCommand:", v37);
      objc_msgSend(v73, "closeGroup");

      v11 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
      v8 = v72;

      LOBYTE(v38) = 1;
      -[CRLFreehandDrawingToolAbstractPathInsertion finalizeAndResetAbstractPathInsertionToolWithSuccess:](self, "finalizeAndResetAbstractPathInsertionToolWithSuccess:", 1);
      if ((v75 & 1) == 0)
        goto LABEL_29;
    }
    else
    {
      LOBYTE(v38) = 1;
      -[CRLFreehandDrawingToolAbstractPathInsertion finalizeAndResetAbstractPathInsertionToolWithSuccess:](self, "finalizeAndResetAbstractPathInsertionToolWithSuccess:", 1);
      if (!v75)
        goto LABEL_29;
    }
    goto LABEL_18;
  }

  -[CRLFreehandDrawingToolAbstractPathInsertion finalizeAndResetAbstractPathInsertionToolWithSuccess:](self, "finalizeAndResetAbstractPathInsertionToolWithSuccess:", 0);
  v12 = 0;
LABEL_18:
  v39 = *(Class *)((char *)&self->super.super.super.isa + v9[633]);
  if (v39)
  {
    v40 = objc_msgSend(v39, "copy");
    memset(&v79, 0, sizeof(v79));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentItem"));
    v42 = v41;
    v74 = v7;
    if (v41)
      objc_msgSend(v41, "transformInRoot");
    else
      memset(&v78, 0, sizeof(v78));
    CGAffineTransformInvert(&v79, &v78);

    v77 = v79;
    objc_msgSend(v40, "transformUsingAffineTransform:", &v77);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "visuallyDistinctSubregions"));
    v48 = [CRLFreehandDrawingSnapToShapeHelper alloc];
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v50 = -[CRLFreehandDrawingSnapToShapeHelper initWithInteractiveCanvasController:](v48, "initWithInteractiveCanvasController:", v49);

    objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v51);
    v53 = sub_1002223BC(v52, v8);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = v8;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper commandForSnappingShapeItem:toPathsInParentSpace:outCreatedAndModifiedShapes:](v50, "commandForSnappingShapeItem:toPathsInParentSpace:outCreatedAndModifiedShapes:", v54, v38, 0));

    v7 = v74;
    objc_msgSend(v74, "enqueueCommand:", v56);

    v8 = v55;
    LOBYTE(v38) = v76;
    v9 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
LABEL_28:
    v10 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
    v11 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
    goto LABEL_29;
  }
  LOBYTE(v38) = v76;
LABEL_29:
  self->_isEnqueueingCommandsInRealTime = 0;
  pathCreator = self->_pathCreator;
  self->_pathCreator = 0;

  self->_initialUnscaledPoint = (CGPoint)xmmword_100EEC438;
  self->_currentUnscaledPoint = (CGPoint)xmmword_100EEC438;
  *(Class *)((char *)&self->super.super.super.isa + v11[626]) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v10[627]) = 0;
  v58 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  fullCommittedPath = self->_fullCommittedPath;
  self->_fullCommittedPath = v58;

  subpathToCommit = self->_subpathToCommit;
  self->_subpathToCommit = 0;

  v61 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  uncommittedPath = self->_uncommittedPath;
  self->_uncommittedPath = v61;

  self->_fullCommittedPathEndsOutsideSpacerShape = 0;
  self->_uncommittedPathBeginsOutsideSpacerShape = 0;
  dashedOutlineFillRenderable = self->_dashedOutlineFillRenderable;
  self->_dashedOutlineFillRenderable = 0;

  dynamicFillPath = self->_dynamicFillPath;
  self->_dynamicFillPath = 0;

  v65 = v9[633];
  v66 = *(Class *)((char *)&self->super.super.super.isa + v65);
  *(Class *)((char *)&self->super.super.super.isa + v65) = 0;

  snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
  self->_snappedOutlineFillRenderable = 0;

  return v38;
}

- (unint64_t)type
{
  return self->_toolType;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_alloc((Class)PKInkingTool);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentColorWithOpacity](self, "p_currentColorWithOpacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UIColor"));
  v8 = objc_msgSend(v5, "initWithInkType:color:", PKInkTypePen, v7);

  objc_msgSend(v4, "setTool:", v8);
}

- (void)setUnscaledWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_toolType == 7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012410E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E06E70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241108);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke setUnscaledWidth:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 411, 0, "Fill tool can't have a width");

  }
  self->_unscaledWidth = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freehandDrawingToolkit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toolkitUIState"));
  objc_msgSend(v10, "setCurrentToolWidth:", a3);

}

- (void)setOpacity:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_opacity = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "freehandDrawingToolkit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolkitUIState"));
  objc_msgSend(v5, "setCurrentToolOpacity:", a3);

}

- (NSSet)drawingReps
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
  if (-[CRLFreehandDrawingTool isPerformingActions](self, "isPerformingActions") && v4)
  {
    *(_QWORD *)&v6 = objc_opt_class(CRLShapeRep, v5).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForInfo:", v4));
    v11 = sub_100221D0C(v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12 && objc_msgSend(v12, "i_isCurrentlyBeingFreehandDrawn"))
    {
      v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));

      v3 = (void *)v13;
    }

  }
  return (NSSet *)v3;
}

- (double)actualOpacityValueForOutlineFills
{
  double v3;
  double v4;

  -[CRLFreehandDrawingToolFillAndLegacyStroke opacity](self, "opacity");
  if (v3 <= 0.0)
    return 0.100000001;
  -[CRLFreehandDrawingToolFillAndLegacyStroke opacity](self, "opacity");
  return sub_1003C65EC(0.100000001 / v4, 0.100000001, 1.0);
}

- (NSArray)decoratorOverlayRenderables
{
  CRLCanvasShapeRenderable *v3;
  CRLCanvasShapeRenderable *dashedOutlineFillRenderable;
  CRLCanvasShapeRenderable *snappedOutlineFillRenderable;
  CRLCanvasShapeRenderable *v6;
  CRLCanvasShapeRenderable *v7;
  void *v8;
  _QWORD v10[2];

  if (-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool") && self->_pathCreator)
  {
    if (!self->_dashedOutlineFillRenderable)
    {
      v3 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_dashedOutlineFillRenderable](self, "p_dashedOutlineFillRenderable"));
      dashedOutlineFillRenderable = self->_dashedOutlineFillRenderable;
      self->_dashedOutlineFillRenderable = v3;

      -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathForDashedOutlineFillRenderable](self, "p_updatePathForDashedOutlineFillRenderable");
    }
    snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
    if (!snappedOutlineFillRenderable)
    {
      v6 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_snappedOutlineFillRenderable](self, "p_snappedOutlineFillRenderable"));
      v7 = self->_snappedOutlineFillRenderable;
      self->_snappedOutlineFillRenderable = v6;

      -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathForSnappedOutlineFillRenderable](self, "p_updatePathForSnappedOutlineFillRenderable");
      snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
    }
    v10[0] = self->_dashedOutlineFillRenderable;
    v10[1] = snappedOutlineFillRenderable;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  }
  else
  {
    v8 = &__NSArray0__struct;
  }
  return (NSArray *)v8;
}

- (void)shapeGestureDetectedOnShapeDrawingTimerHelper:(id)a3
{
  CRLBezierPath *v4;
  CRLBezierPath *dynamicSnappedFillPath;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_dynamicFillPath)
  {
    v4 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_bezierPathBySnappingOutlineFillBezierPathToShape:](self, "p_bezierPathBySnappingOutlineFillBezierPathToShape:"));
    dynamicSnappedFillPath = self->_dynamicSnappedFillPath;
    self->_dynamicSnappedFillPath = v4;

    v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v9, "invalidateLayersForDecorator:", self);

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241128);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E06EF0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241148);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke shapeGestureDetectedOnShapeDrawingTimerHelper:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 474, 0, "_dynamicFillPath should not be nil by the time -shapeGestureDetectedOnShapeDrawingTimerHelper: is called");

  }
}

- (void)shapeGestureCancelledOnShapeDrawingTimerHelper:(id)a3
{
  CRLBezierPath *dynamicSnappedFillPath;
  id v5;

  dynamicSnappedFillPath = self->_dynamicSnappedFillPath;
  self->_dynamicSnappedFillPath = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v5, "invalidateLayersForDecorator:", self);

}

- (BOOL)p_isFillTool
{
  return self->_toolType == 7;
}

- (id)p_dashedOutlineFillRenderable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForCurrentTool"));

  objc_msgSend(v6, "alphaComponent");
  if (v7 != 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241168);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E06F70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241188);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_dashedOutlineFillRenderable]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 500, 0, "Colors from the toolkit should not have reduced alpha.");

  }
  objc_msgSend(v3, "setLineWidth:", 2.0);
  objc_msgSend(v3, "setLineDashPattern:", &off_1012CB530);
  objc_msgSend(v3, "setLineJoin:", kCALineJoinRound);
  objc_msgSend(v3, "setLineCap:", kCALineCapRound);
  objc_msgSend(v3, "setFillColor:", 0);
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  return v3;
}

- (void)p_updatePathForDashedOutlineFillRenderable
{
  void *v3;
  double v4;
  CGFloat v5;
  id v6;
  id v7;
  CGAffineTransform v8;

  if (self->_dashedOutlineFillRenderable)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v3, "viewScale");
    v5 = v4;

    v6 = -[CRLBezierPath copy](self->_dynamicFillPath, "copy");
    CGAffineTransformMakeScale(&v8, v5, v5);
    objc_msgSend(v6, "transformUsingAffineTransform:", &v8);
    v7 = objc_retainAutorelease(v6);
    -[CRLCanvasShapeRenderable setPath:](self->_dashedOutlineFillRenderable, "setPath:", objc_msgSend(v7, "CGPath"));

  }
}

- (id)p_snappedOutlineFillRenderable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorForCurrentTool"));

  objc_msgSend(v6, "alphaComponent");
  if (v7 != 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012411A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E06FF0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012411C8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_snappedOutlineFillRenderable]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 526, 0, "Colors from the toolkit should not have reduced alpha.");

  }
  objc_msgSend(v3, "setLineWidth:", 2.0);
  objc_msgSend(v3, "setLineJoin:", kCALineJoinRound);
  objc_msgSend(v3, "setLineCap:", kCALineCapRound);
  objc_msgSend(v3, "setFillColor:", 0);
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  return v3;
}

- (void)p_updatePathForSnappedOutlineFillRenderable
{
  CRLCanvasShapeRenderable *snappedOutlineFillRenderable;
  void *v4;
  double v5;
  CGFloat v6;
  id v7;
  id v8;
  CGAffineTransform v9;

  snappedOutlineFillRenderable = self->_snappedOutlineFillRenderable;
  if (snappedOutlineFillRenderable)
  {
    if (self->_dynamicSnappedFillPath)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      objc_msgSend(v4, "viewScale");
      v6 = v5;

      v7 = -[CRLBezierPath copy](self->_dynamicSnappedFillPath, "copy");
      CGAffineTransformMakeScale(&v9, v6, v6);
      objc_msgSend(v7, "transformUsingAffineTransform:", &v9);
      v8 = objc_retainAutorelease(v7);
      -[CRLCanvasShapeRenderable setPath:](self->_snappedOutlineFillRenderable, "setPath:", objc_msgSend(v8, "CGPath"));

    }
    else
    {
      -[CRLCanvasShapeRenderable setPath:](snappedOutlineFillRenderable, "setPath:", 0);
    }
  }
}

- (void)p_updateDottedPathOpacityForCurrentSnapState
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForCurrentTool"));

  objc_msgSend(v5, "alphaComponent");
  if (v6 != 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012411E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E07070();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241208);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDottedPathOpacityForCurrentSnapState]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 553, 0, "Colors from the toolkit should not have reduced alpha.");

  }
  if (self->_dynamicSnappedFillPath)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.25));
    -[CRLCanvasShapeRenderable setStrokeColor:](self->_dashedOutlineFillRenderable, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

  }
  else
  {
    -[CRLCanvasShapeRenderable setStrokeColor:](self->_dashedOutlineFillRenderable, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
  }

}

- (id)p_bezierPathBySnappingOutlineFillBezierPathToShape:(id)a3
{
  id v4;
  CRLFreehandDrawingSnapToShapeHelper *v5;
  void *v6;
  CRLFreehandDrawingSnapToShapeHelper *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = [CRLFreehandDrawingSnapToShapeHelper alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v7 = -[CRLFreehandDrawingSnapToShapeHelper initWithInteractiveCanvasController:](v5, "initWithInteractiveCanvasController:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper bezierPathsBySnappingOutlineFillBezierPath:](v7, "bezierPathsBySnappingOutlineFillBezierPath:", v4));
  if (!v8 || !objc_msgSend(v8, "count"))
    goto LABEL_8;
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    if (objc_msgSend(v8, "count") == (id)1)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v9 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v8));
LABEL_7:
  v10 = (void *)v9;
LABEL_9:

  return v10;
}

- (void)p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  CRLBezierPath *v22;
  CRLBezierPath *dynamicFillPath;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _TtC8Freeform23CRLCommandSetPathSource *v35;
  CRLCanvasInfoGeometry *v36;
  CRLCanvasInfoGeometry *v37;
  void *v38;
  void *v39;
  void *v40;
  CRLCanvasInfoGeometry *v41;
  void *v42;
  void *v43;
  void *v44;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _TtC8Freeform23CRLCommandSetPathSource *v52;
  void *v53;
  void *v54;
  void *v55;

  -[CRLFreehandDrawingToolFillAndLegacyStroke p_updatePathsFromPathCreatorWithCommitBehavior:](self, "p_updatePathsFromPathCreatorWithCommitBehavior:", 1);
  v3 = -[CRLBezierPath copy](self->_fullCommittedPath, "copy");
  v4 = v3;
  v5 = !self->_fullCommittedPathEndsOutsideSpacerShape && !self->_uncommittedPathBeginsOutsideSpacerShape;
  objc_msgSend(v3, "appendBezierPath:skippingInitialMoveIfPossible:", self->_uncommittedPath, v5);
  if (objc_msgSend(v4, "containsElementsOtherThanMoveAndClose"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      *(_QWORD *)&v9 = objc_opt_class(CRLShapeRep, v8).n128_u64[0];
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repForInfo:", v6, v9));
      v13 = sub_1002223BC(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        if ((objc_msgSend(v7, "i_currentlySuppressingLayerUpdates") & 1) == 0
          && (!-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool")
           || self->_dashedOutlineFillRenderable))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderableForRep:", v14));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v14));
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentRep"));
            if (v17)
            {
              v18 = (void *)v17;
              do
              {
                objc_msgSend(v16, "addObject:", v18);
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parentRep"));

                v18 = (void *)v19;
              }
              while (v19);
            }
            objc_msgSend(v7, "i_beginSuppressingLayerUpdatesExceptForReps:", v16);

          }
        }
        v20 = v4;
        v21 = v20;
        if (-[CRLFreehandDrawingToolFillAndLegacyStroke p_isFillTool](self, "p_isFillTool"))
        {
          v21 = objc_msgSend(v20, "copy");

          objc_msgSend(v21, "closePath");
          v22 = (CRLBezierPath *)objc_msgSend(v21, "copy");
          dynamicFillPath = self->_dynamicFillPath;
          self->_dynamicFillPath = v22;

        }
        objc_msgSend(v20, "bounds");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v21));
        objc_msgSend(v14, "dynamicallySetBezierPathSource:atUnscaledOrigin:withCommittedPointRange:", v32, 0, -[CRLBezierPath elementCount](self->_fullCommittedPath, "elementCount"), v25, v27);
        if (self->_isEnqueueingCommandsInRealTime)
        {
          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));
          v54 = (void *)v33;
          v55 = v32;
          if (v33)
          {
            v34 = (void *)v33;
            v35 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v6, v32);
            -[CRLCommand setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:](v35, "setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:", 0);
            v52 = v35;
            objc_msgSend(v34, "enqueueCommand:", v35);
            v53 = v6;
            v36 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v25, v27, v29, v31);
            v37 = [CRLCanvasInfoGeometry alloc];
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "parent"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "geometryInRoot"));
            v41 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v37, "initWithLayoutGeometry:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry geometryRelativeToGeometry:](v36, "geometryRelativeToGeometry:", v41));

            v6 = v53;
            v43 = v54;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "geometry"));
            LOBYTE(v41) = objc_msgSend(v44, "isEqual:", v42);

            if ((v41 & 1) == 0)
            {
              v45 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v53, v42);
              -[CRLCommand setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:](v45, "setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:", 0);
              objc_msgSend(v54, "enqueueCommand:", v45);

            }
          }
          else
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012412A8);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100E07208();
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012412C8);
            v48 = v6;
            v49 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7468(v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded]"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 642, 0, "invalid nil value for '%{public}s'", "cc");

            v6 = v48;
            v43 = 0;
          }

          v32 = v55;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241268);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0717C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241288);
        v47 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v47);
        v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded]"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v32, 600, 0, "invalid nil value for '%{public}s'", "shapeRep");
      }

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241228);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E070F0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241248);
      v46 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v46);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_updateDrawingOnCanvasFromPathCreatorAndSendRealTimeCommandsIfNeeded]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v14, 593, 0, "invalid nil value for '%{public}s'", "shapeInfo");
    }

  }
}

+ (void)p_appendPath:(id)a3 fromStartPercent:(double)a4 toEndPercent:(double)a5 toPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;

  v13 = 0.0;
  v14 = 0.0;
  v9 = a6;
  v10 = a3;
  v11 = objc_msgSend(v10, "elementPercentage:forOverallPercentage:", &v14, a4);
  v12 = objc_msgSend(v10, "elementPercentage:forOverallPercentage:", &v13, a5);
  objc_msgSend(v9, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v10, v11, v12, 0, v14, v13);

}

+ (id)p_copyOfBezierPath:(id)a3 clippedToRect:(CGRect)a4 startsOutside:(BOOL *)a5 endsOutside:(BOOL *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void **v33;
  uint64_t v34;
  id (*v35)(uint64_t, CGFloat, CGFloat, double);
  void *v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD *v41;
  _QWORD *v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  id v47;
  BOOL *v48;
  _QWORD v49[4];
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[3];
  char v59;
  _BYTE v60[32];
  CGRect v61;
  CGRect v62;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  *a5 = 0;
  *a6 = 0;
  if (!objc_msgSend(v13, "containsElementsOtherThanMoveAndClose"))
    goto LABEL_3;
  objc_msgSend(v13, "bounds");
  v62.origin.x = v14;
  v62.origin.y = v15;
  v62.size.width = v16;
  v62.size.height = v17;
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  if (!CGRectContainsRect(v61, v62))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v59 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = (double *)&v50;
    v52 = 0x2020000000;
    v53 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v49[3] = 0;
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_1001B7240;
    v36 = &unk_1012412F0;
    v43 = x;
    v44 = y;
    v45 = width;
    v46 = height;
    v39 = &v54;
    v40 = &v50;
    v41 = v49;
    v47 = a1;
    v20 = v13;
    v37 = v20;
    v18 = v19;
    v38 = v18;
    v42 = v58;
    v48 = a5;
    objc_msgSend(v20, "iterateOverPathWithPointDistancePerIteration:usingBlock:", &v33, 1.0);
    v21 = *((_BYTE *)v55 + 24);
    if (v21)
    {
      v22 = v51[3];
      if (v22 == 1.0 || fabs(v22 + -1.0) < 0.000000999999997)
      {
        v21 = 1;
      }
      else
      {
        objc_msgSend(a1, "p_appendPath:fromStartPercent:toEndPercent:toPath:", v20, v18, v22, 1.0, v33, v34, v35, v36, v37);
        v21 = *((_BYTE *)v55 + 24);
      }
    }
    *a6 = v21 ^ 1;
    if ((objc_msgSend(v18, "isEmpty", v33, v34, v35, v36) & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v18, "bounds");
      v23 = CGSizeZero.height == v25 && CGSizeZero.width == v24;
    }
    if ((objc_msgSend(v18, "containsElementsOtherThanMoveAndClose") ^ 1 | v23) == 1)
    {
      if (v23 && objc_msgSend(v18, "containsElementsOtherThanMoveAndClose"))
      {
        v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241310);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E07294();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241330);
        v27 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DEE33C(v28, (uint64_t)v60, v26, v27);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingToolFillAndLegacyStroke p_copyOfBezierPath:clippedToRect:startsOutside:endsOutside:]"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 734, 0, "Clipping produced a zero-sized path");

      }
      *a5 = 1;
      *a6 = 1;
      v31 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));

      v18 = (id)v31;
    }

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(v58, 8);
  }
  else
  {
LABEL_3:
    v18 = objc_msgSend(v13, "copy");
  }

  return v18;
}

- (void)p_updatePathsFromPathCreatorWithCommitBehavior:(unint64_t)a3
{
  CRLBezierPath *v5;
  CRLBezierPath *subpathToCommit;
  CRLBezierPath *v7;
  CRLBezierPath *uncommittedPath;

  if (a3)
  {
    if (a3 == 2
      || -[CRLFreehandDrawingPathCreator pointCountAvailableToCommit](self->_pathCreator, "pointCountAvailableToCommit") >= 5)
    {
      v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPathCreator commitAllAvailablePoints](self->_pathCreator, "commitAllAvailablePoints"));
      subpathToCommit = self->_subpathToCommit;
      self->_subpathToCommit = v5;
    }
    else
    {
      subpathToCommit = self->_subpathToCommit;
      self->_subpathToCommit = 0;
    }

  }
  v7 = -[CRLFreehandDrawingPathCreator copyOfUncommittedPath](self->_pathCreator, "copyOfUncommittedPath");
  uncommittedPath = self->_uncommittedPath;
  self->_uncommittedPath = v7;

  if (a3)
  {
    if (self->_subpathToCommit)
    {
      -[CRLBezierPath appendBezierPath:skippingInitialMoveIfPossible:](self->_fullCommittedPath, "appendBezierPath:skippingInitialMoveIfPossible:");
      self->_fullCommittedPathEndsOutsideSpacerShape = 0;
    }
  }
}

- (BOOL)p_floodFillIfPossibleAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **p_cache;
  CFArrayRef (__cdecl **v20)(CTFontDescriptorRef, CFSetRef);
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_class *v29;
  id v30;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  NSObject *v48;
  void *v49;
  id v50;
  unsigned int v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *i;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *j;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  unsigned int v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  double v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  unsigned __int8 v90;
  double v91;
  void *v92;
  id v93;
  void *v94;
  NSObject *v95;
  char *v96;
  NSObject *v97;
  char *v98;
  char *v99;
  id WeakRetained;
  void *v101;
  id v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  id v106;
  CFArrayRef (__cdecl **v107)(CTFontDescriptorRef, CFSetRef);
  void *v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  void *k;
  void *v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  CFArrayRef (__cdecl **v121)(CTFontDescriptorRef, CFSetRef);
  id v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  double v138;
  objc_class *v139;
  objc_class *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  _TtC8Freeform17CRLCommandSetFill *v150;
  void *v151;
  void *v152;
  void *v153;
  CRLCommandSelectionBehavior *v154;
  void *v155;
  void *v156;
  _TtC8Freeform17CRLCommandSetFill *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  double v163;
  double v164;
  double v165;
  double v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  _TtC8Freeform26CRLCommandInsertBoardItems *v173;
  void *v174;
  _TtC8Freeform26CRLCommandInsertBoardItems *v175;
  void *v176;
  void *v177;
  void *v178;
  CRLCommandSelectionBehavior *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v185;
  void *v186;
  id v187;
  void *v188;
  uint64_t v189;
  void *v190;
  id v191;
  CRLFreehandDrawingToolFillAndLegacyStroke *v192;
  void *v193;
  uint64_t v194;
  id v195;
  id v196;
  void *v197;
  void *v198;
  id obj;
  id obja;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  id v205;
  void *v206;
  id v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  id v212;
  CGAffineTransform v213;
  CGAffineTransform v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  id v223;
  _OWORD v224[3];
  _OWORD v225[3];
  __int128 v226;
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
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  uint8_t v245[128];
  uint8_t buf[4];
  unsigned int v247;
  __int16 v248;
  const char *v249;
  __int16 v250;
  const char *v251;
  __int16 v252;
  int v253;
  __int16 v254;
  const char *v255;
  _BYTE v256[128];
  _BYTE v257[128];
  CGRect v258;
  CGRect v259;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v6, "visibleUnscaledRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
  v188 = v6;
  objc_msgSend(v6, "layoutIfNeeded");
  v192 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", x, y));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v212 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  v238 = 0u;
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v186 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reverseObjectEnumerator"));
  p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
  v20 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v198 = v15;
  v211 = v17;
  v187 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v238, v257, 16);
  if (!v187)
  {
    v197 = 0;
    v93 = 0;
    goto LABEL_96;
  }
  v197 = 0;
  v189 = *(_QWORD *)v239;
  v185 = v18;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v239 != v189)
        objc_enumerationMutation(v18);
      v194 = v21;
      v22 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * v21);
      objc_msgSend(v22, "frameForCullingInRoot");
      v259.origin.x = v8;
      v259.origin.y = v10;
      v259.size.width = v12;
      v259.size.height = v14;
      if (!CGRectIntersectsRect(v258, v259))
        goto LABEL_91;
      v236 = 0u;
      v237 = 0u;
      v234 = 0u;
      v235 = 0u;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "freehandInfo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "childInfos"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reverseObjectEnumerator"));

      obj = v25;
      v205 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v234, v256, 16);
      if (!v205)
        goto LABEL_90;
      v203 = *(_QWORD *)v235;
      while (2)
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v235 != v203)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * (_QWORD)v27);
          objc_opt_class(_TtC8Freeform12CRLShapeItem, v26);
          v30 = sub_1002223BC(v29, v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v30);
          if (v32 == v15)
          {
            v47 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012413D0);
            v48 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v247 = v47;
              v248 = 2082;
              v249 = "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]";
              v250 = 2082;
              v251 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m";
              v252 = 1024;
              v253 = 859;
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The failed outline fill shouldn't still be hanging around here. It was deleted.", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012413F0);
            v49 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v94 = v32;
              v95 = v49;
              v96 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 373, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v247 = v47;
              v248 = 2114;
              v249 = v96;
              _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              v32 = v94;
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[444], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]"));
            v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
            objc_msgSend(p_cache + 373, "handleFailureInFunction:file:lineNumber:isFatal:description:", v40, v50, 859, 0, "The failed outline fill shouldn't still be hanging around here. It was deleted.");
            goto LABEL_88;
          }
          *(_QWORD *)&v33 = objc_opt_class(CRLShapeLayout, v31).n128_u64[0];
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layoutController", v33));
          v37 = v32;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layoutForInfo:", v32));
          v39 = sub_100221D0C(v35, v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

          v209 = v27;
          if (!v40)
          {
            v201 = v37;
            v51 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101241350);
            v52 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v247 = v51;
              v248 = 2082;
              v249 = "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]";
              v250 = 2082;
              v251 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m";
              v252 = 1024;
              v253 = 796;
              v254 = 2082;
              v255 = "shapeLayout";
              _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101241370);
            v53 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v97 = v53;
              v98 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v247 = v51;
              v248 = 2114;
              v249 = v98;
              _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
            }
            v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[444], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]"));
            v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
            objc_msgSend(p_cache + 373, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v54, 796, 0, "invalid nil value for '%{public}s'", "shapeLayout");
            goto LABEL_59;
          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
          v207 = objc_msgSend(v41, "copy");

          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fill"));
          if (v42)
          {
            v43 = (void *)v42;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fill"));
            objc_opt_class(NSNull, v45);
            if ((objc_opt_isKindOfClass(v44, v46) & 1) != 0)
            {

            }
            else
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fill"));
              v56 = objc_msgSend(v55, "isClear");

              p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
              if (!v56)
              {
                v74 = 1;
                goto LABEL_62;
              }
            }
          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "maskPath"));

          if (v57)
          {
            v201 = v37;
            v54 = objc_alloc_init((Class)NSMutableArray);
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pencilKitStrokes"));
            v230 = 0u;
            v231 = 0u;
            v232 = 0u;
            v233 = 0u;
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v230, v245, 16);
            if (v59)
            {
              v60 = v59;
              v61 = *(_QWORD *)v231;
              do
              {
                for (i = 0; i != v60; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v231 != v61)
                    objc_enumerationMutation(v58);
                  v63 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * (_QWORD)i);
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "maskedPathRanges"));

                  if (v64)
                  {
                    v65 = (void *)objc_claimAutoreleasedReturnValue(+[PKStroke crl_strokePathsExcludingNonMaskedPathRangesForPKStroke:](PKStroke, "crl_strokePathsExcludingNonMaskedPathRangesForPKStroke:", v63));
                    objc_msgSend(v54, "addObjectsFromArray:", v65);

                  }
                }
                v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v230, v245, 16);
              }
              while (v60);
            }
            if (objc_msgSend(v54, "count"))
            {
              v228 = 0u;
              v229 = 0u;
              v226 = 0u;
              v227 = 0u;
              v66 = v54;
              v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v226, v244, 16);
              if (v67)
              {
                v68 = v67;
                v69 = *(_QWORD *)v227;
                do
                {
                  for (j = 0; j != v68; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v227 != v69)
                      objc_enumerationMutation(v66);
                    v71 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokePathConverter pathFromPKStrokePath:pencilKitStrokePathData:](CRLPKStrokePathConverter, "pathFromPKStrokePath:pencilKitStrokePathData:", *(_QWORD *)(*((_QWORD *)&v226 + 1) + 8 * (_QWORD)j), 0));
                    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pureGeometryInRoot"));
                    v73 = v72;
                    if (v72)
                      objc_msgSend(v72, "transform");
                    else
                      memset(v225, 0, sizeof(v225));
                    objc_msgSend(v71, "transformUsingAffineTransform:", v225);

                    objc_msgSend(v211, "insertObject:atIndex:", v71, 0);
                    objc_msgSend(v212, "setObject:forKey:", v22, v71);

                  }
                  v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v226, v244, 16);
                }
                while (v68);
              }

              v15 = v198;
            }

            v20 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
            p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
            v50 = v207;
LABEL_59:

            v27 = v209;
            v32 = v201;
            goto LABEL_88;
          }
          v74 = 0;
LABEL_62:
          if (!v207)
          {
            v75 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101241390);
            v76 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v247 = v75;
              v248 = 2082;
              v249 = "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]";
              v250 = 2082;
              v251 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m";
              v252 = 1024;
              v253 = 825;
              v254 = 2082;
              v255 = "shapePathInUnscaledSpace";
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v76, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }

            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012413B0);
            v77 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_ERROR))
            {
              v99 = (char *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 373, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v247 = v75;
              v248 = 2114;
              v249 = v99;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v77, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
            }

            v78 = p_cache + 373;
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[444], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]"));
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
            objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:isFatal:description:", v79, v80, 825, 0, "invalid nil value for '%{public}s'", "shapePathInUnscaledSpace");

            p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
          }
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pureGeometryInRoot"));
          v82 = v81;
          if (v81)
            objc_msgSend(v81, "transform");
          else
            memset(v224, 0, sizeof(v224));
          objc_msgSend(v207, "transformUsingAffineTransform:", v224);

          v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stroke"));
          v84 = 0.0;
          if (!v83)
          {
            v32 = v37;
            v50 = v207;
            goto LABEL_82;
          }
          v85 = (void *)v83;
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stroke"));
          objc_opt_class(NSNull, v87);
          if ((objc_opt_isKindOfClass(v86, v88) & 1) != 0)
          {

            v32 = v37;
            v50 = v207;
          }
          else
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stroke"));
            v90 = objc_msgSend(v89, "isNullStroke");

            p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
            v32 = v37;
            v50 = v207;
            if ((v90 & 1) != 0)
              goto LABEL_82;
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stroke"));
            objc_msgSend(v85, "width");
            v84 = v91;
          }

LABEL_82:
          objc_msgSend(v50, "setLineWidth:", v84);
          if (v74 && objc_msgSend(v50, "containsPoint:", x, y))
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "pathByNormalizingClosedPathToRemoveSelfIntersections"));

            v93 = v32;
            v50 = v92;

            v197 = v50;
          }
          else
          {
            v93 = 0;
          }
          objc_msgSend(v211, "insertObject:atIndex:", v50, 0);
          objc_msgSend(v212, "setObject:forKey:", v22, v50);
          if (v93)
          {

            v18 = v185;
            v17 = v211;
            goto LABEL_96;
          }
          v27 = v209;
LABEL_88:

          v27 = (char *)v27 + 1;
        }
        while (v27 != v205);
        v205 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v234, v256, 16);
        if (v205)
          continue;
        break;
      }
LABEL_90:

      v18 = v185;
LABEL_91:
      v21 = v194 + 1;
      v17 = v211;
    }
    while ((id)(v194 + 1) != v187);
    v93 = 0;
    v187 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v238, v257, 16);
  }
  while (v187);
LABEL_96:

  WeakRetained = objc_loadWeakRetained((id *)&v192->_pencilKitCanvasViewController);
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "rulerEdgePathInUnscaledSpaceForTopOfRuler:", 1));

  if (v101)
    objc_msgSend(v17, "addObject:", v101);
  v102 = objc_loadWeakRetained((id *)&v192->_pencilKitCanvasViewController);
  v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "rulerEdgePathInUnscaledSpaceForTopOfRuler:", 0));

  if (v103)
    objc_msgSend(v17, "addObject:", v103);
  v206 = (void *)v103;
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v223 = v104;
  v105 = objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingFloodFillHelper fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:](CRLFreehandDrawingFloodFillHelper, "fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:", v17, &v223, x, y, 5.0));
  v106 = v223;

  v210 = (void *)v105;
  if (v105)
  {
    v204 = v101;
    v107 = v20;
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v219 = 0u;
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    obja = v106;
    v109 = v106;
    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v219, v243, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v220;
      do
      {
        for (k = 0; k != v111; k = (char *)k + 1)
        {
          if (*(_QWORD *)v220 != v112)
            objc_enumerationMutation(v109);
          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * (_QWORD)k)));
          if (v114)
            objc_msgSend(v108, "addObject:", v114);

        }
        v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v219, v243, 16);
      }
      while (v111);
    }

    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v115 = v186;
    v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v215, v242, 16);
    if (v116)
    {
      v117 = v116;
      v118 = *(_QWORD *)v216;
LABEL_112:
      v119 = 0;
      while (1)
      {
        if (*(_QWORD *)v216 != v118)
          objc_enumerationMutation(v115);
        v120 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * v119);
        if ((objc_msgSend(v108, "containsObject:", v120) & 1) != 0)
          break;
        if (v117 == (id)++v119)
        {
          v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v215, v242, 16);
          if (v117)
            goto LABEL_112;
          goto LABEL_118;
        }
      }
      v122 = v120;

      v121 = v107;
      if (v122)
        goto LABEL_129;
    }
    else
    {
LABEL_118:

      v121 = v107;
    }
    v123 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241410);
    v124 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v124, OS_LOG_TYPE_ERROR))
      sub_100E07438();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241430);
    v125 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v125, OS_LOG_TYPE_ERROR))
      sub_100E07314((uint64_t)v123, v125);

    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121[444], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
    objc_msgSend(p_cache + 373, "handleFailureInFunction:file:lineNumber:isFatal:description:", v126, v127, 907, 0, "Unable to find correct drawing to fill. Falling back to the bottom drawing.");

    v122 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "objectAtIndexedSubscript:", 0));
LABEL_129:
    v128 = v210;
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentColorWithOpacity](v192, "p_currentColorWithOpacity"));
    v202 = objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v129));

    v195 = objc_msgSend(v122, "maxFilledShapeIndex");
    v130 = v122;
    v208 = v93;
    if (v93)
    {
      v131 = v197;
      v191 = v122;
      if (!v197)
      {
        v132 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241450);
        v133 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v133, OS_LOG_TYPE_ERROR))
          sub_100E073AC();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241470);
        v134 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v134, OS_LOG_TYPE_ERROR))
          sub_100E07314((uint64_t)v132, v134);

        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121[444], "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_floodFillIfPossibleAtPoint:]"));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
        objc_msgSend(p_cache + 373, "handleFailureInFunction:file:lineNumber:isFatal:description:", v135, v136, 916, 0, "invalid nil value for '%{public}s'", "hitFilledShapePathInRoot");

        v131 = 0;
      }
      if (objc_msgSend(v131, "isVisuallyEqualToPath:withThreshold:", v128, 1.0))
      {

        v128 = 0;
      }
      *(_QWORD *)&v138 = objc_opt_class(CRLColorFill, v137).n128_u64[0];
      v140 = v139;
      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "fill", v138));
      v142 = sub_1002223BC(v140, v141);
      v143 = (void *)objc_claimAutoreleasedReturnValue(v142);

      v144 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentColorWithOpacity](v192, "p_currentColorWithOpacity"));
      v145 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v144));

      if (!v128 && v143 && v145)
      {
        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "color"));
        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "color"));
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "colorByCompositingSourceOverDestinationColor:", v147));
        v149 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v148));

        v150 = -[CRLCommandSetFill initWithShapeItem:fill:]([_TtC8Freeform17CRLCommandSetFill alloc], "initWithShapeItem:fill:", v208, v149);
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "containingGroup"));
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "canvasEditor"));
        v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "selectionPathWithInfo:", v151));

        v154 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v153, v153);
        v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "commandController"));
        objc_msgSend(v155, "enqueueCommand:withSelectionBehavior:", v150, v154);

        if ((objc_msgSend(v143, "isEqual:", v145) & 1) == 0)
        {
          v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "freehandDrawingToolkit"));
          v157 = v150;
          v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "id"));
          objc_msgSend(v156, "enqueueAnimationForObjectUUID:animation:", v158, CFSTR("CRLFreehandDrawingToolkitAnimationNameFloodFill"));

          v150 = v157;
        }

        v128 = 0;
      }

      v93 = v208;
      v17 = v211;
      v130 = v191;
    }
    else
    {
      v17 = v211;
    }
    v159 = (void *)v202;
    v101 = v204;
    if (v128)
    {
      v160 = objc_msgSend(v128, "copy");
      v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "geometryInRoot"));
      v162 = v161;
      v196 = v128;
      if (v161)
        objc_msgSend(v161, "transform");
      else
        memset(&v213, 0, sizeof(v213));
      CGAffineTransformInvert(&v214, &v213);
      objc_msgSend(v160, "transformUsingAffineTransform:", &v214);

      objc_msgSend(v160, "bounds");
      v164 = v163;
      v166 = v165;
      v167 = objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v160));
      v168 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v192, "icc"));
      v193 = v160;
      v169 = v168;
      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "editingCoordinator"));
      v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "boardItemFactory"));

      v190 = (void *)v167;
      v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:", v167, 0, v202, 0, 0, v164, v166));
      v173 = [_TtC8Freeform26CRLCommandInsertBoardItems alloc];
      v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "freehandInfo"));
      v175 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItem:index:](v173, "initWithParentContainer:boardItem:index:", v174, v172, v195);

      v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "freehandInfo"));
      v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "canvasEditor"));
      v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "selectionPathWithInfo:", v176));

      v179 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v178, v178);
      v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "commandController"));
      objc_msgSend(v180, "enqueueCommand:withSelectionBehavior:", v175, v179);

      if (!v208)
      {
        v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "freehandDrawingToolkit"));
        v182 = v130;
        v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "id"));
        objc_msgSend(v181, "enqueueAnimationForObjectUUID:animation:", v183, CFSTR("CRLFreehandDrawingToolkitAnimationNameFloodFill"));

        v130 = v182;
        v159 = (void *)v202;

      }
      v93 = v208;
      v101 = v204;
      v17 = v211;
      v128 = v196;
    }

    v15 = v198;
    v106 = obja;
  }

  return v210 != 0;
}

- (id)p_currentStroke
{
  CRLBrushStroke *v3;
  unint64_t toolType;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CRLBrushStroke *v9;
  CRLBrushStroke *v10;
  __CFString **v11;
  __CFString *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (CRLBrushStroke *)objc_claimAutoreleasedReturnValue(+[CRLStroke stroke](CRLStroke, "stroke"));
  toolType = self->_toolType;
  switch(toolType)
  {
    case 3uLL:
      v10 = [CRLBrushStroke alloc];
      v11 = &off_101243D08;
LABEL_7:
      v12 = *v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentColorWithOpacity](self, "p_currentColorWithOpacity"));
      -[CRLFreehandDrawingToolFillAndLegacyStroke unscaledWidth](self, "unscaledWidth");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
      v9 = -[CRLBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v10, "initWithName:color:width:cap:join:pattern:miterLimit:", v12, v13, 1, 0, v16, v15, 1.0);

      goto LABEL_8;
    case 2uLL:
      v10 = [CRLBrushStroke alloc];
      v11 = &off_101243D00;
      goto LABEL_7;
    case 0uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentColorWithOpacity](self, "p_currentColorWithOpacity"));
      -[CRLFreehandDrawingToolFillAndLegacyStroke unscaledWidth](self, "unscaledWidth");
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
      v9 = (CRLBrushStroke *)objc_claimAutoreleasedReturnValue(+[CRLStroke strokeWithColor:width:cap:join:pattern:](CRLStroke, "strokeWithColor:width:cap:join:pattern:", v5, 1, 1, v8, v7));

LABEL_8:
      v3 = v9;
      return v3;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101241490);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E074B8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012414B0);
  v17 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolFillAndLegacyStroke p_currentStroke]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolFillAndLegacyStroke.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 975, 0, "Shouldn't be trying to get the stroke on this tool type.");

  return v3;
}

- (id)p_currentColorWithOpacity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "freehandDrawingToolkit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForCurrentTool"));
  -[CRLFreehandDrawingToolFillAndLegacyStroke opacity](self, "opacity");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:"));

  return v6;
}

- (double)opacity
{
  return self->_opacity;
}

- (double)unscaledWidth
{
  return self->_unscaledWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snappedOutlineFillRenderable, 0);
  objc_storeStrong((id *)&self->_dynamicSnappedFillPath, 0);
  objc_storeStrong((id *)&self->_shapeDrawingTimerHelper, 0);
  objc_storeStrong((id *)&self->_dynamicFillPath, 0);
  objc_storeStrong((id *)&self->_dashedOutlineFillRenderable, 0);
  objc_storeStrong((id *)&self->_uncommittedPath, 0);
  objc_storeStrong((id *)&self->_subpathToCommit, 0);
  objc_storeStrong((id *)&self->_fullCommittedPath, 0);
  objc_storeStrong((id *)&self->_pathCreator, 0);
  objc_destroyWeak((id *)&self->_pencilKitCanvasViewController);
}

@end
