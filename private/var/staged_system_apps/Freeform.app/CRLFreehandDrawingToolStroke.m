@implementation CRLFreehandDrawingToolStroke

- (CRLFreehandDrawingToolStroke)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 strokeToolType:(unint64_t)a5 opacity:(double)a6 unscaledWidth:(double)a7
{
  id v12;
  CRLFreehandDrawingToolStroke *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRLFreehandDrawingToolStroke;
  v13 = -[CRLFreehandDrawingTool initWithInteractiveCanvasController:](&v18, "initWithInteractiveCanvasController:", a3);
  if (v13)
  {
    if (!+[CRLFreehandDrawingToolStroke p_isStrokeToolType:](CRLFreehandDrawingToolStroke, "p_isStrokeToolType:", a5))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256728);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28A14();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256748);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:strokeToolType:opacity:unscaledWidth:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 64, 0, "Stroke tool should only be initialized with a stroke tool type (got %zu).", a5);

    }
    objc_storeWeak((id *)&v13->_pencilKitCanvasViewController, v12);
    v13->_toolType = a5;
    v13->_opacity = a6;
    v13->_unscaledWidth = a7;
  }

  return v13;
}

+ (BOOL)p_isStrokeToolType:(unint64_t)a3
{
  return a3 - 10 < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)setUnscaledWidth:(double)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  self->_unscaledWidth = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toolkitUIState"));
  objc_msgSend(v6, "setCurrentToolWidth:", a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  -[CRLFreehandDrawingToolStroke updatePencilKitToolIfAppropriateFor:](self, "updatePencilKitToolIfAppropriateFor:", v8);

  objc_msgSend(v9, "containedToolDidSetWidth:", self);
}

- (void)setOpacity:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  self->_opacity = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toolkitUIState"));
  objc_msgSend(v7, "setCurrentToolOpacity:", a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  -[CRLFreehandDrawingToolStroke updatePencilKitToolIfAppropriateFor:](self, "updatePencilKitToolIfAppropriateFor:", v8);

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
  -[CRLFreehandDrawingToolStroke opacity](self, "opacity");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:"));

  return v6;
}

