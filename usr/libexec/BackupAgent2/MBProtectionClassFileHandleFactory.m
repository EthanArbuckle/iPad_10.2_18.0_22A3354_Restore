@implementation MBProtectionClassFileHandleFactory

+ (id)factoryWithProtectionClass:(unsigned __int8)a3
{
  return -[MBProtectionClassFileHandleFactory initWithProtectionClass:]([MBProtectionClassFileHandleFactory alloc], "initWithProtectionClass:", a3);
}

- (MBProtectionClassFileHandleFactory)initWithProtectionClass:(unsigned __int8)a3
{
  uint64_t v3;
  MBProtectionClassFileHandleFactory *result;
  objc_super v7;

  v3 = a3;
  if (sub_100066CC0(a3, 1, 0) == 255)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBProtectionClassFileHandleFactory.m"), 25, CFSTR("Invalid protection class: %d"), v3);
  v7.receiver = self;
  v7.super_class = (Class)MBProtectionClassFileHandleFactory;
  result = -[MBProtectionClassFileHandleFactory init](&v7, "init");
  if (result)
    result->_protectionClass = v3;
  return result;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  MBBasicFileHandle *v9;
  uint64_t v10;
  MBBasicFileHandle *v11;
  NSObject *v12;
  int protectionClass;
  uint64_t v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  id v19;

  v15 = 0;
  v9 = +[MBBasicFileHandle basicFileHandleWithPath:flags:mode:error:](MBBasicFileHandle, "basicFileHandleWithPath:flags:mode:error:", a3, *(_QWORD *)&a4, a5);
  v11 = v9;
  if (v9)
  {
    v12 = MBGetDefaultLog(v9, v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      protectionClass = self->_protectionClass;
      *(_DWORD *)buf = 67109378;
      v17 = protectionClass;
      v18 = 2112;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Setting protection class to %d: %@", buf, 0x12u);
      _MBLog(CFSTR("INFO"), "Setting protection class to %d: %@", self->_protectionClass, a3);
    }
    if (!+[MBProtectionClassUtils setWithFD:value:error:](MBProtectionClassUtils, "setWithFD:value:error:", -[MBBasicFileHandle fd](v11, "fd"), self->_protectionClass, &v15))
    {
      if (a6)
        *a6 = +[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v15, a3, CFSTR("Error setting protection class to %d"), self->_protectionClass);
      -[MBBasicFileHandle closeWithError:](v11, "closeWithError:", 0);
      return 0;
    }
  }
  return v11;
}

@end
