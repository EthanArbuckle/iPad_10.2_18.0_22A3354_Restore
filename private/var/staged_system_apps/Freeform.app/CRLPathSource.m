@implementation CRLPathSource

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  if (v7)
  {
    objc_msgSend(v7, "setHasHorizontalFlip:", -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
    objc_msgSend(v7, "setHasVerticalFlip:", -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource localizationKey](self, "localizationKey"));
    objc_msgSend(v7, "setLocalizationKey:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedIdentifier](self, "userDefinedIdentifier"));
    objc_msgSend(v7, "setUserDefinedIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
    objc_msgSend(v7, "setUserDefinedName:", v10);

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CRLPathSource *v4;
  uint64_t v5;
  CRLPathSource *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  CRLPathSource *v12;
  unsigned int v13;
  unsigned int v14;

  v4 = (CRLPathSource *)a3;
  v6 = v4;
  if (v4 == self)
  {
    v12 = 0;
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class(v4, v5);
    v8 = v7;
    objc_opt_class(self, v9);
    if (v8 == v10)
    {
      v12 = v6;
      v13 = -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
      if (v13 == -[CRLPathSource hasHorizontalFlip](v12, "hasHorizontalFlip"))
      {
        v14 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
        v11 = v14 ^ -[CRLPathSource hasVerticalFlip](v12, "hasVerticalFlip") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unsigned __int8 v5;
  unsigned __int8 v6;

  v6 = -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  v5 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v3 = sub_1000BBFE0((char *)&v6, 1);
  return sub_1000BC018((char *)&v5, 1, v3);
}

- (BOOL)isRectangular
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
    dispatch_once(&qword_10147E370, &stru_101260920);
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
    v28 = "-[CRLPathSource isRectangular]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    v31 = 1024;
    v32 = 108;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260940);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource isRectangular]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 108, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLPathSource isRectangular]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)isRectangularForever
{
  return 0;
}

- (BOOL)isCircular
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
    dispatch_once(&qword_10147E370, &stru_101260960);
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
    v28 = "-[CRLPathSource isCircular]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    v31 = 1024;
    v32 = 118;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260980);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource isCircular]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 118, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLPathSource isCircular]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)isClosed
{
  return 1;
}

- (CRLBezierPath)bezierPath
{
  void *v3;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips"));
  -[CRLPathSource pathFlipTransform](self, "pathFlipTransform");
  objc_msgSend(v3, "transformUsingAffineTransform:", &v5);
  return (CRLBezierPath *)v3;
}

- (CRLBezierPath)bezierPathWithoutFlips
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
    dispatch_once(&qword_10147E370, &stru_1012609A0);
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
    v28 = "-[CRLPathSource bezierPathWithoutFlips]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    v31 = 1024;
    v32 = 133;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012609C0);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource bezierPathWithoutFlips]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 133, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLPathSource bezierPathWithoutFlips]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (CRLBezierPath)interiorWrapPath
{
  void *v3;
  CRLBezierPath *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
  if ((uint64_t)objc_msgSend(v3, "elementCount") >= 5001)
  {
    -[CRLPathSource naturalSize](self, "naturalSize");
    v4 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
    v5 = objc_claimAutoreleasedReturnValue(v4);

    v3 = (void *)v5;
  }
  return (CRLBezierPath *)v3;
}

- (id)interiorWrapPathForInset:(double)a3 joinStyle:(unint64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource interiorWrapPath](self, "interiorWrapPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:", a3));

  objc_msgSend(v7, "bounds");
  v10 = a3 + a3;
  if (a3 > 0.0 && v8 > v10 && v9 > v10)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bezierPathByOffsettingPath:joinStyle:", a4, -a3));

    v7 = (void *)v13;
  }
  return v7;
}

- (Class)preferredControllerClass
{
  return 0;
}

- (CGSize)naturalSize
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
    dispatch_once(&qword_10147E370, &stru_1012609E0);
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
    v28 = "-[CRLPathSource naturalSize]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    v31 = 1024;
    v32 = 168;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260A00);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource naturalSize]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 168, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLPathSource naturalSize]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)setNaturalSize:(CGSize)a3
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
    dispatch_once(&qword_10147E370, &stru_101260A20);
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
    v29 = "-[CRLPathSource setNaturalSize:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    v32 = 1024;
    v33 = 172;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260A40);
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
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource setNaturalSize:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
  objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 172, 0, "Abstract method not overridden by %{public}@", v19);

  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLPathSource setNaturalSize:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (double)uniformScaleForScalingToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  BOOL v12;
  double v13;

  height = a3.height;
  width = a3.width;
  -[CRLPathSource naturalSize](self, "naturalSize");
  v7 = 1.0;
  if (v5 <= 1.0 || v6 <= 1.0)
    return v7;
  v9 = width / v5;
  v10 = height / v6;
  if (v9 >= 1.0 || v10 >= 1.0)
  {
    v12 = v10 <= 1.0 || v9 <= 1.0;
    v13 = fmin(v9, v10);
    if (!v12)
      return v13;
    return v7;
  }
  return fmax(v9, v10);
}

