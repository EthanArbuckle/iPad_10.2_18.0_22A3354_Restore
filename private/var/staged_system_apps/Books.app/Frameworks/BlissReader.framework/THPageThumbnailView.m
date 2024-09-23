@implementation THPageThumbnailView

+ (id)thumbnailQueue
{
  if (qword_5431C8 != -1)
    dispatch_once(&qword_5431C8, &stru_428D28);
  return (id)qword_5431C0;
}

+ (CGImage)thumbnailPlaceholder
{
  if (qword_5431D8 != -1)
    dispatch_once(&qword_5431D8, &stru_428D48);
  return (CGImage *)qword_5431D0;
}

- (THPageThumbnailView)initWithFrame:(CGRect)a3 isFirstThumbnail:(BOOL)a4 delegate:(id)a5
{
  _BOOL4 v6;
  THPageThumbnailView *v7;
  THPageThumbnailView *v8;
  THPageThumbnailViewTapGestureRecognizer *v9;
  uint64_t v10;
  double v11;
  CGSize size;
  CGSize v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)THPageThumbnailView;
  v7 = -[THPageThumbnailView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9 = -[THPageThumbnailViewTapGestureRecognizer initWithTarget:action:]([THPageThumbnailViewTapGestureRecognizer alloc], "initWithTarget:action:", v7, "p_handleTap:");
    v8->mSingleTapGR = v9;
    v10 = 1;
    -[THPageThumbnailViewTapGestureRecognizer setNumberOfTapsRequired:](v9, "setNumberOfTapsRequired:", 1);
    -[THPageThumbnailViewTapGestureRecognizer setDelegate:](v8->mSingleTapGR, "setDelegate:", v8);
    -[THPageThumbnailView addGestureRecognizer:](v8, "addGestureRecognizer:", v8->mSingleTapGR);
    v8->mImageLayer = (CALayer *)objc_alloc_init((Class)CALayer);
    -[THPageThumbnailView bounds](v8, "bounds");
    -[CALayer setFrame:](v8->mImageLayer, "setFrame:");
    objc_msgSend(-[THPageThumbnailView layer](v8, "layer"), "addSublayer:", v8->mImageLayer);
    -[CALayer setHidden:](v8->mImageLayer, "setHidden:", 1);

    v8->mDelegate = (THPageThumbnailViewDelegate *)a5;
    if (v6)
    {
      objc_msgSend(-[THPageThumbnailView layer](v8, "layer"), "setZPosition:", 1.0);
      v10 = 2;
    }
    -[THPageThumbnailView p_setBorderMode:](v8, "p_setBorderMode:", v10);
    -[THPageThumbnailView frame](v8, "frame");
    v8->mPageNumberView = -[THPageNumberView initWithPosition:]([THPageNumberView alloc], "initWithPosition:", v11 + -3.0, 23.0 + 3.0);
    -[UILabel setTextColor:](-[THPageNumberView label](v8->mPageNumberView, "label"), "setTextColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.156862745, 1.0));
    -[THPageThumbnailView addSubview:](v8, "addSubview:", v8->mPageNumberView);

    -[THPageThumbnailView setOpaque:](v8, "setOpaque:", 1);
    size = CGRectZero.size;
    v8->mHighlightedRelativeRect.origin = CGRectZero.origin;
    v8->mHighlightedRelativeRect.size = size;
    v13 = CGRectZero.size;
    v8->mHighlightedActualRect.origin = CGRectZero.origin;
    v8->mHighlightedActualRect.size = v13;
  }
  return v8;
}

- (void)setPageNumberText:(id)a3
{
  -[THPageNumberView setPageNumberText:](self->mPageNumberView, "setPageNumberText:", a3);
}

