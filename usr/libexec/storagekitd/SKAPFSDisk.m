@implementation SKAPFSDisk

- (BOOL)_cacheInfoForDADisk:(id)a3
{
  id v4;
  SKAPFSDisk *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  _QWORD v31[5];
  unsigned __int16 v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v33.receiver = v5;
  v33.super_class = (Class)SKAPFSDisk;
  if (!-[SKAPFSDisk _cacheInfoForDADisk:](&v33, "_cacheInfoForDADisk:", v4))
    goto LABEL_14;
  -[SKAPFSDisk setType:](v5, "setType:", kSKDiskTypeAPFSLV);
  -[SKAPFSDisk setFilesystemType:](v5, "setFilesystemType:", kSKDiskFileSystemAPFS);
  if (-[SKAPFSDisk isIOMediaDisk](v5, "isIOMediaDisk"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk mediaUUID](v5, "mediaUUID"));
    v7 = v6 == 0;

    if (!v7)
    {
      -[SKAPFSDisk setSupportsVerify:](v5, "setSupportsVerify:", 1);
      -[SKAPFSDisk setSupportsRepair:](v5, "setSupportsRepair:", 1);
      v32 = 0;
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](v5, "diskIdentifier")));
      APFSVolumeRole(objc_msgSend(v8, "fileSystemRepresentation"), &v32, 0);

      if (v32 <= 0x1Fu)
      {
        switch(v32)
        {
          case 0u:
            v9 = &SKAPFSVolumeRoleNone;
            goto LABEL_37;
          case 1u:
            -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleSystem);
            v17 = &kSKDiskRoleMacSystem;
            goto LABEL_42;
          case 2u:
            v22 = &SKAPFSVolumeRoleUser;
            goto LABEL_35;
          case 3u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_26;
          case 4u:
            -[SKAPFSDisk setRole:](v5, "setRole:", kSKDiskRoleRecovery);
            v18 = &SKAPFSVolumeRoleRecovery;
            break;
          case 8u:
            -[SKAPFSDisk setRole:](v5, "setRole:", kSKDiskRoleVirtualMemory);
            v18 = &SKAPFSVolumeRoleVM;
            break;
          default:
            if (v32 != 16)
              goto LABEL_26;
            -[SKAPFSDisk setRole:](v5, "setRole:", kSKDiskRoleBooter);
            v18 = &SKAPFSVolumeRolePreboot;
            break;
        }
        -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v18);
        goto LABEL_43;
      }
      if (v32 <= 0xFFu)
      {
        if (v32 == 32)
        {
          v22 = &SKAPFSVolumeRoleInstaller;
LABEL_35:
          -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v22);
          v17 = &kSKDiskRoleMacSystemData;
          goto LABEL_42;
        }
        if (v32 != 64)
        {
          if (v32 == 192)
          {
            -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleUpdate);
            v17 = &kSKDiskRoleInstaller;
LABEL_42:
            -[SKAPFSDisk setRole:](v5, "setRole:", *v17);
LABEL_43:
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk _getFilesystem](v5, "_getFilesystem"));
            -[SKAPFSDisk setFilesystem:](v5, "setFilesystem:", v24);

            -[SKAPFSDisk _cacheVolumeGroup](v5, "_cacheVolumeGroup");
            -[SKAPFSDisk cacheEncryptionInfo](v5, "cacheEncryptionInfo");
            goto LABEL_44;
          }
          goto LABEL_26;
        }
        v9 = &SKAPFSVolumeRoleData;
        goto LABEL_37;
      }
      switch(v32)
      {
        case 0x100u:
          v23 = &SKAPFSVolumeRoleXART;
          break;
        case 0x140u:
          v23 = &SKAPFSVolumeRoleHardware;
          break;
        case 0x180u:
          v9 = &SKAPFSVolumeRoleBackup;
LABEL_37:
          -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v9);
LABEL_38:
          v17 = &kSKDiskRoleMacData;
          goto LABEL_42;
        default:
LABEL_26:
          v19 = sub_10000BA9C();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v35) = v32;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unknown role, value: %u", buf, 8u);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), v32));
          -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", v21);

          goto LABEL_38;
      }
      -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", *v23);
      v17 = &kSKDiskRoleStorageImplementation;
      goto LABEL_42;
    }
    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](v5, "diskIdentifier"));
      *(_DWORD *)buf = 136315394;
      v35 = "-[SKAPFSDisk(Daemon) _cacheInfoForDADisk:]";
      v36 = 2114;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: APFS volume %{public}@ has no UUID", buf, 0x16u);

    }
