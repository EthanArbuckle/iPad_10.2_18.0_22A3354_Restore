@implementation CRLCanvasLayer

+ (id)zoomAnimationDefaultCAAnimation
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)CABasicAnimation);
  objc_msgSend(v2, "setKeyPath:", CFSTR("transform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v2, "setTimingFunction:", v3);

  +[CRLCanvasLayer zoomAnimationDefaultDuration](CRLCanvasLayer, "zoomAnimationDefaultDuration");
  objc_msgSend(v2, "setDuration:");
  return v2;
}

+ (double)zoomAnimationDefaultDuration
{
  return 0.200000003;
}

- (void)p_commonInit
{
  double v3;
  double v4;
  __int128 v5;
  CGFloat v6;
  CGFloat v7;
  CRLDisplayLink *mAnimateToViewScaleActiveDisplayLink;
  __int128 v9;
  void *v10;
  void *v11;
  id v12;

  self->mViewScale = 1.0;
  +[CRLInteractiveCanvasController maximumRecommendedViewScale](CRLInteractiveCanvasController, "maximumRecommendedViewScale");
  self->mMaximumPinchViewScale = v3;
  +[CRLInteractiveCanvasController minimumRecommendedViewScale](CRLInteractiveCanvasController, "minimumRecommendedViewScale");
  self->mMinimumPinchViewScale = v4;
  self->mAllowsPinchZoom = 0;
  self->mHorizontallyCenteredInScrollView = 0;
  self->mVerticallyCenteredInScrollView = 0;
  v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->mContentInset.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->mContentInset.bottom = v5;
  -[CRLCanvasLayer bounds](self, "bounds");
  self->mUnscaledSize.width = v6;
  self->mUnscaledSize.height = v7;
  self->mShowsScaleFeedback = 1;
  mAnimateToViewScaleActiveDisplayLink = self->mAnimateToViewScaleActiveDisplayLink;
  self->mAnimateToViewScaleActiveDisplayLink = 0;

  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.c = v9;
  *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLCanvasLayer setAllowsEdgeAntialiasing:](self, "setAllowsEdgeAntialiasing:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "p_scrollViewScrollerStyleDidChange:", CFSTR("CRLScrollViewScrollerStyleDidChange"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "p_scrollViewSafeAreaInsetsDidChange:", CFSTR("CRLScrollViewSafeAreaInsetsDidChangeNotification"), 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "p_scrollViewContentInsetDidChange:", CFSTR("CRLScrollViewContentInsetDidChangeNotification"), 0);

}

- (CRLCanvasLayer)init
{
  CRLCanvasLayer *v2;
  CRLCanvasLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasLayer;
  v2 = -[CRLCanvasLayer init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLCanvasLayer p_commonInit](v2, "p_commonInit");
  return v3;
}

- (CRLCanvasLayer)initWithCoder:(id)a3
{
  CRLCanvasLayer *v3;
  CRLCanvasLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasLayer;
  v3 = -[CRLCanvasLayer initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLCanvasLayer p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)setController:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double width;
  double height;
  id v15;
  void *v16;
  double mViewScale;
  id v18;
  void *v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained)
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232590);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF183C(v6, v7);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012325B0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayer setController:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 193, 0, "shouldn't try to set canvasLayer's controller more than once");

  }
  v11 = objc_loadWeakRetained((id *)&self->mController);

  if (!v11)
  {
    v12 = objc_storeWeak((id *)&self->mController, v4);
    width = self->mUnscaledSize.width;
    height = self->mUnscaledSize.height;
    v15 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvas"));
    objc_msgSend(v16, "setUnscaledSize:", width, height);

    mViewScale = self->mViewScale;
    v18 = objc_loadWeakRetained((id *)&self->mController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvas"));
    objc_msgSend(v19, "setViewScale:", mViewScale);

  }
}

- (void)teardown
{
  _TtC8Freeform24CRLCanvasBackgroundLayer *mCanvasBackgroundLayer;
  id v4;

  objc_storeWeak((id *)&self->mController, 0);
  -[CRLCanvasLayer p_clearAllLayerDelegates](self, "p_clearAllLayerDelegates");
  self->mViewScale = 1.0;
  -[CRLCanvasBackgroundLayer tearDown](self->mCanvasBackgroundLayer, "tearDown");
  mCanvasBackgroundLayer = self->mCanvasBackgroundLayer;
  self->mCanvasBackgroundLayer = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)setUnscaledSize:(CGSize)a3
{
  -[CRLCanvasLayer setUnscaledSize:fixFrame:](self, "setUnscaledSize:fixFrame:", 1, a3.width, a3.height);
}

- (void)setUnscaledSize:(CGSize)a3 fixFrame:(BOOL)a4
{
  double height;
  double width;
  _BOOL4 v8;
  id WeakRetained;
  void *v10;
  id v11;

  if (a3.width > 0.0)
  {
    height = a3.height;
    if (a3.height > 0.0)
    {
      width = a3.width;
      if (a3.width != self->mUnscaledSize.width || a3.height != self->mUnscaledSize.height)
      {
        v8 = a4;
        self->mUnscaledSize = a3;
        WeakRetained = objc_loadWeakRetained((id *)&self->mController);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
        objc_msgSend(v10, "setUnscaledSize:", width, height);

        if (v8)
        {
          -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
          v11 = objc_loadWeakRetained((id *)&self->mController);
          objc_msgSend(v11, "layoutInvalidated");

        }
      }
    }
  }
}

- (BOOL)centeredInScrollView
{
  _BOOL4 v3;

  v3 = -[CRLCanvasLayer horizontallyCenteredInScrollView](self, "horizontallyCenteredInScrollView");
  if (v3)
    LOBYTE(v3) = -[CRLCanvasLayer verticallyCenteredInScrollView](self, "verticallyCenteredInScrollView");
  return v3;
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
      -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
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
  -[CRLCanvasLayer setHorizontallyCenteredInScrollView:verticallyCenteredInScrollView:fixFrame:](self, "setHorizontallyCenteredInScrollView:verticallyCenteredInScrollView:fixFrame:", a3, self->mVerticallyCenteredInScrollView, 1);
}

- (void)setVerticallyCenteredInScrollView:(BOOL)a3
{
  -[CRLCanvasLayer setHorizontallyCenteredInScrollView:verticallyCenteredInScrollView:fixFrame:](self, "setHorizontallyCenteredInScrollView:verticallyCenteredInScrollView:fixFrame:", self->mHorizontallyCenteredInScrollView, a3, 1);
}

