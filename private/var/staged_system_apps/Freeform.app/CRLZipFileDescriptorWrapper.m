@implementation CRLZipFileDescriptorWrapper

- (CRLZipFileDescriptorWrapper)init
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
    dispatch_once(&qword_10147E370, &stru_10122C6C0);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLZipFileDescriptorWrapper init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m";
    v17 = 1024;
    v18 = 471;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122C6E0);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileDescriptorWrapper init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 471, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLZipFileDescriptorWrapper init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3
{
  CRLZipFileDescriptorWrapper *v3;
  uint64_t v4;
  CRLZipFileDescriptorWrapper *v5;
  CRLReadChannel *v6;
  CRLReadChannel *readChannel;
  dispatch_group_t v8;
  OS_dispatch_group *accessGroup;
  CRLZipFileDescriptorWrapper *v10;
  _QWORD v12[4];
  int v13;
  objc_super v14;

  v3 = self;
  if ((a3 & 0x80000000) == 0)
  {
    v4 = *(_QWORD *)&a3;
    v14.receiver = self;
    v14.super_class = (Class)CRLZipFileDescriptorWrapper;
    v5 = -[CRLZipFileDescriptorWrapper init](&v14, "init");
    v3 = v5;
    if (!v5)
    {
      close(v4);
      goto LABEL_7;
    }
    v5->_fileDescriptor = v4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000DD88;
    v12[3] = &unk_10122C700;
    v13 = v4;
    v6 = -[CRLFileIOChannel initForReadingDescriptor:cleanupHandler:]([CRLFileIOChannel alloc], "initForReadingDescriptor:cleanupHandler:", v4, v12);
    readChannel = v3->_readChannel;
    v3->_readChannel = v6;

    if (v3->_readChannel)
    {
      v8 = dispatch_group_create();
      accessGroup = v3->_accessGroup;
      v3->_accessGroup = (OS_dispatch_group *)v8;

LABEL_7:
      v3 = v3;
      v10 = v3;
      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLReadChannel close](self->_readChannel, "close");
  v3.receiver = self;
  v3.super_class = (Class)CRLZipFileDescriptorWrapper;
  -[CRLZipFileDescriptorWrapper dealloc](&v3, "dealloc");
}

- (void)beginAccess
{
  dispatch_group_enter((dispatch_group_t)self->_accessGroup);
}

- (void)endAccess
{
  dispatch_group_leave((dispatch_group_t)self->_accessGroup);
}

- (void)waitForAccessToEnd
{
  dispatch_group_wait((dispatch_group_t)self->_accessGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (CRLReadChannel)readChannel
{
  return self->_readChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end
