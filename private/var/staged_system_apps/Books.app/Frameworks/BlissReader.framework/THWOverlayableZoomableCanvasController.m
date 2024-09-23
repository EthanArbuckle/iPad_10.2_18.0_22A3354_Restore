@implementation THWOverlayableZoomableCanvasController

- (UIView)view
{
  return self->_containerView;
}

- (UIViewController)viewController
{
  return self->_containerViewController;
}

- (CALayer)alternateLayerForView
{
  if (self->_containerView)
    return 0;
  else
    return self->_containerLayer;
}

- (CALayer)layer
{
  UIView *containerView;

  containerView = self->_containerView;
  if (containerView)
    return -[UIView layer](containerView, "layer");
  else
    return self->_containerLayer;
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TSKScrollView contentInset](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "contentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[TSKScrollView setContentInset:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (CGPoint)contentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[TSDInteractiveCanvasController contentOffset](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "contentOffset");
  v4 = v3;
  v6 = v5;
  -[TSDInteractiveCanvasController viewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "viewScale");
  v8 = TSDMultiplyPointScalar(v4, v6, v7);
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGRect)contentViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[TSDCanvasLayerHosting canvasView](self->mScrollContentLayerHost, "canvasView"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGAffineTransform)contentViewTransform
{
  CGFloat v4;

  -[TSDInteractiveCanvasController viewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "viewScale");
  return CGAffineTransformMakeScale(retstr, v4, v4);
}

- (BOOL)isScrollEnabled
{
  return -[TSKScrollView isScrollEnabled](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "isScrollEnabled");
}

- (void)setScrollEnabled:(BOOL)a3
{
  -[TSKScrollView setScrollEnabled:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setScrollEnabled:", a3);
}

- (THWOverlayableZoomableCanvasController)init
{
  return -[THWOverlayableZoomableCanvasController initWithFrame:documentRoot:delegate:](self, "initWithFrame:documentRoot:delegate:", 0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (THWOverlayableZoomableCanvasController)initWithFrame:(CGRect)a3 documentRoot:(id)a4 delegate:(id)a5
{
  THWOverlayableZoomableCanvasController *v7;
  THWOverlayableZoomableCanvasController *v8;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)THWOverlayableZoomableCanvasController;
  v7 = -[THWOverlayableZoomableCanvasController init](&v15, "init", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    -[THWOverlayableZoomableCanvasController setTargetVisibleRect:](v7, "setTargetVisibleRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v8->mUniformScale = _Q0;
    v8->_documentRoot = (TSKDocumentRoot *)a4;
    v8->_delegate = (THWOverlayableZoomableCanvasControllerDelegate *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->mScrollContainerLayerHost = 0;
  -[TSDInteractiveCanvasController setDelegate:](self->mScrollContainerICC, "setDelegate:", 0);

  self->mScrollContainerICC = 0;
  self->mScrollContentLayerHost = 0;
  -[TSDInteractiveCanvasController setDelegate:](self->mScrollContentICC, "setDelegate:", 0);

  self->mScrollContentICC = 0;
  self->mScrollView = 0;

  self->_documentRoot = 0;
  self->mContainerClippingLayerHost = 0;

  self->mContentClippingLayerHost = 0;
  self->_backgroundView = 0;

  self->_backgroundLayer = 0;
  self->_containerView = 0;

  self->_containerViewController = 0;
  self->_containerLayer = 0;

  self->mChildViewControllers = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWOverlayableZoomableCanvasController;
  -[THWOverlayableZoomableCanvasController dealloc](&v3, "dealloc");
}

- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3
{
  TSDInteractiveCanvasController **p_mScrollContainerICC;
  THWClippingLayerHost **p_mContainerClippingLayerHost;
  BOOL v6;
  double height;
  double width;
  double y;
  double x;
  CALayer *v12;
  id v13;
  THWClippingLayerHost *mContainerClippingLayerHost;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;

  p_mScrollContainerICC = &self->mScrollContainerICC;
  if (self->mScrollContainerICC)
    return 0;
  p_mContainerClippingLayerHost = &self->mContainerClippingLayerHost;
  if (self->mContainerClippingLayerHost
    || self->mScrollContentICC
    || self->mContentClippingLayerHost
    || self->_containerLayer)
  {
    return 0;
  }
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
  self->_containerLayer = v12;
  -[CALayer setFrame:](v12, "setFrame:", x, y, width, height);
  v6 = 1;
  -[CALayer setMasksToBounds:](self->_containerLayer, "setMasksToBounds:", 1);
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)p_mScrollContainerICC, p_mContainerClippingLayerHost, 0);
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](self->mScrollContainerICC, "setNestedCanvasAllowLayoutAndRenderOnThread:", 1);
  v13 = -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](self->mScrollContainerICC, "setCreateRepsForOffscreenLayouts:", 1);
  mContainerClippingLayerHost = self->mContainerClippingLayerHost;
  v15 = TSDRectWithSize(v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[THWClippingLayerHost setFrame:](mContainerClippingLayerHost, "setFrame:");
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->mScrollContentICC, &self->mContentClippingLayerHost, 0);
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](self->mScrollContentICC, "setNestedCanvasAllowLayoutAndRenderOnThread:", 1);
  -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](self->mScrollContentICC, "setCreateRepsForOffscreenLayouts:", 1);
  -[THWClippingLayerHost setFrame:](self->mContentClippingLayerHost, "setFrame:", v15, v17, v19, v21);
  -[CALayer setMasksToBounds:](-[THWClippingLayerHost clippingLayer](self->mContentClippingLayerHost, "clippingLayer"), "setMasksToBounds:", 0);
  v22 = -[TSDInteractiveCanvasController canvas](self->mScrollContainerICC, "canvas");
  -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasControllerContentsScale:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasControllerContentsScale:", self);
  objc_msgSend(v22, "i_setContentsScale:");
  v23 = -[TSDInteractiveCanvasController canvas](self->mScrollContentICC, "canvas");
  -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasControllerContentsScale:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasControllerContentsScale:", self);
  objc_msgSend(v23, "i_setContentsScale:");
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](self, "setNaturalFrame:scale:", x, y, width, height, 1.0);
  -[THWOverlayableZoomableCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  -[THWOverlayableZoomableCanvasController p_updateSubviewsOrLayers](self, "p_updateSubviewsOrLayers");
  return v6;
}

