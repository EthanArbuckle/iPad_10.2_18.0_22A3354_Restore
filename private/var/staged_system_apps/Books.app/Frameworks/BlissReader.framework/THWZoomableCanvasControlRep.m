@implementation THWZoomableCanvasControlRep

- (THWZoomableCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWZoomableCanvasControlRep *v5;
  THWZoomableCanvasController *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWZoomableCanvasControlRep;
  v5 = -[THWZoomableCanvasControlRep initWithLayout:canvas:](&v17, "initWithLayout:canvas:", a3);
  if (v5)
  {
    v6 = -[THWZoomableCanvasController initWithDocumentRoot:]([THWZoomableCanvasController alloc], "initWithDocumentRoot:", objc_msgSend(a4, "documentRoot"));
    v5->_zoomableCanvasController = v6;
    objc_msgSend(-[THWZoomableCanvasControlRep layout](v5, "layout"), "frameInRoot");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(-[THWZoomableCanvasControlRep canvas](v5, "canvas"), "viewScale");
    -[THWZoomableCanvasController createLayerHostIfNeededWithUnscaledFrame:viewScale:](v6, "createLayerHostIfNeededWithUnscaledFrame:viewScale:", v8, v10, v12, v14, v15);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWZoomableCanvasControlRep;
  -[THWZoomableCanvasControlRep dealloc](&v3, "dealloc");
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
  THWZoomableCanvasController *zoomableCanvasController;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THWZoomableCanvasControlRep;
  -[THWZoomableCanvasControlRep updateFromLayout](&v13, "updateFromLayout");
  objc_msgSend(-[THWZoomableCanvasControlRep layout](self, "layout"), "frameInRoot");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  zoomableCanvasController = self->_zoomableCanvasController;
  objc_msgSend(-[THWZoomableCanvasControlRep canvas](self, "canvas"), "viewScale");
  -[THWZoomableCanvasController setUnscaledFrame:viewScale:](zoomableCanvasController, "setUnscaledFrame:viewScale:", v4, v6, v8, v10, v12);
}

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  CALayer *v4;

  v4 = -[THWClippingLayerHost layer](-[THWZoomableCanvasController clippingLayerHost](self->_zoomableCanvasController, "clippingLayerHost"), "layer");
  if (v4)
    objc_msgSend(a3, "addObject:", v4);
}

- (void)addChildViewsToArray:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  THWZoomableCanvasController *zoomableCanvasController;
  double v14;
  TSKScrollView *v15;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasControlRep addChildViewsToArray:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasControl.m"), 89, CFSTR("This operation must only be performed on the main thread."));
  objc_msgSend(-[THWZoomableCanvasControlRep layout](self, "layout"), "frameInRoot");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  zoomableCanvasController = self->_zoomableCanvasController;
  objc_msgSend(-[THWZoomableCanvasControlRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  -[THWZoomableCanvasController createViewIfNeededWithUnscaledFrame:viewScale:](zoomableCanvasController, "createViewIfNeededWithUnscaledFrame:viewScale:", v6, v8, v10, v12, v14);
  v15 = -[THWZoomableCanvasController scrollView](self->_zoomableCanvasController, "scrollView");
  if (v15)
    objc_msgSend(a3, "addObject:", v15);
}

- (id)viewControllerForView:(id)a3
{
  if (-[THWZoomableCanvasController scrollView](self->_zoomableCanvasController, "scrollView") == a3)
    return -[TSDCanvasLayerHosting viewController](-[THWZoomableCanvasController layerHost](self->_zoomableCanvasController, "layerHost"), "viewController");
  else
    return 0;
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWZoomableCanvasControlRep;
  -[THWControlRep willBeRemoved](&v3, "willBeRemoved");
  -[THWZoomableCanvasController teardownController](self->_zoomableCanvasController, "teardownController");
  -[THWZoomableCanvasController setDelegate:](self->_zoomableCanvasController, "setDelegate:", 0);
}

- (void)willRemoveChildView:(id)a3
{
  THWZoomableCanvasController *zoomableCanvasController;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasControlRep willRemoveChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasControl.m"), 127, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
  {
    zoomableCanvasController = self->_zoomableCanvasController;
    if (zoomableCanvasController)
    {
      if (-[THWZoomableCanvasController scrollView](zoomableCanvasController, "scrollView") == a3)
        -[THWZoomableCanvasController teardownView](self->_zoomableCanvasController, "teardownView");
    }
  }
}

- (void)didAddChildView:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasControlRep didAddChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasControl.m"), 139, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
    -[THWZoomableCanvasController didAddView](self->_zoomableCanvasController, "didAddView");
}

- (void)screenScaleDidChange
{
  -[THWZoomableCanvasController screenScaleDidChange](self->_zoomableCanvasController, "screenScaleDidChange");
}

- (THWZoomableCanvasController)zoomableCanvasController
{
  return self->_zoomableCanvasController;
}

@end
