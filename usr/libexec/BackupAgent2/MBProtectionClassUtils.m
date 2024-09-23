@implementation MBProtectionClassUtils

+ (BOOL)isProtected:(unsigned __int8)a3
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t buf[4];
  int v8;

  v3 = a3;
  if (a3 < 8u && ((0x9Fu >> a3) & 1) != 0)
  {
    return (0x8Eu >> a3) & 1;
  }
  else
  {
    v4 = MBGetDefaultLog(a1, a2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "=pc= +isProtected: Invalid protection class: %d", buf, 8u);
      _MBLog(CFSTR("FAULT"), "=pc= +isProtected: Invalid protection class: %d", v3);
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (BOOL)canOpenWhenLocked:(unsigned __int8)a3
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t buf[4];
  int v8;

  v3 = a3;
  if (a3 < 8u && ((0x9Fu >> a3) & 1) != 0)
  {
    return (0xF9u >> a3) & 1;
  }
  else
  {
    v4 = MBGetDefaultLog(a1, a2);
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "=pc= +canOpenWhenLocked: Invalid protection class: %d", buf, 8u);
      _MBLog(CFSTR("FAULT"), "=pc= +canOpenWhenLocked: Invalid protection class: %d", v3);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (int)openRawEncryptedWithPath:(id)a3 error:(id *)a4
{
  return +[MBProtectionClassUtils openRawEncryptedWithPathFSR:error:](MBProtectionClassUtils, "openRawEncryptedWithPathFSR:error:", objc_msgSend(a3, "fileSystemRepresentation"), a4);
}

+ (unsigned)getWithPath:(id)a3 error:(id *)a4
{
  return +[MBProtectionClassUtils getWithPathFSR:error:](MBProtectionClassUtils, "getWithPathFSR:error:", objc_msgSend(a3, "fileSystemRepresentation"), a4);
}

+ (BOOL)isContentUnavailableDueToCxExpiration:(id)a3 error:(id *)a4
{
  const char *v7;
  int v8;
  int *v9;
  BOOL v10;

  v7 = (const char *)objc_msgSend(a3, "fileSystemRepresentation");
  if (objc_msgSend(a1, "getWithPathFSR:error:", v7, a4) != 7)
    return 0;
  v8 = open(v7, 256);
  v9 = __error();
  if ((v8 & 0x80000000) == 0)
  {
    close(v8);
    return 0;
  }
  if (*v9 != 1)
    return 0;
  v10 = 1;
  if (a4)
    *a4 = +[MBError errorWithErrno:code:path:format:](MBError, "errorWithErrno:code:path:format:", 1, 240, a3, CFSTR("File content unavailable with protection class %d"), 7);
  return v10;
}

+ (unsigned)getWithPathFSR:(const char *)a3 error:(id *)a4
{
  id v5;
  int v6;
  unsigned __int8 v7;

  v5 = objc_msgSend(a1, "openRawEncryptedWithPathFSR:error:", a3);
  if ((v5 & 0x80000000) != 0)
    return -1;
  v6 = (int)v5;
  v7 = +[MBProtectionClassUtils getWithFD:error:](MBProtectionClassUtils, "getWithFD:error:", v5, a4);
  close(v6);
  return v7;
}

+ (BOOL)setWithPath:(id)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  return +[MBProtectionClassUtils setWithPathFSR:value:error:](MBProtectionClassUtils, "setWithPathFSR:value:error:", objc_msgSend(a3, "fileSystemRepresentation"), a4, a5);
}

+ (BOOL)setWithPathFSR:(const char *)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  int v9;
  BOOL v10;
  const __CFString *v12;
  MBError *v13;

  v6 = a4;
  v8 = open(a3, 256);
  if ((v8 & 0x80000000) != 0)
  {
    if (a5)
    {
      if (a3)
        v12 = (const __CFString *)+[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a3);
      else
        v12 = CFSTR("(null)");
      if (*__error() == 1
        && !+[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", v6))
      {
        v13 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 208, v12, CFSTR("open error setting protection class (device locked?)"));
      }
      else
      {
        v13 = (MBError *)+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v12, CFSTR("open error setting protection class"));
      }
      *a5 = v13;
    }
    return 0;
  }
  else
  {
    v9 = v8;
    v10 = +[MBProtectionClassUtils setWithFD:value:error:](MBProtectionClassUtils, "setWithFD:value:error:", v8, v6, a5);
    close(v9);
    return v10;
  }
}

+ (int)openRawEncryptedWithPathFSR:(const char *)a3 error:(id *)a4
{
  int result;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  stat buf;

  result = open_dprotected_np(a3, 256, 0, 1);
  if (result < 0)
  {
    v7 = __error();
    v9 = *v7;
    if (a4)
    {
      v7 = (int *)+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a3), CFSTR("open_dprotected_np error"));
      *a4 = v7;
    }
    v10 = MBGetDefaultLog(v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 136315394;
      *(_QWORD *)&buf.st_mode = a3;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=pc= open_dprotected_np failed at %s: %{errno}d", (uint8_t *)&buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "=pc= open_dprotected_np failed at %s: %{errno}d", a3, v9);
    }
    if ((_DWORD)v9 == 22)
    {
      if (!sub_100081D30())
        return -1;
    }
    else
    {
      if ((_DWORD)v9 != 1)
        return -1;
      memset(&buf, 0, sizeof(buf));
      v11 = lstat(a3, &buf);
      if (v11 | buf.st_flags & 0x20)
        return -1;
    }
    v12 = +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a3);
    sub_10000F234(v12);
    v15 = MBGetDefaultLog(v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      buf.st_dev = 138412546;
      *(_QWORD *)&buf.st_mode = v12;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "=pc= open_dprotected_np failed at %@: %{errno}d", (uint8_t *)&buf, 0x12u);
      _MBLog(CFSTR("FAULT"), "=pc= open_dprotected_np failed at %@: %{errno}d", v12, v9);
    }
    return -1;
  }
  return result;
}

+ (unsigned)getWithFD:(int)a3 error:(id *)a4
{
  int v5;

  v5 = fcntl(a3, 63);
  if (v5 < 0)
  {
    if (a4)
      *a4 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fcntl error getting protection class"));
    LOBYTE(v5) = -1;
  }
  return v5;
}

+ (BOOL)setWithFD:(int)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  int v7;
  int v8;
  MBError *v9;

  v6 = a4;
  v7 = fcntl(a3, 64, a4);
  v8 = v7;
  if (a5 && v7)
  {
    if (*__error() == 1
      && !+[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", v6))
    {
      v9 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("fcntl permission error setting protection class (device locked?)"));
    }
    else
    {
      v9 = (MBError *)+[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fcntl error setting protection class"));
    }
    *a5 = v9;
  }
  return v8 == 0;
}

+ (int)sqliteOpenFlagForProtectionClass:(unsigned __int8)a3
{
  int v3;
  char v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;

  v3 = a3;
  v4 = a3 - 1;
  if ((a3 - 1) < 7 && ((0x4Fu >> v4) & 1) != 0)
    return dword_10009D470[v4];
  v5 = MBGetDefaultLog(a1, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=pc= No SQLite open flag known for protection class: %d", buf, 8u);
    _MBLog(CFSTR("DEFAULT"), "=pc= No SQLite open flag known for protection class: %d", v3);
  }
  return 0x400000;
}

@end
