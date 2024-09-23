@implementation SDCacheDeleter

- (SDCacheDeleter)init
{
  void *v3;
  SDCacheDeleter *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v4 = -[SDCacheDeleter initWithArchivesDirectory:](self, "initWithArchivesDirectory:", v3);

  return v4;
}

- (SDCacheDeleter)initWithArchivesDirectory:(id)a3
{
  id v5;
  SDCacheDeleter *v6;
  SDCacheDeleter *v7;
  SDCacheDeleter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SDCacheDeleter;
  v6 = -[SDCacheDeleter init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivesDirectory, a3);
    v8 = v7;
  }

  return v7;
}

- (id)getEnumeratorForVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheDeleter archivesDirectory](self, "archivesDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));

    if (v7)
      v8 = -[SDCacheEnumerator initCacheEnumeratorWithVolume:WithFlags:]([SDCacheEnumerator alloc], "initCacheEnumeratorWithVolume:WithFlags:", v4, 16);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__CFDictionary)periodicAPFSMarkAsPurgeable:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  int v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  int *v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  int *v24;
  char *v25;
  __int128 v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  uint64_t v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDCacheDeleter getEnumeratorForVolume:](self, "getEnumeratorForVolume:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextSysdiagnoseFile"));
    if (v5)
    {
      v7 = (void *)v5;
      *(_QWORD *)&v6 = 136446978;
      v27 = v6;
      do
      {
        v29 = 0;
        objc_msgSend(v7, "getResourceValue:forKey:error:", &v29, NSURLCreationDateKey, 0, v27);
        v8 = v29;
        if (objc_msgSend(v8, "compare:", v4) != (id)1)
        {
          v28 = 0;
          v9 = objc_retainAutorelease(v7);
          v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0);
          if (v10 < 0)
          {
            v19 = sub_1000540D8();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v23 = objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
              v24 = __error();
              v25 = strerror(*v24);
              *(_DWORD *)buf = 136446466;
              v31 = v23;
              v32 = 2082;
              *(_QWORD *)v33 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to open '%{public}s' with error: %{public}s", buf, 0x16u);
            }

          }
          else
          {
            v11 = v10;
            v28 = 66052;
            v12 = ffsctl(v10, 0xC0084A44uLL, &v28, 0);
            v13 = sub_1000540D8();
            v14 = objc_claimAutoreleasedReturnValue(v13);
            v15 = v14;
            if (v12)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                v16 = objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
                v17 = __error();
                v18 = strerror(*v17);
                *(_DWORD *)buf = v27;
                v31 = v16;
                v32 = 1024;
                *(_DWORD *)v33 = v12;
                *(_WORD *)&v33[4] = 2082;
                *(_QWORD *)&v33[6] = v18;
                v34 = 2048;
                v35 = v28;
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to mark '%{public}s' as purgeable with error %d (%{public}s) (flags 0x%llx)", buf, 0x26u);
              }
            }
            else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v21 = objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
              *(_DWORD *)buf = 136446466;
              v31 = v21;
              v32 = 2048;
              *(_QWORD *)v33 = v28;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Marked '%{public}s' purgeable with flags 0x%llx", buf, 0x16u);
            }

            close(v11);
          }
        }

        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextSysdiagnoseFile"));
        v7 = (void *)v22;
      }
      while (v22);
    }

  }
  return 0;
}

+ (void)registerCallbacks
{
  id v2;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[8];
  uint8_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  SDCacheDeleter *v10;

  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    *(_QWORD *)buf = 0;
    v6 = buf;
    v7 = 0x3032000000;
    v8 = sub_100054248;
    v9 = sub_100054258;
    v10 = objc_alloc_init(SDCacheDeleter);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10005443C;
    v4[3] = &unk_10009A008;
    v4[4] = buf;
    CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.sysdiagnose.CacheDelete"), &stru_100099FA0, &stru_100099FC0, &stru_100099FE0, v4);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v2 = sub_1000540D8();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not registering for CacheDelete, as the framework is missing", buf, 2u);
    }

  }
}

- (NSString)archivesDirectory
{
  return self->_archivesDirectory;
}

- (void)setArchivesDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivesDirectory, 0);
}

@end
