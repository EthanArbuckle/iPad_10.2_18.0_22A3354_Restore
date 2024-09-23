@implementation MSDHVolumeManager

+ (id)sharedInstance
{
  if (qword_100053DC8 != -1)
    dispatch_once(&qword_100053DC8, &stru_100048DA8);
  return (id)qword_100053DC0;
}

- (MSDHVolumeManager)init
{
  MSDHVolumeManager *v2;
  MSDHVolumeManager *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDHVolumeManager;
  v2 = -[MSDHVolumeManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager lookupAPFSVolumeDevByName:](v2, "lookupAPFSVolumeDevByName:", CFSTR("com.apple.mobilestoredemo.storage")));
    -[MSDHVolumeManager setDemoVolumeDev:](v3, "setDemoVolumeDev:", v4);

  }
  return v3;
}

- (BOOL)manageSnapshot:(id)a3 forVolumeAt:(id)a4
{
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  id v13;
  int v14;
  id v15;
  NSObject *v16;
  id v17;
  BOOL v18;
  id v19;
  id v21;
  NSObject *v22;
  int v23;
  id v24;

  v6 = a3;
  v7 = open((const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String"), 0);
  if ((int)v7 > 0)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("RevertSnapshot")))
    {
      v8 = fs_snapshot_revert(v7, "com.apple.snapshot.mobilestoredemo", 0);
      v9 = sub_100024A40();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = v10;
      if (!v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v12 = "Snapshot reverted.";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10002C910();
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("DeleteSnapshot")))
      {
        if (fs_snapshot_delete(v7, "com.apple.snapshot.mobilestoredemo", 0))
        {
          if (*__error() != 2)
          {
            v13 = sub_100024A40();
            v11 = objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              sub_10002C97C();
            goto LABEL_17;
          }
        }
        else
        {
          -[MSDHVolumeManager waitForSnapshotDeletionOnVolume:](self, "waitForSnapshotDeletionOnVolume:", v7);
        }
        v19 = sub_100024A40();
        v11 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v12 = "Snapshot deleted.";
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("CreateSnapshot")))
      {
        v14 = fs_snapshot_create(v7, "com.apple.snapshot.mobilestoredemo", 0);
        v15 = sub_100024A40();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v11 = v16;
        if (!v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v23) = 0;
            v12 = "Snapshot created.";
            goto LABEL_21;
          }
LABEL_22:
          v18 = 1;
          goto LABEL_23;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_10002C9E8();
      }
      else
      {
        v17 = sub_100024A40();
        v11 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138543362;
          v24 = v6;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown snapshot operation: %{public}@", (uint8_t *)&v23, 0xCu);
        }
      }
    }
LABEL_17:
    v18 = 0;
LABEL_23:

    close(v7);
    goto LABEL_24;
  }
  v21 = sub_100024A40();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10002C8A4();

  v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)mountSnapshotAt:(id)a3 forVolumeAt:(id)a4
{
  id v5;
  int v6;
  int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  v5 = a3;
  v6 = open((const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String"), 0);
  if (v6 <= 0)
  {
    v13 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002C8A4();

    v8 = 0;
  }
  else
  {
    v7 = fs_snapshot_mount(v6, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "com.apple.snapshot.mobilestoredemo", 0);
    v8 = v7 == 0;
    v9 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10002CA54();
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Snapshot mounted.", v15, 2u);
    }

    close(v6);
  }

  return v8;
}

- (BOOL)unmountSnapshotAt:(id)a3
{
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = unmount((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0x80000);
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10002CAC0();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Snapshot unmounted.", v8, 2u);
  }

  return v3 == 0;
}

- (BOOL)setupDemoVolume
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager getAPFSBootContainerDeviceNode](self, "getAPFSBootContainerDeviceNode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager createAPFSVolume:withSizeInMB:inContainer:](self, "createAPFSVolume:withSizeInMB:inContainer:", CFSTR("com.apple.mobilestoredemo.storage"), 64, v4));
    -[MSDHVolumeManager setDemoVolumeDev:](self, "setDemoVolumeDev:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
    if (!v6)
      goto LABEL_8;
  }
  v17[0] = NSFileOwnerAccountName;
  v17[1] = NSFileGroupOwnerAccountName;
  v18[0] = CFSTR("mobile");
  v18[1] = CFSTR("mobile");
  v17[2] = NSFilePosixPermissions;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 448));
  v18[2] = v7;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
  v9 = -[MSDHVolumeManager mountAPFSVolume:atMountPoint:withAttributes:](self, "mountAPFSVolume:atMountPoint:withAttributes:", v8, CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), v6);

  if (v9)
  {
    v10 = sub_100024A40();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
      v15 = 138543362;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Demo volume '%{public}@' is created and mounted.", (uint8_t *)&v15, 0xCu);

    }
    v13 = 1;
  }
  else
  {
LABEL_8:
    v13 = 0;
  }

  return v13;
}

