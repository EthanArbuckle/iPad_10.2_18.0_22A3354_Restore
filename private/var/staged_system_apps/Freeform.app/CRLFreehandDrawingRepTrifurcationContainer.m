@implementation CRLFreehandDrawingRepTrifurcationContainer

- (CRLFreehandDrawingRepTrifurcationContainer)initWithDelegate:(id)a3 backReps:(id)a4 middleReps:(id)a5 frontReps:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CRLFreehandDrawingRepTrifurcationContainer *v14;
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
  uint64_t v27;
  CRLCanvasRenderable *backRenderable;
  uint64_t v29;
  CRLCanvasRenderable *middleRenderable;
  uint64_t v31;
  CRLCanvasRenderable *frontRenderable;
  id v34;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)CRLFreehandDrawingRepTrifurcationContainer;
  v14 = -[CRLFreehandDrawingRepTrifurcationContainer init](&v35, "init");
  if (v14)
  {
    v34 = v11;
    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E630);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02AE0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E650);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 156, 0, "invalid nil value for '%{public}s'", "delegate");

      v11 = v34;
    }
    objc_storeWeak((id *)&v14->_delegate, v10);
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E670);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02A54();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E690);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 159, 0, "invalid nil value for '%{public}s'", "backReps");

      v11 = v34;
    }
    objc_storeStrong((id *)&v14->_backReps, a4);
    if (!v12)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E6B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E029C8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E6D0);
      v11 = v34;
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 161, 0, "invalid nil value for '%{public}s'", "middleReps");

    }
    objc_storeStrong((id *)&v14->_middleReps, a5);
    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E6F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0293C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E710);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer initWithDelegate:backReps:middleReps:frontReps:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 163, 0, "invalid nil value for '%{public}s'", "frontReps");

      v11 = v34;
    }
    objc_storeStrong((id *)&v14->_frontReps, a6);
    v14->_freehandDrawingInitialUnscaledCanvasFrameOrigin = CGPointZero;
    v27 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepTrifurcationContainer p_createRenderable](v14, "p_createRenderable"));
    backRenderable = v14->_backRenderable;
    v14->_backRenderable = (CRLCanvasRenderable *)v27;

    v29 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepTrifurcationContainer p_createRenderable](v14, "p_createRenderable"));
    middleRenderable = v14->_middleRenderable;
    v14->_middleRenderable = (CRLCanvasRenderable *)v29;

    v31 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingRepTrifurcationContainer p_createRenderable](v14, "p_createRenderable"));
    frontRenderable = v14->_frontRenderable;
    v14->_frontRenderable = (CRLCanvasRenderable *)v31;

    -[CRLFreehandDrawingRepTrifurcationContainer p_captureInitialGeometry](v14, "p_captureInitialGeometry");
  }

  return v14;
}

- (id)p_createRenderable
{
  CRLFreehandDrawingRepTrifurcationContainerDelegate **p_delegate;
  id WeakRetained;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  double y;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (objc_class *)objc_msgSend(WeakRetained, "layerClassForTrifurcationContainer:", self);

  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "setDrawsAsynchronously:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v6));
  objc_msgSend(v7, "setDelegate:", self);
  v8 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v8, "canvasContentsScaleForTrifurcationContainer:", self);
  objc_msgSend(v7, "setContentsScale:");

  v9 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v9, "clipRectInScaledCanvasForTrifurcationContainer:", self);

  objc_msgSend(v7, "setBounds:", sub_10005FDDC());
  y = CGPointZero.y;
  objc_msgSend(v7, "setPosition:", CGPointZero.x, y);
  objc_msgSend(v7, "setAnchorPoint:", CGPointZero.x, y);
  objc_msgSend(v7, "setNeedsDisplay");

  return v7;
}

