@implementation MBExtendedAttributes

+ (int)xattrOptionsForPathFSR:(const char *)a3
{
  int *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v11;
  uint64_t v12;
  uint64_t v13;
  stat v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  memset(&v14, 0, sizeof(v14));
  if (lstat(a3, &v14))
  {
    v4 = __error();
    v5 = *v4;
    v7 = MBGetDefaultLog(v4, v6);
    v8 = v7;
    if (v5 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9 = *__error();
        *(_DWORD *)buf = 136315394;
        v16 = a3;
        v17 = 1024;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Failed to lstat %s: %{errno}d", buf, 0x12u);
        v12 = *__error();
        _MBLog(CFSTR("DEBUG"), "Failed to lstat %s: %{errno}d", a3, v12);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      *(_DWORD *)buf = 136315394;
      v16 = a3;
      v17 = 1024;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to lstat %s: %{errno}d", buf, 0x12u);
      v13 = *__error();
      _MBLog(CFSTR("ERROR"), "Failed to lstat %s: %{errno}d", a3, v13);
    }
    return 1;
  }
  else if ((v14.st_flags & 0x40000000) != 0)
  {
    return 33;
  }
  else
  {
    return 1;
  }
}

+ (int)xattrOptionsForFD:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int result;
  int v8;
  int *v9;
  stat v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;

  v3 = *(_QWORD *)&a3;
  memset(&v10, 0, sizeof(v10));
  v4 = fstat(a3, &v10);
  if (!(_DWORD)v4)
    return (v10.st_flags >> 25) & 0x20;
  v6 = MBGetDefaultLog(v4, v5);
  result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v8 = *__error();
    *(_DWORD *)buf = 67109376;
    v12 = v3;
    v13 = 1024;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to stat fd %d: %{errno}d", buf, 0xEu);
    v9 = __error();
    _MBLog(CFSTR("ERROR"), "Failed to stat fd %d: %{errno}d", v3, *v9);
    return 0;
  }
  return result;
}

+ (BOOL)hasAttributesForPath:(id)a3 error:(id *)a4
{
  ssize_t v6;
  BOOL result;
  id v8;

  v6 = listxattr((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 0, 0, (int)objc_msgSend(a1, "xattrOptionsForPathFSR:", objc_msgSend(a3, "fileSystemRepresentation")));
  if (v6 < 0 && *__error() != 2)
  {
    if (a4)
    {
      v8 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", a3, CFSTR("listxattr error"));
      result = 0;
      *a4 = v8;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (a4)
      *a4 = 0;
    return v6 > 0;
  }
  return result;
}

+ (id)keysForPathFSR:(const char *)a3 error:(id *)a4
{
  int v6;
  ssize_t v7;
  size_t v8;
  NSMutableArray *v9;
  NSMutableData *v10;
  ssize_t v11;
  ssize_t v12;
  ssize_t v13;
  const char *v14;

  v6 = objc_msgSend(a1, "xattrOptionsForPathFSR:");
  v7 = listxattr(a3, 0, 0, v6);
  v8 = v7;
  if (v7 < 1)
  {
    if ((v7 & 0x8000000000000000) == 0)
      return &__NSArray0__struct;
  }
  else
  {
    v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
    v10 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v8);
    v11 = listxattr(a3, (char *)-[NSMutableData mutableBytes](v10, "mutableBytes"), v8, v6);
    if ((v11 & 0x8000000000000000) == 0)
    {
      v12 = v11;
      -[NSMutableData setLength:](v10, "setLength:", v11);
      if (v12)
      {
        v13 = 0;
        do
        {
          v14 = (char *)-[NSMutableData bytes](v10, "bytes") + v13;
          -[NSMutableArray addObject:](v9, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
          v13 += strlen(v14) + 1;
        }
        while (v13 < v12);
      }
      return v9;
    }
  }
  v9 = 0;
  if (a4)
    *a4 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a3), CFSTR("listxattr error"));
  return v9;
}

+ (id)keysForFD:(int)a3 error:(id *)a4
{
  int v6;
  ssize_t v7;
  size_t v8;
  NSMutableArray *v9;
  NSMutableData *v10;
  ssize_t v11;
  ssize_t v12;
  ssize_t v13;
  const char *v14;

  v6 = objc_msgSend(a1, "xattrOptionsForFD:");
  v7 = flistxattr(a3, 0, 0, v6);
  v8 = v7;
  if (v7 < 1)
  {
    if ((v7 & 0x8000000000000000) == 0)
      return &__NSArray0__struct;
  }
  else
  {
    v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
    v10 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v8);
    v11 = flistxattr(a3, (char *)-[NSMutableData mutableBytes](v10, "mutableBytes"), v8, v6);
    if ((v11 & 0x8000000000000000) == 0)
    {
      v12 = v11;
      -[NSMutableData setLength:](v10, "setLength:", v11);
      if (v12)
      {
        v13 = 0;
        do
        {
          v14 = (char *)-[NSMutableData bytes](v10, "bytes") + v13;
          -[NSMutableArray addObject:](v9, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
          v13 += strlen(v14) + 1;
        }
        while (v13 < v12);
      }
      return v9;
    }
  }
  v9 = 0;
  if (a4)
    *a4 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("flistxattr error"));
  return v9;
}

