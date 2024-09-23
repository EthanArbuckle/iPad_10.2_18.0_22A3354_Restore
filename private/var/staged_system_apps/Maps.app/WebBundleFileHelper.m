@implementation WebBundleFileHelper

+ (void)parseManifestFileFromData:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  WebBundleFile *v18;
  void *v19;
  uint64_t v20;
  WebBundleManifest *v21;
  id v22;
  WebBundleManifest *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];

  v5 = (void (**)(id, _QWORD, id))a4;
  v29 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 0, &v29));
  v7 = v29;
  if (v7)
  {
    v5[2](v5, 0, v7);
  }
  else
  {
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hashes")));
      v9 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v24 = 0;
        v10 = objc_alloc_init((Class)NSMutableSet);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16, v24));
              v18 = -[WebBundleFile initWithPath:hash:]([WebBundleFile alloc], "initWithPath:hash:", v16, v17);
              objc_msgSend(v10, "addObject:", v18);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v13);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version")));
        v20 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
          v21 = [WebBundleManifest alloc];
          v22 = objc_msgSend(v10, "copy");
          v23 = -[WebBundleManifest initWithVersion:files:](v21, "initWithVersion:files:", v19, v22);

          ((void (**)(id, WebBundleManifest *, id))v5)[2](v5, v23, 0);
        }
        else
        {
          v23 = (WebBundleManifest *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.ReportAProblem.Downloader"), -2, 0));
          v5[2](v5, 0, v23);
        }
        v7 = v24;

      }
      else
      {
        v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.ReportAProblem.Downloader"), -2, 0));
        v5[2](v5, 0, v10);
      }

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.ReportAProblem.Downloader"), -1, 0));
      v5[2](v5, 0, v8);
    }

  }
}

+ (id)copyToDirectory:(id)a3 fromDirectory:(id)a4 files:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  id obj;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];

  v43 = a3;
  v42 = a4;
  v7 = a5;
  v40 = objc_alloc_init((Class)NSMutableArray);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v8)
  {
    v9 = v8;
    v41 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filePath"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "URLByAppendingPathComponent:", v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByDeletingLastPathComponent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v46 = 0;
        objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v46);
        v16 = v46;

        if (v16)
        {
          v17 = sub_10043292C();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Create file directory error: %@", buf, 0xCu);
          }

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
        v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v45 = 0;
          objc_msgSend(v22, "removeItemAtURL:error:", v13, &v45);
          v23 = v45;

          v24 = sub_10043292C();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          v26 = v25;
          if (v23)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v23;
              v27 = v26;
              v28 = OS_LOG_TYPE_ERROR;
              v29 = "Error removing file %@";
              goto LABEL_16;
            }
          }
          else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v13;
            v27 = v26;
            v28 = OS_LOG_TYPE_DEBUG;
            v29 = "Already existing file removed: %@";
LABEL_16:
            _os_log_impl((void *)&_mh_execute_header, v27, v28, v29, buf, 0xCu);
          }

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filePath"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URLByAppendingPathComponent:", v30));

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v44 = 0;
        objc_msgSend(v32, "copyItemAtURL:toURL:error:", v31, v13, &v44);
        v33 = v44;

        v34 = sub_10043292C();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        v36 = v35;
        if (v33)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v33;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Move file error: %@", buf, 0xCu);
          }

          objc_msgSend(v40, "addObject:", v11);
        }
        else
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v13;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "File moved: %@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v9);
  }

  v37 = objc_msgSend(v40, "copy");
  return v37;
}

+ (void)copyWebBundleFilesToDirectory:(id)a3 fromDirectory:(id)a4 webBundleManifest:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_10043292C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    *(_DWORD *)buf = 138412546;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Moving on-device files to writable directory: %@, from directory: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v34 = 0;
    objc_msgSend(v19, "removeItemAtURL:error:", v9, &v34);
    v20 = v34;

    v21 = sub_10043292C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v20;
        v24 = "Error removing directory %@";
        v25 = v23;
        v26 = OS_LOG_TYPE_ERROR;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v9;
      v24 = "Removed web bundle at directory: %@";
      v25 = v23;
      v26 = OS_LOG_TYPE_DEBUG;
      goto LABEL_9;
    }

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "files"));
  v28 = +[WebBundleFileHelper copyToDirectory:fromDirectory:files:](WebBundleFileHelper, "copyToDirectory:fromDirectory:files:", v9, v10, v27);

  v29 = objc_msgSend(v28, "count");
  v30 = sub_10043292C();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = v31;
  if (v29)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't move files: %@", buf, 0xCu);
    }

    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.ReportAProblem.Downloader"), -6, 0)));
    *a6 = v32;
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    *(_DWORD *)buf = 138412290;
    v36 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Successfully copy web bundle files to directory: %@", buf, 0xCu);

  }
}

@end