- (void)setHorizontallyCenteredInScrollView:(BOOL)a3 verticallyCenteredInScrollView:(BOOL)a4 fixFrame:(BOOL)a5
{
  _BOOL4 mHorizontallyCenteredInScrollView;

  mHorizontallyCenteredInScrollView = self->mHorizontallyCenteredInScrollView;
  if (mHorizontallyCenteredInScrollView != a3)
    self->mHorizontallyCenteredInScrollView = a3;
  if (self->mVerticallyCenteredInScrollView == a4)
  {
    if (mHorizontallyCenteredInScrollView != a3 && a5)
      goto LABEL_8;
  }
  else
  {
    self->mVerticallyCenteredInScrollView = a4;
    if (a5)
LABEL_8:
      -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  }
}

- (void)fixFrameAndScrollView
{
  BOOL v2;
  id WeakRetained;

  v2 = self->mUnscaledSize.width == CGSizeZero.width && self->mUnscaledSize.height == CGSizeZero.height;
  if (!v2 && !self->mViewScaleAnimationCount)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);

    if (WeakRetained)
      -[CRLCanvasLayer p_fixFrameAndScrollView](self, "p_fixFrameAndScrollView");
  }
}

- (void)setNeedsLayout
{
  unsigned __int8 v3;
  id WeakRetained;
  unsigned __int8 v5;
  objc_super v6;

  v3 = -[CRLCanvasLayer needsLayout](self, "needsLayout");
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasLayer;
  -[CRLCanvasLayer setNeedsLayout](&v6, "setNeedsLayout");
  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    v5 = objc_msgSend(WeakRetained, "i_currentlySuppressingLayerUpdates");

    if ((v5 & 1) == 0)
      -[CRLCanvasLayer crl_setNeedsLayoutForTilingLayers](self, "crl_setNeedsLayoutForTilingLayers");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BOOL v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvasLayer bounds](self, "bounds");
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v12 = CGRectEqualToRect(v14, v15);
  v13.receiver = self;
  v13.super_class = (Class)CRLCanvasLayer;
  -[CRLCanvasLayer setBounds:](&v13, "setBounds:", x, y, width, height);
  if (!v12)
    -[CRLCanvasBackgroundLayer setNeedsLayout](self->mCanvasBackgroundLayer, "setNeedsLayout");
}

- (id)crl_sublayersForTilingLayerSupport
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer sublayers](self, "sublayers", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(CRLCanvasSubviewLayer, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          objc_msgSend(v3, "addObject:", v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v3;
}

- (void)layoutIfNeededIgnoringDisabledLayout
{
  BOOL mDisableLayout;

  mDisableLayout = self->mDisableLayout;
  self->mDisableLayout = 0;
  -[CRLCanvasLayer layoutIfNeeded](self, "layoutIfNeeded");
  self->mDisableLayout = mDisableLayout;
}

- (void)layoutSublayers
{
  id WeakRetained;
  double v4;
  double v5;
  id v6;
  id v7;

  if (!self->mDisableLayout)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    objc_msgSend(WeakRetained, "i_layout");

    -[CRLCanvasLayer viewScale](self, "viewScale");
    v5 = v4;
    v6 = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
    objc_msgSend(v6, "setViewScale:", v5);

    v7 = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
    LOBYTE(v6) = objc_msgSend(v7, "scalesWithCanvas");

    if ((v6 & 1) == 0)
      -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
    -[CRLCanvasLayer updateCanvasEdgeLayersIfNecessary](self, "updateCanvasEdgeLayersIfNecessary");
  }
}

- (CRLCanvasView)canvasView
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));

  return (CRLCanvasView *)v4;
}

- (void)setViewScale:(double)a3
{
  -[CRLCanvasLayer p_setViewScale:preservingScrollOffset:](self, "p_setViewScale:preservingScrollOffset:", 0, a3);
}

- (void)setAllowsPinchZoom:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  if (self->mAllowsPinchZoom != a3)
  {
    self->mAllowsPinchZoom = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
    objc_msgSend(v6, "i_updateZoomGestureRecognizer");

    -[CRLCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  }
}