LABEL_14:
    v16 = 0;
    goto LABEL_47;
  }
  if (-[SKAPFSDisk isIOSRootSnapshot](v5, "isIOSRootSnapshot"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk _getFilesystem](v5, "_getFilesystem"));
    -[SKAPFSDisk setFilesystem:](v5, "setFilesystem:", v10);

    -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleNone);
    v11 = &kSKDiskRoleSnapshot;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:](SKFilesystem, "filesystemFor:caseSensitive:encrypted:isExtension:", CFSTR("apfs"), 0, 0, 1));
    -[SKAPFSDisk setFilesystem:](v5, "setFilesystem:", v12);

    -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", SKAPFSVolumeRoleNone);
    v11 = &kSKDiskRoleMacData;
  }
  -[SKAPFSDisk setRole:](v5, "setRole:", *v11);
LABEL_44:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk filesystem](v5, "filesystem"));
  -[SKAPFSDisk setIsCaseSensitive:](v5, "setIsCaseSensitive:", objc_msgSend(v25, "isCaseSensitive"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk filesystem](v5, "filesystem"));
  v27 = objc_msgSend(v26, "isEncrypted");
  v28 = -[SKAPFSDisk isEncrypted](v5, "isEncrypted");

  if (v27 != v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100010780;
    v31[3] = &unk_1000450B8;
    v31[4] = v5;
    objc_msgSend(v29, "filesystemsWithCallbackBlock:", v31);

  }
  v16 = 1;
LABEL_47:
  objc_sync_exit(v5);

  return v16;
}

- (id)liveDiskIdentifierWithDiskDescription:(id)a3
{
  id v3;
  unsigned int v4;
  const CFStringRef *v5;
  void *v6;

  v3 = a3;
  v4 = +[SKAPFSDisk isLIFSAPFSWithDiskDescription:](SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v3);
  v5 = (const CFStringRef *)&kDADiskDescriptionVolumeLifsURLKey;
  if (!v4)
    v5 = &kDADiskDescriptionMediaBSDNameKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", *v5));

  return v6;
}

- (id)volumeNameWithDiskDescription:(id)a3
{
  id v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  char *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  if (-[SKAPFSDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    v5 = objc_msgSend(kSKDiskIdentifierLiveFSAPFSPrefix, "length");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
    v8 = (char *)objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("/"), 0, v5, (_BYTE *)objc_msgSend(v7, "length") - v5);

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = sub_10000BA9C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
        *(_DWORD *)buf = 136315394;
        v18 = "-[SKAPFSDisk(Daemon) volumeNameWithDiskDescription:]";
        v19 = 2112;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Invalid volume name in LiveFS URL %@", buf, 0x16u);

      }
      v12 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", v8 + 1));

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SKAPFSDisk;
    v13 = -[SKAPFSDisk volumeNameWithDiskDescription:](&v16, "volumeNameWithDiskDescription:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  _BOOL8 v3;
  SKAPFSDisk *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  _BOOL4 v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  NSObject *v20;
  _QWORD v22[2];
  _QWORD v23[3];
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _QWORD v28[3];

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v24.receiver = v4;
  v24.super_class = (Class)SKAPFSDisk;
  if (!-[SKAPFSDisk _cacheSpacesWithPurgeable:](&v24, "_cacheSpacesWithPurgeable:", v3))
  {
LABEL_13:
    LOBYTE(v8) = 0;
    goto LABEL_16;
  }
  if (!-[SKAPFSDisk isIOMediaDisk](v4, "isIOMediaDisk"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk mountPoint](v4, "mountPoint"));
    v13 = objc_msgSend(v12, "length") == 0;

    if (v13)
    {
      v19 = sub_10000BA9C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[SKAPFSDisk(Daemon) _cacheSpacesWithPurgeable:]";
        v27 = 2112;
        v28[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: LiveFS disk is not mounted: %@", buf, 0x16u);
      }

    }
    else
    {
      v23[2] = 0;
      memset(v22, 0, 12);
      v23[0] = 5;
      v23[1] = 2155872256;
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk mountPoint](v4, "mountPoint")));
      v15 = getattrlist((const char *)objc_msgSend(v14, "fileSystemRepresentation"), v23, v22, 0xCuLL, 1u) == 0;

      if (v15)
      {
        -[SKAPFSDisk setUsedSpace:](v4, "setUsedSpace:", *(_QWORD *)((char *)v22 + 4));
        goto LABEL_15;
      }
      v16 = sub_10000BA9C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *__error();
        *(_DWORD *)buf = 136315650;
        v26 = "-[SKAPFSDisk(Daemon) _cacheSpacesWithPurgeable:]";
        v27 = 1024;
        LODWORD(v28[0]) = v18;
        WORD2(v28[0]) = 2112;
        *(_QWORD *)((char *)v28 + 6) = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: getattrlist failed with errno %d for %@", buf, 0x1Cu);
      }

    }
    goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk privateCache](v4, "privateCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "liveDiskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk containerBSDName](v4, "containerBSDName"));
  v8 = +[SKAPFSContainerDisk copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:](SKAPFSContainerDisk, "copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:", v6, v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fs_used")));
    -[SKAPFSDisk setUsedSpace:](v4, "setUsedSpace:", sub_10000FC5C(v9));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fs_reserve")));
    -[SKAPFSDisk setReserveSpace:](v4, "setReserveSpace:", sub_10000FC5C(v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fs_quota")));
    -[SKAPFSDisk setQuotaSpace:](v4, "setQuotaSpace:", sub_10000FC5C(v11));

LABEL_15:
    LOBYTE(v8) = 1;
  }
LABEL_16:
  objc_sync_exit(v4);

  return (char)v8;
}

- (void)cacheEncryptionInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __DASession *v8;
  id v9;
  DADiskRef v10;
  SKIOMedia *v11;
  NSObject *p_super;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk privateCache](self, "privateCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "liveDiskIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsRole](self, "apfsRole"));
  if (v5 == (void *)SKAPFSVolumeRoleSystem)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));

    if (!v6)
      goto LABEL_5;
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk getDataVolumeBSD](self, "getDataVolumeBSD"));
  }

