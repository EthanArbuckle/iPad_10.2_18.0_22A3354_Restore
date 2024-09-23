@implementation TSDCanvasLayer

- (void)p_commonInit
{
  CGSize *p_mUnscaledSize;
  CGFloat v4;
  CGFloat v5;

  self->mViewScale = 1.0;
  self->mMaximumPinchViewScale = 4.0;
  self->mMinimumPinchViewScale = 0.25;
  self->mAllowsPinchZoom = 0;
  self->mHorizontallyCenteredInScrollView = 0;
  self->mVerticallyCenteredInScrollView = 0;
  self->mAvoidKeyboardWhenVerticallyCenteredInScrollView = 0;
  self->mContentInset = *(UIEdgeInsets *)TSDEdgeInsetsZero;
  p_mUnscaledSize = &self->mUnscaledSize;
  -[TSDCanvasLayer bounds](self, "bounds");
  p_mUnscaledSize->width = v4;
  p_mUnscaledSize->height = v5;
  self->mShowsScaleFeedback = 1;
  -[TSDCanvasLayer setAllowsEdgeAntialiasing:](self, "setAllowsEdgeAntialiasing:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_scrollViewScrollerStyleDidChange_, CFSTR("TSKScrollViewScrollerStyleDidChange"), 0);
  objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "addKeyboardObserver:", self);
}

- (TSDCanvasLayer)init
{
  TSDCanvasLayer *v2;
  TSDCanvasLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasLayer;
  v2 = -[TSDCanvasLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TSDCanvasLayer p_commonInit](v2, "p_commonInit");
  return v3;
}

- (TSDCanvasLayer)initWithLayer:(id)a3
{
  TSDCanvasLayer *v3;
  TSDCanvasLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDCanvasLayer;
  v3 = -[TSDCanvasLayer initWithLayer:](&v6, sel_initWithLayer_, a3);
  v4 = v3;
  if (v3)
  {
    -[TSDCanvasLayer p_commonInit](v3, "p_commonInit");
    -[TSDCanvasLayer setCreatedAsCopy:](v4, "setCreatedAsCopy:", 1);
  }
  return v4;
}

- (TSDCanvasLayer)initWithCoder:(id)a3
{
  TSDCanvasLayer *v3;
  TSDCanvasLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDCanvasLayer;
  v3 = -[TSDCanvasLayer initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TSDCanvasLayer p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "removeKeyboardObserver:", self);
  if (!-[TSDCanvasLayer torndown](self, "torndown"))
    -[TSDCanvasLayer teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasLayer;
  -[TSDCanvasLayer dealloc](&v3, sel_dealloc);
}

- (void)setController:(id)a3
{
  TSDInteractiveCanvasController *mController;
  void *v6;
  uint64_t v7;

  mController = self->mController;
  if (a3 && mController)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasLayer setController:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 220, CFSTR("shouldn't try to set canvasLayer's controller more than once"));
    mController = self->mController;
  }
  if (!a3 || !mController)
  {
    self->mController = (TSDInteractiveCanvasController *)a3;
    objc_msgSend((id)objc_msgSend(a3, "canvas"), "setUnscaledSize:", self->mUnscaledSize.width, self->mUnscaledSize.height);
    -[TSDCanvas setViewScale:](-[TSDInteractiveCanvasController canvas](self->mController, "canvas"), "setViewScale:", self->mViewScale);
  }
}

- (void)teardown
{
  -[TSDCanvasLayer setTorndown:](self, "setTorndown:", 1);
  self->mController = 0;
  -[CALayer p_clearAllLayerDelegates](self, "p_clearAllLayerDelegates");
  self->mViewScale = 1.0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
}

- (void)teardownWithoutClearingLayerDelegates
{
  self->mController = 0;
  -[TSDCanvasLayer setDelegate:](self, "setDelegate:", 0);
}

- (void)setUnscaledSize:(CGSize)a3
{
  if (a3.width > 0.0
    && a3.height > 0.0
    && (a3.width != self->mUnscaledSize.width || a3.height != self->mUnscaledSize.height))
  {
    self->mUnscaledSize = a3;
    -[TSDCanvas setUnscaledSize:](-[TSDInteractiveCanvasController canvas](self->mController, "canvas"), "setUnscaledSize:", a3.width, a3.height);
    -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
    -[TSDInteractiveCanvasController layoutInvalidated](self->mController, "layoutInvalidated");
  }
}

- (BOOL)centeredInScrollView
{
  _BOOL4 v3;

  v3 = -[TSDCanvasLayer horizontallyCenteredInScrollView](self, "horizontallyCenteredInScrollView");
  if (v3)
    LOBYTE(v3) = -[TSDCanvasLayer verticallyCenteredInScrollView](self, "verticallyCenteredInScrollView");
  return v3;
}

