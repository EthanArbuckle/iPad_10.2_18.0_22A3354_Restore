@implementation CRLFreehandDrawingTool

- (CRLFreehandDrawingTool)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLFreehandDrawingTool *v5;
  CRLFreehandDrawingTool *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingTool;
  v5 = -[CRLFreehandDrawingTool init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v6->_shouldEnableHandwritingIntelligence = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1);
  }

  return v6;
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v7 = a3;
  if (v5)
  {
    if (self->_isCurrentlyTracking || self->_isPerformingActions)
    {
      v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246820);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0FB14(v8, v9);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246840);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTool.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 55, 0, "Shouldn't be already tracking or performing actions when receiving the initial point.");

    }
    *(_WORD *)&self->_isPerformingActions = 257;
    self->_firstInputType = (int64_t)objc_msgSend(v7, "inputType");
  }
  self->_currentInputType = (int64_t)objc_msgSend(v7, "inputType");

}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  int64_t firstInputType;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;

  self->_isPerformingActions = 0;
  firstInputType = self->_firstInputType;
  v5 = 3;
  if (firstInputType)
    v5 = 0;
  if (firstInputType == 2)
    v6 = 2;
  else
    v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
  objc_msgSend(v8, "beginDrawingModeIfNeededForTouchType:", v6);

  return a3;
}

- (void)clearIsCurrentlyTracking
{
  self->_isCurrentlyTracking = 0;
}

- (unint64_t)type
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101246860);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLFreehandDrawingTool type]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTool.m";
    v31 = 1024;
    v32 = 96;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101246880);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTool type]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTool.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 96, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLFreehandDrawingTool type]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)wantsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)shouldCommandsEnqueueInRealTime
{
  return 0;
}

- (BOOL)isPerformingActions
{
  return self->_isPerformingActions;
}

- (BOOL)isCurrentlyTracking
{
  return self->_isCurrentlyTracking;
}

- (int64_t)currentInputType
{
  return self->_currentInputType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_icc);
}

+ (id)closestDrawingLayout:(id)a3 toPoint:(CGPoint)a4 returningDistance:(double *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *i;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  id v20;
  float64x2_t v22;
  double y;
  uint64_t v24;
  float64x2_t v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  y = a4.y;
  v24 = *(_QWORD *)&a4.x;
  v6 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v7)
  {
    v9 = 0;
    v11 = 1.79769313e308;
    if (!a5)
      goto LABEL_15;
    goto LABEL_14;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v29;
  v22 = (float64x2_t)vdupq_lane_s64(v24, 0);
  v11 = 1.79769313e308;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
      if (v13)
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "transformInRoot");
      else
        memset(&v26, 0, sizeof(v26));
      CGAffineTransformInvert(&v27, &v26);
      v25 = vaddq_f64(*(float64x2_t *)&v27.tx, vmlaq_f64(vmulq_n_f64(*(float64x2_t *)&v27.c, y), v22, *(float64x2_t *)&v27.a));
      objc_msgSend(v13, "boundsForStandardKnobs");
      v18 = sub_1000610A4(v25.f64[0], v25.f64[1], v14, v15, v16, v17);
      if (v18 <= v11)
      {
        v19 = v18;
        v20 = v13;

        v11 = v19;
        v9 = v20;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v8);
  if (a5)
LABEL_14:
    *a5 = v11;
LABEL_15:

  return v9;
}

- (id)possibleFreehandDrawingLayoutsInParentContainerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "parentForFreehandDrawingLayoutsAtPoint:", x, y));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "children"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:](CRLFreehandDrawingLayout, "freehandDrawingLayoutsToInteractWithFromLayouts:", v7));

  return v8;
}

- (BOOL)selectInsideClosestDrawing:(id)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_opt_class(self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "closestDrawingLayout:toPoint:returningDistance:", v7, 0, x, y));

  v11 = objc_loadWeakRetained((id *)&self->_icc);
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionModelTranslator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPathForNothingSelectedInsideGroup:", v14));
    objc_msgSend(v12, "setSelectionPath:withSelectionFlags:", v15, 0);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPathWithInfo:", 0));
    objc_msgSend(v12, "setSelectionPath:withSelectionFlags:", v14, 0);
    v15 = v12;
  }

  return v10 != 0;
}

@end