- (void)p_updateSubviewsOrLayers
{
  THScrollView *mScrollView;
  NSArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *mChildViewControllers;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CALayer *backgroundLayer;
  _QWORD v29[2];
  _BYTE v30[128];
  _BYTE v31[128];
  _QWORD v32[3];

  if (self->_containerView)
  {
    mScrollView = self->mScrollView;
    v32[0] = self->_backgroundView;
    v32[1] = mScrollView;
    v32[2] = -[TSDInteractiveCanvasController canvasView](self->mScrollContainerICC, "canvasView");
    v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3);
    v5 = -[NSArray copy](-[UIView subviews](self->_containerView, "subviews"), "copy");
    if (!-[NSArray isEqualToArray:](v4, "isEqualToArray:", v5))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9), "removeFromSuperview");
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        }
        while (v7);
      }
      mChildViewControllers = self->mChildViewControllers;
      if (mChildViewControllers)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildViewControllers, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(mChildViewControllers);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14), "removeFromParentViewController");
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildViewControllers, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          }
          while (v12);
        }
        -[NSMutableArray removeAllObjects](self->mChildViewControllers, "removeAllObjects");
      }
      else
      {
        self->mChildViewControllers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      }
      v16 = -[TSDCanvasLayerHosting viewController](self->mScrollContentLayerHost, "viewController");
      if (v16)
      {
        v17 = v16;
        -[UIViewController addChildViewController:](self->_containerViewController, "addChildViewController:", v16);
        -[NSMutableArray addObject:](self->mChildViewControllers, "addObject:", v17);
      }
      v18 = -[TSDCanvasLayerHosting viewController](self->mScrollContainerLayerHost, "viewController");
      if (v18)
      {
        v19 = v18;
        -[UIViewController addChildViewController:](self->_containerViewController, "addChildViewController:", v18);
        -[NSMutableArray addObject:](self->mChildViewControllers, "addObject:", v19);
      }
      -[UIView addSubview:](self->_containerView, "addSubview:", self->_backgroundView);
      -[UIView addSubview:](self->_containerView, "addSubview:", self->mScrollView);
      -[UIView addSubview:](self->_containerView, "addSubview:", -[TSDInteractiveCanvasController canvasView](self->mScrollContainerICC, "canvasView"));
    }

  }
  else if (self->_containerLayer && self->_backgroundLayer)
  {
    v29[0] = -[THWClippingLayerHost layer](self->mContentClippingLayerHost, "layer");
    v29[1] = -[THWClippingLayerHost layer](self->mContainerClippingLayerHost, "layer");
    v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2);
    if (self->_backgroundLayer)
    {
      backgroundLayer = self->_backgroundLayer;
      v15 = -[NSArray arrayByAddingObjectsFromArray:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &backgroundLayer, 1), "arrayByAddingObjectsFromArray:", v15);
    }
    if (!-[NSArray isEqualToArray:](v15, "isEqualToArray:", -[CALayer sublayers](self->_containerLayer, "sublayers")))
      -[CALayer setSublayers:](self->_containerLayer, "setSublayers:", v15);
  }
}

- (void)screenScaleDidChange
{
  id v3;
  id v4;

  v3 = -[TSDInteractiveCanvasController canvas](self->mScrollContainerICC, "canvas");
  -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasControllerContentsScale:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasControllerContentsScale:", self);
  objc_msgSend(v3, "i_setContentsScale:");
  v4 = -[TSDInteractiveCanvasController canvas](self->mScrollContentICC, "canvas");
  -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasControllerContentsScale:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasControllerContentsScale:", self);
  objc_msgSend(v4, "i_setContentsScale:");
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](self, "setNaturalFrame:scale:", self->mNaturalFrame.origin.x, self->mNaturalFrame.origin.y, self->mNaturalFrame.size.width, self->mNaturalFrame.size.height, self->mUniformScale);
}

- (void)p_updateRasterizeOnLayer
{
  THWClippingLayerHost *mContainerClippingLayerHost;
  CALayer *v4;
  CALayer *v5;

  mContainerClippingLayerHost = self->mContainerClippingLayerHost;
  if (mContainerClippingLayerHost)
    v4 = -[THWClippingLayerHost clippingLayer](mContainerClippingLayerHost, "clippingLayer");
  else
    v4 = -[UIView layer](-[THWOverlayableZoomableCanvasController view](self, "view"), "layer");
  v5 = v4;
  objc_msgSend(-[TSDInteractiveCanvasController canvas](self->mScrollContainerICC, "canvas"), "contentsScale");
  -[CALayer setRasterizationScale:](v5, "setRasterizationScale:");
  -[CALayer setShouldRasterize:](v5, "setShouldRasterize:", self->_rasterize);
  -[CALayer spi_setPreloadsCache:](v5, "spi_setPreloadsCache:", self->_rasterize);
}

