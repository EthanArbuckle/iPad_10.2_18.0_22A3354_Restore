@implementation THWZoomableCanvasController

- (THWZoomableCanvasController)initWithDocumentRoot:(id)a3
{
  uint64_t v4;
  THWZoomableCanvasController *v5;
  uint64_t v6;
  CGPoint origin;
  CGSize size;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWZoomableCanvasController;
  v5 = -[THWZoomableCanvasController init](&v10, "init");
  if (v5)
  {
    v6 = objc_opt_class(THDocumentRoot, v4);
    v5->_documentRoot = (THDocumentRoot *)(id)TSUDynamicCast(v6, a3);
    origin = CGRectNull.origin;
    size = CGRectNull.size;
    v5->_loadedPageRange = (_NSRange)xmmword_3146B0;
    v5->_targetVisibleRect.origin = origin;
    v5->_targetVisibleRect.size = size;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDInteractiveCanvasController setDelegate:](self->_interactiveCanvasController, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THWZoomableCanvasController;
  -[THWZoomableCanvasController dealloc](&v3, "dealloc");
}

- (BOOL)createViewIfNeededWithUnscaledFrame:(CGRect)a3 viewScale:(double)a4
{
  TSKScrollView **p_scrollView;
  TSKScrollView *scrollView;
  double height;
  double width;
  double y;
  double x;
  TSDInteractiveCanvasController **p_interactiveCanvasController;
  TSDCanvasLayerHosting **p_layerHost;
  void *v14;
  void *v15;
  THWClippingLayerHost *clippingLayerHost;

  p_scrollView = &self->_scrollView;
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    p_layerHost = &self->_layerHost;
    v14 = (void *)objc_opt_class(THWZoomableInteractiveCanvasController);
    v15 = (void *)objc_opt_class(THScrollView);
    THCanvasAndScrollViewCreateWithClass(self, (id *)p_interactiveCanvasController, (id *)p_layerHost, p_scrollView, v14, 0, v15);
    clippingLayerHost = self->_clippingLayerHost;
    if (clippingLayerHost)
    {
      -[THWClippingLayerHost setInteractiveCanvasController:](clippingLayerHost, "setInteractiveCanvasController:", 0);
      -[THWClippingLayerHost teardownAndTransferCanvasLayersToHost:](self->_clippingLayerHost, "teardownAndTransferCanvasLayersToHost:", -[THWZoomableCanvasController layerHost](self, "layerHost"));

      self->_clippingLayerHost = 0;
    }
    -[TSDInteractiveCanvasController disableAllGestures](self->_interactiveCanvasController, "disableAllGestures");
    -[THWZoomableCanvasController setUnscaledFrame:viewScale:](self, "setUnscaledFrame:viewScale:", x, y, width, height, a4);
    -[TSKScrollView hideScrollIndicators](self->_scrollView, "hideScrollIndicators");
    -[TSKScrollView setMayPassScrollEventsToNextResponder:](self->_scrollView, "setMayPassScrollEventsToNextResponder:", 1);
    -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](self->_interactiveCanvasController, "setNestedCanvasAllowLayoutAndRenderOnThread:", 0);
    -[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:](self->_interactiveCanvasController, "setAllowLayoutAndRenderOnThread:", 1);
    -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](self->_interactiveCanvasController, "setCreateRepsForOffscreenLayouts:", 1);
    objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](self->_layerHost, "canvasLayer"), "setCenteredInScrollView:", 1);
    -[THWZoomableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  }
  return scrollView == 0;
}

- (BOOL)createLayerHostIfNeededWithUnscaledFrame:(CGRect)a3 viewScale:(double)a4
{
  BOOL v5;
  double height;
  double width;
  double y;
  double x;

  if (self->_scrollView || self->_layerHost || self->_interactiveCanvasController || self->_clippingLayerHost)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_clippingLayerHost, 0);
  v5 = 1;
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](self->_interactiveCanvasController, "setNestedCanvasAllowLayoutAndRenderOnThread:", 1);
  -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](self->_interactiveCanvasController, "setCreateRepsForOffscreenLayouts:", 1);
  -[TSDCanvasLayer setCenteredInScrollView:](-[THWClippingLayerHost canvasLayer](self->_clippingLayerHost, "canvasLayer"), "setCenteredInScrollView:", 1);
  -[THWZoomableCanvasController setUnscaledFrame:viewScale:](self, "setUnscaledFrame:viewScale:", x, y, width, height, a4);
  -[THWZoomableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  return v5;
}

