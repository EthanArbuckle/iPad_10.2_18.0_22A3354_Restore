@implementation SKMountOperation

+ (id)nilWithBlock:(id)a3 error:(id)a4
{
  if (a3)
    (*((void (**)(id, id))a3 + 2))(a3, a4);
  return 0;
}

- (SKMountOperation)initWithDisk:(id)a3 options:(id)a4 connection:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  SKMountOperation *v13;
  unsigned int v14;
  SKMountOperation *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSSet *disksToMount;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSErrorDomain v35;
  uint64_t v36;
  unsigned int v37;
  id v38;
  SKMountOperation *v39;
  id v40;
  NSObject *v41;
  id v42;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v45.receiver = self;
  v45.super_class = (Class)SKMountOperation;
  v13 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:](&v45, "initWithTarget:options:callbackBlock:", v10, a4, v12);
  if (v13)
  {
    if (v11)
      v14 = objc_msgSend(v11, "uid");
    else
      v14 = -1;
    v13->_clientUID = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v13, "options"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", kSKAPFSDiskMountIgnoreGroup));
    v18 = -[SKBaseDiskArbOperation disksForOperationWithTarget:ignoreGroup:](v13, "disksForOperationWithTarget:ignoreGroup:", v10, sub_10000FC18(v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = objc_claimAutoreleasedReturnValue(-[SKMountOperation filterEFIWithDisks:](v13, "filterEFIWithDisks:", v19));
    disksToMount = v13->_disksToMount;
    v13->_disksToMount = (NSSet *)v20;

    if (-[NSSet count](v13->_disksToMount, "count"))
    {
      if ((id)-[NSSet count](v13->_disksToMount, "count") == (id)1)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](v13->_disksToMount, "anyObject"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mountPoint"));

        if (v23)
        {
          v24 = sub_10000BA9C();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v47 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
            v48 = 2112;
            v49 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: %@ is already mounted, returning success", buf, 0x16u);
          }

          v26 = (void *)objc_opt_class(v13);
          v27 = v12;
          v28 = 0;
          goto LABEL_35;
        }

      }
      -[SKMountOperation validateMountOptionsWithDisk:](v13, "validateMountOptionsWithDisk:", v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v13, "options"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", kSKDiskMountOptionMountPoint));

      if (v32)
      {
        if (-[NSSet count](v13->_disksToMount, "count") >= 2)
        {
          v33 = sub_10000BA9C();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s: Multiple disks to mount, cannot specify mount point", buf, 0xCu);
          }

          v29 = objc_opt_class(v13);
          v35 = NSPOSIXErrorDomain;
          v36 = 22;
          goto LABEL_32;
        }
        v44 = 0;
        v37 = -[SKMountOperation validateMountPointWithConnection:error:](v13, "validateMountPointWithConnection:error:", v11, &v44);
        v38 = v44;
        v22 = v38;
        if (!v37)
        {
          v26 = (void *)objc_opt_class(v13);
LABEL_34:
          v27 = v12;
          v28 = v22;
LABEL_35:
          v15 = (SKMountOperation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "nilWithBlock:error:", v27, v28));

          goto LABEL_36;
        }

      }
      if (-[SKMountOperation authenticateOnInit](v13, "authenticateOnInit")
        && (objc_msgSend(v11, "authorizeRequestForRoot") & 1) == 0)
      {
        v29 = objc_opt_class(v13);
        v35 = NSPOSIXErrorDomain;
        v36 = 1;
LABEL_32:
        v30 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v35, v36, 0));
        goto LABEL_33;
      }
      v39 = v13;
    }
    else
    {
      if (!-[SKBaseDiskArbOperation recursive](v13, "recursive") || -[SKMountOperation force](v13, "force"))
      {
        v29 = objc_opt_class(v13);
        v30 = objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 124, 0));
