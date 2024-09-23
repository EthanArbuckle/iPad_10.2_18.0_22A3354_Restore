@implementation MSDHFileMetadataRestore

- (MSDHFileMetadataRestore)initWithManifestUID:(id)a3 deviceUID:(id)a4
{
  id v6;
  id v7;
  MSDHFileMetadataRestore *v8;
  id v9;
  MSDHFileMetadataRestore *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSDHFileMetadataRestore;
  v8 = -[MSDHFileMetadataRestore init](&v12, "init");
  if (v8
    && (v9 = objc_alloc_init((Class)NSMutableSet),
        -[MSDHFileMetadataRestore setPathsToSkip:](v8, "setPathsToSkip:", v9),
        v9,
        -[MSDHFileMetadataRestore setManifestUID:](v8, "setManifestUID:", v6),
        -[MSDHFileMetadataRestore setDeviceUID:](v8, "setDeviceUID:", v7),
        -[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo](v8, "_gatherDeviceDemoUserAccountInfo")))
  {
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)restoreAttributesUnder:(id)a3 fromManifestData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MSDManifest *v15;
  void *v16;
  MSDManifest *v17;
  void *v18;
  NSObject *v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  NSObject *v26;
  MSDManifest *v27;
  id v28;
  MSDHFileMetadataRestore *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v9 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]";
    v37 = 2114;
    v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Restoring file attributes under: %{public}@", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore userHomePath](self, "userHomePath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore pathsToSkip](self, "pathsToSkip"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
  objc_msgSend(v13, "addObject:", v14);

  v15 = [MSDManifest alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore userHomePath](self, "userHomePath"));
  v17 = -[MSDManifest initWithDictionary:andUserHomePath:](v15, "initWithDictionary:andUserHomePath:", v7, v16);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest pathSet](v17, "pathSet"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));

    v20 = -[NSObject count](v19, "count");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C0FC;
    block[3] = &unk_100048F48;
    v30 = &v31;
    v26 = v19;
    v27 = v17;
    v28 = v6;
    v29 = self;
    dispatch_apply((size_t)v20, 0, block);
    v21 = *((_BYTE *)v32 + 24) != 0;

    v22 = v26;
  }
  else
  {
    v23 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10002D9A0(v22);
    v21 = 0;
  }

  _Block_object_dispose(&v31, 8);
  objc_autoreleasePoolPop(v8);

  return v21;
}

- (BOOL)_gatherDeviceDemoUserAccountInfo
{
  void *v3;
  passwd *v4;
  group *v5;
  group *v6;
  id v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  id v14;
  NSObject *v15;
  id v16;

  *__error() = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUID](self, "deviceUID"));
  v4 = getpwuid((uid_t)objc_msgSend(v3, "unsignedIntValue"));

  if (v4)
  {
    v5 = getgrgid(v4->pw_gid);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v4->pw_name);
      -[MSDHFileMetadataRestore setDeviceUserName:](self, "setDeviceUserName:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4->pw_gid));
      -[MSDHFileMetadataRestore setDeviceGID:](self, "setDeviceGID:", v8);

      v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v6->gr_name);
      -[MSDHFileMetadataRestore setDeviceGroupName:](self, "setDeviceGroupName:", v9);

      v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUserName](self, "deviceUserName"));
      v11 = NSHomeDirectoryForUser(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[MSDHFileMetadataRestore setUserHomePath:](self, "setUserHomePath:", v12);

      return 1;
    }
    v16 = sub_100024A40();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10002DB28(self, &v4->pw_gid, v15);
  }
  else
  {
    v14 = sub_100024A40();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10002DA4C(self, v15);
  }

  return 0;
}

- (id)_updateFileAttributesFromManifestData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v22;
  void *v24;
  id v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = a3;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if (v25)
  {
    v22 = *(_QWORD *)v29;
    while (2)
    {
      v8 = 0;
      v9 = v4;
      v10 = v5;
      v11 = v6;
      v12 = v7;
      do
      {
        v27 = v10;
        v13 = obj;
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        v15 = objc_autoreleasePoolPush();
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v14));

        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MSDManifestFileAttributes")));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore _updateFile:withAttributes:](self, "_updateFile:withAttributes:", v14, v6));

        if (!v7)
        {
          v19 = sub_100024A40();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_10002DC14();

          objc_autoreleasePoolPop(v15);
          v7 = 0;
          v17 = 0;
          v16 = v24;
          v18 = v27;
          goto LABEL_13;
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

        objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("MSDManifestFileAttributes"));
        objc_msgSend(v24, "setObject:forKey:", v5, v14);
        objc_autoreleasePoolPop(v15);
        v8 = (char *)v8 + 1;
        v9 = v4;
        v10 = v5;
        v11 = v6;
        v12 = v7;
      }
      while (v25 != v8);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v25)
        continue;
      break;
    }
  }

  v16 = v24;
  v17 = v24;
  v18 = v5;
  v13 = obj;
LABEL_13:

  return v17;
}

- (id)_updateFile:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSFileOwnerAccountID));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore manifestUID](self, "manifestUID"));
  v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore _updateFileAttributes:](self, "_updateFileAttributes:", v7));
  }
  else
  {
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10002DC80((uint64_t)v6, (uint64_t)v8, v13);

    v11 = v7;
  }
  v14 = v11;

  return v14;
}

- (id)_updateFileAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUserName](self, "deviceUserName"));
  objc_msgSend(v4, "setObject:forKey:", v5, NSFileOwnerAccountName);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceGID](self, "deviceGID"));
  objc_msgSend(v4, "setObject:forKey:", v6, NSFileGroupOwnerAccountID);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceGroupName](self, "deviceGroupName"));
  objc_msgSend(v4, "setObject:forKey:", v7, NSFileGroupOwnerAccountName);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHFileMetadataRestore deviceUID](self, "deviceUID"));
  objc_msgSend(v4, "setObject:forKey:", v8, NSFileOwnerAccountID);

  return v4;
}

- (NSMutableSet)pathsToSkip
{
  return self->_pathsToSkip;
}

- (void)setPathsToSkip:(id)a3
{
  objc_storeStrong((id *)&self->_pathsToSkip, a3);
}

- (NSString)userHomePath
{
  return self->_userHomePath;
}

- (void)setUserHomePath:(id)a3
{
  objc_storeStrong((id *)&self->_userHomePath, a3);
}

- (NSNumber)manifestUID
{
  return self->_manifestUID;
}

- (void)setManifestUID:(id)a3
{
  objc_storeStrong((id *)&self->_manifestUID, a3);
}

- (NSNumber)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
}

- (NSString)deviceUserName
{
  return self->_deviceUserName;
}

- (void)setDeviceUserName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUserName, a3);
}

- (NSNumber)deviceGID
{
  return self->_deviceGID;
}

- (void)setDeviceGID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGID, a3);
}

- (NSString)deviceGroupName
{
  return self->_deviceGroupName;
}

- (void)setDeviceGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGroupName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroupName, 0);
  objc_storeStrong((id *)&self->_deviceGID, 0);
  objc_storeStrong((id *)&self->_deviceUserName, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_manifestUID, 0);
  objc_storeStrong((id *)&self->_userHomePath, 0);
  objc_storeStrong((id *)&self->_pathsToSkip, 0);
}

@end
