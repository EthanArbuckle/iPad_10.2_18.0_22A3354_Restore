@implementation CRLImageFill

- (CRLImageFill)initWithImageData:(id)a3 technique:(unint64_t)a4 tintColor:(id)a5 size:(CGSize)a6 referenceColor:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  CRLImageFill *v20;
  CRLImageFill *v21;
  CRLColor *v22;
  CRLColor *mTintColor;
  CRLColor *v24;
  CRLColor *mReferenceColor;
  CGFloat v26;
  CGFloat v27;
  objc_super v29;

  height = a6.height;
  width = a6.width;
  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (a4 >= 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233570);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF31E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233590);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 132, 0, "Invalid image fill technique: %zu Defaulting to natural size.", a4);

    a4 = 0;
  }
  v29.receiver = self;
  v29.super_class = (Class)CRLImageFill;
  v20 = -[CRLImageFill init](&v29, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->mImageData, a3);
    v21->mTechnique = a4;
    v22 = (CRLColor *)objc_msgSend(v15, "copy");
    mTintColor = v21->mTintColor;
    v21->mTintColor = v22;

    v24 = (CRLColor *)objc_msgSend(v16, "copy");
    mReferenceColor = v21->mReferenceColor;
    v21->mReferenceColor = v24;

    v21->mFillSize.width = width;
    v21->mFillSize.height = height;
    -[CRLImageFill fillSize](v21, "fillSize");
    v21->mFillSize.width = v26;
    v21->mFillSize.height = v27;
    -[CRLImageFill i_commonInit](v21, "i_commonInit");
  }

  return v21;
}

- (CRLImageFill)initWithImageData:(id)a3 technique:(unint64_t)a4 tintColor:(id)a5 size:(CGSize)a6
{
  return -[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:](self, "initWithImageData:technique:tintColor:size:referenceColor:", a3, a4, a5, 0, a6.width, a6.height);
}

- (id)initForUnarchiving
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageFill;
  return -[CRLImageFill init](&v3, "init");
}

- (void)i_commonSetup
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *mTempRenderLock;
  CRLImageFillCachedImage *v5;
  CRLImageFillCachedImage *mStandardSizeTintedImage;
  CRLImageFillCachedImage *v7;
  CRLImageFillCachedImage *mHalfSizeTintedImage;
  CRLImageFillCachedImage *v9;
  CRLImageFillCachedImage *mQuarterSizeTintedImage;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.drawing.fills.image", 0);
  mTempRenderLock = self->mTempRenderLock;
  self->mTempRenderLock = v3;

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A73E8;
  v15[3] = &unk_1012335B8;
  objc_copyWeak(&v16, &location);
  v5 = (CRLImageFillCachedImage *)objc_claimAutoreleasedReturnValue(+[CRLImageFillCachedImage cachedImageWithHandler:](CRLImageFillCachedImage, "cachedImageWithHandler:", v15));
  mStandardSizeTintedImage = self->mStandardSizeTintedImage;
  self->mStandardSizeTintedImage = v5;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A7424;
  v13[3] = &unk_1012335B8;
  objc_copyWeak(&v14, &location);
  v7 = (CRLImageFillCachedImage *)objc_claimAutoreleasedReturnValue(+[CRLImageFillCachedImage cachedImageWithHandler:](CRLImageFillCachedImage, "cachedImageWithHandler:", v13));
  mHalfSizeTintedImage = self->mHalfSizeTintedImage;
  self->mHalfSizeTintedImage = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A7460;
  v11[3] = &unk_1012335B8;
  objc_copyWeak(&v12, &location);
  v9 = (CRLImageFillCachedImage *)objc_claimAutoreleasedReturnValue(+[CRLImageFillCachedImage cachedImageWithHandler:](CRLImageFillCachedImage, "cachedImageWithHandler:", v11));
  mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;
  self->mQuarterSizeTintedImage = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)i_commonInit
{
  -[CRLImageFill i_commonSetup](self, "i_commonSetup");
  -[CRLImageFill i_updateStoredReferenceColorIfNeeded](self, "i_updateStoredReferenceColorIfNeeded");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->mImageData && self->mHasIndicatedInterestInProvider)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    objc_msgSend(v3, "removeInterestInProviderForAsset:", self->mImageData);

  }
  CGImageRelease(self->mTempRenderCopy);
  v4.receiver = self;
  v4.super_class = (Class)CRLImageFill;
  -[CRLImageFill dealloc](&v4, "dealloc");
}

- (void)p_clearTintedImageCache
{
  -[CRLImageFillCachedImage flush](self->mStandardSizeTintedImage, "flush");
  -[CRLImageFillCachedImage flush](self->mHalfSizeTintedImage, "flush");
  -[CRLImageFillCachedImage flush](self->mQuarterSizeTintedImage, "flush");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableImageFill *v4;
  _TtC8Freeform8CRLAsset *mImageData;
  unint64_t mTechnique;
  CRLColor *mTintColor;

  v4 = +[CRLMutableImageFill allocWithZone:](CRLMutableImageFill, "allocWithZone:", a3);
  mImageData = self->mImageData;
  mTechnique = self->mTechnique;
  mTintColor = self->mTintColor;
  -[CRLImageFill fillSize](self, "fillSize");
  return -[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:](v4, "initWithImageData:technique:tintColor:size:referenceColor:", mImageData, mTechnique, mTintColor, self->mReferenceColor);
}

- (_TtC8Freeform8CRLAsset)p_imageData
{
  return self->mImageData;
}

- (void)p_setImageData:(id)a3
{
  objc_storeStrong((id *)&self->mImageData, a3);
}

- (unint64_t)p_technique
{
  return self->mTechnique;
}

