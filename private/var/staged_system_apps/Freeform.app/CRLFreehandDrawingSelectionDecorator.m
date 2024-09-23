@implementation CRLFreehandDrawingSelectionDecorator

- (CRLFreehandDrawingSelectionDecorator)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLFreehandDrawingSelectionDecorator *v5;
  CRLFreehandDrawingSelectionDecorator *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingSelectionDecorator;
  v5 = -[CRLFreehandDrawingSelectionDecorator init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_icc, v4);
    objc_msgSend(v4, "addDecorator:", v6);

  }
  return v6;
}

- (void)tearDown
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012584B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BA9C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012584D8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSelectionDecorator tearDown]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSelectionDecorator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 32, 0, "Should not call -tearDown twice.");

  }
  self->_isTornDown = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "removeDecorator:", self);

  objc_storeWeak((id *)&self->_icc, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012584F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2BB20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258518);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSelectionDecorator dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSelectionDecorator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 40, 0, "You must call -tearDown before deallocation.");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingSelectionDecorator;
  -[CRLFreehandDrawingSelectionDecorator dealloc](&v6, "dealloc");
}

- (void)setDecoratorLayer:(id)a3
{
  id WeakRetained;

  objc_storeStrong((id *)&self->_layer, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

}

- (NSArray)decoratorOverlayRenderables
{
  CRLCanvasRenderable *v2;
  void *v3;
  CRLCanvasRenderable *v5;

  if (!self->_layer)
    return (NSArray *)&__NSArray0__struct;
  v2 = -[CRLCanvasRenderable initWithCALayer:]([CRLCanvasRenderable alloc], "initWithCALayer:", self->_layer);
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
