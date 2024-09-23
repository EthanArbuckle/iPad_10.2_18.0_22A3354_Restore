@implementation MSDManifest

- (MSDManifest)init
{
  MSDManifest *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dict;
  NSString *rootPath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDManifest;
  v2 = -[MSDManifest init](&v7, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
    dict = v2->_dict;
    v2->_dict = v3;

    rootPath = v2->_rootPath;
    v2->_rootPath = 0;

  }
  return v2;
}

- (MSDManifest)initWithDictionary:(id)a3
{
  return -[MSDManifest initWithDictionary:andUserHomePath:](self, "initWithDictionary:andUserHomePath:", a3, 0);
}

- (MSDManifest)initWithDictionary:(id)a3 andUserHomePath:(id)a4
{
  id v5;
  MSDManifest *v6;
  MSDManifest *v7;
  NSString *rootPath;
  NSMutableDictionary *v9;
  NSMutableDictionary *dict;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDManifest;
  v6 = -[MSDManifest init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    rootPath = v6->_rootPath;
    v6->_rootPath = 0;

    v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v5);
    dict = v7->_dict;
    v7->_dict = v9;

  }
  return v7;
}

- (void)dealloc
{
  NSMutableDictionary *dict;
  NSString *rootPath;
  objc_super v5;

  dict = self->_dict;
  self->_dict = 0;

  rootPath = self->_rootPath;
  self->_rootPath = 0;

  v5.receiver = self;
  v5.super_class = (Class)MSDManifest;
  -[MSDManifest dealloc](&v5, "dealloc");
}

- (id)metadataForFile:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", a3));
  v5 = objc_opt_class(NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileMetaDataWithMetadataDictionary:](MSDFileMetadata, "fileMetaDataWithMetadataDictionary:", v3));
  else
    v6 = 0;

  return v6;
}

- (void)setMetadata:(id)a3 forFile:(id)a4
{
  NSMutableDictionary *dict;
  id v6;
  id v7;

  dict = self->_dict;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dict"));
  -[NSMutableDictionary setObject:forKey:](dict, "setObject:forKey:", v7, v6);

}

- (BOOL)folder:(id)a3 contains:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v6, "rangeOfString:", v11, (_QWORD)v17))
        {
          v13 = v12;
          if (v12 == objc_msgSend(v6, "length")
            || (v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", v13)),
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v14)),
                (id)v14,
                LOBYTE(v14) = objc_msgSend(v15, "isEqualToString:", v6),
                v15,
                (v14 & 1) != 0))
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v8;
}

- (BOOL)addFilesUsingSourceManifest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  char v33;
  NSObject *obj;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v4 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_claimAutoreleasedReturnValue(-[MSDManifest rootPath](self, "rootPath"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootPath"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest rootPath](self, "rootPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootPath"));
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) != 0)
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        obj = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dict"));
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v12)
        {
          v13 = v12;
          v32 = v4;
          v35 = *(_QWORD *)v38;
          v33 = 1;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v38 != v35)
                objc_enumerationMutation(obj);
              v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14);
              v16 = objc_autoreleasePoolPush();
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest rootPath](self, "rootPath"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", v15));

              if (objc_msgSend(v36, "fileExistsAtPath:", v18))
              {
                v19 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileMetadatatWithPath:](MSDFileMetadata, "fileMetadatatWithPath:", v18));
                if (v19)
                {
                  v20 = v19;
                  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject getFileType](v19, "getFileType"));
                  v22 = objc_msgSend(v21, "isEqualToString:", NSFileTypeSymbolicLink);

                  if (v22)
                  {
                    v24 = sub_1000604F0();
                    v25 = objc_claimAutoreleasedReturnValue(v24);
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v42 = "-[MSDManifest addFilesUsingSourceManifest:]";
                      v43 = 2114;
                      v44 = v18;
                      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is a symlink. Skipping.", buf, 0x16u);
                    }

                  }
                  else
                  {
                    -[MSDManifest setMetadata:forFile:](self, "setMetadata:forFile:", v20, v15);
                  }
                }
                else
                {
                  v23 = sub_1000604F0();
                  v20 = objc_claimAutoreleasedReturnValue(v23);
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v42 = "-[MSDManifest addFilesUsingSourceManifest:]";
                    v43 = 2114;
                    v44 = v18;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to get metadata for file: %{public}@. Skipping.", buf, 0x16u);
                  }
                  v33 = 0;
                }

              }
              objc_autoreleasePoolPop(v16);
              v14 = (char *)v14 + 1;
            }
            while (v13 != v14);
            v26 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            v13 = v26;
          }
          while (v26);
          v4 = v32;
          v27 = v33;
        }
        else
        {
          v27 = 1;
        }
        goto LABEL_29;
      }
    }
    else
    {

    }
  }
  v28 = sub_1000604F0();
  obj = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    sub_1000C0E3C(obj, v29, v30);
  v27 = 0;
