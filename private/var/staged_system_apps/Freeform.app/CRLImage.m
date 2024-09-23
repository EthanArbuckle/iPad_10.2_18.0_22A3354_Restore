@implementation CRLImage

+ (CRLImage)allocWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v5 = objc_opt_class(CRLImage, a2).n128_u64[0];
  if (v6 == a1)
    return (CRLImage *)+[_CRLImageM allocWithZone:](_CRLImageM, "allocWithZone:", a3, v5);
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CRLImage;
  return (CRLImage *)objc_msgSendSuper2(&v8, "allocWithZone:", a3, v5);
}

+ (id)imageNamed:(id)a3
{
  return +[CRLUIImage imageNamed:](CRLUIImage, "imageNamed:", a3);
}

+ (CRLImage)imageWithContentsOfFile:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithContentsOfFile:", v4);

  return (CRLImage *)v5;
}

+ (CRLImage)imageWithData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  return (CRLImage *)v5;
}

+ (CRLImage)imageWithCGImage:(CGImage *)a3
{
  return (CRLImage *)objc_msgSend(objc_alloc((Class)a1), "initWithCGImage:", a3);
}

+ (CRLImage)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (CRLImage *)objc_msgSend(objc_alloc((Class)a1), "initWithCGImage:scale:orientation:", a3, a5, a4);
}

+ (CRLImage)imageWithSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5;
  CRLUIImage *v6;

  v5 = a3;
  v6 = -[CRLUIImage initWithSystemImageNamed:pointSize:]([CRLUIImage alloc], "initWithSystemImageNamed:pointSize:", v5, a4);

  return (CRLImage *)v6;
}

+ (CRLImage)imageWithSystemImageNamed:(id)a3
{
  id v3;
  CRLUIImage *v4;

  v3 = a3;
  v4 = -[CRLUIImage initWithSystemImageNamed:]([CRLUIImage alloc], "initWithSystemImageNamed:", v3);

  return (CRLImage *)v4;
}

+ (CRLImage)imageWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5;
  CRLUIImage *v6;

  v5 = a3;
  v6 = -[CRLUIImage initWithPrivateSystemImageNamed:pointSize:]([CRLUIImage alloc], "initWithPrivateSystemImageNamed:pointSize:", v5, a4);

  return (CRLImage *)v6;
}

+ (CRLImage)imageWithPrivateSystemImageNamed:(id)a3
{
  id v3;
  CRLUIImage *v4;

  v3 = a3;
  v4 = -[CRLUIImage initWithPrivateSystemImageNamed:]([CRLUIImage alloc], "initWithPrivateSystemImageNamed:", v3);

  return (CRLImage *)v4;
}

+ (id)crl_quickInspectorImageNamed:(id)a3
{
  return +[CRLImage crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:](CRLImage, "crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:", a3, 0, 0);
}

+ (id)crl_quickInspectorImageNamed:(id)a3 isPrivateImage:(BOOL)a4
{
  return +[CRLImage crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:](CRLImage, "crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:", a3, a4, 0);
}

+ (id)crl_quickInspectorBundledImageNamed:(id)a3
{
  return +[CRLImage crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:](CRLImage, "crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:", a3, 0, 1);
}

+ (id)crl_quickInspectorImageNamed:(id)a3 isPrivateImage:(BOOL)a4 isBundledImage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AC68);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F904(v9, v10);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AC88);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImage crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 710, 0, "This operation must only be performed on the main thread.");

  }
  if (qword_101415850 != -1)
    dispatch_once(&qword_101415850, &stru_10125ACA8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415848, "objectForKeyedSubscript:", v8));
  if (!v14)
  {
    if (v5)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageNamed:", v8));
    }
    else if (v6)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageWithPrivateSystemImageNamed:", v8));
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageWithSystemImageNamed:", v8));
    }
    v14 = (void *)v15;
    objc_msgSend((id)qword_101415848, "setObject:forKeyedSubscript:", v15, v8);
  }

  return v14;
}