- (void)setUnscaledSizeOnLayer:(CGSize)a3
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  if (a3.width > 0.0
    && a3.height > 0.0
    && (a3.width != self->mUnscaledSize.width || a3.height != self->mUnscaledSize.height))
  {
    self->mUnscaledSize = a3;
    -[TSDCanvas setUnscaledSize:](-[TSDInteractiveCanvasController canvas](self->mController, "canvas"), "setUnscaledSize:", a3.width, a3.height);
    -[TSDCanvasLayer p_boundsRect](self, "p_boundsRect");
    -[TSDCanvasLayer setBounds:](self, "setBounds:");
    v5 = TSDRectWithSize();
    -[TSDCanvasLayer setPosition:](self, "setPosition:", TSDCenterOfRect(v5, v6, v7, v8));
  }
}

- (void)setCenteredInScrollView:(BOOL)a3
{
  BOOL *p_mVerticallyCenteredInScrollView;

  if (self->mHorizontallyCenteredInScrollView != a3)
  {
    self->mHorizontallyCenteredInScrollView = a3;
    p_mVerticallyCenteredInScrollView = &self->mVerticallyCenteredInScrollView;
    if (self->mVerticallyCenteredInScrollView == a3)
    {
LABEL_6:
      -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
      return;
    }
LABEL_5:
    *p_mVerticallyCenteredInScrollView = a3;
    goto LABEL_6;
  }
  p_mVerticallyCenteredInScrollView = &self->mVerticallyCenteredInScrollView;
  if (self->mVerticallyCenteredInScrollView != a3)
    goto LABEL_5;
}

- (void)setHorizontallyCenteredInScrollView:(BOOL)a3
{
  if (self->mHorizontallyCenteredInScrollView != a3)
  {
    self->mHorizontallyCenteredInScrollView = a3;
    -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  }
}

- (void)setVerticallyCenteredInScrollView:(BOOL)a3
{
  if (self->mVerticallyCenteredInScrollView != a3)
  {
    self->mVerticallyCenteredInScrollView = a3;
    -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  }
}

- (void)setAvoidKeyboardWhenVerticallyCenteredInScrollView:(BOOL)a3
{
  if (self->mAvoidKeyboardWhenVerticallyCenteredInScrollView != a3)
  {
    self->mAvoidKeyboardWhenVerticallyCenteredInScrollView = a3;
    -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  }
}

- (void)fixFrameAndScrollView
{
  BOOL v2;

  v2 = self->mUnscaledSize.width == *MEMORY[0x24BDBF148]
    && self->mUnscaledSize.height == *(double *)(MEMORY[0x24BDBF148] + 8);
  if (!v2 && !self->mViewScaleAnimationCount)
  {
    if (self->mController)
      -[TSDCanvasLayer p_fixFrameAndScrollView](self, "p_fixFrameAndScrollView");
  }
}

- (void)setNeedsLayout
{
  char v3;
  objc_super v4;

  if (!-[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->mController, "currentlyWaitingOnThreadedLayoutAndRender")|| (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = -[TSDCanvasLayer needsLayout](self, "needsLayout");
    v4.receiver = self;
    v4.super_class = (Class)TSDCanvasLayer;
    -[TSDCanvasLayer setNeedsLayout](&v4, sel_setNeedsLayout);
    if ((v3 & 1) == 0)
      -[TSDCanvasLayer setNeedsLayoutForTilingLayers](self, "setNeedsLayoutForTilingLayers");
  }
}

- (void)setNeedsLayoutForTilingLayers
{
  objc_msgSend(-[TSDInteractiveCanvasController i_topLevelLayersForTiling](self->mController, "i_topLevelLayersForTiling"), "makeObjectsPerformSelector:", a2);
}

- (void)layoutIfNeededIgnoringDisabledLayout
{
  unint64_t mLayoutDisabledDepth;

  mLayoutDisabledDepth = self->mLayoutDisabledDepth;
  self->mLayoutDisabledDepth = 0;
  -[TSDCanvasLayer layoutIfNeeded](self, "layoutIfNeeded");
  self->mLayoutDisabledDepth = mLayoutDisabledDepth;
}

- (void)layoutSublayers
{
  if (objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "isActivating"))
  {
    -[TSDInteractiveCanvasController setShouldSuppressRendering:](self->mController, "setShouldSuppressRendering:", 1);
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_reenableDrawingAfterResumingFromBackground, 0);
    -[TSDCanvasLayer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_reenableDrawingAfterResumingFromBackground, 0, 0.0);
  }
  else if (!-[TSDCanvasLayer isLayoutDisabled](self, "isLayoutDisabled"))
  {
    -[TSDInteractiveCanvasController i_layout](self->mController, "i_layout");
  }
}