- (void)setMinimumPinchViewScale:(double)a3
{
  if (self->mMinimumPinchViewScale != a3)
  {
    self->mMinimumPinchViewScale = a3;
    -[CRLCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  }
}

- (void)setMaximumPinchViewScale:(double)a3
{
  if (self->mMaximumPinchViewScale != a3)
  {
    self->mMaximumPinchViewScale = a3;
    -[CRLCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
  }
}

- (CGPoint)unscaledContentCenter
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double x;
  double v27;
  CGFloat y;
  double v29;
  double v30;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));

  if (v4)
  {
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "adjustedContentInset");
    v14 = v6 + v13;
    v16 = v8 + v15;
    v18 = v10 - (v13 + v17);
    v20 = v12 - (v15 + v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
    objc_msgSend(v21, "convertPoint:fromView:", v4, sub_100061400(v14, v16, v18, v20));
    v23 = v22;
    v25 = v24;

    x = sub_1000603DC(v23, v25, 1.0 / self->mViewScale);
    y = v27;
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }

  v29 = x;
  v30 = y;
  result.y = v30;
  result.x = v29;
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
  -[CRLCanvasLayer contentInset](self, "contentInset");
  -[CRLCanvasLayer p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:", x, y, mViewScale, v7, v8, v9, v10);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)p_scrollViewContentOffsetForUnscaledContentCenter:(CGPoint)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  CGFloat y;
  CGFloat x;
  void *v13;
  void *v14;
  id WeakRetained;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  CGFloat v23;
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
  double MinX;
  double v38;
  double v39;
  double MinY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double rect;
  double rect_8;
  double rect_16;
  double rect_24;
  CGPoint result;
  CGRect v52;
  CGRect v53;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a3.y;
  x = a3.x;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "enclosingScrollView"));

  if (v14)
  {
    rect_16 = x;
    rect_24 = y;
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    objc_msgSend(WeakRetained, "unobscuredFrameOfView:", v14);
    v17 = v16;
    v19 = v18;

    -[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:", v17, v19, a4, top, left, bottom, right);
    rect_8 = v20;
    v21 = objc_loadWeakRetained((id *)&self->mController);
    LODWORD(WeakRetained) = objc_msgSend(v21, "shouldCanvasScrollingSizeGrowToFitBoardContent");

    if (!(_DWORD)WeakRetained)
      sub_1000603DC(self->mUnscaledSize.width, self->mUnscaledSize.height, a4);
    rect = sub_10005FDDC();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = sub_1000603DC(rect_16, rect_24, a4);
    v30 = sub_1000603B8(v28, v29, rect_8);
    v32 = v31;
    v33 = -0.5;
    v34 = 0.0;
    v35 = 0.0;
    if (v25 > v17)
    {
      v36 = v30 + v17 * -0.5;
      v52.origin.x = rect;
      v52.origin.y = v23;
      v52.size.width = v25;
      v52.size.height = v27;
      MinX = CGRectGetMinX(v52);
      v38 = sub_1003C65EC(v36, MinX, v25 - v17);
      v33 = -0.5;
      v35 = v38;
    }
    if (v27 > v19)
    {
      v39 = v32 + v19 * v33;
      v53.origin.x = rect;
      v53.origin.y = v23;
      v53.size.width = v25;
      v53.size.height = v27;
      MinY = CGRectGetMinY(v53);
      v34 = sub_1003C65EC(v39, MinY, v27 - v19);
    }
    objc_msgSend(v14, "adjustedContentInset", *(_QWORD *)&rect);
    v42 = v35 - v41;
    v44 = v34 - v43;
  }
  else
  {
    v42 = CGPointZero.x;
    v44 = CGPointZero.y;
  }

  v45 = v42;
  v46 = v44;
  result.y = v46;
  result.x = v45;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double mViewScale;
  id WeakRetained;
  id v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v6 = a6;
  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enclosingScrollView"));

  if (v6)
  {
    if (v31)
    {
      objc_msgSend(v31, "frame");
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      if (!CGRectEqualToRect(v32, v34))
        objc_msgSend(v31, "setFrame:", x, y, width, height);
    }
    if (v7)
    {
      -[CRLCanvasLayer unscaledContentCenter](self, "unscaledContentCenter");
      v16 = v15;
      v18 = v17;
    }
    else
    {
      v16 = CGPointZero.x;
      v18 = CGPointZero.y;
    }
    -[CRLCanvasLayer contentInset](self, "contentInset");
    -[CRLCanvasLayer animateToViewScale:contentCenter:contentInset:duration:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:duration:completionBlock:", 0, a3, v16, v18, v20, v21, v22, v23, 0.2);
  }
  else
  {
    if (v31
      && (objc_msgSend(v31, "frame"),
          v35.origin.x = x,
          v35.origin.y = y,
          v35.size.width = width,
          v35.size.height = height,
          !CGRectEqualToRect(v33, v35)))
    {
      objc_msgSend(v31, "setFrame:", x, y, width, height);
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    -[CRLCanvasLayer unscaledContentCenter](self, "unscaledContentCenter");
    v25 = v24;
    v27 = v26;
    mViewScale = self->mViewScale;
    if (mViewScale != a3)
      -[CRLCanvasLayer p_setViewScale:](self, "p_setViewScale:", a3);
    -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
    if (v7)
    {
      -[CRLCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v25, v27);
      objc_msgSend(v31, "setContentOffset:animated:", 0);
    }
    if (mViewScale != a3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mController);
      objc_msgSend(WeakRetained, "i_viewScaleDidChange");

    }
    if (v19)
    {
      v30 = objc_loadWeakRetained((id *)&self->mController);
      objc_msgSend(v30, "i_viewScrollDidChange");

    }
  }

}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 duration:(double)a6 completionBlock:(id)a7
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  id v16;
  id v17;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  v16 = a7;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayer zoomAnimationDefaultCAAnimation](CRLCanvasLayer, "zoomAnimationDefaultCAAnimation"));
  objc_msgSend(v17, "setDuration:", a6);
  -[CRLCanvasLayer animateToViewScale:contentCenter:contentInset:animation:completionBlock:](self, "animateToViewScale:contentCenter:contentInset:animation:completionBlock:", v17, v16, a3, x, y, top, left, bottom, right);

}