- (void)setRasterize:(BOOL)a3
{
  if (self->_rasterize != a3)
  {
    self->_rasterize = a3;
    -[THWOverlayableZoomableCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  }
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3
{
  TSDCanvasLayerHosting **p_mScrollContainerLayerHost;
  TSDCanvasLayerHosting **p_mScrollContentLayerHost;
  double height;
  double width;
  double y;
  double x;
  UIView *v11;
  UIViewController *v12;
  void *v13;
  THWClippingLayerHost *mContainerClippingLayerHost;
  void *v15;
  void *v16;
  THWClippingLayerHost *mContentClippingLayerHost;
  CGSize size;
  THWOverlayableZoomableBackgroundView *v19;
  THWOverlayableZoomableBackgroundView *v20;

  p_mScrollContainerLayerHost = &self->mScrollContainerLayerHost;
  if (self->mScrollContainerLayerHost)
    return 0;
  p_mScrollContentLayerHost = &self->mScrollContentLayerHost;
  if (self->mScrollContentLayerHost)
    return 0;
  if (self->_containerView)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((-[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasControllerDeferViewCreation:](self->_delegate, "overlayableZoomableCanvasControllerDeferViewCreation:", self) & 1) != 0)return 0;
  v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
  self->_containerView = v11;
  -[UIView setClipsToBounds:](v11, "setClipsToBounds:", 1);
  v12 = (UIViewController *)objc_alloc_init((Class)UIViewController);
  self->_containerViewController = v12;
  -[UIViewController setView:](v12, "setView:", self->_containerView);
  v13 = (void *)objc_opt_class(TSWPInteractiveCanvasController);
  THCanvasCreateWithClass(self, (id *)&self->mScrollContainerICC, p_mScrollContainerLayerHost, v13, 0);
  -[TSDInteractiveCanvasController disableAllGestures](self->mScrollContainerICC, "disableAllGestures");
  objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](self->mScrollContainerLayerHost, "canvasLayer"), "setName:", CFSTR("scrollContainerCanvas"));
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "setNestedCanvasAllowLayoutAndRenderOnThread:", 0);
  -[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "setAllowLayoutAndRenderOnThread:", 1);
  -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "setCreateRepsForOffscreenLayouts:", 1);
  mContainerClippingLayerHost = self->mContainerClippingLayerHost;
  if (mContainerClippingLayerHost)
  {
    -[THWClippingLayerHost setInteractiveCanvasController:](mContainerClippingLayerHost, "setInteractiveCanvasController:", 0);
    -[THWClippingLayerHost teardownAndTransferCanvasLayersToHost:](self->mContainerClippingLayerHost, "teardownAndTransferCanvasLayersToHost:", self->mScrollContainerLayerHost);

    self->mContainerClippingLayerHost = 0;
  }
  v15 = (void *)objc_opt_class(THWOverlayableZoomableInteractiveCanvasController);
  v16 = (void *)objc_opt_class(THScrollView);
  THCanvasAndScrollViewCreateWithClass(self, (id *)&self->mScrollContentICC, (id *)p_mScrollContentLayerHost, &self->mScrollView, v15, 0, v16);
  -[TSDInteractiveCanvasController disableAllGestures](self->mScrollContentICC, "disableAllGestures");
  objc_msgSend(objc_msgSend(-[TSDCanvasLayerHosting canvasView](self->mScrollContentLayerHost, "canvasView"), "layer"), "setName:", CFSTR("scrollContentCanvas"));
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->mScrollContentICC, "canvasView"), "layer"), "setMasksToBounds:", 0);
  -[THWOverlayableZoomableCanvasController p_updateScrollViewWithDelegate](self, "p_updateScrollViewWithDelegate");
  -[TSKScrollView hideScrollIndicators](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "hideScrollIndicators");
  objc_msgSend(-[TSKScrollView layer](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "layer"), "setName:", CFSTR("scrollView"));
  -[TSKScrollView setBackgroundColor:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[TSKScrollView setDecelerationRate:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setDecelerationRate:", UIScrollViewDecelerationRateFast);
  -[TSKScrollView setClipsToBounds:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setClipsToBounds:", 0);
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "setNestedCanvasAllowLayoutAndRenderOnThread:", 0);
  -[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "setAllowLayoutAndRenderOnThread:", 1);
  -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "setCreateRepsForOffscreenLayouts:", 1);
  mContentClippingLayerHost = self->mContentClippingLayerHost;
  if (mContentClippingLayerHost)
  {
    -[THWClippingLayerHost setInteractiveCanvasController:](mContentClippingLayerHost, "setInteractiveCanvasController:", 0);
    -[THWClippingLayerHost teardownAndTransferCanvasLayersToHost:](self->mContentClippingLayerHost, "teardownAndTransferCanvasLayersToHost:", self->mScrollContentLayerHost);

    self->mContentClippingLayerHost = 0;
  }

  self->_containerLayer = 0;
  size = CGRectNull.size;
  self->mNaturalFrame.origin = CGRectNull.origin;
  self->mNaturalFrame.size = size;
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](self, "setNaturalFrame:scale:", x, y, width, height, 1.0);
  -[THWOverlayableZoomableCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  v19 = [THWOverlayableZoomableBackgroundView alloc];
  v20 = -[THWOverlayableZoomableBackgroundView initWithFrame:](v19, "initWithFrame:", TSDRectWithSize(v19));
  self->_backgroundView = v20;
  -[THLayerContainingView setAllowLayerDelegate:](v20, "setAllowLayerDelegate:", 1);
  if (self->_backgroundLayer)
    -[THLayerContainingView addSublayer:](self->_backgroundView, "addSublayer:");
  -[THWOverlayableZoomableCanvasController p_updateSubviewsOrLayers](self, "p_updateSubviewsOrLayers");
  return 1;
}