- (void)p_reenableDrawingAfterResumingFromBackground
{
  if ((objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "isActivating") & 1) != 0)
  {
    -[TSDCanvasLayer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_reenableDrawingAfterResumingFromBackground, 0, 0.0);
  }
  else
  {
    -[TSDInteractiveCanvasController setShouldSuppressRendering:](self->mController, "setShouldSuppressRendering:", 0);
    -[TSDCanvasLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)p_boundsRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  TSDMultiplySizeScalar(self->mUnscaledSize.width, self->mUnscaledSize.height, self->mViewScale);
  v3 = TSDRectWithSize();
  v7 = TSDRoundedRectForMainScreen(v3 + self->mContentInset.left, v4 + self->mContentInset.top, v5 - (self->mContentInset.left + self->mContentInset.right), v6 - (self->mContentInset.top + self->mContentInset.bottom));
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (TSDCanvasView)canvasView
{
  return (TSDCanvasView *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->mController, "layerHost"), "canvasView");
}

- (BOOL)isLayoutDisabled
{
  return self->mLayoutDisabledDepth != 0;
}

- (void)pushLayoutDisabled
{
  ++self->mLayoutDisabledDepth;
}

- (void)popLayoutDisabled
{
  unint64_t mLayoutDisabledDepth;
  void *v4;
  uint64_t v5;

  mLayoutDisabledDepth = self->mLayoutDisabledDepth;
  if (mLayoutDisabledDepth
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasLayer popLayoutDisabled]"),
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 441, CFSTR("layout is not disabled")), (mLayoutDisabledDepth = self->mLayoutDisabledDepth) != 0))
  {
    self->mLayoutDisabledDepth = mLayoutDisabledDepth - 1;
    if (-[TSDInteractiveCanvasController i_needsLayout](self->mController, "i_needsLayout"))
      -[TSDCanvasLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setViewScale:(double)a3
{
  -[TSDCanvasLayer p_setViewScale:preservingScrollOffset:](self, "p_setViewScale:preservingScrollOffset:", 0, a3);
}

- (void)setAllowsPinchZoom:(BOOL)a3
{
  if (self->mAllowsPinchZoom != a3)
  {
    self->mAllowsPinchZoom = a3;
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mController, "layerHost"), "asiOSCVC"), "i_updateZoomGestureRecognizer");
    -[TSDCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  }
}

