@implementation CRLMutableShadow

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
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
    dispatch_once(&qword_10147E370, &stru_10123AB08);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 67110146;
    v27 = v4;
    v28 = 2082;
    v29 = "-[CRLMutableShadow copyWithZone:]";
    v30 = 2082;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m";
    v32 = 1024;
    v33 = 452;
    v34 = 2114;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123AB28);
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
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableShadow copyWithZone:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m"));
  v17 = (objc_class *)objc_opt_class(self, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 452, 0, "Abstract method not overridden by %{public}@", v19);

  v21 = (objc_class *)objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v23, "-[CRLMutableShadow copyWithZone:]"));
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v24, 0));

  objc_exception_throw(v25);
}

- (void)setAngle:(double)a3
{
  sub_1000618C4(a3);
  -[CRLShadow i_setAngle:](self, "i_setAngle:");
}

- (void)setOffset:(double)a3
{
  -[CRLShadow clampOffset:](self, "clampOffset:", a3);
  -[CRLShadow i_setOffset:](self, "i_setOffset:");
}

- (void)setRadius:(double)a3
{
  -[CRLShadow clampRadius:](self, "clampRadius:", a3);
  -[CRLShadow i_setRadius:](self, "i_setRadius:");
}

- (void)setOpacity:(double)a3
{
  -[CRLShadow clampOpacity:](self, "clampOpacity:", a3);
  -[CRLShadow i_setOpacity:](self, "i_setOpacity:");
}

- (void)setEnabled:(BOOL)a3
{
  -[CRLShadow i_setEnabled:](self, "i_setEnabled:", a3);
}

- (void)setColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AB48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFDE98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AB68);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableShadow setColor:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadowMutableMethods.h"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 34, 0, "invalid nil value for '%{public}s'", "color");

  }
  -[CRLShadow i_setColor:](self, "i_setColor:", v4);

}

@end