- (void)animateToViewScale:(double)a3 contentCenter:(CGPoint)a4 contentInset:(UIEdgeInsets)a5 animation:(id)a6 completionBlock:(id)a7
{
  double left;
  double top;
  double x;
  id v13;
  void (**v14)(id, BOOL);
  void *v15;
  void *v16;
  unint64_t mViewScaleAnimationCount;
  id WeakRetained;
  CRLInteractiveCanvasController **p_mController;
  id v20;
  double v21;
  unsigned __int8 v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
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
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double mViewScale;
  double v55;
  double v56;
  double v57;
  double v58;
  double MinX;
  CGFloat v60;
  double MinY;
  CGFloat Height;
  _QWORD *v63;
  _QWORD *v64;
  CFTimeInterval v65;
  CRLDisplayLink *mAnimateToViewScaleActiveDisplayLink;
  __int128 v67;
  CRLDisplayLink *v68;
  id v69;
  CRLDisplayLink *v70;
  _QWORD *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  CGFloat v92;
  double v93;
  double v94;
  double y;
  id v96;
  double right;
  double bottom;
  _QWORD v99[5];
  _QWORD *v100;
  id v101;
  id location;
  _QWORD v103[4];
  id v104;
  id v105[3];
  CGAffineTransform v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  CATransform3D t1;
  CATransform3D a;
  _QWORD v112[4];
  void (**v113)(id, BOOL);
  id v114[10];
  _QWORD v115[5];
  CATransform3D v116;
  unsigned __int8 v117;
  CATransform3D v118;
  CGAffineTransform t2;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  v13 = a6;
  v14 = (void (**)(id, BOOL))a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "enclosingScrollView"));

  if (a3 <= 0.0
    || self->mViewScale == a3
    && (-[CRLCanvasLayer contentInset](self, "contentInset"), left == v51)
    && top == v48
    && right == v50
    && bottom == v49
    && (-[CRLCanvasLayer unscaledContentCenter](self, "unscaledContentCenter", bottom), sub_10005FE60(x, y, v52, v53))
    && !self->mViewScaleAnimationCount)
  {
    if (v14)
      v14[2](v14, self->mViewScaleAnimationCount == 0);
  }
  else
  {
    mViewScaleAnimationCount = self->mViewScaleAnimationCount;
    self->mViewScaleAnimationCount = mViewScaleAnimationCount + 1;
    if (!mViewScaleAnimationCount)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mController);
      objc_msgSend(WeakRetained, "i_viewWillBeginZooming");

    }
    p_mController = &self->mController;
    v20 = objc_loadWeakRetained((id *)&self->mController);
    v21 = a3;
    objc_msgSend(v20, "i_viewDidZoomToViewScale:notify:", 0, a3);

    v22 = -[CRLCanvasLayer isLayoutDisabled](self, "isLayoutDisabled");
    -[CRLCanvasLayer setDisableLayout:](self, "setDisableLayout:", 1);
    if (!v13)
      v13 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayer zoomAnimationDefaultCAAnimation](CRLCanvasLayer, "zoomAnimationDefaultCAAnimation"));
    objc_msgSend(v13, "duration");
    v83 = v23;
    v90 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v91 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v121.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v121.c = v90;
    v89 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v121.tx = v89;
    -[CRLCanvasLayer bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    v85 = v29;
    v86 = v28;
    v30 = CGPointZero.x;
    v82 = v16;
    v92 = CGPointZero.x;
    v93 = CGPointZero.y;
    v87 = x;
    v88 = left;
    v84 = top;
    if (v16)
    {
      v31 = sub_1000603B8(CGPointZero.x, CGPointZero.y, v24);
      v80 = v32;
      v81 = v31;
      objc_msgSend(v16, "frame");
      -[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:", v33, v34, v21, top, left, bottom, right);
      v36 = v35;
      -[CRLCanvasLayer p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:](self, "p_scrollViewContentOffsetForUnscaledContentCenter:viewScale:contentInset:", x, y, v21, top, left, bottom, right);
      v38 = v37;
      v40 = v39;
      v41 = sub_1000603B8(CGPointZero.x, v93, v36);
      v94 = v42;
      objc_msgSend(v16, "contentOffset");
      v30 = sub_1000603B8(v81, v80, v43);
      v45 = v44;
      v46 = sub_1000603B8(v41, v94, v38);
      v92 = v38;
      v93 = v40;
    }
    else
    {
      v47 = CGPointZero.y;
      v46 = CGPointZero.x;
      v45 = v47;
    }
    *(_OWORD *)&v118.m11 = v91;
    *(_OWORD *)&v118.m13 = v90;
    *(_OWORD *)&v118.m21 = v89;
    CGAffineTransformTranslate(&v121, (CGAffineTransform *)&v118, v46 - v30, v47 - v45);
    mViewScale = self->mViewScale;
    memset(&v120, 0, sizeof(v120));
    CGAffineTransformMakeScale(&v120, v21 / mViewScale, v21 / mViewScale);
    -[CRLCanvasLayer anchorPoint](self, "anchorPoint");
    v56 = v55;
    v58 = v57;
    v122.origin.x = v25;
    v122.origin.y = v27;
    v122.size.width = v86;
    v122.size.height = v85;
    MinX = CGRectGetMinX(v122);
    v123.origin.x = v25;
    v123.origin.y = v27;
    v123.size.width = v86;
    v123.size.height = v85;
    v60 = MinX + v56 * CGRectGetWidth(v123);
    v124.origin.x = v25;
    v124.origin.y = v27;
    v124.size.width = v86;
    v124.size.height = v85;
    MinY = CGRectGetMinY(v124);
    v125.origin.x = v25;
    v125.origin.y = v27;
    v125.size.width = v86;
    v125.size.height = v85;
    Height = CGRectGetHeight(v125);
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v120.a;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v120.c;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v120.tx;
    sub_1000796D4(&t1, (CGAffineTransform *)&v118, v60, MinY + v58 * Height);
    *(_OWORD *)&v120.c = *(_OWORD *)&v118.m13;
    *(_OWORD *)&v120.tx = *(_OWORD *)&v118.m21;
    *(_OWORD *)&v120.a = *(_OWORD *)&v118.m11;
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v118.m11;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v118.m13;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v118.m21;
    t2 = v121;
    CGAffineTransformConcat((CGAffineTransform *)&v118, (CGAffineTransform *)&t1, &t2);
    *(_OWORD *)&v121.a = *(_OWORD *)&v118.m11;
    *(_OWORD *)&v121.c = *(_OWORD *)&v118.m13;
    *(_OWORD *)&v121.tx = *(_OWORD *)&v118.m21;
    memset(&v118, 0, sizeof(v118));
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v121.a;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v121.c;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v121.tx;
    CATransform3DMakeAffineTransform(&v118, (CGAffineTransform *)&t1);
    v118.m33 = v118.m11;
    v116 = v118;
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_10008CFF8;
    v115[3] = &unk_1012325D8;
    v115[4] = self;
    v117 = v22;
    v63 = objc_retainBlock(v115);
    objc_initWeak((id *)&t2, self);
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_10008D064;
    v112[3] = &unk_101232600;
    objc_copyWeak(v114, (id *)&t2);
    v113 = v14;
    v114[1] = *(id *)&v21;
    v114[2] = *(id *)&v84;
    v114[3] = *(id *)&v88;
    v114[4] = *(id *)&bottom;
    v114[5] = *(id *)&right;
    v114[6] = *(id *)&v92;
    v114[7] = *(id *)&v93;
    v114[8] = *(id *)&v87;
    v114[9] = *(id *)&y;
    v64 = objc_retainBlock(v112);
    -[CRLCanvasLayer transform](self, "transform");
    t1 = v118;
    if (CATransform3DEqualToTransform(&a, &t1))
    {
      ((void (*)(_QWORD *))v63[2])(v63);
      ((void (*)(_QWORD *))v64[2])(v64);
    }
    else
    {
      v65 = CACurrentMediaTime();
      *(_OWORD *)&t1.m11 = v91;
      *(_OWORD *)&t1.m13 = v90;
      *(_OWORD *)&t1.m21 = v89;
      mAnimateToViewScaleActiveDisplayLink = self->mAnimateToViewScaleActiveDisplayLink;
      if (mAnimateToViewScaleActiveDisplayLink)
      {
        -[CRLDisplayLink setPaused:](mAnimateToViewScaleActiveDisplayLink, "setPaused:", 1);
        v67 = *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.c;
        *(_OWORD *)&t1.m11 = *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.a;
        *(_OWORD *)&t1.m13 = v67;
        *(_OWORD *)&t1.m21 = *(_OWORD *)&self->mAnimateToViewScaleCurrentTransform.tx;
      }
      v68 = [CRLDisplayLink alloc];
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_10008D230;
      v103[3] = &unk_101232628;
      v105[1] = v83;
      objc_copyWeak(v105, (id *)&t2);
      v105[2] = *(id *)&v65;
      v96 = v13;
      v69 = v13;
      v104 = v69;
      v106 = v121;
      v107 = *(_OWORD *)&t1.m11;
      v108 = *(_OWORD *)&t1.m13;
      v109 = *(_OWORD *)&t1.m21;
      v70 = -[CRLDisplayLink initWithHandler:](v68, "initWithHandler:", v103);
      objc_storeStrong((id *)&self->mAnimateToViewScaleActiveDisplayLink, v70);
      objc_initWeak(&location, v70);
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_10008D330;
      v99[3] = &unk_101232650;
      objc_copyWeak(&v101, &location);
      v99[4] = self;
      v100 = v64;
      v71 = objc_retainBlock(v99);
      -[CRLDisplayLink setPaused:](v70, "setPaused:", 0);
      v72 = objc_loadWeakRetained((id *)p_mController);
      objc_msgSend(v72, "beginAnimations:", &stru_1012A72B0);

      v73 = objc_loadWeakRetained((id *)p_mController);
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "i_currentAnimation"));
      objc_msgSend(v74, "setDuration:", *(double *)&v83);

      v75 = objc_loadWeakRetained((id *)p_mController);
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "i_currentAnimation"));
      objc_msgSend(v76, "setAnimation:forLayer:forKey:", v69, self, CFSTR("transform"));

      v77 = objc_loadWeakRetained((id *)p_mController);
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "i_currentAnimation"));
      objc_msgSend(v78, "setCompletionBlock:", v71);

      ((void (*)(_QWORD *))v63[2])(v63);
      v79 = objc_loadWeakRetained((id *)p_mController);
      objc_msgSend(v79, "commitAnimations");

      objc_destroyWeak(&v101);
      objc_destroyWeak(&location);

      objc_destroyWeak(v105);
      v13 = v96;
    }

    objc_destroyWeak(v114);
    objc_destroyWeak((id *)&t2);

    v16 = v82;
  }

}