- (void)setNaturalFrame:(CGRect)a3 scale:(double)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double mUniformScale;
  double v24;
  double v25;
  BOOL v26;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  TSDInteractiveCanvasController *mScrollContentICC;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_containerView)
  {
    memset(&v56, 0, sizeof(v56));
    CGAffineTransformMakeScale(&v56, a4, a4);
    v55 = v56;
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    v58 = CGRectApplyAffineTransform(v57, &v55);
    v53 = a4;
    v10 = width;
    v11 = v58.origin.x;
    v12 = v58.origin.y;
    v13 = v58.size.width;
    v14 = height;
    v15 = v58.size.height;
    objc_msgSend(-[TSDInteractiveCanvasController canvas](self->mScrollContainerICC, "canvas"), "contentsScale");
    v54 = TSDRoundedRectForScale(v11, v12, v13, v15, v16);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = v10;
    v52 = v14;
    v61.size.height = v14;
    if (!CGRectEqualToRect(self->mNaturalFrame, v61)
      || (mUniformScale = self->mUniformScale, mUniformScale != v53)
      && vabdd_f64(mUniformScale, v53) >= fabs(v53 * 0.000000999999997)
      || ((-[UIView frame](self->_containerView, "frame"), v54 == v25) ? (v26 = v18 == v24) : (v26 = 0), !v26))
    {
      if (-[TSDInteractiveCanvasController animatingViewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "animatingViewScale"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWOverlayableZoomableCanvasController setNaturalFrame:scale:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWOverlayableZoomableCanvasController.m"), 478, CFSTR("shouldn't set frame or scale while animating view scale"));
      +[CATransaction begin](CATransaction, "begin");
      self->mNaturalFrame.origin.x = x;
      self->mNaturalFrame.origin.y = y;
      self->mNaturalFrame.size.width = v10;
      self->mNaturalFrame.size.height = v14;
      self->mUniformScale = v53;
      v27 = TSDRectWithSize(-[UIView setFrame:](self->_containerView, "setFrame:", v54, v18, v20, v22));
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[THWOverlayableZoomableBackgroundView setFrame:](self->_backgroundView, "setFrame:");
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "layerHost"), "canvasLayer"), "setUnscaledSize:", v10, v52);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "layerHost"), "canvasLayer"), "setViewScale:", v53);
      -[TSDInteractiveCanvasController contentOffset](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "contentOffset");
      v35 = v34;
      v37 = v36;
      -[TSKScrollView setFrame:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setFrame:", v27, v29, v31, v33);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "canvasLayer"), "setViewScale:", self->mUniformScale * self->mContentScale);
      -[TSDInteractiveCanvasController setContentOffset:animated:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "setContentOffset:animated:", 0, v35, v37);
      -[THWOverlayableZoomableCanvasController p_rebuild](self, "p_rebuild");
LABEL_19:
      +[CATransaction commit](CATransaction, "commit");
    }
  }
  else if (self->mContainerClippingLayerHost)
  {
    if (!CGRectEqualToRect(self->mNaturalFrame, a3)
      || (v38 = self->mUniformScale, v38 != a4) && vabdd_f64(v38, a4) >= fabs(a4 * 0.000000999999997))
    {
      if (-[TSDInteractiveCanvasController animatingViewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "animatingViewScale"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWOverlayableZoomableCanvasController setNaturalFrame:scale:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWOverlayableZoomableCanvasController.m"), 510, CFSTR("shouldn't set frame or scale while animating view scale"));
      +[CATransaction begin](CATransaction, "begin");
      self->mNaturalFrame.origin.x = x;
      self->mNaturalFrame.origin.y = y;
      self->mNaturalFrame.size.width = width;
      self->mNaturalFrame.size.height = height;
      self->mUniformScale = a4;
      memset(&v56, 0, sizeof(v56));
      CGAffineTransformMakeScale(&v56, a4, a4);
      v55 = v56;
      v59.origin.x = x;
      v59.origin.y = y;
      v59.size.width = width;
      v59.size.height = height;
      v60 = CGRectApplyAffineTransform(v59, &v55);
      v39 = width;
      -[CALayer setFrame:](self->_containerLayer, "setFrame:", v60.origin.x, v60.origin.y);
      -[TSDCanvasLayer setUnscaledSize:](-[THWClippingLayerHost canvasLayer](self->mContainerClippingLayerHost, "canvasLayer"), "setUnscaledSize:", width, height);
      v40 = TSDRectWithSize(-[TSDCanvasLayer setViewScale:](-[THWClippingLayerHost canvasLayer](self->mContainerClippingLayerHost, "canvasLayer"), "setViewScale:", a4));
      v42 = v41;
      v44 = v43;
      v46 = v45;
      -[CALayer setFrame:](-[THWClippingLayerHost clippingLayer](self->mContainerClippingLayerHost, "clippingLayer"), "setFrame:", v40, v41, v43, v45);
      mScrollContentICC = self->mScrollContentICC;
      -[THWClippingLayerHost contentOffset](self->mContentClippingLayerHost, "contentOffset");
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mScrollContentICC, "convertBoundsToUnscaledPoint:");
      v49 = v48;
      v51 = v50;
      -[TSDCanvasLayer setUnscaledSize:](-[THWClippingLayerHost canvasLayer](self->mContentClippingLayerHost, "canvasLayer"), "setUnscaledSize:", v39, height);
      -[TSDCanvasLayer setViewScale:](-[THWClippingLayerHost canvasLayer](self->mContentClippingLayerHost, "canvasLayer"), "setViewScale:", self->mUniformScale * self->mContentScale);
      -[CALayer setFrame:](-[THWClippingLayerHost clippingLayer](self->mContentClippingLayerHost, "clippingLayer"), "setFrame:", v40, v42, v44, v46);
      -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mScrollContentICC, "convertUnscaledToBoundsPoint:", v49, v51);
      -[THWClippingLayerHost setContentOffset:](self->mContentClippingLayerHost, "setContentOffset:");
      -[THWOverlayableZoomableCanvasController p_rebuild](self, "p_rebuild");
      goto LABEL_19;
    }
  }
}