LABEL_5:
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v8 = (__DASession *)objc_msgSend(v7, "diskArbSession");

    v9 = objc_retainAutorelease(v4);
    v10 = DADiskCreateFromBSDName(kCFAllocatorDefault, v8, (const char *)objc_msgSend(v9, "fileSystemRepresentation"));
    if (v10)
    {
      v11 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v10);
      p_super = &v11->super.super;
      if (v11)
      {
        v13 = -[SKIOObject copyProperties](v11, "copyProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Encrypted")));
        v15 = sub_10000FC18(v14);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Effaceable")));
        v17 = sub_10000FC18(v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Locked")));
        v19 = sub_10000FC18(v18);

        -[SKAPFSDisk setIsEncrypted:](self, "setIsEncrypted:", v15 | v17);
        buf[0] = 0;
        v24 = 0;
        if (-[SKAPFSDisk isEncrypted](self, "isEncrypted"))
        {
          APFSVolumeGetVEKState(objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), buf, &v24);
          if (buf[0])
            v20 = v24 == 0;
          else
            v20 = 0;
          v21 = !v20;
        }
        else
        {
          v21 = 1;
        }
        -[SKAPFSDisk setDefaultEffaceable:](self, "setDefaultEffaceable:", v21);
        if (-[SKAPFSDisk isEncrypted](self, "isEncrypted"))
        {
          if (((v21 | v19 ^ 1) & 1) != 0)
          {
            v23 = -[NSObject copyParentPropertyWithClass:key:](p_super, "copyParentPropertyWithClass:key:", objc_opt_class(NSNumber), CFSTR("AppleTDMLocked"));
            -[SKAPFSDisk setIsLocked:](self, "setIsLocked:", sub_10000FC18(v23));

          }
          else
          {
            -[SKAPFSDisk setIsLocked:](self, "setIsLocked:", 1);
          }
        }

      }
    }
    else
    {
      v22 = sub_10000BA9C();
      p_super = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[SKAPFSDisk(Daemon) cacheEncryptionInfo]";
        v27 = 2114;
        v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%s: Cannot create DADisk for data volume %{public}@", buf, 0x16u);
      }
    }

  }
}

- (void)_cacheVolumeGroup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  id v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", 4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("s")));

  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/disk%@"), v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 1));
    v12 = objc_msgSend(v11, "intValue");

    v7 = objc_retainAutorelease(v10);
    if (APFSContainerVolumeGroupGet(-[NSObject fileSystemRepresentation](v7, "fileSystemRepresentation"), v12, &v24))
    {
      v13 = sub_10000BA9C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to read volume group UUID", buf, 2u);
      }

    }
    else if (v24 != v22 || v25 != v23)
    {
      v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
      -[SKAPFSDisk setApfsVolumeGroupUUID:](self, "setApfsVolumeGroupUUID:", v17);

      goto LABEL_14;
    }
    -[SKAPFSDisk setApfsVolumeGroupUUID:](self, "setApfsVolumeGroupUUID:", 0);
  }
  else
  {
    v6 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKAPFSDisk(Daemon) _cacheVolumeGroup]";
      v20 = 2114;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Invalid BSD name for APFS volume: %{public}@", buf, 0x16u);

    }
  }
