@implementation CRLFreehandDrawingToolPixelEraser

- (CRLFreehandDrawingToolPixelEraser)initWithInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4 scaledWidthForSlicingEraser:(double)a5
{
  id v8;
  CRLFreehandDrawingToolPixelEraser *v9;
  CRLFreehandDrawingToolPixelEraser *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
  v9 = -[CRLFreehandDrawingTool initWithInteractiveCanvasController:](&v12, "initWithInteractiveCanvasController:", a3);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_pencilKitCanvasViewController, v8);
    v10->_scaledWidthForSlicingEraser = a5;
  }

  return v10;
}

- (void)setScaledWidthForSlicingEraser:(double)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  self->_scaledWidthForSlicingEraser = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toolkitUIState"));
  objc_msgSend(v6, "setCurrentToolWidth:", a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  -[CRLFreehandDrawingToolPixelEraser updatePencilKitToolIfAppropriateFor:](self, "updatePencilKitToolIfAppropriateFor:", v8);

  objc_msgSend(v9, "containedToolDidSetWidth:", self);
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28[8];
  objc_super v29;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
  -[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:](&v29, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_tiledView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasView"));

  if (v6)
  {
    v14 = objc_alloc_init((Class)PKDrawing);
    objc_msgSend(v11, "setDrawing:", v14);

    if (v8)
      objc_msgSend(v8, "PKInputPoint");
    else
      memset(v28, 0, sizeof(v28));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "unscaledCoordinateSpace"));
    objc_msgSend(v13, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", v28, v16, objc_msgSend(v8, "activeInputProperties"), objc_msgSend(v8, "PKInputType"));

    objc_msgSend(v8, "unscaledPoint");
    -[CRLFreehandDrawingToolPixelEraser p_setUpForManualHitTestingFillEraseForInputPoint:](self, "p_setUpForManualHitTestingFillEraseForInputPoint:");
  }
  else if ((objc_msgSend(v8, "wasAddedByTouchesEnded") & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(v8, "PKInputPoint");
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc", v20, v21, v22, v23, v24, v25, v26, v27));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "unscaledCoordinateSpace"));
    objc_msgSend(v13, "_replayDrawingMoved:coordinateSpace:", &v20, v19);

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
  v10.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
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

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  id WeakRetained;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingToolPixelEraser;
  v4 = -[CRLFreehandDrawingTool finalizeAndResetWithSuccess:](&v9, "finalizeAndResetWithSuccess:", a3);
  -[CRLFreehandDrawingToolPixelEraser p_endErasingAndFinalize:](self, "p_endErasingAndFinalize:", v4);
  v5 = objc_alloc_init((Class)PKDrawing);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  objc_msgSend(v7, "setDrawing:", v5);

  return v4;
}

- (unint64_t)type
{
  return 8;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_alloc((Class)PKEraserTool);
  -[CRLFreehandDrawingToolPixelEraser scaledWidthForSlicingEraser](self, "scaledWidthForSlicingEraser");
  v6 = objc_msgSend(v5, "initWithEraserType:width:", 2);
  objc_msgSend(v4, "setTool:", v6);

}

- (void)p_endErasingAndFinalize:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_tiledView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));

  if (v3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_1000F6158;
    v20 = sub_1000F6168;
    v21 = 0;
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1000F6170;
    v13 = &unk_1012378F8;
    v15 = &v16;
    v9 = dispatch_semaphore_create(0);
    v14 = v9;
    objc_msgSend(v8, "_replayDrawingEndedEstimatesTimeout:withBackgroundQueueCompletion:", &v10, 0.0);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (v17[5])
      -[CRLFreehandDrawingToolPixelEraser p_finalizeBitmapEraseWithStroke:](self, "p_finalizeBitmapEraseWithStroke:", v10, v11, v12, v13);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    objc_msgSend(v8, "_replayDrawingCancelled");
  }

}