- (CRLImage)init
{
  CRLImage *v2;
  CRLOnce *v3;
  CRLOnce *mImageSlicesOnce;
  CRLOnce *v5;
  CRLOnce *mCachedImageOnce;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLImage;
  v2 = -[CRLImage init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CRLOnce);
    mImageSlicesOnce = v2->mImageSlicesOnce;
    v2->mImageSlicesOnce = v3;

    v5 = objc_alloc_init(CRLOnce);
    mCachedImageOnce = v2->mCachedImageOnce;
    v2->mCachedImageOnce = v5;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125ACC8);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLImage copyWithZone:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v32 = 1024;
    v33 = 744;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125ACE8);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v27 = v4;
    v28 = 2114;
    v29 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage copyWithZone:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 744, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLImage copyWithZone:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (CRLImage)initWithContentsOfFile:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AD08);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLImage initWithContentsOfFile:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v33 = 1024;
    v34 = 749;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AD28);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithContentsOfFile:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 749, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLImage initWithContentsOfFile:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (CRLImage)initWithData:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AD48);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLImage initWithData:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v33 = 1024;
    v34 = 754;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AD68);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithData:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 754, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLImage initWithData:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (CRLImage)initWithCGImage:(CGImage *)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AD88);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLImage initWithCGImage:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v32 = 1024;
    v33 = 759;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125ADA8);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v27 = v4;
    v28 = 2114;
    v29 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithCGImage:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 759, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLImage initWithCGImage:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (CRLImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  unsigned int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  Class v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  Class v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;

  v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a5, a4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125ADC8);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    objc_opt_class(self, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 67110146;
    v29 = v6;
    v30 = 2082;
    v31 = "-[CRLImage initWithCGImage:scale:orientation:]";
    v32 = 2082;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v34 = 1024;
    v35 = 764;
    v36 = 2114;
    v37 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125ADE8);
  v13 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v29 = v6;
    v30 = 2114;
    v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithCGImage:scale:orientation:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 764, 0, "Abstract method not overridden by %{public}@", v21);

  objc_opt_class(self, v22);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v25, "-[CRLImage initWithCGImage:scale:orientation:]"));
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v26, 0));

  objc_exception_throw(v27);
}

- (CRLImage)initWithImageSourceRef:(CGImageSource *)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AE08);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLImage initWithImageSourceRef:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v32 = 1024;
    v33 = 769;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AE28);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v27 = v4;
    v28 = 2114;
    v29 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithImageSourceRef:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 769, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLImage initWithImageSourceRef:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (CRLImage)initWithSystemImageNamed:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AE48);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLImage initWithSystemImageNamed:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v33 = 1024;
    v34 = 774;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AE68);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithSystemImageNamed:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 774, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLImage initWithSystemImageNamed:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (CRLImage)initWithSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  Class v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  Class v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;

  v5 = a3;
  v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AE88);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    objc_opt_class(self, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 67110146;
    v29 = v6;
    v30 = 2082;
    v31 = "-[CRLImage initWithSystemImageNamed:pointSize:]";
    v32 = 2082;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v34 = 1024;
    v35 = 779;
    v36 = 2114;
    v37 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AEA8);
  v13 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v29 = v6;
    v30 = 2114;
    v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithSystemImageNamed:pointSize:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 779, 0, "Abstract method not overridden by %{public}@", v21);

  objc_opt_class(self, v22);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v25, "-[CRLImage initWithSystemImageNamed:pointSize:]"));
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v26, 0));

  objc_exception_throw(v27);
}

- (CRLImage)initWithPrivateSystemImageNamed:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AEC8);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLImage initWithPrivateSystemImageNamed:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v33 = 1024;
    v34 = 784;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AEE8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithPrivateSystemImageNamed:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 784, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLImage initWithPrivateSystemImageNamed:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (CRLImage)initWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  Class v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  Class v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;

  v5 = a3;
  v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AF08);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    objc_opt_class(self, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 67110146;
    v29 = v6;
    v30 = 2082;
    v31 = "-[CRLImage initWithPrivateSystemImageNamed:pointSize:]";
    v32 = 2082;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v34 = 1024;
    v35 = 789;
    v36 = 2114;
    v37 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AF28);
  v13 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v29 = v6;
    v30 = 2114;
    v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithPrivateSystemImageNamed:pointSize:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 789, 0, "Abstract method not overridden by %{public}@", v21);

  objc_opt_class(self, v22);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v25, "-[CRLImage initWithPrivateSystemImageNamed:pointSize:]"));
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v26, 0));

  objc_exception_throw(v27);
}

