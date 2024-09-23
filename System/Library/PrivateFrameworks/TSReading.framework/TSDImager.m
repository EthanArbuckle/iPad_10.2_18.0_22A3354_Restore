@implementation TSDImager

- (TSDImager)initWithDocumentRoot:(id)a3
{
  void *v5;
  uint64_t v6;
  char *v7;
  TSDImager *v8;
  __int128 v9;
  TSDCanvas *v10;
  objc_super v12;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager initWithDocumentRoot:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 51, CFSTR("invalid nil value for '%s'"), "documentRoot");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDImager;
  v7 = -[TSDImager init](&v12, sel_init);
  v8 = (TSDImager *)v7;
  if (v7)
  {
    v9 = *(_OWORD *)(MEMORY[0x24BDBF028] + 16);
    *(_OWORD *)(v7 + 24) = *MEMORY[0x24BDBF028];
    *(_OWORD *)(v7 + 40) = v9;
    *(_OWORD *)(v7 + 104) = TSDEdgeInsetsZero;
    *((_QWORD *)v7 + 17) = a3;
    *((_QWORD *)v7 + 7) = 0x3FF0000000000000;
    *(_OWORD *)(v7 + 120) = *(_OWORD *)&qword_217C29098;
    v10 = objc_alloc_init(TSDCanvas);
    v8->mCanvas = v10;
    -[TSDCanvas setDelegate:](v10, "setDelegate:", v8);
    v8->mPostRenderAction = 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDCanvas teardown](self->mCanvas, "teardown");
  -[TSDCanvas setDelegate:](self->mCanvas, "setDelegate:", 0);

  CGColorRelease(self->mBackgroundColor);
  TSDClearCGContextInfo((uint64_t)self->mReusableBitmapContext);
  CGContextRelease(self->mReusableBitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)TSDImager;
  -[TSDImager dealloc](&v3, sel_dealloc);
}

- (void)setPostRenderAction:(id)a3
{

  self->mPostRenderAction = (id)objc_msgSend(a3, "copy");
}

- (void)setInfos:(id)a3
{
  id v5;

  if (self->mInfos != a3)
  {
    v5 = a3;

    self->mInfos = (NSArray *)a3;
    if (!objc_msgSend(a3, "count"))
    {
      -[TSDCanvas setInfosToDisplay:](self->mCanvas, "setInfosToDisplay:", self->mInfos);
      -[TSDCanvas layoutIfNeeded](self->mCanvas, "layoutIfNeeded");
    }
  }
}

- (void)setBackgroundColor:(CGColor *)a3
{
  CGColor *mBackgroundColor;
  CGColor *Copy;

  mBackgroundColor = self->mBackgroundColor;
  if (mBackgroundColor != a3)
  {
    CGColorRelease(mBackgroundColor);
    if (a3)
      Copy = CGColorCreateCopy(a3);
    else
      Copy = 0;
    self->mBackgroundColor = Copy;
  }
}

- (double)viewScale
{
  void *v3;
  uint64_t v4;

  if (self->mUseScaledImageSize)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager viewScale]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 125, CFSTR("Cannot call viewScale if scaledImageSize has been set."));
  }
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  void *v5;
  uint64_t v6;

  if (a3 <= 0.0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager setViewScale:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 131, CFSTR("Scale must be > 0."));
  }
  self->mViewScale = a3;
  self->mScaledImageSize = (CGSize)*MEMORY[0x24BDBF148];
  self->mUseScaledImageSize = 0;
}

- (CGSize)scaledImageSize
{
  void *v3;
  uint64_t v4;
  double width;
  double height;
  CGSize result;

  if (!self->mUseScaledImageSize)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager scaledImageSize]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 139, CFSTR("Cannot call scaledImageSize if viewScale has been set."));
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
  uint64_t v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v12;
  uint64_t v13;

  height = a3.height;
  width = a3.width;
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager setScaledImageSize:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 145, CFSTR("can't make an image with 0 width or height"));
  }
  v9 = TSDCeilSize(width);
  v10 = v8;
  if (width != v9 || height != v8)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager setScaledImageSize:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 147, CFSTR("given a non-integral scaled image size"));
  }
  self->mScaledImageSize.width = v9;
  self->mScaledImageSize.height = v10;
  self->mViewScale = -1.0;
  self->mUseScaledImageSize = 1;
}

- (CGSize)maximumScaledImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMaximumScaledImageSize.width;
  height = self->mMaximumScaledImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumScaledImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGFloat v8;
  void *v10;
  uint64_t v11;

  height = a3.height;
  width = a3.width;
  v7 = TSDCeilSize(a3.width);
  v8 = v6;
  if (width != v7 || height != v6)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager setMaximumScaledImageSize:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 161, CFSTR("given a non-integral maximum image size"));
  }
  self->mMaximumScaledImageSize.width = v7;
  self->mMaximumScaledImageSize.height = v8;
}

