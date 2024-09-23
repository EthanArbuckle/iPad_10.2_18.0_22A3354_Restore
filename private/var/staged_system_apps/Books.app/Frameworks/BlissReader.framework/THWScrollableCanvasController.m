@implementation THWScrollableCanvasController

- (THWScrollableCanvasController)initWithDocumentRoot:(id)a3
{
  uint64_t v4;
  THWScrollableCanvasController *v5;
  uint64_t v6;
  CGSize size;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWScrollableCanvasController;
  v5 = -[THWScrollableCanvasController init](&v9, "init");
  if (v5)
  {
    v6 = objc_opt_class(THDocumentRoot, v4);
    v5->_documentRoot = (THDocumentRoot *)(id)TSUDynamicCast(v6, a3);
    size = CGRectNull.size;
    v5->_targetVisibleRect.origin = CGRectNull.origin;
    v5->_targetVisibleRect.size = size;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasController;
  -[THWScrollableCanvasController dealloc](&v3, "dealloc");
}

- (void)invalidateViews
{
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (!-[THWScrollableCanvasController scrollView](self, "scrollView"))
      -[THInteractiveCanvasController invalidateRepsIfSynced](self->_interactiveCanvasController, "invalidateRepsIfSynced");
  }
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  THWScrollableCanvasControllerDelegate *v10;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  THScrollView *v25;
  void *v26;
  void *v27;
  THWClippingLayerHost *clippingLayerHost;
  THInteractiveCanvasController *v29;
  id v30;
  uint64_t v31;
  double v32;
  id v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[THWScrollableCanvasController delegate](self, "delegate");
  if (-[THWScrollableCanvasController mainView](self, "mainView")
    || -[THWScrollableCanvasController scrollView](self, "scrollView")
    || -[THWScrollableCanvasController layerHost](self, "layerHost")
    || (-[THWScrollableCanvasControllerDelegate deferViewCreationForScrollableCanvasController:](v10, "deferViewCreationForScrollableCanvasController:", self) & 1) != 0)
  {
    return 0;
  }
  v12 = TSDRoundedRectForMainScreen(x, y, width, height);
  v16 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v12, v13, v14, v15);
  -[THWScrollableCanvasController setStrokeLayer:](self, "setStrokeLayer:", 0);
  -[THWScrollableCanvasControllerDelegate contentInsetsForScrollableCanvasController:](v10, "contentInsetsForScrollableCanvasController:", self);
  v21 = TSDRoundedRectForMainScreen(CGPointZero.x + v20, v17 + CGPointZero.y, width - (v20 + v18), height - (v17 + v19));
  v25 = -[THScrollView initWithFrame:]([THScrollView alloc], "initWithFrame:", v21, v22, v23, v24);
  -[THScrollView setMayPassScrollEventsToNextResponder:](v25, "setMayPassScrollEventsToNextResponder:", 1);
  if ((objc_opt_respondsToSelector(v10, "scrollViewContentInsetForScrollableCanvasController:") & 1) != 0)
  {
    -[THWScrollableCanvasControllerDelegate scrollViewContentInsetForScrollableCanvasController:](v10, "scrollViewContentInsetForScrollableCanvasController:", self);
    -[THScrollView setContentInset:](v25, "setContentInset:");
  }
  -[THScrollView setClipsToBounds:](v25, "setClipsToBounds:", 0);
  -[THScrollView setHandleNaturally:](v25, "setHandleNaturally:", 1);
  -[THScrollView setBounces:](v25, "setBounces:", 1);
  -[THScrollView setAlwaysBounceVertical:](v25, "setAlwaysBounceVertical:", 0);
  -[THScrollView setAlwaysBounceHorizontal:](v25, "setAlwaysBounceHorizontal:", 0);
  -[THWScrollableCanvasController setScrollView:](self, "setScrollView:", v25);
  -[THWScrollableCanvasController setStrokeView:](self, "setStrokeView:", v16);
  -[UIView addSubview:](-[THWScrollableCanvasController strokeView](self, "strokeView"), "addSubview:", -[THWScrollableCanvasController scrollView](self, "scrollView"));
  v26 = (void *)objc_opt_class(THWScrollableInteractiveCanvasController);
  v27 = (void *)objc_opt_class(THWScrollableCanvasViewController);
  THCanvasCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_layerHost, v26, v27);
  clippingLayerHost = self->_clippingLayerHost;
  if (clippingLayerHost)
  {
    -[THWClippingLayerHost setInteractiveCanvasController:](clippingLayerHost, "setInteractiveCanvasController:", 0);
    -[THWClippingLayerHost teardownAndTransferCanvasLayersToHost:](self->_clippingLayerHost, "teardownAndTransferCanvasLayersToHost:", -[THWScrollableCanvasController layerHost](self, "layerHost"));

    self->_clippingLayerHost = 0;
  }
  v29 = -[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController");
  -[THInteractiveCanvasController disableNormalGestures](v29, "disableNormalGestures");
  -[THInteractiveCanvasController enableGestureKinds:](v29, "enableGestureKinds:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", TSWPImmediateSingleTap));
  v30 = objc_msgSend(-[THInteractiveCanvasController layerHost](v29, "layerHost"), "canvasLayer");
  objc_msgSend(v30, "setAllowsPinchZoom:", 0);
  -[TSKScrollView addSubview:](-[THWScrollableCanvasController scrollView](self, "scrollView"), "addSubview:", -[TSDCanvasLayerHosting canvasView](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasView"));
  -[TSKScrollView setDelegate:](-[THWScrollableCanvasController scrollView](self, "scrollView"), "setDelegate:", v29);
  -[THInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](v29, "setNestedCanvasAllowLayoutAndRenderOnThread:", 0);
  -[THInteractiveCanvasController setAllowLayoutAndRenderOnThread:](v29, "setAllowLayoutAndRenderOnThread:", 1);
  -[THInteractiveCanvasController setCreateRepsForOffscreenLayouts:](v29, "setCreateRepsForOffscreenLayouts:", 1);
  v31 = objc_opt_class(THWScrollableCanvasViewController);
  *(_QWORD *)&v32 = TSUDynamicCast(v31, self->_layerHost).n128_u64[0];
  objc_msgSend(v33, "setDelegate:", self, v32);
  -[THWScrollableCanvasController setFrame:scale:](self, "setFrame:scale:", x, y, width, height, a4);
  if ((objc_opt_respondsToSelector(v10, "centeredInScrollViewForScrollableCanvasController:") & 1) != 0)
  {
    if (-[THWScrollableCanvasControllerDelegate centeredInScrollViewForScrollableCanvasController:](v10, "centeredInScrollViewForScrollableCanvasController:", self))objc_msgSend(v30, "setCenteredInScrollView:", 1);
  }
  -[THWScrollableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  -[THWScrollableCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  return 1;
}

- (id)canvasViewController
{
  uint64_t v3;

  v3 = objc_opt_class(THWScrollableCanvasViewController, a2);
  return (id)TSUDynamicCast(v3, self->_layerHost);
}

- (void)p_updateWithDelegate
{
  THWScrollableCanvasControllerDelegate *delegate;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  delegate = self->_delegate;
  if (delegate)
  {
    if ((objc_opt_respondsToSelector(delegate, "scrollableCanvasController:customizeLayerHost:") & 1) != 0)
      -[THWScrollableCanvasControllerDelegate scrollableCanvasController:customizeLayerHost:](self->_delegate, "scrollableCanvasController:customizeLayerHost:", self, -[THInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"));
    -[THWScrollableCanvasController p_updateContentsScale](self, "p_updateContentsScale");
    -[THWScrollableCanvasController p_rebuild](self, "p_rebuild");
    -[THInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
    -[THWScrollableCanvasController frame](self, "frame");
    -[THWScrollableCanvasController insetFrame:](self, "insetFrame:");
    v5 = v4;
    v7 = v6;
    if ((objc_opt_respondsToSelector(-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:allowsPinchZoomForFrameSize:") & 1) != 0)
    {
      -[THWScrollableCanvasControllerDelegate scrollableCanvasController:allowsPinchZoomForFrameSize:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:allowsPinchZoomForFrameSize:", self, v5, v7);
      if (v8 != 0.0)
      {
        -[THWScrollableCanvasControllerDelegate scrollableCanvasController:minViewScaleForFrameSize:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:minViewScaleForFrameSize:", self, v5, v7);
        v10 = v9;
        -[THWScrollableCanvasControllerDelegate scrollableCanvasController:maxViewScaleForFrameSize:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:maxViewScaleForFrameSize:", self, v5, v7);
        v12 = v11;
        objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 1);
        objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setMinimumPinchViewScale:", v10);
        objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setMaximumPinchViewScale:", v12);
      }
    }
  }
}

- (void)p_updateContentsScale
{
  id v3;

  if (self->_clippingLayerHost)
  {
    v3 = -[THInteractiveCanvasController canvas](self->_interactiveCanvasController, "canvas");
    -[THWScrollableCanvasControllerDelegate contentsScaleForScrollableCanvasController:](self->_delegate, "contentsScaleForScrollableCanvasController:", self);
    objc_msgSend(v3, "i_setContentsScale:");
  }
}

- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  BOOL v10;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[THWScrollableCanvasController scrollView](self, "scrollView")
    || -[THWScrollableCanvasController layerHost](self, "layerHost")
    || -[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController")
    || -[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"))
  {
    return 0;
  }
  v12 = (void *)objc_opt_class(THWScrollableInteractiveCanvasController);
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_clippingLayerHost, v12);
  v10 = 1;
  -[THInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setNestedCanvasAllowLayoutAndRenderOnThread:", 1);
  -[THInteractiveCanvasController setCreateRepsForOffscreenLayouts:](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setCreateRepsForOffscreenLayouts:", 1);
  -[THWScrollableCanvasController setFrame:scale:](self, "setFrame:scale:", x, y, width, height, a4);
  -[THWScrollableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  -[THWScrollableCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  return v10;
}

- (BOOL)p_shouldUseOverlayScrollerOnly
{
  if ((objc_opt_respondsToSelector(self->_delegate, "scrollableCanvasControllerUseOverlayScrollerOnly:") & 1) != 0)
    return -[THWScrollableCanvasControllerDelegate scrollableCanvasControllerUseOverlayScrollerOnly:](self->_delegate, "scrollableCanvasControllerUseOverlayScrollerOnly:", self);
  else
    return 0;
}

- (void)setupImmediatePressGestureWithSimultaneousGestures:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[THInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"))
  {
    v5 = TSWPImmediatePress;
    -[THInteractiveCanvasController enableGestureKinds:](self->_interactiveCanvasController, "enableGestureKinds:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", TSWPImmediatePress));
    v6 = -[THInteractiveCanvasController gestureRecognizerWithKind:](self->_interactiveCanvasController, "gestureRecognizerWithKind:", v5);
    objc_msgSend(-[THInteractiveCanvasController gestureDispatcher](self->_interactiveCanvasController, "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", v6, -[TSKScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"), 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(a3);
          objc_msgSend(-[THInteractiveCanvasController gestureDispatcher](self->_interactiveCanvasController, "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", v6, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), 0);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_msgSend(-[THInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "setUserInteractionEnabled:", a3);
  -[TSKScrollView setUserInteractionEnabled:](self->_scrollView, "setUserInteractionEnabled:", v3);
  -[TSKScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v3);
  -[UIView setUserInteractionEnabled:](-[THWScrollableCanvasController mainView](self, "mainView"), "setUserInteractionEnabled:", v3);
}

- (BOOL)userInteractionEnabled
{
  return objc_msgSend(-[THInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "isUserInteractionEnabled");
}

- (CGSize)p_scrollViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[THInteractiveCanvasController viewScale](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  v4 = v3;
  -[THWScrollableCanvasControllerDelegate sizeOfCanvasForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "sizeOfCanvasForScrollableCanvasController:", self);
  v7 = TSDMultiplySizeScalar(v5, v6, v4);
  v8 = TSDRoundedSize(v7);
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)insetFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THWScrollableCanvasControllerDelegate contentInsetsForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "contentInsetsForScrollableCanvasController:", self);
  v11 = TSDRoundedRectForMainScreen(x + v10, y + v7, width - (v10 + v8), height - (v7 + v9));
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3 scale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
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
  THWScrollableCanvasControllerDelegate *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGRect v69;
  CGRect v70;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = TSDRoundedRectForMainScreen(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v65 = v11;
  v66 = v10;
  v63 = v13;
  v64 = v12;
  -[THWScrollableCanvasControllerDelegate contentInsetsForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "contentInsetsForScrollableCanvasController:", self);
  v15 = v14;
  v17 = v16;
  v68 = v18;
  v20 = v19;
  if ((objc_opt_respondsToSelector(-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:viewScaleForFrameSize:withScale:") & 1) != 0)
  {
    v21 = -[THWScrollableCanvasController delegate](self, "delegate");
    -[THWScrollableCanvasController insetFrame:](self, "insetFrame:", x, y, width, height);
    -[THWScrollableCanvasControllerDelegate scrollableCanvasController:viewScaleForFrameSize:withScale:](v21, "scrollableCanvasController:viewScaleForFrameSize:withScale:", self, v22, v23, a4);
    v67 = v24;
  }
  else
  {
    v67 = a4;
  }
  if (-[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"))
  {
    v25 = TSDRoundedRectForMainScreen(x + v17, y + v15, width - (v17 + v20), height - (v15 + v68));
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CALayer bounds](-[THWClippingLayerHost clippingLayer](-[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"), "clippingLayer"), "bounds");
    v33 = v32;
    v35 = v34;
    -[THWClippingLayerHost setFrame:](-[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"), "setFrame:", v25, v27, v29, v31);
    -[CALayer bounds](-[THWClippingLayerHost clippingLayer](-[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"), "clippingLayer"), "bounds");
    if (v33 != v37 || v35 != v36)
    {
      -[THInteractiveCanvasController setViewScale:andScrollViewFrame:maintainPosition:animated:](self->_interactiveCanvasController, "setViewScale:andScrollViewFrame:maintainPosition:animated:", 1, 0, v67, v25, v27, v29, v31);
      -[THWScrollableCanvasController p_rebuild](self, "p_rebuild");
    }
  }
  else if (-[THWScrollableCanvasController mainView](self, "mainView")
         && -[THWScrollableCanvasController scrollView](self, "scrollView")
         && +[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[UIView frame](-[THWScrollableCanvasController mainView](self, "mainView"), "frame");
    v70.origin.x = v38;
    v70.origin.y = v39;
    v70.size.width = v40;
    v70.size.height = v41;
    v69.origin.y = v65;
    v69.origin.x = v66;
    v69.size.height = v63;
    v69.size.width = v64;
    if (!CGRectEqualToRect(v69, v70))
      goto LABEL_16;
    -[THInteractiveCanvasController viewScale](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    if (v42 != v67 && vabdd_f64(v42, v67) >= fabs(v67 * 0.000000999999997))
      goto LABEL_16;
    -[TSKScrollView contentSize](-[THWScrollableCanvasController scrollView](self, "scrollView"), "contentSize");
    v44 = v43;
    v46 = v45;
    v47 = -[THWScrollableCanvasController p_scrollViewContentSize](self, "p_scrollViewContentSize");
    if ((TSDNearlyEqualSizes(v47, v44, v46, v48, v49) & 1) == 0)
    {
LABEL_16:
      if ((objc_opt_respondsToSelector(-[THWScrollableCanvasController delegate](self, "delegate"), "maintainScrollOffsetInFrameChangeForScrollableCanvasController:") & 1) != 0&& !-[THWScrollableCanvasControllerDelegate maintainScrollOffsetInFrameChangeForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "maintainScrollOffsetInFrameChangeForScrollableCanvasController:", self))
      {
        v52 = 0;
        v59 = 0;
        v61 = 0;
      }
      else
      {
        -[THInteractiveCanvasController contentOffset](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "contentOffset");
        v59 = v51;
        v61 = v50;
        v52 = 1;
      }
      -[UIView setFrame:](-[THWScrollableCanvasController mainView](self, "mainView", v59, v61), "setFrame:", v66, v65, v64, v63);
      TSDRoundedRectForView(-[THWScrollableCanvasController mainView](self, "mainView"), CGPointZero.x, CGPointZero.y, width - (v17 + v20), height - (v15 + v68));
      v54 = v53;
      v56 = v55;
      v57 = TSDRoundedPointForView(-[THWScrollableCanvasController mainView](self, "mainView"), v17, v15);
      -[THInteractiveCanvasController setViewScale:andScrollViewFrame:maintainPosition:animated:](self->_interactiveCanvasController, "setViewScale:andScrollViewFrame:maintainPosition:animated:", 1, 0, v67, v57, v58, v54, v56);
      -[THWScrollableCanvasController p_rebuild](self, "p_rebuild");
      if (v52)
        -[THInteractiveCanvasController setContentOffset:animated:](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setContentOffset:animated:", 0, v62, v60);
    }
  }
}

- (CGRect)frame
{
  UIView *clippingLayerHost;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  clippingLayerHost = (UIView *)self->_clippingLayerHost;
  if (!clippingLayerHost)
    clippingLayerHost = -[THWScrollableCanvasController mainView](self, "mainView");
  -[UIView frame](clippingLayerHost, "frame");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setDelegate:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  self->_delegate = (THWScrollableCanvasControllerDelegate *)a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_185664;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[THWScrollableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_18566C;
    v4[3] = &unk_427830;
    v4[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)teardownController
{
  -[THInteractiveCanvasController teardown](self->_interactiveCanvasController, "teardown");
  -[THWClippingLayerHost teardown](self->_clippingLayerHost, "teardown");
}

- (void)teardownView
{
  -[TSKScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[TSDCanvasLayerHosting teardown](self->_layerHost, "teardown");
}

- (void)invalidateLayers
{
  -[THInteractiveCanvasController invalidateLayers](self->_interactiveCanvasController, "invalidateLayers");
}

- (void)invalidateLayoutsAndFrames
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_msgSend(-[THInteractiveCanvasController layoutController](self->_interactiveCanvasController, "layoutController"), "rootLayout");
  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v2, "addLayoutsToArray:", v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(TSDLayout);
        *(_QWORD *)&v11 = TSUDynamicCast(v9, v8).n128_u64[0];
        if (v10)
        {
          v12 = v10;
          objc_msgSend(v10, "invalidateFrame", v11);
          objc_msgSend(v12, "invalidateChildren");
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11);
    }
    while (v5);
  }

}

- (void)p_updateInfosToDisplay
{
  THWScrollableCanvasControllerDelegate *v3;
  THWScrollableCanvasControllerDelegate *v4;
  unsigned int v5;
  THInteractiveCanvasController *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = -[THWScrollableCanvasController delegate](self, "delegate");
  if (v3)
  {
    v4 = v3;
    v5 = -[THWScrollableCanvasControllerDelegate infosChangeForViewportChangeInScrollableCanvasController:](v3, "infosChangeForViewportChangeInScrollableCanvasController:", self);
    v6 = -[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController");
    if (!objc_msgSend(-[THInteractiveCanvasController infosToDisplay](v6, "infosToDisplay"), "count") || v5)
    {
      -[THWScrollableCanvasController targetVisibleRect](self, "targetVisibleRect");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[THInteractiveCanvasController visibleBoundsRect](v6, "visibleBoundsRect");
      v22.origin.x = v15;
      v22.origin.y = v16;
      v22.size.width = v17;
      v22.size.height = v18;
      v20.origin.x = v8;
      v20.origin.y = v10;
      v20.size.width = v12;
      v20.size.height = v14;
      v21 = CGRectUnion(v20, v22);
      v19 = -[THWScrollableCanvasControllerDelegate scrollableCanvasController:infosToDisplayForViewport:](v4, "scrollableCanvasController:infosToDisplayForViewport:", self, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
      if ((objc_msgSend(v19, "isEqualToArray:", -[THInteractiveCanvasController infosToDisplay](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "infosToDisplay")) & 1) == 0)-[THInteractiveCanvasController setInfosToDisplay:](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", v19);
    }
  }
}

- (void)addAlternateLayersToArray:(id)a3
{
  CALayer *v5;
  CALayer *v6;

  v5 = -[THWClippingLayerHost layer](-[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"), "layer");
  if (v5)
  {
    objc_msgSend(a3, "addObject:", v5);
    v6 = -[THWScrollableCanvasController strokeLayer](self, "strokeLayer");
    if (v6)
      objc_msgSend(a3, "addObject:", v6);
  }
}

- (void)p_addStrokeLayer
{
  id v3;
  CALayer *v4;

  v3 = -[THWScrollableCanvasControllerDelegate strokeLayerForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "strokeLayerForScrollableCanvasController:", self);
  -[CALayer removeFromSuperlayer](-[THWScrollableCanvasController strokeLayer](self, "strokeLayer"), "removeFromSuperlayer");
  -[THWScrollableCanvasController setStrokeLayer:](self, "setStrokeLayer:", v3);
  if (-[THWScrollableCanvasController strokeView](self, "strokeView"))
  {
    if (v3)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      -[CALayer setMasksToBounds:](-[UIView layer](-[THWScrollableCanvasController strokeView](self, "strokeView"), "layer"), "setMasksToBounds:", 0);
      -[CALayer addSublayer:](-[UIView layer](-[THWScrollableCanvasController strokeView](self, "strokeView"), "layer"), "addSublayer:", v3);
      +[CATransaction commit](CATransaction, "commit");
    }
  }
  else
  {
    v4 = -[THWClippingLayerHost layer](-[THWScrollableCanvasController clippingLayerHost](self, "clippingLayerHost"), "layer");
    if (v4)
    {
      -[CALayer position](v4, "position");
      objc_msgSend(v3, "setPosition:");
    }
  }
}

- (void)p_rebuild
{
  -[THWScrollableCanvasController p_rebuildUpdateInfos:](self, "p_rebuildUpdateInfos:", 1);
}

- (void)p_rebuildUpdateInfos:(BOOL)a3
{
  _BOOL4 v3;
  THInteractiveCanvasController *v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  v5 = -[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController");
  if (-[THWScrollableCanvasController delegate](self, "delegate") && v5)
  {
    -[THWScrollableCanvasControllerDelegate sizeOfCanvasForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "sizeOfCanvasForScrollableCanvasController:", self);
    objc_msgSend(objc_msgSend(-[THInteractiveCanvasController layerHost](v5, "layerHost"), "canvasLayer"), "setUnscaledSize:", v6, v7);
    if (-[THWScrollableCanvasController scrollView](self, "scrollView"))
    {
      -[THWScrollableCanvasControllerDelegate contentInsetsForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate"), "contentInsetsForScrollableCanvasController:", self);
      -[TSKScrollView setScrollIndicatorInsets:](-[THWScrollableCanvasController scrollView](self, "scrollView"), "setScrollIndicatorInsets:", 4.0, 0.0, 0.0, 2.0 - v8);
    }
    if (v3)
      -[THWScrollableCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
    -[THWScrollableCanvasController p_addStrokeLayer](self, "p_addStrokeLayer");
    objc_msgSend(objc_msgSend(-[THInteractiveCanvasController layerHost](v5, "layerHost"), "canvasLayer"), "fixFrameAndScrollView");
    if ((objc_opt_respondsToSelector(-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:customizeLayerHost:") & 1) != 0)-[THWScrollableCanvasControllerDelegate scrollableCanvasController:customizeLayerHost:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:customizeLayerHost:", self, -[THInteractiveCanvasController layerHost](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"));
  }
}

- (BOOL)editorAllowsKeyboard
{
  return 0;
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWScrollableWPEditingController, a2);
}

- (BOOL)allowSearchBook
{
  return 0;
}

- (BOOL)editorAllowsHyperlinkInteraction
{
  return 0;
}

- (BOOL)allowCopy
{
  return objc_msgSend(-[THWScrollableCanvasControllerDelegate scrollableCanvasHost](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasHost"), "scrollableCanvasAllowCopy");
}

- (id)titleOfCurrentNavigationUnit
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasController titleOfCurrentNavigationUnit]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasController.m"), 807, CFSTR("not yet implemented"));
  return 0;
}

- (id)activityItemProviderWithCachedAnnotation:(id)a3
{
  return objc_msgSend(-[THWScrollableCanvasControllerDelegate scrollableCanvasHost](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasHost"), "scrollableCanvasActivityItemProviderWithCachedAnnotation:", a3);
}

- (void)presentSearchResultsForString:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasController presentSearchResultsForString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasController.m"), 818, CFSTR("not yet implemented"));
}

- (void)interactiveCanvasControllerWasTapped:(id)a3
{
  objc_msgSend(-[THWScrollableCanvasControllerDelegate scrollableCanvasHost](-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasHost"), "scrollableCanvasViewControllerDidReceiveBackgroundTap:", self);
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  return -[THWScrollableCanvasControllerDelegate scrollableCanvasController:actionForHyperlink:inRep:gesture:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:actionForHyperlink:inRep:gesture:", self, a3, a4, a5);
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  -[THWScrollableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    if (-[THWScrollableCanvasController updateInfosOnScroll](self, "updateInfosOnScroll"))
      -[THWScrollableCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  }
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4)
    -[THWScrollableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    if (-[THWScrollableCanvasController updateInfosOnScroll](self, "updateInfosOnScroll"))
      -[THWScrollableCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  }
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  return -[THWScrollableCanvasControllerDelegate scrollableCanvasController:geometryProviderForLayout:](-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasController:geometryProviderForLayout:", self, a4);
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  THWScrollableCanvasControllerDelegate *v6;

  v6 = -[THWScrollableCanvasController delegate](self, "delegate", a3, a4, a5);
  if (-[THWScrollableCanvasControllerDelegate conformsToProtocol:](v6, "conformsToProtocol:", a4))
    return v6;
  else
    return 0;
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  if (self->_updateCanvasSizeOnLayout)
    -[THWScrollableCanvasController p_rebuildUpdateInfos:](self, "p_rebuildUpdateInfos:", 0);
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
    -[THWScrollableCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[THWScrollableCanvasControllerDelegate scrollableCanvasController:expandBoundsForHitTesting:](-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasController:expandBoundsForHitTesting:", self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return -[THWScrollableCanvasControllerDelegate scrollableCanvasController:primaryTargetForGesture:](-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasController:primaryTargetForGesture:", self, a4);
}

- (BOOL)shouldResizeCanvasToScrollView
{
  return 1;
}

- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds
{
  return 1;
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
  objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](-[THWScrollableCanvasController layerHost](self, "layerHost", a3), "canvasLayer"), "unscaledSize");
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

- (id)interactiveCanvasController:(id)a3 maskLayerForBounds:(CGRect)a4
{
  return -[THWScrollableCanvasControllerDelegate maskLayerForScrollableCanvasController:](-[THWScrollableCanvasController delegate](self, "delegate", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "maskLayerForScrollableCanvasController:", self);
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return -[THWScrollableCanvasControllerDelegate scrollableCanvasController:allowsEditMenuForRep:](-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasController:allowsEditMenuForRep:", self, a4);
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return -[THWScrollableCanvasControllerDelegate scrollableCanvasController:shouldBeginEditingTHWPRep:withGesture:](-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasController:shouldBeginEditingTHWPRep:withGesture:", self, a4, a5);
}

- (BOOL)interactiveCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  THWScrollableCanvasControllerDelegate *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v8 = -[THWScrollableCanvasController delegate](self, "delegate", a3);
  v9 = objc_opt_class(TSDRep);
  *(_QWORD *)&v10 = TSUDynamicCast(v9, a5).n128_u64[0];
  return -[THWScrollableCanvasControllerDelegate scrollableCanvasController:allowsHyperlinkWithGesture:forRep:](v8, "scrollableCanvasController:allowsHyperlinkWithGesture:forRep:", self, a4, v11, v10);
}

- (BOOL)allowSelectionPopover
{
  return -[THWScrollableCanvasControllerDelegate allowSelectionPopover](-[THWScrollableCanvasController delegate](self, "delegate"), "allowSelectionPopover");
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  THWScrollableCanvasControllerDelegate *v4;

  v4 = -[THWScrollableCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector(v4, "isRelatedCanvasScrollingForScrollableCanvasController:") & 1) != 0)
    return -[THWScrollableCanvasControllerDelegate isRelatedCanvasScrollingForScrollableCanvasController:](v4, "isRelatedCanvasScrollingForScrollableCanvasController:", self);
  else
    return 0;
}

- (BOOL)shouldPopKnobsOutsideEnclosingScrollView
{
  return 1;
}

- (void)selectionDidChange
{
  if (objc_msgSend(objc_msgSend(-[THInteractiveCanvasController editorController](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), "selection"))
  {
    -[THInteractiveCanvasController resumeEditing](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "resumeEditing");
  }
}

- (id)bookNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "bookNavigatorForScrollableCanvasController:") & 1) != 0)
    return -[THWScrollableCanvasControllerDelegate bookNavigatorForScrollableCanvasController:](self->_delegate, "bookNavigatorForScrollableCanvasController:", self);
  else
    return 0;
}

- (id)documentNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "documentNavigatorForScrollableCanvasController:") & 1) != 0)
    return -[THWScrollableCanvasControllerDelegate documentNavigatorForScrollableCanvasController:](self->_delegate, "documentNavigatorForScrollableCanvasController:", self);
  else
    return 0;
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
  -[THInteractiveCanvasController contentOffset](self->_interactiveCanvasController, "contentOffset");
  v7 = v6;
  v9 = v8;
  -[THInteractiveCanvasController viewScale](self->_interactiveCanvasController, "viewScale");
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
  -[THInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:](self->_interactiveCanvasController, "clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:", a3.x - v6, a3.y - v7, a5, a6.width, a6.height);
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
  double v11;
  double v12;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  -[TSKScrollView bounds](self->_scrollView, "bounds");
  -[THInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self->_interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, 0, a3, v8 - x * v11 / a3, v7 - y * v12 / a3);
  -[THWScrollableCanvasController p_rebuild](self, "p_rebuild");
}

- (void)didAddView
{
  if ((objc_opt_respondsToSelector(-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:customizeLayerHost:") & 1) != 0)-[THWScrollableCanvasControllerDelegate scrollableCanvasController:customizeLayerHost:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasController:customizeLayerHost:", self, -[THInteractiveCanvasController layerHost](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"));
}

- (void)p_scaleToFitWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[TSKScrollView frame](-[THWScrollableCanvasController scrollView](self, "scrollView"), "frame");
  v4 = v3;
  objc_msgSend(-[THInteractiveCanvasController canvas](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "unscaledSize");
  v6 = v4 / v5;
  if (v6 < 1.0
    || (-[THInteractiveCanvasController viewScale](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale"), vabdd_f64(v6, v7) >= 0.00999999978))
  {
    -[THInteractiveCanvasController setViewScale:](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setViewScale:", v6);
  }
}

- (void)displayModeDidChange:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
  {
    -[THWScrollableCanvasController p_scaleToFitWidth](self, "p_scaleToFitWidth");
  }
  else if (!a3)
  {
    -[THInteractiveCanvasController setViewScale:](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController", v3, v4), "setViewScale:", 1.0);
  }
}

- (CGSize)unscaledContentSizeForFillScreen
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[THInteractiveCanvasController canvas](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "unscaledSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)disableCanvasInteraction
{
  objc_msgSend(-[TSDCanvasLayerHosting canvasView](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasView"), "setUserInteractionEnabled:", 0);
}

- (void)p_updateRasterizeOnLayer
{
  void *clippingLayerHost;
  id v4;

  clippingLayerHost = self->_clippingLayerHost;
  if (!clippingLayerHost)
    clippingLayerHost = self->_strokeView;
  v4 = objc_msgSend(clippingLayerHost, "layer");
  objc_msgSend(-[THInteractiveCanvasController canvas](self->_interactiveCanvasController, "canvas"), "contentsScale");
  objc_msgSend(v4, "setRasterizationScale:");
  objc_msgSend(v4, "setShouldRasterize:", self->_rasterize);
  objc_msgSend(v4, "spi_setPreloadsCache:", self->_rasterize);
}

- (void)setRasterize:(BOOL)a3
{
  if (self->_rasterize != a3)
  {
    self->_rasterize = a3;
    -[THWScrollableCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  }
}

- (BOOL)canvasViewControllerShouldShowScaleFeedback:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWScrollableCanvasController delegate](self, "delegate", a3), "scrollableCanvasControllerShouldShowScaleFeedback:") & 1) != 0)return -[THWScrollableCanvasControllerDelegate scrollableCanvasControllerShouldShowScaleFeedback:](-[THWScrollableCanvasController delegate](self, "delegate"), "scrollableCanvasControllerShouldShowScaleFeedback:", self);
  else
    return 1;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSKScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THWScrollableCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)updateInfosOnScroll
{
  return self->_updateInfosOnScroll;
}

- (void)setUpdateInfosOnScroll:(BOOL)a3
{
  self->_updateInfosOnScroll = a3;
}

- (NSObject)instanceData
{
  return self->_instanceData;
}

- (void)setInstanceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)rasterize
{
  return self->_rasterize;
}

- (BOOL)updateCanvasSizeOnLayout
{
  return self->_updateCanvasSizeOnLayout;
}

- (void)setUpdateCanvasSizeOnLayout:(BOOL)a3
{
  self->_updateCanvasSizeOnLayout = a3;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->_layerHost;
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

- (UIView)strokeView
{
  return self->_strokeView;
}

- (void)setStrokeView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (CALayer)strokeLayer
{
  return self->_strokeLayer;
}

- (void)setStrokeLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (THWClippingLayerHost)clippingLayerHost
{
  return self->_clippingLayerHost;
}

- (double)scrollerPadding
{
  return self->_scrollerPadding;
}

- (void)setScrollerPadding:(double)a3
{
  self->_scrollerPadding = a3;
}

@end
