@implementation CRLAnimatedGIFFrame

- (CRLAnimatedGIFFrame)initWithImageSource:(CGImageSource *)a3 index:(unint64_t)a4 time:(double)a5 preloadImage:(BOOL)a6
{
  _BOOL4 v6;
  CRLAnimatedGIFFrame *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CRLAnimatedGIFFrame;
  v10 = -[CRLAnimatedGIFFrame init](&v15, "init");
  if (v10)
  {
    if (a3)
    {
      v10->_imageSource = (CGImageSource *)CFRetain(a3);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012625E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B208();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262608);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFFrame initWithImageSource:index:time:preloadImage:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 56, 0, "invalid nil value for '%{public}s'", "imageSource");

    }
    v10->_index = a4;
    v10->_time = a5;
    if (a4 != -1 && v6)
      v10->_preloadedImage = CGImageSourceCreateImageAtIndex(v10->_imageSource, a4, 0);
    v10->_imageLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v10;
}

- (void)dealloc
{
  CGImageSource *imageSource;
  CGImage *preloadedImage;
  objc_super v5;

  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  preloadedImage = self->_preloadedImage;
  if (preloadedImage)
  {
    CFRelease(preloadedImage);
    self->_preloadedImage = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLAnimatedGIFFrame;
  -[CRLAnimatedGIFFrame dealloc](&v5, "dealloc");
}

- (id)description
{
  uint64_t v3;

  objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: %tu %f %p %p>"), v3, self, self->_index, *(_QWORD *)&self->_time, self->_imageSource, self->_preloadedImage);
}

- (CGImage)image
{
  CGImage *preloadedImage;
  const void *ImageAtIndex;
  os_unfair_lock_s *p_imageLock;

  if (self->_index == -1)
    return 0;
  preloadedImage = self->_preloadedImage;
  if (preloadedImage)
  {
    ImageAtIndex = CFRetain(preloadedImage);
  }
  else
  {
    p_imageLock = &self->_imageLock;
    os_unfair_lock_lock(&self->_imageLock);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSource, self->_index, 0);
    os_unfair_lock_unlock(p_imageLock);
  }
  return (CGImage *)CFAutorelease(ImageAtIndex);
}

- (unint64_t)index
{
  return self->_index;
}

- (double)time
{
  return self->_time;
}

@end
