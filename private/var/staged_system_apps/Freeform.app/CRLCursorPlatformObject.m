@implementation CRLCursorPlatformObject

+ (id)cursorPlatformObjectWithPointerRegionRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPointerRegionRequest:", v4);

  return v5;
}

- (CRLCursorPlatformObject)initWithPointerRegionRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CRLCursorPlatformObject *v9;
  CRLCursorPlatformObject *v10;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D3C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A0A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D3E8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursorPlatformObject initWithPointerRegionRequest:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 662, 0, "Invalid parameter not satisfying: %{public}s", "pointerRequest != nil");

  }
  v12.receiver = self;
  v12.super_class = (Class)CRLCursorPlatformObject;
  v9 = -[CRLCursorPlatformObject init](&v12, "init");
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_pointerRequest, a3);

  return v10;
}

- (UIPointerRegionRequest)pointerRequest
{
  return self->_pointerRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRequest, 0);
}

@end