- (unint64_t)type
{
  return self->_toolType;
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
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  CRLPencilKitInkStroke *v21;
  void *v22;
  void *v23;
  CRLPencilKitInkStroke *v24;
  void *v25;
  _OWORD v26[8];
  objc_super v27[8];
  objc_super v28;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRLFreehandDrawingToolStroke;
  -[CRLFreehandDrawingToolAbstractPathInsertion performActionWithInputPoint:isInitialPoint:isFinalPoint:](&v28, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_tiledView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasView"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unscaledCoordinateSpace"));
  if (v6)
  {
    v16 = objc_alloc_init((Class)PKDrawing);
    objc_msgSend(v12, "setDrawing:", v16);

    v25 = v10;
    if (v8)
      objc_msgSend(v8, "PKInputPoint");
    else
      memset(v27, 0, sizeof(v27));
    objc_msgSend(v14, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", v27, v15, objc_msgSend(v8, "activeInputProperties"), objc_msgSend(v8, "PKInputType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v8, "unscaledPoint");
    objc_msgSend(v17, "moveToPoint:");
    objc_msgSend(v8, "unscaledPoint");
    v19 = v18 + 0.1;
    objc_msgSend(v8, "unscaledPoint");
    objc_msgSend(v17, "lineToPoint:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v9, "i_beginSuppressingLayerUpdatesExceptForReps:", v20);

    v21 = [CRLPencilKitInkStroke alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolStroke p_currentPKInkType](self, "p_currentPKInkType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolStroke p_currentColorWithOpacity](self, "p_currentColorWithOpacity"));
    -[CRLFreehandDrawingToolStroke unscaledWidth](self, "unscaledWidth");
    v24 = -[CRLPencilKitInkStroke initWithInkType:color:unadjustedPencilKitWidth:](v21, "initWithInkType:color:unadjustedPencilKitWidth:", v22, v23);

    -[CRLFreehandDrawingToolAbstractPathInsertion openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:stroke:fill:](self, "openCommandGroupAndInsertInitialFreehandDrawingWithUnscaledPath:stroke:fill:", v17, v24, 0);
    v10 = v25;
  }
  else if ((objc_msgSend(v8, "wasAddedByTouchesEnded") & 1) == 0)
  {
    if (v8)
      objc_msgSend(v8, "PKInputPoint");
    else
      memset(v26, 0, sizeof(v26));
    objc_msgSend(v14, "_replayDrawingMoved:coordinateSpace:", v26, v15);
    -[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded](self, "p_enqueueRealTimeCommandsForPathUpdateIfNeeded");
  }

}

- (void)p_enqueueRealTimeCommandsForPathUpdateIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  id v11;
  PKStroke *lastPKStrokeSetInRealTime;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  objc_class *v18;
  objc_class *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _TtC8Freeform23CRLCommandSetPathSource *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _TtC8Freeform23CRLCommandSetPathSource *v41;
  void *v42;
  void *v43;
  CRLPKStrokePathCompactData *currentStrokePathData;
  char *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  CRLPKStrokePathCompactData *v51;
  void *v52;
  CRLPKStrokePathCompactData *v53;
  double v54;
  double v55;
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *v56;
  CRLCanvasInfoGeometry *v57;
  CRLCanvasInfoGeometry *v58;
  void *v59;
  uint64_t v60;
  CRLCanvasInfoGeometry *v61;
  void *v62;
  void *v63;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v64;
  int v65;
  CRLPKStrokePathCompactData *v66;
  void *v67;
  _TtC8Freeform23CRLCommandSetPathSource *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  CGAffineTransform v74;
  CGAffineTransform v75;

  if (self->_isEnqueueingCommandsInRealTime)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_tiledView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasView"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentStroke"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v9 = (char *)objc_msgSend(v8, "_immutablePointsCount");

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256768);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28AA4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256788);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v16, 193, 0, "invalid nil value for '%{public}s'", "currentPKStroke");
      goto LABEL_78;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v11 = objc_msgSend(v10, "count");

    if ((unint64_t)v11 < 2 || v9 == 0)
      goto LABEL_79;
    lastPKStrokeSetInRealTime = self->_lastPKStrokeSetInRealTime;
    if (lastPKStrokeSetInRealTime)
    {
      if ((-[PKStroke isEqual:](lastPKStrokeSetInRealTime, "isEqual:", v7) & 1) != 0)
        goto LABEL_79;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandController"));
    if (!v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012567A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28B34();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012567C8);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v31);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v24, 204, 0, "invalid nil value for '%{public}s'", "cc");
      goto LABEL_77;
    }
    *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v15).n128_u64[0];
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem", v17));
    v21 = sub_1002223BC(v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layoutForInfo:", v22));
    v24 = (void *)v23;
    v73 = (void *)v22;
    if (!v23)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012567E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28BC4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256808);
      v32 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v27, 211, 0, "invalid nil value for '%{public}s'", "shapeLayout");
      v29 = (void *)v22;
      goto LABEL_76;
    }
    v72 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:", v7, 0, v9 - 1, 0));
    if (objc_msgSend(v25, "isEmpty"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256828);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28C54();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256848);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]"));
      v28 = (_TtC8Freeform23CRLCommandSetPathSource *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 226, 0, "CRLPKStrokeConverter returned an empty path ending at pointIndex: %lu.", v9 - 1);
      v29 = v73;
LABEL_75:

      v24 = v72;
LABEL_76:

LABEL_77:
LABEL_78:

LABEL_79:
      return;
    }
    objc_msgSend(v25, "bounds");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v69 = objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v25));
    v41 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v22, v69);
    -[CRLCommand setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:](v41, "setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:", 0);
    objc_msgSend(v16, "enqueueCommand:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mask"));
    v67 = v42;
    v68 = v41;
    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(objc_retainAutorelease(v42), "CGPath")));
      objc_msgSend(v72, "transformInRoot");
      CGAffineTransformInvert(&v75, &v74);
      objc_msgSend(v43, "transformUsingAffineTransform:", &v75);
    }
    else
    {
      v43 = 0;
    }
    v70 = v25;
    currentStrokePathData = self->_currentStrokePathData;
    if (currentStrokePathData)
      v45 = -[CRLPKStrokePathCompactData pointCount](currentStrokePathData, "pointCount");
    else
      v45 = 0;
    v46 = v73;
    v71 = v43;
    if (v45 >= v9)
    {
      if (v45 != v9)
      {
        v65 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256868);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E28CE4(v65);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256888);
        v50 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v50);
        v51 = (CRLPKStrokePathCompactData *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_enqueueRealTimeCommandsForPathUpdateIfNeeded]"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 274, 0, "expected equality between %{public}s and %{public}s", "currentStrokePathDataCount", "immutablePKPointCount");

        v66 = 0;
        v46 = v73;
        v43 = v71;
        goto LABEL_70;
      }
    }
    else
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:](CRLPKStrokePathConverter, "strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:", v7));
      v48 = v47;
      if (self->_currentStrokePathData)
      {
        v49 = (id)objc_claimAutoreleasedReturnValue(+[CRLPKStrokePathCompactData strokePathCompactDataFrom:](CRLPKStrokePathCompactData, "strokePathCompactDataFrom:"));
        objc_msgSend(v49, "appendStrokePathCompactData:", v48);
      }
      else
      {
        v49 = v47;
      }

      if (v49)
      {
        v53 = (CRLPKStrokePathCompactData *)v49;
        v51 = self->_currentStrokePathData;
        v66 = v53;
        self->_currentStrokePathData = v53;
LABEL_70:

LABEL_72:
        objc_msgSend(v7, "crl_anchorPointForTexture");
        -[CRLPKStrokePathCompactData setAnchorPointForTexture:](self->_currentStrokePathData, "setAnchorPointForTexture:", sub_1000603B8(v54, v55, v34));
        v56 = -[CRLCommandSetFreehandDrawingShapeItemPKData initWithFreehandDrawingShapeItem:strokePathCompactData:maskPath:]([_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData alloc], "initWithFreehandDrawingShapeItem:strokePathCompactData:maskPath:", v46, self->_currentStrokePathData, v43);
        -[CRLCommand setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:](v56, "setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:", 0);
        objc_msgSend(v16, "enqueueCommand:", v56);
        v57 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v34, v36, v38, v40);
        v58 = [CRLCanvasInfoGeometry alloc];
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "parent"));
        v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "geometryInRoot"));
        v61 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v58, "initWithLayoutGeometry:", v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry geometryRelativeToGeometry:](v57, "geometryRelativeToGeometry:", v61));

        v29 = v73;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "geometry"));
        LOBYTE(v60) = objc_msgSend(v63, "isEqual:", v62);

        if ((v60 & 1) == 0)
        {
          v64 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v73, v62);
          -[CRLCommand setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:](v64, "setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:", 0);
          objc_msgSend(v16, "enqueueCommand:", v64);

        }
        v27 = (void *)v69;
        v25 = v70;
        v28 = v68;
        goto LABEL_75;
      }
    }
    v66 = 0;
    goto LABEL_72;
  }
}

- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9[8];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingToolStroke;
  -[CRLFreehandDrawingTool estimatedPropertiesUpdatedOnInputPoint:](&v10, "estimatedPropertiesUpdatedOnInputPoint:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_tiledView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));
  if (v4)
    objc_msgSend(v4, "PKInputPoint");
  else
    memset(v9, 0, sizeof(v9));
  objc_msgSend(v8, "_replayEstimatedPropertiesUpdated:", v9);

}