LABEL_33:
        v22 = (void *)v30;
        v26 = (void *)v29;
        goto LABEL_34;
      }
      v40 = sub_10000BA9C();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: Nothing to mount on recursive mount, returning success", buf, 0xCu);
      }

      v42 = objc_msgSend((id)objc_opt_class(v13), "nilWithBlock:error:", v12, 0);
      v39 = (SKMountOperation *)objc_claimAutoreleasedReturnValue(v42);
    }
    v15 = v39;
LABEL_36:

    goto LABEL_37;
  }
  v15 = 0;
LABEL_37:

  return v15;
}

- (id)filterEFIWithDisks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  unsigned int v36;
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 136315906;
    v24 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "type", v24, (_QWORD)v25));
        v14 = objc_msgSend(v13, "isEqualToString:", kSKDiskTypeEFI);

        if (v14
          && -[SKMountOperation clientUID](self, "clientUID")
          && (v15 = -[SKMountOperation clientUID](self, "clientUID"), v15 != objc_msgSend(v12, "ownerUID")))
        {
          v16 = sub_10000BA9C();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = -[SKMountOperation clientUID](self, "clientUID");
            v19 = v6;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "diskIdentifier"));
            v21 = objc_msgSend(v12, "ownerUID");
            *(_DWORD *)buf = v24;
            v30 = "-[SKMountOperation filterEFIWithDisks:]";
            v31 = 1024;
            v32 = v18;
            v33 = 2114;
            v34 = v20;
            v35 = 1024;
            v36 = v21;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Client uid %d, skipping EFI partition %{public}@ owned by uid %d", buf, 0x22u);

            v6 = v19;
          }

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      v9 = v22;
    }
    while (v22);
  }

  return v5;
}

- (BOOL)toOperateWithDisk:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class(SKAPFSDisk);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "role"));
    if ((objc_msgSend(v5, "isEqualToString:", kSKDiskRoleVirtualMemory) & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "role"));
      if ((objc_msgSend(v7, "isEqualToString:", kSKDiskRoleBooter) & 1) != 0)
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "role"));
        if ((objc_msgSend(v8, "isEqualToString:", kSKDiskRoleRecovery) & 1) != 0)
          LOBYTE(v6) = 0;
        else
          v6 = objc_msgSend(v3, "isLocked") ^ 1;

      }
    }

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (BOOL)mountWithDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  SKMountOperation *v9;
  id v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  v9 = -[SKMountOperation initWithDisk:options:connection:completionBlock:]([SKMountOperation alloc], "initWithDisk:options:connection:completionBlock:", v8, v7, 0, 0);

  v10 = -[SKMountOperation newPerformOperation](v9, "newPerformOperation");
  v11 = v10;
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v11 == 0;
}

- (id)copyMountURLWithDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  unsigned __int8 v33;
  id v34;
  int v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v44;
  __CFString *v45;
  id v46;
  id v47;
  NSFileAttributeKey v48;
  void *v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSKDiskMountOptionMountPoint));

  v7 = objc_opt_class(SKAPFSContainerDisk);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0 && (objc_msgSend(v4, "isLiveFSAPFSDisk") & 1) != 0)
    goto LABEL_53;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filesystem"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filesystem"));
    if (objc_msgSend(v9, "isExtension"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filesystem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "majorType"));
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("apfs")))
      {
        if (objc_msgSend(v4, "isExternal"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filesystem"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "majorType"));
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("apfs"));

        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        v14 = 1;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  if (v6 || (v14 & 1) != 0)
  {
LABEL_51:
    if (v6)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
      goto LABEL_54;
    }
LABEL_53:
    v42 = 0;
    goto LABEL_54;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "volumeName"));
  if (v15)
    v16 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "volumeName"));
  else
    v16 = CFSTR("untitled");

  v45 = (__CFString *)v16;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/private/var/mnt"), v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v17, "fileExistsAtPath:", v6))
  {
    v18 = 2;
    while ((_DWORD)v18 != 100)
    {
      v19 = sub_10000BA9C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = (uint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Mountpoint %@ already exists, trying a different mountpoint", buf, 0xCu);
      }

      v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@_%d"), CFSTR("/private/var/mnt"), v45, v18));
      v18 = (v18 + 1);
      v6 = (void *)v21;
      if ((objc_msgSend(v17, "fileExistsAtPath:", v21) & 1) == 0)
        goto LABEL_27;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v37, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_100044B50);

    v38 = sub_10000BA9C();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = (uint64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "Failed to find a free mountpoint for %@", buf, 0xCu);
    }

    goto LABEL_53;
  }
  v21 = (uint64_t)v6;