- (CGImage)newImage
{
  TSKDocumentRoot *mDocumentRoot;
  TSKDocumentRoot *v4;
  CGImage *v5;
  CGImage *v6;
  void (**mPostRenderAction)(id, _QWORD, TSDCanvas *);

  mDocumentRoot = self->mDocumentRoot;
  v4 = mDocumentRoot;
  if (-[TSDImager p_configureCanvas](self, "p_configureCanvas"))
  {
    if (self->mUseScaledImageSize)
    {
      if (-[TSDImager shouldReuseBitmapContext](self, "shouldReuseBitmapContext"))
        v5 = -[TSDImager p_newImageInReusableContext](self, "p_newImageInReusableContext");
      else
        v5 = -[TSDCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:](self->mCanvas, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:", self->mDistortedToMatch, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
      v6 = v5;
    }
    else
    {
      -[TSDCanvas i_clipsImagesToBounds:](self->mCanvas, "i_clipsImagesToBounds:", 0);
      v6 = -[TSDCanvas i_imageInScaledRect:](self->mCanvas, "i_imageInScaledRect:", self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height);
      -[TSDCanvas i_clipsImagesToBounds:](self->mCanvas, "i_clipsImagesToBounds:", 1);
    }
    mPostRenderAction = (void (**)(id, _QWORD, TSDCanvas *))self->mPostRenderAction;
    if (mPostRenderAction)
      mPostRenderAction[2](mPostRenderAction, 0, self->mCanvas);
  }
  else
  {
    v6 = 0;
  }

  return v6;
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

  if (!-[TSDImager p_configureCanvas](self, "p_configureCanvas"))
    return 0;
  v3 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CGDataConsumerCreateWithCFData(v3);
  if (v5)
  {
    v6 = v5;
    v13.origin.x = TSDRectWithSize();
    v13.origin.y = v7;
    v13.size.width = v8;
    v13.size.height = v9;
    v10 = CGPDFContextCreate(v6, &v13, 0);
    -[TSDImager p_drawPageInContext:createPage:](self, "p_drawPageInContext:createPage:", v10, 1);
    CGPDFContextClose(v10);
    CGContextRelease(v10);
    v11 = v4;
    CGDataConsumerRelease(v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;
  uint64_t BitmapQualityInfo;

  v4 = a4;
  v7 = -[TSDImager p_configureCanvas](self, "p_configureCanvas");
  if (v7)
  {
    BitmapQualityInfo = TSDCGContextGetBitmapQualityInfo((uint64_t)a3);
    if (BitmapQualityInfo)
      -[TSDCanvas addBitmapsToRenderingQualityInfo:inContext:](self->mCanvas, "addBitmapsToRenderingQualityInfo:inContext:", BitmapQualityInfo, a3);
    -[TSDImager p_drawPageInContext:createPage:](self, "p_drawPageInContext:createPage:", a3, v4);
  }
  return v7;
}

- (id)documentRoot
{
  return self->mDocumentRoot;
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)mCanvas
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (self->mCanvas != mCanvas)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager visibleScaledBoundsForClippingRepsOnCanvas:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 293, CFSTR("wrong canvas"));
    mCanvas = self->mCanvas;
  }
  objc_msgSend(mCanvas, "viewScale");
  v7 = TSDMultiplyRectScalar(self->mUnscaledClipRect.origin.x, self->mUnscaledClipRect.origin.y, self->mUnscaledClipRect.size.width, self->mUnscaledClipRect.size.height, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isCanvasDrawingIntoPDF:(id)a3
{
  void *v4;
  uint64_t v5;

  if (self->mCanvas != a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager isCanvasDrawingIntoPDF:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 300, CFSTR("wrong canvas"));
  }
  return self->mDrawingIntoPDF;
}

- (BOOL)isPrintingCanvas
{
  return self->mIsPrinting;
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
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  long double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[TSDCanvas setBackgroundColor:](self->mCanvas, "setBackgroundColor:", self->mBackgroundColor);
  -[TSDCanvas setContentInset:](self->mCanvas, "setContentInset:", self->mContentInset.top, self->mContentInset.left, self->mContentInset.bottom, self->mContentInset.right);
  -[TSDCanvas setInfosToDisplay:](self->mCanvas, "setInfosToDisplay:", self->mInfos);
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  -[TSDCanvas layoutIfNeeded](self->mCanvas, "layoutIfNeeded");
  x = self->mUnscaledClipRect.origin.x;
  y = self->mUnscaledClipRect.origin.y;
  width = self->mUnscaledClipRect.size.width;
  height = self->mUnscaledClipRect.size.height;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  if (CGRectEqualToRect(v46, *MEMORY[0x24BDBF028]))
  {
    -[TSDCanvas i_unscaledRectOfLayouts](self->mCanvas, "i_unscaledRectOfLayouts");
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MinX = CGRectGetMinX(v47);
  v12 = fminf(MinX, 0.0);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinY = CGRectGetMinY(v48);
  v14 = fminf(MinY, 0.0);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  MaxX = CGRectGetMaxX(v49);
  v16 = fmaxf(MaxX, 0.0);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  MaxY = CGRectGetMaxY(v50);
  v18 = v16 - v12;
  v19 = fmaxf(MaxY, 0.0) - v14;
  v20 = v19 > 0.0 && v18 > 0.0;
  if (v20)
  {
    -[TSDCanvas unscaledSize](self->mCanvas, "unscaledSize");
    if (v22 != v18 || v21 != v19)
    {
      -[TSDCanvas setUnscaledSize:](self->mCanvas, "setUnscaledSize:", v18, v19);
      -[TSDCanvas layoutIfNeeded](self->mCanvas, "layoutIfNeeded");
    }
    if (self->mUseScaledImageSize)
    {
      v24 = self->mScaledImageSize.width / width;
      v25 = self->mScaledImageSize.height / height;
      mViewScale = fminf(v24, v25);
    }
    else
    {
      mViewScale = self->mViewScale;
    }
    v27 = self->mMaximumScaledImageSize.width;
    if (v27 != 0.0 || self->mMaximumScaledImageSize.height != 0.0)
    {
      v28 = self->mMaximumScaledImageSize.height;
      if (width > v27 || height > v28)
      {
        if (v27 == 0.0)
          v29 = 0.0;
        else
          v29 = width / v27;
        if (v28 == 0.0)
          v30 = 0.0;
        else
          v30 = height / v28;
        if (v29 == 0.0 && v30 == 0.0)
        {
          v31 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v32 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager p_configureCanvas]");
          objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 374, CFSTR("both ratios in imager are zero!"));
        }
        if (v29 <= v30)
          v33 = v30;
        else
          v33 = v29;
        mViewScale = 1.0 / v33;
      }
    }
    -[TSDCanvas setViewScale:](self->mCanvas, "setViewScale:", mViewScale);
    -[TSDCanvas viewScale](self->mCanvas, "viewScale");
    self->mActualScaledClipRect.origin.x = TSDMultiplyRectScalar(x, y, width, height, v34);
    self->mActualScaledClipRect.origin.y = v35;
    self->mActualScaledClipRect.size.width = v36;
    self->mActualScaledClipRect.size.height = v37;
    if (self->mUseScaledImageSize && self->mImageMustHaveEvenDimensions)
    {
      v38 = TSDRoundedSize();
      v40 = v39;
      v41 = fmod(v39, 2.0);
      v42 = fmod(v38, 2.0);
      if (v41 != 0.0 || v42 != 0.0)
      {
        if (v41 != 0.0)
          v40 = v40 + -1.0;
        if (v42 != 0.0)
          v38 = v38 + -1.0;
        if (v38 > self->mScaledImageSize.width || v40 > self->mScaledImageSize.height)
        {
          v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager p_configureCanvas]");
          objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 401, CFSTR("new image dimensions not calculated as expected! Image may be the wrong size."));
        }
        self->mActualScaledClipRect.size.width = v38;
        self->mActualScaledClipRect.size.height = v40;
      }
    }
  }
  return v20;
}

