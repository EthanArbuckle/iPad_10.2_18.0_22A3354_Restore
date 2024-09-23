@implementation CRLBitmapImageProvider

+ (CGImage)CGImageForImageData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  CGImage *v10;

  v3 = a3;
  v5 = objc_opt_class(CRLBitmapImageProvider, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryProviderForAsset:shouldValidate:", v3, 1));

  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (CGImage *)objc_msgSend(v9, "CGImageForNaturalSize");
  return v10;
}

+ (id)CRLImageForImageData:(id)a3
{
  id v3;

  v3 = objc_msgSend(a1, "CGImageForImageData:", a3);
  if (v3)
    v3 = (id)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", v3));
  return v3;
}

+ (CGSize)naturalSizeForImageData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  CGSize result;

  v3 = a3;
  v5 = objc_opt_class(CRLBitmapImageProvider, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryProviderForAsset:shouldValidate:", v3, 1));

  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    objc_msgSend(v9, "naturalSize");
    width = v10;
    height = v12;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v14 = width;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)i_commonInit
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *mImageQueue;
  OS_dispatch_semaphore *v9;
  OS_dispatch_semaphore *mFlushableContentLock;
  CRLOnce *v11;
  CRLOnce *mCheckIfValidOnce;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLBitmapImageProvider;
  -[CRLImageProvider i_commonInit](&v13, "i_commonInit");
  if (self->mImageQueue)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E8F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA9BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E918);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA91C(v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider i_commonInit]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 100, 0, "called i_common init twice on same object!");

  }
  v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.CRLBitmapImageProvider", 0);
  mImageQueue = self->mImageQueue;
  self->mImageQueue = v7;

  v9 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  mFlushableContentLock = self->mFlushableContentLock;
  self->mFlushableContentLock = v9;

  v11 = objc_alloc_init(CRLOnce);
  mCheckIfValidOnce = self->mCheckIfValidOnce;
  self->mCheckIfValidOnce = v11;

}

- (void)dealloc
{
  CGImageSource *mImageSource;
  objc_super v4;

  CGImageRelease(self->mImage);
  CGImageRelease(self->mLargestSafeImage);
  mImageSource = self->mImageSource;
  if (mImageSource)
    CFRelease(mImageSource);
  v4.receiver = self;
  v4.super_class = (Class)CRLBitmapImageProvider;
  -[CRLImageProvider dealloc](&v4, "dealloc");
}

- (CGSize)naturalSize
{
  NSObject *mImageQueue;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  -[CRLBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1010E66AB;
  mImageQueue = self->mImageQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003ECFC;
  v8[3] = &unk_10122C5F0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(mImageQueue, v8);
  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)isValid
{
  CRLOnce *mCheckIfValidOnce;
  _QWORD v5[5];

  -[CRLBitmapImageProvider p_loadSourceRefIfNecessary](self, "p_loadSourceRefIfNecessary");
  mCheckIfValidOnce = self->mCheckIfValidOnce;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003ED90;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](mCheckIfValidOnce, "performBlockOnce:", v5);
  return self->mIsValid;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  CGImage *v14;
  uint64_t v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!-[CRLBitmapImageProvider isValid](self, "isValid"))
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E998);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEAAF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E9B8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA91C(v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider drawImageInContext:rect:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 185, 0, "shouldn't be drawing an invalid image provider");

  }
  if (-[CRLBitmapImageProvider isValid](self, "isValid"))
  {
    v14 = -[CRLBitmapImageProvider CGImageForSize:inContext:orContentsScaleProvider:](self, "CGImageForSize:inContext:orContentsScaleProvider:", a3, 0, width, height);
    objc_msgSend((id)objc_opt_class(self, v15), "drawImage:inContext:rect:orientation:", v14, a3, -[CRLBitmapImageProvider orientation](self, "orientation"), x, y, width, height);
  }
}

+ (void)drawImage:(CGImage *)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 orientation:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinY;
  CGFloat MaxY;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (a3)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    CGContextSaveGState(a4);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    MinY = CGRectGetMinY(v16);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MaxY = CGRectGetMaxY(v17);
    CGContextTranslateCTM(a4, 0.0, MinY + MaxY);
    CGContextScaleCTM(a4, 1.0, -1.0);
    sub_1003F6270((CGAffineTransform *)a6, 1, (uint64_t)&v15, x, y, width, height);
    CGContextConcatCTM(a4, &v15);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGContextDrawImage(a4, v18, a3);
    CGContextRestoreGState(a4);
  }
}