- (CGAffineTransform)pathFlipTransform
{
  unsigned int v5;
  CGAffineTransform *result;
  int v7;
  double v8;
  CGFloat y;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidX;
  double MidY;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;

  v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v23 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v22;
  v21 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v21;
  v5 = -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  result = (CGAffineTransform *)-[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v7 = (int)result;
  if ((v5 & 1) != 0 || (_DWORD)result)
  {
    if (v5)
      v8 = -1.0;
    else
      v8 = 1.0;
    y = CGPointZero.y;
    -[CRLPathSource naturalSize](self, "naturalSize");
    v11 = v10;
    v13 = v12;
    v26.origin.x = CGPointZero.x;
    v26.origin.y = y;
    v26.size.width = v11;
    v26.size.height = v13;
    MidX = CGRectGetMidX(v26);
    v27.origin.x = CGPointZero.x;
    v27.origin.y = y;
    v27.size.width = v11;
    v27.size.height = v13;
    MidY = CGRectGetMidY(v27);
    *(_OWORD *)&v25.a = v23;
    *(_OWORD *)&v25.c = v22;
    *(_OWORD *)&v25.tx = v21;
    CGAffineTransformTranslate(retstr, &v25, MidX, MidY);
    if (v7)
      v16 = -1.0;
    else
      v16 = 1.0;
    v17 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v24.c = v17;
    *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v25, &v24, v8, v16);
    v18 = *(_OWORD *)&v25.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
    v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v24.c = v19;
    *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v25, &v24, -MidX, -MidY);
    v20 = *(_OWORD *)&v25.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
    *(_OWORD *)&retstr->c = v20;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
  }
  return result;
}

+ (id)pathSourceForShapeType:(int64_t)a3 naturalSize:(CGSize)a4
{
  CRLEditableBezierPathSource *v4;
  double height;
  double width;
  double v8;
  void *v9;
  CRLEditableBezierPathSource *v10;
  CRLBezierPath *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CKRecordID v30;
  Swift::String v31;

  height = a4.height;
  width = a4.width;
  v8 = a4.height / 100.0;
  switch(a3)
  {
    case 0:
    case 3:
      v11 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
      v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v4 = (CRLEditableBezierPathSource *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v9));
      -[CRLEditableBezierPathSource setNaturalSize:](v4, "setNaturalSize:", width, height);
      goto LABEL_23;
    case 1:
    case 15:
    case 16:
    case 20:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", CGPointZero.x, CGPointZero.y, sqrt(width * width + a4.height * a4.height), 0.0));
      goto LABEL_22;
    case 2:
    case 18:
    case 19:
      v10 = (CRLEditableBezierPathSource *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLinePathSource pathSourceAtAngleOfSize:forType:](CRLConnectionLinePathSource, "pathSourceAtAngleOfSize:forType:", a3 == 18, width, a4.height));
      v4 = v10;
      if (a3 == 2)
        -[CRLEditableBezierPathSource bend](v10, "bend");
      return v4;
    case 4:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLScalarPathSource roundedRectangleWithScalar:naturalSize:continuousCurve:](CRLScalarPathSource, "roundedRectangleWithScalar:naturalSize:continuousCurve:", 1, 15.0, width, a4.height));
      goto LABEL_16;
    case 5:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, width, a4.height));
      v9 = v16;
      goto LABEL_21;
    case 6:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath", v8));
      objc_msgSend(v9, "moveToPoint:", width * 0.5, 0.0);
      objc_msgSend(v9, "lineToPoint:", width, height);
      v14 = 0.0;
      v13 = v9;
      goto LABEL_18;
    case 7:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath", v8));
      objc_msgSend(v9, "moveToPoint:", 0.0, 0.0);
      objc_msgSend(v9, "lineToPoint:", 0.0, width);
      v13 = v9;
      v14 = width;