- (BOOL)deleteDemoVolume
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  __int16 v14;
  uint8_t buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
    v5 = -[MSDHVolumeManager unmountAPFSVolume:](self, "unmountAPFSVolume:", v4);

    if (!v5)
      return 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager demoVolumeDev](self, "demoVolumeDev"));
    v7 = -[MSDHVolumeManager deleteAPFSVolume:](self, "deleteAPFSVolume:", v6);

    if (!v7)
      return 0;
    -[MSDHVolumeManager setDemoVolumeDev:](self, "setDemoVolumeDev:", 0);
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v10 = "Demo volume is unmounted and deleted.";
      v11 = (uint8_t *)&v14;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
  }
  else
  {
    v12 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Demo volume not found. Skip delete.";
      v11 = buf;
      goto LABEL_8;
    }
  }

  return 1;
}

- (NSString)userHomePath
{
  return NSHomeDirectoryForUser(CFSTR("mobile"));
}

- (id)getAPFSBootContainerDeviceNode
{
  if (qword_100053DD8 != -1)
    dispatch_once(&qword_100053DD8, &stru_100048DC8);
  return (id)qword_100053DD0;
}

- (id)createAPFSVolume:(id)a3 withSizeInMB:(unint64_t)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  unint64_t v24;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = 0;
  v12 = 0;
  if (v8 && v9)
  {
    if (-[MSDHVolumeManager checkFreeSpaceLeftInContainer:neededSpace:](self, "checkFreeSpaceLeftInContainer:neededSpace:", v9, a4 << 20))
    {
      if (a4)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4 << 20));
        objc_msgSend(v10, "setObject:forKey:", v13, kAPFSVolumeReserveSizeKey);

      }
      objc_msgSend(v10, "setObject:forKey:", v8, kAPFSVolumeNameKey);
      v14 = objc_retainAutorelease(v9);
      if (APFSVolumeCreate(objc_msgSend(v14, "UTF8String"), v10))
      {
        v20 = sub_100024A40();
        v17 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_10002CCC0();
        v11 = 0;
        v12 = 0;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", kAPFSVolumeFSIndexKey));
        v12 = v15;
        if (!v15 || (objc_msgSend(v15, "intValue") & 0x80000000) != 0)
        {
          v19 = sub_100024A40();
          v17 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_10002CC94();
          v11 = 0;
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ss%d"), objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), objc_msgSend(v12, "intValue") + 1));
          v16 = sub_100024A40();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v22 = v11;
            v23 = 2048;
            v24 = a4;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "APFS volume '%{public}@' with size %llu MB is created.", buf, 0x16u);
          }
        }
      }

    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }

  return v11;
}

- (BOOL)deleteAPFSVolume:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = APFSVolumeDelete(objc_msgSend(v5, "UTF8String"));
    v7 = v6 == 0;
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10002CD24();
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "APFS volume '%{public}@' deleted.", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)checkFreeSpaceLeftInContainer:(id)a3 neededSpace:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  if (APFSContainerGetSpaceInfo(objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &v10, &v9))
  {
    v6 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10002CE0C();
  }
  else
  {
    if (v9 > a4)
      return 1;
    v8 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10002CD88(&v9, a4, v7);
  }

  return 0;
}