- (void)p_finalizeBitmapEraseWithStroke:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  int *v30;
  void *v31;
  void *v32;
  id WeakRetained;
  void *v34;
  unsigned int v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _TtC8Freeform23CRLCommandSetPathSource *v64;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  char *v78;
  void *v79;
  int64_t v80;
  void *v81;
  NSObject *v82;
  char *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSMutableSet *deletedShapeInfos;
  void *v89;
  void *v90;
  CRLBezierHitTester *fillHitTester;
  NSMutableArray *allHitTesterFillPathsZOrdered;
  NSMapTable *shapeFillLayoutsForHitTesterPaths;
  NSMapTable *currentPathsForHitTesterPaths;
  NSHashTable *hitTesterPathsNeedingFinalizationAtEnd;
  uint64_t v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  CRLCommandSelectionBehavior *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id obj;
  _TtC8Freeform23CRLCommandSetPathSource *v118;
  uint64_t v119;
  id v120;
  CRLFreehandDrawingToolPixelEraser *v121;
  void *v122;
  void *v123;
  CGAffineTransform v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint8_t buf[4];
  unsigned int v134;
  __int16 v135;
  const char *v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  int v140;
  __int16 v141;
  const char *v142;
  _QWORD v143[2];
  _BYTE v144[128];
  _BYTE v145[128];
  CGRect v146;
  CGRect v147;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v114 = v4;
  objc_msgSend(v4, "renderBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", sub_100061400(v6, v8, v10, v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v16, "openGroup");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Erase"), 0, CFSTR("UndoStrings")));
  v110 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v19, "setCurrentGroupActionString:", v18);

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  obj = v15;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v130 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v24, "frameForCullingInRoot");
        v147.origin.x = v7;
        v147.origin.y = v9;
        v147.size.width = v11;
        v147.size.height = v13;
        if (CGRectIntersectsRect(v146, v147))
        {
          v26 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "info"));
          v28 = sub_100221D0C(v26, v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

          if (v29)
            -[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:](self, "p_enqueueCommandsToEraseWithin:withErasingStroke:", v29, v114);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
    }
    while (v21);
  }

  v30 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
  if (-[CRLBezierHitTester pathCount](self->_fillHitTester, "pathCount"))
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:pencilKitStrokePathData:", v114, 0));
    -[CRLFreehandDrawingToolPixelEraser p_updatePathsForSlicingWithErasingStroke:](self, "p_updatePathsForSlicingWithErasingStroke:");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:pencilKitStrokePathData:", v114, 0));
    -[CRLFreehandDrawingToolPixelEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
    objc_msgSend(v31, "setLineWidth:");
    objc_msgSend(v31, "setLineCapStyle:", 1);
    objc_msgSend(v31, "setLineJoinStyle:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "strokedCopy"));

    WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
    v35 = objc_msgSend(v34, "isRulerActive");

    if (v35)
    {
      v36 = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "unscaledRulerBezierPath"));

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolPixelEraser p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:withVisibleRulerBezierPath:](self, "p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:withVisibleRulerBezierPath:", v32, v37));
      if (v38)
      {
        v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "intersectBezierPath:", v38));

        v32 = (void *)v39;
      }

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray crl_arrayWithObjectsInHashTable:](self->_allHitTesterFillPathsZOrdered, "crl_arrayWithObjectsInHashTable:", self->_hitTesterPathsNeedingFinalizationAtEnd));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "editingCoordinator"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "commandController"));

    v112 = v44;
    objc_msgSend(v44, "openGroup");
    v116 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v115 = v40;
    v113 = v32;
    v111 = v41;
    v120 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v125, v144, 16);
    if (v120)
    {
      v119 = *(_QWORD *)v126;
      v121 = self;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v126 != v119)
            objc_enumerationMutation(v115);
          v46 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_shapeFillLayoutsForHitTesterPaths, "objectForKeyedSubscript:", v46));
          v123 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_currentPathsForHitTesterPaths, "objectForKeyedSubscript:", v46));
          v143[0] = v123;
          v143[1] = v32;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 2));
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath subtractBezierPaths:](CRLBezierPath, "subtractBezierPaths:", v48));

          if (!v49)
          {
            v50 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237918);
            v51 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v134 = v50;
              v135 = 2082;
              v136 = "-[CRLFreehandDrawingToolPixelEraser p_finalizeBitmapEraseWithStroke:]";
              v137 = 2082;
              v138 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m";
              v139 = 1024;
              v140 = 259;
              v141 = 2082;
              v142 = "pathWithErasure";
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237938);
            v52 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v82 = v52;
              v83 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v134 = v50;
              v135 = 2114;
              v136 = v83;
              _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_finalizeBitmapEraseWithStroke:]"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v53, v54, 259, 0, "invalid nil value for '%{public}s'", "pathWithErasure");

            v49 = 0;
            self = v121;
          }
          v122 = v49;
          if ((objc_msgSend(v49, "containsElementsOtherThanMoveAndClose") & 1) != 0)
          {
            v55 = objc_msgSend(v49, "copy");
            objc_msgSend(v55, "bounds");
            v57 = v56;
            v59 = v58;
            CGAffineTransformMakeTranslation(&v124, -v56, -v58);
            objc_msgSend(v55, "transformUsingAffineTransform:", &v124);
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v55));
            objc_msgSend(v47, "beginDynamicOperationWithRealTimeCommands:", 0);
            objc_msgSend(v47, "dynamicallySetBezierPathSource:atUnscaledOrigin:", v60, v57, v59);

            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "pathSource"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "finalInfoGeometryForResize"));
            objc_msgSend(v47, "endDynamicOperation");
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "shapeInfo"));
            v64 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v63, v61);
            objc_msgSend(v112, "enqueueCommand:", v64);
            v65 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v63, v62);
            objc_msgSend(v112, "enqueueCommand:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "parentInfo"));
            v68 = objc_opt_class(NSObject, v67);
            v74 = sub_10022209C(v66, v68, 1, v69, v70, v71, v72, v73, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
            v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

            v118 = v64;
            if (v63
              && (v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "objectForKeyedSubscript:", v75))) != 0)
            {
              v77 = v76;
              v78 = (char *)objc_msgSend(v76, "integerValue");

            }
            else
            {
              v78 = 0;
            }
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bezierPath"));
            v80 = -[CRLFreehandDrawingToolPixelEraser p_breakApartFilledShapeIfPossible:withDesiredGeometry:bezierPath:previousZOrderOffset:](v121, "p_breakApartFilledShapeIfPossible:withDesiredGeometry:bezierPath:previousZOrderOffset:", v63, v62, v79, v78);

            if (v75)
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v78[v80]));
              objc_msgSend(v116, "setObject:forKeyedSubscript:", v81, v75);

            }
            self = v121;
            v32 = v113;
            v41 = v111;
          }
          else
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "shapeInfo"));
            objc_msgSend(v41, "addObject:", v61);
          }

          v45 = (char *)v45 + 1;
        }
        while (v120 != v45);
        v120 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v125, v144, 16);
      }
      while (v120);
    }

    v30 = &OBJC_IVAR___CRLFreehandDrawingToolPixelEraser__scaledWidthForSlicingEraser;
    if (objc_msgSend(v41, "count"))
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "setRepresentation"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "canvasEditor"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "canvasEditorHelper"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v84, 1));

      objc_msgSend(v112, "enqueueCommand:", v87);
      deletedShapeInfos = self->_deletedShapeInfos;
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "setRepresentation"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "allObjects"));
      -[NSMutableSet addObjectsFromArray:](deletedShapeInfos, "addObjectsFromArray:", v90);

      v41 = v111;
    }
    objc_msgSend(v112, "closeGroup");

  }
  fillHitTester = self->_fillHitTester;
  self->_fillHitTester = 0;

  allHitTesterFillPathsZOrdered = self->_allHitTesterFillPathsZOrdered;
  self->_allHitTesterFillPathsZOrdered = 0;

  shapeFillLayoutsForHitTesterPaths = self->_shapeFillLayoutsForHitTesterPaths;
  self->_shapeFillLayoutsForHitTesterPaths = 0;

  currentPathsForHitTesterPaths = self->_currentPathsForHitTesterPaths;
  self->_currentPathsForHitTesterPaths = 0;

  hitTesterPathsNeedingFinalizationAtEnd = self->_hitTesterPathsNeedingFinalizationAtEnd;
  self->_hitTesterPathsNeedingFinalizationAtEnd = 0;

  v96 = v30[6];
  v97 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v96), "count");
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v99 = v98;
  if (v97)
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "canvasEditor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "canvasEditorHelper"));
    v102 = (CRLCommandSelectionBehavior *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "selectionBehaviorForDeletingBoardItems:", *(Class *)((char *)&self->super.super.isa + v96)));

    -[CRLCommandSelectionBehavior setSelectionFlags:](v102, "setSelectionFlags:", -[CRLCommandSelectionBehavior selectionFlags](v102, "selectionFlags") & 0xFFFFFFFFFFFFFFFBLL);
  }
  else
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "editorController"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "selectionPath"));

    v102 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v104, v104);
  }
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "pkDrawingProvider"));
  objc_msgSend(v106, "activeDrawingWillEndAfterInsertingFinalizedDrawingItem");

  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "commandController"));
  objc_msgSend(v107, "closeGroupWithSelectionBehavior:", v102);

  v108 = *(Class *)((char *)&self->super.super.isa + v96);
  *(Class *)((char *)&self->super.super.isa + v96) = 0;

}

