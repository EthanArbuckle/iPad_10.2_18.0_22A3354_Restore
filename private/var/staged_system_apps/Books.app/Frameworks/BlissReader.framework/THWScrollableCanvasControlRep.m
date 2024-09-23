@implementation THWScrollableCanvasControlRep

- (THWScrollableCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWScrollableCanvasControlRep *v6;
  id v7;
  THWScrollableCanvasController *scrollableCanvasController;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)THWScrollableCanvasControlRep;
  v6 = -[THWScrollableCanvasControlRep initWithLayout:canvas:](&v23, "initWithLayout:canvas:");
  if (v6)
  {
    v6->_scrollableCanvasController = -[THWScrollableCanvasController initWithDocumentRoot:]([THWScrollableCanvasController alloc], "initWithDocumentRoot:", objc_msgSend(a4, "documentRoot"));
    v7 = -[THWScrollableCanvasControlRep canvas](v6, "canvas");
    objc_msgSend(a3, "frameInRoot");
    objc_msgSend(v7, "convertUnscaledToBoundsRect:");
    scrollableCanvasController = v6->_scrollableCanvasController;
    objc_msgSend(-[THWScrollableCanvasControlRep canvas](v6, "canvas"), "convertUnscaledToBoundsRect:", v9, v10, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(-[THWScrollableCanvasControlRep canvas](v6, "canvas"), "viewScale");
    -[THWScrollableCanvasController createLayerHostIfNeededWithFrame:viewScale:](scrollableCanvasController, "createLayerHostIfNeededWithFrame:viewScale:", v14, v16, v18, v20, v21);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasControlRep;
  -[THWScrollableCanvasControlRep dealloc](&v3, "dealloc");
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (id)childReps
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  -[THWScrollableCanvasController addAlternateLayersToArray:](self->_scrollableCanvasController, "addAlternateLayersToArray:", a3);
}

- (void)updateFromLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWScrollableCanvasController *scrollableCanvasController;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWScrollableCanvasControlRep;
  -[THWScrollableCanvasControlRep updateFromLayout](&v17, "updateFromLayout");
  objc_msgSend(-[THWScrollableCanvasControlRep layout](self, "layout"), "frameInRoot");
  objc_msgSend(-[THWScrollableCanvasControlRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", v3, v4, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  scrollableCanvasController = self->_scrollableCanvasController;
  objc_msgSend(-[THWScrollableCanvasControlRep canvas](self, "canvas"), "viewScale");
  -[THWScrollableCanvasController setFrame:scale:](scrollableCanvasController, "setFrame:scale:", v8, v10, v12, v14, v16);
}

- (void)addChildViewsToArray:(id)a3
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWScrollableCanvasController *scrollableCanvasController;
  double v16;
  UIView *v17;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasControlRep addChildViewsToArray:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasControlRep.m"), 77, CFSTR("This operation must only be performed on the main thread."));
  v5 = -[THWScrollableCanvasControlRep layout](self, "layout");
  v6 = -[THWScrollableCanvasControlRep canvas](self, "canvas");
  objc_msgSend(v5, "frameInRoot");
  objc_msgSend(v6, "convertUnscaledToBoundsRect:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  scrollableCanvasController = self->_scrollableCanvasController;
  objc_msgSend(-[THWScrollableCanvasControlRep canvas](self, "canvas"), "viewScale");
  -[THWScrollableCanvasController createViewIfNeededWithFrame:viewScale:](scrollableCanvasController, "createViewIfNeededWithFrame:viewScale:", v8, v10, v12, v14, v16);
  v17 = -[THWScrollableCanvasController mainView](self->_scrollableCanvasController, "mainView");
  if (v17)
    objc_msgSend(a3, "addObject:", v17);
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasControlRep;
  -[THWControlRep willBeRemoved](&v3, "willBeRemoved");
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", -[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "flashScrollIndicators", 0);
  -[THWScrollableCanvasController teardownController](self->_scrollableCanvasController, "teardownController");
  -[THWScrollableCanvasController setDelegate:](self->_scrollableCanvasController, "setDelegate:", 0);
}

- (void)willRemoveChildView:(id)a3
{
  THWScrollableCanvasController *scrollableCanvasController;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasControlRep willRemoveChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasControlRep.m"), 101, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
  {
    scrollableCanvasController = self->_scrollableCanvasController;
    if (scrollableCanvasController)
    {
      if (-[THWScrollableCanvasController mainView](scrollableCanvasController, "mainView") == a3)
      {
        +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", -[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "flashScrollIndicators", 0);
        -[THWScrollableCanvasController teardownView](self->_scrollableCanvasController, "teardownView");
      }
    }
  }
}

- (void)didAddChildView:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasControlRep didAddChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasControlRep.m"), 114, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
    -[THWScrollableCanvasController didAddView](self->_scrollableCanvasController, "didAddView");
}

- (void)viewScrollingEnded
{
  if (-[THWScrollableCanvasControlRep isVisibleOnCanvas](self, "isVisibleOnCanvas"))
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", -[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "flashScrollIndicators", 0);
    -[TSKScrollView performSelector:withObject:afterDelay:](-[THWScrollableCanvasController scrollView](self->_scrollableCanvasController, "scrollView"), "performSelector:withObject:afterDelay:", "flashScrollIndicators", 0, 0.2);
  }
}

- (void)screenScaleDidChange
{
  -[THWScrollableCanvasController screenScaleDidChange](self->_scrollableCanvasController, "screenScaleDidChange");
}

- (void)canvasDidBeginFreeTransform
{
  -[THInteractiveCanvasController didBeginFreeTransform](-[THWScrollableCanvasController interactiveCanvasController](self->_scrollableCanvasController, "interactiveCanvasController"), "didBeginFreeTransform");
}

- (THWScrollableCanvasController)scrollableCanvasController
{
  return self->_scrollableCanvasController;
}

@end