- (void)setMinimumPinchViewScale:(double)a3
{
  if (self->mMinimumPinchViewScale != a3)
  {
    self->mMinimumPinchViewScale = a3;
    -[TSDCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  }
}

- (void)setMaximumPinchViewScale:(double)a3
{
  if (self->mMaximumPinchViewScale != a3)
  {
    self->mMaximumPinchViewScale = a3;
    -[TSDCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  }
}

- (CGPoint)unscaledContentCenter
{
  TSKScrollView *v3;
  TSKScrollView *v4;
  TSDCanvasView *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v3 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  if (v3)
  {
    v4 = v3;
    v5 = -[TSDCanvasLayer canvasView](self, "canvasView");
    -[TSKScrollView bounds](v4, "bounds");
    -[TSDCanvasView convertPoint:fromView:](v5, "convertPoint:fromView:", v4, TSDCenterOfRect(v6, v7, v8, v9));
    v12 = TSDMultiplyPointScalar(v10, v11, 1.0 / self->mViewScale);
  }
  else
  {
    v12 = *MEMORY[0x24BDBEFB0];
    v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)contentOffsetForUnscaledContentCenter:(CGPoint)a3
{
  double y;
  double x;
  double mViewScale;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  mViewScale = self->mViewScale;
  -[TSDCanvasLayer contentInset](self, "contentInset");
  -[TSDCanvasLayer p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:", x, y, mViewScale, v7, v8, v9, v10);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)p_contentOffsetForUnscaledContentCenter:(CGPoint)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  CGFloat y;
  double x;
  TSKScrollView *v13;
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
  CGPoint result;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a3.y;
  x = a3.x;
  v13 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  if (v13)
  {
    -[TSKScrollView bounds](v13, "bounds");
    v15 = v14;
    v29 = y;
    v17 = v16;
    v30 = TSDMultiplySizeScalar(self->mUnscaledSize.width, self->mUnscaledSize.height, a4);
    v31 = v18;
    -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v15, v17, a4, top, left, bottom, right);
    v20 = v19;
    v21 = TSDMultiplyPointScalar(x, v29, a4);
    TSDAddPoints(v21, v22, v20);
    v23 = 0.0;
    v24 = 0.0;
    if (v30 > v15)
    {
      TSUClamp();
      v24 = v25;
    }
    if (v31 > v17)
    {
      TSUClamp();
      v23 = v26;
    }
  }
  else
  {
    v24 = *MEMORY[0x24BDBEFB0];
    v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v27 = v24;
  v28 = v23;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  TSKScrollView *v14;
  TSKScrollView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double mViewScale;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v6 = a6;
  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  v15 = v14;
  if (v6)
  {
    if (v14)
    {
      -[TSKScrollView frame](v14, "frame");
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      if (!CGRectEqualToRect(v30, v32))
        -[TSKScrollView setFrame:](v15, "setFrame:", x, y, width, height);
    }
    if (v7)
    {
      -[TSDCanvasLayer unscaledContentCenter](self, "unscaledContentCenter");
      v17 = v16;
      v19 = v18;
    }
    else
    {
      v17 = *MEMORY[0x24BDBEFB0];
      v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    }
    -[TSDCanvasLayer contentInset](self, "contentInset");
    -[TSDCanvasLayer animateToViewScale:contentCenter:contentInset:duration:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:duration:completionBlock:", 0, a3, v17, v19, v21, v22, v23, v24, 0.2);
  }
  else
  {
    if (v14
      && (-[TSKScrollView frame](v14, "frame"),
          v33.origin.x = x,
          v33.origin.y = y,
          v33.size.width = width,
          v33.size.height = height,
          !CGRectEqualToRect(v31, v33)))
    {
      -[TSKScrollView setFrame:](v15, "setFrame:", x, y, width, height);
      v20 = 1;
    }
    else
    {
      v20 = 0;
    }
    -[TSDCanvasLayer unscaledContentCenter](self, "unscaledContentCenter");
    v26 = v25;
    v28 = v27;
    mViewScale = self->mViewScale;
    if (mViewScale != a3)
      -[TSDCanvasLayer p_setViewScale:](self, "p_setViewScale:", a3);
    -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
    if (v7)
    {
      -[TSDCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v26, v28);
      -[TSKScrollView setContentOffset:animated:](v15, "setContentOffset:animated:", 0);
    }
    if (mViewScale != a3)
      -[TSDInteractiveCanvasController i_viewScaleDidChange](self->mController, "i_viewScaleDidChange");
    if (v20)
      -[TSDInteractiveCanvasController i_viewScrollDidChange](self->mController, "i_viewScrollDidChange");
  }
}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 completionBlock:(id)a7
{
  -[TSDCanvasLayer animateToViewScale:contentCenter:contentInset:duration:animation:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:duration:animation:completionBlock:", 0, a7, a3, a4.x, a4.y, a5.top, a5.left, a5.bottom, a5.right, a6);
}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 animation:(id)a7 completionBlock:(id)a8
{
  double right;
  double left;
  double top;
  CGFloat y;
  CGFloat x;
  TSKScrollView *v17;
  __n128 v18;
  TSKScrollView *v19;
  unint64_t mViewScaleAnimationCount;
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
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double mViewScale;
  double v54;
  double v55;
  double v56;
  double v57;
  double MinX;
  CGFloat v59;
  double MinY;
  CGFloat Height;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double bottom;
  _QWORD v79[5];
  CGAffineTransform v80;
  _QWORD v81[2];
  uint64_t (*v82)(uint64_t);
  void *v83;
  TSDCanvasLayer *v84;
  id v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  _QWORD v93[2];
  uint64_t (*v94)(uint64_t);
  void *v95;
  TSDCanvasLayer *v96;
  CGAffineTransform v97;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v100;
  CGAffineTransform v101;
  CGAffineTransform v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  bottom = a5.bottom;
  right = a5.right;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  v17 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  if (a3 <= 0.0
    || (v19 = v17, self->mViewScale == a3)
    && (-[TSDCanvasLayer contentInset](self, "contentInset"), left == v52)
    && top == v18.n128_f64[0]
    && right == v51
    && (v18.n128_f64[0] = bottom, bottom == v50)
    && !self->mViewScaleAnimationCount)
  {
    if (a8)
      (*((void (**)(id, BOOL, __n128))a8 + 2))(a8, self->mViewScaleAnimationCount == 0, v18);
  }
  else
  {
    if (v19)
    {
      -[TSKScrollView contentOffset](v19, "contentOffset");
      -[TSKScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", 0);
    }
    v75 = top;
    v76 = left;
    mViewScaleAnimationCount = self->mViewScaleAnimationCount;
    if (!mViewScaleAnimationCount)
    {
      -[TSDInteractiveCanvasController i_viewWillBeginZooming](self->mController, "i_viewWillBeginZooming");
      mViewScaleAnimationCount = self->mViewScaleAnimationCount;
    }
    self->mViewScaleAnimationCount = mViewScaleAnimationCount + 1;
    -[TSDInteractiveCanvasController i_viewDidZoomToViewScale:](self->mController, "i_viewDidZoomToViewScale:", a3);
    -[TSDCanvasLayer pushLayoutDisabled](self, "pushLayoutDisabled");
    v67 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v68 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v101.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v101.c = v67;
    v66 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v101.tx = v66;
    -[TSDCanvasLayer bounds](self, "bounds");
    v23 = v22;
    v24 = a3;
    v26 = *MEMORY[0x24BDBEFB0];
    v25 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v73 = y;
    v74 = x;
    v71 = v27;
    v72 = v24;
    v69 = right;
    v70 = v28;
    if (v19)
    {
      v29 = right;
      v30 = v24;
      v31 = v21;
      -[TSKScrollView contentOffset](v19, "contentOffset");
      v33 = v32;
      v34 = TSDSubtractPoints(v26, v25, v23);
      v36 = TSDSubtractPoints(v34, v35, v33);
      v64 = v37;
      v65 = v36;
      -[TSKScrollView frame](v19, "frame");
      v38 = v23;
      -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v39, v40, v30, v75, v76, bottom, v29);
      v63 = v41;
      -[TSDCanvasLayer p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_contentOffsetForUnscaledContentCenter:viewScale:contentInset:", v74, v73, v30, v75, v76, bottom, v29);
      v43 = v42;
      v44 = TSDSubtractPoints(v26, v25, v63);
      v46 = TSDSubtractPoints(v44, v45, v43);
      v47 = v64;
      v48 = v65;
      v26 = v46;
      v25 = v49;
    }
    else
    {
      v47 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v48 = *MEMORY[0x24BDBEFB0];
      v38 = v23;
      v31 = v21;
    }
    *(_OWORD *)&v102.a = v68;
    *(_OWORD *)&v102.c = v67;
    *(_OWORD *)&v102.tx = v66;
    CGAffineTransformTranslate(&v101, &v102, v26 - v48, v25 - v47);
    mViewScale = self->mViewScale;
    memset(&v100, 0, sizeof(v100));
    CGAffineTransformMakeScale(&v100, v72 / mViewScale, v72 / mViewScale);
    -[TSDCanvasLayer anchorPoint](self, "anchorPoint");
    v55 = v54;
    v57 = v56;
    v103.origin.x = v38;
    v103.origin.y = v31;
    v103.size.width = v71;
    v103.size.height = v70;
    MinX = CGRectGetMinX(v103);
    v104.origin.x = v38;
    v104.origin.y = v31;
    v104.size.width = v71;
    v104.size.height = v70;
    v59 = MinX + v55 * CGRectGetWidth(v104);
    v105.origin.x = v38;
    v105.origin.y = v31;
    v105.size.width = v71;
    v105.size.height = v70;
    MinY = CGRectGetMinY(v105);
    v106.origin.x = v38;
    v106.origin.y = v31;
    v106.size.width = v71;
    v106.size.height = v70;
    Height = CGRectGetHeight(v106);
    t1 = v100;
    TSDTransformConvertForNewOrigin(&t1, &v102, v59, MinY + v57 * Height);
    v100 = v102;
    t1 = v102;
    t2 = v101;
    CGAffineTransformConcat(&v102, &t1, &t2);
    v101 = v102;
    v62 = MEMORY[0x24BDAC760];
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v94 = __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke;
    v95 = &unk_24D82C608;
    v96 = self;
    v97 = v102;
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v82 = __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_2;
    v83 = &unk_24D82C630;
    v86 = v72;
    v87 = v75;
    v88 = v76;
    v89 = bottom;
    v90 = v69;
    v91 = v74;
    v92 = v73;
    v84 = self;
    v85 = a8;
    -[TSDCanvasLayer affineTransform](self, "affineTransform");
    v102 = v101;
    if (CGAffineTransformEqualToTransform(&v80, &v102))
    {
      v102 = v97;
      -[TSDCanvasLayer setAffineTransform:](self, "setAffineTransform:", &v102);
      -[TSDCanvasLayer popLayoutDisabled](self, "popLayoutDisabled");
      v82((uint64_t)v81);
    }
    else if (a7)
    {
      -[TSDInteractiveCanvasController beginAnimations:context:](self->mController, "beginAnimations:context:", &stru_24D82FEB0, 0);
      -[TSDInteractiveCanvasController setAnimationDuration:](self->mController, "setAnimationDuration:", a6);
      -[TSDInteractiveCanvasController setAnimation:forLayer:forKey:](self->mController, "setAnimation:forLayer:forKey:", a7, self, CFSTR("transform"));
      -[TSDInteractiveCanvasController setAnimationCompletionBlock:](self->mController, "setAnimationCompletionBlock:", v81);
      v94((uint64_t)v93);
      -[TSDInteractiveCanvasController commitAnimations](self->mController, "commitAnimations");
    }
    else
    {
      v79[0] = v62;
      v79[1] = 3221225472;
      v79[2] = __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_3;
      v79[3] = &unk_24D82C658;
      v79[4] = v81;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v93, v79, a6, 0.0);
    }
  }
}

uint64_t __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setAffineTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "popLayoutDisabled");
}

uint64_t __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  void *v6;
  uint64_t result;
  _OWORD v8[3];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 96) - 1;
  *(_QWORD *)(v2 + 96) = v3;
  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v8[0] = *MEMORY[0x24BDBD8B8];
    v8[1] = v5;
    v8[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v4, "setAffineTransform:", v8);
    objc_msgSend(*(id *)(a1 + 32), "p_setViewScale:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 32), "fixFrameAndScrollView");
    v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "canvasView"), "enclosingScrollView");
    objc_msgSend(*(id *)(a1 + 32), "contentOffsetForUnscaledContentCenter:", *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(v6, "setContentOffset:animated:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "i_viewScaleDidChange");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "i_viewScrollDidChange");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "viewDidEndZooming");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) == 0);
  return result;
}

uint64_t __99__TSDCanvasLayer_animateToViewScale_contentCenter_contentInset_duration_animation_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3
{
  -[TSDCanvasLayer setScrollViewFrameMaintainingApparentScrollPosition:animated:](self, "setScrollViewFrameMaintainingApparentScrollPosition:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  TSKScrollView *v10;
  TSKScrollView *v11;
  TSDCanvasView *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  if (v10)
  {
    v11 = v10;
    -[TSKScrollView frame](v10, "frame");
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    if (!CGRectEqualToRect(v22, v23))
    {
      v12 = -[TSDCanvasLayer canvasView](self, "canvasView");
      -[TSKScrollView bounds](v11, "bounds");
      -[TSDCanvasView convertPoint:fromView:](v12, "convertPoint:fromView:", v11, TSDCenterOfRect(v13, v14, v15, v16));
      v19 = TSDMultiplyPointScalar(v17, v18, 1.0 / self->mViewScale);
      v21 = v20;
      -[TSKScrollView setFrame:](v11, "setFrame:", x, y, width, height);
      -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
      -[TSDCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v19, v21);
      -[TSKScrollView setContentOffset:animated:](v11, "setContentOffset:animated:", v4);
    }
  }
}

- (void)p_setViewScale:(double)a3
{
  -[TSDCanvasLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("viewScale"));
  self->mViewScale = a3;
  -[TSDCanvasLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("viewScale"));
  -[TSDCanvas setViewScale:](-[TSDInteractiveCanvasController canvas](self->mController, "canvas"), "setViewScale:", self->mViewScale);
}

- (void)p_setViewScale:(double)a3 preservingScrollOffset:(BOOL)a4
{
  double mViewScale;
  TSKScrollView *v8;
  TSKScrollView *v9;
  char v10;

  mViewScale = self->mViewScale;
  if (a3 <= 0.0 || mViewScale == a3)
    return;
  if (!a4)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v8 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView", mViewScale), "enclosingScrollView");
  v9 = v8;
  if (!v8)
  {
LABEL_11:
    v10 = 1;
    goto LABEL_12;
  }
  -[TSKScrollView contentOffset](v8, "contentOffset");
  -[TSKScrollView contentSize](v9, "contentSize");
  v10 = 0;
LABEL_12:
  -[TSDCanvasLayer p_setViewScale:](self, "p_setViewScale:", a3);
  -[TSDCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  -[TSDCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  if ((v10 & 1) == 0)
  {
    -[TSKScrollView contentSize](v9, "contentSize");
    -[TSKScrollView setContentOffset:animated:](v9, "setContentOffset:animated:", 0, TSDRoundedPoint());
  }
  -[TSDInteractiveCanvasController i_viewScaleDidChange](self->mController, "i_viewScaleDidChange");
}

- (void)p_setEnclosingScrollViewZoomParameters
{
  TSKScrollView *v2;
  TSKScrollView *v3;

  v2 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  if (v2)
  {
    v3 = v2;
    -[TSKScrollView setMinimumZoomScale:](v2, "setMinimumZoomScale:", 1.0);
    -[TSKScrollView setMaximumZoomScale:](v3, "setMaximumZoomScale:", 1.0);
    -[TSKScrollView setZoomScale:](v3, "setZoomScale:", 1.0);
  }
}

- (CGRect)p_fixedBoundsForScrollViewSize:(CGSize)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  double top;
  double width;
  CGSize *p_mUnscaledSize;
  double right;
  double bottom;
  double left;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double height;
  CGRect result;

  top = a5.top;
  height = a3.height;
  width = a3.width;
  p_mUnscaledSize = &self->mUnscaledSize;
  if (self->mUnscaledSize.width == *MEMORY[0x24BDBF148]
    && self->mUnscaledSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v35 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v36 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v37 = *MEMORY[0x24BDBF090];
    v38 = *(double *)(MEMORY[0x24BDBF090] + 8);
  }
  else
  {
    right = a5.right;
    bottom = a5.bottom;
    left = a5.left;
    -[TSDInteractiveCanvasController growUnscaledCanvasLayerSize:](self->mController, "growUnscaledCanvasLayerSize:");
    v15 = v14;
    v17 = v16;
    if (v14 < p_mUnscaledSize->width)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:]");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 958, CFSTR("expected canvas layer not to shrink in -growUnscaledCanvasLayerSize:, ignoring width"));
      v15 = p_mUnscaledSize->width;
    }
    if (v17 < p_mUnscaledSize->height)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:]");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasLayer.m"), 962, CFSTR("expected canvas layer not to shrink in -growUnscaledCanvasLayerSize:, ignoring height"));
      v17 = p_mUnscaledSize->height;
    }
    TSDMultiplySizeScalar(v15, v17, a4);
    v22 = left + TSDRectWithSize();
    v24 = top + v23;
    v26 = v25 - (left + right);
    v28 = v27 - (top + bottom);
    if (-[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView")
      && -[TSDInteractiveCanvasController shouldResizeCanvasToScrollView](self->mController, "shouldResizeCanvasToScrollView"))
    {
      -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](self->mController, "canvas"), "contentsScale");
      v30 = v29;
      v31 = TSDSubtractSizes(width, height, v26);
      v33 = v32;
      if (v31 <= 0.0)
      {
        width = v26;
      }
      else
      {
        v34 = v31;
        if (-[TSDCanvasLayer horizontallyCenteredInScrollView](self, "horizontallyCenteredInScrollView"))
          v22 = TSDFloorForScale(v22 + v34 * -0.5, v30);
      }
      if (v33 > 0.0)
      {
        v28 = height;
        if (-[TSDCanvasLayer verticallyCenteredInScrollView](self, "verticallyCenteredInScrollView"))
          v24 = TSDFloorForScale(v24 + v33 * -0.5, v30);
      }
    }
    else
    {
      width = v26;
    }
    -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](self->mController, "canvas"), "contentsScale");
    v37 = TSDRoundedRectForScale(v22, v24, width, v28, v39);
  }
  -[TSDInteractiveCanvasController canvasViewBoundsWithBounds:](self->mController, "canvasViewBoundsWithBounds:", v37, v38, v35, v36, a5.left, a5.bottom, a5.right);
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (void)adjustContentInsets
{
  TSKScrollView *v3;
  TSKScrollView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double mViewScale;
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
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;

  if (-[TSDCanvasLayer verticallyCenteredInScrollView](self, "verticallyCenteredInScrollView"))
  {
    v3 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
    if (v3)
    {
      v4 = v3;
      -[TSDInteractiveCanvasController sizeOfScrollViewEnclosingCanvas](self->mController, "sizeOfScrollViewEnclosingCanvas");
      v6 = v5;
      v8 = v7;
      mViewScale = self->mViewScale;
      -[TSDCanvasLayer contentInset](self, "contentInset");
      -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v6, v8, mViewScale, v10, v11, v12, v13);
      v15 = v14;
      if (-[TSKScrollView superview](v4, "superview"))
      {
        objc_msgSend((id)-[TSKScrollView superview](v4, "superview"), "frame");
        v17 = v16;
        -[TSKScrollView frame](v4, "frame");
        if (v15 >= v17)
          v19 = v17;
        else
          v19 = v15;
        v20 = (v18 - v19) * 0.5;
        if (-[TSDCanvasLayer avoidKeyboardWhenVerticallyCenteredInScrollView](self, "avoidKeyboardWhenVerticallyCenteredInScrollView"))
        {
          objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "keyboardHeightInView:", v4);
          v22 = v21;
          v26 = v20 < v21;
          v23 = v20;
          if (v26)
          {
            -[TSKScrollView frame](v4, "frame", v20);
            v25 = v24 - (v15 + v22);
            v26 = v25 < 0.0;
            v23 = v25 * 0.5;
            if (v26)
              v20 = v22;
            else
              v20 = v22 + v23;
            if (v26)
              v23 = 0.0;
          }
        }
        else
        {
          v23 = v20;
        }
        -[TSKScrollView setContentInset:](v4, "setContentInset:", v23, 0.0, v20, 0.0);
      }
    }
  }
}