- (void)p_endDrawingAndCaptureFinalStroke:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_tiledView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));

  if (v3)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1003897AC;
    v24 = sub_1003897BC;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_1003897AC;
    v18 = sub_1003897BC;
    v19 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003897C4;
    v10[3] = &unk_1012568B0;
    v12 = &v20;
    v13 = &v14;
    v9 = dispatch_semaphore_create(0);
    v11 = v9;
    objc_msgSend(v8, "_replayDrawingEndedEstimatesTimeout:withBackgroundQueueCompletion:", v10, 0.0);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&self->_finalPKStroke, (id)v21[5]);
    objc_storeStrong((id *)&self->_finalPKShapeStrokes, (id)v15[5]);

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    objc_msgSend(v8, "_replayDrawingCancelled");
  }

}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CRLCanvasInfoGeometry *v21;
  void *v22;
  CRLCanvasInfoGeometry *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  uint64_t v35;
  void *v36;
  void *v37;
  PKStroke *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  double v48;
  objc_class *v49;
  objc_class *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _TtC8Freeform26CRLCommandInsertBoardItems *v56;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v57;
  void *v58;
  void *v59;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v60;
  BOOL v61;
  CRLFreehandDrawingSnapToShapeHelper *v62;
  void *v63;
  CRLFreehandDrawingSnapToShapeHelper *v64;
  void *v65;
  void *v66;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v67;
  void *v68;
  void *v69;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v70;
  id v71;
  id WeakRetained;
  void *v73;
  PKStroke *lastPKStrokeSetInRealTime;
  PKStroke *v75;
  NSArray *finalPKShapeStrokes;
  CRLPKStrokePathCompactData *currentStrokePathData;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  objc_super v93;
  _BYTE v94[128];
  _BYTE v95[128];
  PKStroke *finalPKStroke;

  v93.receiver = self;
  v93.super_class = (Class)CRLFreehandDrawingToolStroke;
  v4 = (id)-[CRLFreehandDrawingTool finalizeAndResetWithSuccess:](&v93, "finalizeAndResetWithSuccess:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  -[CRLFreehandDrawingToolStroke p_endDrawingAndCaptureFinalStroke:](self, "p_endDrawingAndCaptureFinalStroke:", v4);
  if (self->_finalPKStroke)
    v7 = v4;
  else
    v7 = 0;
  objc_msgSend(v5, "i_endSuppressingLayerUpdates");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v84 = v5;
  if ((_DWORD)v7 == 1)
  {
    v81 = v6;
    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v8).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentInfo"));
    v15 = sub_1002223BC(v12, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    if (!v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012568D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28D9C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012568F0);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke finalizeAndResetWithSuccess:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 391, 0, "invalid nil value for '%{public}s'", "parentFreehandItem");

    }
    v80 = (void *)v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForInfo:", v16));
    v21 = [CRLCanvasInfoGeometry alloc];
    v79 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometryInRoot"));
    v23 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v21, "initWithLayoutGeometry:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "editingCoordinator"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "boardItemFactory"));

    if (-[PKStroke _isMaskedStroke](self->_finalPKStroke, "_isMaskedStroke"))
    {
      v27 = objc_alloc((Class)PKDrawing);
      finalPKStroke = self->_finalPKStroke;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &finalPKStroke, 1));
      v29 = objc_msgSend(v27, "initWithStrokes:", v28);

      objc_msgSend(v29, "_clipMaskedStrokes");
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "strokes"));
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v90 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
            -[CRLFreehandDrawingToolStroke unscaledWidth](self, "unscaledWidth");
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "makeShapeItemsForFreehandDrawingWithPKStroke:unadjustedPencilKitBaseWidth:", v35));
            objc_msgSend(v9, "addObjectsFromArray:", v36);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
        }
        while (v32);
      }

    }
    else
    {
      v38 = self->_finalPKStroke;
      -[CRLFreehandDrawingToolStroke unscaledWidth](self, "unscaledWidth");
      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "makeShapeItemsForFreehandDrawingWithPKStroke:unadjustedPencilKitBaseWidth:", v38));
      objc_msgSend(v9, "addObjectsFromArray:", v29);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v82 = v9;
    v39 = v9;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v41; j = (char *)j + 1)
        {
          if (*(_QWORD *)v86 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "geometry"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "geometryRelativeToGeometry:", v23));
          objc_msgSend(v44, "setGeometry:", v46);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      }
      while (v41);
    }

    if (objc_msgSend(v39, "count") == (id)1)
    {
      *(_QWORD *)&v48 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v47).n128_u64[0];
      v50 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem", v48));
      v52 = sub_1002223BC(v50, v51);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "commandsToUpdateModelToMatch:", v53));
      objc_msgSend(v81, "enqueueCommand:", v54);

      v7 = 1;
      v55 = v80;
    }
    else
    {
      v7 = 1;
      v55 = v80;
      if ((unint64_t)objc_msgSend(v39, "count") < 2)
      {
        v37 = 0;
      }
      else
      {
        v56 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:", v80, v39);
        objc_msgSend(v81, "enqueueCommand:", v56);

        v57 = [_TtC8Freeform26CRLCommandDeleteBoardItems alloc];
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolAbstractPathInsertion shapeItem](self, "shapeItem"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v58));
        v60 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:](v57, "initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:", v59, 1);
        objc_msgSend(v81, "enqueueCommand:", v60);

        v55 = v80;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
      }
    }

    v6 = v81;
    v9 = v82;
  }
  else
  {
    v37 = 0;
  }
  -[CRLFreehandDrawingToolAbstractPathInsertion finalizeAndResetAbstractPathInsertionToolWithSuccess:](self, "finalizeAndResetAbstractPathInsertionToolWithSuccess:", v7);
  if (self->_finalPKShapeStrokes)
    v61 = v37 == 0;
  else
    v61 = 1;
  if (!v61)
  {
    objc_msgSend(v6, "openGroup");
    v62 = [CRLFreehandDrawingSnapToShapeHelper alloc];
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v64 = -[CRLFreehandDrawingSnapToShapeHelper initWithInteractiveCanvasController:](v62, "initWithInteractiveCanvasController:", v63);

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper commandForSnappingShapeItem:toStrokesInUnscaledSpace:outCreatedAndModifiedShapes:](v64, "commandForSnappingShapeItem:toStrokesInUnscaledSpace:outCreatedAndModifiedShapes:", v37, self->_finalPKShapeStrokes, 0));
    objc_msgSend(v6, "enqueueCommand:", v65);
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", 1, (char *)objc_msgSend(v9, "count") - 1));
      v67 = [_TtC8Freeform26CRLCommandDeleteBoardItems alloc];
      v83 = v9;
      v68 = v6;
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v66));
      v70 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:](v67, "initWithBoardItemsToDelete:", v69);
      objc_msgSend(v68, "enqueueCommand:", v70);

      v6 = v68;
      v9 = v83;

    }
    objc_msgSend(v6, "closeGroup");

  }
  v71 = objc_alloc_init((Class)PKDrawing);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  objc_msgSend(v73, "setDrawing:", v71);

  self->_isEnqueueingCommandsInRealTime = 0;
  lastPKStrokeSetInRealTime = self->_lastPKStrokeSetInRealTime;
  self->_lastPKStrokeSetInRealTime = 0;

  v75 = self->_finalPKStroke;
  self->_finalPKStroke = 0;

  finalPKShapeStrokes = self->_finalPKShapeStrokes;
  self->_finalPKShapeStrokes = 0;

  currentStrokePathData = self->_currentStrokePathData;
  self->_currentStrokePathData = 0;

  return v7;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolStroke p_currentPKInkType](self, "p_currentPKInkType"));
  v5 = objc_alloc((Class)PKInkingTool);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolStroke p_currentColorWithOpacity](self, "p_currentColorWithOpacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UIColor"));
  -[CRLFreehandDrawingToolStroke unscaledWidth](self, "unscaledWidth");
  v8 = objc_msgSend(v5, "initWithInkType:color:width:", v9, v7);

  objc_msgSend(v4, "setTool:", v8);
}