- (void)p_setTechnique:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (a3 >= 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012335D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3274();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012335F8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_setTechnique:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 230, 0, "Invalid image fill technique: %zu Defaulting to natural size.", v3);

    v3 = 0;
  }
  self->mTechnique = v3;
}

- (CRLColor)p_tintColor
{
  return self->mTintColor;
}

- (void)p_setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->mTintColor, a3);
}

- (CGSize)p_fillSize
{
  double width;
  double height;
  CGSize result;

  width = self->mFillSize.width;
  height = self->mFillSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)p_setFillSize:(CGSize)a3
{
  self->mFillSize = a3;
}

- (id)copyWithNewImageData:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CRLImageFill *v13;
  unint64_t v14;
  void *v15;
  CRLImageFill *v16;

  v4 = a3;
  if ((id)-[CRLImageFill technique](self, "technique") == (id)2)
  {
    -[CRLImageFill fillSize](self, "fillSize");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providerForAsset:shouldValidate:", v4, 1));

    objc_msgSend(v10, "naturalSize");
    v6 = v11;
    v8 = v12;

  }
  v13 = [CRLImageFill alloc];
  v14 = -[CRLImageFill technique](self, "technique");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
  v16 = -[CRLImageFill initWithImageData:technique:tintColor:size:](v13, "initWithImageData:technique:tintColor:size:", v4, v14, v15, v6, v8);

  return v16;
}

- (BOOL)canCopyData
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill imageData](self, "imageData"));
  v3 = objc_msgSend(v2, "needsDownload") ^ 1;

  return v3;
}

- (CGSize)p_imageDataNaturalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
  objc_msgSend(v2, "naturalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)scale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CRLImageFill p_imageDataNaturalSize](self, "p_imageDataNaturalSize");
  if (v4 == 0.0)
    return 1.0;
  v5 = v3;
  if (v3 == 0.0)
    return 1.0;
  v6 = v4;
  -[CRLImageFill fillSize](self, "fillSize");
  v8 = v7 / v5;
  -[CRLImageFill fillSize](self, "fillSize");
  return fmin(v8, v9 / v6);
}

- (CGSize)fillSize
{
  double width;
  double height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = self->mFillSize.width;
  height = self->mFillSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
    objc_msgSend(v5, "dpiAdjustedNaturalSize");
    width = v6;
    height = v7;

  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)isOpaque
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
  v5 = objc_opt_class(CRLBitmapImageProvider, v4);
  v6 = sub_100221D0C(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
    objc_msgSend(v9, "alphaComponent");
    v11 = v10 == 1.0;

  }
  else
  {
    v11 = 0;
  }

  v12 = objc_msgSend(v7, "isOpaque") | v11;
  return v12;
}

- (void)i_setStoredReferenceColor:(id)a3
{
  CRLColor *v4;
  CRLColor *mReferenceColor;

  v4 = (CRLColor *)objc_msgSend(a3, "copy");
  mReferenceColor = self->mReferenceColor;
  self->mReferenceColor = v4;

}

- (id)referenceColor
{
  CRLColor *v3;

  v3 = (CRLColor *)objc_claimAutoreleasedReturnValue(-[CRLImageFill storedReferenceColor](self, "storedReferenceColor"));
  if (!v3)
  {
    -[CRLImageFill p_updateCachedReferenceColorIfNeeded](self, "p_updateCachedReferenceColorIfNeeded");
    v3 = self->mCachedReferenceColor;
  }
  return v3;
}

- (CRLColor)storedReferenceColor
{
  return self->mReferenceColor;
}

- (id)p_calculateReferenceColor
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  CGContext *v22;
  CGContext *v23;
  CGMutablePathRef Mutable;
  CGPath *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _DWORD *Data;
  uint64_t v33;
  CGRect v35;

  if (!self->mShouldSkipFurtherAttemptsToCalculateReferenceColor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
    if ((objc_msgSend(v4, "isError") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_imageData](self, "p_imageData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fallbackColor"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_imageData](self, "p_imageData"));
      v8 = v7;
      if (!v6)
      {
        if (v7)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_imageData](self, "p_imageData"));
          self->mShouldSkipFurtherAttemptsToCalculateReferenceColor = objc_msgSend(v26, "needsDownload") ^ 1;

        }
        else
        {
          self->mShouldSkipFurtherAttemptsToCalculateReferenceColor = 0;
        }

        v2 = 0;
        goto LABEL_49;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fallbackColor"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
      v11 = v10;
      if (v10)
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorByCompositingSourceOverDestinationColor:", v9));
      else
        v12 = v9;
      v2 = v12;

    }
    else
    {
      -[CRLImageFill fillSize](self, "fillSize");
      v14 = v13;
      v16 = v15;
      v17 = sub_100060BF8(v13, v15);
      v18 = v17;
      if (v17)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101233618);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF3420();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101233638);
        v19 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_calculateReferenceColor]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 338, 0, "Non-error provider has zero size.");

      }
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
      if (v18)
        goto LABEL_49;
      v22 = sub_10040FA64(3, 1.0, 1.0);
      if (v22)
      {
        v23 = v22;
        Mutable = CGPathCreateMutable();
        if (Mutable)
        {
          v25 = Mutable;
          v35.origin.x = sub_10005FDDC();
          CGPathAddRect(v25, 0, v35);
          CGContextScaleCTM(v23, 1.0 / v14, 1.0 / v16);
          -[CRLImageFill paintPath:inContext:](self, "paintPath:inContext:", v25, v23);
          CGPathRelease(v25);
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233698);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF3390();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012336B8);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_calculateReferenceColor]"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 347, 0, "invalid nil value for '%{public}s'", "path");

        }
        Data = CGBitmapContextGetData(v23);
        if (Data)
        {
          v33 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", (double)BYTE2(*Data) / 255.0, (double)BYTE1(*Data) / 255.0, (double)*Data / 255.0, 1.0));

          v2 = (void *)v33;
        }
        CGContextRelease(v23);
        goto LABEL_49;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233658);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF3300();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233678);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_calculateReferenceColor]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v28, 344, 0, "invalid nil value for '%{public}s'", "smallContext");

    }
