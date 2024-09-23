@implementation MBDeviceLinkDriveContext

- (MBDeviceLinkDriveContext)initWithFileHandleFactory:(id)a3
{
  MBDeviceLinkDriveContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDeviceLinkDriveContext;
  v4 = -[MBDeviceLinkDriveContext init](&v6, "init");
  if (v4)
  {
    v4->_fileHandleFactory = (MBFileHandleFactory *)a3;
    v4->_fileHandlesByFD = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDeviceLinkDriveContext;
  -[MBDeviceLinkDriveContext dealloc](&v3, "dealloc");
}

- (id)_fileForFD:(int)a3
{
  id v5;

  if ((unint64_t)-[NSMutableArray count](self->_fileHandlesByFD, "count") <= a3)
    return 0;
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_fileHandlesByFD, "objectAtIndexedSubscript:", a3);
  if (v5 == (id)objc_opt_class(NSNull))
    return 0;
  else
    return v5;
}

- (int)_addFile:(id)a3
{
  unint64_t v5;

  v5 = (int)objc_msgSend(a3, "fd");
  while ((unint64_t)-[NSMutableArray count](self->_fileHandlesByFD, "count") <= v5)
    -[NSMutableArray addObject:](self->_fileHandlesByFD, "addObject:", +[NSNull null](NSNull, "null"));
  -[NSMutableArray setObject:atIndexedSubscript:](self->_fileHandlesByFD, "setObject:atIndexedSubscript:", a3, v5);
  return v5;
}

- (void)_removeFileWithFD:(int)a3
{
  -[NSMutableArray setObject:atIndexedSubscript:](self->_fileHandlesByFD, "setObject:atIndexedSubscript:", +[NSNull null](NSNull, "null"), a3);
}

- (int)openWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5
{
  id v7;
  id v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;

  v15 = 0;
  v7 = -[MBFileHandleFactory fileHandleWithPath:flags:mode:error:](self->_fileHandleFactory, "fileHandleWithPath:flags:mode:error:", a3, *(_QWORD *)&a4, a5, &v15);
  if (v7)
    return -[MBDeviceLinkDriveContext _addFile:](self, "_addFile:", v7);
  v9 = +[MBError isError:withCodes:](MBError, "isError:withCodes:", v15, 4, 7, 9, 0);
  v10 = (int)v9;
  v12 = MBGetDefaultLog(v9, v11);
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = a3;
      v18 = 2112;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to open %@: %@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Failed to open %@: %@", a3, v15);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = a3;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to open %@: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "Failed to open %@: %@", a3, v15);
  }
  v14 = +[MBError errnoForError:](MBError, "errnoForError:", v15);
  *__error() = v14;
  return -1;
}

- (int)statWithFD:(int)a3 buf:(stat *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;

  v14 = 0;
  v5 = -[MBDeviceLinkDriveContext _fileForFD:](self, "_fileForFD:", *(_QWORD *)&a3);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "statWithBuffer:error:", a4, &v14);
    if ((v7 & 1) != 0)
      return 0;
    v10 = MBGetDefaultLog(v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v6, "path");
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "stat failed at %@: %@", buf, 0x16u);
      v12 = objc_msgSend(v6, "path");
      _MBLog(CFSTR("ERROR"), "stat failed at %@: %@", v12, v14);
    }
    v13 = +[MBError errnoForError:](MBError, "errnoForError:", v14);
    *__error() = v13;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

- (int64_t)readWithFD:(int)a3 bytes:(void *)a4 length:(unint64_t)a5
{
  id v7;
  void *v8;
  int64_t result;
  id v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;

  v20 = 0;
  v7 = -[MBDeviceLinkDriveContext _fileForFD:](self, "_fileForFD:", *(_QWORD *)&a3);
  if (v7)
  {
    v8 = v7;
    result = (int64_t)objc_msgSend(v7, "readWithBytes:length:error:", a4, a5, &v20);
    if ((result & 0x8000000000000000) == 0)
      return result;
    v10 = +[MBError isError:withCode:](MBError, "isError:withCode:", v20, 9);
    v11 = (int)v10;
    v13 = MBGetDefaultLog(v10, v12);
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = objc_msgSend(v8, "path");
        *(_DWORD *)buf = 138412546;
        v22 = v15;
        v23 = 2112;
        v24 = v20;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "read failed at %@: %@", buf, 0x16u);
        v18 = objc_msgSend(v8, "path");
        _MBLog(CFSTR("INFO"), "read failed at %@: %@", v18, v20);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v8, "path");
      *(_DWORD *)buf = 138412546;
      v22 = v16;
      v23 = 2112;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "read failed at %@: %@", buf, 0x16u);
      v19 = objc_msgSend(v8, "path");
      _MBLog(CFSTR("ERROR"), "read failed at %@: %@", v19, v20);
    }
    v17 = +[MBError errnoForError:](MBError, "errnoForError:", v20);
    *__error() = v17;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

- (int64_t)writeWithFD:(int)a3 bytes:(const void *)a4 length:(unint64_t)a5
{
  id v7;
  void *v8;
  int64_t result;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;

  v15 = 0;
  v7 = -[MBDeviceLinkDriveContext _fileForFD:](self, "_fileForFD:", *(_QWORD *)&a3);
  if (v7)
  {
    v8 = v7;
    result = (int64_t)objc_msgSend(v7, "writeWithBytes:length:error:", a4, a5, &v15);
    if ((result & 0x8000000000000000) == 0)
      return result;
    v11 = MBGetDefaultLog(result, v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v8, "path");
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "write failed at %@: %@", buf, 0x16u);
      v13 = objc_msgSend(v8, "path");
      _MBLog(CFSTR("ERROR"), "write failed at %@: %@", v13, v15);
    }
    v14 = +[MBError errnoForError:](MBError, "errnoForError:", v15);
    *__error() = v14;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

- (int)closeWithFD:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v14 = 0;
  v5 = -[MBDeviceLinkDriveContext _fileForFD:](self, "_fileForFD:");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "closeWithError:", &v14);
    if ((_DWORD)v7)
    {
      -[MBDeviceLinkDriveContext _removeFileWithFD:](self, "_removeFileWithFD:", v3);
      return 0;
    }
    v10 = MBGetDefaultLog(v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v6, "path");
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "close failed at %@: %@", buf, 0x16u);
      v12 = objc_msgSend(v6, "path");
      _MBLog(CFSTR("ERROR"), "close failed at %@: %@", v12, v14);
    }
    v13 = +[MBError errnoForError:](MBError, "errnoForError:", v14);
    *__error() = v13;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

@end