- (id)p_currentPKInkType
{
  NSString *v3;
  unint64_t *p_toolType;
  id *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;

  v3 = PKInkTypePen;
  p_toolType = &self->_toolType;
  switch(*p_toolType)
  {
    case 0uLL:
      v5 = (id *)&PKInkTypeMonoline;
      goto LABEL_17;
    case 1uLL:
      return v3;
    case 2uLL:
      v5 = (id *)&PKInkTypePencil;
      goto LABEL_17;
    case 3uLL:
      v5 = (id *)&PKInkTypeCrayon;
      goto LABEL_17;
    case 4uLL:
      v5 = (id *)&PKInkTypeWatercolor;
      goto LABEL_17;
    case 5uLL:
      v5 = (id *)&PKInkTypeFountainPen;
      goto LABEL_17;
    case 6uLL:
      v5 = (id *)&PKInkTypeMarker;
LABEL_17:
      v10 = (NSString *)*v5;

      v3 = v10;
      break;
    default:
      v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256910);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28E2C((uint64_t)p_toolType, v6);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256930);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolStroke p_currentPKInkType]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolStroke.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 499, 0, "Unexpected tool type for rendering with PencilKit (%zu). Defaulting to pen ink.", *p_toolType);

      break;
  }
  return v3;
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
  objc_storeStrong((id *)&self->_currentStrokePathData, 0);
  objc_storeStrong((id *)&self->_finalPKShapeStrokes, 0);
  objc_storeStrong((id *)&self->_finalPKStroke, 0);
  objc_storeStrong((id *)&self->_lastPKStrokeSetInRealTime, 0);
  objc_destroyWeak((id *)&self->_pencilKitCanvasViewController);
}

@end