LABEL_27:
  v22 = sub_10000BA9C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskIdentifier"));
    *(_DWORD *)buf = 138412546;
    v51 = (uint64_t)v24;
    v52 = 2112;
    v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Mounting %@ to %@", buf, 0x16u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v25));

  v47 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributesOfItemAtPath:error:", v26, &v47));
  v28 = v47;
  if (v27)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", NSFileOwnerAccountID));
    v44 = v26;
    if (sub_10000FA68(v29) && objc_msgSend(v29, "unsignedLongValue"))
    {
      v30 = sub_10000BA9C();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = (uint64_t)v29;
        v52 = 2112;
        v53 = v21;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting owner %@ to mount point %@", buf, 0x16u);
      }

      v48 = NSFileOwnerAccountID;
      v49 = v29;
      v32 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    }
    else
    {
      v32 = 0;
    }
    v46 = v28;
    v33 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, v32, &v46);
    v34 = v46;

    if ((v33 & 1) != 0)
    {
      v35 = 0;
    }
    else
    {
      v40 = sub_10000BA9C();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v21;
        v52 = 2112;
        v53 = (uint64_t)v34;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed creating mount point %@: %@", buf, 0x16u);
      }

      v35 = 1;
    }
    v26 = v44;

  }
  else
  {
    v36 = sub_10000BA9C();
    v32 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v51 = (uint64_t)v26;
      v52 = 2112;
      v53 = (uint64_t)v28;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed getting attributes for device path %@: %@", buf, 0x16u);
    }
    v35 = 1;
    v34 = v28;
  }

  if (!v35)
  {
    v6 = (void *)v21;
    goto LABEL_51;
  }
  v42 = 0;
  v6 = (void *)v21;
LABEL_54:

  return v42;
}

- (void)validateMountOptionsWithDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSKDiskMountOptionToolOptions));

  if (!v6 || !-[SKMountOperation clientUID](self, "clientUID") || !objc_msgSend(v6, "count"))
    goto LABEL_21;
  v7 = 0;
  while (1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));

    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("-o=")) & 1) != 0)
    {
      v10 = 3;
    }
    else
    {
      if (!objc_msgSend(v9, "hasPrefix:", CFSTR("-o")))
        goto LABEL_10;
      v10 = 2;
    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", v10));

    v9 = (void *)v11;
LABEL_10:
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("noowners"))
      && (objc_msgSend(v4, "isTrusted") & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("suid"))
      && !objc_msgSend(v4, "isTrusted")
      || objc_msgSend(v9, "isEqualToString:", CFSTR("dev"))
      && (objc_msgSend(v4, "isTrusted") & 1) == 0)
    {
      break;
    }

    if (++v7 >= (unint64_t)objc_msgSend(v6, "count"))
      goto LABEL_21;
  }
  v12 = sub_10000BA9C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[SKMountOperation clientUID](self, "clientUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskIdentifier"));
    v16 = 136315906;
    v17 = "-[SKMountOperation validateMountOptionsWithDisk:]";
    v18 = 1024;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Client %d asks to mount %@ with %@ option", (uint8_t *)&v16, 0x26u);

  }
  -[SKMountOperation setAuthenticateOnInit:](self, "setAuthenticateOnInit:", 1);

LABEL_21:
}