- (void)p_captureInitialGeometry
{
  CRLFreehandDrawingRepTrifurcationContainerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  CRLShapeLayout *v13;
  CRLShapeLayout *anchorShapeLayoutForTransform;
  CRLCanvasLayoutGeometry *v15;
  CRLCanvasLayoutGeometry *anchorShapeLayoutGeometryInRootAtRenderTime;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E730);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02B6C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E750);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer p_captureInitialGeometry]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 202, 0, "invalid nil value for '%{public}s'", "_delegate");

  }
  v8 = objc_loadWeakRetained((id *)p_delegate);

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "freehandDrawingUnscaledCanvasFrameOriginForTrifurcationContainer:", self);
    self->_freehandDrawingInitialUnscaledCanvasFrameOrigin.x = v10;
    self->_freehandDrawingInitialUnscaledCanvasFrameOrigin.y = v11;

    if (-[NSArray count](self->_middleReps, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_middleReps, "objectAtIndexedSubscript:", 0));
      v13 = (CRLShapeLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shapeLayout"));
      anchorShapeLayoutForTransform = self->_anchorShapeLayoutForTransform;
      self->_anchorShapeLayoutForTransform = v13;

      v15 = (CRLCanvasLayoutGeometry *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self->_anchorShapeLayoutForTransform, "geometryInRoot"));
      anchorShapeLayoutGeometryInRootAtRenderTime = self->_anchorShapeLayoutGeometryInRootAtRenderTime;
      self->_anchorShapeLayoutGeometryInRootAtRenderTime = v15;

    }
  }
}

- (void)tearDown
{
  NSArray *backReps;
  NSArray *middleReps;
  NSArray *frontReps;
  CRLCanvasRenderable *backRenderable;
  CRLCanvasRenderable *middleRenderable;
  CRLCanvasRenderable *frontRenderable;
  CRLShapeLayout *anchorShapeLayoutForTransform;
  CRLCanvasLayoutGeometry *anchorShapeLayoutGeometryInRootAtRenderTime;

  objc_storeWeak((id *)&self->_delegate, 0);
  backReps = self->_backReps;
  self->_backReps = (NSArray *)&__NSArray0__struct;

  middleReps = self->_middleReps;
  self->_middleReps = (NSArray *)&__NSArray0__struct;

  frontReps = self->_frontReps;
  self->_frontReps = (NSArray *)&__NSArray0__struct;

  backRenderable = self->_backRenderable;
  self->_backRenderable = 0;

  middleRenderable = self->_middleRenderable;
  self->_middleRenderable = 0;

  frontRenderable = self->_frontRenderable;
  self->_frontRenderable = 0;

  anchorShapeLayoutForTransform = self->_anchorShapeLayoutForTransform;
  self->_anchorShapeLayoutForTransform = 0;

  anchorShapeLayoutGeometryInRootAtRenderTime = self->_anchorShapeLayoutGeometryInRootAtRenderTime;
  self->_anchorShapeLayoutGeometryInRootAtRenderTime = 0;

}

