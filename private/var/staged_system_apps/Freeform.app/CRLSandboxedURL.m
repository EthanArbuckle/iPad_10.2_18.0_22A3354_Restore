@implementation CRLSandboxedURL

- (CRLSandboxedURL)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012311B8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLSandboxedURL init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m";
    v17 = 1024;
    v18 = 28;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012311D8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 28, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLSandboxedURL init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLSandboxedURL)initWithURL:(id)a3
{
  id v4;
  CRLSandboxedURL *v5;
  NSURL *v6;
  NSURL *URL;
  unsigned __int8 v8;
  CRLSandboxedURL *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSURL *v15;
  NSURL *v16;
  objc_super v18;

  v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)CRLSandboxedURL;
    v5 = -[CRLSandboxedURL init](&v18, "init");
    if (v5)
    {
      if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
      {
        v6 = (NSURL *)objc_msgSend(v4, "copy");
        URL = v5->_URL;
        v5->_URL = v6;

        v8 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
      }
      else
      {
        v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012311F8);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEF468((uint64_t)v4, v10, v11);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231218);
        v12 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL initWithURL:]"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 39, 0, "Sandboxed URL should not be initialized with a non-file URL. URL=%@", v4);

        v15 = (NSURL *)objc_msgSend(v4, "copy");
        v16 = v5->_URL;
        v5->_URL = v15;

        v8 = 0;
      }
      v5->_URLStartedAccessingSecurityScopedResource = v8;
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)initByResolvingBookmarkData:(id)a3 relativeToURL:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  return -[CRLSandboxedURL initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:](self, "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", a3, 768, a4, a5, a6);
}

- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToURL:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  CRLSandboxedURL *v15;

  v11 = a4 | 0x8000;
  v12 = a5;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)NSURL), "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v13, v11, v12, a6, a7);

  if (v14)
  {
    v15 = -[CRLSandboxedURL initWithURL:](self, "initWithURL:", v14);
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

+ (id)sandboxedURLByResolvingBookmarkData:(id)a3 relativeToURL:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initByResolvingBookmarkData:relativeToURL:bookmarkDataIsStale:error:", v11, v10, a5, a6);

  return v12;
}

+ (id)sandboxedURLByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToURL:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a5;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v13, a4, v12, a6, a7);

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_URLStartedAccessingSecurityScopedResource)
    -[NSURL stopAccessingSecurityScopedResource](self->_URL, "stopAccessingSecurityScopedResource");
  v3.receiver = self;
  v3.super_class = (Class)CRLSandboxedURL;
  -[CRLSandboxedURL dealloc](&v3, "dealloc");
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)hasSandboxAccess
{
  return self->_URLStartedAccessingSecurityScopedResource;
}

- (id)normalize
{
  void *v3;
  void *v4;
  id v5;
  CRLSandboxedURL *v6;
  CRLSandboxedURL *v7;
  void *v8;
  unsigned __int8 v9;
  TSUNormalizedSandboxedURL *v10;
  CRLSandboxedURL *p_super;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL URL](self, "URL"));
  if ((objc_msgSend(v3, "isFileURL") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", v4);
      if (v5 && (objc_msgSend(v3, "isEqual:", v5) & 1) == 0)
      {
        v6 = (CRLSandboxedURL *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL originalSandboxedURLForNormalizing](self, "originalSandboxedURLForNormalizing"));
        v7 = v6;
        if (v6 == self
          || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL URL](v6, "URL")),
              v9 = objc_msgSend(v8, "isEqual:", v5),
              v8,
              (v9 & 1) == 0))
        {
          v10 = -[TSUNormalizedSandboxedURL initWithURL:originalSandboxedURL:]([TSUNormalizedSandboxedURL alloc], "initWithURL:originalSandboxedURL:", v5, v7);
        }
        else
        {
          v10 = v7;
        }
        p_super = &v10->super;

        goto LABEL_11;
      }
    }
    else
    {
      v5 = 0;
    }
    p_super = self;
LABEL_11:

    goto LABEL_12;
  }
  p_super = self;
LABEL_12:

  return p_super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLSandboxedURL *v4;
  CRLSandboxedURL *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CKRecordID v21;
  Swift::String v22;

  v4 = -[CRLSandboxedURL initWithURL:](+[CRLSandboxedURL allocWithZone:](CRLSandboxedURL, "allocWithZone:", a3), "initWithURL:", self->_URL);
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231238);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF520();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231258);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Copy should never be nil.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLSandboxedURL copyWithZone:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL copyWithZone:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 125, 1, "Copy should never be nil.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
    abort();
  }
  v5 = v4;
  v6 = -[CRLSandboxedURL hasSandboxAccess](v4, "hasSandboxAccess");
  if (v6 != -[CRLSandboxedURL hasSandboxAccess](self, "hasSandboxAccess"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231278);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF5A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231298);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL copyWithZone:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 126, 0, "Sanboxing access didn't transfer as expected to sandboxed URL copy.");

  }
  return v5;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (self->_URLStartedAccessingSecurityScopedResource)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p URL=%@, hasSandboxAccess=%@>"), v5, self, self->_URL, v7));

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;

  v4 = a3;
  v6 = objc_opt_class(CRLSandboxedURL, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL URL](self, "URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
    if (objc_msgSend(v9, "isEqual:", v10))
    {
      v11 = -[CRLSandboxedURL hasSandboxAccess](self, "hasSandboxAccess");
      v12 = v11 ^ objc_msgSend(v8, "hasSandboxAccess") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSandboxedURL URL](self, "URL"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = v4 ^ -[CRLSandboxedURL hasSandboxAccess](self, "hasSandboxAccess");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