LABEL_29:

  return v27 & 1;
}

- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5
{
  return -[MSDManifest addFilesFromPath:relativeTo:skip:superSet:](self, "addFilesFromPath:relativeTo:skip:superSet:", a3, a4, a5, 0);
}

- (BOOL)addFilesFromPath:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6
{
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C704;
  v7[3] = &unk_10013EC08;
  v7[4] = self;
  return -[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:](self, "enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:", a3, a4, a5, a6, v7);
}

- (BOOL)path:(id)a3 inSuperSet:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("/private")))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length")));

    v5 = (id)v7;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "hasPrefix:", v5, (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v9;
}

- (BOOL)enumerateAndCollectMetaData:(id)a3 relativeTo:(id)a4 skip:(id)a5 superSet:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  unsigned __int8 v37;
  id v38;
  unsigned __int8 v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  char *v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  id v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  uint64_t v70;
  __CFString *v71;
  NSString **p_rootPath;
  uint64_t (**v73)(_QWORD, void *, __CFString *);
  void *v74;
  id v75;
  id v76;
  MSDManifest *v77;
  char v78;
  NSObject *v79;
  void *context;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint8_t v87[4];
  uint64_t v88;
  uint8_t buf[4];
  NSURLResourceKey v90;
  __int16 v91;
  void *v92;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (self->_rootPath)
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_1000C0FB4(v19);
    v20 = 0;
    goto LABEL_55;
  }
  v77 = self;
  p_rootPath = &self->_rootPath;
  v73 = (uint64_t (**)(_QWORD, void *, __CFString *))v16;
  v69 = v13;
  objc_storeStrong((id *)&self->_rootPath, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v75 = v12;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v12));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsRegularFileKey, NSURLIsSymbolicLinkKey, 0));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v22, v23, 0, &stru_10013EC48));

  v79 = v24;
  v25 = objc_claimAutoreleasedReturnValue(-[NSObject nextObject](v24, "nextObject"));
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v74 = 0;
  v78 = 0;
  v30 = v25 == 0;
  v76 = v15;
  while (1)
  {
    v31 = v14;
    v32 = v28;
    v33 = v27;
    v34 = v26;
    context = objc_autoreleasePoolPush();
    v19 = v25;
    if (v30)
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v75));
      v78 = 1;
    }
    v85 = 0;
    v86 = 0;
    v35 = -[NSObject getResourceValue:forKey:error:](v19, "getResourceValue:forKey:error:", &v86, NSURLIsRegularFileKey, &v85);
    v27 = v86;

    v36 = v85;
    if ((v35 & 1) == 0)
    {
      v58 = sub_1000604F0();
      v56 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
        *(_DWORD *)buf = 138543618;
        v90 = NSURLIsRegularFileKey;
        v91 = 2114;
        v92 = v62;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Could not get resource for key %{public}@ for %{public}@", buf, 0x16u);

      }
      v71 = 0;
      goto LABEL_42;
    }
    v83 = 0;
    v84 = 0;
    v37 = -[NSObject getResourceValue:forKey:error:](v19, "getResourceValue:forKey:error:", &v84, NSURLIsDirectoryKey, &v83);
    v26 = v84;

    v38 = v83;
    if ((v37 & 1) == 0)
    {
      v59 = sub_1000604F0();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v71 = 0;
        v36 = v38;
        v34 = v26;
        v56 = v60;
        goto LABEL_42;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
      *(_DWORD *)buf = 138543618;
      v90 = NSURLIsDirectoryKey;
      v91 = 2114;
      v92 = v63;
      _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Could not get resource for key %{public}@ for %{public}@", buf, 0x16u);

      v71 = 0;
      v36 = v38;
      v56 = v60;
LABEL_41:
      v34 = v26;
LABEL_42:

      v29 = v36;
      v28 = v32;
      v26 = v34;
      v14 = v31;
      v15 = v76;
      v54 = context;
      v53 = v71;
      goto LABEL_35;
    }
    v82 = 0;
    v81 = 0;
    v39 = -[NSObject getResourceValue:forKey:error:](v19, "getResourceValue:forKey:error:", &v82, NSURLIsSymbolicLinkKey, &v81);
    v28 = v82;

    v29 = v81;
    if ((v39 & 1) == 0)
    {
      v61 = sub_1000604F0();
      v56 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
        *(_DWORD *)buf = 138543618;
        v90 = NSURLIsSymbolicLinkKey;
        v91 = 2114;
        v92 = v57;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Could not get resource for key %{public}@ for %{public}@", buf, 0x16u);
LABEL_38:

      }