- (void)p_setViewScale:(double)a3 contentOffset:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  THWClippingLayerHost *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  y = a4.y;
  x = a4.x;
  v10 = -[THWOverlayableZoomableCanvasController contentClippingLayerHost](self, "contentClippingLayerHost");
  -[CALayer bounds](-[THWClippingLayerHost clippingLayer](v10, "clippingLayer"), "bounds");
  v12 = v11;
  v14 = v13;
  -[TSDInteractiveCanvasController setViewScale:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "setViewScale:", a3);
  v15 = -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "convertUnscaledToBoundsPoint:", x, y);
  v18 = TSDRectWithOriginAndSize(v15, v16, v17, v12, v14);
  -[CALayer setBounds:](-[THWClippingLayerHost clippingLayer](v10, "clippingLayer"), "setBounds:", v18, v19, v20, v21);
  if (a5)
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (CGPoint)p_clampContentOffset:(CGPoint)a3 forViewScale:(double)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  THWOverlayableZoomableCanvasControllerDelegate *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  CGPoint result;

  y = a3.y;
  v35 = a3.y;
  x = a3.x;
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "clippingLayer"), "bounds");
  v10 = TSDMultiplySizeScalar(v8, v9, 1.0 / self->mUniformScale);
  v12 = v11;
  v13 = -[THWOverlayableZoomableCanvasController delegate](self, "delegate");
  v14 = TSDRectWithOriginAndSize(v13, x, y, v10, v12);
  -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:contentInsetsForViewScale:viewportBounds:](v13, "overlayableZoomableCanvasController:contentInsetsForViewScale:viewportBounds:", self, a4, v14, v15, v16, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "canvasLayer"), "unscaledSize");
  v28 = v25 + v21 - v21 + TSDMultiplySizeScalar(v26, v27, a4) - v10;
  if (v28 >= -v21)
    v30 = v28;
  else
    v30 = -v21;
  if (v23 + v19 - v19 + v29 - v12 >= -v19)
    v31 = v23 + v19 - v19 + v29 - v12;
  else
    v31 = -v19;
  v32 = TSUClamp(x, -v21, v30);
  v33 = TSUClamp(v35, -v19, v31);
  v34 = v32;
  result.y = v33;
  result.x = v34;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animationDuration:(double)a5 completion:(id)a6
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;

  self->mContentScale = a3;
  v10 = self->mUniformScale * a3;
  -[THWOverlayableZoomableCanvasController p_clampContentOffset:forViewScale:](self, "p_clampContentOffset:forViewScale:", a4.x, a4.y, a3);
  v14 = TSDMultiplyPointScalar(v11, v12, 1.0 / a3);
  v15 = v13;
  if (self->mScrollView)
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:forceAnimation:completion:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "setViewScale:contentOffset:clampOffset:animationDuration:forceAnimation:completion:", 0, a5 > 0.0, a6, v10, v14, v13, a5);
  else
    -[THWOverlayableZoomableCanvasController p_setViewScale:contentOffset:completion:](self, "p_setViewScale:contentOffset:completion:", a6, v10, v14, v13);
  self->mAnimatingToViewScale = v10;
  self->mAnimatingToContentOffset.x = TSDMultiplyPointScalar(v14, v15, v10);
  self->mAnimatingToContentOffset.y = v16;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](-[THWOverlayableZoomableCanvasController view](self, "view"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDelegate:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  self->_delegate = (THWOverlayableZoomableCanvasControllerDelegate *)a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_171CC8;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[THWOverlayableZoomableCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_171CD0;
    v4[3] = &unk_427830;
    v4[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)p_updateScrollViewWithDelegate
{
  THWOverlayableZoomableCanvasControllerDelegate *delegate;

  delegate = self->_delegate;
  if (delegate && self->mScrollView)
  {
    if ((objc_opt_respondsToSelector(delegate, "overlayableZoomableCanvasController:shouldDisableScrollingAtContentEdgesForScrollView:") & 1) != 0)-[THScrollView setMayPassScrollEventsToNextResponder:](self->mScrollView, "setMayPassScrollEventsToNextResponder:", -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:shouldDisableScrollingAtContentEdgesForScrollView:](self->_delegate, "overlayableZoomableCanvasController:shouldDisableScrollingAtContentEdgesForScrollView:", self, self->mScrollView));
    if ((objc_opt_respondsToSelector(self->_delegate, "overlayableZoomableCanvasController:shouldDisableScrollingWhenCursorIsHiddenForScrollView:") & 1) != 0)-[THScrollView setShouldDisableScrollingWhenCursorIsHidden:](self->mScrollView, "setShouldDisableScrollingWhenCursorIsHidden:", -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:shouldDisableScrollingWhenCursorIsHiddenForScrollView:](self->_delegate, "overlayableZoomableCanvasController:shouldDisableScrollingWhenCursorIsHiddenForScrollView:", self, self->mScrollView));
  }
}

- (void)p_updateWithDelegate
{
  if (self->_delegate)
  {
    -[THWOverlayableZoomableCanvasController p_updateScrollViewWithDelegate](self, "p_updateScrollViewWithDelegate");
    -[THWOverlayableZoomableCanvasController p_rebuild](self, "p_rebuild");
  }
}

- (void)teardownController
{
  -[TSDInteractiveCanvasController teardown](self->mScrollContainerICC, "teardown");
  -[TSDInteractiveCanvasController teardown](self->mScrollContentICC, "teardown");
  -[THWClippingLayerHost teardown](self->mContainerClippingLayerHost, "teardown");
  -[THWClippingLayerHost teardown](self->mContentClippingLayerHost, "teardown");
}

- (void)teardownView
{
  NSMutableArray *mChildViewControllers;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mChildViewControllers = self->mChildViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildViewControllers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mChildViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "removeFromParentViewController");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildViewControllers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->mChildViewControllers = 0;
  -[TSKScrollView setDelegate:](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "setDelegate:", 0);
  -[TSDCanvasLayerHosting teardown](self->mScrollContentLayerHost, "teardown");
  -[TSDCanvasLayerHosting teardown](self->mScrollContainerLayerHost, "teardown");

  self->_documentRoot = 0;
}