LABEL_49:

    return v2;
  }
  v2 = 0;
  return v2;
}

- (void)i_updateStoredReferenceColorIfNeeded
{
  CRLColor *v3;
  CRLColor *mReferenceColor;

  if (!self->mReferenceColor)
  {
    v3 = (CRLColor *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_calculateReferenceColor](self, "p_calculateReferenceColor"));
    mReferenceColor = self->mReferenceColor;
    self->mReferenceColor = v3;

  }
}

- (void)p_updateCachedReferenceColorIfNeeded
{
  CRLColor *v3;
  CRLColor *mCachedReferenceColor;
  CRLImageFill *obj;

  if (!self->mCachedReferenceColor)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!self->mCachedReferenceColor)
    {
      v3 = (CRLColor *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_calculateReferenceColor](obj, "p_calculateReferenceColor"));
      mCachedReferenceColor = self->mCachedReferenceColor;
      self->mCachedReferenceColor = v3;

    }
    objc_sync_exit(obj);

  }
}

- (unint64_t)hash
{
  return -[CRLAsset hash](self->mImageData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLImageFill *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;

  v5 = (CRLImageFill *)a3;
  if (v5 == self)
  {
    v21 = 1;
  }
  else
  {
    v6 = objc_opt_class(CRLImageFill, v4);
    v7 = sub_100221D0C(v6, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_claimAutoreleasedReturnValue(-[CRLImageFill imageData](self, "imageData"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageData"));
      if ((!(v10 | v11) || objc_msgSend((id)v10, "isEqual:", v11))
        && (v12 = -[CRLImageFill technique](self, "technique"), v12 == objc_msgSend(v9, "technique")))
      {
        v13 = objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tintColor"));
        if (v13 | v14 && !objc_msgSend((id)v13, "isEqual:", v14))
        {
          v21 = 0;
        }
        else
        {
          -[CRLImageFill fillSize](self, "fillSize");
          v16 = v15;
          v18 = v17;
          objc_msgSend(v9, "fillSize");
          v21 = sub_10005FDF0(v16, v18, v19, v20);
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (BOOL)drawsInOneStep
{
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->mTintColor)
  {
    isKindOfClass = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
    v6 = objc_opt_class(CRLBitmapImageProvider, v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  }
  return isKindOfClass & (self->mTechnique != 2);
}

- (BOOL)canApplyToRenderable
{
  BOOL v3;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  if (self->mTintColor || (self->mTechnique | 2) == 2)
    return 0;
  v5 = objc_opt_class(CRLBitmapImageProvider, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v3 = objc_msgSend(v8, "orientation") == 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)canApplyToRenderableByAddingSubrenderables
{
  BOOL v3;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  if (self->mTintColor || self->mTechnique == 2)
    return 0;
  v5 = objc_opt_class(CRLBitmapImageProvider, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v3 = objc_msgSend(v8, "orientation") == 0;
  else
    v3 = 0;

  return v3;
}

- (int64_t)fillType
{
  return 2;
}

- (BOOL)p_shouldApplyTintedImage
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_standardSizeCachedImage](self, "p_standardSizeCachedImage"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldBeReappliedToRenderable:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;

  v4 = a3;
  if (self->mTechnique)
  {
    if (-[CRLImageFill p_shouldApplyTintedImage](self, "p_shouldApplyTintedImage"))
    {
      v6 = 0;
    }
    else
    {
      v7 = objc_opt_class(CRLBitmapImageProvider, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
      v9 = sub_100221D0C(v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      objc_msgSend(v4, "bounds");
      v13 = objc_msgSend(v10, "CGImageForSize:inContext:orContentsScaleProvider:", 0, v4, v11, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contents"));
      v6 = v14 != v13;

    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)p_cachedImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t v27;
  void *v28;
  CGAffineTransform v30;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = v9;
  if (a4)
  {
    if (v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012336D8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF34A0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012336F8);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_cachedImageForSize:inContext:orContentsScaleProvider:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 483, 0, "using context to determine requested image size. contentsScaleProvider should be nil");

    }
    if ((sub_100411DA0((uint64_t)a4) & 1) != 0 || sub_100411FB8((uint64_t)a4))
    {
LABEL_26:
      v27 = objc_claimAutoreleasedReturnValue(-[CRLImageFill p_standardSizeCachedImage](self, "p_standardSizeCachedImage"));
      goto LABEL_28;
    }
    v14 = sub_1004121D0((uint64_t)a4);
    width = sub_1000603DC(width, height, v14);
    height = v15;
    CGContextGetCTM(&v30, a4);
    v16 = sub_10007922C(&v30.a);
  }
  else
  {
    if (!v9)
      goto LABEL_18;
    objc_msgSend(v9, "contentsScale");
  }
  width = sub_1000603DC(width, height, v16);
  height = v17;
LABEL_18:
  -[CRLImageFill fillSize](self, "fillSize");
  v19 = v18;
  v21 = v20;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    v22 = sub_10040EA9C();
    v23 = sub_100062E58(v19, v21, (double)v22);
    v19 = sub_100061064(v23);
    v21 = v24;
  }
  if (width > sub_1000603DC(v19, v21, 0.25) || height > v25)
  {
    if (width <= sub_1000603DC(v19, v21, 0.5))
    {
      v27 = objc_claimAutoreleasedReturnValue(-[CRLImageFill p_halfSizeCachedImage](self, "p_halfSizeCachedImage"));
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  v27 = objc_claimAutoreleasedReturnValue(-[CRLImageFill p_quarterSizeCachedImage](self, "p_quarterSizeCachedImage"));
LABEL_28:
  v28 = (void *)v27;

  return v28;
}

- (void)applyToRenderable:(id)a3 withScale:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  double x;
  double y;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double width;
  double height;
  void *v54;
  void *v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  void *v83;
  id v84;
  NSString *v85;
  void *v86;
  void *v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v6 = a3;
  if (!-[CRLImageFill canApplyToRenderable](self, "canApplyToRenderable")
    && !-[CRLImageFill canApplyToRenderableByAddingSubrenderables](self, "canApplyToRenderableByAddingSubrenderables"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233718);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF35A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233738);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill applyToRenderable:withScale:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 517, 0, "Applying image fill with unsupported properties to CRLCanvasRenderable");

  }
  v11 = objc_opt_class(CRLBitmapImageProvider, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
  v13 = sub_100221D0C(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  LODWORD(v12) = -[CRLImageFill p_shouldApplyTintedImage](self, "p_shouldApplyTintedImage");
  objc_msgSend(v6, "bounds");
  if ((_DWORD)v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_cachedImageForSize:inContext:orContentsScaleProvider:](self, "p_cachedImageForSize:inContext:orContentsScaleProvider:", 0, v6, v15, v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));
    v19 = objc_msgSend(v18, "CGImage");

  }
  else
  {
    v19 = objc_msgSend(v14, "CGImageForSize:inContext:orContentsScaleProvider:", 0, v6, v15, v16);
  }
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subrenderables"));
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subrenderables"));
    v24 = (uint64_t)objc_msgSend(v23, "indexOfObjectPassingTest:", &stru_101233778);

  }
  else
  {
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
  x = CGPointZero.x;
  y = CGPointZero.y;
  switch(self->mTechnique)
  {
    case 0uLL:
      v27 = kCAGravityResize;
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        objc_msgSend(v28, "addSubrenderable:", v29);
      }
      else
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subrenderables"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndex:", v24));

        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subrenderables"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "lastObject"));

      }
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      objc_msgSend(v6, "bounds");
      objc_msgSend(v28, "setPosition:", sub_100061400(v56, v57, v58, v59));
      objc_msgSend(v6, "bounds");
      objc_msgSend(v28, "setBounds:");
      objc_msgSend(v28, "setMasksToBounds:", 1);
      objc_msgSend(v28, "setEdgeAntialiasingMask:", 1);
      objc_msgSend(v28, "bounds");
      v64 = sub_100061400(v60, v61, v62, v63);
      v66 = v65;
      -[CRLImageFill fillSize](self, "fillSize");
      v68 = sub_10005FD98(v64, v66, v67);
      v70 = v69;
      v72 = v71;
      v74 = v73;
      objc_msgSend(v6, "contentsScale");
      v76 = sub_100063150(v68, v70, v72, v74, v75 * a4);
      v78 = v77;
      v80 = v79;
      v82 = v81;
      objc_msgSend(v29, "setContents:", v20);
      objc_msgSend(v29, "setPosition:", sub_100061400(v76, v78, v80, v82));
      objc_msgSend(v29, "setBounds:", sub_10005FDDC());
      objc_msgSend(v6, "contentsScale");
      objc_msgSend(v29, "setContentsScale:");
      CGAffineTransformMakeScale(&v89, a4, a4);
      v88 = v89;
      objc_msgSend(v29, "setAffineTransform:", &v88);
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      objc_msgSend(v29, "setDelegate:", v83);

      objc_msgSend(v29, "setEdgeAntialiasingMask:", 0);
      +[CATransaction commit](CATransaction, "commit");

      v20 = 0;
      goto LABEL_36;
    case 1uLL:
      goto LABEL_30;
    case 3uLL:
      v27 = kCAGravityResizeAspectFill;
      -[CRLImageFill fillSize](self, "fillSize");
      v35 = v34;
      v37 = v36;
      objc_msgSend(v6, "bounds");
      v39 = v38;
      v41 = v40;
      v42 = sub_10005FDDC();
      v46 = sub_100062EB4(1, v35, v37, v42, v43, v44, v45);
      v48 = 1.0 / v47;
      v50 = 1.0 / v49;
      v93.origin.x = -(v46 * v48);
      v93.origin.y = -(v51 * v50);
      v93.size.width = v39 * v48;
      v93.size.height = v41 * v50;
      v90.size.width = 1.0;
      v90.size.height = 1.0;
      v90.origin.x = CGPointZero.x;
      v90.origin.y = y;
      v91 = CGRectIntersection(v90, v93);
      x = v91.origin.x;
      y = v91.origin.y;
      width = v91.size.width;
      height = v91.size.height;
      v28 = 0;
      goto LABEL_37;
    case 4uLL:
      v33 = (id *)&kCAGravityResizeAspect;
      goto LABEL_33;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233798);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF3520();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012337B8);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill applyToRenderable:withScale:]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 608, 0, "bogus fill technique to apply to renderable");

LABEL_30:
      v33 = (id *)&kCAGravityResize;
LABEL_33:
      v27 = (NSString *)*v33;
      v28 = 0;
LABEL_36:
      height = 1.0;
      width = 1.0;
LABEL_37:
      v84 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contents"));

      if (v84 != v20)
        objc_msgSend(v6, "setContents:", v20);
      v85 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsGravity"));

      if (v85 != v27)
        objc_msgSend(v6, "setContentsGravity:", v27);
      objc_msgSend(v6, "contentsRect");
      v94.origin.x = x;
      v94.origin.y = y;
      v94.size.width = width;
      v94.size.height = height;
      if (!CGRectEqualToRect(v92, v94))
        objc_msgSend(v6, "setContentsRect:", x, y, width, height);
      if (objc_msgSend(v6, "backgroundColor"))
        objc_msgSend(v6, "setBackgroundColor:", 0);
      if (v28 && v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v28, "setName:", CFSTR("CRLImageFillSublayer"));
        objc_msgSend(v6, "addSubrenderable:", v28);
      }
      else if (!v28 && v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subrenderables"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectAtIndex:", v24));
        objc_msgSend(v87, "removeFromSuperlayer");

      }
      return;
  }
}

- (CGSize)renderedImageSizeForObjectSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  switch(-[CRLImageFill technique](self, "technique"))
  {
    case 0uLL:
    case 2uLL:
      -[CRLImageFill fillSize](self, "fillSize");
      goto LABEL_4;
    case 1uLL:
      break;
    case 3uLL:
    case 4uLL:
      -[CRLImageFill fillSize](self, "fillSize");
      v6 = sub_100062E78((id)-[CRLImageFill technique](self, "technique") == (id)3, v8, v9, width, height);
LABEL_4:
      width = v6;
      height = v7;
      break;
    default:
      height = 0.0;
      width = 0.0;
      break;
  }
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  void *v11;
  void *v12;
  void *v13;
  CGRect v14;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    Mutable = CGPathCreateMutable();
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    CGPathAddRect(Mutable, 0, v14);
    -[CRLImageFill paintPath:inContext:](self, "paintPath:inContext:", Mutable, a4);
    CGPathRelease(Mutable);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012337D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3620();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012337F8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill drawSwatchInRect:inContext:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 658, 0, "invalid nil value for '%{public}s'", "ctx");

  }
}

- (CGSize)p_sizeOfFillImageForDestRect:(CGRect)a3 inContext:(CGContext *)a4
{
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v6 = -[CRLImageFill technique](self, "technique");
  -[CRLImageFill fillSize](self, "fillSize");
  if (v6 != 2)
  {
    -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
    v7 = v9;
    v8 = v10;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4 rectForFill:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGImage *v52;
  CGRect v53;
  CGRect PathBoundingBox;
  CGRect v55;

  if (a3)
  {
    if (a4)
    {
      height = a5.size.height;
      width = a5.size.width;
      y = a5.origin.y;
      x = a5.origin.x;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
      if (!v12)
      {
LABEL_51:

        return;
      }
      CGContextSaveGState(a4);
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
      CGContextClip(a4);
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      if (CGRectIsNull(v53))
      {
        PathBoundingBox = CGPathGetPathBoundingBox(a3);
        x = PathBoundingBox.origin.x;
        y = PathBoundingBox.origin.y;
        width = PathBoundingBox.size.width;
        height = PathBoundingBox.size.height;
      }
      v13 = objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(v12, "isError");

        if ((v15 & 1) == 0)
        {
          -[CRLImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_cachedImageForSize:inContext:orContentsScaleProvider:](self, "p_cachedImageForSize:inContext:orContentsScaleProvider:", a4, 0));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "image"));
          v30 = objc_msgSend(v29, "CGImage");

          -[CRLImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", v30, 0, a4, x, y, width, height);
LABEL_50:
          CGContextRestoreGState(a4);
          goto LABEL_51;
        }
      }
      CGContextSaveGState(a4);
      v17 = objc_opt_class(CRLBitmapImageProvider, v16);
      if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0)
      {
        v19 = v12;
        -[CRLImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
        v20 = objc_msgSend(v19, "CGImageForSize:inContext:orContentsScaleProvider:", a4, 0);
        v21 = objc_msgSend(v19, "orientation");

        -[CRLImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", v20, v21, a4, x, y, width, height);
      }
      else
      {
        v27 = objc_opt_class(CRLPDFImageProvider, v18);
        if ((objc_opt_isKindOfClass(v12, v27) & 1) == 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill imageData](self, "imageData"));
          v32 = objc_msgSend(v31, "needsDownload");

          if (v32)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill imageData](self, "imageData"));
            sub_100412654(a4, v34);

            v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAsset fallbackColor](self->mImageData, "fallbackColor"));
            v36 = v35;
            if (v35)
            {
              objc_msgSend(v35, "paintPath:inContext:", a3, a4);
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
              v38 = v37;
              if (v37)
                objc_msgSend(v37, "paintPath:inContext:", a3, a4);
            }
            else
            {
              CGContextSaveGState(a4);
              v38 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("sf_streaming_large_bg_pattern")));
              objc_msgSend(v38, "size");
              v45 = sub_10005FDDC();
              v47 = v46;
              v49 = v48;
              v51 = v50;
              v52 = (CGImage *)objc_msgSend(v38, "CGImageForContentsScale:", sub_1004121D0((uint64_t)a4));
              v55.origin.x = v45;
              v55.origin.y = v47;
              v55.size.width = v49;
              v55.size.height = v51;
              CGContextDrawTiledImage(a4, v55, v52);
              CGContextRestoreGState(a4);
            }

          }
          else
          {
            v39 = objc_opt_class(CRLErrorImageProvider, v33);
            if ((objc_opt_isKindOfClass(v12, v39) & 1) != 0)
            {
              -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4, width, height, x, y, width, height);
              objc_msgSend(v12, "drawImageInContext:rect:", a4);
              goto LABEL_49;
            }
            v40 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101233898);
            v41 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF37D0(v41, (uint64_t)self, v40);
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012338B8);
            v42 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7468(v42);
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_paintPath:inContext:rectForFill:]"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill imageData](self, "imageData"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v43, 734, 0, "can't draw CRLAsset with unknown image type: %@", v44);

          }
          goto LABEL_49;
        }
        -[CRLImageFill p_drawPDFWithProvider:inContext:bounds:](self, "p_drawPDFWithProvider:inContext:bounds:", v12, a4, x, y, width, height);
      }