- (id)lookupAPFSVolumeDevByName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const __CFDictionary *v6;
  io_object_t v7;
  io_registry_entry_t v8;
  void *v9;
  const void *Value;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  id v21;
  NSObject *v22;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  io_name_t name;

  v3 = a3;
  v4 = v3;
  existing = 0;
  memset(name, 0, sizeof(name));
  properties = 0;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = IOServiceNameMatching((const char *)objc_msgSend(v5, "UTF8String"));
    if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing))
    {
      v7 = IOIteratorNext(existing);
      if (v7)
      {
        v8 = v7;
        do
        {
          if (IOObjectConformsTo(v8, "AppleAPFSVolume"))
          {
            memset(name, 0, sizeof(name));
            if (IORegistryEntryGetName(v8, name)
              || IORegistryEntryCreateCFProperties(v8, &properties, kCFAllocatorDefault, 0))
            {
              goto LABEL_31;
            }
            if (!strncmp((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), name, 0x80uLL))
            {
              Value = CFDictionaryGetValue(properties, CFSTR("BSD Name"));
              v11 = objc_claimAutoreleasedReturnValue(Value);
              if (!v11)
                goto LABEL_31;
              v12 = (void *)v11;
              v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v11));

            }
            else
            {
              v9 = 0;
            }
            CFRelease(properties);
          }
          else
          {
            v9 = 0;
          }
          IOObjectRelease(v8);
          v8 = IOIteratorNext(existing);
          if (v8)
            v13 = v9 == 0;
          else
            v13 = 0;
        }
        while (v13);
        IOObjectRelease(existing);
        if (v9)
        {
          v14 = sub_100024A40();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v26 = v5;
            v27 = 2114;
            v28 = v9;
            v16 = "APFS volume '%{public}@' found as '%{public}@'.";
            v17 = v15;
            v18 = 22;
LABEL_24:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
      }
      else
      {
        IOObjectRelease(existing);
        v9 = 0;
      }
      v19 = sub_100024A40();
      v15 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v5;
        v16 = "APFS volume '%{public}@' NOT found.";
        v17 = v15;
        v18 = 12;
        goto LABEL_24;
      }
LABEL_25:

      goto LABEL_26;
    }
    v21 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10002CE70();

  }
  v8 = 0;
LABEL_31:
  if (existing)
    IOObjectRelease(existing);
  if (v8)
    IOObjectRelease(v8);
  if (properties)
    CFRelease(properties);
  v9 = 0;
LABEL_26:

  return v9;
}

- (id)findAPFSVolumeMountPoint:(id)a3
{
  id v3;
  int v4;
  statfs *v5;
  unint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  NSObject *v13;
  id v15;
  NSObject *v16;
  stat v17;
  statfs *v18;
  uint8_t buf[4];
  int v20;

  v3 = a3;
  v18 = 0;
  if (!v3)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_16;
  }
  v4 = getmntinfo_r_np(&v18, 2);
  if (v4 < 1 || (v5 = v18) == 0)
  {
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002CED4();

    goto LABEL_20;
  }
  v6 = 0;
  v7 = 2168 * v4;
  while (1)
  {
    if (!strncmp("apfs", v5[v6 / 0x878].f_fstypename, 0xFuLL))
    {
      v8 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v5 = v18;
      if (!strncmp(v8, v18[v6 / 0x878].f_mntfromname, 0xFuLL))
        break;
    }
    v6 += 2168;
    if (v7 == v6)
    {
      v9 = 0;
      goto LABEL_15;
    }
  }
  memset(&v17, 0, sizeof(v17));
  v10 = stat(v5[v6 / 0x878].f_mntonname, &v17);
  if (v10)
  {
    v11 = v10;
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Mount point corrupted. error - %d", buf, 8u);
    }

    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18[v6 / 0x878].f_mntonname));
  }
  v5 = v18;
LABEL_15:
  free(v5);
LABEL_16:

  return v9;
}

- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  const char *v22;
  int v23;
  unsigned __int8 v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  stat v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  int v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _DWORD v59[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  v12 = 0;
  v58 = 0u;
  memset(v59, 0, sizeof(v59));
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  v47 = 0u;
  v46 = 0u;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  memset(&v34, 0, sizeof(v34));
  v13 = 0;
  if (v8 && v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager findAPFSVolumeMountPoint:](self, "findAPFSVolumeMountPoint:", v8));

    if (v14)
    {
      v26 = sub_100024A40();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10002D0D0();
      v12 = 0;
      v13 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v33 = 0;
      v15 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v33);
      v12 = v33;
      if ((v15 & 1) != 0)
      {
        v16 = objc_retainAutorelease(v9);
        if (stat((const char *)objc_msgSend(v16, "UTF8String"), &v34))
        {
          v29 = sub_100024A40();
          v27 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_10002CFC4(v27);
        }
        else
        {
          v39 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
          WORD4(v40) = 1;
          *(_QWORD *)&v59[3] = *(_QWORD *)&v34.st_uid;
          LODWORD(v40) = 0x100000;
          v17 = objc_retainAutorelease(v16);
          if (mount("apfs", (const char *)objc_msgSend(v17, "UTF8String"), 0x100000, &v39))
          {
            v18 = 3;
            do
            {
              v19 = sub_100024A40();
              v20 = objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v23 = *__error();
                *(_DWORD *)buf = 138543618;
                v36 = v17;
                v37 = 1024;
                v38 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to mount APFS volume on %{public}@ - %{errno}d", buf, 0x12u);
              }

              if (*__error() != 2 || v18 < 2)
                goto LABEL_31;
              --v18;
              usleep(0x7A120u);
              v22 = (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
            }
            while (mount("apfs", v22, v40, &v39));
          }
          if (!v10)
          {
            v11 = 1;
            goto LABEL_32;
          }
          v32 = v12;
          v24 = objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v10, v17, &v32);
          v25 = v32;

          if ((v24 & 1) != 0)
          {
            v11 = 1;
            v12 = v25;
            goto LABEL_32;
          }
          v30 = sub_100024A40();
          v27 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_10002CF48(v25);
          v12 = v25;
        }
      }
      else
      {
        v28 = sub_100024A40();
        v27 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_10002D044((uint64_t)v9, v12, v27);
      }
    }

LABEL_31:
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (BOOL)unmountAPFSVolume:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    v10 = 0;
    v7 = 0;
    v8 = 0;
    v6 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHVolumeManager findAPFSVolumeMountPoint:](self, "findAPFSVolumeMountPoint:", v4));
  v6 = v5 == 0;
  if (!v5)
  {
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Volume is not mounted.", buf, 2u);
    }
    v10 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  v7 = objc_retainAutorelease(v5);
  if (unmount((const char *)objc_msgSend(v7, "UTF8String"), 0x80000))
  {
    v14 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002D188();
    v10 = 0;
LABEL_9:
    v8 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = 0;
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v16);
  v10 = v16;
  if ((v9 & 1) == 0)
  {
    v15 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002D0FC((uint64_t)v7, v10, v12);
    goto LABEL_10;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (void)waitForSnapshotDeletionOnVolume:(int)a3
{
  int v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _QWORD v10[3];
  uint8_t buf[4];
  int v12;

  v10[1] = 0;
  v10[2] = 0;
  v10[0] = 3;
  if (ffsctl(a3, 0x80184A24uLL, v10, 0) < 0)
  {
    v3 = *__error();
    v4 = sub_100024A40();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3 == 35)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        v7 = "Timed out waiting for snapshot deletion to finish.";
        v8 = v5;
        v9 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 67240192;
      v12 = v3;
      v7 = "Wait for snapshot deletion failed: %{public, errno}d";
      v8 = v5;
      v9 = 8;
      goto LABEL_7;
    }

  }
}

- (NSString)demoVolumeDev
{
  return self->_demoVolumeDev;
}

- (void)setDemoVolumeDev:(id)a3
{
  objc_storeStrong((id *)&self->_demoVolumeDev, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoVolumeDev, 0);
}

@end
