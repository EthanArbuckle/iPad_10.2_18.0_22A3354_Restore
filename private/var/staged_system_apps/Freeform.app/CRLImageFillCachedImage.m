@implementation CRLImageFillCachedImage

+ (id)cachedImageWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithHandler:", v4);

  return v5;
}

- (CRLImageFillCachedImage)initWithHandler:(id)a3
{
  id v4;
  CRLImageFillCachedImage *v5;
  id v6;
  id mHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLImageFillCachedImage;
  v5 = -[CRLImageFillCachedImage init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mHandler = v5->mHandler;
    v5->mHandler = v6;

    v5->mLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }

  return v5;
}

- (CRLImage)image
{
  os_unfair_lock_s *p_mLock;
  uint64_t v4;
  CRLImage *v5;
  CRLImage *mCachedImage;
  void *v7;
  void *v8;
  void *v9;

  p_mLock = &self->mLock;
  os_unfair_lock_lock(&self->mLock);
  if (!self->mCachedImage)
  {
    v4 = (*((uint64_t (**)(void))self->mHandler + 2))();
    v5 = (CRLImage *)objc_claimAutoreleasedReturnValue(v4);
    mCachedImage = self->mCachedImage;
    self->mCachedImage = v5;

    if (!self->mCachedImage)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233530);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF3158();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233550);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillCachedImage image]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 95, 0, "invalid nil value for '%{public}s'", "mCachedImage");

    }
  }
  os_unfair_lock_unlock(p_mLock);
  return self->mCachedImage;
}

- (void)flush
{
  os_unfair_lock_s *p_mLock;
  CRLImage *mCachedImage;

  p_mLock = &self->mLock;
  os_unfair_lock_lock(&self->mLock);
  mCachedImage = self->mCachedImage;
  self->mCachedImage = 0;

  os_unfair_lock_unlock(p_mLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCachedImage, 0);
  objc_storeStrong(&self->mHandler, 0);
}

@end
