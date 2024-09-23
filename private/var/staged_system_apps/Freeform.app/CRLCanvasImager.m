@implementation CRLCanvasImager

- (CRLCanvasImager)initWithBoard:(id)a3
{
  return -[CRLCanvasImager initWithBoard:renderForWideGamut:](self, "initWithBoard:renderForWideGamut:", a3, 1);
}

- (CRLCanvasImager)initWithBoard:(id)a3 renderForWideGamut:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CRLCanvasImager *v10;
  CRLCanvasImager *v11;
  CGSize size;
  CRLCanvas *v18;
  CRLCanvas *mCanvas;
  objc_super v21;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012314E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF900();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231500);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager initWithBoard:renderForWideGamut:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 82, 0, "invalid nil value for '%{public}s'", "board");

  }
  v21.receiver = self;
  v21.super_class = (Class)CRLCanvasImager;
  v10 = -[CRLCanvasImager init](&v21, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mBoard, v6);
    size = CGRectInfinite.size;
    v11->mUnscaledClipRect.origin = CGRectInfinite.origin;
    v11->mUnscaledClipRect.size = size;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v11->mViewScale = _Q0;
    v18 = objc_alloc_init(CRLCanvas);
    mCanvas = v11->mCanvas;
    v11->mCanvas = v18;

    -[CRLCanvas i_setCanvasIsWideGamut:](v11->mCanvas, "i_setCanvasIsWideGamut:", v4);
    -[CRLCanvas setDelegate:](v11->mCanvas, "setDelegate:", v11);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvas teardown](self->mCanvas, "teardown");
  sub_10040F32C((uint64_t)self->mReusableBitmapContext);
  CGContextRelease(self->mReusableBitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasImager;
  -[CRLCanvasImager dealloc](&v3, "dealloc");
}

- (NSString)boardTitle
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->mBoard);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "title"));

  return (NSString *)v3;
}

- (void)setPostRenderAction:(id)a3
{
  id v4;
  id mPostRenderAction;

  v4 = objc_msgSend(a3, "copy");
  mPostRenderAction = self->mPostRenderAction;
  self->mPostRenderAction = v4;

}

- (void)setInfos:(id)a3
{
  -[CRLCanvasImager setInfos:allowLayoutIfNeeded:](self, "setInfos:allowLayoutIfNeeded:", a3, 1);
}

- (void)setInfos:(id)a3 allowLayoutIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v7 = (NSArray *)a3;
  v8 = v7;
  if (self->mInfos != v7)
  {
    if (v7 && -[NSArray count](v7, "count") && self->mHasBeenUsed && !self->mMayBeReused)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231520);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEF9A0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231540);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setInfos:allowLayoutIfNeeded:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 122, 0, "Should not reuse an imager unless it has been explicitly marked as safe to reuse");

    }
    objc_storeStrong((id *)&self->mInfos, a3);
    if (!-[NSArray count](self->mInfos, "count"))
    {
      -[CRLCanvas setInfosToDisplay:](self->mCanvas, "setInfosToDisplay:", self->mInfos);
      if (v4)
        -[CRLCanvas nonInteractiveLayoutIfNeeded](self->mCanvas, "nonInteractiveLayoutIfNeeded");
    }
  }

}

- (double)viewScale
{
  void *v3;
  void *v4;
  void *v5;

  if (self->mUseScaledImageSize)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231560);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFA20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231580);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager viewScale]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 140, 0, "Cannot call viewScale if scaledImageSize has been set.");

  }
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012315A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFAA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012315C0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setViewScale:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 146, 0, "viewScale must be > 0.0");

  }
  else
  {
    self->mViewScale = a3;
    self->mScaledImageSize = CGSizeZero;
    self->mUseScaledImageSize = 0;
  }
}

- (double)contentsScale
{
  void *v3;
  void *v4;
  void *v5;

  if (self->mUseScaledImageSize)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012315E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFB20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231600);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager contentsScale]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 156, 0, "Cannot call contentsScale if scaledImageSize has been set.");

  }
  return self->mContentsScale;
}

