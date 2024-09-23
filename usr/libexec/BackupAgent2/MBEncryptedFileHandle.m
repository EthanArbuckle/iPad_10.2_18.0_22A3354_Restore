@implementation MBEncryptedFileHandle

+ (id)encryptedFileHandleForBackupWithPath:(id)a3 keybag:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  MBEncryptedFileHandle *v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBEncryptedFileHandle.m"), 43, CFSTR("No keybag for backing up encrypted file"));
  v16 = 0;
  v8 = MKBFileOpenForBackup(a3, &v16);
  v10 = MBGetDefaultLog(v8, v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v11)
  {
    *(_DWORD *)buf = 138412546;
    v18 = a3;
    v19 = 1024;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBFileOpenForBackup(\"%@\", ...): %d", buf, 0x12u);
    v11 = _MBLog(CFSTR("DEBUG"), "MKBFileOpenForBackup(\"%@\", ...): %d", a3, v8);
  }
  if ((_DWORD)v8)
  {
    if (a5)
    {
      v11 = +[MBKeyBag errorWithReturnCode:path:description:](MBKeyBag, "errorWithReturnCode:path:description:", v8, a3, CFSTR("Error opening encrypted file for backup"));
      *a5 = (id)v11;
    }
    if (v8 >= 0xFFFFFFFE)
    {
      v13 = MBGetDefaultLog(v11, v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = a3;
        v19 = 1024;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "MKBFileOpenForBackup failed at %@: %d", buf, 0x12u);
        _MBLog(CFSTR("FAULT"), "MKBFileOpenForBackup failed at %@: %d", a3, v8);
      }
      sub_10000F1A4(a3);
    }
    return 0;
  }
  else
  {
    v15 = [MBEncryptedFileHandle alloc];
    return -[MBEncryptedFileHandle initWithPath:keybag:file:restore:](v15, "initWithPath:keybag:file:restore:", a3, a4, v16, 0);
  }
}

+ (id)encryptedFileHandleForRestoreWithPath:(id)a3 keybag:(id)a4 key:(id)a5 error:(id *)a6
{
  id result;

  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBEncryptedFileHandle.m"), 61, CFSTR("No keybag for restoring encrypted file"));
    if (a5)
      goto LABEL_3;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBEncryptedFileHandle.m"), 62, CFSTR("No encrypted file key for restoring file: %@"), a3);
LABEL_3:
  result = objc_msgSend(a4, "encryptedFileForRestoreWithPath:key:error:", a3, a5, a6);
  if (result)
    return -[MBEncryptedFileHandle initWithPath:keybag:file:restore:]([MBEncryptedFileHandle alloc], "initWithPath:keybag:file:restore:", a3, a4, result, 1);
  return result;
}

- (MBEncryptedFileHandle)initWithPath:(id)a3 keybag:(id)a4 file:(_mkbfileref *)a5 restore:(BOOL)a6
{
  MBEncryptedFileHandle *v10;
  uint64_t v11;
  MBEncryptedFileHandle *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;

  v15.receiver = self;
  v15.super_class = (Class)MBEncryptedFileHandle;
  v10 = -[MBEncryptedFileHandle init](&v15, "init");
  v12 = v10;
  if (v10)
  {
    v13 = MBGetDefaultLog(v10, v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Opened encrypted file at %@", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Opened encrypted file at %@", a3);
    }
    v12->_path = (NSString *)a3;
    v12->_keybag = (MBKeyBag *)a4;
    v12->_file = a5;
    v12->_buffer = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0);
    v12->_restore = a6;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_file)
    MKBFileClose();

  v3.receiver = self;
  v3.super_class = (Class)MBEncryptedFileHandle;
  -[MBEncryptedFileHandle dealloc](&v3, "dealloc");
}

- (id)path
{
  return self->_path;
}

- (int)fd
{
  return MKBFileGetFD(self->_file, a2);
}

- (id)encryptionKeyWithError:(id *)a3
{
  if (!self->_keybag)
    sub_1000888A0();
  return -[MBKeyBag encryptionKeyForFile:path:error:](self->_keybag, "encryptionKeyForFile:path:error:", self->_file, self->_path, a3);
}

- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4
{
  if (!self->_keybag)
    sub_1000888C8();
  return -[MBKeyBag validateEncryptionKey:file:path:error:](self->_keybag, "validateEncryptionKey:file:path:error:", a3, self->_file, self->_path, a4);
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSString *path;
  BOOL result;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;

  if (self->_restore)
  {
    v5 = MKBFileWrite(self->_file, 0, 0);
    v7 = MBGetDefaultLog(v5, v6);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v5 < 0)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134217984;
        v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MKBFileWrite(0): %zd", buf, 0xCu);
        _MBLog(CFSTR("DEBUG"), "MKBFileWrite(0): %zd", v5);
      }
      if (a3)
      {
        v11 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("MKBFileWrite error"));
        goto LABEL_15;
      }
      return 0;
    }
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MKBFileWrite(0): %{bytes}zd", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "MKBFileWrite(0): %{bytes}zd", v5);
    }
  }
  v9 = MKBFileClose(self->_file, a2);
  self->_file = 0;
  if ((_DWORD)v9)
  {
    if (a3)
    {
      v11 = +[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v9, CFSTR("MKBFileClose error"));
LABEL_15:
      v15 = v11;
      result = 0;
      *a3 = v15;
      return result;
    }
    return 0;
  }
  v12 = MBGetDefaultLog(v9, v10);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    v17 = (uint64_t)path;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Closed encrypted file at %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Closed encrypted file at %@", self->_path);
  }
  return 1;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  int v5;
  int v6;

  v5 = fstat(-[MBEncryptedFileHandle fd](self, "fd"), a3);
  v6 = v5;
  if (a4 && v5)
    *a4 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fstat error"));
  return v6 == 0;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _mkbfileref *file;
  void *v13;
  unint64_t v14;
  MBError *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  int64_t v22;

  if (self->_restore)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBEncryptedFileHandle.m"), 143, CFSTR("Can't read from restore file"));
  v9 = sub_10006B950(-[MBEncryptedFileHandle fd](self, "fd"));
  if ((v9 & 1) != 0)
  {
    v11 = 0;
    goto LABEL_12;
  }
  if (-[MBKeyBag isOTA](self->_keybag, "isOTA"))
  {
    file = self->_file;
    v13 = a3;
    v14 = a4;
  }
  else
  {
    if (a4 <= 0xF)
    {
      if (!a5)
        return -1;
      v15 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Buffer for reading from encrypted file too small"));
LABEL_18:
      *a5 = v15;
      return -1;
    }
    file = self->_file;
    v14 = a4 & 0xFFFFFFFFFFFFFFF0;
    v13 = a3;
  }
  v9 = MKBFileRead(file, v13, v14);
  v11 = v9;
  if (v9 < 0)
  {
    v17 = MBGetDefaultLog(v9, v10);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v20 = a4;
      v21 = 2048;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "MKBFileRead(%{bytes}lu): %zd", buf, 0x16u);
      _MBLog(CFSTR("DEBUG"), "MKBFileRead(%{bytes}lu): %zd", a4, v11);
    }
    if (!a5)
      return -1;
    v15 = (MBError *)+[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("MKBFileRead error"));
    goto LABEL_18;
  }
LABEL_12:
  v16 = MBGetDefaultLog(v9, v10);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v20 = a4;
    v21 = 2048;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "MKBFileRead(%{bytes}lu): %{bytes}zd", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), "MKBFileRead(%{bytes}lu): %{bytes}zd", a4, v11);
  }
  return v11;
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  uint64_t v23;

  if (!self->_restore)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBEncryptedFileHandle.m"), 171, CFSTR("Can't write to backup file"));
  if (-[MBKeyBag isOTA](self->_keybag, "isOTA"))
  {
    v9 = MKBFileWrite(self->_file, a3, a4);
    v11 = MBGetDefaultLog(v9, v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134218240;
        v21 = a4;
        v22 = 2048;
        v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %{bytes}zd", buf, 0x16u);
        _MBLog(CFSTR("DEBUG"), "MKBFileWrite(%{bytes}lu): %{bytes}zd", a4, v9);
      }
      return a4;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      v21 = a4;
      v22 = 2048;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %zd", buf, 0x16u);
      _MBLog(CFSTR("DEBUG"), "MKBFileWrite(%{bytes}lu): %zd", a4, v9);
    }
    goto LABEL_22;
  }
  if (-[NSMutableData length](self->_buffer, "length"))
  {
    v13 = -[NSMutableData length](self->_buffer, "length");
    if (16 - v13 < a4)
      a4 = 16 - v13;
    -[NSMutableData appendBytes:length:](self->_buffer, "appendBytes:length:", a3, a4);
    if (-[NSMutableData length](self->_buffer, "length") >= 0x10)
    {
      v14 = MKBFileWrite(self->_file, -[NSMutableData mutableBytes](self->_buffer, "mutableBytes"), -[NSMutableData length](self->_buffer, "length"));
      -[NSMutableData setLength:](self->_buffer, "setLength:", 0);
      if (v14 < 0)
      {
LABEL_22:
        if (a5)
          *a5 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("MKBFileWrite error"));
        return -1;
      }
    }
  }
  else
  {
    if ((a4 & 0xF) != 0)
      -[NSMutableData appendBytes:length:](self->_buffer, "appendBytes:length:", (char *)a3 + (a4 & 0xFFFFFFFFFFFFFFF0), a4 & 0xF);
    v15 = MKBFileWrite(self->_file, a3, a4 & 0xFFFFFFFFFFFFFFF0);
    v17 = MBGetDefaultLog(v15, v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v15 < 0)
    {
      if (v18)
      {
        *(_DWORD *)buf = 134218240;
        v21 = a4 & 0xFFFFFFFFFFFFFFF0;
        v22 = 2048;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %zd", buf, 0x16u);
        _MBLog(CFSTR("DEBUG"), "MKBFileWrite(%{bytes}lu): %zd", a4 & 0xFFFFFFFFFFFFFFF0, v15);
      }
      goto LABEL_22;
    }
    if (v18)
    {
      *(_DWORD *)buf = 134218240;
      v21 = a4 & 0xFFFFFFFFFFFFFFF0;
      v22 = 2048;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %{bytes}zd", buf, 0x16u);
      _MBLog(CFSTR("DEBUG"), "MKBFileWrite(%{bytes}lu): %{bytes}zd", a4 & 0xFFFFFFFFFFFFFFF0, v15);
    }
  }
  return a4;
}

@end
