@implementation SKAPFSContainerDisk

- (BOOL)_cacheInfo
{
  SKAPFSContainerDisk *v2;
  void *v3;
  _BOOL4 v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;

  v2 = self;
  objc_sync_enter(v2);
  v11.receiver = v2;
  v11.super_class = (Class)SKAPFSContainerDisk;
  if (!-[SKAPFSContainerDisk _cacheInfo](&v11, "_cacheInfo"))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((-[SKAPFSContainerDisk isLiveFSAPFSDisk](v2, "isLiveFSAPFSDisk") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk mediaUUID](v2, "mediaUUID"));
    v4 = v3 == 0;

    if (v4)
    {
      v7 = sub_10000BA9C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](v2, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v13 = "-[SKAPFSContainerDisk(Daemon) _cacheInfo]";
        v14 = 2114;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: APFS container %{public}@ has no UUID", buf, 0x16u);

      }
      goto LABEL_8;
    }
  }
  v5 = -[SKAPFSContainerDisk copyDesignatedPhysicalStoreUUID](v2, "copyDesignatedPhysicalStoreUUID");
  -[SKAPFSContainerDisk setDesignatedPSUUID:](v2, "setDesignatedPSUUID:", v5);

  -[SKAPFSContainerDisk setRole:](v2, "setRole:", kSKDiskRoleStorageImplementation);
  -[SKAPFSContainerDisk setType:](v2, "setType:", kSKDiskTypeAPFSContainer);
  -[SKAPFSContainerDisk setSupportsVerify:](v2, "setSupportsVerify:", 1);
  -[SKAPFSContainerDisk setSupportsRepair:](v2, "setSupportsRepair:", 1);
  -[SKAPFSContainerDisk setFilesystem:](v2, "setFilesystem:", 0);
  -[SKAPFSContainerDisk setFilesystemType:](v2, "setFilesystemType:", kSKDiskFileSystemUndefined);
  v6 = 1;
LABEL_9:
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  SKAPFSContainerDisk *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  char *v13;

  v3 = self;
  objc_sync_enter(v3);
  if ((-[SKAPFSContainerDisk isLiveFSAPFSDisk](v3, "isLiveFSAPFSDisk") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](v3, "diskIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](v3, "diskIdentifier"));
    v6 = +[SKAPFSContainerDisk copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:](SKAPFSContainerDisk, "copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:", v4, v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("size")));
    -[SKAPFSContainerDisk setTotalSpace:](v3, "setTotalSpace:", sub_10000FC5C(v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("used")));
    v9 = sub_10000FC5C(v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reserve")));
    v11 = sub_10000FC5C(v10);

    v12 = (unint64_t)v9 + (_QWORD)v11;
    if ((unint64_t)-[SKAPFSContainerDisk totalSpace](v3, "totalSpace") <= v12)
      v13 = 0;
    else
      v13 = (char *)-[SKAPFSContainerDisk totalSpace](v3, "totalSpace") - v12;
    -[SKAPFSContainerDisk setAvailableSpace:](v3, "setAvailableSpace:", v13);
    -[SKAPFSContainerDisk setFreeSpace:](v3, "setFreeSpace:", v13);

  }
  objc_sync_exit(v3);

  return 1;
}

- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3
{
  -[SKAPFSContainerDisk setIsWholeDisk:](self, "setIsWholeDisk:", 1);
}

+ (id)copyPhysicalStoresMediaWithDADisk:(id)a3
{
  id v3;
  void *v4;
  SKIOMedia *v5;
  SKIOMedia *v6;
  id v7;
  void *v8;
  id v9;
  SKIOMedia *v10;
  SKIOMedia *v11;
  SKIOMedia *v12;
  id v13;
  id v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v3);
  v6 = v5;
  if (v5)
  {
    v7 = -[SKIOObject copyParent](v5, "copyParent");
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "newIteratorWithOptions:", 2);
      v10 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v9);
      if (v10)
      {
        v11 = v10;
        do
        {
          if (objc_msgSend(v9, "invalidated"))
            objc_msgSend(v4, "removeAllObjects");
          if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), "IOMedia"))
            objc_msgSend(v4, "addObject:", v11);
          v12 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v9);

          v11 = v12;
        }
        while (v12);
      }
      v13 = v4;

    }
    else
    {
      v15 = v4;
    }

  }
  else
  {
    v14 = v4;
  }

  return v4;
}

- (id)copyPhysicalStoresIOMedia
{
  SKIOMedia *v3;
  void *v4;
  SKIOMedia *v5;
  void *v6;
  void *v7;
  id v8;
  SKIOMedia *v10;

  if (-[SKAPFSContainerDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    v3 = [SKIOMedia alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk daDisk](self, "daDisk"));
    v5 = -[SKIOMedia initWithDADisk:](v3, "initWithDADisk:", v4);

    if (v5)
    {
      v10 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    }
    else
    {
      v6 = &__NSArray0__struct;
    }

    return v6;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk daDisk](self, "daDisk"));
    v8 = +[SKAPFSContainerDisk copyPhysicalStoresMediaWithDADisk:](SKAPFSContainerDisk, "copyPhysicalStoresMediaWithDADisk:", v7);

    return v8;
  }
}