- (void)p_fixFrameAndScrollView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double mViewScale;
  double v8;
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
  TSKScrollView *v20;
  TSKScrollView *v21;
  TSDCanvasView *v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;

  -[TSDInteractiveCanvasController sizeOfScrollViewEnclosingCanvas](self->mController, "sizeOfScrollViewEnclosingCanvas");
  v4 = v3;
  v6 = v5;
  mViewScale = self->mViewScale;
  -[TSDCanvasLayer contentInset](self, "contentInset");
  -[TSDCanvasLayer p_fixedBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedBoundsForScrollViewSize:viewScale:contentInset:", v4, v6, mViewScale, v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self, "canvasView"), "enclosingScrollView");
  if (v20)
  {
    v21 = v20;
    -[TSKScrollView setZoomScale:](v20, "setZoomScale:", 1.0);
    -[TSKScrollView setContentSize:](v21, "setContentSize:", v17, v19);
    -[TSDCanvasLayer adjustContentInsets](self, "adjustContentInsets");
  }
  v22 = -[TSDCanvasLayer canvasView](self, "canvasView");
  if (!v22)
    v22 = (TSDCanvasView *)self;
  -[TSDCanvasView setBounds:](v22, "setBounds:", v13, v15, v17, v19);
  v23 = TSDRectWithSize();
  -[TSDCanvasLayer setPosition:](self, "setPosition:", TSDCenterOfRect(v23, v24, v25, v26));
}