- (double)p_unscaledEraserDiameter
{
  double scaledWidthForSlicingEraser;
  objc_class *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  scaledWidthForSlicingEraser = self->_scaledWidthForSlicingEraser;
  v4 = (objc_class *)objc_opt_class(PKEraserTool, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pencilKitCanvasViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tool"));
  v8 = sub_1002223BC(v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    objc_msgSend(v9, "width");
    scaledWidthForSlicingEraser = v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v11, "viewScale");
  v13 = scaledWidthForSlicingEraser / v12;

  return v13;
}

- (void)p_enqueueCommandsToEraseWithin:(id)a3 withErasingStroke:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  __objc2_class_ro **p_info;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  _UNKNOWN **v67;
  void *v68;
  uint64_t v69;
  void *v70;
  unsigned int v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  id v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  CRLCanvasInfoGeometry *v87;
  void *v88;
  CRLCanvasInfoGeometry *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  void *k;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _TtC8Freeform26CRLCommandInsertBoardItems *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  NSMutableSet *deletedShapeInfos;
  uint64_t v123;
  NSMutableSet *v124;
  void *v125;
  void *v126;
  void *v127;
  CRLFreehandDrawingToolPixelEraser *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  id v136;
  id obj;
  uint64_t v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[4];
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  uint8_t buf[56];
  _BYTE v188[128];

  v6 = a3;
  v128 = self;
  v129 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v133 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 16);
  v8 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 16);
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v178 = 0u;
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v130 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childInfos"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v178, v188, 16);
  v131 = v7;
  if (v11)
  {
    v13 = v11;
    p_info = &OBJC_METACLASS___CRLWPSearchReferenceAccessibility.info;
    v15 = *(_QWORD *)v179;
    v148 = *(_QWORD *)v179;
    v144 = v10;
    do
    {
      v16 = 0;
      v146 = v13;
      do
      {
        if (*(_QWORD *)v179 != v15)
          objc_enumerationMutation(v10);
        v152 = v16;
        v17 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * v16);
        v18 = objc_opt_class(p_info + 471, v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutForInfo:", v17));
        v20 = sub_100221D0C(v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "shapeInfo"));
          v23 = objc_msgSend(v22, "isTreatedAsFillForFreehandDrawing");

          if ((v23 & 1) == 0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pencilKitStrokes"));
            v150 = v24;
            if (v24)
            {
              v25 = v24;
              if (objc_msgSend(v24, "count") != (id)1)
              {
                v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101237998);
                v27 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67110402;
                  *(_DWORD *)&buf[4] = v26;
                  *(_WORD *)&buf[8] = 2082;
                  *(_QWORD *)&buf[10] = "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]";
                  *(_WORD *)&buf[18] = 2082;
                  *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDraw"
                                        "ingToolPixelEraser.m";
                  *(_WORD *)&buf[28] = 1024;
                  *(_DWORD *)&buf[30] = 372;
                  *(_WORD *)&buf[34] = 2082;
                  *(_QWORD *)&buf[36] = "strokesInShapeSpace.count";
                  *(_WORD *)&buf[44] = 2082;
                  *(_QWORD *)&buf[46] = "1U";
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected equality between %{public}s and %{public}s", buf, 0x36u);
                }
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012379B8);
                v28 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  v49 = v28;
                  v50 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v26;
                  *(_WORD *)&buf[8] = 2114;
                  *(_QWORD *)&buf[10] = v50;
                  _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 372, 0, "expected equality between %{public}s and %{public}s", "strokesInShapeSpace.count", "1U");

              }
              memset(buf, 0, 48);
              objc_msgSend(v21, "pureTransformInRoot");
              v174[0] = _NSConcreteStackBlock;
              v174[1] = 3221225472;
              v174[2] = sub_1000F82EC;
              v174[3] = &unk_1012379D8;
              v175 = *(_OWORD *)buf;
              v176 = *(_OWORD *)&buf[16];
              v177 = *(_OWORD *)&buf[32];
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "crl_arrayByTransformingWithBlock:", v174));
              objc_msgSend(v132, "addObjectsFromArray:", v31);
              v172 = 0u;
              v173 = 0u;
              v170 = 0u;
              v171 = 0u;
              v32 = v31;
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v170, v186, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v171;
                do
                {
                  for (i = 0; i != v34; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v171 != v35)
                      objc_enumerationMutation(v32);
                    v37 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)i);
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_strokeUUID"));
                    objc_msgSend(v9, "addObject:", v38);

                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_strokeUUID"));
                    objc_msgSend(v133, "setObject:forKeyedSubscript:", v21, v39);

                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_strokeDataUUID"));
                    objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v41);

                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v170, v186, 16);
                }
                while (v34);
              }

              v7 = v131;
              v10 = v144;
              v13 = v146;
            }
            else
            {
              v42 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101237958);
              v43 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)&buf[4] = v42;
                *(_WORD *)&buf[8] = 2082;
                *(_QWORD *)&buf[10] = "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]";
                *(_WORD *)&buf[18] = 2082;
                *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawin"
                                      "gToolPixelEraser.m";
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = 369;
                *(_WORD *)&buf[34] = 2082;
                *(_QWORD *)&buf[36] = "strokesInShapeSpace";
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101237978);
              v44 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v47 = v44;
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v42;
                *(_WORD *)&buf[8] = 2114;
                *(_QWORD *)&buf[10] = v48;
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 369, 0, "invalid nil value for '%{public}s'", "strokesInShapeSpace");

            }
            p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLWPSearchReferenceAccessibility + 32);
            v15 = v148;
          }
        }

        v16 = v152 + 1;
      }
      while ((id)(v152 + 1) != v13);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v178, v188, 16);
    }
    while (v13);
  }

  v51 = objc_alloc((Class)PKDrawing);
  v52 = objc_alloc_init((Class)PKDrawing);
  v53 = objc_msgSend(v51, "initWithStrokes:fromDrawing:", v132, v52);

  objc_msgSend(v53, "_eraseWithEraserStroke:", v129);
  v127 = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "strokes"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v55 = objc_msgSend(v9, "mutableCopy");
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  obj = v54;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v185, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v167;
    do
    {
      for (j = 0; j != v57; j = (char *)j + 1)
      {
        if (*(_QWORD *)v167 != v58)
          objc_enumerationMutation(obj);
        v60 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * (_QWORD)j);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "_strokeUUID"));
        v62 = objc_msgSend(v9, "containsObject:", v61);

        if ((v62 & 1) != 0)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "_strokeUUID"));
          objc_msgSend(v55, "removeObject:", v63);

        }
        else
        {
          objc_msgSend(v135, "addObject:", v60);
        }
      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v185, 16);
    }
    while (v57);
  }

  v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v136 = v55;
  v64 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v162, v184, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v163;
    v67 = &off_1013C5000;
    do
    {
      v68 = 0;
      do
      {
        if (*(_QWORD *)v163 != v66)
          objc_enumerationMutation(v136);
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * (_QWORD)v68)));
        if (!v70)
        {
          v71 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012379F8);
          v72 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v71;
            *(_WORD *)&buf[8] = 2082;
            *(_QWORD *)&buf[10] = "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]";
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m";
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = 406;
            *(_WORD *)&buf[34] = 2082;
            *(_QWORD *)&buf[36] = "shapeLayout";
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237A18);
          v73 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v80 = v73;
            v81 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v71;
            *(_WORD *)&buf[8] = 2114;
            *(_QWORD *)&buf[10] = v81;
            _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_enqueueCommandsToEraseWithin:withErasingStroke:]"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v74, v75, 406, 0, "invalid nil value for '%{public}s'", "shapeLayout");

          v67 = &off_1013C5000;
        }
        v76 = (objc_class *)objc_opt_class(v67 + 409, v69);
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "info"));
        v78 = sub_1002223BC(v76, v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue(v78);

        objc_msgSend(v143, "crl_addNonNilObject:", v79);
        v68 = (char *)v68 + 1;
      }
      while (v65 != v68);
      v65 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v162, v184, 16);
    }
    while (v65);
  }

  v82 = v131;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "commandController"));
  objc_msgSend(v83, "openGroup");

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "editingCoordinator"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "boardItemFactory"));

  v85 = v135;
  if (objc_msgSend(v135, "count"))
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "layoutForInfo:", v130));
    v87 = [CRLCanvasInfoGeometry alloc];
    v126 = v86;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "geometryInRoot"));
    v89 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v87, "initWithLayoutGeometry:", v88);

    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "childItems"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v90));

    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v134 = v135;
    v141 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v158, v183, 16);
    if (v141)
    {
      v138 = *(_QWORD *)v159;
      do
      {
        v91 = 0;
        do
        {
          if (*(_QWORD *)v159 != v138)
            objc_enumerationMutation(v134);
          v92 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v91);
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "path"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "_strokeDataUUID"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v94));

          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "shapeInfo"));
          v97 = objc_msgSend(v139, "indexOfObject:", v96);
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "stroke"));
          v153 = v91;
          v149 = v96;
          v151 = v95;
          v145 = v97;
          v147 = v98;
          if (v98)
          {
            objc_msgSend(v98, "width");
            v100 = v99;
          }
          else
          {
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "anyObject"));
            v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "stroke"));
            objc_msgSend(v102, "width");
            v100 = v103;

          }
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "makeShapeItemsForFreehandDrawingWithPKStroke:adjustedBaseWidth:", v92, v100));
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          v157 = 0u;
          v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
          if (v105)
          {
            v106 = v105;
            v107 = *(_QWORD *)v155;
            do
            {
              for (k = 0; k != v106; k = (char *)k + 1)
              {
                if (*(_QWORD *)v155 != v107)
                  objc_enumerationMutation(v104);
                v109 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)k);
                v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "geometry"));
                v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "geometryRelativeToGeometry:", v89));
                objc_msgSend(v109, "setGeometry:", v111);

              }
              v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
            }
            while (v106);
          }
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v145));
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKeyedSubscript:", v112));

          if (!v113)
          {
            v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v145));
            objc_msgSend(v142, "setObject:forKeyedSubscript:", v113, v114);

          }
          objc_msgSend(v113, "addObjectsFromArray:", v104);

          v91 = v153 + 1;
        }
        while ((id)(v153 + 1) != v141);
        v141 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v158, v183, 16);
      }
      while (v141);
    }

    v115 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItemsByIndex:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItemsByIndex:", v130, v142);
    v82 = v131;
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "commandController"));
    objc_msgSend(v116, "enqueueCommand:", v115);

    v85 = v135;
  }
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "canvasEditor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "canvasEditorHelper"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v143, objc_msgSend(v85, "count") == 0));

  if (v119)
  {
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "commandController"));
    objc_msgSend(v120, "enqueueCommand:", v119);

  }
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "commandController"));
  objc_msgSend(v121, "closeGroup");

  deletedShapeInfos = v128->_deletedShapeInfos;
  if (!deletedShapeInfos)
  {
    v123 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v124 = v128->_deletedShapeInfos;
    v128->_deletedShapeInfos = (NSMutableSet *)v123;

    deletedShapeInfos = v128->_deletedShapeInfos;
  }
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "allObjects"));
  -[NSMutableSet addObjectsFromArray:](deletedShapeInfos, "addObjectsFromArray:", v125);

}