- (CGSize)size
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AF48);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLImage size]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v31 = 1024;
    v32 = 795;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AF68);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage size]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 795, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLImage size]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (double)scale
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AF88);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLImage scale]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v31 = 1024;
    v32 = 799;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AFA8);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage scale]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 799, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLImage scale]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)dealloc
{
  __CFDictionary *mImageSlices;
  id mCachedSystemImage;
  CRLOnce *mImageSlicesOnce;
  CRLOnce *mCachedImageOnce;
  objc_super v7;

  CGImageRelease(self->mCachedSliceableImage);
  mImageSlices = self->mImageSlices;
  if (mImageSlices)
    CFRelease(mImageSlices);
  mCachedSystemImage = self->mCachedSystemImage;
  self->mCachedSystemImage = 0;

  mImageSlicesOnce = self->mImageSlicesOnce;
  self->mImageSlicesOnce = 0;

  mCachedImageOnce = self->mCachedImageOnce;
  self->mCachedImageOnce = 0;

  v7.receiver = self;
  v7.super_class = (Class)CRLImage;
  -[CRLImage dealloc](&v7, "dealloc");
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3.width, a3.height);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AFC8);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLImage CGImageForSize:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v32 = 1024;
    v33 = 813;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125AFE8);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v27 = v4;
    v28 = 2114;
    v29 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage CGImageForSize:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 813, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLImage CGImageForSize:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (CGImage)CGImage
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B008);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLImage CGImage]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v31 = 1024;
    v32 = 817;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B028);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage CGImage]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 817, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLImage CGImage]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (int64_t)imageOrientation
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B048);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLImage imageOrientation]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v31 = 1024;
    v32 = 821;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B068);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage imageOrientation]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 821, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLImage imageOrientation]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)isEmpty
{
  return sub_1003FA184(-[CRLImage CGImage](self, "CGImage"));
}

- (id)TIFFRepresentation
{
  return sub_10043519C(-[CRLImage CGImage](self, "CGImage"));
}

- (id)JPEGRepresentationWithCompressionQuality:(double)a3
{
  return sub_100435138((uint64_t)-[CRLImage CGImage](self, "CGImage"), a3);
}

- (id)PNGRepresentation
{
  return sub_100435130(-[CRLImage CGImage](self, "CGImage"));
}

- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7
{
  double height;
  double width;
  _QWORD *v10;
  uint64_t v11;
  CGImage *v12;
  double v13;
  void *v14;
  _QWORD v16[5];
  CGSize v17;
  double v18;
  double v19;
  double v20;
  double v21;

  height = a3.height;
  width = a3.width;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003FA390;
  v16[3] = &unk_10125B090;
  v17 = a3;
  v16[4] = self;
  v18 = a6;
  v19 = a7;
  v20 = a4;
  v21 = a5;
  v10 = objc_retainBlock(v16);
  v11 = ((uint64_t (*)(_QWORD *, CGImage *, double))v10[2])(v10, -[CRLImage CGImageForSize:](self, "CGImageForSize:", width, height), 1.0);
  if (v11)
  {
    v12 = (CGImage *)v11;
    -[CRLImage scale](self, "scale");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", v12, -[CRLImage imageOrientation](self, "imageOrientation"), v13));
    CGImageRelease(v12);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)crlaxDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCrlaxDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxDescription, 0);
  objc_storeStrong((id *)&self->mCachedImageOnce, 0);
  objc_storeStrong(&self->mCachedSystemImage, 0);
  objc_storeStrong((id *)&self->mImageSlicesOnce, 0);
}

+ (CRLImage)imageWithUIImage:(id)a3
{
  id v3;
  CRLUIImage *v4;

  v3 = a3;
  v4 = -[CRLUIImage initWithUIImage:]([CRLUIImage alloc], "initWithUIImage:", v3);

  return (CRLImage *)v4;
}