- (void)setIsCurrentPage:(BOOL)a3
{
  -[THPageNumberView setIsCurrentPage:](self->mPageNumberView, "setIsCurrentPage:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[THPageThumbnailView p_clearTimer](self, "p_clearTimer");
  -[THWFreeTransformController setTargetLayer:](self->mFreeTransformController, "setTargetLayer:", 0);
  -[THWFreeTransformController setTransformGR:](self->mFreeTransformController, "setTransformGR:", 0);
  -[THWFreeTransformController clearGestureRecognizer](self->mFreeTransformController, "clearGestureRecognizer");

  self->mFreeTransformController = 0;
  objc_msgSend(-[THWFreeTransformGestureRecognizer view](-[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "view"), "removeGestureRecognizer:", -[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"));
  -[THPageThumbnailView setFreeTransformGestureRecognizer:](self, "setFreeTransformGestureRecognizer:", 0);

  self->mSingleTapGR = 0;
  self->mBorderView = 0;
  -[UIView removeFromSuperview](self->mLeftBorderView, "removeFromSuperview");

  self->mLeftBorderView = 0;
  -[UIView removeFromSuperview](self->mRightBorderView, "removeFromSuperview");

  self->mRightBorderView = 0;
  self->mCanvasWrapperView = 0;
  -[UIView removeFromSuperview](self->mHighlightView, "removeFromSuperview");

  self->mHighlightView = 0;
  self->_freeTransformController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageThumbnailView;
  -[THPageThumbnailView dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPageThumbnailView;
  return -[NSString stringByAppendingString:](-[THPageThumbnailView description](&v3, "description"), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" ch: %lu p: %lu"), self->mChapterIndex, self->mPageIndex));
}

- (void)setupFreeTransformWithDelegate:(id)a3
{
  THWFreeTransformController *v5;
  double v6;
  double v7;
  double v8;

  if (self->mFreeTransformController)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView setupFreeTransformWithDelegate:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 203, CFSTR("expected nil value for '%s'"), "mFreeTransformController");
  v5 = objc_alloc_init(THWFreeTransformController);
  self->mFreeTransformController = v5;
  -[THWFreeTransformController setDelegate:](v5, "setDelegate:", a3);
  -[THWFreeTransformController setScaleThreshold:](self->mFreeTransformController, "setScaleThreshold:", 1.5);
  -[THWFreeTransformController setTargetLayer:](self->mFreeTransformController, "setTargetLayer:", -[THPageThumbnailView layer](self, "layer"));
  -[THWFreeTransformController setSmoothEdges:](self->mFreeTransformController, "setSmoothEdges:", 1);
  objc_msgSend(-[THPageThumbnailView superview](self, "superview"), "frame");
  v7 = v6;
  -[THPageThumbnailView frame](self, "frame");
  -[THWFreeTransformController setTransformScale:](self->mFreeTransformController, "setTransformScale:", v7 / v8);
  -[THPageThumbnailView setFreeTransformGestureRecognizer:](self, "setFreeTransformGestureRecognizer:", -[THWFreeTransformGestureRecognizer initWithTarget:action:]([THWFreeTransformGestureRecognizer alloc], "initWithTarget:action:", self->mFreeTransformController, "transformGRChanged:"));
  -[THPageThumbnailView addGestureRecognizer:](self, "addGestureRecognizer:", -[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"));
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](-[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "setUnmovingParentView:", objc_msgSend(a3, "unmovingParentViewForFreeTransformController:", self->mFreeTransformController));
  -[THWFreeTransformGestureRecognizer setFreeTransformDelegate:](-[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "setFreeTransformDelegate:", self->mFreeTransformController);
  -[THWFreeTransformGestureRecognizer setUseGestureViewForReCentering:](-[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "setUseGestureViewForReCentering:", 1);
  -[THWFreeTransformController setTransformGR:](self->mFreeTransformController, "setTransformGR:", -[THPageThumbnailView freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"));
}

- (void)updateFreeTransformUnmovingParentView
{
  -[THWFreeTransformController updateUnmovingParentView](self->mFreeTransformController, "updateUnmovingParentView");
}

- (void)teardown
{
  -[THPageThumbnailView setDelegate:](self, "setDelegate:", 0);
  -[THWFreeTransformController setTargetLayer:](self->mFreeTransformController, "setTargetLayer:", 0);
  -[THWFreeTransformController clearGestureRecognizer](self->mFreeTransformController, "clearGestureRecognizer");
}

- (void)setBorderVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  if (a3)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[UIView setAlpha:](self->mBorderView, "setAlpha:", v5);
  -[UIView setAlpha:](self->mLeftBorderView, "setAlpha:", v5);
  -[UIView setAlpha:](self->mRightBorderView, "setAlpha:", v5);
  -[THPageNumberView setHidden:](self->mPageNumberView, "setHidden:", !v3);
}

- (void)p_setBorderMode:(int)mBorderMode
{
  UIView *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  id v19;
  uint64_t v20;
  UIColor *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  if (self->mBorderMode != mBorderMode)
  {
    self->mBorderMode = mBorderMode;
    if (!self->mBorderView)
    {
      v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      self->mBorderView = v4;
      -[THPageThumbnailView addSubview:](self, "addSubview:", v4);
      mBorderMode = self->mBorderMode;
    }
    if (mBorderMode == 1)
    {
      v22 = -[THPageThumbnailView bounds](self, "bounds");
      v24 = v23;
      v26 = v25;
      v29 = v28 - 1.0 / TSUScreenScale(v22, v27);
      -[UIView setFrame:](self->mBorderView, "setFrame:", v24, v29, v26, 1.0 / TSUScreenScale(v30, v31));
      -[CALayer setBorderWidth:](-[UIView layer](self->mBorderView, "layer"), "setBorderWidth:", 0.0);
      v21 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
      goto LABEL_8;
    }
    if (mBorderMode == 2)
    {
      v5 = -[THPageThumbnailView bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = -1.0 / TSUScreenScale(v5, v14);
      v18 = -1.0 / TSUScreenScale(v16, v17);
      v32.origin.x = v7;
      v32.origin.y = v9;
      v32.size.width = v11;
      v32.size.height = v13;
      v33 = CGRectInset(v32, v15, v18);
      -[UIView setFrame:](self->mBorderView, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
      v19 = -[CALayer setBorderColor:](-[UIView layer](self->mBorderView, "layer"), "setBorderColor:", -[UIColor CGColor](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3), "CGColor"));
      -[CALayer setBorderWidth:](-[UIView layer](self->mBorderView, "layer"), "setBorderWidth:", 1.0 / TSUScreenScale(v19, v20));
      v21 = +[UIColor clearColor](UIColor, "clearColor");
LABEL_8:
      -[UIView setBackgroundColor:](self->mBorderView, "setBackgroundColor:", v21);
      return;
    }
    -[UIView removeFromSuperview](self->mBorderView, "removeFromSuperview");

    self->mBorderView = 0;
  }
}

- (id)p_createSideBorderView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[THPageThumbnailView addSubview:](self, "addSubview:", v3);
  objc_msgSend(v3, "setBackgroundColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
  return v3;
}

- (BOOL)hasLeftBorder
{
  return self->mLeftBorderView != 0;
}

- (void)setHasLeftBorder:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  if (-[THPageThumbnailView hasLeftBorder](self, "hasLeftBorder") != a3)
  {
    if (v3)
    {
      if (self->mBorderMode == 2)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView setHasLeftBorder:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 306, CFSTR("shouldn't have a side border and a full border"));
      self->mLeftBorderView = (UIView *)-[THPageThumbnailView p_createSideBorderView](self, "p_createSideBorderView");
      v5 = -[THPageThumbnailView bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v12 = v11 - 1.0 / TSUScreenScale(v5, v10);
      v15 = 1.0 / TSUScreenScale(v13, v14);
      v18 = v7 - 1.0 / TSUScreenScale(v16, v17);
      -[UIView setFrame:](self->mLeftBorderView, "setFrame:", v12, v18, v15, v9 + 1.0 / TSUScreenScale(v19, v20));
    }
    else
    {
      -[UIView removeFromSuperview](self->mLeftBorderView, "removeFromSuperview");

      self->mLeftBorderView = 0;
    }
  }
}

- (BOOL)hasRightBorder
{
  return self->mRightBorderView != 0;
}

- (void)setHasRightBorder:(BOOL)a3
{
  _BOOL4 v3;
  double y;
  double height;
  double MaxX;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  CGRect v16;

  v3 = a3;
  if (-[THPageThumbnailView hasRightBorder](self, "hasRightBorder") != a3)
  {
    if (v3)
    {
      if (self->mBorderMode == 2)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView setHasRightBorder:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 338, CFSTR("shouldn't have a side border and a full border"));
      self->mRightBorderView = (UIView *)-[THPageThumbnailView p_createSideBorderView](self, "p_createSideBorderView");
      -[THPageThumbnailView bounds](self, "bounds");
      y = v16.origin.y;
      height = v16.size.height;
      MaxX = CGRectGetMaxX(v16);
      v10 = 1.0 / TSUScreenScale(v8, v9);
      v13 = y - 1.0 / TSUScreenScale(v11, v12);
      -[UIView setFrame:](self->mRightBorderView, "setFrame:", MaxX, v13, v10, height + 1.0 / TSUScreenScale(v14, v15));
    }
    else
    {
      -[UIView removeFromSuperview](self->mRightBorderView, "removeFromSuperview");

      self->mRightBorderView = 0;
    }
  }
}

- (void)setImage:(CGImage *)a3
{
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  -[CALayer setContents:](self->mImageLayer, "setContents:", a3);
  -[CALayer setHidden:](self->mImageLayer, "setHidden:", 0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setImageData:(id)a3 immediate:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];

  v4 = a4;
  objc_sync_enter(self);
  if (v4)
  {
    -[THPageThumbnailView setWillSetImageFromQueue:](self, "setWillSetImageFromQueue:", 0);
    -[THPageThumbnailView setImage:](self, "setImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", a3));

    self->mImageData = 0;
    objc_sync_exit(self);
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
    -[CALayer setHidden:](self->mImageLayer, "setHidden:", 1);
    +[CATransaction commit](CATransaction, "commit");
    v7 = a3;

    self->mImageData = (TSPData *)a3;
    -[THPageThumbnailView setWillSetImageFromQueue:](self, "setWillSetImageFromQueue:", 1);
    objc_sync_exit(self);
    v9 = objc_msgSend((id)objc_opt_class(self, v8), "thumbnailQueue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A26BC;
    block[3] = &unk_426DD0;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

- (void)setCanvasScrollView:(id)a3 rasterize:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  CALayer *v8;
  double v9;
  double v10;
  double v11;

  v4 = a4;
  if (!self->mCanvasWrapperView)
  {
    v7 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    self->mCanvasWrapperView = v7;
    -[THPageThumbnailView addSubview:](self, "addSubview:", v7);
  }
  v8 = -[UIView layer](self->mCanvasWrapperView, "layer");
  if (v4)
  {
    -[CALayer setShouldRasterize:](v8, "setShouldRasterize:", 1);
    objc_msgSend(a3, "bounds");
    v10 = v9;
    -[THPageThumbnailView bounds](self, "bounds");
    -[CALayer setRasterizationScale:](-[UIView layer](self->mCanvasWrapperView, "layer"), "setRasterizationScale:", v10 / v11);
  }
  else
  {
    -[CALayer setShouldRasterize:](v8, "setShouldRasterize:", 0);
  }
  -[UIView addSubview:](self->mCanvasWrapperView, "addSubview:", a3);
}

- (void)setShowCanvas:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];

  v4 = a4;
  if (a3)
    v6 = 1.0;
  else
    v6 = 0.0;
  -[UIView alpha](self->mCanvasWrapperView, "alpha");
  if (v7 != v6)
  {
    v8 = 0.15;
    if (!v4)
      v8 = 0.0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_A2984;
    v9[3] = &unk_427240;
    v9[4] = self;
    *(double *)&v9[5] = v6;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, v8);
  }
}

- (CGRect)highlightedRelativeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mHighlightedRelativeRect.origin.x;
  y = self->mHighlightedRelativeRect.origin.y;
  width = self->mHighlightedRelativeRect.size.width;
  height = self->mHighlightedRelativeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHighlightRelativeRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect *p_mHighlightedActualRect;
  double v15;
  double v16;
  id v17;
  _QWORD v18[5];
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    -[THPageThumbnailView clearHighlightRect](self, "clearHighlightRect");
  }
  else
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (!CGRectEqualToRect(v19, self->mHighlightedRelativeRect))
    {
      -[THPageThumbnailView clearHighlightRect](self, "clearHighlightRect");
      -[THPageThumbnailView frame](self, "frame");
      self->mHighlightedRelativeRect.origin.x = x;
      self->mHighlightedRelativeRect.origin.y = y;
      self->mHighlightedRelativeRect.size.width = width;
      self->mHighlightedRelativeRect.size.height = height;
      v9 = x * v8;
      v11 = y * v10;
      v12 = width * v8;
      v13 = height * v10;
      p_mHighlightedActualRect = &self->mHighlightedActualRect;
      self->mHighlightedActualRect.origin.x = v9;
      self->mHighlightedActualRect.origin.y = v11;
      self->mHighlightedActualRect.size.width = v12;
      self->mHighlightedActualRect.size.height = v13;
      if (fabs(height + -1.0) >= 0.00999999978)
        *(CGRect *)&v9 = CGRectInset(*(CGRect *)&v9, 0.0, -3.0);
      p_mHighlightedActualRect->origin.x = v9;
      self->mHighlightedActualRect.origin.y = v11;
      self->mHighlightedActualRect.size.width = v12;
      self->mHighlightedActualRect.size.height = v13;
      v15 = fabs(width + -1.0);
      v16 = 0.0;
      if (v15 >= 0.00999999978)
      {
        *(CGRect *)&v9 = CGRectInset(*(CGRect *)&v9, -3.0, 0.0);
        v16 = 3.0;
      }
      p_mHighlightedActualRect->origin.x = v9;
      self->mHighlightedActualRect.origin.y = v11;
      self->mHighlightedActualRect.size.width = v12;
      self->mHighlightedActualRect.size.height = v13;
      v17 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", p_mHighlightedActualRect->origin.x, self->mHighlightedActualRect.origin.y, self->mHighlightedActualRect.size.width, self->mHighlightedActualRect.size.height);
      objc_msgSend(v17, "setBackgroundColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.200000003));
      objc_msgSend(objc_msgSend(v17, "layer"), "setCornerRadius:", v16);
      objc_msgSend(objc_msgSend(v17, "layer"), "setMasksToBounds:", 1);
      objc_msgSend(v17, "setAlpha:", 0.0);
      -[THPageThumbnailView setHighlightView:](self, "setHighlightView:", v17);
      -[THPageThumbnailView addSubview:](self, "addSubview:", v17);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_A2BB8;
      v18[3] = &unk_426DD0;
      v18[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v18, 0.150000006);
    }
  }
}

- (void)clearHighlightRect
{
  CGSize size;
  CGSize v4;

  if (-[THPageThumbnailView highlightView](self, "highlightView"))
  {
    -[UIView removeFromSuperview](-[THPageThumbnailView highlightView](self, "highlightView"), "removeFromSuperview");
    -[THPageThumbnailView setHighlightView:](self, "setHighlightView:", 0);
    size = CGRectZero.size;
    self->mHighlightedRelativeRect.origin = CGRectZero.origin;
    self->mHighlightedRelativeRect.size = size;
    v4 = CGRectZero.size;
    self->mHighlightedActualRect.origin = CGRectZero.origin;
    self->mHighlightedActualRect.size = v4;
  }
}

- (void)hideExtrasAnimated:(BOOL)a3 duration:(double)a4
{
  _QWORD v5[5];

  if (a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_A2D04;
    v5[3] = &unk_426DD0;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, a4);
  }
  else
  {
    -[UIView setAlpha:](self->mBorderView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->mLeftBorderView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->mRightBorderView, "setAlpha:", 0.0);
    -[THPageNumberView setAlpha:](self->mPageNumberView, "setAlpha:", 0.0);
  }
}

- (void)showExtrasAnimated:(BOOL)a3 duration:(double)a4
{
  _QWORD v5[5];

  if (a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_A2E40;
    v5[3] = &unk_426DD0;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, a4);
  }
  else
  {
    -[UIView setAlpha:](self->mBorderView, "setAlpha:", 1.0);
    -[UIView setAlpha:](self->mLeftBorderView, "setAlpha:", 1.0);
    -[UIView setAlpha:](self->mRightBorderView, "setAlpha:", 1.0);
    -[THPageNumberView setAlpha:](self->mPageNumberView, "setAlpha:", 1.0);
  }
}