- (void)setContentsScale:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231620);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFBA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231640);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setContentsScale:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 162, 0, "contentsScale must be > 0.0");

  }
  else
  {
    self->mContentsScale = a3;
    self->mScaledImageSize = CGSizeZero;
    self->mUseScaledImageSize = 0;
  }
}

- (CGSize)scaledImageSize
{
  void *v3;
  void *v4;
  void *v5;
  double width;
  double height;
  CGSize result;

  if (!self->mUseScaledImageSize)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231660);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFC20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231680);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager scaledImageSize]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 172, 0, "Cannot call scaledImageSize if viewScale or contentsScale has been set.");

  }
  width = self->mScaledImageSize.width;
  height = self->mScaledImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaledImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v13;
  void *v14;
  void *v15;

  height = a3.height;
  width = a3.width;
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012316A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFD20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012316C0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setScaledImageSize:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 177, 0, "can't make an image with 0 width or height");

  }
  v10 = sub_100063090(width);
  v11 = v9;
  if (width != v10 || height != v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012316E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFCA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231700);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setScaledImageSize:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 179, 0, "given a non-integral scaled image size");

  }
  self->mScaledImageSize.width = v10;
  self->mScaledImageSize.height = v11;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->mViewScale = _Q0;
  self->mUseScaledImageSize = 1;
}

- (CGSize)maximumImagePixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMaximumImagePixelSize.width;
  height = self->mMaximumImagePixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumImagePixelSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGFloat v8;
  void *v10;
  void *v11;
  void *v12;

  height = a3.height;
  width = a3.width;
  v7 = sub_100063090(a3.width);
  v8 = v6;
  if (width != v7 || height != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231720);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFDA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231740);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager setMaximumImagePixelSize:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 192, 0, "given a non-integral maximum image size");

  }
  self->mMaximumImagePixelSize.width = v7;
  self->mMaximumImagePixelSize.height = v8;
}

- (void)i_setDrawsOnlyBelowInfo:(id)a3
{
  objc_storeStrong((id *)&self->mInfoToDrawBeneath, a3);
}

- (CGImage)newImage
{
  id WeakRetained;
  CGImage *v4;
  void *v5;
  void *v6;
  void *v7;
  CGImage *v8;
  void *v9;
  void (**mPostRenderAction)(id, _QWORD, CRLCanvas *);

  WeakRetained = objc_loadWeakRetained((id *)&self->mBoard);
  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231760);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFE20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231780);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager newImage]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 208, 0, "invalid nil value for '%{public}s'", "board");

    goto LABEL_15;
  }
  if (!-[CRLCanvasImager p_configureCanvas](self, "p_configureCanvas"))
  {
LABEL_15:
    v4 = 0;
    goto LABEL_21;
  }
  if (self->mUseScaledImageSize)
  {
    if (-[CRLCanvasImager shouldReuseBitmapContext](self, "shouldReuseBitmapContext"))
    {
      v4 = -[CRLCanvasImager p_newImageInReusableContext](self, "p_newImageInReusableContext");
      goto LABEL_19;
    }
    v8 = -[CRLCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:](self->mCanvas, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:", self->mDistortedToMatch, self->mInfoToDrawBeneathFilter, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
  }
  else
  {
    v8 = -[CRLCanvas i_imageInScaledRect:keepingChildrenPassingTest:](self->mCanvas, "i_imageInScaledRect:keepingChildrenPassingTest:", self->mInfoToDrawBeneathFilter, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height);
  }
  v4 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas i_previousRenderDatasNeedingDownload](self->mCanvas, "i_previousRenderDatasNeedingDownload"));
  -[CRLCanvasImager setPreviousRenderDatasNeedingDownload:](self, "setPreviousRenderDatasNeedingDownload:", v9);

LABEL_19:
  mPostRenderAction = (void (**)(id, _QWORD, CRLCanvas *))self->mPostRenderAction;
  if (mPostRenderAction)
    mPostRenderAction[2](mPostRenderAction, 0, self->mCanvas);
LABEL_21:
  self->mHasBeenUsed = 1;

  return v4;
}