- (void)setScrollViewFrameMaintainingApparentScrollPosition:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enclosingScrollView"));

  if (v23)
  {
    objc_msgSend(v23, "frame");
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    if (!CGRectEqualToRect(v24, v25))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
      objc_msgSend(v23, "bounds");
      objc_msgSend(v11, "convertPoint:fromView:", v23, sub_100061400(v12, v13, v14, v15));
      v17 = v16;
      v19 = v18;

      v20 = sub_1000603DC(v17, v19, 1.0 / self->mViewScale);
      v22 = v21;
      objc_msgSend(v23, "setFrame:", x, y, width, height);
      -[CRLCanvasLayer contentOffsetForUnscaledContentCenter:](self, "contentOffsetForUnscaledContentCenter:", v20, v22);
      objc_msgSend(v23, "setContentOffset:animated:", v4);
    }
  }
  -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");

}

- (void)p_setViewScale:(double)a3
{
  double mViewScale;
  id WeakRetained;
  void *v7;

  -[CRLCanvasLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("viewScale"));
  self->mViewScale = a3;
  -[CRLCanvasLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("viewScale"));
  mViewScale = self->mViewScale;
  WeakRetained = objc_loadWeakRetained((id *)&self->mController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
  objc_msgSend(v7, "setViewScale:", mViewScale);

  -[CRLCanvasBackgroundLayer setViewScale:](self->mCanvasBackgroundLayer, "setViewScale:", self->mViewScale);
}

- (void)p_setViewScale:(double)a3 preservingScrollOffset:(BOOL)a4
{
  double mViewScale;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  double v14;
  double x;
  double v16;
  double y;
  id WeakRetained;
  unsigned int v19;
  id v20;
  double v21;
  double v22;
  id v23;
  id v24;

  mViewScale = self->mViewScale;
  if (a3 > 0.0 && mViewScale != a3)
  {
    if (a4
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView", mViewScale)),
          v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enclosingScrollView")),
          v8,
          v24))
    {
      objc_msgSend(v24, "contentOffset");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v24, "contentSize");
      v13 = 0;
      x = v10 / v14;
      y = v12 / v16;
    }
    else
    {
      v24 = 0;
      x = CGPointZero.x;
      y = CGPointZero.y;
      v13 = 1;
    }
    -[CRLCanvasLayer p_setViewScale:](self, "p_setViewScale:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    v19 = objc_msgSend(WeakRetained, "shouldCanvasScrollingSizeGrowToFitBoardContent");

    if (v19)
    {
      v20 = objc_loadWeakRetained((id *)&self->mController);
      objc_msgSend(v20, "i_canvasDidUpdateVisibleBounds");

    }
    -[CRLCanvasLayer p_setEnclosingScrollViewZoomParameters](self, "p_setEnclosingScrollViewZoomParameters");
    -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
    if ((v13 & 1) == 0)
    {
      objc_msgSend(v24, "contentSize");
      objc_msgSend(v24, "setContentOffset:animated:", 0, sub_1000630C4(x * v21, y * v22));
    }
    v23 = objc_loadWeakRetained((id *)&self->mController);
    objc_msgSend(v23, "i_viewScaleDidChange");

  }
}

- (void)p_setEnclosingScrollViewZoomParameters
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "enclosingScrollView"));

  if (v3)
  {
    objc_msgSend(v3, "setMinimumZoomScale:", 1.0);
    objc_msgSend(v3, "setMaximumZoomScale:", 1.0);
    objc_msgSend(v3, "setZoomScale:", 1.0);
  }

}