- (void)p_setUpForManualHitTestingFillEraseForInputPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  NSMutableArray *v9;
  NSMutableArray *allHitTesterFillPathsZOrdered;
  NSMapTable *v11;
  NSMapTable *shapeFillLayoutsForHitTesterPaths;
  NSMapTable *v13;
  NSMapTable *currentPathsForHitTesterPaths;
  NSHashTable *v15;
  NSHashTable *hitTesterPathsNeedingFinalizationAtEnd;
  CRLBezierHitTester *v17;
  CRLBezierHitTester *fillHitTester;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *i;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  _BYTE v54[48];
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

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v6, "viewScale");
  v8 = v7;
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  allHitTesterFillPathsZOrdered = self->_allHitTesterFillPathsZOrdered;
  self->_allHitTesterFillPathsZOrdered = v9;

  v11 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  shapeFillLayoutsForHitTesterPaths = self->_shapeFillLayoutsForHitTesterPaths;
  self->_shapeFillLayoutsForHitTesterPaths = v11;

  v13 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  currentPathsForHitTesterPaths = self->_currentPathsForHitTesterPaths;
  self->_currentPathsForHitTesterPaths = v13;

  v15 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  hitTesterPathsNeedingFinalizationAtEnd = self->_hitTesterPathsNeedingFinalizationAtEnd;
  self->_hitTesterPathsNeedingFinalizationAtEnd = v15;

  v17 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", ceil(10.0 / fmin(v8, 1.0)));
  fillHitTester = self->_fillHitTester;
  self->_fillHitTester = v17;

  objc_msgSend(v6, "visibleUnscaledRect");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:", x, y));
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v51)
  {
    v50 = *(_QWORD *)v60;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v60 != v50)
          objc_enumerationMutation(obj);
        v53 = v28;
        v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v28);
        v30 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "info"));
        v32 = sub_100221D0C(v30, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v52 = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "childInfos"));
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (v35)
        {
          v37 = v35;
          v38 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v38)
                objc_enumerationMutation(v34);
              v40 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
              v41 = objc_opt_class(CRLShapeLayout, v36);
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutForInfo:", v40));
              v43 = sub_100221D0C(v41, v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

              if (v44)
              {
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "shapeInfo"));
                v46 = objc_msgSend(v45, "isTreatedAsFillForFreehandDrawing");

                if (v46)
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "pathSource"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bezierPath"));

                  objc_msgSend(v44, "pureTransformInRoot");
                  objc_msgSend(v48, "transformUsingAffineTransform:", v54);
                  -[CRLBezierHitTester addPath:filled:clippedToRect:](self->_fillHitTester, "addPath:filled:clippedToRect:", v48, 1, v20, v22, v24, v26);
                  -[NSMutableArray addObject:](self->_allHitTesterFillPathsZOrdered, "addObject:", v48);
                  -[NSMapTable setObject:forKeyedSubscript:](self->_shapeFillLayoutsForHitTesterPaths, "setObject:forKeyedSubscript:", v44, v48);
                  -[NSMapTable setObject:forKeyedSubscript:](self->_currentPathsForHitTesterPaths, "setObject:forKeyedSubscript:", v48, v48);

                }
              }

            }
            v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          }
          while (v37);
        }

        v28 = v53 + 1;
      }
      while ((id)(v53 + 1) != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v51);
  }

}