- (void)p_drawPageInContext:(CGContext *)a3 createPage:(BOOL)a4
{
  _BOOL4 v4;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void (**mPostRenderAction)(id, CGContext *, TSDCanvas *);
  CGRect v15;
  CGRect v16;

  v4 = a4;
  self->mDrawingIntoPDF = 1;
  TSDSetCGContextInfo((uint64_t)a3, -[TSDImager isPrinting](self, "isPrinting"), self->mDrawingIntoPDF, 0, -[TSDCanvas shouldSuppressBackgrounds](self->mCanvas, "shouldSuppressBackgrounds"), 1.0);
  x = self->mActualScaledClipRect.origin.x;
  y = self->mActualScaledClipRect.origin.y;
  width = self->mActualScaledClipRect.size.width;
  height = self->mActualScaledClipRect.size.height;
  if (v4)
  {
    v15.origin.x = TSDRectWithSize();
    v15.origin.y = v11;
    v15.size.width = v12;
    v15.size.height = v13;
    CGContextBeginPage(a3, &v15);
  }
  CGContextTranslateCTM(a3, 0.0, height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -x, -y);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CGContextClipToRect(a3, v16);
  -[TSDCanvas i_drawBackgroundInContext:](self->mCanvas, "i_drawBackgroundInContext:", a3);
  -[TSDCanvas i_drawRepsInContext:](self->mCanvas, "i_drawRepsInContext:", a3);
  mPostRenderAction = (void (**)(id, CGContext *, TSDCanvas *))self->mPostRenderAction;
  if (mPostRenderAction)
    mPostRenderAction[2](mPostRenderAction, a3, self->mCanvas);
  if (v4)
    CGContextEndPage(a3);
  TSDClearCGContextInfo((uint64_t)a3);
  self->mDrawingIntoPDF = 0;
}

