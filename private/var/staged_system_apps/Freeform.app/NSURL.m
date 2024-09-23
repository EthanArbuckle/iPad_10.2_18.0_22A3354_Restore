@implementation NSURL

- (NSString)crl_UTI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crl_pathUTI"));

  return (NSString *)v3;
}

- (BOOL)crl_conformsToUTI:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](self, "pathExtension"));
  v6 = objc_msgSend(v5, "crl_pathExtensionConformsToUTI:", v4);

  return v6;
}

- (BOOL)crl_conformsToAnyUTI:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](self, "pathExtension"));
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UTType typesWithTag:tagClass:conformingToType:](UTType, "typesWithTag:tagClass:conformingToType:", v5, UTTagClassFilenameExtension, 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v23 = v4;
      v21 = *(_QWORD *)v29;
      do
      {
        v10 = 0;
        v22 = v8;
        do
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v10);
          if ((objc_msgSend(v11, "isDynamic") & 1) == 0)
          {
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            v12 = v4;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v25;
              while (2)
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v25 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
                  LOBYTE(v17) = objc_msgSend(v18, "crl_conformsToUTI:", v17);

                  if ((v17 & 1) != 0)
                  {

                    v19 = 1;
                    v4 = v23;
                    goto LABEL_23;
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                if (v14)
                  continue;
                break;
              }
            }

            v8 = v22;
            v4 = v23;
            v9 = v21;
          }
          v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        v19 = 0;
      }
      while (v8);
    }
    else
    {
      v19 = 0;
    }
LABEL_23:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)crl_fileSize
{
  unint64_t v3;

  v3 = 0;
  -[NSURL crl_fileSize:error:](self, "crl_fileSize:error:", &v3, 0);
  return v3;
}

- (BOOL)crl_fileSize:(unint64_t *)a3 error:(id *)a4
{
  NSURL *v5;
  id v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  id v24;
  id v25;
  NSURL *v28;
  void *v29;
  NSObject *log;
  void *v31;
  id *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  NSURL *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];

  v5 = self;
  -[NSURL removeCachedResourceValueForKey:](self, "removeCachedResourceValueForKey:", NSURLFileSizeKey);
  v39 = 0;
  v28 = v5;
  LODWORD(v5) = -[NSURL getResourceValue:forKey:error:](v5, "getResourceValue:forKey:error:", &v39, NSURLFileSizeKey, 0);
  v6 = v39;
  v7 = v6;
  v8 = 0;
  if ((_DWORD)v5)
    v8 = (char *)objc_msgSend(v6, "unsignedLongLongValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v28, 0, 0, 0));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
  if (!v12)
  {
    v15 = 1;
    goto LABEL_24;
  }
  v13 = v12;
  v32 = a4;
  v14 = *(_QWORD *)v36;
  v15 = 1;
  do
  {
    v16 = 0;
    do
    {
      v17 = v7;
      if (*(_QWORD *)v36 != v14)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v16);
      objc_msgSend(v18, "removeCachedResourceValueForKey:", NSURLFileSizeKey);
      v33 = 0;
      v34 = 0;
      LODWORD(v18) = objc_msgSend(v18, "getResourceValue:forKey:error:", &v34, NSURLFileSizeKey, &v33);
      v7 = v34;

      v19 = v33;
      if ((_DWORD)v18)
      {
        v8 = &v8[(_QWORD)objc_msgSend(v7, "unsignedLongLongValue")];
        goto LABEL_17;
      }
      if ((v15 & 1) != 0)
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_10123F910);
        v15 = (char)v32;
        v20 = off_1013D9068;
        if (!os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        {
          if (!v32)
            goto LABEL_17;
LABEL_15:
          v15 = 0;
          *v32 = objc_retainAutorelease(v19);
          goto LABEL_17;
        }
        log = v20;
        objc_opt_class(v19, v21);
        v23 = NSStringFromClass(v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domain"));
        v24 = objc_msgSend(v19, "code");
        *(_DWORD *)buf = 138413314;
        v41 = v28;
        v42 = 2114;
        v43 = v31;
        v44 = 2114;
        v45 = v29;
        v46 = 2048;
        v47 = v24;
        v48 = 2112;
        v49 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to get NSURLFileSizeKey for URL: \"%@\". errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);

        if (v32)
          goto LABEL_15;
      }
      else
      {
        v15 = 0;
      }
LABEL_17:

      v16 = (char *)v16 + 1;
    }
    while (v13 != v16);
    v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
    v13 = v25;
  }
  while (v25);