- (void)_adjustContentInsetsForKeyboard
{
  if (-[TSDCanvasLayer verticallyCenteredInScrollView](self, "verticallyCenteredInScrollView"))
  {
    if (-[TSDCanvasLayer avoidKeyboardWhenVerticallyCenteredInScrollView](self, "avoidKeyboardWhenVerticallyCenteredInScrollView"))
    {
      -[TSDCanvasLayer adjustContentInsets](self, "adjustContentInsets");
    }
  }
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__TSDCanvasLayer_keyboardWillChangeFrame___block_invoke;
  v6[3] = &unk_24D829278;
  v6[4] = self;
  v4 = +[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor", a3);
  if (objc_msgSend(v4, "keyboardIsAnimating"))
  {
    v5 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(v4, "keyboardAnimationDuration");
    objc_msgSend(v5, "animateWithDuration:animations:", v6);
  }
  else
  {
    -[TSDCanvasLayer _adjustContentInsetsForKeyboard](self, "_adjustContentInsetsForKeyboard");
  }
}

uint64_t __42__TSDCanvasLayer_keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustContentInsetsForKeyboard");
}

- (double)viewScale
{
  return self->mViewScale;
}

- (double)minimumPinchViewScale
{
  return self->mMinimumPinchViewScale;
}