LABEL_18:
      v12 = height;
      goto LABEL_19;
    case 8:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLPointPathSource rightSingleArrowWithPoint:naturalSize:](CRLPointPathSource, "rightSingleArrowWithPoint:naturalSize:", v8 * 64.0, 0.34, width, a4.height));
      goto LABEL_16;
    case 9:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLPointPathSource doubleArrowWithPoint:naturalSize:](CRLPointPathSource, "doubleArrowWithPoint:naturalSize:", v8 * 44.0, 0.34, width, a4.height));
      goto LABEL_16;
    case 10:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath", v8));
      objc_msgSend(v9, "moveToPoint:", 0.0, height * 0.5);
      objc_msgSend(v9, "lineToPoint:", width * 0.5, height);
      objc_msgSend(v9, "lineToPoint:", width, height * 0.5);
      v12 = 0.0;
      v13 = v9;
      v14 = width * 0.5;
LABEL_19:
      objc_msgSend(v13, "lineToPoint:", v14, v12);
      v16 = v9;
LABEL_21:
      objc_msgSend(v16, "closePath");
LABEL_22:
      v4 = (CRLEditableBezierPathSource *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v9));
      goto LABEL_23;
    case 11:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLCalloutPathSource quoteBubbleWithTailPosition:tailSize:naturalSize:](CRLCalloutPathSource, "quoteBubbleWithTailPosition:tailSize:naturalSize:", v8, v8 * 96.0, v8 * 10.0, width, a4.height * 0.8));
      goto LABEL_16;
    case 12:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLCalloutPathSource calloutWithCornerRadius:tailPosition:tailSize:naturalSize:](CRLCalloutPathSource, "calloutWithCornerRadius:tailPosition:tailSize:naturalSize:", 5.0, v8 * -20.0, v8 * 50.0, v8 * 10.0, width, a4.height));
      goto LABEL_16;
    case 13:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLScalarPathSource regularPolygonWithScalar:naturalSize:](CRLScalarPathSource, "regularPolygonWithScalar:naturalSize:", 5.0, width, a4.height));
      goto LABEL_16;
    case 14:
      v15 = objc_claimAutoreleasedReturnValue(+[CRLPointPathSource starWithPoint:naturalSize:](CRLPointPathSource, "starWithPoint:naturalSize:", 5.0, 0.382, width, a4.height));
LABEL_16:
      v4 = (CRLEditableBezierPathSource *)v15;
      break;
    case 17:
      v4 = objc_alloc_init(CRLEditableBezierPathSource);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", CGPointZero.x, CGPointZero.y));
      -[CRLEditableBezierPathSource addNode:](v4, "addNode:", v9);
LABEL_23:

      break;
    case 21:
      v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v8);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260A60);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3875C(v18, v19);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260A80);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v20, v18);
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should not be trying to get the path of a custom shape from here!", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"+[CRLPathSource pathSourceForShapeType:naturalSize:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPathSource pathSourceForShapeType:naturalSize:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 309, 1, "Should not be trying to get the path of a custom shape from here!");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v30, v31);
      abort();
    default:
      return v4;
  }
  return v4;
}

- (NSString)name
{
  return 0;
}

- (BOOL)canUseToChangeShape
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
  if ((objc_msgSend(v3, "isEmpty") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
    v4 = objc_msgSend(v5, "isLineSegment") ^ 1;

  }
  return v4;
}

- (NSString)inferredAccessibilityDescription
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
    dispatch_once(&qword_10147E370, &stru_101260AA0);
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
    v28 = "-[CRLPathSource inferredAccessibilityDescription]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    v31 = 1024;
    v32 = 325;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260AC0);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource inferredAccessibilityDescription]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 325, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLPathSource inferredAccessibilityDescription]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (NSString)localizationKey
{
  return self->_localizationKey;
}

- (void)setLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userDefinedName
{
  return self->_name;
}

- (void)setUserDefinedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userDefinedIdentifier
{
  return self->_identifier;
}

- (void)setUserDefinedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasHorizontalFlip
{
  return self->_horizontalFlip;
}

- (void)setHasHorizontalFlip:(BOOL)a3
{
  self->_horizontalFlip = a3;
}

- (BOOL)hasVerticalFlip
{
  return self->_verticalFlip;
}

- (void)setHasVerticalFlip:(BOOL)a3
{
  self->_verticalFlip = a3;
}

- (NSString)inferredAccessibilityDescriptionNoShapeNames
{
  return self->_inferredAccessibilityDescriptionNoShapeNames;
}

- (NSString)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  return self->_inferredLocalizedAccessibilityDescriptionPlaceholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredLocalizedAccessibilityDescriptionPlaceholder, 0);
  objc_storeStrong((id *)&self->_inferredAccessibilityDescriptionNoShapeNames, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizationKey, 0);
}

@end