LABEL_24:

  if (a3)
    *a3 = (unint64_t)v8;

  return v15 & 1;
}

- (id)crl_fileTypeIdentifierHandlingFileCoordinationPromises
{
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unsigned __int8 v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15 = 0;
  v3 = -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v15, NSURLContentTypeKey, 0);
  v4 = v15;
  v19 = v3;
  if (!*((_BYTE *)v17 + 24))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_10019A604;
    v13 = sub_10019A614;
    v14 = 0;
    v5 = objc_alloc_init((Class)NSFileCoordinator);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10019A61C;
    v8[3] = &unk_10123F938;
    v8[4] = &v16;
    v8[5] = &v9;
    objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", self, 4, 0, v8);
    if (*((_BYTE *)v17 + 24))
    {
      v6 = (id)v10[5];

      v4 = v6;
    }

    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v16, 8);
  return v4;
}

- (id)crl_reachableFileURLByDeletingUnreachablePathComponents
{
  NSURL *v3;
  void *v4;
  id v5;
  NSURL *v6;
  uint64_t v7;

  if (-[NSURL isFileURL](self, "isFileURL"))
  {
    v3 = self;
    while (1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v3, "path"));
      v5 = objc_msgSend(v4, "length");

      if ((unint64_t)v5 < 3)
        break;
      if (-[NSURL checkResourceIsReachableAndReturnError:](v3, "checkResourceIsReachableAndReturnError:", 0))
      {
        v6 = v3;
        v3 = v6;
        if (v6)
          goto LABEL_10;
      }
      else
      {
        v7 = objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](v3, "URLByDeletingLastPathComponent"));

        v3 = (NSURL *)v7;
      }
    }
    v6 = 0;
LABEL_10:

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)crl_isInTemporaryDirectory
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  uint64_t v10;

  v10 = 2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crl_fileURLWithPath:](NSURL, "crl_fileURLWithPath:", v5));
  v7 = objc_msgSend(v3, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v10, v6, self, 0);
  if (v10)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (BOOL)crl_isInTrash
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  NSURL *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v29 = 0;
  v30 = 2;
  v4 = objc_msgSend(v3, "getRelationship:ofDirectory:inDomain:toItemAtURL:error:", &v30, 102, 0, self, &v29);
  v5 = v29;
  v6 = v5;
  if (v4)
  {
    v7 = v30 == 0;
    goto LABEL_22;
  }
  if (!v5)
    goto LABEL_19;
  if (!objc_msgSend(v5, "crl_isFeatureUnsupportedError"))
  {
    if ((objc_msgSend(v6, "crl_isNoSuchFileError") & 1) == 0)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_10123F958);
      v16 = off_1013D9068;
      v7 = 0;
      if (!os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v17 = v16;
      objc_opt_class(v6, v18);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v23 = objc_msgSend(v6, "code");
      *(_DWORD *)buf = 138413314;
      v32 = self;
      v33 = 2114;
      v34 = v21;
      v35 = 2114;
      v36 = v22;
      v37 = 2048;
      v38 = v23;
      v39 = 2112;
      v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to find relationship between URL and trash directory: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);

    }
LABEL_19:
    v7 = 0;
    goto LABEL_22;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self, "URLByDeletingLastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathComponents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reverseObjectEnumerator"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR(".Trash"), (_QWORD)v25) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_21;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      if (v13)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_21:

LABEL_22:
  return v7;
}

+ (id)crl_fileURLWithPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:"));
  else
    return 0;
}

- (void)crl_removeCachedResourceValueForKeys:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSURL removeCachedResourceValueForKey:](self, "removeCachedResourceValueForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)crl_pathExceptPrivate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crl_pathExceptPrivate"));

  return v3;
}

- (id)crl_URLExceptPrivate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL crl_pathExceptPrivate](self, "crl_pathExceptPrivate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v3, -[NSURL hasDirectoryPath](self, "hasDirectoryPath")));

  return v4;
}

- (BOOL)crl_matchesURL:(id)a3
{
  return -[NSURL crl_matchesURL:canCompareFileID:](self, "crl_matchesURL:canCompareFileID:", a3, 1);
}