LABEL_39:
      v71 = 0;
LABEL_40:
      v36 = v29;
      v32 = v28;
      goto LABEL_41;
    }
    v14 = v31;
    v15 = v76;
    if (v31
      && (v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path")),
          v41 = -[MSDManifest folder:contains:](v77, "folder:contains:", v31, v40),
          v40,
          v41)
      || v76
      && (v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path")),
          v43 = -[MSDManifest path:inSuperSet:](v77, "path:inSuperSet:", v42, v76),
          v42,
          (v43 & 1) == 0))
    {
      if ((objc_msgSend(v26, "BOOLValue") & 1) != 0)
        -[NSObject skipDescendants](v79, "skipDescendants");
      v44 = context;
      goto LABEL_18;
    }
    if ((objc_msgSend(v27, "BOOLValue") & 1) == 0
      && (objc_msgSend(v26, "BOOLValue") & 1) == 0
      && !objc_msgSend(v28, "BOOLValue"))
    {
      v55 = sub_1000604F0();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
        *(_DWORD *)buf = 138543362;
        v90 = (NSURLResourceKey)v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ is special file. Leave it along", buf, 0xCu);
        goto LABEL_38;
      }
      goto LABEL_39;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
    v46 = (char *)objc_msgSend(v45, "rangeOfString:", *p_rootPath);
    v70 = v47;

    if (v46)
    {
      if (v46 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = 0;
        goto LABEL_29;
      }
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "substringFromIndex:", &v46[v70]));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringByReplacingOccurrencesOfString:withString:", *p_rootPath, &stru_100141020));

      v49 = v68;
    }
    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByReplacingOccurrencesOfString:withString:", *p_rootPath, &stru_100141020));
    }

LABEL_29:
    if (-[__CFString length](v48, "length"))
    {
      v71 = v48;
    }
    else
    {

      v71 = CFSTR("/");
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v19, "path"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileMetadatatWithPath:](MSDFileMetadata, "fileMetadatatWithPath:", v51));

    if (!v52)
    {
      v64 = sub_1000604F0();
      v56 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_1000C0EB4(v87, v19, &v88, v56);
      v74 = 0;
      goto LABEL_40;
    }
    v53 = v71;
    if ((v73[2](v73, v52, v71) & 1) == 0)
      break;
    v74 = v52;
    v54 = context;
LABEL_35:

    v44 = v54;
LABEL_18:
    objc_autoreleasePoolPop(v44);
    v25 = objc_claimAutoreleasedReturnValue(-[NSObject nextObject](v79, "nextObject"));

    v30 = v25 == 0;
    if (((v25 == 0) & v78) != 0)
    {

      v20 = 1;
      v19 = v79;
      goto LABEL_54;
    }
  }
  v66 = sub_1000604F0();
  v67 = objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    sub_1000C0F28(v19, v67);

  objc_autoreleasePoolPop(context);
  v20 = 0;
LABEL_54:
  v12 = v75;
  v13 = v69;
  v17 = v73;
LABEL_55:

  return v20;
}

- (NSSet)pathSet
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_dict, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
