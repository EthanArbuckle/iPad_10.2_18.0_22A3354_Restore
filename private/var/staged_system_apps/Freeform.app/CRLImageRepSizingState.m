@implementation CRLImageRepSizingState

- (CRLImageRepSizingState)initWithDesiredSize:(CGSize)a3 provider:(id)a4 maskPath:(CGPath *)a5 wideGamutCanvas:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CRLImageRepSizingState *v16;
  CRLImageRepSizingState *v17;
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v12 = a4;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D3F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE943C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D418);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 32, 0, "invalid nil value for '%{public}s'", "provider");

  }
  v19.receiver = self;
  v19.super_class = (Class)CRLImageRepSizingState;
  v16 = -[CRLImageRepSizingState init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    v16->_desiredSize.width = width;
    v16->_desiredSize.height = height;
    objc_storeStrong((id *)&v16->_provider, a4);
    v17->_status = 0;
    v17->_wideGamutCanvas = a6;
    if (a5)
      v17->_maskPath = CGPathRetain(a5);
  }

  return v17;
}

- (void)dealloc
{
  CGPath *maskPath;
  objc_super v4;

  CGImageRelease(self->_sizedImage);
  maskPath = self->_maskPath;
  if (maskPath)
    CGPathRelease(maskPath);
  v4.receiver = self;
  v4.super_class = (Class)CRLImageRepSizingState;
  -[CRLImageRepSizingState dealloc](&v4, "dealloc");
}

- (BOOL)sizedImageHasMask
{
  return -[CRLImageRepSizingState maskPath](self, "maskPath") != 0;
}

- (void)generateSizedImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CGImage *sizedImage;
  double height;
  double width;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  BOOL v24;
  void *v25;
  unsigned __int8 v26;
  char v27;
  void *v28;
  id v29;
  CGContext *v30;
  CGContext *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  NSObject *v40;
  NSString *v41;
  void *v42;
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  CGSize v53;
  CGSize v54;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D438);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE94E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D458);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepSizingState generateSizedImage]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 59, 0, "wrong thread");

  }
  sizedImage = self->_sizedImage;
  if (sizedImage)
  {
    CFRelease(sizedImage);
    self->_sizedImage = 0;
  }
  if (!self->_status)
  {
    width = self->_desiredSize.width;
    height = self->_desiredSize.height;
    if (width < 1.0 || height < 1.0)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122D478);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v40 = v12;
        v54.width = width;
        v54.height = height;
        v41 = NSStringFromCGSize(v54);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        *(_DWORD *)buf = 67110146;
        v44 = v11;
        v45 = 2082;
        v46 = "-[CRLImageRepSizingState generateSizedImage]";
        v47 = 2082;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m";
        v49 = 1024;
        v50 = 67;
        v51 = 2112;
        v52 = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Asked to resample an image to be size %@, which is invalid", buf, 0x2Cu);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122D498);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepSizingState generateSizedImage]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m"));
      v53.width = width;
      v53.height = height;
      v16 = NSStringFromCGSize(v53);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 67, 0, "Asked to resample an image to be size %@, which is invalid", v17);

      height = 1.0;
      width = 1.0;
    }
    v18 = objc_opt_class(CRLBitmapImageProvider, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepSizingState provider](self, "provider"));
    v20 = sub_100221D0C(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (v21
      && ((objc_msgSend(v21, "naturalSize"), width == v23) ? (v24 = height == v22) : (v24 = 0),
          v24 && !-[CRLImageRepSizingState maskPath](self, "maskPath")))
    {
      self->_sizedImage = CGImageRetain((CGImageRef)objc_msgSend(v21, "CGImageOfLargestSafeSize"));
      self->_sizedImageOrientation = (int64_t)objc_msgSend(v21, "orientation");
    }
    else
    {
      if (-[CRLImageRepSizingState wideGamut](self, "wideGamut")
        && (v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepSizingState provider](self, "provider")),
            v26 = objc_msgSend(v25, "isError"),
            v25,
            (v26 & 1) == 0))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepSizingState provider](self, "provider"));
        v29 = objc_msgSend(v28, "imageGamut");

        if (v29 == (id)2)
          v27 = 11;
        else
          v27 = 43;
      }
      else
      {
        v27 = 11;
      }
      v30 = sub_10040FA64(v27, width, height);
      if (v30)
      {
        v31 = v30;
        CGContextSetInterpolationQuality(v30, kCGInterpolationHigh);
        v32 = sub_10005FDDC();
        v34 = v33;
        v36 = v35;
        v38 = v37;
        if (-[CRLImageRepSizingState maskPath](self, "maskPath"))
        {
          CGContextAddPath(v31, -[CRLImageRepSizingState maskPath](self, "maskPath"));
          CGContextClip(v31);
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepSizingState provider](self, "provider"));
        objc_msgSend(v39, "drawImageInContext:rect:", v31, v32, v34, v36, v38);

        self->_sizedImage = CGBitmapContextCreateImage(v31);
        self->_sizedImageOrientation = 0;
        CGContextRelease(v31);
      }
    }

  }
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CRLImageProvider)provider
{
  return self->_provider;
}

- (CGPath)maskPath
{
  return self->_maskPath;
}

- (BOOL)wideGamut
{
  return self->_wideGamutCanvas;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (CGImage)sizedImage
{
  return self->_sizedImage;
}

- (int64_t)sizedImageOrientation
{
  return self->_sizedImageOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