- (double)maximumPinchViewScale
{
  return self->mMaximumPinchViewScale;
}

- (BOOL)allowsPinchZoom
{
  return self->mAllowsPinchZoom;
}

- (BOOL)showsScaleFeedback
{
  return self->mShowsScaleFeedback;
}

- (void)setShowsScaleFeedback:(BOOL)a3
{
  self->mShowsScaleFeedback = a3;
}

- (BOOL)isInfinite
{
  return self->mIsInfinite;
}

- (void)setInfinite:(BOOL)a3
{
  self->mIsInfinite = a3;
}

- (TSDInteractiveCanvasController)controller
{
  return self->mController;
}

- (CGSize)unscaledSize
{
  double width;
  double height;
  CGSize result;

  width = self->mUnscaledSize.width;
  height = self->mUnscaledSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mContentInset.top;
  left = self->mContentInset.left;
  bottom = self->mContentInset.bottom;
  right = self->mContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (BOOL)horizontallyCenteredInScrollView
{
  return self->mHorizontallyCenteredInScrollView;
}

- (BOOL)verticallyCenteredInScrollView
{
  return self->mVerticallyCenteredInScrollView;
}

- (BOOL)avoidKeyboardWhenVerticallyCenteredInScrollView
{
  return self->mAvoidKeyboardWhenVerticallyCenteredInScrollView;
}

- (BOOL)torndown
{
  return self->_torndown;
}

- (void)setTorndown:(BOOL)a3
{
  self->_torndown = a3;
}

- (BOOL)createdAsCopy
{
  return self->_createdAsCopy;
}

- (void)setCreatedAsCopy:(BOOL)a3
{
  self->_createdAsCopy = a3;
}

@end