- (BOOL)validateMountPointWithConnection:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  unsigned __int8 v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  id v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  uid_t st_uid;
  stat v35;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kSKDiskMountOptionMountPoint));

  if (!v8)
  {
LABEL_22:
    v18 = 1;
    goto LABEL_23;
  }
  if (!sub_10000FABC(v8) || (v9 = objc_retainAutorelease(v8), !objc_msgSend(v9, "fileSystemRepresentation")))
  {
    v15 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v35.st_dev = 138412290;
      *(_QWORD *)&v35.st_mode = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid mount point %@", (uint8_t *)&v35, 0xCu);
    }

    v14 = 22;
    goto LABEL_13;
  }
  if (!a3)
  {
    v19 = sub_10000BA9C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unknown audit token, denying use of mount point", (uint8_t *)&v35, 2u);
    }

    v17 = +[SKError failWithSKErrorCode:error:](SKError, "failWithSKErrorCode:error:", 102, a4);
    goto LABEL_14;
  }
  if (!-[SKMountOperation clientUID](self, "clientUID"))
    goto LABEL_19;
  memset(&v35, 0, sizeof(v35));
  v10 = objc_retainAutorelease(v9);
  if (stat((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v35))
  {
    v11 = *__error();
    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = 136315650;
      v28 = "-[SKMountOperation validateMountPointWithConnection:error:]";
      v29 = 2112;
      v30 = v10;
      v31 = 1024;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Stat failed on %@, errno %d", (uint8_t *)&v27, 0x1Cu);
    }

    v14 = v11;
LABEL_13:
    v17 = +[SKError failWithPOSIXCode:error:](SKError, "failWithPOSIXCode:error:", v14, a4);
LABEL_14:
    v18 = v17;
    goto LABEL_23;
  }
  v21 = -[SKMountOperation clientUID](self, "clientUID");
  if (v21 == v35.st_uid)
  {
LABEL_19:
    v22 = sub_10000BA9C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v35.st_dev = 136315394;
      *(_QWORD *)&v35.st_mode = "-[SKMountOperation validateMountPointWithConnection:error:]";
      WORD2(v35.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v35.st_ino + 6) = (__darwin_ino64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Client is allowed to mount to %@", (uint8_t *)&v35, 0x16u);
    }

    goto LABEL_22;
  }
  v25 = sub_10000BA9C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315906;
    v28 = "-[SKMountOperation validateMountPointWithConnection:error:]";
    v29 = 2112;
    v30 = v10;
    v31 = 1024;
    v32 = -[SKMountOperation clientUID](self, "clientUID");
    v33 = 1024;
    st_uid = v35.st_uid;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: Client is not the owner of %@. clientUID = %d, path_info.st_uid = %d, asking for permission", (uint8_t *)&v27, 0x22u);
  }

  v18 = 1;
  -[SKMountOperation setAuthenticateOnInit:](self, "setAuthenticateOnInit:", 1);
LABEL_23:

  return v18;
}

