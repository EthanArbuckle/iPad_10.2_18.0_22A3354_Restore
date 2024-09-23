@implementation SKAPFSSnapshotDisk

+ (BOOL)diskIsSnapshot:(id)a3
{
  id v3;
  SKIOMedia *v4;
  BOOL v5;

  v3 = a3;
  v4 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v3);

  if (v4)
    v5 = IOObjectConformsTo(-[SKIOObject ioObj](v4, "ioObj"), "AppleAPFSSnapshot") != 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_cacheInfo
{
  SKAPFSSnapshotDisk *v2;
  __DADisk *v3;
  void *v4;
  __DASession *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  NSObject *v8;
  unsigned int v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  DADiskRef v21;
  id v22;
  int v23;
  SKIOMedia *v24;
  SKIOMedia *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  int v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  id v51;
  id v52;
  NSObject *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  int *v62;
  char *v63;
  id v64;
  void *v65;
  id v66;
  __DASession *session;
  objc_super v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  char *v74;
  statfs v75;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk daDisk](v2, "daDisk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v5 = (__DASession *)objc_msgSend(v4, "diskArbSession");

  v6 = DADiskCopyDescription(v3);
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", kDADiskDescriptionVolumePathKey));
    v9 = objc_msgSend((id)objc_opt_class(v2), "isiOSRootSnapshotWithDiskDescription:", v7);
    v10 = v9;
    if (v9)
    {
      -[SKAPFSSnapshotDisk setSealStatus:](v2, "setSealStatus:", 0);
      if (!v8)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
        objc_msgSend(v32, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_100044B30);

        v33 = sub_10000BA9C();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          v75.f_bsize = 136315138;
          *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "%s: Unmounted root snapshot", (uint8_t *)&v75, 0xCu);
        }
LABEL_25:

LABEL_45:
        v21 = 0;
LABEL_46:
        v23 = 1;
LABEL_47:

        goto LABEL_48;
      }
      memset(&v75, 0, 512);
      v11 = objc_retainAutorelease(v8);
      if (statfs((const char *)-[NSObject fileSystemRepresentation](v11, "fileSystemRepresentation"), &v75) == -1)
      {
        v42 = sub_10000BA9C();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = *__error();
          *(_DWORD *)buf = 136315650;
          v70 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          v71 = 2112;
          v72 = v11;
          v73 = 1024;
          LODWORD(v74) = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: statfs failed for %@, errno %d", buf, 0x1Cu);
        }

        goto LABEL_45;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v75.f_mntfromname));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject componentsSeparatedByString:](v12, "componentsSeparatedByString:", CFSTR("@/dev/")));
      if (objc_msgSend(v13, "count") != (id)2
        || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1)),
            v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("disk")),
            v14,
            (v15 & 1) == 0))
      {
        v40 = sub_10000BA9C();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v70 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          v71 = 2112;
          v72 = v12;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s: Unexpected mntFromName for root disk: %@", buf, 0x16u);
        }

        goto LABEL_45;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
      -[SKAPFSSnapshotDisk setSnapshotName:](v2, "setSnapshotName:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR(":root_snapshot")));
      -[SKAPFSSnapshotDisk setDiskIdentifier:](v2, "setDiskIdentifier:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
      session = (__DASession *)objc_msgSend(v19, "diskArbSession");
      v20 = objc_retainAutorelease(v17);
      v21 = DADiskCreateFromBSDName(0, session, (const char *)objc_msgSend(v20, "UTF8String"));

LABEL_18:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk diskIdentifier](v2, "diskIdentifier"));
      v30 = v29 == 0;

      if (v30)
      {
        v46 = sub_10000BA9C();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v75.f_bsize = 136315138;
          *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s: No disk identifier for snapshot", (uint8_t *)&v75, 0xCu);
        }

        goto LABEL_46;
      }
      if (v21)
      {
        v68.receiver = v2;
        v68.super_class = (Class)SKAPFSSnapshotDisk;
        if ((-[SKAPFSSnapshotDisk _cacheInfoForDADisk:](&v68, "_cacheInfoForDADisk:", v21) & 1) == 0)
        {
          v52 = sub_10000BA9C();
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v75.f_bsize = 136315138;
            *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s: Failed to cache livefs data", (uint8_t *)&v75, 0xCu);
          }
          goto LABEL_70;
        }
        if ((v10 & 1) != 0)
        {
          v31 = 0;
        }
        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk mediaUUID](v2, "mediaUUID"));
          -[SKAPFSSnapshotDisk setApfsUUID:](v2, "setApfsUUID:", v54);

          v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", kDADiskDescriptionMediaUUIDKey));
          if (v31)
            v55 = (__CFString *)CFUUIDCreateString(0, (CFUUIDRef)v31);
          else
            v55 = 0;
          -[SKAPFSSnapshotDisk setMediaUUID:](v2, "setMediaUUID:", v55);
          if (v31)

          v56 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk mediaUUID](v2, "mediaUUID"));
          v57 = v56 == 0;

          if (v57)
          {
            v64 = sub_10000BA9C();
            v53 = objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk diskIdentifier](v2, "diskIdentifier"));
              v75.f_bsize = 136315650;
              *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
              WORD2(v75.f_blocks) = 2114;
              *(uint64_t *)((char *)&v75.f_blocks + 6) = (uint64_t)v65;
              HIWORD(v75.f_bfree) = 2080;
              v75.f_bavail = (uint64_t)"AppleAPFSSnapshot";
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s: IOMedia for %{public}@ doesn't conform to %s. It's missing a UUID.", (uint8_t *)&v75, 0x20u);

            }
            goto LABEL_70;
          }
        }
        if (v8)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v8, "path"));
          -[SKAPFSSnapshotDisk setMountPoint:](v2, "setMountPoint:", v58);

          if ((-[SKAPFSSnapshotDisk isIOSRootSnapshot](v2, "isIOSRootSnapshot") & 1) == 0)
          {
            memset(&v75.f_bavail, 0, 264);
            *(_QWORD *)&v75.f_bsize = 2;
            *(CFUUIDBytes *)&v75.f_blocks = CFUUIDGetUUIDBytes((CFUUIDRef)v31);
            if (fsctl((const char *)-[NSObject fileSystemRepresentation](objc_retainAutorelease(v8), "fileSystemRepresentation"), 0xC1204A43uLL, &v75, 0))
            {
              v59 = sub_10000BA9C();
              v53 = objc_claimAutoreleasedReturnValue(v59);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk mountPoint](v2, "mountPoint")));
                v61 = objc_msgSend(v60, "fileSystemRepresentation");
                v62 = __error();
                v63 = strerror(*v62);
                *(_DWORD *)buf = 136315650;
                v70 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
                v71 = 2080;
                v72 = v61;
                v73 = 2080;
                v74 = v63;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s: Failed to fsctl(%s). %s", buf, 0x20u);

              }