LABEL_49:
      CGContextRestoreGState(a4);
      goto LABEL_50;
    }
LABEL_19:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233858);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF36B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233878);
    v25 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_paintPath:inContext:rectForFill:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v26, 684, 0, "invalid nil value for '%{public}s'", "ctx");

    goto LABEL_51;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233818);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF3740();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233838);
  v22 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_paintPath:inContext:rectForFill:]"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 683, 0, "invalid nil value for '%{public}s'", "path");

  if (!a4)
    goto LABEL_19;
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  -[CRLImageFill drawFillInContext:rect:clippingToPath:](self, "drawFillInContext:rect:clippingToPath:", a4, a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)drawFillInContext:(CGContext *)a3 rect:(CGRect)a4 clippingToPath:(CGPath *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGRect v18;
  CGRect PathBoundingBox;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012338D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF392C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012338F8);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill drawFillInContext:rect:clippingToPath:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 750, 0, "invalid nil value for '%{public}s'", "clippingPath");

  }
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!CGRectIsNull(v18))
  {
    PathBoundingBox = CGPathGetPathBoundingBox(a5);
    if (!sub_10005FFE0(x, y, width, height, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233918);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF38AC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233938);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill drawFillInContext:rect:clippingToPath:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 752, 0, "rectForFill must equal or contain the path bounds");

    }
  }
  -[CRLImageFill p_paintPath:inContext:rectForFill:](self, "p_paintPath:inContext:rectForFill:", a5, a3, x, y, width, height);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", 0, a5, a6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233958);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF39BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233978);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill paintPath:naturalBounds:inContext:isPDF:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 757, 0, "invalid nil value for '%{public}s'", "path");

  }
  -[CRLImageFill p_paintPath:inContext:rectForFill:](self, "p_paintPath:inContext:rectForFill:", a3, a5, a6, x, y, width, height);
}