- (CGImage)p_newImageInReusableContext
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  CGContext *mReusableBitmapContext;
  CGContext *v7;
  CGSize size;
  CGColor *mBackgroundColor;

  if (!-[TSDImager shouldReuseBitmapContext](self, "shouldReuseBitmapContext"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImager p_newImageInReusableContext]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImager.m"), 451, CFSTR("shouldn't be reusing context"));
  }
  if (!self->mReusableBitmapContext)
    goto LABEL_11;
  if (!CGRectEqualToRect(self->mReusableActualScaledClipRect, self->mActualScaledClipRect)
    || (self->mReusableScaledImageSize.width == self->mScaledImageSize.width
      ? (v5 = self->mReusableScaledImageSize.height == self->mScaledImageSize.height)
      : (v5 = 0),
        !v5))
  {
    mReusableBitmapContext = self->mReusableBitmapContext;
    if (mReusableBitmapContext)
    {
      TSDClearCGContextInfo((uint64_t)mReusableBitmapContext);
      CGContextRelease(self->mReusableBitmapContext);
      self->mReusableBitmapContext = 0;
    }
LABEL_11:
    v7 = -[TSDCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:](self->mCanvas, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:", &self->mReusableBounds, &self->mReusableIntegralBounds, self->mActualScaledClipRect.origin.x, self->mActualScaledClipRect.origin.y, self->mActualScaledClipRect.size.width, self->mActualScaledClipRect.size.height, self->mScaledImageSize.width, self->mScaledImageSize.height);
    self->mReusableBitmapContext = v7;
    TSDSetCGContextInfo((uint64_t)v7, -[TSDImager isPrinting](self, "isPrinting"), self->mDrawingIntoPDF, 0, -[TSDCanvas shouldSuppressBackgrounds](self->mCanvas, "shouldSuppressBackgrounds"), 1.0);
    size = self->mActualScaledClipRect.size;
    self->mReusableActualScaledClipRect.origin = self->mActualScaledClipRect.origin;
    self->mReusableActualScaledClipRect.size = size;
    self->mReusableScaledImageSize = self->mScaledImageSize;
    return -[TSDCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:](self->mCanvas, "i_newImageInContext:bounds:integralBounds:distortedToMatch:", self->mReusableBitmapContext, self->mDistortedToMatch, self->mReusableBounds.origin.x, self->mReusableBounds.origin.y, self->mReusableBounds.size.width, self->mReusableBounds.size.height, self->mReusableIntegralBounds.origin.x, self->mReusableIntegralBounds.origin.y, self->mReusableIntegralBounds.size.width, self->mReusableIntegralBounds.size.height);
  }
  mBackgroundColor = self->mBackgroundColor;
  if (!mBackgroundColor || CGColorGetAlpha(mBackgroundColor) < 1.0)
    CGContextClearRect(self->mReusableBitmapContext, *MEMORY[0x24BDBF028]);
  return -[TSDCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:](self->mCanvas, "i_newImageInContext:bounds:integralBounds:distortedToMatch:", self->mReusableBitmapContext, self->mDistortedToMatch, self->mReusableBounds.origin.x, self->mReusableBounds.origin.y, self->mReusableBounds.size.width, self->mReusableBounds.size.height, self->mReusableIntegralBounds.origin.x, self->mReusableIntegralBounds.origin.y, self->mReusableIntegralBounds.size.width, self->mReusableIntegralBounds.size.height);
}

- (NSArray)infos
{
  return self->mInfos;
}

- (CGColor)backgroundColor
{
  return self->mBackgroundColor;
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

- (CGRect)actualScaledClipRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

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

- (BOOL)isPrinting
{
  return self->mIsPrinting;
}

- (void)setIsPrinting:(BOOL)a3
{
  self->mIsPrinting = a3;
}

- (TSDCanvas)canvas
{
  return self->mCanvas;
}

@end