- (CRLImage)initWithUIImage:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B0B0);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLImage(UIKitAdditions) initWithUIImage:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    v33 = 1024;
    v34 = 967;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B0D0);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage(UIKitAdditions) initWithUIImage:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 967, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLImage(UIKitAdditions) initWithUIImage:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (UIImage)UIImage
{
  CRLOnce *mCachedImageOnce;
  _QWORD v5[5];

  mCachedImageOnce = self->mCachedImageOnce;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003FAC68;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](mCachedImageOnce, "performBlockOnce:", v5);
  return (UIImage *)self->mCachedSystemImage;
}

- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGImage *v27;
  CGAffineTransform v29;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = v9;
  if (!a4)
  {
    if (v9)
    {
      objc_msgSend(v9, "contentsScale");
      width = width * v23;
      objc_msgSend(v10, "contentsScale");
      height = height * v24;
    }
    goto LABEL_17;
  }
  if (v9)
  {
    v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B0F0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F9AC(v11, v12);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B110);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage(RenderingAdditions) CGImageForSize:inContext:orContentsScaleProvider:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImage_RenderingAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 21, 0, "using context to determine requested image size. contents scale provider should be nil");

  }
  v16 = 2.0;
  if ((sub_100411DA0((uint64_t)a4) & 1) == 0 && (sub_100411FB8((uint64_t)a4) & 1) == 0)
  {
    v17 = sub_1004121D0((uint64_t)a4);
    v18 = sub_1000603DC(width, height, v17);
    v20 = v19;
    CGContextGetCTM(&v29, a4);
    v21 = sub_10007922C(&v29.a);
    width = sub_1000603DC(v18, v20, v21);
    height = v22;
LABEL_17:
    -[CRLImage size](self, "size");
    v16 = 2.0;
    if (width <= v25)
    {
      -[CRLImage size](self, "size");
      if (height <= v26)
        v16 = 1.0;
      else
        v16 = 2.0;
    }
  }
  v27 = -[CRLImage CGImageForContentsScale:](self, "CGImageForContentsScale:", v16);

  return v27;
}

- (id)compositedImageWithColor:(id)a3 alpha:(double)a4 blendMode:(int)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGContext *v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGImage *v23;
  CGColor *v24;
  CGImage *Image;
  void *v26;
  CGRect v28;
  CGRect v29;

  v8 = a3;
  -[CRLImage scale](self, "scale");
  v10 = v9;
  -[CRLImage size](self, "size");
  v13 = sub_1000603DC(v11, v12, v10);
  v15 = sub_10040FA64(3, v13, v14);
  v16 = sub_10005FDDC();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = -[CRLImage CGImageForContentsScale:](self, "CGImageForContentsScale:", v10);
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  CGContextDrawImage(v15, v28, v23);
  v24 = (CGColor *)objc_msgSend(v8, "CGColor");

  CGContextSetFillColorWithColor(v15, v24);
  CGContextSetAlpha(v15, a4);
  CGContextSetBlendMode(v15, (CGBlendMode)a5);
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  CGContextFillRect(v15, v29);
  Image = CGBitmapContextCreateImage(v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", Image, 0, v10));
  CGImageRelease(Image);
  CGContextRelease(v15);
  return v26;
}

- (id)compositeImageWithOverlayImage:(id)a3 overlayTintColor:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGContext *v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGImage *v22;
  void *v23;
  CGImage *v24;
  CGImage *Image;
  void *v26;
  CGRect v28;
  CGRect v29;

  v6 = a4;
  v7 = a3;
  -[CRLImage scale](self, "scale");
  v9 = v8;
  -[CRLImage size](self, "size");
  v12 = sub_1000603DC(v10, v11, v9);
  v14 = sub_10040FA64(3, v12, v13);
  v15 = sub_10005FDDC();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[CRLImage CGImageForContentsScale:](self, "CGImageForContentsScale:", v9);
  v28.origin.x = v15;
  v28.origin.y = v17;
  v28.size.width = v19;
  v28.size.height = v21;
  CGContextDrawImage(v14, v28, v22);
  objc_msgSend(v6, "alphaComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "compositedImageWithColor:alpha:blendMode:", v6, 20));

  v24 = (CGImage *)objc_msgSend(v23, "CGImageForContentsScale:", v9);
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  CGContextDrawImage(v14, v29, v24);
  Image = CGBitmapContextCreateImage(v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", Image, 0, v9));
  CGImageRelease(Image);
  CGContextRelease(v14);

  return v26;
}

@end