- (void)invalidateLayers
{
  -[TSDInteractiveCanvasController invalidateLayers](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "invalidateLayers");
  -[TSDInteractiveCanvasController invalidateLayers](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "invalidateLayers");
}

- (void)p_updateInfosToDisplay:(id)a3 forICC:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v6 = objc_msgSend(a4, "infosToDisplay");
  v7 = objc_msgSend(a3, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
LABEL_7:
    objc_msgSend(a4, "setInfosToDisplay:", a3);
    return;
  }
  v8 = objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(a3, "objectAtIndexedSubscript:", v10);
      if (v11 != objc_msgSend(v6, "objectAtIndexedSubscript:", v10))
        break;
      if (v9 == (id)++v10)
        return;
    }
    goto LABEL_7;
  }
}

- (void)p_updateContentInfosToDisplay
{
  double x;
  double y;
  double width;
  double height;
  THWOverlayableZoomableCanvasControllerDelegate *v7;
  TSKScrollView *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[THWOverlayableZoomableCanvasController delegate](self, "delegate");
  if (v7)
  {
    v8 = -[THWOverlayableZoomableCanvasController scrollView](self, "scrollView");
    if (v8)
    {
      -[TSKScrollView tsk_bounds](v8, "tsk_bounds");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[THWOverlayableZoomableCanvasController targetVisibleRect](self, "targetVisibleRect");
      v23.origin.x = v17;
      v23.origin.y = v18;
      v23.size.width = v19;
      v23.size.height = v20;
      v21.origin.x = v10;
      v21.origin.y = v12;
      v21.size.width = v14;
      v21.size.height = v16;
      v22 = CGRectUnion(v21, v23);
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
    }
  }
  -[THWOverlayableZoomableCanvasController p_updateInfosToDisplay:forICC:](self, "p_updateInfosToDisplay:forICC:", -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:infosToDisplayForContentViewport:](v7, "overlayableZoomableCanvasController:infosToDisplayForContentViewport:", self, x, y, width, height), -[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"));
}

- (void)p_updateContainerInfosToDisplay
{
  -[THWOverlayableZoomableCanvasController p_updateInfosToDisplay:forICC:](self, "p_updateInfosToDisplay:forICC:", -[THWOverlayableZoomableCanvasControllerDelegate infosToDisplayForContainerInOverlayableZoomableCanvasController:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "infosToDisplayForContainerInOverlayableZoomableCanvasController:", self), -[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"));
}

- (void)p_rebuild
{
  TSDInteractiveCanvasController *v3;
  THWOverlayableZoomableCanvasControllerDelegate *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_delegate)
  {
    v3 = -[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC");
    v4 = -[THWOverlayableZoomableCanvasController delegate](self, "delegate");
    if (v4)
    {
      -[THWOverlayableZoomableCanvasControllerDelegate sizeOfContentCanvasForOverlayableZoomableCanvasController:](v4, "sizeOfContentCanvasForOverlayableZoomableCanvasController:", self);
      v6 = v5;
      v8 = v7;
    }
    else
    {
      -[THWOverlayableZoomableCanvasController frame](self, "frame");
      v6 = v9;
      v8 = v10;
    }
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](v3, "layerHost"), "canvasLayer"), "setUnscaledSize:", v6, v8);
    -[THWOverlayableZoomableCanvasController p_updateContentInfosToDisplay](self, "p_updateContentInfosToDisplay");
    -[THWOverlayableZoomableCanvasController p_updateContainerInfosToDisplay](self, "p_updateContainerInfosToDisplay");
  }
}

- (void)setAllowsPinchZoom:(BOOL)a3
{
  objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](self->mScrollContentLayerHost, "canvasLayer"), "setAllowsPinchZoom:", a3);
}