- (id)newPerformOperation
{
  void *v3;
  void *v4;
  id v5;
  void *i;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  CFStringRef *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  void *j;
  void *v35;
  CFStringRef *v36;
  __DADisk *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  uint64_t v45;
  dispatch_queue_global_t global_queue;
  NSObject *v47;
  unsigned int v48;
  void *v49;
  id v50;
  void *v52;
  id v53;
  id v54;
  CFStringRef *arguments;
  uint64_t v56;
  id v57;
  id obj;
  NSObject *group;
  _QWORD block[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _QWORD buf[4];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _QWORD v102[65];

  memset(v102, 0, 512);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kSKDiskMountOptionToolOptions));

  v5 = objc_msgSend(v4, "count");
  group = dispatch_group_create();
  if (v5)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", i));
      v102[(_QWORD)i] = v7;

    }
  }
  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation disksToMount](self, "disksToMount"));
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[SKMountOperation disksToMount](self, "disksToMount"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v101, 16);
  v52 = v4;
  if (!v11)
  {
    v13 = 0;
    goto LABEL_38;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v66;
  v15 = (CFStringRef *)v102;
  if (!v5)
    v15 = 0;
  arguments = v15;
  v53 = v10;
  v56 = *(_QWORD *)v66;
  do
  {
    v16 = 0;
    v57 = v12;
    do
    {
      if (*(_QWORD *)v66 != v14)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mountPoint"));

      if (!v18)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Mount of %@"), v17));
        -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v21);

        v20 = -[SKMountOperation copyMountURLWithDisk:](self, "copyMountURLWithDisk:", v17);
        v22 = objc_msgSend((id)objc_opt_class(self), "getMountState:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (v23
          && (v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options")),
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", kSKDiskMountOptionRestore)),
              v26 = sub_10000FC18(v25),
              v25,
              v24,
              v26))
        {
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mountPoint"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v27));

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "path"));
          LOBYTE(v27) = objc_msgSend(v29, "hasPrefix:", CFSTR("/Volumes"));

          v54 = v13;
          if ((v27 & 1) == 0)
          {
            v30 = v28;

            v20 = v30;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mountFlags"));
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          memset(buf, 0, sizeof(buf));
          v32 = objc_msgSend(v31, "count");
          if (v32)
          {
            v33 = v32;
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", j));
              v36 = (CFStringRef *)buf;
              buf[(_QWORD)j] = v35;

            }
          }
          else
          {
            v36 = 0;
          }
          v37 = (__DADisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "daDisk"));
          DADiskMountWithArguments(v37, (CFURLRef)v20, 0, (DADiskMountCallback)sub_100017048, self, v36);

          v10 = v53;
          v13 = v54;
        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "daDisk"));
          DADiskMountWithArguments((DADiskRef)v28, (CFURLRef)v20, 0, (DADiskMountCallback)sub_100017048, self, arguments);
        }

        if (-[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp"))
        {
          v14 = v56;
LABEL_30:
          objc_msgSend((id)objc_opt_class(self), "clearMountState:", v17);
          objc_msgSend(v10, "addObject:", v17);

          v12 = v57;
          goto LABEL_31;
        }
        v14 = v56;
        if (v13)
        {
          if (!v20)
            goto LABEL_30;
        }
        else
        {
          v13 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");
          if (!v20)
            goto LABEL_30;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v20, "path"));
        -[SKBaseDiskArbOperation removeWithMountPoint:](self, "removeWithMountPoint:", v38);

        goto LABEL_30;
      }
      v19 = sub_10000BA9C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 136315394;
        *(_QWORD *)((char *)buf + 4) = "-[SKMountOperation newPerformOperation]";
        WORD2(buf[1]) = 2112;
        *(_QWORD *)((char *)&buf[1] + 6) = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: %@ is already mounted, skipping", (uint8_t *)buf, 0x16u);
      }
LABEL_31:

      v16 = (char *)v16 + 1;
    }
    while (v16 != v12);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v101, 16);
    v12 = v39;
  }
  while (v39);
LABEL_38:

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v40 = v10;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v42; k = (char *)k + 1)
      {
        if (*(_QWORD *)v62 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)k);
        global_queue = dispatch_get_global_queue(0, 0);
        v47 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000044EC;
        block[3] = &unk_100044B78;
        block[4] = v45;
        dispatch_group_async(group, v47, block);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v42);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v48 = -[SKBaseDiskArbOperation recursive](self, "recursive");
  v49 = v13;
  if (v48)
  {
    if (objc_msgSend(v40, "count"))
      v49 = 0;
    else
      v49 = v13;
  }
  v50 = v49;

  return v50;
}

- (BOOL)force
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSKDiskMountOptionForce));
  v4 = sub_10000FC18(v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation disksToMount](self, "disksToMount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Mount Operation for %@ with %@"), v3, v4));

  return v5;
}

- (int64_t)defaultErrorCode
{
  return 400;
}

- (BOOL)authenticateOnInit
{
  return self->_authenticateOnInit;
}

- (void)setAuthenticateOnInit:(BOOL)a3
{
  self->_authenticateOnInit = a3;
}

- (NSSet)disksToMount
{
  return self->_disksToMount;
}

- (unsigned)clientUID
{
  return self->_clientUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disksToMount, 0);
}

@end
