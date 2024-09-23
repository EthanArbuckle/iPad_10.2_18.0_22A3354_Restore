@implementation RAPFileManager

+ (id)baseFilePath:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v10));
  v6 = v10;

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.Maps"), 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReportAProblem"), 1));

  }
  else
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v8;
}

+ (id)baseLayoutFilePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baseFilePath:", &v6));
  v3 = v2;
  v4 = 0;
  if (!v6)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("LayoutConfig"), 1));

  return v4;
}

+ (id)baseSubmissionFilePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baseFilePath:", &v6));
  v3 = v2;
  v4 = 0;
  if (!v6)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReportsOutbox"), 1));

  return v4;
}

+ (BOOL)saveData:(id)a3 toDirectory:(id)a4 filename:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  NSFileAttributeKey v43;
  void *v44;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v40 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v40);
    v12 = v40;

    if (!v11)
    {
      v23 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v39 = v12;
    v15 = objc_msgSend(v14, "writeToURL:options:error:", v13, 0, &v39);
    v16 = v39;

    if ((v15 & 1) != 0)
    {
      v37 = v16;
      v17 = objc_msgSend(v13, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v37);
      v18 = v37;

      if ((v17 & 1) == 0)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v36 = v18;
        -[NSObject removeItemAtURL:error:](v22, "removeItemAtURL:error:", v13, &v36);
        v28 = v36;
LABEL_16:
        v12 = v28;

        goto LABEL_17;
      }
      v35 = v18;
      v19 = objc_msgSend(v13, "setResourceValue:forKey:error:", NSURLFileProtectionCompleteUnlessOpen, NSURLFileProtectionKey, &v35);
      v16 = v35;

      if ((v19 & 1) != 0)
      {
        v33 = v16;
        v20 = objc_msgSend(v7, "writeToURL:options:error:", v13, 0, &v33);
        v18 = v33;

        v21 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v22 = v21;
        if ((v20 & 1) != 0)
        {
          v43 = NSFileCreationDate;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v44 = v30;
          v23 = 1;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
          v31 = v18;
          -[NSObject setAttributes:ofItemAtPath:error:](v22, "setAttributes:ofItemAtPath:error:", v24, v25, &v31);
          v12 = v31;

          if (!v12)
          {
LABEL_19:

            goto LABEL_20;
          }
          v26 = sub_100431FFC();
          v22 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error %@ in writing creation date to file", buf, 0xCu);
          }
          v23 = 1;
LABEL_18:

          goto LABEL_19;
        }
        v32 = v18;
        -[NSObject removeItemAtURL:error:](v21, "removeItemAtURL:error:", v13, &v32);
        v28 = v32;
        goto LABEL_16;
      }
      v22 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v34 = v16;
      -[NSObject removeItemAtURL:error:](v22, "removeItemAtURL:error:", v13, &v34);
      v27 = v34;
    }
    else
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v38 = v16;
      -[NSObject removeItemAtURL:error:](v22, "removeItemAtURL:error:", v13, &v38);
      v27 = v38;
    }
    v12 = v27;

LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }
  v23 = 0;
LABEL_21:

  return v23;
}

+ (unint64_t)numberOfItemsInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 0, &v12));
  v6 = v12;

  v7 = sub_100431FFC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218242;
    v14 = v9;
    v15 = 2112;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found %lu items at directory %@", buf, 0x16u);
  }

  v10 = objc_msgSend(v5, "count");
  return (unint64_t)v10;
}

+ (BOOL)removeItemAtFilePath:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v15);
  v6 = v15;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByDeletingLastPathComponent"));
  if (!+[RAPFileManager numberOfItemsInDirectory:](RAPFileManager, "numberOfItemsInDirectory:", v7))
  {
    v8 = sub_100431FFC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleting directory %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = v6;
    v11 = objc_msgSend(v10, "removeItemAtURL:error:", v7, &v14);
    v12 = v14;

    v5 &= v11;
    v6 = v12;
  }

  return v5;
}

+ (BOOL)removeAllItemsInDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unsigned __int8 v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, 0));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((v11 & 1) != 0)
          v11 = objc_msgSend(a1, "removeItemAtFilePath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), (_QWORD)v14);
        else
          v11 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (BOOL)haveContentsOfFilePathExpired:(id)a3 withSuggestedRetryDate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "standardTimeToLive");
  LOBYTE(a1) = objc_msgSend(a1, "haveContentsOfFilePathExpired:withSuggestedRetryDate:withTimeToLive:", v7, v6);

  return (char)a1;
}

+ (BOOL)haveContentsOfFilePathExpired:(id)a3 withSuggestedRetryDate:(id)a4 withTimeToLive:(double)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  double v26;

  v7 = a4;
  v18 = 0;
  v17 = 0;
  objc_msgSend(a3, "getResourceValue:forKey:error:", &v18, NSURLCreationDateKey, &v17);
  v8 = v18;
  v9 = v17;
  if (v9)
  {
    v10 = sub_100431FFC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get creation date with error %@", buf, 0xCu);
    }
    v12 = 1;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", a5));
    v13 = -[NSObject compare:](v11, "compare:", v7);
    v12 = v13 == (id)-1;
    v14 = sub_100431FFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      v23 = 1024;
      v24 = v13 == (id)-1;
      v25 = 2048;
      v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "The latest date is %@, the retry date is %@, hasContentExpired = %d and the standard time to live is %f", buf, 0x26u);
    }

  }
  return v12;
}

+ (id)dataAtFileURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsAtPath:", v5));
  return v6;
}

+ (double)standardTimeToLive
{
  return 604800.0;
}

@end
