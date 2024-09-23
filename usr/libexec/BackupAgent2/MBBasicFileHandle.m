@implementation MBBasicFileHandle

+ (id)basicFileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), a4, a5);
  if ((v10 & 0x80000000) == 0)
    return -[MBBasicFileHandle initWithPath:fd:]([MBBasicFileHandle alloc], "initWithPath:fd:", a3, v10);
  v12 = __error();
  v14 = *v12;
  if (a6)
  {
    v12 = (int *)+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", a3, CFSTR("open error"));
    *a6 = v12;
  }
  v15 = MBGetDefaultLog(v12, v13);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v17 = a3;
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v7;
    v22 = 1024;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "open failed at %@, flags:0x%x, mode:0%o: %{errno}d", buf, 0x1Eu);
    _MBLog(CFSTR("ERROR"), "open failed at %@, flags:0x%x, mode:0%o: %{errno}d", a3, v8, v7, v14);
  }
  if ((_DWORD)v14 == 1)
    sub_10000F1A4(a3);
  return 0;
}

- (MBBasicFileHandle)initWithPath:(id)a3 fd:(int)a4
{
  NSObject *v7;
  MBBasicFileHandle *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;

  v7 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Opened file at %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Opened file at %@", a3);
  }
  v10.receiver = self;
  v10.super_class = (Class)MBBasicFileHandle;
  v8 = -[MBBasicFileHandle init](&v10, "init");
  if (v8)
  {
    v8->_path = (NSString *)a3;
    v8->_fd = a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBBasicFileHandle;
  -[MBBasicFileHandle dealloc](&v3, "dealloc");
}

- (id)path
{
  return self->_path;
}

- (int)fd
{
  return self->_fd;
}

- (id)encryptionKeyWithError:(id *)a3
{
  if (a3)
    *a3 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 4, CFSTR("File has no encryption key"));
  return 0;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  int v5;
  int v6;

  v5 = fstat(self->_fd, a3);
  v6 = v5;
  if (a4 && v5)
    *a4 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fstat error"));
  return v6 == 0;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t result;

  if (sub_10006B950(self->_fd))
    return 0;
  result = read(self->_fd, a3, a4);
  if (result < 0)
  {
    if (a5)
      *a5 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("read error"));
    return -1;
  }
  return result;
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t result;

  result = write(self->_fd, a3, a4);
  if (result < 0)
  {
    if (a5)
      *a5 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("write error"));
    return -1;
  }
  return result;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSString *path;
  uint8_t buf[4];
  NSString *v12;

  v5 = close(self->_fd);
  v7 = v5;
  if ((_DWORD)v5)
  {
    if (a3)
      *a3 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("close error"));
  }
  else
  {
    v8 = MBGetDefaultLog(v5, v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v12 = path;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Closed file at %@", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Closed file at %@", self->_path);
    }
  }
  return v7 == 0;
}

@end
