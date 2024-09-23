@implementation SDCacheEnumerator

+ (id)sysdiagnoseDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathSubmission"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("DiagnosticLogs/sysdiagnose")));

  return v4;
}

+ (id)sysdiagnoseInternalDirectory
{
  return CFSTR("/private/var/db/sysdiagnose/com.apple.sysdiagnose");
}

+ (id)validFileSubstrings
{
  if (qword_1000B9770 != -1)
    dispatch_once(&qword_1000B9770, &stru_1000992E8);
  return (id)qword_1000B9768;
}

+ (id)sysdiagnoseEnumerator:(id)a3 WithVolume:(id)a4 WithFlags:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", a4, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  if (objc_msgSend(v7, "hasPrefix:", v9))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v9, "length")));

    v7 = (id)v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseInternalDirectory](SDCacheEnumerator, "sysdiagnoseInternalDirectory"));
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v24[0] = v14;
    v24[1] = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v15));

  }
  v16 = sub_100021638();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v23 = objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Creating an enumerator at %{public}s", buf, 0xCu);
  }

  if (v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, v19, a5, &stru_100099308));

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)initCacheEnumeratorWithVolume:(id)a3
{
  return -[SDCacheEnumerator initCacheEnumeratorWithVolume:WithFlags:](self, "initCacheEnumeratorWithVolume:WithFlags:", a3, 5);
}

- (id)initCacheEnumeratorWithVolume:(id)a3 WithFlags:(unint64_t)a4
{
  __CFString *v6;
  SDCacheEnumerator *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSArray *v23;
  NSArray *enumerators;
  SDCacheEnumerator *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  _QWORD v36[2];

  v6 = (__CFString *)a3;
  v32.receiver = self;
  v32.super_class = (Class)SDCacheEnumerator;
  v7 = -[SDCacheEnumerator init](&v32, "init");
  if (v7)
  {
    if (!v6)
      v6 = CFSTR("/");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
    v36[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseInternalDirectory](SDCacheEnumerator, "sysdiagnoseInternalDirectory"));
    v36[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));

    v11 = objc_alloc_init((Class)NSMutableArray);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v18 = objc_msgSend((id)objc_opt_class(v7, v13), "sysdiagnoseEnumerator:WithVolume:WithFlags:", v17, v6, a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          if (v19)
          {
            objc_msgSend(v11, "addObject:", v19);
          }
          else
          {
            v20 = sub_100021638();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
              *(_DWORD *)buf = 136446210;
              v34 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CacheEnumerator: got nil enumerator for dir '%{public}s'", buf, 0xCu);
            }

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v14);
    }

    v23 = (NSArray *)objc_msgSend(v11, "copy");
    enumerators = v7->_enumerators;
    v7->_enumerators = v23;

    v25 = v7;
  }

  return v7;
}

- (id)initCacheEnumerator
{
  id v3;

  v3 = -[SDCacheEnumerator initCacheEnumeratorWithVolume:]([SDCacheEnumerator alloc], "initCacheEnumeratorWithVolume:", 0);

  return v3;
}

- (BOOL)isSysdiagnoseFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator validFileSubstrings](SDCacheEnumerator, "validFileSubstrings", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(v3, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i)) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (id)nextSysdiagnoseFile
{
  void *v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheEnumerator enumerators](self, "enumerators"));
  v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    v18 = v3;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v3);
        v5 = 0;
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        while (1)
        {
          v7 = v5;
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

          if (!v5)
            break;
          v8 = objc_autoreleasePoolPush();
          v20 = 0;
          objc_msgSend(v5, "getResourceValue:forKey:error:", &v20, NSURLIsDirectoryKey, 0);
          v9 = v20;
          if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
          {
            v10 = 4;
          }
          else
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathComponents"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

            if (-[SDCacheEnumerator isSysdiagnoseFile:](self, "isSysdiagnoseFile:", v13))
            {
              v19 = v5;
              v10 = 1;
            }
            else
            {
              objc_msgSend(v6, "skipDescendants");
              v10 = 4;
            }

          }
          objc_autoreleasePoolPop(v8);
          if (v10 != 4)
          {

            v3 = v18;
            v14 = v19;
            goto LABEL_20;
          }
        }
        v3 = v18;
      }
      v14 = 0;
      v16 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }
  else
  {
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)nextValidURL
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheEnumerator enumerators](self, "enumerators", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = 0;
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        while (1)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

          if (!v10)
            break;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
          v13 = -[SDCacheEnumerator isSysdiagnoseFile:](self, "isSysdiagnoseFile:", v12);

          v8 = v10;
          if ((v13 & 1) != 0)
            goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = 0;
    }
    while (v5);
  }
  else
  {
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (NSArray)enumerators
{
  return self->_enumerators;
}

- (void)setEnumerators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerators, 0);
}

@end