+ (id)valueForKey:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5
{
  const char *v8;
  int v9;
  ssize_t v10;
  size_t v11;
  NSMutableData *v12;
  ssize_t v13;

  v8 = (const char *)objc_msgSend(a3, "UTF8String");
  v9 = objc_msgSend(a1, "xattrOptionsForPathFSR:", a4);
  v10 = getxattr(a4, v8, 0, 0, 0, v9);
  if (v10 < 0
    || (v11 = v10,
        v12 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v10),
        v13 = getxattr(a4, v8, -[NSMutableData mutableBytes](v12, "mutableBytes"), v11, 0, v9),
        v13 < 0))
  {
    v12 = 0;
    if (a5)
      *a5 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a4), CFSTR("getxattr error"));
  }
  else
  {
    -[NSMutableData setLength:](v12, "setLength:", v13);
  }
  return v12;
}

+ (id)valueForKey:(id)a3 forFD:(int)a4 error:(id *)a5
{
  uint64_t v6;
  const char *v8;
  int v9;
  ssize_t v10;
  size_t v11;
  NSMutableData *v12;
  ssize_t v13;

  v6 = *(_QWORD *)&a4;
  v8 = (const char *)objc_msgSend(a3, "UTF8String");
  v9 = objc_msgSend(a1, "xattrOptionsForFD:", v6);
  v10 = fgetxattr(v6, v8, 0, 0, 0, v9);
  if (v10 < 0
    || (v11 = v10,
        v12 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v10),
        v13 = fgetxattr(v6, v8, -[NSMutableData mutableBytes](v12, "mutableBytes"), v11, 0, v9),
        v13 < 0))
  {
    v12 = 0;
    if (a5)
      *a5 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fgetxattr error"));
  }
  else
  {
    -[NSMutableData setLength:](v12, "setLength:", v13);
  }
  return v12;
}

+ (id)attributesForPathFSR:(const char *)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  _BYTE v31[128];

  v6 = +[MBExtendedAttributes keysForPathFSR:error:](MBExtendedAttributes, "keysForPathFSR:error:");
  if (!v6)
    return 0;
  v7 = v6;
  if (!objc_msgSend(v6, "count"))
    return &__NSDictionary0__struct;
  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v22 = 0;
        v14 = +[MBExtendedAttributes valueForKey:forPathFSR:error:](MBExtendedAttributes, "valueForKey:forPathFSR:error:", v13, a3, &v22);
        if (v14)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v13);
        }
        else
        {
          v15 = +[MBError isError:withCode:](MBError, "isError:withCode:", v22, 8);
          if ((_DWORD)v15)
          {
            v17 = MBGetDefaultLog(v15, v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v13;
              v29 = 2080;
              v30 = a3;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Extended attribute \"%@\" removed while getting all attributes of \"%s\", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), "Extended attribute \"%@\" removed while getting all attributes of \"%s\", v13, a3);
            }
          }
          else
          {
            v18 = +[MBError isError:withCode:](MBError, "isError:withCode:", v22, 24);
            if (!(_DWORD)v18)
            {
              if (a4)
                *a4 = v22;
              return 0;
            }
            v20 = MBGetDefaultLog(v18, v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v13;
              v29 = 2080;
              v30 = a3;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Skipping -- unable to read extended attribute \"%@\" of \"%s\", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), "Skipping -- unable to read extended attribute \"%@\" of \"%s\", v13, a3);
            }
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v10)
        continue;
      break;
    }
  }
  return v8;
}

+ (id)attributesForFD:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];

  v5 = *(_QWORD *)&a3;
  v6 = +[MBExtendedAttributes keysForFD:error:](MBExtendedAttributes, "keysForFD:error:");
  if (!v6)
    return 0;
  v7 = v6;
  if (!objc_msgSend(v6, "count"))
    return &__NSDictionary0__struct;
  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v22 = 0;
        v14 = +[MBExtendedAttributes valueForKey:forFD:error:](MBExtendedAttributes, "valueForKey:forFD:error:", v13, v5, &v22);
        if (v14)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v13);
        }
        else
        {
          v15 = +[MBError isError:withCode:](MBError, "isError:withCode:", v22, 8);
          if ((_DWORD)v15)
          {
            v17 = MBGetDefaultLog(v15, v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v13;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Extended attribute \"%@\" removed while getting all attributes of file", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "Extended attribute \"%@\" removed while getting all attributes of file", v13);
            }
          }
          else
          {
            v18 = +[MBError isError:withCode:](MBError, "isError:withCode:", v22, 24);
            if (!(_DWORD)v18)
            {
              if (a4)
                *a4 = v22;
              return 0;
            }
            v20 = MBGetDefaultLog(v18, v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v13;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Skipping -- unable to read extended attribute \"%@\", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "Skipping -- unable to read extended attribute \"%@\", v13);
            }
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
  return v8;
}