- (void)p_updatePathsForSlicingWithErasingStroke:(id)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  -[CRLFreehandDrawingToolPixelEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](self->_fillHitTester, "pathsCrossingPath:withSearchThreshold:", v4, v5 * 0.5));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!-[NSHashTable containsObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "containsObject:", v11))
          -[NSHashTable addObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (int64_t)p_breakApartFilledShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 previousZOrderOffset:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  int64_t v13;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "visuallyDistinctSubregions"));
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    v13 = -[CRLFreehandDrawingToolPixelEraser p_breakApartShape:withGeometry:subpaths:previousZOrderOffset:](self, "p_breakApartShape:withGeometry:subpaths:previousZOrderOffset:", v10, v11, v12, a6);
  else
    v13 = 0;

  return v13;
}

- (int64_t)p_breakApartShape:(id)a3 withGeometry:(id)a4 subpaths:(id)a5 previousZOrderOffset:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char *v29;
  _TtC8Freeform26CRLCommandInsertBoardItems *v30;
  void *v31;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v32;
  void *v33;
  char *v34;
  void *v37;
  id v38;

  v9 = a3;
  v38 = a4;
  v10 = a5;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "editingCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "boardItemFactory"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  if (objc_msgSend(v10, "count"))
  {
    v15 = 0;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v15));
      v18 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLShapeItem, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "makeDuplicateOfBoardItem:", v9));
      v20 = sub_1002223BC(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      objc_msgSend(v16, "bounds");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "geometryWithNewBounds:"));
      objc_msgSend(v21, "setGeometry:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v16));
      objc_msgSend(v21, "setPathSource:", v23);

      objc_msgSend(v21, "setAspectRatioLocked:", objc_msgSend(v9, "aspectRatioLocked"));
      objc_msgSend(v13, "addObject:", v21);

      ++v15;
    }
    while (v15 < (unint64_t)objc_msgSend(v10, "count"));
  }
  v24 = (objc_class *)objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentInfo"));
  v26 = sub_1002223BC(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "childInfos"));
  v29 = (char *)objc_msgSend(v28, "indexOfObject:", v9) + a6;

  v30 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v27, v13, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "commandController"));
  objc_msgSend(v31, "enqueueCommand:", v30);

  v32 = -[CRLCommandDeleteBoardItems initWithBoardItemToDelete:]([_TtC8Freeform26CRLCommandDeleteBoardItems alloc], "initWithBoardItemToDelete:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "commandController"));
  objc_msgSend(v33, "enqueueCommand:", v32);

  v34 = (char *)objc_msgSend(v13, "count") - 1;
  return (int64_t)v34;
}

