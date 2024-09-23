@implementation TSUNormalizedSandboxedURL

- (TSUNormalizedSandboxedURL)initWithURL:(id)a3 originalSandboxedURL:(id)a4
{
  id v7;
  TSUNormalizedSandboxedURL *v8;
  TSUNormalizedSandboxedURL *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TSUNormalizedSandboxedURL;
  v8 = -[CRLSandboxedURL initWithURL:](&v11, "initWithURL:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_originalSandboxedURL, a4);

  return v9;
}

- (BOOL)hasSandboxAccess
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUNormalizedSandboxedURL;
  if (-[CRLSandboxedURL hasSandboxAccess](&v4, "hasSandboxAccess"))
    return 1;
  else
    return -[CRLSandboxedURL hasSandboxAccess](self->_originalSandboxedURL, "hasSandboxAccess");
}

- (id)originalSandboxedURLForNormalizing
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUNormalizedSandboxedURL;
  if (-[CRLSandboxedURL hasSandboxAccess](&v4, "hasSandboxAccess"))
    return self;
  else
    return (id)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL originalSandboxedURLForNormalizing](self->_originalSandboxedURL, "originalSandboxedURLForNormalizing"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  TSUNormalizedSandboxedURL *v6;
  void *v7;
  TSUNormalizedSandboxedURL *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CKRecordID v24;
  Swift::String v25;

  v5 = -[CRLSandboxedURL copyWithZone:](self->_originalSandboxedURL, "copyWithZone:");
  v6 = +[TSUNormalizedSandboxedURL allocWithZone:](TSUNormalizedSandboxedURL, "allocWithZone:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL URL](self, "URL"));
  v8 = -[TSUNormalizedSandboxedURL initWithURL:originalSandboxedURL:](v6, "initWithURL:originalSandboxedURL:", v7, v5);

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012312B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF620();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012312D8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Copy should never be nil.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[TSUNormalizedSandboxedURL copyWithZone:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUNormalizedSandboxedURL copyWithZone:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 178, 1, "Copy should never be nil.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v24, v25);
    abort();
  }
  v9 = -[TSUNormalizedSandboxedURL hasSandboxAccess](v8, "hasSandboxAccess");
  if (v9 != -[TSUNormalizedSandboxedURL hasSandboxAccess](self, "hasSandboxAccess"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012312F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF6A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231318);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUNormalizedSandboxedURL copyWithZone:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 179, 0, "Sanboxing access didn't transfer as expected to sandboxed URL copy.");

  }
  return v8;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL URL](self, "URL"));
  v11.receiver = self;
  v11.super_class = (Class)TSUNormalizedSandboxedURL;
  v7 = -[CRLSandboxedURL hasSandboxAccess](&v11, "hasSandboxAccess");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p URL=%@, hasSandboxAccess=%@, originalSandboxedURL=%@>"), v5, self, v6, v8, self->_originalSandboxedURL));

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSandboxedURL, 0);
}

@end