- (id)p_tintedImageWithScale:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  CGColorSpace *ColorSpace;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  CGColorSpace *v45;
  _BOOL4 v46;
  CGContext *v47;
  CGContext *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  CGImage *Image;
  CGRect v58;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill p_validatedImageProvider](self, "p_validatedImageProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
  v7 = v6;
  if (!v6 || !v5)
  {

LABEL_9:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));

    if (v29)
    {
      if (v5)
      {
LABEL_30:
        if (objc_msgSend(v5, "isError"))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233A18);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF3A4C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233A38);
          v36 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_tintedImageWithScale:]"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 824, 0, "Image provider has error for image fill.");

        }
        goto LABEL_40;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233998);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF3B4C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012339B8);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_tintedImageWithScale:]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 822, 0, "Image fill has a null tint color.");

      if (v5)
        goto LABEL_30;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012339D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3ACC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012339F8);
    v33 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFill p_tintedImageWithScale:]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 823, 0, "Image provider for image fill could not be validated and is nil.");

    goto LABEL_30;
  }
  v8 = objc_msgSend(v5, "isError");

  if ((v8 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v5, "naturalSize");
  v10 = v9;
  v12 = v11;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    v13 = sub_10040EA9C();
    v14 = sub_100062E58(v10, v12, (double)v13);
    v10 = sub_100061064(v14);
    v12 = v15;
  }
  v16 = sub_1000603DC(v10, v12, a3);
  v18 = sub_1000630C4(v16, v17);
  v20 = sub_100060C18(v18, v19, 1.0);
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
  v24 = objc_msgSend(v23, "colorRGBSpace");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v25, "CGColor"));

  if (ColorSpace)
    v28 = CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelMonochrome;
  else
    v28 = 1;
  v41 = objc_opt_class(CRLBitmapImageProvider, v27);
  v42 = sub_100221D0C(v41, v5);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = v43;
  if (!v43)
    goto LABEL_50;
  v45 = CGImageGetColorSpace((CGImageRef)objc_msgSend(v43, "CGImageOfAnySize"));
  if (v45)
  {
    v46 = (CGColorSpaceGetModel(v45) - 4) < 0xFFFFFFFD;
    if (v24)
      goto LABEL_50;
  }
  else
  {
    v46 = 1;
    if (v24)
      goto LABEL_50;
  }
  if (!v28 || !v46)
  {
    v47 = sub_10040FEFC((CGImage *)objc_msgSend(v44, "CGImageOfAnySize"), 11, v20, v22);
    goto LABEL_51;
  }
LABEL_50:
  v47 = sub_10040FA64(43, v20, v22);
LABEL_51:
  v48 = v47;
  v49 = sub_10005FDDC();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  CGContextSaveGState(v48);
  objc_msgSend(v5, "drawImageInContext:rect:", v48, v49, v51, v53, v55);
  CGContextRestoreGState(v48);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));
  CGContextSetFillColorWithColor(v48, (CGColorRef)objc_msgSend(v56, "CGColor"));

  v58.origin.x = v49;
  v58.origin.y = v51;
  v58.size.width = v53;
  v58.size.height = v55;
  CGContextFillRect(v48, v58);
  Image = CGBitmapContextCreateImage(v48);
  CGContextRelease(v48);

  if (Image)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
    CGImageRelease(Image);
    goto LABEL_41;
  }
LABEL_40:
  v39 = 0;
LABEL_41:

  return v39;
}