- (BOOL)allowsPinchZoom
{
  return objc_msgSend(-[TSDCanvasLayerHosting canvasLayer](self->mScrollContentLayerHost, "canvasLayer"), "allowsPinchZoom");
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  -[THWOverlayableZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0
    && -[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC") == a3)
  {
    -[THWOverlayableZoomableCanvasController p_updateContentInfosToDisplay](self, "p_updateContentInfosToDisplay");
  }
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4)
    -[THWOverlayableZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:interactiveCanvasControllerDidScroll:") & 1) != 0)-[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:interactiveCanvasControllerDidScroll:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:interactiveCanvasControllerDidScroll:", self, a3);
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0
    && -[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC") == a3)
  {
    -[THWOverlayableZoomableCanvasController p_updateContentInfosToDisplay](self, "p_updateContentInfosToDisplay");
  }
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  return -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:geometryProviderForLayout:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "overlayableZoomableCanvasController:geometryProviderForLayout:", self, a4);
}

- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4
{
  if (-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC") == a3
    && (objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:registeredLayoutInContainerICC:") & 1) != 0)
  {
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:registeredLayoutInContainerICC:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:registeredLayoutInContainerICC:", self, a4);
  }
}

- (void)interactiveCanvasController:(id)a3 layoutUnregistered:(id)a4
{
  if (-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC") == a3
    && (objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:unregisteredLayoutInContainerICC:") & 1) != 0)
  {
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:unregisteredLayoutInContainerICC:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:unregisteredLayoutInContainerICC:", self, a4);
  }
}

- (void)interactiveCanvasController:(id)a3 willLayoutRep:(id)a4
{
  if ((objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "overlayableZoomableCanvasController:willLayoutRep:") & 1) != 0)-[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:willLayoutRep:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:willLayoutRep:", self, a4);
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  THWOverlayableZoomableCanvasControllerDelegate *v6;

  v6 = -[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3, a4, a5);
  if (-[THWOverlayableZoomableCanvasControllerDelegate conformsToProtocol:](v6, "conformsToProtocol:", a4))return v6;
  else
    return 0;
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    if (-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC") == a3)
      -[THWOverlayableZoomableCanvasController p_updateContentInfosToDisplay](self, "p_updateContentInfosToDisplay");
    else
      -[THWOverlayableZoomableCanvasController p_updateContainerInfosToDisplay](self, "p_updateContainerInfosToDisplay");
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->mScrollContainerICC == a3)
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  else
  {
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:expandBoundsForHitTesting:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:expandBoundsForHitTesting:", self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:primaryTargetForGesture:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "overlayableZoomableCanvasController:primaryTargetForGesture:", self, a4);
}

- (void)interactiveCanvasControllerWillZoom:(id)a3
{
  THWOverlayableZoomableCanvasControllerDelegate *v5;

  -[THWOverlayableZoomableCanvasController setZooming:](self, "setZooming:", 1);
  v5 = -[THWOverlayableZoomableCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "overlayableZoomableCanvasController:willZoomAtScale:") & 1) != 0)
  {
    objc_msgSend(a3, "viewScale");
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:willZoomAtScale:](v5, "overlayableZoomableCanvasController:willZoomAtScale:", self);
  }
}

- (void)interactiveCanvasControllerDidZoom:(id)a3
{
  THWOverlayableZoomableCanvasControllerDelegate *v5;

  v5 = -[THWOverlayableZoomableCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "overlayableZoomableCanvasController:didEndZoomingAtScale:") & 1) != 0)
  {
    objc_msgSend(a3, "viewScale");
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:didEndZoomingAtScale:](v5, "overlayableZoomableCanvasController:didEndZoomingAtScale:", self);
  }
  -[THWOverlayableZoomableCanvasController setZooming:](self, "setZooming:", 0);
}

- (BOOL)interactiveCanvasControllerShouldResampleImages:(id)a3
{
  return -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasControllerShouldResampleImages:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "overlayableZoomableCanvasControllerShouldResampleImages:", self);
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:allowsEditMenuForRep:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "overlayableZoomableCanvasController:allowsEditMenuForRep:", self, a4);
}

- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  if ((objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "overlayableZoomableCanvasController:canvasViewShouldBecomeFirstResponder:") & 1) != 0)-[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:canvasViewShouldBecomeFirstResponder:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "overlayableZoomableCanvasController:canvasViewShouldBecomeFirstResponder:", self, a4);
  return 0;
}

- (id)visibleBoundsClipViewForInteractiveCanvasController:(id)a3
{
  return self->_containerView;
}

- (id)additionalGestureTargetsForInteractiveCanvasController:(id)a3 gesture:(id)a4
{
  if ((objc_opt_respondsToSelector(-[THWOverlayableZoomableCanvasController delegate](self, "delegate", a3), "additionalGestureTargetsForZoomableCanvasController:gesture:") & 1) != 0)return -[THWOverlayableZoomableCanvasControllerDelegate additionalGestureTargetsForZoomableCanvasController:gesture:](-[THWOverlayableZoomableCanvasController delegate](self, "delegate"), "additionalGestureTargetsForZoomableCanvasController:gesture:", self, a4);
  else
    return 0;
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
  TSDInteractiveCanvasController *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC");
  v4 = TSWPImmediatePress;
  v9 = TSWPImmediatePress;
  -[TSDInteractiveCanvasController enableGestureKinds:](v3, "enableGestureKinds:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v5 = -[TSDInteractiveCanvasController gestureDispatcher](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "gestureDispatcher");
  v6 = objc_opt_class(UIGestureRecognizer);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, -[TSDInteractiveCanvasController gestureWithKind:](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "gestureWithKind:", v4)).n128_u64[0];
  objc_msgSend(v5, "allowSimultaneousRecognitionByRecognizers:", v8, -[TSKScrollView panGestureRecognizer](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView", v7), "panGestureRecognizer"), 0);
}

- (BOOL)isDragging
{
  return -[TSKScrollView isDragging](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "isDragging");
}

- (BOOL)isZooming
{
  return -[THWOverlayableZoomableCanvasController zooming](self, "zooming");
}

- (BOOL)isZoomedOut
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "canvasView"), "canvasLayer");
  -[TSDInteractiveCanvasController viewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "viewScale");
  v5 = v4;
  objc_msgSend(v3, "minimumPinchViewScale");
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (void)setBackgroundLayer:(id)a3
{
  CALayer *backgroundLayer;
  CALayer *v6;

  backgroundLayer = self->_backgroundLayer;
  if (backgroundLayer != a3)
  {
    if (backgroundLayer)
    {
      -[THLayerContainingView removeSublayer:](self->_backgroundView, "removeSublayer:");

      self->_backgroundLayer = 0;
    }
    if (a3)
    {
      v6 = (CALayer *)a3;
      self->_backgroundLayer = v6;
      -[THLayerContainingView addSublayer:](self->_backgroundView, "addSublayer:", v6);
    }
    -[THWOverlayableZoomableCanvasController p_updateSubviewsOrLayers](self, "p_updateSubviewsOrLayers");
  }
}

- (CGAffineTransform)p_contentBoundsToUnscaledTransform
{
  double mAnimatingToViewScale;

  if (-[TSDInteractiveCanvasController animatingViewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "animatingViewScale"))mAnimatingToViewScale = self->mAnimatingToViewScale;
  else
    -[TSDInteractiveCanvasController viewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "viewScale");
  return CGAffineTransformMakeScale(retstr, 1.0 / mAnimatingToViewScale, 1.0 / mAnimatingToViewScale);
}

