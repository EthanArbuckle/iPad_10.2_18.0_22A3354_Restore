@implementation CRLMutableImageFill

- (id)copyWithZone:(_NSZone *)a3
{
  CRLImageFill *v4;
  _TtC8Freeform8CRLAsset *mImageData;
  unint64_t mTechnique;
  CRLColor *mTintColor;

  v4 = +[CRLImageFill allocWithZone:](CRLImageFill, "allocWithZone:", a3);
  mImageData = self->super.mImageData;
  mTechnique = self->super.mTechnique;
  mTintColor = self->super.mTintColor;
  -[CRLImageFill fillSize](self, "fillSize");
  return -[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:](v4, "initWithImageData:technique:tintColor:size:referenceColor:", mImageData, mTechnique, mTintColor, self->super.mReferenceColor);
}

- (void)setTintColor:(id)a3
{
  unint64_t v4;
  CRLColor *mTintColor;
  unsigned __int8 v6;
  CRLColor *v7;
  CRLColor *v8;
  CRLColor *mReferenceColor;
  CRLColor *mCachedReferenceColor;
  void *v11;

  v4 = (unint64_t)a3;
  mTintColor = self->super.mTintColor;
  if (v4 | (unint64_t)mTintColor)
  {
    v11 = (void *)v4;
    v6 = -[CRLColor isEqual:](mTintColor, "isEqual:", v4);
    v4 = (unint64_t)v11;
    if ((v6 & 1) == 0)
    {
      -[CRLImageFill p_clearTintedImageCache](self, "p_clearTintedImageCache");
      v7 = (CRLColor *)objc_msgSend(v11, "copy");
      v8 = self->super.mTintColor;
      self->super.mTintColor = v7;

      mReferenceColor = self->super.mReferenceColor;
      self->super.mReferenceColor = 0;

      mCachedReferenceColor = self->super.mCachedReferenceColor;
      self->super.mCachedReferenceColor = 0;

      -[CRLImageFill i_updateStoredReferenceColorIfNeeded](self, "i_updateStoredReferenceColorIfNeeded");
      v4 = (unint64_t)v11;
    }
  }

}

- (void)setTechnique:(unint64_t)a3
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
      dispatch_once(&qword_10147E370, &stru_101233A58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3BCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233A78);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableImageFill setTechnique:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1128, 0, "Invalid image fill technique: %zu Defaulting to natural size.", v3);

    v3 = 0;
  }
  self->super.mTechnique = v3;
}

- (void)setImageData:(id)a3
{
  _TtC8Freeform8CRLAsset *v5;
  CGFloat v6;
  CGFloat v7;
  CRLColor *mReferenceColor;
  CRLColor *mCachedReferenceColor;
  _TtC8Freeform8CRLAsset *v10;

  v5 = (_TtC8Freeform8CRLAsset *)a3;
  if (self->super.mImageData != v5)
  {
    v10 = v5;
    -[CRLImageFill p_clearTintedImageCache](self, "p_clearTintedImageCache");
    objc_storeStrong((id *)&self->super.mImageData, a3);
    self->super.mFillSize = CGSizeZero;
    -[CRLImageFill fillSize](self, "fillSize");
    self->super.mFillSize.width = v6;
    self->super.mFillSize.height = v7;
    mReferenceColor = self->super.mReferenceColor;
    self->super.mReferenceColor = 0;

    mCachedReferenceColor = self->super.mCachedReferenceColor;
    self->super.mCachedReferenceColor = 0;

    self->super.mShouldSkipFurtherAttemptsToCalculateReferenceColor = 0;
    -[CRLImageFill i_updateStoredReferenceColorIfNeeded](self, "i_updateStoredReferenceColorIfNeeded");
    v5 = v10;
  }

}

- (void)setFillSize:(CGSize)a3
{
  self->super.mFillSize = a3;
}

- (void)setScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  -[CRLImageFill p_imageDataNaturalSize](self, "p_imageDataNaturalSize");
  -[CRLMutableImageFill setFillSize:](self, "setFillSize:", sub_1000603DC(v5, v6, a3));
  -[CRLImageFill scale](self, "scale");
  if (v7 != a3 && vabdd_f64(a3, v7) >= 0.00999999978)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233A98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3C58();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233AB8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableImageFill setScale:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1164, 0, "Scale math changed the scale");

  }
}

@end
