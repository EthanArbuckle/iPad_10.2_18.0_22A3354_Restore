@implementation WhitelistChecker

- (WhitelistChecker)init
{
  WhitelistChecker *v2;
  WhitelistChecker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WhitelistChecker;
  v2 = -[WhitelistChecker init](&v5, "init");
  v3 = v2;
  if (v2)
    -[WhitelistChecker setDomainsPlistFilePath:](v2, "setDomainsPlistFilePath:", CFSTR("/System/Library/PrivateFrameworks/MobileBackup.framework/Domains.plist"));
  return v3;
}

- (BOOL)load
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v4 = objc_msgSend(v3, "macOS");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByStandardizingPath"));
    v40[0] = v5;
    v40[1] = CFSTR("/Library/Apple");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    -[WhitelistChecker setBlackListedPaths:](self, "setBlackListedPaths:", v7);

    return 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v8, "iOS"))
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v10 = objc_msgSend(v9, "rOS");

    if (!v10)
    {
      v17 = sub_10001BCB8();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[WhitelistChecker setDomains:](self, "setDomains:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
      if (v19)
        return 1;
      v31 = sub_100024A40();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10002FE9C(v32, v33, v34, v35, v36, v37, v38, v39);

      return 0;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domainsPlistFilePath](self, "domainsPlistFilePath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDomainsPlistPatcher patchDomainsPlist:](MSDDomainsPlistPatcher, "patchDomainsPlist:", v11));
  if (v12 && (v13 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("SystemDomains")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v14));
    -[WhitelistChecker setDomains:](self, "setDomains:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
    if (v16)
    {

      return 1;
    }
    v23 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10002FE68(v22, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    v21 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10002FDF8((uint64_t)v11, v22);
  }

  return 0;
}

- (BOOL)loadFromFile:(id)a3
{
  -[WhitelistChecker setDomainsPlistFilePath:](self, "setDomainsPlistFilePath:", a3);
  return -[WhitelistChecker load](self, "load");
}

- (id)checkManifest:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  __int128 v7;
  __objc2_class *v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v23;
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (!v26)
    goto LABEL_20;
  v25 = *(_QWORD *)v28;
  v8 = MSDHSnapshottedDataSaver;
  *(_QWORD *)&v7 = 136315394;
  v23 = v7;
  v24 = v6;
  do
  {
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v25)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v10, v23));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker getRealPathForFile:withMetaData:](self, "getRealPathForFile:withMetaData:", v10, v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v8[1], "sharedInstance"));
      v14 = objc_msgSend(v13, "macOS");

      if (v14)
      {
        if (-[WhitelistChecker checkFile_macOS:withMetaData:](self, "checkFile_macOS:withMetaData:", v12, v11))
          goto LABEL_18;
        goto LABEL_15;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v8[1], "sharedInstance"));
      if (objc_msgSend(v15, "iOS"))
      {

LABEL_12:
        v18 = -[WhitelistChecker checkFile_iOS:withMetaData:](self, "checkFile_iOS:withMetaData:", v12, v11);
        goto LABEL_14;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v8[1], "sharedInstance"));
      v17 = objc_msgSend(v16, "rOS");

      if (v17)
        goto LABEL_12;
      v18 = -[WhitelistChecker checkFile_WatchAndTV:withMetaData:](self, "checkFile_WatchAndTV:withMetaData:", v12, v11);
LABEL_14:
      v6 = v24;
      v8 = MSDHSnapshottedDataSaver;
      if ((v18 & 1) != 0)
        goto LABEL_18;
LABEL_15:
      v19 = sub_100024A40();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v23;
        v32 = "-[WhitelistChecker checkManifest:]";
        v33 = 2114;
        v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%{public}@ failed the check.", buf, 0x16u);
      }

      -[NSMutableArray addObject:](v5, "addObject:", v10);
LABEL_18:

    }
    v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  }
  while (v26);
LABEL_20:

  if (-[NSMutableArray count](v5, "count"))
    v21 = -[NSMutableArray copy](v5, "copy");
  else
    v21 = 0;

  return v21;
}

- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker blackListedPaths](self, "blackListedPaths"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7 ^ 1;
}

- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  int v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  id v35;
  WhitelistChecker *v36;
  id obj;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var/mobile/Media"), CFSTR("/var/mobile/Library/Backup/SystemContainers/"), CFSTR("/var/mobile/Library/IdentityServices/Persistence/DoNotBackup"), CFSTR("/var/root/Library/Backup/SystemContainers/"), CFSTR("/var/wireless/Library/Preferences/com.apple.awdd.persistent.plist"), CFSTR("/var/wireless/Library/Preferences/com.apple.awdd.plist"), CFSTR("/var/MobileSoftwareUpdate/.MAAMigrated.plist"), 0));
  if (!-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v8)
    && !-[WhitelistChecker annotated:](self, "annotated:", v7))
  {
    v34 = v8;
    v35 = v7;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (!v40)
    {
      v41 = 0;
      v10 = 0;
      v42 = 0;
      goto LABEL_33;
    }
    v42 = 0;
    v41 = 0;
    v10 = 0;
    v39 = *(_QWORD *)v45;
    v38 = v6;
    v36 = self;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RootPath")));
        if (!v16)
        {
          v30 = sub_100024A40();
          v28 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "No root path find in domain %{public}@", buf, 0xCu);
          }
          v18 = 0;
          v27 = 0;
          goto LABEL_16;
        }
        v43 = v13;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore")));
        v18 = objc_msgSend(v17, "mutableCopy");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted")));
        objc_msgSend(v18, "addObjectsFromArray:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToRestoreOnly")));
        objc_msgSend(v18, "addObjectsFromArray:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToBackupToDriveAndStandardAccount")));
        objc_msgSend(v18, "addObjectsFromArray:", v21);

        v22 = objc_claimAutoreleasedReturnValue(-[WhitelistChecker createFullPathList:rootPath:isAllowList:](self, "createFullPathList:rootPath:isAllowList:", v18, v16, 1));
        if (!v22)
        {
          v31 = sub_100024A40();
          v28 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot create allow list for domain %{public}@", buf, 0xCu);
          }
          v27 = 0;
          v10 = 0;
          v13 = v43;
          goto LABEL_16;
        }
        if (-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v22))
        {
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsNotToRestore")));

          v24 = objc_claimAutoreleasedReturnValue(-[WhitelistChecker createFullPathList:rootPath:isAllowList:](self, "createFullPathList:rootPath:isAllowList:", v23, v16, 0));
          if (-[WhitelistChecker file:blacklisted:](self, "file:blacklisted:", v6, v24))
          {
            v25 = sub_100024A40();
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v49 = v6;
              v50 = 2114;
              v51 = v12;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ is black listed in %{public}@", buf, 0x16u);
            }
            v42 = 1;
            v18 = (id)v23;
            v27 = 1;
            v41 = (void *)v24;
            v10 = (void *)v22;
            v13 = v43;
            v28 = v26;
            self = v36;
LABEL_16:

            v29 = 0;
            goto LABEL_20;
          }
          v29 = 0;
          v42 = 1;
          v18 = (id)v23;
          v27 = 1;
          v41 = (void *)v24;
        }
        else
        {
          v29 = 1;
          v27 = v42;
        }
        v10 = (void *)v22;
        v13 = v43;
LABEL_20:

        objc_autoreleasePoolPop(v13);
        if (!v29)
        {
          v42 = v27;
          v6 = v38;
          goto LABEL_33;
        }
        v11 = (char *)v11 + 1;
        v6 = v38;
      }
      while (v40 != v11);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      v40 = v32;
      if (!v32)
      {
LABEL_33:

        v8 = v34;
        v7 = v35;
        v9 = v41;
        goto LABEL_34;
      }
    }
  }
  v9 = 0;
  v10 = 0;
  v42 = 1;
LABEL_34:

  return v42 & 1;
}

- (BOOL)checkFile_WatchAndTV:(id)a3 withMetaData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ContentRootDomain")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var/mobile/Media"), CFSTR("/var/containers/"), 0));
  objc_msgSend(v10, "addObject:", CFSTR("/var/mobile/Library/"));
  if (-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v11)
    || -[WhitelistChecker annotated:](self, "annotated:", v7))
  {
    v12 = 1;
  }
  else
  {
    v12 = -[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v10);
  }

  return v12;
}

- (BOOL)annotated:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  _UNKNOWN **v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  BOOL v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v4, "iOS"))
  {

    v5 = CFSTR("MBRestoreAnnotation");
    v6 = &off_10004DFE8;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v8 = objc_msgSend(v7, "rOS");

    if (v8)
      v6 = &off_10004DFE8;
    else
      v6 = &off_10004E000;
    if (v8)
      v5 = CFSTR("MBRestoreAnnotation");
    else
      v5 = CFSTR("MSDAnnotation");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MSDManifestFileExtendedAttributes")));

  v13 = 0;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v5));
      v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v10, 4);
      v12 = objc_msgSend(v6, "containsObject:", v11);

      if ((v12 & 1) != 0)
        v13 = 1;
    }
  }

  return v13;
}

- (id)createFullPathList:(id)a3 rootPath:(id)a4 isAllowList:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v19;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v19 = a5;
  v6 = a3;
  v21 = a4;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("#")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15));

        if (objc_msgSend(v16, "length"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v16));
          objc_msgSend(v22, "addObject:", v17);

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  if (v19 && !objc_msgSend(v22, "count"))
    objc_msgSend(v22, "addObject:", v21);

  return v22;
}

