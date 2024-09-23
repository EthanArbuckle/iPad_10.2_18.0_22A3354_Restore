@implementation CRLTemporaryDirectory

- (CRLTemporaryDirectory)init
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
    dispatch_once(&qword_10147E370, &stru_101232048);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLTemporaryDirectory init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m";
    v17 = 1024;
    v18 = 23;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101232068);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTemporaryDirectory init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 23, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLTemporaryDirectory init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLTemporaryDirectory)initWithError:(id *)a3
{
  return -[CRLTemporaryDirectory initWithSignature:subdirectory:error:](self, "initWithSignature:subdirectory:error:", &stru_1012A72B0, 0, a3);
}

- (CRLTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return -[CRLTemporaryDirectory initWithSignature:subdirectory:error:](self, "initWithSignature:subdirectory:error:", a3, 0, a4);
}

- (CRLTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CRLTemporaryDirectory *v10;
  CRLTemporaryDirectory *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLTemporaryDirectory;
  v10 = -[CRLTemporaryDirectory init](&v13, "init");
  v11 = v10;
  if (v10
    && !-[CRLTemporaryDirectory _createDirectoryWithSignature:subdirectory:error:](v10, "_createDirectoryWithSignature:subdirectory:error:", v8, v9, a5))
  {

    v11 = 0;
  }

  return v11;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6;
  CRLTemporaryDirectory *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *path;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLTemporaryDirectory;
  v7 = -[CRLTemporaryDirectory init](&v13, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v6, 1, a4));

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    path = v7->_path;
    v7->_path = (NSString *)v10;

    if (!v9)
    {

      v7 = 0;
    }

  }
  return v7;
}

- (void)setAssociatedLifetimeObject:(id)a3
{
  objc_setAssociatedObject(a3, "com.apple.freeform.tempDirDelegate", self, (void *)1);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_path && !self->_leak)
    -[CRLTemporaryDirectory removeDirectory](self, "removeDirectory");
  v3.receiver = self;
  v3.super_class = (Class)CRLTemporaryDirectory;
  -[CRLTemporaryDirectory dealloc](&v3, "dealloc");
}

- (NSString)path
{
  NSString *path;
  void *v4;
  void *v5;
  void *v6;

  path = self->_path;
  if (!path)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232088);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1178();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012320A8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTemporaryDirectory path]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 71, 0, "Directory has already been removed");

    path = self->_path;
  }
  return path;
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTemporaryDirectory path](self, "path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));

  return (NSURL *)v3;
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (void)removeDirectory
{
  uint64_t *p_path;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  id v12;

  p_path = (uint64_t *)&self->_path;
  if (self->_path)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = *p_path;
    v12 = 0;
    v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v12);
    v6 = v12;
    v7 = v6;
    if ((v5 & 1) != 0)
    {

    }
    else
    {
      v10 = objc_msgSend(v6, "crl_isNoSuchFileError");

      if ((v10 & 1) == 0)
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_1012320C8);
        v11 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          sub_100DF1280((uint64_t)v7, p_path, v11);
      }
    }
    v9 = (void *)*p_path;
    *p_path = 0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012320E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF11FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232108);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTemporaryDirectory removeDirectory]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v9, 92, 0, "Directory has already been removed");
  }

}

- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  double Current;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  id v26;
  id v28;

  v8 = (__CFString *)a3;
  v9 = a4;
  if (v8)
    v10 = v8;
  else
    v10 = &stru_1012A72B0;
  if (qword_101414CC8 != -1)
    dispatch_once(&qword_101414CC8, &stru_101232128);
  Current = CFAbsoluteTimeGetCurrent();
  v12 = (void *)qword_101414CC0;
  do
  {
    v13 = __ldaxr(&dword_101414CD0);
    v14 = v13 + 1;
  }
  while (__stlxr(v14, &dword_101414CD0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("_%@_%d_%d"), v10, (int)Current, v14));
  if ((unint64_t)objc_msgSend(v15, "length") >= 0x100)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringToIndex:", 255));

    v15 = (void *)v16;
  }
  v17 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
  }
  else
  {
    v19 = NSTemporaryDirectory();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }
  v20 = v18;
  if (v9)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v9));

    v20 = (void *)v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", v15));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v28 = 0;
  v24 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, 0, &v28);
  v25 = v28;

  objc_storeStrong((id *)&self->_path, v22);
  if (a5 && (v24 & 1) == 0)
  {
    if (v25)
    {
      *a5 = objc_retainAutorelease(v25);
    }
    else
    {
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileWriteUnknownErrorWithUserInfo:](NSError, "crl_fileWriteUnknownErrorWithUserInfo:", 0)));
      *a5 = v26;

    }
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
