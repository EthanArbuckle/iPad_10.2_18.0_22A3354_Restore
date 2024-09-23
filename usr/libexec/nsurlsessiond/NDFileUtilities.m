@implementation NDFileUtilities

+ (void)setDaemonWorkState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondLaunchdPath](NDFileUtilities, "nsurlsessiondLaunchdPath"));
  v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_7;
  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("/nsurlsessiond.launch")));
  v7 = (void *)v6;
  if (v3 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v8, "createFileAtPath:contents:attributes:", v7, 0, 0);
LABEL_5:

    goto LABEL_7;
  }
  if (!v3)
  {
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v10 = objc_msgSend(v9, "fileExistsAtPath:", v7);

      if (v10)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v11 = 0;
        objc_msgSend(v8, "removeItemAtPath:error:", v7, &v11);
        goto LABEL_5;
      }
    }
  }
LABEL_7:

}

+ (id)nsurlsessiondLaunchdPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("-launchd")));

  return v3;
}

+ (id)sessionPath:(id)a3 forBundleID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities bundleManagerPath:](NDFileUtilities, "bundleManagerPath:", a4));
  v7 = sub_1000138F8(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

  return v9;
}

+ (id)bundleManagerPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
  v5 = sub_1000138F8(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v6));

  return v7;
}

+ (id)nsurlsessiondPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.nsurlsessiond")));

  return v5;
}

+ (void)createDirectoryAtURL:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = 138412802;
      v11 = v3;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Couldn't create directory at %@, error: %@ [%ld]", buf, 0x20u);
    }

  }
}

+ (void)removeItemAtURL:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = 138412802;
      v11 = v3;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error removing item at url: %@, error: %@ [%ld]", buf, 0x20u);
    }

  }
}

+ (void)removeItemAtPath:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = 138412802;
      v11 = v3;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error removing item at path: %@, error: %@ [%ld]", buf, 0x20u);
    }

  }
}

+ (BOOL)createDataVaultDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v26;
  id v27;
  int v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  id v35;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v12 = qword_1000C7158;
    if (!os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v13 = "Couldn't create directory.  No path provided.";
    v14 = v12;
    v15 = 2;
LABEL_28:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_16;
  }
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4);
  if (!v6)
  {
    v16 = qword_1000C7158;
    if (!os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)v5;
    v13 = "Couldn't create directory.  Unable to extract C-string from path argument: %@";
    v14 = v16;
    v15 = 12;
    goto LABEL_28;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v5);

  if (!v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByDeletingLastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v29 = 0;
    v19 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v29);
    v10 = v29;

    if ((v19 & 1) != 0)
    {
      if (!rootless_mkdir_datavault(v6, 448, "nsurlsessiond"))
      {
        v11 = 1;
        goto LABEL_23;
      }
      v20 = (id)qword_1000C7158;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = v21;
        v22 = "Failed to create data-vault directory.  errno=%d";
        v23 = v20;
        v24 = 8;
LABEL_30:
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      }
    }
    else
    {
      v20 = (id)qword_1000C7158;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v27 = -[NSObject code](v10, "code");
        *(_DWORD *)buf = 138412802;
        v31 = (const char *)v5;
        v32 = 2112;
        v33 = v10;
        v34 = 2048;
        v35 = v27;
        v22 = "Couldn't create directory at %@, error: %@ [%ld]";
        v23 = v20;
        v24 = 32;
        goto LABEL_30;
      }
    }

    v11 = 0;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (chmod(v6, 0x1C0u))
  {
    v9 = (id)qword_1000C7158;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v26 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v6;
      v32 = 1024;
      LODWORD(v33) = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set mode 700 on path %s.  errno=%d", buf, 0x12u);
    }

  }
  if (rootless_check_datavault_flag(v6, "nsurlsessiond") == 1
    && rootless_convert_to_datavault(v6, "nsurlsessiond"))
  {
    v10 = (id)qword_1000C7158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v28 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v6;
      v32 = 1024;
      LODWORD(v33) = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to convert %s to a data-vault directory.  errno=%d", buf, 0x12u);
    }
    v11 = 0;
    goto LABEL_24;
  }
LABEL_16:
  v11 = 0;
LABEL_25:

  return v11;
}

+ (void)createDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = 138412802;
      v11 = v3;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Couldn't create directory at %@, error: %@ [%ld]", buf, 0x20u);
    }

  }
}

+ (id)defaultDownloadDirectoryContainer
{
  NSString *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  v6 = objc_msgSend(v5, "isPrivileged");

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v14));
    v10 = v14;

    if (v9)
    {
      v11 = v4;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.nsurlsessiond/Downloads"), 1));
    }
    else
    {
      v11 = (id)qword_1000C7158;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(v10, "code");
        *(_DWORD *)buf = 138412546;
        v16 = v10;
        v17 = 2048;
        v18 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error getting caches directory: %@ [%ld]", buf, 0x16u);
      }
    }

    v7 = v4;
  }

  return v7;
}

+ (id)defaultDownloadDirectoryForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities defaultDownloadDirectoryContainer](NDFileUtilities, "defaultDownloadDirectoryContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v3, 1));

  return v5;
}

+ (void)updateStreamingZipModificationDate:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t value;

  v3 = a3;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  value = v4;
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  if (v6)
    setxattr(v6, "com.apple.nsurlsessiond.szmodtime", &value, 8uLL, 0, 0);

}

+ (void)removeStreamingZipModificationDate:(id)a3
{
  const char *v3;
  id v4;

  v4 = objc_retainAutorelease(a3);
  v3 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  if (v3)
    removexattr(v3, "com.apple.nsurlsessiond.szmodtime", 0);

}

+ (id)fetchStreamingZipModificationDate:(id)a3
{
  char *v3;
  ssize_t v4;
  double value;

  v3 = (char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (v3)
  {
    value = 0.0;
    v4 = getxattr(v3, "com.apple.nsurlsessiond.szmodtime", &value, 8uLL, 0, 0);
    v3 = 0;
    if (v4 == 8)
      v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", value));
  }
  return v3;
}

+ (void)markItemAsPurged:(id)a3
{
  const char *v3;
  char value;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (v3)
  {
    value = 1;
    setxattr(v3, "com.apple.nsurlsessiond.purged", &value, 1uLL, 0, 0);
  }
}

+ (BOOL)itemShouldBePurged:(id)a3
{
  const char *v3;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (v3)
    LOBYTE(v3) = getxattr(v3, "com.apple.nsurlsessiond.purged", 0, 0, 0, 0) == 1;
  return (char)v3;
}

@end