- (id)p_standardSizeCachedImage
{
  void *v3;
  CRLImageFillCachedImage *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));

  if (v3)
    v4 = self->mStandardSizeTintedImage;
  else
    v4 = 0;
  return v4;
}

- (id)p_halfSizeCachedImage
{
  void *v3;
  CRLImageFillCachedImage *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));

  if (v3)
    v4 = self->mHalfSizeTintedImage;
  else
    v4 = 0;
  return v4;
}

- (id)p_quarterSizeCachedImage
{
  void *v3;
  CRLImageFillCachedImage *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFill tintColor](self, "tintColor"));

  if (v3)
    v4 = self->mQuarterSizeTintedImage;
  else
    v4 = 0;
  return v4;
}

- (id)p_validatedImageProvider
{
  void *v3;
  void *v4;
  void *v5;
  _TtC8Freeform8CRLAsset *mImageData;
  void *v7;
  void *v8;

  if (!self->mHasIndicatedInterestInProvider && self->mImageData)
  {
    self->mHasIndicatedInterestInProvider = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    objc_msgSend(v3, "addInterestInProviderForAsset:", self->mImageData);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v5 = v4;
  mImageData = self->mImageData;
  if (mImageData)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providerForAsset:shouldValidate:", mImageData, 1));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAsset null](_TtC8Freeform8CRLAsset, "null"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "providerForAsset:shouldValidate:", v8, 1));

  }
  return v7;
}

- (CGRect)p_drawnRectForImageSize:(CGSize)a3 destRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
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
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  v13 = -[CRLImageFill technique](self, "technique");
  if (v13 - 3 < 2)
  {
    v14 = sub_100062EB4((id)-[CRLImageFill technique](self, "technique") == (id)3, v11, v10, x, y, width, height);
LABEL_6:
    x = v14;
    y = v15;
    width = v16;
    height = v17;
    goto LABEL_7;
  }
  if (!v13)
  {
    CGContextGetUserSpaceToDeviceSpaceTransform(&v35, a5);
    v18 = sub_100079384(&v35.a);
    v19 = sub_100061400(x, y, width, height);
    v21 = sub_10005FD98(v19, v20, v11);
    x = v21;
    y = v22;
    width = v23;
    height = v24;
    if (v18)
    {
      v36 = CGContextConvertRectToDeviceSpace(a5, *(CGRect *)&v21);
      v25 = v36.size.width;
      v26 = v36.size.height;
      v27 = sub_1000630C4(v36.origin.x, v36.origin.y);
      v29 = v28;
      v37.size.width = sub_1000630C4(v25, v26);
      v37.size.height = v30;
      v37.origin.x = v27;
      v37.origin.y = v29;
      *(CGRect *)&v14 = CGContextConvertRectToUserSpace(a5, v37);
      goto LABEL_6;
    }
  }
LABEL_7:
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)p_drawBitmapImage:(CGImage *)a3 withOrientation:(int64_t)a4 inContext:(CGContext *)a5 bounds:(CGRect)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  unint64_t v24;
  double v25;
  CGFloat v26;
  CGContext *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  NSObject *mTempRenderLock;
  double MinY;
  CGFloat MaxY;
  CGFloat v43;
  CGFloat v44;
  _QWORD block[7];
  CGAffineTransform transform;
  CGAffineTransform v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  if (a3)
  {
    height = a6.size.height;
    width = a6.size.width;
    y = a6.origin.y;
    x = a6.origin.x;
    -[CRLImageFill fillSize](self, "fillSize");
    v15 = v14;
    v17 = v16;
    -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a5);
    v43 = v18;
    v44 = v19;
    v21 = v20;
    v23 = v22;
    v24 = -[CRLImageFill technique](self, "technique");
    if (v24 > 4 || v24 == 2)
    {
      if (width > v15 || height > v17)
      {
        CGContextTranslateCTM(a5, v43, v44);
        CGContextScaleCTM(a5, 1.0, -1.0);
        v33 = sub_10005FDDC();
        v35 = v34;
        v37 = v36;
        v39 = v38;
        memset(&v47, 0, sizeof(v47));
        sub_1003F6270((CGAffineTransform *)a4, 1, (uint64_t)&v47, v33, v34, v36, v38);
        transform = v47;
        CGContextConcatCTM(a5, &transform);
        transform.a = 0.0;
        *(_QWORD *)&transform.b = &transform;
        *(_QWORD *)&transform.c = 0x2020000000;
        transform.d = 0.0;
        mTempRenderLock = self->mTempRenderLock;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000AB2EC;
        block[3] = &unk_10122DCF0;
        block[5] = &transform;
        block[6] = a3;
        block[4] = self;
        dispatch_sync(mTempRenderLock, block);
        v50.origin.x = v33;
        v50.origin.y = v35;
        v50.size.width = v37;
        v50.size.height = v39;
        CGContextDrawTiledImage(a5, v50, *(CGImageRef *)(*(_QWORD *)&transform.b + 24));
        CGImageRelease(*(CGImageRef *)(*(_QWORD *)&transform.b + 24));
        _Block_object_dispose(&transform, 8);
        return;
      }
      v51.origin.x = v43;
      v51.origin.y = v44;
      v51.size.width = v15;
      v51.size.height = v17;
      MinY = CGRectGetMinY(v51);
      v52.origin.x = v43;
      v52.origin.y = v44;
      v52.size.width = v15;
      v52.size.height = v17;
      MaxY = CGRectGetMaxY(v52);
      CGContextTranslateCTM(a5, 0.0, MinY + MaxY);
      CGContextScaleCTM(a5, 1.0, -1.0);
      memset(&v47, 0, sizeof(v47));
      sub_1003F6270((CGAffineTransform *)a4, 1, (uint64_t)&v47, v43, v44, v15, v17);
      transform = v47;
      CGContextConcatCTM(a5, &transform);
      v27 = a5;
      v28 = v43;
      v29 = v44;
      v30 = v15;
      v31 = v17;
    }
    else
    {
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v25 = CGRectGetMinY(v48);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      v26 = CGRectGetMaxY(v49);
      CGContextTranslateCTM(a5, 0.0, v25 + v26);
      CGContextScaleCTM(a5, 1.0, -1.0);
      memset(&v47, 0, sizeof(v47));
      sub_1003F6270((CGAffineTransform *)a4, 1, (uint64_t)&v47, v43, v44, v21, v23);
      transform = v47;
      CGContextConcatCTM(a5, &transform);
      v27 = a5;
      v28 = v43;
      v29 = v44;
      v30 = v21;
      v31 = v23;
    }
    CGContextDrawImage(v27, *(CGRect *)&v28, a3);
  }
}