- (id)generateImage
{
  CGImage *v2;
  CGImage *v3;
  void *v4;

  v2 = -[CRLCanvasImager newImage](self, "newImage");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", v2));
    CGImageRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)pngData
{
  CGImage *v2;
  CGImage *v3;
  __CFData *v4;
  void *v5;

  v2 = -[CRLCanvasImager newImage](self, "newImage");
  if (v2)
  {
    v3 = v2;
    v4 = sub_100435130(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    CGImageRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)pdfData
{
  __CFData *v3;
  __CFData *v4;
  CGDataConsumerRef v5;
  CGDataConsumer *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGContext *v10;
  __CFData *v11;
  CGRect v13;

  if (-[CRLCanvasImager p_configureCanvas](self, "p_configureCanvas"))
  {
    v3 = (__CFData *)objc_alloc_init((Class)NSMutableData);
    v4 = v3;
    if (v3 && (v5 = CGDataConsumerCreateWithCFData(v3)) != 0)
    {
      v6 = v5;
      v13.origin.x = sub_10005FDDC();
      v13.origin.y = v7;
      v13.size.width = v8;
      v13.size.height = v9;
      v10 = CGPDFContextCreate(v6, &v13, 0);
      -[CRLCanvasImager p_drawPageInContext:createPage:includeMargin:](self, "p_drawPageInContext:createPage:includeMargin:", v10, 1, 0);
      CGPDFContextClose(v10);
      CGContextRelease(v10);
      v11 = v4;
      CGDataConsumerRelease(v6);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  self->mHasBeenUsed = 1;
  return v11;
}

- (BOOL)drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4 includeMargin:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL4 v9;

  v5 = a5;
  v6 = a4;
  v9 = -[CRLCanvasImager p_configureCanvas](self, "p_configureCanvas");
  if (v9)
    -[CRLCanvasImager p_drawPageInContext:createPage:includeMargin:](self, "p_drawPageInContext:createPage:includeMargin:", a3, v6, v5);
  return v9;
}

- (id)boardItemOwnerForCanvas:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->mCanvas != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012317A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFEC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012317C0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager boardItemOwnerForCanvas:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 332, 0, "wrong canvas");

  }
  return objc_loadWeakRetained((id *)&self->mBoard);
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  CRLCanvas *mCanvas;
  CRLCanvas *v5;
  void *v6;
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
  CGRect result;

  mCanvas = (CRLCanvas *)a3;
  v5 = mCanvas;
  if (self->mCanvas != mCanvas)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012317E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFF40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231800);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager visibleScaledBoundsForClippingRepsOnCanvas:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 338, 0, "wrong canvas");

    mCanvas = self->mCanvas;
  }
  -[CRLCanvas viewScale](mCanvas, "viewScale");
  v10 = sub_100060FD8(self->mUnscaledClipRect.origin.x, self->mUnscaledClipRect.origin.y, self->mUnscaledClipRect.size.width, self->mUnscaledClipRect.size.height, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)isCanvasDrawingIntoPDF:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->mCanvas != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231820);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEFFC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231840);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager isCanvasDrawingIntoPDF:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 344, 0, "wrong canvas");

  }
  return self->mDrawingIntoPDF;
}

- (BOOL)isPrintingCanvas
{
  return self->mIsPrinting;
}