- (void)p_updateWithDelegate
{
  if (self->_delegate)
  {
    -[THWZoomableCanvasController p_rebuildContentSize](self, "p_rebuildContentSize");
    -[THWZoomableCanvasController p_updateContentsScale](self, "p_updateContentsScale");
    if ((objc_opt_respondsToSelector(self->_delegate, "zoomableCanvasControllerCustomizeLayerHost:") & 1) != 0)
      -[THWZoomableCanvasControllerDelegate zoomableCanvasControllerCustomizeLayerHost:](self->_delegate, "zoomableCanvasControllerCustomizeLayerHost:", self);
    -[THWZoomableCanvasController p_rebuildInfos](self, "p_rebuildInfos");
  }
}

- (void)p_updateContentsScale
{
  id v3;

  if (self->_clippingLayerHost)
  {
    v3 = -[TSDInteractiveCanvasController canvas](self->_interactiveCanvasController, "canvas");
    -[THWZoomableCanvasControllerDelegate zoomableCanvasControllerContentsScale:](self->_delegate, "zoomableCanvasControllerContentsScale:", self);
    objc_msgSend(v3, "i_setContentsScale:");
  }
}

- (void)setUnscaledFrame:(CGRect)a3 viewScale:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSKScrollView *scrollView;
  double v13;
  double v14;
  double v15;
  double v16;
  CALayer *v17;
  THWClippingLayerHost *clippingLayerHost;
  double v19;
  double v20;

  v5 = TSDMultiplyRectScalar((__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  scrollView = self->_scrollView;
  if (scrollView)
  {
    -[TSKScrollView frame](scrollView, "frame");
    v14 = v13;
    v16 = v15;
    v17 = (CALayer *)self->_scrollView;
  }
  else
  {
    clippingLayerHost = self->_clippingLayerHost;
    if (!clippingLayerHost)
      return;
    -[CALayer frame](-[THWClippingLayerHost clippingLayer](clippingLayerHost, "clippingLayer"), "frame");
    v14 = v19;
    v16 = v20;
    v17 = -[THWClippingLayerHost clippingLayer](self->_clippingLayerHost, "clippingLayer");
  }
  -[CALayer setFrame:](v17, "setFrame:", v5, v7, v9, v11);
  if (v14 != v9 || v16 != v11)
  {
    -[THWZoomableCanvasController p_rebuildContentSize](self, "p_rebuildContentSize");
    -[THWZoomableCanvasController p_rebuildInfos](self, "p_rebuildInfos");
  }
}

- (void)setDelegate:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  self->_delegate = (THWZoomableCanvasControllerDelegate *)a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_16310C;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[THWZoomableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_163114;
    v4[3] = &unk_427830;
    v4[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)teardownController
{
  -[TSKScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[TSDInteractiveCanvasController teardown](self->_interactiveCanvasController, "teardown");
  -[THWClippingLayerHost teardown](self->_clippingLayerHost, "teardown");
}

- (void)teardownView
{
  -[TSDCanvasLayerHosting teardown](self->_layerHost, "teardown");
}

- (void)invalidateLayers
{
  -[TSDInteractiveCanvasController invalidateLayers](self->_interactiveCanvasController, "invalidateLayers");
}

- (void)p_updateInfosToDisplay
{
  THWZoomableCanvasControllerDelegate *v3;
  THWZoomableCanvasControllerDelegate *v4;
  CGRect v5;
  CGRect v6;

  v3 = -[THWZoomableCanvasController delegate](self, "delegate");
  if (v3)
  {
    v4 = v3;
    -[TSDInteractiveCanvasController visibleBoundsRect](-[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsRect");
    v6 = CGRectUnion(v5, self->_targetVisibleRect);
    -[TSDInteractiveCanvasController setInfosToDisplay:](-[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", -[THWZoomableCanvasControllerDelegate zoomableCanvasController:infosToDisplayForViewport:](v4, "zoomableCanvasController:infosToDisplayForViewport:", self, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height));
  }
}

- (void)p_rebuildContentSize
{
  TSDInteractiveCanvasController *v3;
  TSDInteractiveCanvasController *v4;
  double v5;
  double v6;

  v3 = -[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController");
  if (self->_delegate)
  {
    v4 = v3;
    if (-[TSDInteractiveCanvasController layerHost](v3, "layerHost"))
    {
      -[THWZoomableCanvasControllerDelegate sizeOfCanvasForZoomableCanvasController:](-[THWZoomableCanvasController delegate](self, "delegate"), "sizeOfCanvasForZoomableCanvasController:", self);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](v4, "layerHost"), "canvasLayer"), "setUnscaledSize:", v5, v6);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasLayer"), "fixFrameAndScrollView");
    }
  }
}

- (void)p_rebuildInfos
{
  TSDInteractiveCanvasController *v3;

  v3 = -[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController");
  if (self->_delegate)
  {
    if (-[TSDInteractiveCanvasController layerHost](v3, "layerHost"))
      -[THWZoomableCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  }
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  -[THWZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender");
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4)
    -[THWZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender");
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  return -[THWZoomableCanvasControllerDelegate zoomableCanvasController:geometryProviderForLayout:](-[THWZoomableCanvasController delegate](self, "delegate", a3), "zoomableCanvasController:geometryProviderForLayout:", self, a4);
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  THWZoomableCanvasControllerDelegate *v6;

  v6 = -[THWZoomableCanvasController delegate](self, "delegate", a3, a4, a5);
  if (-[THWZoomableCanvasControllerDelegate conformsToProtocol:](v6, "conformsToProtocol:", a4))
    return v6;
  else
    return 0;
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[THWZoomableCanvasControllerDelegate zoomableCanvasController:expandBoundsForHitTesting:](-[THWZoomableCanvasController delegate](self, "delegate", a3), "zoomableCanvasController:expandBoundsForHitTesting:", self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return -[THWZoomableCanvasControllerDelegate zoomableCanvasController:primaryTargetForGesture:](-[THWZoomableCanvasController delegate](self, "delegate", a3), "zoomableCanvasController:primaryTargetForGesture:", self, a4);
}

- (void)interactiveCanvasControllerDidZoom:(id)a3
{
  THWZoomableCanvasControllerDelegate *v5;

  v5 = -[THWZoomableCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "zoomableCanvasController:didEndZoomingAtScale:") & 1) != 0)
  {
    objc_msgSend(a3, "viewScale");
    -[THWZoomableCanvasControllerDelegate zoomableCanvasController:didEndZoomingAtScale:](v5, "zoomableCanvasController:didEndZoomingAtScale:", self);
  }
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  THWZoomableCanvasControllerDelegate *v4;

  v4 = -[THWZoomableCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector(v4, "zoomableCanvasControllerIsRelatedCanvasScrolling:") & 1) != 0)
    return -[THWZoomableCanvasControllerDelegate zoomableCanvasControllerIsRelatedCanvasScrolling:](v4, "zoomableCanvasControllerIsRelatedCanvasScrolling:", self);
  else
    return 0;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  return !-[THWZoomableCanvasController inResize](self, "inResize");
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  height = a6.height;
  width = a6.width;
  y = a4.y;
  x = a4.x;
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost", a3), "canvasLayer"), "unscaledSize");
  v13 = TSDMultiplySizeScalar(v11, v12, a5);
  if (width <= v13)
    v15 = x;
  else
    v15 = (width - v13) * -0.5;
  if (height <= v14)
    v16 = y;
  else
    v16 = (height - v14) * -0.5;
  result.y = v16;
  result.x = v15;
  return result;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return -[THWZoomableCanvasControllerDelegate zoomableCanvasController:allowsEditMenuForRep:](-[THWZoomableCanvasController delegate](self, "delegate", a3), "zoomableCanvasController:allowsEditMenuForRep:", self, a4);
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (void)setupImmediatePressGesture
{
  id v3;
  id v4;
  id v5;

  if (!self->_immediatePressGesture)
  {
    v3 = objc_alloc((Class)TSWPLongPressGestureRecognizer);
    v4 = -[TSDInteractiveCanvasController gestureDispatcher](-[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher");
    v5 = objc_msgSend(v3, "initWithGestureDispatcher:gestureKind:", v4, TSWPImmediatePress);
    -[THWZoomableCanvasController setImmediatePressGesture:](self, "setImmediatePressGesture:", v5);

    -[TSWPLongPressGestureRecognizer setNumberOfTapsRequired:](-[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture"), "setNumberOfTapsRequired:", 0);
    -[TSWPLongPressGestureRecognizer setNumberOfTouchesRequired:](-[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture"), "setNumberOfTouchesRequired:", 1);
    -[TSWPLongPressGestureRecognizer setMinimumPressDuration:](-[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture"), "setMinimumPressDuration:", 0.0);
    objc_msgSend(objc_msgSend(-[TSDCanvasLayerHosting asiOSCVC](-[THWZoomableCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "viewForGestureRecognizer:", -[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture")), "addGestureRecognizer:", -[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture"));
    objc_msgSend(-[TSDInteractiveCanvasController gestureDispatcher](-[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", -[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture"), -[TSKScrollView panGestureRecognizer](-[THWZoomableCanvasController scrollView](self, "scrollView"), "panGestureRecognizer"), 0);
  }
}

- (BOOL)isZoomedOut
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "canvasLayer");
  -[TSDInteractiveCanvasController viewScale](self->_interactiveCanvasController, "viewScale");
  v5 = v4;
  objc_msgSend(v3, "minimumPinchViewScale");
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (CGPoint)contentOffsetForAnchor:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (!self->_scrollView)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasController contentOffsetForAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasController.m"), 391, CFSTR("current not supported without scrollView"));
  -[TSDInteractiveCanvasController contentOffset](self->_interactiveCanvasController, "contentOffset");
  v7 = v6;
  v9 = v8;
  -[TSDInteractiveCanvasController viewScale](self->_interactiveCanvasController, "viewScale");
  v11 = v10;
  -[TSKScrollView bounds](self->_scrollView, "bounds");
  v13 = v7 + x * v12 / v11;
  v15 = v9 + y * v14 / v11;
  result.y = v15;
  result.x = v13;
  return result;
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 anchor:(CGPoint)a4 viewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6
{
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v6 = a4.x * a6.width / a5;
  v7 = a4.y * a6.height / a5;
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:](self->_interactiveCanvasController, "clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:", a3.x - v6, a3.y - v7, a5, a6.width, a6.height);
  v9 = v6 + v8;
  v11 = v7 + v10;
  result.y = v11;
  result.x = v9;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 anchor:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v11 = -[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost");
  objc_msgSend(objc_msgSend(v11, "clippingLayer"), "bounds");
  v13 = v8 - x * v12 / a3;
  v15 = v7 - y * v14 / a3;
  if (self->_clippingLayerHost)
  {
    -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self->_interactiveCanvasController, "clampedUnscaledContentOffset:forViewScale:", v13, v15, a3);
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend(v11, "canvasLayer");
    -[TSDInteractiveCanvasController setViewScale:](self->_interactiveCanvasController, "setViewScale:", a3);
    objc_msgSend(v20, "fixFrameAndScrollView");
    objc_msgSend(v20, "setFrame:", TSDRectWithSize(objc_msgSend(v20, "bounds")));
    -[THWClippingLayerHost setContentOffset:](self->_clippingLayerHost, "setContentOffset:", TSDMultiplyPointScalar(v17, v19, a3));
  }
  else if (self->_scrollView)
  {
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self->_interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, 0, a3, v13, v15);
  }
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (TSKScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->_layerHost;
}

- (void)setLayerHost:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THWClippingLayerHost)clippingLayerHost
{
  return self->_clippingLayerHost;
}

- (void)setClippingLayerHost:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THWZoomableCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (TSWPLongPressGestureRecognizer)immediatePressGesture
{
  return self->_immediatePressGesture;
}

- (void)setImmediatePressGesture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)inResize
{
  return self->_inResize;
}

- (void)setInResize:(BOOL)a3
{
  self->_inResize = a3;
}

- (NSObject)instanceData
{
  return self->_instanceData;
}

- (void)setInstanceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_NSRange)loadedPageRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_loadedPageRange.length;
  location = self->_loadedPageRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLoadedPageRange:(_NSRange)a3
{
  self->_loadedPageRange = a3;
}

- (CGRect)targetVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetVisibleRect.origin.x;
  y = self->_targetVisibleRect.origin.y;
  width = self->_targetVisibleRect.size.width;
  height = self->_targetVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetVisibleRect:(CGRect)a3
{
  self->_targetVisibleRect = a3;
}

@end