LABEL_70:

              goto LABEL_46;
            }
            v66 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", &v75.f_files, strnlen((const char *)&v75.f_files, 0xFFuLL), 4);
            -[SKAPFSSnapshotDisk setSnapshotName:](v2, "setSnapshotName:", v66);

          }
        }
        else
        {
          -[SKAPFSSnapshotDisk setMountPoint:](v2, "setMountPoint:", 0);
          -[SKAPFSSnapshotDisk setUsedSpace:](v2, "setUsedSpace:", 0);
        }
        -[SKAPFSSnapshotDisk setReserveSpace:](v2, "setReserveSpace:", 0);
        -[SKAPFSSnapshotDisk setQuotaSpace:](v2, "setQuotaSpace:", 0);
        -[SKAPFSSnapshotDisk _cacheSpacesWithPurgeable:](v2, "_cacheSpacesWithPurgeable:", 1);
        -[SKAPFSSnapshotDisk setRole:](v2, "setRole:", kSKDiskRoleSnapshot);
        v23 = 0;
        goto LABEL_47;
      }
      v51 = sub_10000BA9C();
      v34 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v75.f_bsize = 136315138;
        *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s: Failed to create DADiskRef for snapshot's parent", (uint8_t *)&v75, 0xCu);
      }
      goto LABEL_25;
    }
    v24 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v3);
    v25 = v24;
    if (v24)
    {
      if (IOObjectConformsTo(-[SKIOObject ioObj](v24, "ioObj"), "AppleAPFSSnapshot"))
      {
        -[SKAPFSSnapshotDisk setSealStatus:](v2, "setSealStatus:", sub_100001BD0(v25));
        if ((-[SKAPFSSnapshotDisk isValid](v2, "isValid") & 1) == 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", kDADiskDescriptionMediaBSDNameKey));
          -[SKAPFSSnapshotDisk setDiskIdentifier:](v2, "setDiskIdentifier:", v26);

        }
        v27 = -[SKIOObject copyParent](v25, "copyParent");
        v28 = v27;
        if (v27)
        {
          if (IOObjectConformsTo((io_object_t)objc_msgSend(v27, "ioObj"), "AppleAPFSVolume"))
          {
            v21 = DADiskCreateFromIOMedia(kCFAllocatorDefault, v5, (io_service_t)objc_msgSend(v28, "ioObj"));

            goto LABEL_18;
          }
          v48 = sub_10000BA9C();
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v75.f_bsize = 136315138;
            *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%s: Snapshot IOMedia's parent is not an APFS volume", (uint8_t *)&v75, 0xCu);
          }

        }
        goto LABEL_45;
      }
      v45 = sub_10000BA9C();
      v36 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v75.f_bsize = 136315394;
        *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        WORD2(v75.f_blocks) = 2080;
        *(uint64_t *)((char *)&v75.f_blocks + 6) = (uint64_t)"AppleAPFSSnapshot";
        v37 = "%s: IOMedia doesn't conform to %s";
        v38 = v36;
        v39 = 22;
        goto LABEL_36;
      }
    }
    else
    {
      v35 = sub_10000BA9C();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v75.f_bsize = 136315138;
        *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        v37 = "%s: Failed to copy IOMedia for diskRef";
        v38 = v36;
        v39 = 12;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, (uint8_t *)&v75, v39);
      }
    }

    goto LABEL_45;
  }
  v22 = sub_10000BA9C();
  v8 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v75.f_bsize = 136315138;
    *(_QWORD *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: DADiskCopyDescription failed for snapshot", (uint8_t *)&v75, 0xCu);
  }
  v23 = 1;
LABEL_48:

  objc_sync_exit(v2);
  return v23 == 0;
}

- (BOOL)_supportsRecaching
{
  return -[SKAPFSSnapshotDisk isIOSRootSnapshot](self, "isIOSRootSnapshot") ^ 1;
}

+ (BOOL)isiOSRootSnapshotWithDiskDescription:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kDADiskDescriptionMediaKindKey));

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kDADiskDescriptionVolumePathKey));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
      v5 = objc_msgSend(v8, "isEqualToString:", CFSTR("file:///"));

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

@end