- (CGRect)actualScaledClipRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[CRLCanvasImager p_configureCanvas](self, "p_configureCanvas");
  x = self->mActualScaledClipRect.origin.x;
  y = self->mActualScaledClipRect.origin.y;
  width = self->mActualScaledClipRect.size.width;
  height = self->mActualScaledClipRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)p_configureCanvas
{
  double x;
  CGFloat y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  float MinX;
  double v12;
  float MinY;
  double v14;
  float MaxX;
  double v16;
  float MaxY;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  float v24;
  float v25;
  double mViewScale;
  double mContentsScale;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  CRLCanvasElementInfo *v60;
  CRLCanvasElementInfo *mInfoToDrawBeneath;
  id v62;
  id v63;
  id mInfoToDrawBeneathFilter;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  -[CRLCanvas setBackgroundColor:](self->mCanvas, "setBackgroundColor:", self->mBackgroundColor);
  -[CRLCanvas setInfosToDisplay:](self->mCanvas, "setInfosToDisplay:", self->mInfos);
  -[CRLCanvas setEnableInstructionalText:](self->mCanvas, "setEnableInstructionalText:", -[CRLCanvasImager shouldShowInstructionalText](self, "shouldShowInstructionalText"));
  if (-[CRLCanvasImager mayBeReused](self, "mayBeReused"))
    -[CRLCanvas recreateAllLayoutsAndReps](self->mCanvas, "recreateAllLayoutsAndReps");
  -[CRLCanvas nonInteractiveLayoutIfNeeded](self->mCanvas, "nonInteractiveLayoutIfNeeded");
  x = self->mUnscaledClipRect.origin.x;
  y = self->mUnscaledClipRect.origin.y;
  width = self->mUnscaledClipRect.size.width;
  height = self->mUnscaledClipRect.size.height;
  v78.origin.x = CGRectInfinite.origin.x;
  v78.origin.y = CGRectInfinite.origin.y;
  v78.size.width = CGRectInfinite.size.width;
  v78.size.height = CGRectInfinite.size.height;
  v73.origin.x = x;
  v73.origin.y = y;
  v73.size.width = width;
  v73.size.height = height;
  if (CGRectEqualToRect(v73, v78))
  {
    -[CRLCanvas unscaledRectOfLayouts](self->mCanvas, "unscaledRectOfLayouts");
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  v74.origin.x = x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  MinX = CGRectGetMinX(v74);
  v12 = fminf(MinX, 0.0);
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  MinY = CGRectGetMinY(v75);
  v14 = fminf(MinY, 0.0);
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  MaxX = CGRectGetMaxX(v76);
  v16 = fmaxf(MaxX, 0.0);
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  MaxY = CGRectGetMaxY(v77);
  v18 = v16 - v12;
  v19 = fmaxf(MaxY, 0.0) - v14;
  v20 = v19 > 0.0 && v18 > 0.0;
  if (v20)
  {
    -[CRLCanvas unscaledSize](self->mCanvas, "unscaledSize");
    if (v22 != v18 || v21 != v19)
    {
      -[CRLCanvas setUnscaledSize:](self->mCanvas, "setUnscaledSize:", v18, v19);
      -[CRLCanvas nonInteractiveLayoutIfNeeded](self->mCanvas, "nonInteractiveLayoutIfNeeded");
    }
    if (self->mUseScaledImageSize)
    {
      v24 = self->mScaledImageSize.width / width;
      v25 = self->mScaledImageSize.height / height;
      mViewScale = fminf(v24, v25);
      mContentsScale = 1.0;
    }
    else
    {
      mViewScale = self->mViewScale;
      mContentsScale = self->mContentsScale;
    }
    v28 = self->mMaximumImagePixelSize.width;
    if (v28 != 0.0 || self->mMaximumImagePixelSize.height != 0.0)
    {
      if (self->mUseScaledImageSize)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231860);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF00C0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231880);
        v29 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_configureCanvas]"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 414, 0, "Using a specific scaled image size and max image size at the same time is unsupported.");

        v28 = self->mMaximumImagePixelSize.width;
      }
      v32 = sub_1000603DC(width, height, mViewScale);
      v34 = sub_1000603DC(v32, v33, mContentsScale);
      v36 = self->mMaximumImagePixelSize.height;
      if (v34 > v28 || v35 > v36)
      {
        v38 = v34 / v28;
        if (v28 == 0.0)
          v39 = 0.0;
        else
          v39 = v38;
        if (v36 == 0.0)
          v40 = 0.0;
        else
          v40 = v35 / v36;
        if (v39 == 0.0 && v40 == 0.0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012318A0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF0040();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012318C0);
          v41 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_configureCanvas]"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 421, 0, "both ratios in imager are zero!");

        }
        if (v39 <= v40)
          v44 = v40;
        else
          v44 = v39;
        mViewScale = mViewScale * (1.0 / v44);
      }
    }
    -[CRLCanvas setViewScale:](self->mCanvas, "setViewScale:", mViewScale);
    -[CRLCanvas i_setContentsScale:](self->mCanvas, "i_setContentsScale:", mContentsScale);
    -[CRLCanvas viewScale](self->mCanvas, "viewScale");
    self->mActualScaledClipRect.origin.x = sub_100060FD8(x, y, width, height, v45);
    self->mActualScaledClipRect.origin.y = v46;
    self->mActualScaledClipRect.size.width = v47;
    self->mActualScaledClipRect.size.height = v48;
    if (self->mUseScaledImageSize && self->mImageMustHaveEvenDimensions)
    {
      -[CRLCanvasImager p_evenDimensionsWithSize:](self, "p_evenDimensionsWithSize:", v47, v48);
      self->mActualScaledClipRect.size.width = v49;
      self->mActualScaledClipRect.size.height = v50;
      -[CRLCanvasImager p_evenDimensionsWithSize:](self, "p_evenDimensionsWithSize:", self->mScaledImageSize.width, self->mScaledImageSize.height);
      self->mScaledImageSize.width = v51;
      self->mScaledImageSize.height = v52;
    }
    if (self->mInfoToDrawBeneath)
    {
      v53 = objc_alloc_init((Class)NSMutableSet);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas allRepsOrdered](self->mCanvas, "allRepsOrdered"));
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v69;
LABEL_60:
        v58 = 0;
        while (1)
        {
          if (*(_QWORD *)v69 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v58);
          v60 = (CRLCanvasElementInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "info"));
          mInfoToDrawBeneath = self->mInfoToDrawBeneath;

          if (v60 == mInfoToDrawBeneath)
            break;
          objc_msgSend(v53, "addObject:", v59);
          if (v56 == (id)++v58)
          {
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
            if (v56)
              goto LABEL_60;
            break;
          }
        }
      }

      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_1000788B8;
      v66[3] = &unk_1012318E8;
      v67 = v53;
      v62 = v53;
      v63 = objc_msgSend(v66, "copy");
      mInfoToDrawBeneathFilter = self->mInfoToDrawBeneathFilter;
      self->mInfoToDrawBeneathFilter = v63;

    }
    else
    {
      v62 = self->mInfoToDrawBeneathFilter;
      self->mInfoToDrawBeneathFilter = 0;
    }

  }
  return v20;
}