- (void)p_clearTimer
{
  -[NSTimer invalidate](self->mTapTimer, "invalidate");

  self->mTapTimer = 0;
}

- (void)p_tapGestureTimerFired:(id)a3
{
  THPageThumbnailViewTapGestureRecognizer *mSingleTapGR;

  mSingleTapGR = self->mSingleTapGR;
  if (!-[THPageThumbnailViewTapGestureRecognizer state](mSingleTapGR, "state", a3)
    || -[THPageThumbnailViewTapGestureRecognizer state](mSingleTapGR, "state") == (char *)&dword_0 + 1
    || -[THPageThumbnailViewTapGestureRecognizer state](mSingleTapGR, "state") == (char *)&dword_0 + 2)
  {
    -[THPageThumbnailViewTapGestureRecognizer locationInView:](mSingleTapGR, "locationInView:", self);
    -[THPageThumbnailViewDelegate thumbnailWasPressed:atPoint:forLong:](self->mDelegate, "thumbnailWasPressed:atPoint:forLong:", self, 1);
  }
  -[THPageThumbnailView p_clearTimer](self, "p_clearTimer");
}

- (void)p_handleTap:(id)a3
{
  char *v5;
  THPageThumbnailViewDelegate *mDelegate;
  THPageThumbnailViewDelegate *v7;
  THPageThumbnailView *v8;
  uint64_t v9;
  THPageThumbnailViewDelegate *v10;

  v5 = (char *)objc_msgSend(a3, "state");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if ((unint64_t)(v5 - 4) >= 2)
    {
      if (v5 == (_BYTE *)&dword_0 + 3)
      {
        if (self->mTapTimer)
        {
          -[THPageThumbnailView p_clearTimer](self, "p_clearTimer");
          mDelegate = self->mDelegate;
          objc_msgSend(a3, "locationInView:", self);
          v7 = mDelegate;
          v8 = self;
          v9 = 0;
        }
        else
        {
          v10 = self->mDelegate;
          objc_msgSend(a3, "locationInView:", self);
          v7 = v10;
          v8 = self;
          v9 = 1;
        }
        -[THPageThumbnailViewDelegate thumbnailWasTapped:atPoint:forLong:](v7, "thumbnailWasTapped:atPoint:forLong:", v8, v9);
      }
      else
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView p_handleTap:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 608, CFSTR("Unexpected gesture state"));
      }
    }
    else
    {
      -[THPageThumbnailView p_clearTimer](self, "p_clearTimer");
      -[THPageThumbnailView clearHighlightRect](self, "clearHighlightRect");
    }
  }
}

