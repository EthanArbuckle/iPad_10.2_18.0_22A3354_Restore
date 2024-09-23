@implementation CRLDragAndDropCanvasHighlightDecorator

- (CRLDragAndDropCanvasHighlightDecorator)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLDragAndDropCanvasHighlightDecorator *v5;
  CRLDragAndDropCanvasHighlightDecorator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLDragAndDropCanvasHighlightDecorator;
  v5 = -[CRLDragAndDropCanvasHighlightDecorator init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mICC, v4);

  return v6;
}

- (CRLDragAndDropCanvasHighlightDecorator)initWithInteractiveCanvasController:(id)a3 highlightPath:(CGPath *)a4
{
  CRLDragAndDropCanvasHighlightDecorator *v5;
  CRLDragAndDropCanvasHighlightDecorator *v6;

  v5 = -[CRLDragAndDropCanvasHighlightDecorator initWithInteractiveCanvasController:](self, "initWithInteractiveCanvasController:", a3);
  v6 = v5;
  if (v5)
    -[CRLDragAndDropCanvasHighlightDecorator setHighlightPath:](v5, "setHighlightPath:", a4);
  return v6;
}

- (CRLDragAndDropCanvasHighlightDecorator)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122C8E0);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLDragAndDropCanvasHighlightDecorator init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m";
    v17 = 1024;
    v18 = 42;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122C900);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropCanvasHighlightDecorator init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 42, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLDragAndDropCanvasHighlightDecorator init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLCanvasShapeRenderable)dragAndDropHighlightRenderable
{
  CRLCanvasShapeRenderable *mDragAndDropHighlightRenderable;
  CRLCanvasShapeRenderable *v4;
  id WeakRetained;
  void *v6;
  CRLCanvasShapeRenderable *v7;
  id v8;

  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  if (!mDragAndDropHighlightRenderable)
  {
    v4 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    -[CRLCanvasShapeRenderable setFillColor:](v4, "setFillColor:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    -[CRLCanvasRenderable setDelegate:](v4, "setDelegate:", WeakRetained);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.00392156886, 0.647058845, 0.98828125, 1.0));
    -[CRLCanvasShapeRenderable setStrokeColor:](v4, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

    -[CRLCanvasShapeRenderable setLineWidth:](v4, "setLineWidth:", 2.0);
    v7 = self->mDragAndDropHighlightRenderable;
    self->mDragAndDropHighlightRenderable = v4;

    v8 = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v8, "invalidateLayersForDecorator:", self);

    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  }
  return mDragAndDropHighlightRenderable;
}

- (void)beginHighlightingWithPath:(CGPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  if (self->mDragAndDropHighlightRenderable)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C920);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE83F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C940);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropCanvasHighlightDecorator beginHighlightingWithPath:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 78, 0, "expected nil value for '%{public}s'", "mDragAndDropHighlightRenderable");

  }
  -[CRLDragAndDropCanvasHighlightDecorator setHighlightPath:](self, "setHighlightPath:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  objc_msgSend(WeakRetained, "addDecorator:", self);

}

- (void)setHighlightPath:(CGPath *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropCanvasHighlightDecorator dragAndDropHighlightRenderable](self, "dragAndDropHighlightRenderable"));
  objc_msgSend(v4, "setPath:", a3);

}

- (void)endHighlighting
{
  CRLCanvasShapeRenderable *mDragAndDropHighlightRenderable;
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasShapeRenderable *v7;
  id WeakRetained;

  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  if (!mDragAndDropHighlightRenderable)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C960);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8490();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C980);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropCanvasHighlightDecorator endHighlighting]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropCanvasHighlightDecorator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 95, 0, "invalid nil value for '%{public}s'", "mDragAndDropHighlightRenderable");

    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  }
  -[CRLCanvasRenderable setDelegate:](mDragAndDropHighlightRenderable, "setDelegate:", 0);
  v7 = self->mDragAndDropHighlightRenderable;
  self->mDragAndDropHighlightRenderable = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  objc_msgSend(WeakRetained, "removeDecorator:", self);

}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;
  CRLCanvasShapeRenderable *mDragAndDropHighlightRenderable;

  if (self->mDragAndDropHighlightRenderable)
  {
    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mDragAndDropHighlightRenderable, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDragAndDropHighlightRenderable, 0);
  objc_destroyWeak((id *)&self->mICC);
}

@end