- (CGImage)cachedCGImageOfNearestSizeOrNULLPreferringSize:(CGSize)a3 withContentsScaleProvider:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  CGImage *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  NSObject *mImageQueue;
  const void *v24;
  _QWORD block[7];
  _BYTE buf[24];
  uint64_t v28;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[CRLBitmapImageProvider isValid](self, "isValid"))
  {
    if (v7)
    {
      objc_msgSend(v7, "contentsScale");
      width = sub_1000603DC(width, height, v8);
      height = v9;
      if (qword_10147E348 != -1)
        dispatch_once(&qword_10147E348, &stru_10122EA58);
      v10 = off_1013D7D88;
      if (os_log_type_enabled((os_log_t)off_1013D7D88, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        objc_msgSend(v7, "contentsScale");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p scaling image for contentsScaleProvider by %f", buf, 0x16u);

      }
    }
    else
    {
      v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122EA18);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEAC1C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122EA38);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEAB74(v19, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 230, 0, "invalid nil value for '%{public}s'", "contentsScaleProvider");

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v28 = 0;
    if (width == 0.0)
      v22 = 0;
    else
      v22 = -[CRLBitmapImageProvider p_reciprocalScaleForImageSize:](self, "p_reciprocalScaleForImageSize:", width, height);
    mImageQueue = self->mImageQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FB30;
    block[3] = &unk_10122DC18;
    block[5] = buf;
    block[6] = v22;
    block[4] = self;
    dispatch_sync(mImageQueue, block);
    v24 = *(const void **)(*(_QWORD *)&buf[8] + 24);
    if (v24)
    {
      CFAutorelease(v24);
      v17 = *(CGImage **)(*(_QWORD *)&buf[8] + 24);
    }
    else
    {
      v17 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E9D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEAD5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E9F8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEACB4(v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 226, 0, "Invalid image provider trying to render an image at natural size");

    v17 = 0;
  }

  return v17;
}

- (CGImage)CGImageOfAnySize
{
  void *v3;
  CGImage *v4;
  double v5;
  double v6;
  NSObject *mImageQueue;
  const void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  CGImage *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v3, "setContentsScale:", 1.0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v14 = -[CRLBitmapImageProvider cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:](self, "cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:", v3, CGSizeZero.width, CGSizeZero.height);
  v4 = (CGImage *)v12[3];
  if (!v4)
  {
    -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
    if (v6 > 100.0 || v5 > 100.0)
    {
      v4 = -[CRLBitmapImageProvider p_resampledImageOfReciprocalScale:](self, "p_resampledImageOfReciprocalScale:", (unint64_t)(double)-[CRLBitmapImageProvider p_reciprocalScaleForImageSize:](self, "p_reciprocalScaleForImageSize:", 100.0, 100.0));
      v12[3] = (uint64_t)v4;
    }
    else
    {
      -[CRLBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
      mImageQueue = self->mImageQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10003FF1C;
      v10[3] = &unk_10122C5F0;
      v10[4] = self;
      v10[5] = &v11;
      dispatch_sync(mImageQueue, v10);
      v8 = (const void *)v12[3];
      if (v8)
        CFAutorelease(v8);
      v4 = (CGImage *)v12[3];
    }
  }
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (CGImage)CGImageOfLargestSafeSize
{
  int v3;
  double v4;
  double v5;
  NSObject *mImageQueue;
  const void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  CGImage *v12;
  NSObject *v13;
  const void *v14;
  _QWORD v16[6];
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (-[CRLBitmapImageProvider isValid](self, "isValid"))
  {
    v3 = CRLWPShapeLayout.columnsAreLeftToRight.getter();
    -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
    if (v3 && v4 * v5 > (double)sub_10040EA9C())
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      -[CRLBitmapImageProvider p_loadLargestSafeImageIfNecessary](self, "p_loadLargestSafeImageIfNecessary");
      mImageQueue = self->mImageQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10004026C;
      v16[3] = &unk_10122C5F0;
      v16[4] = self;
      v16[5] = &v18;
      dispatch_sync(mImageQueue, v16);
      v7 = (const void *)v19[3];
      if (v7)
        CFAutorelease(v7);
    }
    else
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      -[CRLBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
      v13 = self->mImageQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100040244;
      block[3] = &unk_10122C5F0;
      block[4] = self;
      block[5] = &v18;
      dispatch_sync(v13, block);
      v14 = (const void *)v19[3];
      if (v14)
        CFAutorelease(v14);
    }
    v12 = (CGImage *)v19[3];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EA78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEAE84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EA98);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEADDC(v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageOfLargestSafeSize]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 320, 0, "Trying to get an image out of an invalid image provider.");

    return 0;
  }
  return v12;
}