- (CGAffineTransform)transformForMiddleRenderable:(SEL)a3
{
  _BOOL4 v4;
  CRLFreehandDrawingRepTrifurcationContainerDelegate **p_delegate;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGAffineTransform *result;
  double tx;
  double ty;
  CRLCanvasLayoutGeometry *anchorShapeLayoutGeometryInRootAtRenderTime;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGAffineTransform t2;
  CGAffineTransform v40;
  CGAffineTransform t1;
  CGAffineTransform v42;

  v4 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E770);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E02D10();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E790);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 231, 0, "invalid nil value for '%{public}s'", "_delegate");

  }
  v12 = objc_loadWeakRetained((id *)p_delegate);

  if (!v12)
  {
    v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v19;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    return result;
  }
  tx = CGAffineTransformIdentity.tx;
  ty = CGAffineTransformIdentity.ty;
  if (v4)
  {
    if (self->_anchorShapeLayoutForTransform)
    {
      anchorShapeLayoutGeometryInRootAtRenderTime = self->_anchorShapeLayoutGeometryInRootAtRenderTime;
      if (anchorShapeLayoutGeometryInRootAtRenderTime)
      {
        -[CRLCanvasLayoutGeometry transform](anchorShapeLayoutGeometryInRootAtRenderTime, "transform");
        CGAffineTransformInvert(&t1, &v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self->_anchorShapeLayoutForTransform, "geometryInRoot"));
        v18 = v17;
        if (v17)
          objc_msgSend(v17, "transform");
        else
          memset(&t2, 0, sizeof(t2));
        CGAffineTransformConcat(&v42, &t1, &t2);
        tx = v42.tx;
        ty = v42.ty;
LABEL_39:

        goto LABEL_40;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E7B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02C84();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E7D0);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 249, 0, "expected nil value for '%{public}s'", "_anchorShapeLayoutForTransform");

    }
    if (self->_anchorShapeLayoutGeometryInRootAtRenderTime)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E7F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02BF8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E810);
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer transformForMiddleRenderable:]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v24, 250, 0, "expected nil value for '%{public}s'", "_anchorShapeLayoutGeometryInRootAtRenderTime");

      goto LABEL_39;
    }
  }
LABEL_40:
  v25 = sub_1000603D0(tx, ty, self->_freehandDrawingInitialUnscaledCanvasFrameOrigin.x);
  v27 = v26;
  v28 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v28, "canvasViewScaleForTrifurcationContainer:", self);
  v30 = v29;

  v31 = sub_1000603DC(v25, v27, v30);
  v33 = v32;
  v34 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v34, "parentScaledCanvasFrameOriginForTrifurcationContainer:", self);
  v36 = v35;

  v37 = sub_1000603B8(v31, v33, v36);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return CGAffineTransformMakeTranslation(retstr, v37, v38);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_backRenderable, "layer"));

  if (v7 == v6)
  {
    v10 = 48;
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_middleRenderable, "layer"));

    if (v8 == v6)
    {
      v10 = 56;
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_frontRenderable, "layer"));

      if (v9 != v6)
        goto LABEL_19;
      v10 = 64;
    }
  }
  v11 = *(id *)((char *)&self->super.isa + v10);
  if (v11)
  {
    v12 = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E870);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02E4C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E890);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer drawLayer:inContext:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 286, 0, "invalid nil value for '%{public}s'", "_delegate");

    }
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v17, "drawShapeReps:intoContext:forLayer:inTrifurcationContainer:", v12, a4, v6, self);
    goto LABEL_28;
  }
LABEL_19:
  v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E830);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E02D9C((uint64_t)v6, v18);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123E850);
  v19 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRepTrifurcationContainer drawLayer:inContext:]"));
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v17, 282, 0, "Should not ask to draw unknown layer (%@).", v6);
LABEL_28:

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (NSArray)backReps
{
  return self->_backReps;
}

- (NSArray)middleReps
{
  return self->_middleReps;
}

- (NSArray)frontReps
{
  return self->_frontReps;
}

- (CRLCanvasRenderable)backRenderable
{
  return self->_backRenderable;
}

- (CRLCanvasRenderable)middleRenderable
{
  return self->_middleRenderable;
}

- (CRLCanvasRenderable)frontRenderable
{
  return self->_frontRenderable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontRenderable, 0);
  objc_storeStrong((id *)&self->_middleRenderable, 0);
  objc_storeStrong((id *)&self->_backRenderable, 0);
  objc_storeStrong((id *)&self->_frontReps, 0);
  objc_storeStrong((id *)&self->_middleReps, 0);
  objc_storeStrong((id *)&self->_backReps, 0);
  objc_storeStrong((id *)&self->_anchorShapeLayoutGeometryInRootAtRenderTime, 0);
  objc_storeStrong((id *)&self->_anchorShapeLayoutForTransform, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