- (void)touchesBeganFromTap:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  THPageThumbnailViewDelegate *mDelegate;
  CGPoint v10;
  CGRect v11;

  objc_msgSend(a3, "locationInView:", -[THPageThumbnailView superview](self, "superview"));
  v6 = v5;
  v8 = v7;
  -[THPageThumbnailView frame](self, "frame");
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v11, v10))
  {
    if (!self->mTapTimer
      || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView touchesBeganFromTap:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 619, CFSTR("started another tap recognition while one is in progress")), !self->mTapTimer))
    {
      self->mTapTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_tapGestureTimerFired:", 0, 0, 0.5);
    }
    mDelegate = self->mDelegate;
    objc_msgSend(a3, "locationInView:", self);
    -[THPageThumbnailViewDelegate thumbnailWasPressed:atPoint:forLong:](mDelegate, "thumbnailWasPressed:atPoint:forLong:", self, 0);
  }
  else
  {
    -[THPageThumbnailView clearHighlightRect](self, "clearHighlightRect");
  }
}

- (void)gestureReset:(id)a3
{
  if (self->mTapTimer && objc_msgSend(a3, "state") != (char *)&dword_4 + 1)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageThumbnailView gestureReset:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageThumbnailView.mm"), 635, CFSTR("expected timer to have been cleared by the time we reset this GR"));
  -[THPageThumbnailView p_clearTimer](self, "p_clearTimer");
  if (objc_msgSend(a3, "state") != (char *)&dword_0 + 3)
    -[THPageThumbnailView clearHighlightRect](self, "clearHighlightRect");
}

- (THPageThumbnailViewDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THPageThumbnailViewDelegate *)a3;
}

- (TSPData)imageData
{
  return self->mImageData;
}

- (unint64_t)pageIndex
{
  return self->mPageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->mPageIndex = a3;
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (void)setChapterIndex:(unint64_t)a3
{
  self->mChapterIndex = a3;
}

- (CALayer)imageLayer
{
  return self->mImageLayer;
}

- (UIView)highlightView
{
  return self->mHighlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (THWFreeTransformController)freeTransformController
{
  return self->_freeTransformController;
}

- (void)setFreeTransformController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (THWFreeTransformGestureRecognizer)freeTransformGestureRecognizer
{
  return self->_freeTransformGestureRecognizer;
}

- (void)setFreeTransformGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (BOOL)willSetImageFromQueue
{
  return self->_willSetImageFromQueue;
}

- (void)setWillSetImageFromQueue:(BOOL)a3
{
  self->_willSetImageFromQueue = a3;
}

@end
