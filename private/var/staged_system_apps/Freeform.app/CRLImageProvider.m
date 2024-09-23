@implementation CRLImageProvider

+ (CRLImageProvider)allocWithZone:(_NSZone *)a3
{
  CRLImageProvider *result;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CRLImageProvider;
  result = objc_msgSendSuper2(&v4, "allocWithZone:", a3);
  if (result)
    atomic_store(1u, (unsigned int *)&result->mRetainCount);
  return result;
}

- (CRLImageProvider)initWithImageData:(id)a3
{
  CRLImageProvider *v5;
  objc_super v7;

  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250E10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F574();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProvider initWithImageData:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProvider.m"), 35, 0, "invalid nil value for '%{public}s'", "imageData");
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLImageProvider;
  v5 = -[CRLImageProvider init](&v7, "init");
  if (v5)
  {
    v5->mImageData = (_TtC8Freeform8CRLAsset *)a3;
    -[CRLImageProvider i_commonInit](v5, "i_commonInit");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageProvider;
  -[CRLImageProvider dealloc](&v3, "dealloc");
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return self->mImageData;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101250E50);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E1F654();
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF735C();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProvider naturalSize]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProvider.m"), 60, 0, "subclasses of CRLImageProvider must implement -naturalSize");
  v2 = 100.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)imageGamut
{
  return 0;
}

- (BOOL)isValid
{
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101250E90);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E1F708();
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF735C();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProvider isValid]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProvider.m"), 74, 0, "subclasses of CRLImageProvider must implement -isValid");
  return 1;
}

- (BOOL)isError
{
  return 0;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101250ED0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E1F7BC();
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF735C();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProvider drawImageInContext:rect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProvider.m"), 84, 0, "subclasses of CRLImageProvider must implement -drawImageInContext:rect:");
}

- (BOOL)i_hasFlushableContent
{
  return 0;
}

- (unint64_t)i_flushableMemoryEstimate
{
  return 0;
}

- (int)interest
{
  return atomic_load((unsigned int *)&self->mInterest);
}

- (void)addInterest
{
  int *p_mInterest;
  unsigned int v3;

  p_mInterest = &self->mInterest;
  do
    v3 = __ldaxr((unsigned int *)p_mInterest);
  while (__stlxr(v3 + 1, (unsigned int *)p_mInterest));
}

- (void)removeInterest
{
  int *p_mInterest;
  unsigned int v3;

  p_mInterest = &self->mInterest;
  do
    v3 = __ldaxr((unsigned int *)p_mInterest);
  while (__stlxr(v3 - 1, (unsigned int *)p_mInterest));
}

- (CRLImageProvider)retain
{
  int *p_mRetainCount;
  unsigned int v3;
  objc_super v5;

  p_mRetainCount = &self->mRetainCount;
  do
    v3 = __ldaxr((unsigned int *)p_mRetainCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_mRetainCount));
  v5.receiver = self;
  v5.super_class = (Class)CRLImageProvider;
  return -[CRLImageProvider retain](&v5, "retain");
}

- (void)release
{
  int *p_mRetainCount;
  unsigned int v3;
  objc_super v4;

  p_mRetainCount = &self->mRetainCount;
  do
    v3 = __ldaxr((unsigned int *)p_mRetainCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_mRetainCount));
  v4.receiver = self;
  v4.super_class = (Class)CRLImageProvider;
  -[CRLImageProvider release](&v4, "release");
}

- (void)i_flushIfNoOneUsing
{
  unsigned int v2;

  v2 = atomic_load((unsigned int *)&self->mRetainCount);
  if (v2 == 1)
    -[CRLImageProvider flush](self, "flush");
}

- (int)i_loadState
{
  return self->mLoadState;
}

- (void)setI_loadState:(int)a3
{
  self->mLoadState = a3;
}

@end