- (CGImage)CGImageForNaturalSize
{
  NSObject *mImageQueue;
  const void *v4;
  CGImage *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (-[CRLBitmapImageProvider isValid](self, "isValid"))
  {
    -[CRLBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    mImageQueue = self->mImageQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000404F0;
    v11[3] = &unk_10122C5F0;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(mImageQueue, v11);
    v4 = (const void *)v13[3];
    if (v4)
    {
      CFAutorelease(v4);
      v5 = (CGImage *)v13[3];
    }
    else
    {
      v5 = 0;
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EAB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEAFAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EAD8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEAF04(v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageForNaturalSize]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 360, 0, "Invalid image provider trying to render an image at natural size");

    return 0;
  }
  return v5;
}

- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5
{
  double height;
  double width;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  CGImage *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  NSObject *v38;
  NSString *v39;
  double v40;
  NSString *v41;
  void *v42;
  CGImage *v43;
  NSObject *mImageQueue;
  const void *v45;
  void *v46;
  NSString *v47;
  id v48;
  NSString *v49;
  double v50;
  __CFString *v51;
  __CFString *v52;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  uint8_t buf[4];
  CRLBitmapImageProvider *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  __CFString *v71;
  CGSize v72;
  CGSize v73;
  CGSize v74;
  CGSize v75;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  if (-[CRLBitmapImageProvider isValid](self, "isValid"))
  {
    -[CRLBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
    if (a4)
    {
      if (v9)
      {
        v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122EB38);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEB0D4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122EB58);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEB02C(v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageForSize:inContext:orContentsScaleProvider:]"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 390, 0, "using context to determine requested image size. contents scale provider should be nil");

      }
      if ((sub_100411DA0((uint64_t)a4) & 1) != 0 || sub_100411FB8((uint64_t)a4))
      {
        v14 = -[CRLBitmapImageProvider CGImageOfLargestSafeSize](self, "CGImageOfLargestSafeSize");
        goto LABEL_50;
      }
      v24 = sub_1004121D0((uint64_t)a4);
      v25 = sub_1000603DC(width, height, v24);
      v27 = v26;
      CGContextGetCTM(&v61, a4);
      v28 = sub_10007922C(&v61.a);
      width = sub_1000603DC(v25, v27, v28);
      height = v29;
      if (qword_10147E348 != -1)
        dispatch_once(&qword_10147E348, &stru_10122EB78);
      v30 = off_1013D7D88;
      if (os_log_type_enabled((os_log_t)off_1013D7D88, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = sub_1004121D0((uint64_t)a4);
        CGContextGetCTM(&v60, a4);
        v33 = sub_10007922C(&v60.a);
        v34 = sub_1004121D0((uint64_t)a4);
        CGContextGetCTM(&v59, a4);
        v35 = sub_10007922C(&v59.a);
        *(_DWORD *)buf = 134218752;
        v63 = self;
        v64 = 2048;
        v65 = v32 * v33;
        v66 = 2048;
        v67 = v34;
        v68 = 2048;
        v69 = v35;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%p scaling image for context by %f = %f * %f", buf, 0x2Au);

      }
    }
    else if (v9)
    {
      objc_msgSend(v9, "contentsScale");
      width = sub_1000603DC(width, height, v19);
      height = v20;
      if (qword_10147E348 != -1)
        dispatch_once(&qword_10147E348, &stru_10122EB98);
      v21 = off_1013D7D88;
      if (os_log_type_enabled((os_log_t)off_1013D7D88, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        objc_msgSend(v9, "contentsScale");
        *(_DWORD *)buf = 134218240;
        v63 = self;
        v64 = 2048;
        v65 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%p scaling image for contentsScaleProvider by %f", buf, 0x16u);

      }
    }
    v36 = COERCE_DOUBLE((id)-[CRLBitmapImageProvider p_reciprocalScaleForImageSize:](self, "p_reciprocalScaleForImageSize:", width, height));
    if (qword_10147E348 != -1)
      dispatch_once(&qword_10147E348, &stru_10122EBB8);
    v37 = off_1013D7D88;
    if (os_log_type_enabled((os_log_t)off_1013D7D88, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      v72.width = width;
      v72.height = height;
      v39 = NSStringFromCGSize(v72);
      v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v39));
      -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
      v41 = NSStringFromCGSize(v73);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 134218754;
      v63 = self;
      v64 = 2112;
      v65 = v40;
      v66 = 2112;
      v67 = *(double *)&v42;
      v68 = 2048;
      v69 = v36;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%p requesting image of size: %@. Full: %@ scale %zi", buf, 0x2Au);

    }
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    if (*(_QWORD *)&v36 < 2uLL)
    {
      -[CRLBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
      mImageQueue = self->mImageQueue;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100040E0C;
      v54[3] = &unk_10122C5F0;
      v54[4] = self;
      v54[5] = &v55;
      dispatch_sync(mImageQueue, v54);
      v45 = (const void *)v56[3];
      if (v45)
        CFAutorelease(v45);
    }
    else
    {
      v43 = -[CRLBitmapImageProvider p_resampledImageOfReciprocalScale:](self, "p_resampledImageOfReciprocalScale:", *(_QWORD *)&v36);
      v56[3] = (uint64_t)v43;
    }
    if (qword_10147E350 != -1)
      dispatch_once(&qword_10147E350, &stru_10122EBD8);
    v46 = off_1013D7D90;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_INFO))
    {
      v74.width = width;
      v74.height = height;
      v47 = NSStringFromCGSize(v74);
      v48 = (id)objc_claimAutoreleasedReturnValue(v47);
      -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
      v49 = NSStringFromCGSize(v75);
      v50 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v49));
      if (self->mImage)
        v51 = CFSTR("YES");
      else
        v51 = CFSTR("NO");
      v52 = v51;
      *(_DWORD *)buf = 134219010;
      v63 = self;
      v64 = 2048;
      v65 = v36;
      v66 = 2112;
      v67 = *(double *)&v48;
      v68 = 2112;
      v69 = v50;
      v70 = 2112;
      v71 = v52;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v46, OS_LOG_TYPE_INFO, "provider:%p renderScale:%zu requestedSize:%@ naturalSize:%@ mImageExists:%@", buf, 0x34u);

    }
    v14 = (CGImage *)v56[3];
    _Block_object_dispose(&v55, 8);
  }
  else
  {
    v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EAF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB1FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EB18);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB154(v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider CGImageForSize:inContext:orContentsScaleProvider:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 381, 0, "Invalid image provider trying to render an image at natural size");

    v14 = 0;
  }