- (CGSize)p_evenDimensionsWithSize:(CGSize)a3
{
  CGFloat height;
  double width;
  long double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  long double v32;
  __int16 v33;
  double v34;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = sub_1000630C4(a3.width, a3.height);
  v7 = v6;
  v8 = fmod(v6, 2.0);
  v9 = fmod(v5, 2.0);
  if (v8 == 0.0)
  {
    v10 = v7;
    if (v9 == 0.0)
    {
      v10 = height;
      goto LABEL_22;
    }
  }
  else
  {
    v10 = v7 + -1.0;
  }
  if (v9 == 0.0)
    width = v5;
  else
    width = v5 + -1.0;
  if (width > v5 || v10 > v7)
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231908);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110914;
      v20 = v12;
      v21 = 2082;
      v22 = "-[CRLCanvasImager p_evenDimensionsWithSize:]";
      v23 = 2082;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m";
      v25 = 1024;
      v26 = 475;
      v27 = 2048;
      v28 = width;
      v29 = 2048;
      v30 = v10;
      v31 = 2048;
      v32 = v5;
      v33 = 2048;
      v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New image dimensions (%f, %f) not calculated as expected from original size (%f, %f)! Image may be the wrong size.", buf, 0x4Au);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231928);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_evenDimensionsWithSize:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 475, 0, "New image dimensions (%f, %f) not calculated as expected from original size (%f, %f)! Image may be the wrong size.", *(_QWORD *)&width, *(_QWORD *)&v10, *(_QWORD *)&v5, *(_QWORD *)&v7);

  }