- (BOOL)file:(id)a3 whitelisted:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (_QWORD)v14) || !objc_msgSend(v11, "rangeOfString:", v5))
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (BOOL)file:(id)a3 blacklisted:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  unsigned __int8 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (_QWORD)v20))
        {
          v13 = v12;
          v14 = objc_msgSend(v5, "length");
          if (v14 == objc_msgSend(v11, "length"))
          {
            v16 = 1;
            goto LABEL_14;
          }
          v15 = objc_msgSend(v5, "length");
          if (v15 > objc_msgSend(v11, "length"))
          {
            v16 = 1;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v13, 1));
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/"));

            if ((v18 & 1) != 0)
              goto LABEL_14;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (id)getRealPathForFile:(id)a3 withMetaData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForKey:", CFSTR("MSDManifestFileAttributes")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("NSFileType")));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileTypeRegular")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileTypeDirectory")))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByStandardizingPath"));
    if ((objc_msgSend(v5, "isEqualToString:", v8) & 1) == 0)
    {
      v9 = sub_100024A40();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_10002FED0((uint64_t)v5, (uint64_t)v8, v10);

    }
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)shouldRestoreSystemContainer_iOS:(id)a3 shared:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;

  v4 = a4;
  v5 = a3;
  v21 = 0;
  v20 = 0;
  if (v4)
    v6 = 13;
  else
    v6 = 12;
  v7 = objc_retainAutorelease(v5);
  v8 = container_create_or_lookup_path_for_current_user(v6, objc_msgSend(v7, "cStringUsingEncoding:", 4), 0, 0, &v20, &v21);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  if (v8)
    v13 = v20 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("file://%s"), v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](NSURL, "fileURLWithString:", v11));
    v19 = 0;
    v18 = 0;
    v14 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v19, NSURLIsExcludedFromBackupKey, &v18);
    v9 = v19;
    v10 = v18;
    if (v14)
    {
      if (objc_msgSend(v9, "BOOLValue"))
      {
        v15 = sub_100024A40();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[WhitelistChecker shouldRestoreSystemContainer_iOS:shared:]";
          v24 = 2114;
          v25 = v7;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:Container check failed for %{public}@. But still restoring.", buf, 0x16u);
        }

      }
    }
  }

  return 1;
}

- (BOOL)shouldRestoreSystemContainer_WatchAndTV:(id)a3 shared:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WhitelistChecker domains](self, "domains"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("SystemContainerDomain")));

  LOBYTE(v6) = objc_msgSend(v7, "containsObject:", v5);
  return (char)v6;
}

- (BOOL)handleSystemContainerFiles:(id)a3 withMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  _BOOL8 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  id v32;
  NSObject *v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v8 = objc_msgSend(v7, "iOS");

  v9 = v8 == 0;
  if (v8)
    v10 = &off_10004E018;
  else
    v10 = &off_10004E048;
  if (v8)
    v11 = &off_10004E030;
  else
    v11 = &off_10004E060;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  if (v9)
    v12 = 6;
  else
    v12 = 8;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16, self);
  v36 = (id)v12;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "rangeOfString:", v17) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = v6;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v17, &stru_100049858));
          v20 = 1;
          goto LABEL_20;
        }
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = v6;
  v19 = 0;
  v20 = 0;
LABEL_20:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    while (2)
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v11);
        v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v5, "rangeOfString:", v25) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v25, &stru_100049858));

          v26 = 0;
          v19 = (void *)v28;
          goto LABEL_31;
        }
      }
      v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v22)
        continue;
      break;
    }
  }
  v26 = 1;
  if (!v20)
  {
    v27 = 0;
    goto LABEL_36;
  }
LABEL_31:
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/")));
  if (objc_msgSend(v27, "count") != v36 || (objc_msgSend(v35, "annotated:", v18) & 1) != 0)
  {
LABEL_35:
    LOBYTE(v26) = 1;
    goto LABEL_36;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v30 = objc_msgSend(v29, "iOS");

  if (v30)
  {
    if ((objc_msgSend(v35, "shouldRestoreSystemContainer_iOS:shared:", v19, v26) & 1) != 0)
      goto LABEL_35;
  }
  else if ((objc_msgSend(v35, "shouldRestoreSystemContainer_WatchAndTV:shared:", v19, v26) & 1) != 0)
  {
    goto LABEL_35;
  }
  v32 = sub_100024A40();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    sub_10002FF50((uint64_t)v5, v33);

  LOBYTE(v26) = 0;
LABEL_36:

  return v26;
}

- (NSSet)blackListedPaths
{
  return self->_blackListedPaths;
}

- (void)setBlackListedPaths:(id)a3
{
  objc_storeStrong((id *)&self->_blackListedPaths, a3);
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (NSString)domainsPlistFilePath
{
  return self->_domainsPlistFilePath;
}

- (void)setDomainsPlistFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_domainsPlistFilePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsPlistFilePath, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_blackListedPaths, 0);
}

@end
