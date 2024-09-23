@implementation CRLWPInteriorTextWrapController

+ (id)sharedInteriorTextWrapController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C5FB4;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415370 != -1)
    dispatch_once(&qword_101415370, block);
  return (id)qword_101415368;
}

- (id)beginWrappingToColumn:(id)a3 columnTransformFromWP:(CGAffineTransform *)a4 target:(id)a5 hasWrappables:(BOOL *)a6
{
  id v9;
  id v10;
  CRLWPInteriorCookie *v11;
  __int128 v12;
  void *v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(CRLWPInteriorCookie);
  -[CRLWPInteriorCookie setLayout:](v11, "setLayout:", v9);
  -[CRLWPInteriorCookie setColumn:](v11, "setColumn:", v10);

  v12 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v16.c = v12;
  *(_OWORD *)&v16.tx = *(_OWORD *)&a4->tx;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformInvert(&v17, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interiorWrapSegments"));

  v16 = v17;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wrapSegmentsByApplyingAffineTransform:", &v16));
  -[CRLWPInteriorCookie setInteriorWrapSegmentsInWrapSpace:](v11, "setInteriorWrapSegmentsInWrapSpace:", v14);

  *a6 = 1;
  return v11;
}

- (void)splitLine:(CGRect)a3 lineSegmentRects:(id)a4 wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 canvasCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = a4;
  *a8 = 1.0;
  v15 = a9;
  objc_opt_class(CRLWPInteriorCookie, v16);
  v18 = sub_100221D0C(v17, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "interiorWrapSegmentsInWrapSpace"));
    +[CRLWPTextWrapper splitLine:lineSegmentRects:wrapSegments:type:skipHint:](CRLWPTextWrapper, "splitLine:lineSegmentRects:wrapSegments:type:skipHint:", v21, v20, 0, 0, x, y, width, height);

  }
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  id v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  v6 = a4;
  v7 = a5;
  v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D408);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v18 = v8;
    v19 = 2082;
    v20 = "-[CRLWPInteriorTextWrapController nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]";
    v21 = 2082;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m";
    v23 = 1024;
    v24 = 76;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D428);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v18 = v8;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPInteriorTextWrapController nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 76, 0, "Do not call method");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLWPInteriorTextWrapController nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v15, 0));

  objc_exception_throw(v16);
}

- (BOOL)checkForUnobstructedSpan:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  id v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  v6 = a4;
  v7 = a5;
  v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D448);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v18 = v8;
    v19 = 2082;
    v20 = "-[CRLWPInteriorTextWrapController checkForUnobstructedSpan:wrappableAttachments:userInfo:]";
    v21 = 2082;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m";
    v23 = 1024;
    v24 = 82;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D468);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v18 = v8;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPInteriorTextWrapController checkForUnobstructedSpan:wrappableAttachments:userInfo:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 82, 0, "Do not call method");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLWPInteriorTextWrapController checkForUnobstructedSpan:wrappableAttachments:userInfo:]"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v15, 0));

  objc_exception_throw(v16);
}

@end