LABEL_50:

  return v14;
}

- (int64_t)p_reciprocalScaleForImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  double *v19;
  double *v20;
  uint64_t v21;
  _QWORD v23[7];
  _QWORD v24[5];
  _QWORD v25[7];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;

  height = a3.height;
  width = a3.width;
  -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x3010000000;
  v35 = &unk_1010E66AB;
  v36 = v5;
  v37 = v7;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x3010000000;
  v29 = &unk_1010E66AB;
  v30 = sub_1000603DC(v5, v7, 0.5);
  v31 = v9;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    v10 = sub_10040EA9C();
    v11 = sub_100062E58(v6, v8, (double)v10);
    v6 = sub_100061064(v11);
    v8 = v12;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100041088;
  v25[3] = &unk_10122EC00;
  *(CGFloat *)&v25[5] = width;
  *(CGFloat *)&v25[6] = height;
  v25[4] = &v26;
  v13 = objc_retainBlock(v25);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000410BC;
  v24[3] = &unk_10122EC28;
  v24[4] = &v26;
  v14 = objc_retainBlock(v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000410EC;
  v23[3] = &unk_10122EC00;
  v23[4] = &v32;
  *(double *)&v23[5] = v6;
  *(double *)&v23[6] = v8;
  v15 = objc_retainBlock(v23);
  v16 = 1;
  v17 = 2;
  while (1)
  {
    v18 = v17;
    if ((((uint64_t (*)(_QWORD *))v13[2])(v13) & 1) == 0
      && !((unsigned int (*)(_QWORD *))v15[2])(v15))
    {
      break;
    }
    if (!((unsigned int (*)(_QWORD *))v14[2])(v14))
      break;
    v19 = v33;
    v20 = v27;
    *((_OWORD *)v33 + 2) = *((_OWORD *)v27 + 2);
    v20[4] = sub_1000603DC(v19[4], v19[5], 0.5);
    *((_QWORD *)v20 + 5) = v21;
    v17 = 2 * v18;
    v16 = v18;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v16;
}

- (CGImage)CGImageResampledToSize:(CGSize)a3 lowQuality:(BOOL)a4 assetOwner:(id)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  CGImage *v25;

  v5 = a4;
  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
  v12 = v11;
  if (width >= v10)
  {
    if (height >= v11)
    {
      width = v10;
      if (!-[CRLBitmapImageProvider isOpaque](self, "isOpaque"))
      {
        v25 = -[CRLBitmapImageProvider CGImageForNaturalSize](self, "CGImageForNaturalSize");
        goto LABEL_11;
      }
    }
    else
    {
      width = v10;
    }
  }
  v13 = width;
  v14 = ceilf(v13);
  if (height >= v12)
    v15 = v12;
  else
    v15 = height;
  v16 = v15;
  v17 = ceilf(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageProvider imageData](self, "imageData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filename"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
  v21 = sub_10040EBA0(self, v20, v5 | 0x14, v9, v14, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = v18;
  v24 = v23;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "synchronouslyCreateReadonlyAsset"));

  }
  v25 = +[CRLBitmapImageProvider CGImageForImageData:](CRLBitmapImageProvider, "CGImageForImageData:", v24);

