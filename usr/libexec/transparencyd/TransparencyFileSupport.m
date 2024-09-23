@implementation TransparencyFileSupport

+ (BOOL)setProtectionToClassDForURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  int *v9;
  char *v10;
  TransparencyError *v11;
  void *v12;
  NSObject *v13;
  int *v14;
  char *v15;
  int v16;
  uint64_t v17;
  int *v18;
  char *v19;
  TransparencyError *v20;
  void *v21;
  NSObject *v22;
  int *v23;
  char *v24;
  int v25;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;

  v5 = objc_retainAutorelease(a3);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);
  v7 = v6;
  if (v6)
  {
    if (fcntl(v6, 64, 4) < 0)
    {
      if (a4)
      {
        v8 = *__error();
        v9 = __error();
        v10 = strerror(*v9);
        v11 = +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", NSPOSIXErrorDomain, v8, CFSTR("set protection class error for file %@: %s(%d)"), v5, v10, *__error());
        *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
      }
      if (qword_1002A7BB8 != -1)
        dispatch_once(&qword_1002A7BB8, &stru_10024C640);
      v12 = (void *)qword_1002A7BC0;
      if (os_log_type_enabled((os_log_t)qword_1002A7BC0, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = __error();
        v15 = strerror(*v14);
        v16 = *__error();
        *(_DWORD *)buf = 138412802;
        v28 = v5;
        v29 = 2080;
        v30 = v15;
        v31 = 1024;
        v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "set protection class error for file %@: %s(%d)", buf, 0x1Cu);

      }
    }
    close(v7);
  }
  else
  {
    if (a4)
    {
      v17 = *__error();
      v18 = __error();
      v19 = strerror(*v18);
      v20 = +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", NSPOSIXErrorDomain, v17, CFSTR("open error for file %@: %s(%d)"), v5, v19, *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue(v20);
    }
    if (qword_1002A7BB8 != -1)
      dispatch_once(&qword_1002A7BB8, &stru_10024C660);
    v21 = (void *)qword_1002A7BC0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BC0, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = __error();
      v24 = strerror(*v23);
      v25 = *__error();
      *(_DWORD *)buf = 138412802;
      v28 = v5;
      v29 = 2080;
      v30 = v24;
      v31 = 1024;
      v32 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "open error for file %@: %s(%d)", buf, 0x1Cu);

    }
  }

  return v7 != 0;
}

+ (id)applicationSupportPath:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  uint8_t v14[8];
  NSFileAttributeKey v15;
  NSFileProtectionType v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLsForDirectory:inDomains:", 14, 1));

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.transparencyd"), 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = NSFileProtectionKey;
    v16 = NSFileProtectionNone;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v10 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, v9, a3);

    v11 = 0;
    if (v10)
      v11 = v7;

  }
  else
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorFile, -37, CFSTR("failed to get Application Support dir")));
    if (qword_1002A7BB8 != -1)
      dispatch_once(&qword_1002A7BB8, &stru_10024C680);
    v12 = qword_1002A7BC0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BC0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to get Application Support dir", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)transparencyFilesPath:(id *)a3
{
  return _objc_msgSend(a1, "applicationSupportPath:", a3);
}

+ (int64_t)directorySizeInKB:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  int64_t v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  NSURLResourceKey v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", a3));
  if (v5)
  {
    v26 = NSURLFileSizeKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v6, 0, a3));

    if (v7)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v19 = v4;
        v11 = 0;
        v12 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            v20 = 0;
            objc_msgSend(v14, "getResourceValue:forKey:error:", &v20, NSURLFileSizeKey, a3, v19);
            v15 = v20;
            if (!v15)
            {
              v17 = -1;
              goto LABEL_14;
            }
            v16 = v15;
            v11 += (uint64_t)objc_msgSend(v15, "unsignedIntegerValue");

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            continue;
          break;
        }
        v17 = v11 / 1000;
LABEL_14:
        v4 = v19;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = -1;
    }

  }
  else
  {
    v17 = -1;
  }

  return v17;
}

+ (id)readDictionaryFromFile:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByAppendingPathComponent:", a3));
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v6, a5));
  else
    v7 = 0;

  return v7;
}

+ (id)readDictionaryFromFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "transparencyFilesPath:", a4));
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "readDictionaryFromFile:inDirectory:error:", v6, v7, a4));
  else
    v8 = 0;

  return v8;
}

+ (id)readDataFromFile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", a4));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v8, 0, a4));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 inDirectory:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  BOOL v11;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "URLByAppendingPathComponent:", a4));
  LODWORD(a4) = objc_msgSend(v9, "writeToURL:error:", v10, a6);

  v11 = (_DWORD)a4
     && +[TransparencyFileSupport setProtectionToClassDForURL:error:](TransparencyFileSupport, "setProtectionToClassDForURL:error:", v10, a6);

  return v11;
}

+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", a5));
  if (v10)
    v11 = objc_msgSend(a1, "writeDictionaryToFile:fileName:inDirectory:error:", v8, v9, v10, a5);
  else
    v11 = 0;

  return v11;
}

+ (BOOL)deleteFile:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByAppendingPathComponent:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  LOBYTE(a5) = objc_msgSend(v7, "removeItemAtURL:error:", v6, a5);

  return (char)a5;
}

+ (BOOL)deleteFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", a4));
  if (v7)
    v8 = objc_msgSend(a1, "deleteFile:inDirectory:error:", v6, v7, a4);
  else
    v8 = 0;

  return v8;
}

@end