+ (BOOL)setValue:(id)a3 forKey:(id)a4 forPathFSR:(const char *)a5 error:(id *)a6
{
  int v8;
  int v9;

  v8 = setxattr(a5, (const char *)objc_msgSend(a4, "UTF8String"), objc_msgSend(a3, "bytes"), (size_t)objc_msgSend(a3, "length"), 0, 1);
  v9 = v8;
  if (a6 && v8)
    *a6 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a5), CFSTR("setxattr error"));
  return v9 == 0;
}

+ (BOOL)setValue:(id)a3 forKey:(id)a4 forFD:(int)a5 error:(id *)a6
{
  int v7;
  int v8;

  v7 = fsetxattr(a5, (const char *)objc_msgSend(a4, "UTF8String"), objc_msgSend(a3, "bytes"), (size_t)objc_msgSend(a3, "length"), 0, 0);
  v8 = v7;
  if (a6 && v7)
    *a6 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fsetxattr error"));
  return v8 == 0;
}

+ (BOOL)setAttributes:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  char *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  int *v21;
  BOOL result;
  id v23;
  id *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v8)
  {
    v9 = v8;
    v24 = a5;
    v10 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(a3);
        v12 = *(char **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(a3, "objectForKeyedSubscript:", v12);
        v15 = MBGetDefaultLog(v13, v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = objc_msgSend(v13, "length");
          *(_DWORD *)buf = 138412802;
          v30 = v12;
          v31 = 2080;
          v32 = a4;
          v33 = 2048;
          v34 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Setting \"%@\" xattr at %s (%ld)", buf, 0x20u);
          _MBLog(CFSTR("INFO"), "Setting \"%@\" xattr at %s (%ld)", v12, a4, objc_msgSend(v13, "length"));
        }
        if (setxattr(a4, (const char *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v13, "bytes"), (size_t)objc_msgSend(v13, "length"), 0, 1))
        {
          if (*__error() != 1
            || (v17 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.FinderInfo")), !(_DWORD)v17))
          {
            if (!v24)
              return 0;
            v23 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a4), CFSTR("setxattr error"));
            result = 0;
            *v24 = v23;
            return result;
          }
          v19 = MBGetDefaultLog(v17, v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = *__error();
            *(_DWORD *)buf = 136315906;
            v30 = a4;
            v31 = 2112;
            v32 = v12;
            v33 = 2112;
            v34 = v13;
            v35 = 1024;
            v36 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "setxattr(\"%s\", \"%@\", %@) error: %{errno}d", buf, 0x26u);
            v21 = __error();
            _MBLog(CFSTR("DEFAULT"), "setxattr(\"%s\", \"%@\", %@) error: %{errno}d", a4, v12, v13, *v21);
          }
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
  return 1;
}

+ (BOOL)setAttributes:(id)a3 forFD:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int *v18;
  BOOL result;
  id v20;
  id *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];

  v6 = *(_QWORD *)&a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v8)
  {
    v9 = v8;
    v21 = a5;
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(a3, "objectForKeyedSubscript:", v12);
        if (fsetxattr(v6, (const char *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v13, "bytes"), (size_t)objc_msgSend(v13, "length"), 0, 0))
        {
          if (*__error() != 1
            || (v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.FinderInfo")), !(_DWORD)v14))
          {
            if (!v21)
              return 0;
            v20 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fsetxattr error"));
            result = 0;
            *v21 = v20;
            return result;
          }
          v16 = MBGetDefaultLog(v14, v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *__error();
            *(_DWORD *)buf = 67109890;
            v27 = v6;
            v28 = 2112;
            v29 = v12;
            v30 = 2112;
            v31 = v13;
            v32 = 1024;
            v33 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "fsetxattr(%d, \"%@\", %@) error: %{errno}d", buf, 0x22u);
            v18 = __error();
            _MBLog(CFSTR("DEFAULT"), "fsetxattr(%d, \"%@\", %@) error: %{errno}d", v6, v12, v13, *v18);
          }
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      if (v9)
        continue;
      break;
    }
  }
  return 1;
}

+ (BOOL)removeAttributeForKey:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5
{
  int v7;
  int v8;

  v7 = removexattr(a4, (const char *)objc_msgSend(a3, "UTF8String"), 1);
  v8 = v7;
  if (a5 && v7)
    *a5 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a4), CFSTR("removexattr error"));
  return v8 == 0;
}

+ (BOOL)removeAttributeForKey:(id)a3 forFD:(int)a4 error:(id *)a5
{
  int v6;
  int v7;

  v6 = fremovexattr(a4, (const char *)objc_msgSend(a3, "UTF8String"), 0);
  v7 = v6;
  if (a5 && v6)
    *a5 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("fremovexattr error"));
  return v7 == 0;
}

+ (unint64_t)sizeOfAttributes:(id)a3
{
  id v4;
  id v5;
  char *v6;
  uint64_t v7;
  void *i;
  void *v9;
  char *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(a3);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
      v10 = &v6[(_QWORD)objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 4)];
      v6 = (char *)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", v9), "length") + (_QWORD)v10;
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
  return (unint64_t)v6;
}

@end