LABEL_14:

}

- (BOOL)canResize
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk container](self, "container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "designatedPhysicalStore"));
  v4 = objc_msgSend(v3, "canResize");

  return v4;
}

- (NSString)containerBSDName
{
  void *v3;
  __DADisk *v4;
  const char *BSDName;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk privateCache](self, "privateCache"));
  v4 = (__DADisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wholeDADisk"));
  BSDName = DADiskGetBSDName(v4);

  if (BSDName)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", BSDName));
  }
  else
  {
    v7 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
      v11 = 136315394;
      v12 = "-[SKAPFSDisk(Daemon) containerBSDName]";
      v13 = 2114;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed getting container BSD name for %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v6 = 0;
  }
  return (NSString *)v6;
}

- (id)getDataVolumeBSD
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  int Volumes;
  int v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  void *v28;
  id v29;
  __int16 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  int buf;
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  _QWORD v43[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk containerBSDName](self, "containerBSDName"));
  if (v3)
  {
    v4 = objc_alloc((Class)NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));
    v6 = objc_msgSend(v4, "initWithUUIDString:", v5);

    v43[0] = 0;
    v43[1] = 0;
    objc_msgSend(v6, "getUUIDBytes:", v43);
    v35 = 0;
    v7 = objc_retainAutorelease(v3);
    Volumes = APFSContainerVolumeGroupGetVolumes(objc_msgSend(v7, "UTF8String"), v43, &v35);
    if (Volumes)
    {
      v9 = Volumes;
      v10 = sub_10000BA9C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));
        buf = 136315650;
        v38 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
        v39 = 2114;
        v40 = v12;
        v41 = 1024;
        v42 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Failed to get volumes in APFS group %{public}@, err %d", (uint8_t *)&buf, 0x1Cu);

      }
      v13 = 0;
    }
    else
    {
      v29 = v6;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v35;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        v28 = v3;
LABEL_9:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@s%@"), v7, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v17)));
          v30 = 0;
          v19 = objc_retainAutorelease(v18);
          v20 = APFSVolumeRole(objc_msgSend(v19, "fileSystemRepresentation"), &v30, 0);
          if (v20)
            break;
          if (v30 == 64)
          {
            v13 = v19;
            v3 = v28;
            v6 = v29;
LABEL_23:

            v22 = v11;
            goto LABEL_24;
          }

          if (v15 == (id)++v17)
          {
            v15 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
            v3 = v28;
            if (v15)
              goto LABEL_9;
            goto LABEL_16;
          }
        }
        v24 = v20;
        v25 = sub_10000BA9C();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        v3 = v28;
        v6 = v29;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          buf = 136315650;
          v38 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
          v39 = 2114;
          v40 = v19;
          v41 = 1024;
          v42 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: Failed to get volume role for %{public}@, err %d", (uint8_t *)&buf, 0x1Cu);
        }

        v13 = 0;
        goto LABEL_23;
      }
LABEL_16:

      v21 = sub_10000BA9C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));
        buf = 136315394;
        v38 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
        v39 = 2114;
        v40 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to find data volume in APFS group %{public}@", (uint8_t *)&buf, 0x16u);

      }
      v13 = 0;
      v6 = v29;
LABEL_24:

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isLIFSAPFSWithDiskDescription:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", kDADiskDescriptionVolumeLifsURLKey));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("apfs://"));
  else
    v5 = 0;

  return v5;
}

- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(self), "isLIFSAPFSWithDiskDescription:", v4);

  return (char)self;
}

- (BOOL)cleanupWithError:(id *)a3
{
  void *v5;
  uint64_t v6;

  if (!-[SKAPFSDisk isIOMediaDisk](self, "isIOMediaDisk"))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk diskIdentifier](self, "diskIdentifier"));
  v6 = SK_DM_APFSUtils_deleteVolume(v5);

  if (a3)
  {
    if ((_DWORD)v6)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithOSStatus:error:](SKError, "errorWithOSStatus:error:", v6, a3));
  }
  return (_DWORD)v6 == 0;
}

@end
