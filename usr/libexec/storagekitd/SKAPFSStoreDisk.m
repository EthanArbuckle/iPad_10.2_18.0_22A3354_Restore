@implementation SKAPFSStoreDisk

- (SKAPFSStoreDisk)initWithDADisk:(id)a3 isLiveFSContainer:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SKAPFSStoreDisk *v7;
  SKAPFSStoreDisk *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  SKAPFSStoreDisk *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;

  v4 = a4;
  v6 = a3;
  v7 = -[SKAPFSStoreDisk init](self, "init");
  v8 = v7;
  if (v7)
  {
    if (!v6)
      goto LABEL_10;
    -[SKAPFSStoreDisk setDaDisk:](v7, "setDaDisk:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk privateCache](v8, "privateCache"));
    objc_msgSend(v9, "setIsLiveFSContainer:", v4);

    v10 = sub_10000BA9C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("kernel");
      v15 = 136315650;
      v16 = "-[SKAPFSStoreDisk(Daemon) initWithDADisk:isLiveFSContainer:]";
      v17 = 2112;
      if (v4)
        v12 = CFSTR("liveFS");
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Initializing %@ APFS physical store %@", (uint8_t *)&v15, 0x20u);
    }

    if (!-[SKAPFSStoreDisk _cacheInfo](v8, "_cacheInfo"))
    {
LABEL_10:
      v13 = 0;
      goto LABEL_11;
    }
    -[SKAPFSStoreDisk setIsValid:](v8, "setIsValid:", 1);
  }
  v13 = v8;
LABEL_11:

  return v13;
}

- (SKAPFSStoreDisk)initWithDADisk:(id)a3
{
  return -[SKAPFSStoreDisk initWithDADisk:isLiveFSContainer:](self, "initWithDADisk:isLiveFSContainer:", a3, 0);
}

- (BOOL)_cacheInfo
{
  SKAPFSStoreDisk *v2;
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)SKAPFSStoreDisk;
  if (-[SKAPFSStoreDisk _cacheInfo](&v7, "_cacheInfo")
    && -[SKAPFSStoreDisk _cacheContainerInfo](v2, "_cacheContainerInfo"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk mediaUUID](v2, "mediaUUID"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk apfsContainerUUID](v2, "apfsContainerUUID"));
      -[SKAPFSStoreDisk setMediaUUID:](v2, "setMediaUUID:", v4);

    }
    -[SKAPFSStoreDisk setSupportsRepair:](v2, "setSupportsRepair:", 1);
    -[SKAPFSStoreDisk setSupportsVerify:](v2, "setSupportsVerify:", 1);
    -[SKAPFSStoreDisk setRole:](v2, "setRole:", kSKDiskRoleStorageImplementation);
    -[SKAPFSStoreDisk setType:](v2, "setType:", kSKDiskTypeAPFSPS);
    -[SKAPFSStoreDisk setFilesystem:](v2, "setFilesystem:", 0);
    -[SKAPFSStoreDisk setFilesystemType:](v2, "setFilesystemType:", kSKDiskFileSystemUndefined);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (BOOL)_cacheContainerInfo
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  SKIOMedia *v9;
  void *v10;
  SKIOMedia *v11;
  NSObject *v12;
  SKIOMedia *v13;
  SKIOMedia *v14;
  id v15;
  SKIOMedia *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk privateCache](self, "privateCache"));
  v4 = objc_msgSend(v3, "isLiveFSContainer");

  if (!v4)
  {
    v9 = [SKIOMedia alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk daDisk](self, "daDisk"));
    v11 = -[SKIOMedia initWithDADisk:](v9, "initWithDADisk:", v10);

    if (v11)
    {
      v12 = -[SKIOObject newIteratorWithOptions:](v11, "newIteratorWithOptions:", 1);
      v13 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v12);
      if (v13)
      {
        v14 = v13;
        do
        {
          if (IOObjectConformsTo(-[SKIOObject ioObj](v14, "ioObj"), "AppleAPFSMedia"))
          {
            v15 = -[SKIOObject copyPropertyWithClass:key:](v14, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("BSD Name"));
            -[SKAPFSStoreDisk setApfsContainerIdentifier:](self, "setApfsContainerIdentifier:", v15);

          }
          else if (IOObjectConformsTo(-[SKIOObject ioObj](v14, "ioObj"), "AppleAPFSContainer"))
          {
            v19 = -[SKIOObject copyPropertyWithClass:key:](v14, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("UUID"));
            -[SKAPFSStoreDisk setApfsContainerUUID:](self, "setApfsContainerUUID:", v19);

            break;
          }
          v16 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v12);

          v14 = v16;
        }
        while (v16);
      }
      v20 = objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID"));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk apfsContainerIdentifier](self, "apfsContainerIdentifier"));

        if (v22)
        {
          v8 = 1;
LABEL_21:

          return v8;
        }
      }
      v23 = sub_10000BA9C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk diskIdentifier](self, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v28 = "-[SKAPFSStoreDisk(Daemon) _cacheContainerInfo]";
        v29 = 2114;
        v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to get APFS container info for %{public}@", buf, 0x16u);

      }
    }
    else
    {
      v17 = sub_10000BA9C();
      v12 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk diskIdentifier](self, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v28 = "-[SKAPFSStoreDisk(Daemon) _cacheContainerInfo]";
        v29 = 2114;
        v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to get physical store IO media of %{public}@", buf, 0x16u);

      }
    }
    v8 = 0;
    goto LABEL_21;
  }
  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk diskIdentifier](self, "diskIdentifier"));
  v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("apfs://%@"), v6);
  -[SKAPFSStoreDisk setApfsContainerIdentifier:](self, "setApfsContainerIdentifier:", v7);

  return 1;
}

+ (BOOL)isIOMediaStoreWithDisk:(id)a3
{
  id v3;
  SKIOMedia *v4;
  SKIOMedia *v5;
  id v6;
  SKIOMedia *v7;
  SKIOMedia *v8;
  BOOL v9;

  v3 = a3;
  v4 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v3);
  v5 = v4;
  if (v4)
  {
    v6 = -[SKIOObject newIteratorWithOptions:](v4, "newIteratorWithOptions:", 0);
    v7 = 0;
    do
    {
      v8 = v7;
      v7 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v6);

      v9 = v7 != 0;
    }
    while (v7 && !IOObjectConformsTo(-[SKIOObject ioObj](v7, "ioObj"), "AppleAPFSContainerScheme"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isLiveFSStoreWithRawIOContent:(id)a3 diskDesc:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("7C3457EF-0000-11AA-AA11-00306543ECAC")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kDADiskDescriptionDeviceInternalKey));
    if (sub_10000FA68(v6))
      v7 = objc_msgSend(v6, "BOOLValue") ^ 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)cleanupWithError:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSStoreDisk container](self, "container"));
  LOBYTE(a3) = objc_msgSend(v4, "cleanupWithError:", a3);

  return (char)a3;
}

@end