LABEL_11:
  return v25;
}

- (CGImage)p_createResampledImageWithReciprocalScale:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  CGImageSource *v14;
  CGImageSource *v15;
  CGImage *v16;
  int v18;
  CRLBitmapImageProvider *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  CGSize v24;

  -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
  v7 = sub_1000603DC(v5, v6, 1.0 / (double)a3);
  v9 = v8;
  if (qword_10147E348 != -1)
    dispatch_once(&qword_10147E348, &stru_10122EC48);
  v10 = off_1013D7D88;
  if (os_log_type_enabled((os_log_t)off_1013D7D88, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v24.width = v7;
    v24.height = v9;
    v12 = NSStringFromCGSize(v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v18 = 134218498;
    v19 = self;
    v20 = 2112;
    v21 = v13;
    v22 = 2048;
    v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p making image of size %@ for scale %zi", (uint8_t *)&v18, 0x20u);

  }
  v14 = -[CRLBitmapImageProvider p_newImageOfSize:](self, "p_newImageOfSize:", v7, v9);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = -[CRLBitmapImageProvider p_newImageFromSource:](self, "p_newImageFromSource:", v14);
  CFRelease(v15);
  if (v16)
    CFAutorelease(v16);
  return v16;
}

- (CGImage)p_resampledImageOfReciprocalScale:(unint64_t)a3
{
  void *v5;
  NSObject *mImageQueue;
  const void *v7;
  CGImage *v8;
  CGImage *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CRLBitmapImageProvider *v18;
  id v19;
  unint64_t v20;
  _QWORD block[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  objc_msgSend(v5, "flushProvidersToFreeMemoryIfNecessaryExcludingProvider:", self);

  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000415C4;
  block[3] = &unk_10122DCF0;
  block[4] = self;
  block[5] = &v22;
  block[6] = a3;
  dispatch_sync(mImageQueue, block);
  v7 = (const void *)v23[3];
  if (!v7 || (CFAutorelease(v7), (v8 = (CGImage *)v23[3]) == 0))
  {
    v9 = -[CRLBitmapImageProvider p_createResampledImageWithReciprocalScale:](self, "p_createResampledImageWithReciprocalScale:", a3);
    v23[3] = (uint64_t)v9;
    if (!v9)
      goto LABEL_5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", v9));
    v11 = self->mImageQueue;
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10004176C;
    v17 = &unk_10122EC90;
    v19 = v10;
    v20 = a3;
    v18 = self;
    v12 = v10;
    dispatch_async(v11, &v14);

    v8 = (CGImage *)v23[3];
    if (!v8)
    {
LABEL_5:
      v8 = -[CRLBitmapImageProvider CGImageOfLargestSafeSize](self, "CGImageOfLargestSafeSize", v9, v14, v15, v16, v17, v18);
      v23[3] = (uint64_t)v8;
    }
  }
  _Block_object_dispose(&v22, 8);
  return v8;
}

- (int64_t)orientation
{
  NSObject *mImageQueue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[CRLBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  mImageQueue = self->mImageQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041924;
  v6[3] = &unk_10122C5F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(mImageQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isOpaque
{
  CRLBitmapImageProvider *v2;
  NSObject *mImageQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  -[CRLBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mImageQueue = v2->mImageQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000419DC;
  v5[3] = &unk_10122C5F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(mImageQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unint64_t)imageGamut
{
  NSObject *mImageQueue;
  unint64_t v4;
  CGColorSpaceRef ColorSpace;
  NSObject *v6;
  _QWORD v8[7];
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  -[CRLBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041B10;
  block[3] = &unk_10122C5F0;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(mImageQueue, block);
  v4 = v11[3];
  if (!v4)
  {
    ColorSpace = CGImageGetColorSpace(-[CRLBitmapImageProvider CGImageOfAnySize](self, "CGImageOfAnySize"));
    v6 = self->mImageQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100041B2C;
    v8[3] = &unk_10122DCF0;
    v8[4] = self;
    v8[5] = &v10;
    v8[6] = ColorSpace;
    dispatch_sync(v6, v8);
    v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (unint64_t)imageDPI
{
  CGImageSource *v3;
  CGImageSource *v4;
  const __CFDictionary *v5;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  void *v14;

  if (self->mDPI)
    return self->mDPI;
  v3 = -[CRLBitmapImageProvider p_newCGImageSourceForTemporaryUse](self, "p_newCGImageSourceForTemporaryUse");
  if (!v3)
    return self->mDPI;
  v4 = v3;
  v13 = kCGImageSourceSkipMetadata;
  v14 = &__kCFBooleanTrue;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, v5);
  CFRelease(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v6, "objectForKey:", kCGImagePropertyDPIHeight));
  v8 = v7;
  if (!v7)
  {
    v10 = 0.0;
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v7, "doubleValue");
  v10 = v9;
  if (v6)
LABEL_5:
    CFRelease(v6);
LABEL_6:
  v11 = 72.0;
  if (v10 != 0.0)
    v11 = v10;
  self->mDPI = llround(v11);

  return self->mDPI;
}

- (CGSize)dpiAdjustedNaturalSize
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (-[CRLBitmapImageProvider p_shouldScaleRetinaImages](self, "p_shouldScaleRetinaImages"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageProvider imageData](self, "imageData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filename"));

    v5 = -[CRLBitmapImageProvider imageDPI](self, "imageDPI");
    v6 = 0.5;
    if ((double)v5 != 144.0
      && vabdd_f64((double)v5, 144.0) >= fabs(144.0 * 0.000000999999997)
      && (objc_msgSend(v4, "crl_containsSubstring:", CFSTR("@2x")) & 1) == 0)
    {
      v7 = -[CRLBitmapImageProvider imageDPI](self, "imageDPI");
      if ((double)v7 == 216.0
        || vabdd_f64((double)v7, 216.0) < fabs(216.0 * 0.000000999999997)
        || (v6 = 1.0, objc_msgSend(v4, "crl_containsSubstring:", CFSTR("@3x"))))
      {
        v6 = 0.333333333;
      }
    }

    -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
    if (v6 != 1.0 && fabs(v6 + -1.0) >= 0.000000999999997)
    {
      v10 = sub_1000603DC(v8, v9, v6);
      v8 = sub_100063090(v10);
    }
  }
  else
  {
    -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)p_shouldScaleRetinaImages
{
  return 1;
}

- (void)flush
{
  NSObject *mImageQueue;
  _QWORD block[5];

  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041E98;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(mImageQueue, block);
}

- (BOOL)i_hasFlushableContent
{
  BOOL mHasFlushableContent;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->mFlushableContentLock, 0xFFFFFFFFFFFFFFFFLL);
  mHasFlushableContent = self->mHasFlushableContent;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mFlushableContentLock);
  return mHasFlushableContent;
}

- (unint64_t)i_flushableMemoryEstimate
{
  return self->mEstimatedSize;
}

- (void)p_updateEstimatedSize
{
  CGImage *mImage;
  size_t BytesPerRow;
  unint64_t v5;
  CGImage *mLargestSafeImage;
  size_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  CGImage *v13;
  size_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  mImage = self->mImage;
  if (mImage)
  {
    BytesPerRow = CGImageGetBytesPerRow(mImage);
    v5 = CGImageGetHeight(self->mImage) * BytesPerRow;
  }
  else
  {
    v5 = 0;
  }
  mLargestSafeImage = self->mLargestSafeImage;
  if (mLargestSafeImage)
  {
    v7 = CGImageGetBytesPerRow(mLargestSafeImage);
    v5 += CGImageGetHeight(self->mLargestSafeImage) * v7;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->mResampledImages, "allValues", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (CGImage *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "CGImage");
        v14 = CGImageGetBytesPerRow(v13);
        v5 += CGImageGetHeight(v13) * v14;
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  self->mEstimatedSize = v5;
}

- (void)p_loadFullSizedImageIfNecessary
{
  void *v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSObject *mImageQueue;
  _QWORD block[5];
  uint8_t buf[4];
  CRLBitmapImageProvider *v11;
  __int16 v12;
  void *v13;
  CGSize v14;

  if (qword_10147E350 != -1)
    dispatch_once(&qword_10147E350, &stru_10122ECD0);
  v3 = off_1013D7D90;
  if (os_log_type_enabled((os_log_t)off_1013D7D90, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
    v5 = NSStringFromCGSize(v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "provider:%p loading full-sized image if necessary naturalSize:%@ ", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  objc_msgSend(v7, "flushProvidersToFreeMemoryIfNecessaryExcludingProvider:", self);

  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000423D8;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(mImageQueue, block);
}

- (void)p_loadLargestSafeImageIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  NSObject *mImageQueue;
  uint64_t v16;
  _QWORD block[7];
  uint8_t buf[4];
  CRLBitmapImageProvider *v19;
  __int16 v20;
  void *v21;
  CGSize v22;

  -[CRLBitmapImageProvider naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  if (qword_10147E350 != -1)
    dispatch_once(&qword_10147E350, &stru_10122ED30);
  v7 = off_1013D7D90;
  if (os_log_type_enabled((os_log_t)off_1013D7D90, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v22.width = v4;
    v22.height = v6;
    v9 = NSStringFromCGSize(v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 134218242;
    v19 = self;
    v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "provider:%p loading largest safe image if necessary naturalSize:%@ ", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  objc_msgSend(v11, "flushProvidersToFreeMemoryIfNecessaryExcludingProvider:", self);

  v12 = sub_10040EA9C();
  v13 = sub_100062E58(v4, v6, (double)v12);
  v14 = sub_100061064(v13);
  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042830;
  block[3] = &unk_10122EDB8;
  block[4] = self;
  *(double *)&block[5] = v14;
  block[6] = v16;
  dispatch_async(mImageQueue, block);
}

- (void)p_loadSourceRefIfNecessary
{
  NSObject *mImageQueue;
  _QWORD block[5];

  mImageQueue = self->mImageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042C30;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(mImageQueue, block);
}

- (CGImageSource)p_newCGImageSource
{
  void *v2;
  CGImageSource *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageProvider imageData](self, "imageData"));
  v3 = (CGImageSource *)objc_msgSend(v2, "newCGImageSource");

  return v3;
}

- (CGImage)p_newImageFromSource:(CGImageSource *)a3
{
  CGImageSource *ImageAtIndex;
  const __CFDictionary *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  ImageAtIndex = a3;
  if (a3)
  {
    v6[0] = kCGImageSourceSkipMetadata;
    v6[1] = kCGImageSourceShouldCache;
    v7[0] = &__kCFBooleanTrue;
    v7[1] = &__kCFBooleanFalse;
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
    ImageAtIndex = CGImageSourceCreateImageAtIndex(ImageAtIndex, 0, v4);

  }
  return ImageAtIndex;
}

- (void)p_configureOrientationAndSizeFromImageSource:(CGImageSource *)a3 andImage:(CGImage *)a4
{
  void *v7;
  int v8;
  const __CFDictionary *v9;
  CFDictionaryRef v10;
  const __CFDictionary *v11;
  void *v12;
  unsigned int v13;
  void *Value;
  double Height;
  double v16;
  double v17;
  void *v18;
  double v19;
  const void *v20;
  BOOL v21;
  size_t Width;
  unint64_t v23;
  NSObject *mImageQueue;
  unint64_t v25;
  int v26;
  double v27;
  double v28;
  _QWORD block[6];
  uint64_t v30;
  void *v31;

  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageProvider imageData](self, "imageData"));
    v8 = sub_100410614(v7, a3);

    if (!v8)
      return;
  }
  v30 = kCGImageSourceSkipMetadata;
  v31 = &__kCFBooleanTrue;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v10 = CGImageSourceCopyPropertiesAtIndex(a3, 0, v9);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v10, "objectForKey:", kCGImagePropertyOrientation));
    v13 = objc_msgSend(v12, "intValue");

    Value = (void *)CFDictionaryGetValue(v11, kCGImagePropertyPixelWidth);
    Height = 0.0;
    v16 = 0.0;
    if (Value)
    {
      objc_msgSend(Value, "crl_CGFloatValue");
      v16 = v17;
    }
    v18 = (void *)CFDictionaryGetValue(v11, kCGImagePropertyPixelHeight);
    if (v18)
    {
      objc_msgSend(v18, "crl_CGFloatValue");
      Height = v19;
    }
    v20 = CFDictionaryGetValue(v11, kCGImagePropertyHasAlpha);
    if (v20)
      v21 = CFEqual(v20, kCFBooleanFalse) != 0;
    else
      v21 = 1;
    self->mIsOpaque = v21;
    CFRelease(v11);
    if (v16 != 0.0 && Height != 0.0)
      goto LABEL_21;
  }
  else
  {
    v13 = 0;
  }
  if (!a4)
  {
    a4 = -[CRLBitmapImageProvider p_newImageFromSource:](self, "p_newImageFromSource:", a3);
    if (CRLWPShapeLayout.columnsAreLeftToRight.getter()
      && (Width = CGImageGetWidth(a4), v23 = CGImageGetHeight(a4) * Width, v23 > sub_10040EA9C()))
    {
      if (a4)
        CFAutorelease(a4);
    }
    else
    {
      mImageQueue = self->mImageQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004311C;
      block[3] = &unk_10122DCC8;
      block[4] = self;
      block[5] = a4;
      dispatch_async(mImageQueue, block);
    }
  }
  v16 = (double)CGImageGetWidth(a4);
  Height = (double)CGImageGetHeight(a4);
LABEL_21:
  if (v13 - 1 > 7)
    v25 = 0;
  else
    v25 = qword_100EEC2A0[v13 - 1];
  self->mOrientation = v25;
  v26 = sub_1003F6578(v25);
  if (v26)
    v27 = Height;
  else
    v27 = v16;
  if (v26)
    v28 = v16;
  else
    v28 = Height;
  self->mNaturalSize.width = v27;
  self->mNaturalSize.height = v28;

}

- (CGImageSource)p_newCGImageSourceForTemporaryUse
{
  NSObject *mImageQueue;
  CGImageSource *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  mImageQueue = self->mImageQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043264;
  v6[3] = &unk_10122C6A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(mImageQueue, v6);
  v4 = (CGImageSource *)v8[3];
  if (!v4)
  {
    v4 = -[CRLBitmapImageProvider p_newCGImageSource](self, "p_newCGImageSource");
    v8[3] = (uint64_t)v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CGImage)p_newImageOfSize:(CGSize)a3 fromSource:(CGImageSource *)a4
{
  void *v5;
  const __CFDictionary *v6;
  CGImage *ThumbnailAtIndex;
  int v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[4];

  if (a4)
  {
    v12[0] = kCGImageSourceCreateThumbnailFromImageAlways;
    v12[1] = kCGImageSourceCreateThumbnailWithTransform;
    v13[0] = &__kCFBooleanTrue;
    v13[1] = &__kCFBooleanFalse;
    v12[2] = kCGImageSourceThumbnailMaxPixelSize;
    if (a3.width < a3.height)
      a3.width = a3.height;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3.width));
    v12[3] = kCGImageSourceSkipMetadata;
    v13[2] = v5;
    v13[3] = &__kCFBooleanTrue;
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a4, 0, v6);
  }
  else
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3.width, a3.height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EDD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB37C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EDF8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA91C(v9, v8);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBitmapImageProvider p_newImageOfSize:fromSource:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBitmapImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v10, 1001, 0, "invalid nil value for '%{public}s'", "sourceRef");

    ThumbnailAtIndex = 0;
  }

  return ThumbnailAtIndex;
}