- (void)p_drawPDFWithProvider:(id)a3 inContext:(CGContext *)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPDFDocument *v11;
  CGPDFPageRef Page;
  CGPDFPage *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MinY;
  CGFloat MaxY;
  unint64_t v28;
  CGSize v29;
  double v30;
  double v31;
  double v32;
  CGContext *v33;
  CGContext *v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGImage *Image;
  CGFloat MinX;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  CGRect v45;
  CGAffineTransform transform;
  __n128 v47;
  __int128 v48;
  __int128 v49;
  double v50;
  double v51;
  CGAffineTransform v52;
  CGSize v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (CGPDFDocument *)objc_msgSend(a3, "CGPDFDocument");
  if (v11)
  {
    Page = CGPDFDocumentGetPage(v11, 1uLL);
    if (Page)
    {
      v13 = Page;
      CGContextSaveGState(a4);
      memset(&v52, 0, sizeof(v52));
      v50 = 0.0;
      v51 = 0.0;
      v45.origin.x = sub_10041069C(v13, (uint64_t)&v52, &v50);
      v45.origin.y = v14;
      v45.size.width = v15;
      v45.size.height = v16;
      -[CRLImageFill fillSize](self, "fillSize");
      v42 = v18;
      v43 = v17;
      -[CRLImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
      v44 = v19;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      MinY = CGRectGetMinY(v54);
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = width;
      v55.size.height = height;
      MaxY = CGRectGetMaxY(v55);
      CGContextTranslateCTM(a4, 0.0, MinY + MaxY);
      CGContextScaleCTM(a4, 1.0, -1.0);
      v28 = -[CRLImageFill technique](self, "technique");
      if (v28 > 4 || v28 == 2)
      {
        v53.width = 1.0;
        v53.height = 1.0;
        v29 = CGContextConvertSizeToDeviceSpace(a4, v53);
        v30 = sub_1000603DC(v43, v42, fmax(fabs(v29.width), fabs(v29.height)));
        v31 = sub_100063090(v30);
        v33 = sub_10040FA64(3, v31, v32);
        if (v33)
        {
          v34 = v33;
          v48 = 0u;
          v49 = 0u;
          v47 = 0u;
          v35 = sub_10005FDDC();
          transform = v52;
          sub_100410A70((__n128 *)&transform, &v47, v50, v51, v35, v36, v37, v38);
          *(__n128 *)&transform.a = v47;
          *(_OWORD *)&transform.c = v48;
          *(_OWORD *)&transform.tx = v49;
          CGContextConcatCTM(v34, &transform);
          CGContextClipToRect(v34, v45);
          CGContextDrawPDFPage(v34, v13);
          Image = CGBitmapContextCreateImage(v34);
          CGContextRelease(v34);
          if (Image)
          {
            v56.origin.x = x;
            v56.origin.y = y;
            v56.size.width = width;
            v56.size.height = height;
            MinX = CGRectGetMinX(v56);
            v57.origin.x = x;
            v57.origin.y = y;
            v57.size.width = width;
            v57.size.height = height;
            v41 = CGRectGetMaxY(v57);
            CGContextTranslateCTM(a4, MinX, v41);
            v58.origin.x = sub_10005FDDC();
            CGContextDrawTiledImage(a4, v58, Image);
            CGImageRelease(Image);
          }
        }
      }
      else
      {
        v48 = 0u;
        v49 = 0u;
        transform = v52;
        v47 = 0u;
        sub_100410A70((__n128 *)&transform, &v47, v50, v51, v44, v21, v23, v25);
        *(__n128 *)&transform.a = v47;
        *(_OWORD *)&transform.c = v48;
        *(_OWORD *)&transform.tx = v49;
        CGContextConcatCTM(a4, &transform);
        CGContextClipToRect(a4, v45);
        CGContextDrawPDFPage(a4, v13);
      }
      CGContextRestoreGState(a4);
    }
  }
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return self->mImageData;
}

- (unint64_t)technique
{
  return self->mTechnique;
}

- (void)setTechnique:(unint64_t)a3
{
  self->mTechnique = a3;
}

- (CRLColor)tintColor
{
  return self->mTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTempRenderLock, 0);
  objc_storeStrong((id *)&self->mCachedReferenceColor, 0);
  objc_storeStrong((id *)&self->mReferenceColor, 0);
  objc_storeStrong((id *)&self->mQuarterSizeTintedImage, 0);
  objc_storeStrong((id *)&self->mHalfSizeTintedImage, 0);
  objc_storeStrong((id *)&self->mStandardSizeTintedImage, 0);
  objc_storeStrong((id *)&self->mTintColor, 0);
  objc_storeStrong((id *)&self->mImageData, 0);
}

@end
