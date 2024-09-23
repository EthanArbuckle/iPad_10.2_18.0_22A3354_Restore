@implementation CRLImageMaskResizer

- (CRLImageMaskResizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLImageMaskResizer *v10;
  CRLImageMaskResizer *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253568);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23638(v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253588);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageMaskResizer initWithInteractiveCanvasController:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageMaskResizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 28, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");

  }
  v13.receiver = self;
  v13.super_class = (Class)CRLImageMaskResizer;
  v10 = -[CRLImageMaskResizer init](&v13, "init");
  v11 = v10;
  if (v10)
    objc_storeWeak((id *)&v10->_interactiveCanvasController, v4);

  return v11;
}

- (void)beginResizingRep:(id)a3
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  CRLMaskResizeTracker *v10;
  CRLMaskResizeTracker *maskResizeTracker;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_opt_class(CRLImageRep, v4);
  v6 = sub_1002223BC(v5, v22);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)v7;
  if (self->_maskResizeTracker)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    self->_readyToEnd = 0;
    v10 = -[CRLMaskResizeTracker initWithImageRep:]([CRLMaskResizeTracker alloc], "initWithImageRep:", v7);
    maskResizeTracker = self->_maskResizeTracker;
    self->_maskResizeTracker = v10;

    p_interactiveCanvasController = &self->_interactiveCanvasController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
    objc_msgSend(v14, "registerTrackerManipulator:", self);

    v15 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tmCoordinator"));
    objc_msgSend(v16, "takeControlWithTrackerManipulator:", self);

    v17 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dynamicOperationController"));
    objc_msgSend(v18, "beginOperation");

    v19 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dynamicOperationController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v22));
    objc_msgSend(v20, "startTransformingReps:", v21);

  }
}

- (void)updateResizeToScale:(double)a3
{
  CRLMaskResizeTracker *maskResizeTracker;
  void *v5;
  id WeakRetained;

  maskResizeTracker = self->_maskResizeTracker;
  if (maskResizeTracker)
  {
    -[CRLMaskResizeTracker setSliderValue:](maskResizeTracker, "setSliderValue:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
    objc_msgSend(v5, "handleTrackerManipulator:", self);

  }
}

- (void)endResizingRepAtScale:(double)a3
{
  CRLMaskResizeTracker *maskResizeTracker;
  void *v5;
  id WeakRetained;

  maskResizeTracker = self->_maskResizeTracker;
  if (maskResizeTracker)
  {
    self->_readyToEnd = 1;
    -[CRLMaskResizeTracker setSliderValue:](maskResizeTracker, "setSliderValue:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
    objc_msgSend(v5, "handleTrackerManipulator:", self);

  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_maskResizeTracker;
}

- (BOOL)readyToEndOperation
{
  return self->_readyToEnd;
}

- (void)operationDidEnd
{
  CRLMaskResizeTracker *maskResizeTracker;

  maskResizeTracker = self->_maskResizeTracker;
  self->_maskResizeTracker = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskResizeTracker, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