LABEL_22:
  v17 = width;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)p_drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4 includeMargin:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  void *v18;
  void (**mPostRenderAction)(id, CGContext *, CRLCanvas *);
  CGRect v20;
  CGRect v21;

  v5 = a5;
  v6 = a4;
  self->mDrawingIntoPDF = 1;
  sub_10040F974((uint64_t)a3, -[CRLCanvasImager isPrinting](self, "isPrinting"), self->mDrawingIntoPDF, 0, -[CRLCanvas shouldSuppressBackgrounds](self->mCanvas, "shouldSuppressBackgrounds"), 1.0);
  v9 = 36.0;
  if (!v5)
    v9 = 0.0;
  v10 = self->mActualScaledClipRect.origin.x - v9;
  v11 = self->mActualScaledClipRect.origin.y - v9;
  v12 = self->mActualScaledClipRect.size.width + v9 * 2.0;
  v13 = self->mActualScaledClipRect.size.height + v9 * 2.0;
  if (v6)
  {
    v20.origin.x = sub_10005FDDC();
    v20.origin.y = v14;
    v20.size.width = v15;
    v20.size.height = v16;
    CGContextBeginPage(a3, &v20);
  }
  CGContextTranslateCTM(a3, 0.0, v13);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -v10, -v11);
  v21.origin.x = v10;
  v21.origin.y = v11;
  v21.size.width = v12;
  v21.size.height = v13;
  CGContextClipToRect(a3, v21);
  sub_100412470(a3);
  -[CRLCanvas i_drawBackgroundInContext:](self->mCanvas, "i_drawBackgroundInContext:", a3);
  -[CRLCanvas i_drawRepsInContext:passingTest:](self->mCanvas, "i_drawRepsInContext:passingTest:", a3, self->mInfoToDrawBeneathFilter);
  v17 = sub_100412A38(a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[CRLCanvasImager setPreviousRenderDatasNeedingDownload:](self, "setPreviousRenderDatasNeedingDownload:", v18);

  mPostRenderAction = (void (**)(id, CGContext *, CRLCanvas *))self->mPostRenderAction;
  if (mPostRenderAction)
    mPostRenderAction[2](mPostRenderAction, a3, self->mCanvas);
  if (v6)
    CGContextEndPage(a3);
  sub_10040F32C((uint64_t)a3);
  self->mDrawingIntoPDF = 0;
}

