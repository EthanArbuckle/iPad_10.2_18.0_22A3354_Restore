@implementation NSFileManager

+ (BOOL)emptyContentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  id *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];

  v18 = a4;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 0, 0));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v19 = 0;
        objc_msgSend(v5, "removeItemAtURL:error:", v12, &v19, v18);
        v13 = v19;
        if (v13)
        {
          if (!v9)
            v9 = objc_opt_new(NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (v18 && -[NSMutableDictionary count](v9, "count"))
  {
    v24[0] = CFSTR("mapsPartialErrorsByFileURL");
    v14 = -[NSMutableDictionary copy](v9, "copy");
    v24[1] = NSLocalizedDescriptionKey;
    v25[0] = v14;
    v25[1] = CFSTR("Could not successfully delete all the files in the directory");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    *v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 512, v15));

  }
  v16 = -[NSMutableDictionary count](v9, "count", v18) == 0;

  return v16;
}

+ (id)_maps_globalCachesURL
{
  void *v2;
  void *v3;
  unsigned int v4;
  __CFString *v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  const __CFString *v9;
  id v10;
  NSObject *v11;
  id v12;
  __CFString *v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  __CFString *v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Caches/com.apple.Maps/")));
  if ((objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/mobile/Library/Caches/com.apple.Maps/")) & 1) == 0)
  {
    v15 = 0;
    v4 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v15);
    v5 = (__CFString *)v15;
    if (v4)
    {
      byte_1014D33D0 = 0;
      v6 = sub_1004319DC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = CFSTR("/private/var/mobile/Library/Caches/com.apple.Maps/");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Created global caches directory at path %{public}@", buf, 0xCu);
      }

      v14 = v5;
      v8 = objc_msgSend(v3, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsPurgeableKey, &v14);
      v9 = v14;

      if ((v8 & 1) != 0)
        goto LABEL_13;
      v10 = sub_1004319DC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to set Purgeable resource value on caches directory: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if ((byte_1014D33D0 & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      byte_1014D33D0 = 1;
      v12 = sub_1004319DC();
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = CFSTR("/private/var/mobile/Library/Caches/com.apple.Maps/");
        v18 = 2114;
        v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to create global caches directory at path '%{public}@': %{public}@", buf, 0x16u);
      }
      v9 = v5;
    }

LABEL_13:
    v5 = (__CFString *)v9;
    goto LABEL_14;
  }
LABEL_15:

  return v3;
}

@end
