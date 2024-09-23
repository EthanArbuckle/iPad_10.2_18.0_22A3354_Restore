@implementation CRLImageCompatibilityChecker

+ (void)initialize
{
  CRLWidthLimitedQueue *v2;
  void *v3;

  if ((id)objc_opt_class(CRLImageCompatibilityChecker, a2) == a1)
  {
    v2 = -[CRLWidthLimitedQueue initWithLimit:]([CRLWidthLimitedQueue alloc], "initWithLimit:", 10);
    v3 = (void *)qword_101414CB0;
    qword_101414CB0 = (uint64_t)v2;

  }
}

- (CRLImageCompatibilityChecker)initWithImageData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CRLImageCompatibilityChecker *v9;
  CRLImageCompatibilityChecker *v10;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231338);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF720();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231358);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityChecker initWithImageData:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 40, 0, "Invalid parameter not satisfying: %{public}s", "imageData != nil");

  }
  v12.receiver = self;
  v12.super_class = (Class)CRLImageCompatibilityChecker;
  v9 = -[CRLImageCompatibilityChecker init](&v12, "init");
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_imageData, a3);

  return v10;
}

- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;

  v6 = a4;
  if (a3 <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231378);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF7BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231398);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 49, 0, "Invalid parameter not satisfying: %{public}s", "maxDesiredCompatibilityLevel > CRLMediaCompatibilityLevelNone");

  }
  v10 = (void *)qword_101414CB0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100073048;
  v12[3] = &unk_1012313C0;
  v13 = v6;
  v14 = a3;
  v12[4] = self;
  v11 = v6;
  objc_msgSend(v10, "performAsync:", v12);

}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (int64_t)compatibilityLevel
{
  return self->_compatibilityLevel;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