- (CGImageSource)p_newImageOfSize:(CGSize)a3
{
  double height;
  double width;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImage *v8;
  __CFData *v9;
  __CFString *v10;
  CGImageDestination *v11;
  CGImageDestination *v12;
  _BOOL4 v13;

  height = a3.height;
  width = a3.width;
  v6 = -[CRLBitmapImageProvider p_newCGImageSourceForTemporaryUse](self, "p_newCGImageSourceForTemporaryUse");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = -[CRLBitmapImageProvider p_newImageOfSize:fromSource:](self, "p_newImageOfSize:fromSource:", v6, width, height);
  CFRelease(v7);
  if (!v8)
    return 0;
  v9 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));

  v11 = CGImageDestinationCreateWithData(v9, v10, 1uLL, 0);
  v12 = v11;
  if (v11)
  {
    CGImageDestinationAddImage(v11, v8, 0);
    v13 = CGImageDestinationFinalize(v12);
    CFRelease(v12);
    v12 = 0;
    if (v13)
      v12 = CGImageSourceCreateWithData(v9, 0);
  }

  CGImageRelease(v8);
  return v12;
}

- (CGImageSource)CGImageSource
{
  NSObject *mImageQueue;
  const void *v4;
  CGImageSource *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[CRLBitmapImageProvider p_loadSourceRefIfNecessary](self, "p_loadSourceRefIfNecessary");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  mImageQueue = self->mImageQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000436FC;
  v7[3] = &unk_10122C5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(mImageQueue, v7);
  v4 = (const void *)v9[3];
  if (v4)
  {
    CFAutorelease(v4);
    v5 = (CGImageSource *)v9[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)validationStatus
{
  return self->mValidationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFlushableContentLock, 0);
  objc_storeStrong((id *)&self->mCheckIfValidOnce, 0);
  objc_storeStrong((id *)&self->mImageQueue, 0);
  objc_storeStrong((id *)&self->mResampledImages, 0);
}

@end