- (CGRect)p_fixedScaledBoundsForScrollViewSize:(CGSize)a3 viewScale:(double)a4 contentInset:(UIEdgeInsets)a5
{
  CGFloat left;
  CGFloat top;
  CGSize *p_mUnscaledSize;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;
  void *v18;
  unsigned int v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  void *v37;
  NSString *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  id v51;
  unsigned int v52;
  id v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  unsigned int v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v89;
  double v90;
  CGFloat v91;
  id v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  CGFloat v102;
  CGFloat v103;
  NSObject *v104;
  NSString *v105;
  void *v106;
  NSString *v107;
  void *v108;
  double v109;
  double v110;
  CGFloat r2;
  CGFloat v112;
  CGFloat v113;
  double v114;
  double right;
  CGFloat v116;
  double bottom;
  double v118;
  double v119;
  double v120;
  double v122;
  CGAffineTransform v123;
  uint8_t buf[4];
  unsigned int v125;
  __int16 v126;
  const char *v127;
  __int16 v128;
  const char *v129;
  __int16 v130;
  int v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  CGSize v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect result;
  CGRect v144;

  left = a5.left;
  top = a5.top;
  p_mUnscaledSize = &self->mUnscaledSize;
  if (self->mUnscaledSize.width == CGSizeZero.width && self->mUnscaledSize.height == CGSizeZero.height)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    right = a5.right;
    bottom = a5.bottom;
    v10 = sub_10005FDDC();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    WeakRetained = objc_loadWeakRetained((id *)&self->mController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
    v19 = objc_msgSend(v18, "isAnchoredAtRight");

    v119 = left;
    v120 = top;
    if (v19)
    {
      CGAffineTransformMakeScale(&v123, -1.0, 1.0);
      v137.origin.x = v10;
      v137.origin.y = v12;
      v137.size.width = v14;
      v137.size.height = v16;
      v138 = CGRectApplyAffineTransform(v137, &v123);
      v10 = v138.origin.x;
      v12 = v138.origin.y;
      v14 = v138.size.width;
      v16 = v138.size.height;
    }
    v20 = objc_loadWeakRetained((id *)&self->mController);
    objc_msgSend(v20, "growUnscaledCanvasLayerRect:withViewScale:", v10, v12, v14, v16, a4);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v113 = v12;
    v114 = v10;
    v112 = v14;
    v29 = v14;
    v30 = v16;
    if (!sub_10005FFE0(v22, v24, v26, v28, v10, v12, v29, v16))
    {
      v31 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232670);
      v32 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v102 = p_mUnscaledSize->width;
        v103 = p_mUnscaledSize->height;
        v104 = v32;
        v136.width = v102;
        v136.height = v103;
        v105 = NSStringFromCGSize(v136);
        v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
        v142.origin.x = v22;
        v142.origin.y = v24;
        v142.size.width = v26;
        v142.size.height = v28;
        v107 = NSStringFromCGRect(v142);
        v108 = (void *)objc_claimAutoreleasedReturnValue(v107);
        *(_DWORD *)buf = 67110402;
        v125 = v31;
        v126 = 2082;
        v127 = "-[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:]";
        v128 = 2082;
        v129 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayer.m";
        v130 = 1024;
        v131 = 862;
        v132 = 2112;
        v133 = v106;
        v134 = 2112;
        v135 = v108;
        _os_log_error_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected canvas layer not to shrink in -growUnscaledCanvasLayerRect:, but jumped from %@ to %@, ignoring provided rect.", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232690);
      v33 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayer.m"));
      v36 = NSStringFromCGSize(*p_mUnscaledSize);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v139.origin.x = v22;
      v139.origin.y = v24;
      v139.size.width = v26;
      v139.size.height = v28;
      v38 = NSStringFromCGRect(v139);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 862, 0, "expected canvas layer not to shrink in -growUnscaledCanvasLayerRect:, but jumped from %@ to %@, ignoring provided rect.", v37, v39);

      v24 = v113;
      v22 = v114;
      v26 = v112;
      v28 = v16;
    }
    v40 = v119 + sub_100060FD8(v22, v24, v26, v28, a4);
    v42 = v120 + v41;
    v43 = v119 + right;
    v45 = v44 - (v119 + right);
    v46 = v120 + bottom;
    v48 = v47 - (v120 + bottom);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "enclosingScrollView"));

    if (v50)
    {
      v51 = objc_loadWeakRetained((id *)&self->mController);
      v52 = objc_msgSend(v51, "shouldResizeCanvasToScrollView");

      if (v52)
      {
        v110 = v48;
        r2 = v45;
        v116 = v40;
        v118 = v42;
        v53 = objc_loadWeakRetained((id *)&self->mController);
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "canvas"));
        objc_msgSend(v54, "contentsScale");
        v109 = v55;

        v56 = sub_10005FDDC();
        v58 = v57;
        v60 = v59;
        objc_msgSend(v50, "scrollableAreaContentInsets", v56);
        v63 = v58 - (v61 + v62);
        v66 = v60 - (v64 + v65);
        v67 = sub_100060FD8(v114, v113, v112, v30, a4);
        v122 = v68;
        v69 = v119 + v67;
        v71 = v70 - v43;
        v73 = v72 - v46;
        v74 = v63;
        v75 = sub_1000603B8(v63, v66, v70 - v43);
        if (v75 <= 0.0)
        {
          v74 = v71;
          v83 = v120;
          v84 = v110;
        }
        else
        {
          v77 = v75;
          v78 = v76;
          v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "canvas"));
          v81 = objc_msgSend(v80, "isAnchoredAtRight");

          v82 = 0.0;
          if (v81)
            v82 = v77;
          v69 = v69 - v82;
          v83 = v120;
          if (-[CRLCanvasLayer horizontallyCenteredInScrollView](self, "horizontallyCenteredInScrollView"))
            v69 = sub_10006309C(v69 + v77 * -0.5, v109);
          v84 = v110;
          v76 = v78;
        }
        v89 = v83 + v122;
        if (v76 <= 0.0)
        {
          v66 = v73;
          v91 = v118;
        }
        else
        {
          v90 = v76;
          v91 = v118;
          if (-[CRLCanvasLayer verticallyCenteredInScrollView](self, "verticallyCenteredInScrollView"))
            v89 = sub_10006309C(v89 + v90 * -0.5, v109);
        }
        v144.origin.x = v116;
        v140.origin.x = v69;
        v140.origin.y = v89;
        v140.size.width = v74;
        v140.size.height = v66;
        v144.origin.y = v91;
        v144.size.width = r2;
        v144.size.height = v84;
        v141 = CGRectUnion(v140, v144);
        v40 = v141.origin.x;
        v42 = v141.origin.y;
        v45 = v141.size.width;
        v48 = v141.size.height;
      }
    }
    v92 = objc_loadWeakRetained((id *)&self->mController);
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "canvas"));
    objc_msgSend(v93, "contentsScale");
    x = sub_100063150(v40, v42, v45, v48, v94);
    y = v95;
    width = v96;
    height = v97;

  }
  v98 = x;
  v99 = y;
  v100 = width;
  v101 = height;
  result.size.height = v101;
  result.size.width = v100;
  result.origin.y = v99;
  result.origin.x = v98;
  return result;
}