- (CGAffineTransform)p_contentUnscaledToBoundsTransform
{
  CGAffineTransform v5;

  if (self)
    -[THWOverlayableZoomableCanvasController p_contentBoundsToUnscaledTransform](self, "p_contentBoundsToUnscaledTransform");
  else
    memset(&v5, 0, sizeof(v5));
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGAffineTransform)p_contentBoundsToContainerBoundsTransform
{
  double x;
  double y;

  if (-[TSDInteractiveCanvasController animatingViewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "animatingViewScale"))
  {
    x = self->mAnimatingToContentOffset.x;
    y = self->mAnimatingToContentOffset.y;
  }
  else if (-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"))
  {
    -[TSKScrollView contentOffset](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "contentOffset");
  }
  else
  {
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "clippingLayer"), "bounds");
  }
  return CGAffineTransformMakeTranslation(retstr, -x, -y);
}

- (CGAffineTransform)p_containerBoundsToContentBoundsTransform
{
  CGAffineTransform v5;

  if (self)
    -[THWOverlayableZoomableCanvasController p_contentBoundsToContainerBoundsTransform](self, "p_contentBoundsToContainerBoundsTransform");
  else
    memset(&v5, 0, sizeof(v5));
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGPoint)unscaledContainerPointFromUnscaledContentPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  TSDInteractiveCanvasController *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self)
  {
    -[THWOverlayableZoomableCanvasController p_contentUnscaledToBoundsTransform](self, "p_contentUnscaledToBoundsTransform");
    v7 = *((double *)&v23 + 1);
    v6 = *(double *)&v23;
    v9 = *((double *)&v24 + 1);
    v8 = *(double *)&v24;
    v11 = *((double *)&v25 + 1);
    v10 = *(double *)&v25;
    -[THWOverlayableZoomableCanvasController p_contentBoundsToContainerBoundsTransform](self, "p_contentBoundsToContainerBoundsTransform");
    v12 = v20;
    v13 = v21;
    v14 = v22;
  }
  else
  {
    v14 = 0uLL;
    v24 = 0u;
    v25 = 0u;
    v6 = 0.0;
    v8 = 0.0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = 0.0;
    v7 = 0.0;
    v9 = 0.0;
    v11 = 0.0;
    v12 = 0uLL;
    v13 = 0uLL;
  }
  v15 = -[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC", vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v11 + y * v9 + v7 * x), v12, v10 + y * v8 + v6 * x)), *(_OWORD *)&v20, *(_OWORD *)&v21, *(_OWORD *)&v22, v23, v24, v25);
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v15, "convertBoundsToUnscaledPoint:", v18, v19);
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)scaledContainerPointFromUnscaledContentPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[THWOverlayableZoomableCanvasController unscaledContainerPointFromUnscaledContentPoint:](self, "unscaledContainerPointFromUnscaledContentPoint:", a3.x, a3.y);
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "convertUnscaledToBoundsPoint:", v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)unscaledContentRectFromUnscaledContainerRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "convertUnscaledToBoundsRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (self)
    -[THWOverlayableZoomableCanvasController p_containerBoundsToContentBoundsTransform](self, "p_containerBoundsToContentBoundsTransform");
  else
    memset(&v17, 0, sizeof(v17));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v19 = CGRectApplyAffineTransform(v18, &v17);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (self)
    -[THWOverlayableZoomableCanvasController p_contentBoundsToUnscaledTransform](self, "p_contentBoundsToUnscaledTransform");
  else
    memset(&v16, 0, sizeof(v16));
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  return CGRectApplyAffineTransform(v20, &v16);
}

- (CGRect)scaledContentRectFromUnscaledContainerRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGAffineTransform v12;
  CGRect v13;

  -[THWOverlayableZoomableCanvasController unscaledContentRectFromUnscaledContainerRect:](self, "unscaledContentRectFromUnscaledContainerRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (self)
    -[THWOverlayableZoomableCanvasController p_contentUnscaledToBoundsTransform](self, "p_contentUnscaledToBoundsTransform");
  else
    memset(&v12, 0, sizeof(v12));
  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  return CGRectApplyAffineTransform(v13, &v12);
}

- (void)updateContainerInfosToDisplay
{
  -[THWOverlayableZoomableCanvasController p_updateContainerInfosToDisplay](self, "p_updateContainerInfosToDisplay");
}

- (CGRect)targetVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mTargetVisibleRect.origin.x;
  y = self->mTargetVisibleRect.origin.y;
  width = self->mTargetVisibleRect.size.width;
  height = self->mTargetVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetVisibleRect:(CGRect)a3
{
  self->mTargetVisibleRect = a3;
}

- (TSKScrollView)scrollView
{
  return (TSKScrollView *)self->mScrollView;
}

- (void)setScrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSDInteractiveCanvasController)scrollContainerICC
{
  return self->mScrollContainerICC;
}

- (void)setScrollContainerICC:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (TSDInteractiveCanvasController)scrollContentICC
{
  return self->mScrollContentICC;
}

- (void)setScrollContentICC:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (THWClippingLayerHost)containerClippingLayerHost
{
  return self->mContainerClippingLayerHost;
}

- (THWClippingLayerHost)contentClippingLayerHost
{
  return self->mContentClippingLayerHost;
}

- (THWOverlayableZoomableCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)rasterize
{
  return self->_rasterize;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (BOOL)zooming
{
  return self->_zooming;
}

- (void)setZooming:(BOOL)a3
{
  self->_zooming = a3;
}

- (THWOverlayableZoomableBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

@end