- (id)p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:(id)a3 withVisibleRulerBezierPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[6];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
    {
      v8 = INFINITY;
      v9 = INFINITY;
    }
    else
    {
      objc_msgSend(v6, "elementAtIndex:associatedPoints:", 0, v45);
      v8 = *(double *)v45;
      v9 = *(double *)&v45[1];
    }
    if (sub_100061890(v8, v9))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237A38);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFA25C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237A58);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:withVisibleRulerBezierPath:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 589, 0, "Begin point from erasing stroke path should not be null.");
      v10 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      objc_msgSend(v14, "visibleBoundsRectForTiling");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      objc_msgSend(v23, "convertBoundsToUnscaledRect:", v16, v18, v20, v22);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v25, v27, v29, v31));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subtractBezierPath:", v7));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:", 1));
      if (objc_msgSend(v32, "count"))
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v33 = v32;
        v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v10)
        {
          v34 = *(_QWORD *)v41;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v41 != v34)
                objc_enumerationMutation(v33);
              v36 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v36, "containsPoint:", v8, v9, (_QWORD)v40))
              {
                v10 = v36;
                goto LABEL_36;
              }
            }
            v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v10)
              continue;
            break;
          }
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101237A78);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DFA2E0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101237A98);
        v37 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v37);
        v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolPixelEraser p_erasableAreaPathInUnscaledSpaceForErasingStrokePath:withVisibleRulerBezierPath:]"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolPixelEraser.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v38, 601, 0, "subpathsFromSubtractedPath should never empty.");

        v10 = 0;
      }
LABEL_36:

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)scaledWidthForSlicingEraser
{
  return self->_scaledWidthForSlicingEraser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedShapeInfos, 0);
  objc_storeStrong((id *)&self->_hitTesterPathsNeedingFinalizationAtEnd, 0);
  objc_storeStrong((id *)&self->_currentPathsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_shapeFillLayoutsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_allHitTesterFillPathsZOrdered, 0);
  objc_storeStrong((id *)&self->_fillHitTester, 0);
  objc_destroyWeak((id *)&self->_pencilKitCanvasViewController);
}

@end