- (void)p_fixFrameAndScrollView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double mViewScale;
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
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  id v30;
  unsigned __int8 v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  unsigned __int8 v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  id v74;
  CGRect v75;
  CGRect v76;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->mController);
  objc_msgSend(WeakRetained, "sizeOfScrollViewEnclosingCanvas");
  v10 = v9;
  v12 = v11;
  mViewScale = self->mViewScale;
  -[CRLCanvasLayer contentInset](self, "contentInset");
  -[CRLCanvasLayer p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:](self, "p_fixedScaledBoundsForScrollViewSize:viewScale:contentInset:", v10, v12, mViewScale, v14, v15, v16, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v74 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  objc_msgSend(v74, "bounds");
  v76.origin.x = v26;
  v76.origin.y = v27;
  v76.size.width = v28;
  v76.size.height = v29;
  v75.origin.x = v19;
  v75.origin.y = v21;
  v75.size.width = v23;
  v75.size.height = v25;
  if (!CGRectEqualToRect(v75, v76)
    || (v30 = objc_loadWeakRetained((id *)&self->mController),
        v31 = objc_msgSend(v30, "currentlyScrolling"),
        v30,
        (v31 & 1) == 0))
  {
    objc_msgSend(v74, "setBounds:", v19, v21, v23, v25);
    v32 = sub_10005FDDC();
    -[CRLCanvasLayer setPosition:](self, "setPosition:", sub_100061400(v32, v33, v34, v35));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "enclosingScrollView"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
    v39 = objc_msgSend(v38, "i_shouldAttemptToPreserveContentOffsetAfterFixFrame");

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "canvas"));
      v42 = objc_msgSend(v41, "isAnchoredAtRight");

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
      v44 = v43;
      if (v42)
      {
        objc_msgSend(v43, "contentOffset");
        v7 = v45;

        objc_msgSend(v37, "scrollableAreaBounds");
        v47 = v46;
        v49 = v48;
        objc_msgSend(v37, "adjustedContentInset");
        v52 = v47 - (v50 + v51);
        v55 = v49 - (v53 + v54);
        -[CRLCanvasLayer viewScale](self, "viewScale");
        v57 = sub_1000603DC(v52, v55, 1.0 / v56);
        -[CRLCanvasLayer contentInset](self, "contentInset");
        v59 = -v58;
        -[CRLCanvasLayer viewScale](self, "viewScale");
        v61 = v59 / v60 - v57;
      }
      else
      {
        v62 = objc_msgSend(v43, "shouldCanvasScrollingSizeGrowToFitBoardContent");

        if ((v62 & 1) != 0)
        {
          v61 = v5;
        }
        else
        {
          objc_msgSend(v37, "contentSize");
          v64 = v63;
          objc_msgSend(v37, "scrollableAreaBounds");
          v66 = v64 - v65;
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contentView"));
          objc_msgSend(v74, "convertPoint:fromView:", v67, v66, 0.0);
          v69 = v68;

          objc_msgSend(v37, "adjustedContentInset");
          v71 = v69 + v70;
          -[CRLCanvasLayer viewScale](self, "viewScale");
          v61 = v71 / v72;
        }
      }
      if (v5 > v61)
        v5 = v61;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
      objc_msgSend(v73, "setContentOffset:source:scrollOptions:", CFSTR("CRLCanvasLayerFixFrameInteractionSource"), 0, v5, v7);

    }
    if (v37)
    {
      objc_msgSend(v37, "setZoomScale:", 1.0);
      objc_msgSend(v37, "setContentSize:", v23, v25);
    }

  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (UIEdgeInsets)contentInset
{
  double left;
  double top;
  double right;
  double bottom;
  void *v7;
  void *v8;
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
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  top = self->mContentInset.top;
  left = self->mContentInset.left;
  bottom = self->mContentInset.bottom;
  right = self->mContentInset.right;
  if (-[CRLCanvasLayer shouldExtendBeyondSafeArea](self, "shouldExtendBeyondSafeArea"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enclosingScrollView"));

    objc_msgSend(v8, "adjustedContentInset");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "safeAreaInsets");
    top = top - fmax(v17 - v10, 0.0);
    left = left - fmax(v18 - v12, 0.0);
    bottom = bottom - fmax(v19 - v14, 0.0);
    right = right - fmax(v20 - v16, 0.0);

  }
  v21 = top;
  v22 = left;
  v23 = bottom;
  v24 = right;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)p_scrollViewSafeAreaInsetsDidChange:(id)a3
{
  void *v4;
  id v5;
  unsigned int v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingScrollView"));
  if (v7 == v5)
  {
    v6 = -[CRLCanvasLayer shouldExtendBeyondSafeArea](self, "shouldExtendBeyondSafeArea");

    if (v6)
      -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  }
  else
  {

  }
}

- (void)p_scrollViewContentInsetDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer canvasView](self, "canvasView"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingScrollView"));
  if (v8 == v5 && -[CRLCanvasLayer shouldExtendBeyondSafeArea](self, "shouldExtendBeyondSafeArea"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayer controller](self, "controller"));
    v7 = objc_msgSend(v6, "animatingViewScale");

    if ((v7 & 1) == 0)
      -[CRLCanvasLayer fixFrameAndScrollView](self, "fixFrameAndScrollView");
  }
  else
  {

  }
}