- (id)copyPhysicalStoresUUIDs
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = -[SKAPFSContainerDisk copyPhysicalStoresIOMedia](self, "copyPhysicalStoresIOMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(NSString);
        v11 = objc_msgSend(v9, "copyPropertyWithClass:key:", v10, CFSTR("UUID"), (_QWORD)v13);
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)copyDesignatedPhysicalStoreUUID
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = -[SKAPFSContainerDisk copyPhysicalStoresIOMedia](self, "copyPhysicalStoresIOMedia");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = objc_opt_class(NSString);
        v10 = objc_msgSend(v8, "copyPropertyWithClass:key:", v9, CFSTR("UUID"), (_QWORD)v15);
        v11 = v10;
        if (v10)
        {
          if (v5)
          {
            v12 = objc_msgSend(v8, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("TierType"));
            v13 = v12;
            if (v12 && (objc_msgSend(v12, "isEqualToString:", CFSTR("Secondary")) & 1) != 0)
            {

              goto LABEL_18;
            }

          }
          else
          {
            v5 = v10;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }

  v5 = v5;
  v11 = v5;
LABEL_18:

  return v11;
}

+ (id)copyExtendedSpaceInfoWithDiskIdentifier:(id)a3 containerBSDName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v8 = objc_msgSend(v7, "copyExtendedDiskInfoWithDiskIdentifier:", v5);

  if (!v8)
  {
    if (v6)
    {
      v21 = 0;
      v9 = sub_10000BA9C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
        v24 = 2114;
        v25 = v6;
        v26 = 2114;
        v27 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Caching APFS extended info for %{public}@, asked by %{public}@", buf, 0x20u);
      }

      v11 = objc_retainAutorelease(v6);
      v12 = APFSExtendedSpaceInfo(objc_msgSend(v11, "fileSystemRepresentation"), &v21);
      if (v12 || (v13 = v21) == 0)
      {
        v19 = sub_10000BA9C();
        v18 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v23 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
          v24 = 2114;
          v25 = v11;
          v26 = 1024;
          LODWORD(v27) = v12;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: APFSExtendedSpaceInfo failed for %{public}@ with error %d", buf, 0x1Cu);
        }
        v8 = 0;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
        objc_msgSend(v14, "_addToExtendedDiskInfoCacheWithDictionary:", v13);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v5));
        if (!v15)
        {
          v16 = sub_10000BA9C();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "+[SKAPFSContainerDisk(Daemon) copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:]";
            v24 = 2114;
            v25 = v5;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Cannot get APFS extended space info for %{public}@", buf, 0x16u);
          }

        }
        v18 = v15;

        v8 = v18;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_supportsRecaching
{
  return -[SKAPFSContainerDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk") ^ 1;
}

- (SKAPFSContainerDisk)initWithPhysicalStoreDisk:(id)a3
{
  __DADisk *v4;
  SKAPFSContainerDisk *v5;
  SKAPFSContainerDisk *v6;
  const char *BSDName;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  SKAPFSContainerDisk *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  __DADisk *v21;

  v4 = (__DADisk *)a3;
  v5 = -[SKAPFSContainerDisk init](self, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  if (!v4)
    goto LABEL_10;
  -[SKAPFSContainerDisk setDaDisk:](v5, "setDaDisk:", v4);
  BSDName = DADiskGetBSDName(v4);
  if (!BSDName)
  {
    v15 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKAPFSContainerDisk(Daemon) initWithPhysicalStoreDisk:]";
      v20 = 2112;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to get BSD name of %@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", BSDName);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk privateCache](v6, "privateCache"));
  objc_msgSend(v9, "setLiveDiskIdentifier:", v8);

  v10 = objc_alloc((Class)NSString);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk privateCache](v6, "privateCache"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "liveDiskIdentifier"));
  v13 = objc_msgSend(v10, "initWithFormat:", CFSTR("apfs://%@"), v12);
  -[SKAPFSContainerDisk setDiskIdentifier:](v6, "setDiskIdentifier:", v13);

  if (!-[SKAPFSContainerDisk _cacheInfo](v6, "_cacheInfo"))
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  -[SKAPFSContainerDisk setIsValid:](v6, "setIsValid:", 1);
LABEL_6:
  v14 = v6;
LABEL_11:

  return v14;
}

- (BOOL)cleanupWithError:(id *)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  SKIOMedia *v12;
  void *v13;
  SKIOMedia *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk volumes](self, "volumes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "cleanupWithError:", a3))
        {
          v15 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (!-[SKAPFSContainerDisk isIOMediaDisk](self, "isIOMediaDisk"))
    return 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](self, "diskIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v10));

  v5 = objc_retainAutorelease(v11);
  APFSContainerWipeVolumeKeys(objc_msgSend(v5, "UTF8String"));
  v12 = [SKIOMedia alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSContainerDisk diskIdentifier](self, "diskIdentifier"));
  v14 = -[SKIOMedia initWithDevName:](v12, "initWithDevName:", v13);

  -[SKIOObject waitIOKitQuiet](v14, "waitIOKitQuiet");
  v15 = 1;
LABEL_12:

  return v15;
}

@end
