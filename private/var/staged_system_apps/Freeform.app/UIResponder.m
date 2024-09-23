@implementation UIResponder

- (int64_t)crl_textInputSource
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_opt_respondsToSelector(self, "_textInputSource") & 1) != 0)
    return (int64_t)-[UIResponder _textInputSource](self, "_textInputSource");
  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233368);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF2E80(v3, v4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233388);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE81F0(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIResponder(CRLAdditions) crl_textInputSource]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UIResponder_CRLAdditions.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 19, 0, "Responder does not respond to _textInputSource.");

  return 0;
}

@end