- (void)updateCanvasEdgeLayersIfNecessary
{
  _TtC8Freeform24CRLCanvasBackgroundLayer **p_mAssociatedBackgroundLayer;
  id WeakRetained;
  unsigned int v5;
  CALayer *mLeftEdgeLayer;
  CALayer *v7;
  CALayer *mRightEdgeLayer;
  CALayer *v9;
  CALayer *mTopEdgeLayer;
  CALayer *v11;
  CALayer *mBottomEdgeLayer;
  CALayer *v13;
  double y;
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CRLNoDefaultImplicitActionLayer *v32;
  CALayer *v33;
  CRLNoDefaultImplicitActionLayer *v34;
  CALayer *v35;
  CRLNoDefaultImplicitActionLayer *v36;
  CALayer *v37;
  CRLNoDefaultImplicitActionLayer *v38;
  CALayer *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  id v48;
  id v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double MaxY;
  double MaxX;
  id v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  p_mAssociatedBackgroundLayer = &self->mAssociatedBackgroundLayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
  v5 = objc_msgSend(WeakRetained, "scalesWithCanvas");

  mLeftEdgeLayer = self->mLeftEdgeLayer;
  if (v5)
  {
    if (mLeftEdgeLayer)
    {
      -[CALayer removeFromSuperlayer](mLeftEdgeLayer, "removeFromSuperlayer");
      v7 = self->mLeftEdgeLayer;
      self->mLeftEdgeLayer = 0;

    }
    mRightEdgeLayer = self->mRightEdgeLayer;
    if (mRightEdgeLayer)
    {
      -[CALayer removeFromSuperlayer](mRightEdgeLayer, "removeFromSuperlayer");
      v9 = self->mRightEdgeLayer;
      self->mRightEdgeLayer = 0;

    }
    mTopEdgeLayer = self->mTopEdgeLayer;
    if (mTopEdgeLayer)
    {
      -[CALayer removeFromSuperlayer](mTopEdgeLayer, "removeFromSuperlayer");
      v11 = self->mTopEdgeLayer;
      self->mTopEdgeLayer = 0;

    }
    mBottomEdgeLayer = self->mBottomEdgeLayer;
    if (mBottomEdgeLayer)
    {
      -[CALayer removeFromSuperlayer](mBottomEdgeLayer, "removeFromSuperlayer");
      v13 = self->mBottomEdgeLayer;
      self->mBottomEdgeLayer = 0;

    }
    y = CGPointZero.y;
    v15 = objc_loadWeakRetained((id *)p_mAssociatedBackgroundLayer);
    objc_msgSend(v15, "setAnchorPoint:", CGPointZero.x, y);

    -[CRLCanvasLayer bounds](self, "bounds");
    v20 = sub_100061514(v16, v17, v18, v19);
    v22 = v21;
    v23 = objc_loadWeakRetained((id *)p_mAssociatedBackgroundLayer);
    objc_msgSend(v23, "setPosition:", v20, v22);

    -[CRLCanvasLayer bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v58 = objc_loadWeakRetained((id *)p_mAssociatedBackgroundLayer);
    objc_msgSend(v58, "setBounds:", v25, v27, v29, v31);

  }
  else
  {
    if (!mLeftEdgeLayer)
    {
      v32 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      v33 = self->mLeftEdgeLayer;
      self->mLeftEdgeLayer = &v32->super;

      -[CRLCanvasLayer addSublayer:](self, "addSublayer:", self->mLeftEdgeLayer);
    }
    if (!self->mRightEdgeLayer)
    {
      v34 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      v35 = self->mRightEdgeLayer;
      self->mRightEdgeLayer = &v34->super;

      -[CRLCanvasLayer addSublayer:](self, "addSublayer:", self->mRightEdgeLayer);
    }
    if (!self->mTopEdgeLayer)
    {
      v36 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      v37 = self->mTopEdgeLayer;
      self->mTopEdgeLayer = &v36->super;

      -[CRLCanvasLayer addSublayer:](self, "addSublayer:", self->mTopEdgeLayer);
    }
    if (!self->mBottomEdgeLayer)
    {
      v38 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      v39 = self->mBottomEdgeLayer;
      self->mBottomEdgeLayer = &v38->super;

      -[CRLCanvasLayer addSublayer:](self, "addSublayer:", self->mBottomEdgeLayer);
    }
    -[CRLCanvasLayer bounds](self, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v48 = objc_loadWeakRetained((id *)&self->mController);
    v49 = objc_msgSend(v48, "canvasEdgeBackgroundColor");

    -[CALayer setBackgroundColor:](self->mLeftEdgeLayer, "setBackgroundColor:", v49);
    v59.origin.x = v41;
    v59.origin.y = v43;
    v59.size.width = v45;
    v59.size.height = v47;
    v50 = CGRectGetMinX(v59) + -5000.0;
    v60.origin.x = v41;
    v60.origin.y = v43;
    v60.size.width = v45;
    v60.size.height = v47;
    v51 = CGRectGetMinY(v60) + -5000.0;
    v61.origin.x = v41;
    v61.origin.y = v43;
    v61.size.width = v45;
    v61.size.height = v47;
    CGRectGetHeight(v61);
    -[CALayer setFrame:](self->mLeftEdgeLayer, "setFrame:", v50, v51);
    -[CALayer setBackgroundColor:](self->mRightEdgeLayer, "setBackgroundColor:", v49);
    v62.origin.x = v41;
    v62.origin.y = v43;
    v62.size.width = v45;
    v62.size.height = v47;
    MaxX = CGRectGetMaxX(v62);
    v63.origin.x = v41;
    v63.origin.y = v43;
    v63.size.width = v45;
    v63.size.height = v47;
    v52 = CGRectGetMinY(v63) + -5000.0;
    v64.origin.x = v41;
    v64.origin.y = v43;
    v64.size.width = v45;
    v64.size.height = v47;
    -[CALayer setFrame:](self->mRightEdgeLayer, "setFrame:", MaxX, v52, 5000.0, CGRectGetHeight(v64) + 10000.0);
    -[CALayer setBackgroundColor:](self->mTopEdgeLayer, "setBackgroundColor:", v49);
    v65.origin.x = v41;
    v65.origin.y = v43;
    v65.size.width = v45;
    v65.size.height = v47;
    v53 = CGRectGetMinX(v65) + -5000.0;
    v66.origin.x = v41;
    v66.origin.y = v43;
    v66.size.width = v45;
    v66.size.height = v47;
    v54 = CGRectGetMinY(v66) + -5000.0;
    v67.origin.x = v41;
    v67.origin.y = v43;
    v67.size.width = v45;
    v67.size.height = v47;
    -[CALayer setFrame:](self->mTopEdgeLayer, "setFrame:", v53, v54, CGRectGetWidth(v67) + 10000.0, 5000.0);
    -[CALayer setBackgroundColor:](self->mBottomEdgeLayer, "setBackgroundColor:", v49);
    v68.origin.x = v41;
    v68.origin.y = v43;
    v68.size.width = v45;
    v68.size.height = v47;
    v55 = CGRectGetMinX(v68) + -5000.0;
    v69.origin.x = v41;
    v69.origin.y = v43;
    v69.size.width = v45;
    v69.size.height = v47;
    MaxY = CGRectGetMaxY(v69);
    v70.origin.x = v41;
    v70.origin.y = v43;
    v70.size.width = v45;
    v70.size.height = v47;
    -[CALayer setFrame:](self->mBottomEdgeLayer, "setFrame:", v55, MaxY, CGRectGetWidth(v70) + 10000.0, 5000.0);
  }
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

- (CRLInteractiveCanvasController)controller
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->mController);
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

- (BOOL)shouldExtendBeyondSafeArea
{
  return self->mShouldExtendBeyondSafeArea;
}

- (void)setShouldExtendBeyondSafeArea:(BOOL)a3
{
  self->mShouldExtendBeyondSafeArea = a3;
}

- (BOOL)isLayoutDisabled
{
  return self->mDisableLayout;
}

- (void)setDisableLayout:(BOOL)a3
{
  self->mDisableLayout = a3;
}

- (BOOL)horizontallyCenteredInScrollView
{
  return self->mHorizontallyCenteredInScrollView;
}

- (BOOL)verticallyCenteredInScrollView
{
  return self->mVerticallyCenteredInScrollView;
}

- (_TtC8Freeform24CRLCanvasBackgroundLayer)associatedBackgroundLayer
{
  return (_TtC8Freeform24CRLCanvasBackgroundLayer *)objc_loadWeakRetained((id *)&self->mAssociatedBackgroundLayer);
}

- (void)setAssociatedBackgroundLayer:(id)a3
{
  objc_storeWeak((id *)&self->mAssociatedBackgroundLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mAssociatedBackgroundLayer);
  objc_storeStrong((id *)&self->mAnimateToViewScaleActiveDisplayLink, 0);
  objc_storeStrong((id *)&self->mRightEdgeLayer, 0);
  objc_storeStrong((id *)&self->mLeftEdgeLayer, 0);
  objc_storeStrong((id *)&self->mBottomEdgeLayer, 0);
  objc_storeStrong((id *)&self->mTopEdgeLayer, 0);
  objc_storeStrong((id *)&self->mCanvasBackgroundLayer, 0);
  objc_destroyWeak((id *)&self->mController);
}

@end