- (CGImage)p_newImageInReusableContext
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  CGContext *mReusableBitmapContext;
  CGContext *v8;
  CGImage *v9;
  id v10;
  void *v11;
  CRLColor *mBackgroundColor;
  double v14;
  CGRect v15;

  if (!-[CRLCanvasImager shouldReuseBitmapContext](self, "shouldReuseBitmapContext"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231948);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0140();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231968);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasImager p_newImageInReusableContext]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasImager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 533, 0, "shouldn't be reusing context");

  }
  if (!self->mReusableBitmapContext)
    goto LABEL_19;
  if (!CGRectEqualToRect(self->mReusableActualScaledClipRect, self->mActualScaledClipRect)
    || (self->mReusableScaledImageSize.width == self->mScaledImageSize.width
      ? (v6 = self->mReusableScaledImageSize.height == self->mScaledImageSize.height)
      : (v6 = 0),
        !v6))
  {
    mReusableBitmapContext = self->mReusableBitmapContext;
    if (mReusableBitmapContext)
    {
      sub_10040F32C((uint64_t)mReusableBitmapContext);
      CGContextRelease(self->mReusableBitmapContext);
      self->mReusableBitmapContext = 0;
    }
LABEL_19:
    v8 = -[CRLCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:](self->mCanvas, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:", self->mDistortedToMatch, &self->mReusableBounds, &self->mReusableIntegralBounds, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
    self->mReusableBitmapContext = v8;
    sub_10040F974((uint64_t)v8, -[CRLCanvasImager isPrinting](self, "isPrinting"), self->mDrawingIntoPDF, 0, -[CRLCanvas shouldSuppressBackgrounds](self->mCanvas, "shouldSuppressBackgrounds"), 1.0);
    self->mReusableActualScaledClipRect.origin = self->mActualScaledClipRect.origin;
    self->mReusableActualScaledClipRect.size = self->mActualScaledClipRect.size;
    self->mReusableScaledImageSize = self->mScaledImageSize;
    goto LABEL_20;
  }
  mBackgroundColor = self->mBackgroundColor;
  if (!mBackgroundColor || (-[CRLColor alphaComponent](mBackgroundColor, "alphaComponent"), v14 < 1.0))
  {
    v15.origin.x = CGRectInfinite.origin.x;
    v15.origin.y = CGRectInfinite.origin.y;
    v15.size.width = CGRectInfinite.size.width;
    v15.size.height = CGRectInfinite.size.height;
    CGContextClearRect(self->mReusableBitmapContext, v15);
  }
LABEL_20:
  sub_100412470(self->mReusableBitmapContext);
  v9 = -[CRLCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:](self->mCanvas, "i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:", self->mReusableBitmapContext, self->mDistortedToMatch, self->mInfoToDrawBeneathFilter, self->mReusableBounds.origin.x, self->mReusableBounds.origin.y, self->mReusableBounds.size.width, self->mReusableBounds.size.height, self->mReusableIntegralBounds.origin.x, self->mReusableIntegralBounds.origin.y, self->mReusableIntegralBounds.size.width, self->mReusableIntegralBounds.size.height);
  v10 = sub_100412A38(self->mReusableBitmapContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[CRLCanvasImager setPreviousRenderDatasNeedingDownload:](self, "setPreviousRenderDatasNeedingDownload:", v11);

  return v9;
}

- (CRLCanvas)canvas
{
  return self->mCanvas;
}

- (NSArray)infos
{
  return self->mInfos;
}

- (CRLColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGRect)unscaledClipRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mUnscaledClipRect.origin.x;
  y = self->mUnscaledClipRect.origin.y;
  width = self->mUnscaledClipRect.size.width;
  height = self->mUnscaledClipRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUnscaledClipRect:(CGRect)a3
{
  self->mUnscaledClipRect = a3;
}

- (BOOL)distortedToMatch
{
  return self->mDistortedToMatch;
}

- (void)setDistortedToMatch:(BOOL)a3
{
  self->mDistortedToMatch = a3;
}

- (BOOL)imageMustHaveEvenDimensions
{
  return self->mImageMustHaveEvenDimensions;
}

- (void)setImageMustHaveEvenDimensions:(BOOL)a3
{
  self->mImageMustHaveEvenDimensions = a3;
}

- (BOOL)shouldReuseBitmapContext
{
  return self->mShouldReuseBitmapContext;
}

- (void)setShouldReuseBitmapContext:(BOOL)a3
{
  self->mShouldReuseBitmapContext = a3;
}

- (BOOL)shouldShowInstructionalText
{
  return self->mShouldShowInstructionalText;
}

- (void)setShouldShowInstructionalText:(BOOL)a3
{
  self->mShouldShowInstructionalText = a3;
}

- (BOOL)isPrinting
{
  return self->mIsPrinting;
}

- (void)setIsPrinting:(BOOL)a3
{
  self->mIsPrinting = a3;
}

- (NSSet)previousRenderDatasNeedingDownload
{
  return self->mPreviousRenderDatasNeedingDownload;
}

- (void)setPreviousRenderDatasNeedingDownload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)mayBeReused
{
  return self->mMayBeReused;
}

- (void)setMayBeReused:(BOOL)a3
{
  self->mMayBeReused = a3;
}

- (BOOL)shouldSuppressBackgrounds
{
  return self->mShouldSuppressBackgrounds;
}

- (void)setShouldSuppressBackgrounds:(BOOL)a3
{
  self->mShouldSuppressBackgrounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mInfoToDrawBeneathFilter, 0);
  objc_storeStrong((id *)&self->mInfoToDrawBeneath, 0);
  objc_storeStrong(&self->mPostRenderAction, 0);
  objc_storeStrong((id *)&self->mPreviousRenderDatasNeedingDownload, 0);
  objc_storeStrong((id *)&self->mCanvas, 0);
  objc_destroyWeak((id *)&self->mBoard);
  objc_storeStrong((id *)&self->mBackgroundColor, 0);
  objc_storeStrong((id *)&self->mInfos, 0);
}

@end