- (BOOL)crl_matchesURL:(id)a3 canCompareFileID:(BOOL)a4
{
  _BOOL4 v4;
  NSURL *v6;
  NSURL *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  unsigned int v13;
  uint64_t v15;
  id v16;

  v4 = a4;
  v6 = (NSURL *)a3;
  v7 = v6;
  v8 = self == v6;
  if (v6 && self != v6)
  {
    if ((-[NSURL isEqual:](self, "isEqual:", v6) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      if (-[NSURL isFileURL](self, "isFileURL") && -[NSURL isFileURL](v7, "isFileURL"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL crl_pathExceptPrivate](self, "crl_pathExceptPrivate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL crl_pathExceptPrivate](v7, "crl_pathExceptPrivate"));
        v8 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v8 = 0;
      }
      if ((v8 & 1) == 0 && v4)
      {
        v16 = 0;
        v11 = -[NSURL getResourceValue:forKey:error:](self, "getResourceValue:forKey:error:", &v16, NSURLFileResourceIdentifierKey, 0);
        v12 = v16;
        v15 = 0;
        v13 = -[NSURL getResourceValue:forKey:error:](v7, "getResourceValue:forKey:error:", &v15, NSURLFileResourceIdentifierKey, 0);
        v8 = 0;
        if (v11 && v13)
          v8 = objc_msgSend(v12, "isEqual:", v15);

      }
    }
  }

  return v8;
}

- (BOOL)crl_canOpenURL
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("tel"));

  if (!v5)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL resourceSpecifier](self, "resourceSpecifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByRemovingPercentEncoding"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "invertedSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_stringByRemovingCharactersInSet:", v9));

  v11 = (unint64_t)objc_msgSend(v10, "length") > 2;
  return v11;
}

+ (id)crl_urlFromUserProvidedTelephoneString:(id)a3 withDataDetector:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet"));
  v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v9);

  if (objc_msgSend(v8, "length"))
    v11 = v10 == (id)0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
    goto LABEL_16;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10019A604;
  v31 = sub_10019A614;
  v32 = 0;
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("tel:")))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    v14 = (void *)v28[5];
    v28[5] = v13;
  }
  else
  {
    if ((objc_msgSend(v8, "containsString:", CFSTR(" ")) & 1) != 0)
      goto LABEL_12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("tel:"), "stringByAppendingString:", v8));
    v15 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
    v16 = (void *)v28[5];
    v28[5] = v15;

  }
LABEL_12:
  v17 = (void *)v28[5];
  if (!v17)
  {
    v18 = objc_msgSend(v8, "crl_range");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10019B13C;
    v26[3] = &unk_10123F9C0;
    v26[4] = &v27;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, v18, v19, v26);
    v17 = (void *)v28[5];
    if (!v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLFragmentAllowedCharacterSet](NSCharacterSet, "URLFragmentAllowedCharacterSet"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("tel:"), "stringByAppendingString:", v21));
      v23 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));
      v24 = (void *)v28[5];
      v28[5] = v23;

      v17 = (void *)v28[5];
    }
  }
  v12 = v17;
  _Block_object_dispose(&v27, 8);

LABEL_16:
  return v12;
}

- (id)crl_prettyStringFromTelephoneURL
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL resourceSpecifier](self, "resourceSpecifier"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingPercentEncoding"));

  if (v3)
    v4 = v3;
  else
    v4 = &stru_1012A72B0;
  v5 = v4;

  return v5;
}

+ (id)crl_URLWithStringDataOnPasteboard:(id)a3 itemSet:(id)a4 pasteboardType:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataForPasteboardType:inItemSet:", a5, a4));
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v8, "count") != (id)1)
    {
      v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F9E0);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E04B3C(v10, v8, v9);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123FA00);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSURL(CRLAdditions) crl_URLWithStringDataOnPasteboard:itemSet:pasteboardType:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSURL_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 306, 0, "Only pasting first item of %lu on pasteboard", objc_msgSend(v8, "count"));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    if (v14)
    {
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v14, 4);
      if (objc_msgSend(v15, "length"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v15));
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLs"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

      }
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CRLSandboxedURL)sandboxedURL
{
  return -[CRLSandboxedURL initWithURL:]([CRLSandboxedURL alloc], "initWithURL:", self);
}

@end
