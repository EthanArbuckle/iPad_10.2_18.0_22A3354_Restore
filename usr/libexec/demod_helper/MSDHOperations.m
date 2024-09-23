@implementation MSDHOperations

+ (id)sharedInstance
{
  if (qword_100053E48 != -1)
    dispatch_once(&qword_100053E48, &stru_100048F68);
  return (id)qword_100053E40;
}

- (MSDHOperations)init
{
  MSDHOperations *v2;
  MSDHOperations *v3;
  MSDHOperations *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDHOperations;
  v2 = -[MSDHOperations init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MSDHOperations setSignedManifest:](self, "setSignedManifest:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MSDHOperations;
  -[MSDHOperations dealloc](&v3, "dealloc");
}

- (MSDSignedManifest)signedManifest
{
  MSDSignedManifest *signedManifest;

  signedManifest = self->_signedManifest;
  if (!signedManifest)
  {
    -[MSDHOperations updateSignedManifest](self, "updateSignedManifest");
    signedManifest = self->_signedManifest;
  }
  return signedManifest;
}

- (BOOL)updateSignedManifest
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  MSDSignedManifest *v8;
  MSDSignedManifest *signedManifest;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;

  v3 = (void *)os_transaction_create("Need to keep manaifest in memory", a2);
  -[MSDHOperations setTransaction:](self, "setTransaction:", v3);

  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[MSDHOperations updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - Loading signed manifest.", (uint8_t *)&v18, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist"));

  if ((v7 & 1) != 0)
  {
    v8 = (MSDSignedManifest *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactory createSignedManifestFromManifestFile:](MSDSignedManifestFactory, "createSignedManifestFromManifestFile:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist")));
    signedManifest = self->_signedManifest;
    self->_signedManifest = v8;

    if (self->_signedManifest)
      return 1;
    v15 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002DD00(v12, v16, v17);
  }
  else
  {
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002DD88(v12, v13, v14);
  }

  return 0;
}

- (BOOL)migratePreferencesFile
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/root/Library/Preferences/"), "stringByAppendingPathComponent:", CFSTR("com.apple.MobileStoreDemo.plist")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingPathComponent:", CFSTR("com.apple.MobileStoreDemo.plist")));
  if (!objc_msgSend(v2, "fileExistsAtPath:", v3)
    || (objc_msgSend(v2, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v9 = 0;
    v7 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v16 = 0;
  v5 = objc_msgSend(v2, "moveItemAtPath:toPath:error:", v3, v4, &v16);
  v6 = v16;
  if ((v5 & 1) == 0)
  {
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002DE70();
    v7 = 0;
    goto LABEL_14;
  }
  v17[0] = NSFileOwnerAccountName;
  v17[1] = NSFileGroupOwnerAccountName;
  v18[0] = CFSTR("mobile");
  v18[1] = CFSTR("mobile");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v15 = v6;
  v8 = objc_msgSend(v2, "setAttributes:ofItemAtPath:error:", v7, v4, &v15);
  v9 = v15;

  if ((v8 & 1) == 0)
  {
    v14 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002DE10();
    v6 = v9;
LABEL_14:

    v10 = 0;
    v9 = v6;
    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)prepareDirectory:(id)a3 writableByNonRoot:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  unsigned __int8 v15;
  id v16;
  BOOL v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v6, "fileExistsAtPath:", v5) & 1) != 0)
  {
    v7 = 0;
    if (v4)
      goto LABEL_3;
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v23 = 0;
  v15 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v23);
  v16 = v23;
  v9 = v16;
  if ((v15 & 1) == 0)
  {
    v20 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002DFF0();
    goto LABEL_17;
  }
  v7 = v16;
  if (!v4)
    goto LABEL_10;
LABEL_3:
  v22 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesOfItemAtPath:error:", v5, &v22));
  v9 = v22;

  if (!v8)
  {
    v19 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002DED8();
LABEL_17:
    v11 = 0;
LABEL_18:

    v17 = 0;
    v7 = v9;
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)objc_msgSend(v8, "filePosixPermissions") | 0x3Fu));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSFilePosixPermissions, 0));

  v21 = v9;
  v12 = objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v11, v5, &v21);
  v7 = v21;

  if ((v12 & 1) == 0)
  {
    v13 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002DF64();
    v9 = v7;
    goto LABEL_18;
  }
LABEL_11:
  v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)removeDirectory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);
  else
    v5 = 1;

  return v5;
}

- (BOOL)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  MSDManifest *v20;
  MSDManifest *v21;
  void *v22;
  unsigned __int8 v23;
  BOOL v24;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));

  if (!v17)
  {
    v26 = sub_100024A40();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10002E07C(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_11;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getManifestDataFromSection:forIdentifier:", v13, v12));

  if (!v19)
  {
    v35 = sub_100024A40();
    v27 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10002E0EC();
LABEL_11:
    v19 = 0;
    v20 = 0;
    v21 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v20 = -[MSDManifest initWithDictionary:andUserHomePath:]([MSDManifest alloc], "initWithDictionary:andUserHomePath:", v19, v15);
  -[MSDManifest setRootPath:](v20, "setRootPath:", v14);
  v21 = objc_alloc_init(MSDManifest);
  -[MSDManifest setRootPath:](v21, "setRootPath:", v14);
  if (!-[MSDManifest addFilesUsingSourceManifest:](v21, "addFilesUsingSourceManifest:", v20))
  {
    v36 = sub_100024A40();
    v27 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10002E178(v27, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_14;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest dict](v21, "dict"));
  v23 = -[MSDHOperations writeDictionary:toFile:](self, "writeDictionary:toFile:", v22, v16);

  if ((v23 & 1) == 0)
  {
LABEL_15:
    v24 = 0;
    goto LABEL_6;
  }
  v24 = 1;
LABEL_6:

  return v24;
}

- (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  NSObject *v11;
  id v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:", a4, 0));
  objc_msgSend(v6, "open");
  v12 = 0;
  v7 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:](NSPropertyListSerialization, "writePropertyList:toStream:format:options:error:", v5, v6, 200, 0, &v12);

  v8 = v12;
  objc_msgSend(v6, "close");

  if (v7 <= 0)
  {
    v10 = sub_100024A40();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10002E1E8(v8, v11);

  }
  return v7 > 0;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5;
}

- (id)readPlistFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v4, &v10));
  v6 = v10;

  if (!v5)
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002E268();

  }
  return v5;
}

- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v11;
  NSObject *v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = v7;
  if (!v5)
  {
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002E2E4();
    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "createFileAtPath:contents:attributes:", v5, 0, v6) & 1) == 0)
  {
    v13 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002E310();
LABEL_9:

    v9 = 0;
    goto LABEL_4;
  }
  v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  LOBYTE(v6) = objc_msgSend(v12, "cloneFile:to:expectingHash:correctOwnership:", v11, v10, v9, v6);

  return v6;
}

- (BOOL)deleteNvram:(id)a3
{
  id v3;
  io_registry_entry_t v4;
  io_object_t v5;
  kern_return_t v6;
  BOOL v7;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  mach_port_t mainPort;

  v3 = a3;
  mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    v9 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10002E3C8();
    goto LABEL_10;
  }
  v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v4)
  {
    v11 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10002E370();
LABEL_10:

    v7 = 0;
    goto LABEL_5;
  }
  v5 = v4;
  v6 = IORegistryEntrySetCFProperty(v4, CFSTR("IONVRAM-DELETE-PROPERTY"), v3);
  v7 = v6 == 0;
  if (v6)
  {
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002E39C();

  }
  IOObjectRelease(v5);
LABEL_5:

  return v7;
}

- (BOOL)writeNVRam:(id)a3 withValue:(id)a4
{
  __CFString *v5;
  id v6;
  BOOL v7;
  io_registry_entry_t v8;
  io_object_t v9;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  mach_port_t mainPort;

  v5 = (__CFString *)a3;
  v6 = a4;
  mainPort = 0;
  v7 = 0;
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("ownership-warning")))
  {
    if (IOMasterPort(bootstrap_port, &mainPort))
    {
      v11 = sub_100024A40();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10002E3C8();
    }
    else
    {
      v8 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
      if (v8)
      {
        v9 = v8;
        if (IORegistryEntrySetCFProperty(v8, v5, objc_msgSend(v6, "dataUsingEncoding:", 4)))
        {
          v14 = sub_100024A40();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_10002E3F4();
        }
        else
        {
          if (!IORegistryEntrySetCFProperty(v9, CFSTR("IONVRAM-SYNCNOW-PROPERTY"), v5))
          {
            v7 = 1;
LABEL_7:
            IOObjectRelease(v9);
            goto LABEL_8;
          }
          v16 = sub_100024A40();
          v15 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_10002E39C();
        }

        v7 = 0;
        goto LABEL_7;
      }
      v13 = sub_100024A40();
      v12 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10002E370();
    }

    v7 = 0;
  }
LABEL_8:

  return v7;
}

- (BOOL)manageDataVolume:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  unsigned __int8 v6;
  MSDHSnapshottedDataSaver *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CreateSnapshot")))
    goto LABEL_2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("DeleteSnapshot")))
  {
    v5 = CFSTR("DeleteSnapshot");
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RevertSnapshot")))
  {
    if (objc_msgSend(v4, "manageSnapshot:forVolumeAt:", CFSTR("RevertSnapshot"), CFSTR("/private/var")))
    {
      v8 = objc_alloc_init(MSDHSnapshottedDataSaver);
      -[MSDHSnapshottedDataSaver rescueDataToShelterFromSnapshottedVolumes](v8, "rescueDataToShelterFromSnapshottedVolumes");

      v6 = 1;
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("CommitSnapshot")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("MountSnapshot")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v20 = 0;
      v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"), 1, 0, &v20);
      v11 = v20;
      if ((v10 & 1) != 0)
      {
        v6 = objc_msgSend(v4, "mountSnapshotAt:forVolumeAt:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"), CFSTR("/private/var"));
      }
      else
      {
        v15 = sub_100024A40();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_10002E420(v11);

        v6 = 0;
      }
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("UnmountSnapshot")))
      {
        v13 = sub_100024A40();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v3;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unknown volume operation: %{public}@", buf, 0xCu);
        }

        goto LABEL_22;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v6 = objc_msgSend(v4, "unmountSnapshotAt:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"));
      v19 = 0;
      v12 = objc_msgSend(v9, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot"), &v19);
      v11 = v19;
      if ((v12 & 1) == 0)
      {
        v17 = sub_100024A40();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_10002E4A8(v11);

      }
    }

    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "manageSnapshot:forVolumeAt:", CFSTR("DeleteSnapshot"), CFSTR("/private/var")))
  {
LABEL_22:
    v6 = 0;
    goto LABEL_6;
  }
LABEL_2:
  v5 = CFSTR("CreateSnapshot");
LABEL_5:
  v6 = objc_msgSend(v4, "manageSnapshot:forVolumeAt:", v5, CFSTR("/private/var"));
LABEL_6:

  return v6;
}

- (BOOL)manageDemoVolume:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Setup")))
  {
    v5 = objc_msgSend(v4, "setupDemoVolume");
LABEL_5:
    v6 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Delete")))
  {
    v5 = objc_msgSend(v4, "deleteDemoVolume");
    goto LABEL_5;
  }
  v7 = sub_100024A40();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown volume operation: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  unsigned __int8 v11;
  NSObject *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  int v22;
  __CFString *v23;

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
  if (!v6)
  {
    v16 = sub_100024A40();
    v8 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002E530();
    goto LABEL_23;
  }
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("CreateSnapshot")) & 1) == 0
    && (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("DeleteSnapshot")) & 1) == 0
    && !-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("RevertSnapshot")))
  {
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("CommitSnapshot")))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userHomePath"));
      if (v8)
      {
        if (objc_msgSend(v7, "manageSnapshot:forVolumeAt:", CFSTR("DeleteSnapshot"), v8))
        {
          v10 = CFSTR("CreateSnapshot");
          v9 = v7;
          goto LABEL_7;
        }
LABEL_23:
        v11 = 0;
        goto LABEL_8;
      }
      v19 = sub_100024A40();
      v18 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      goto LABEL_28;
    }
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("MountSnapshot")))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userHomePath"));
      if (v8)
      {
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"), "stringByAppendingPathComponent:", v6));
        v14 = objc_msgSend(v7, "mountSnapshotAt:forVolumeAt:", v13, v8);
LABEL_19:
        v11 = v14;
LABEL_20:

        goto LABEL_8;
      }
      v20 = sub_100024A40();
      v13 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
LABEL_34:
        sub_10002E55C();
    }
    else
    {
      if (!-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("UnmountSnapshot")))
      {
        v15 = sub_100024A40();
        v8 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 138543362;
          v23 = v5;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown volume operation: %{public}@", (uint8_t *)&v22, 0xCu);
        }
        goto LABEL_23;
      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userHomePath"));
      if (v8)
      {
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"), "stringByAppendingPathComponent:", v6));
        v14 = objc_msgSend(v7, "unmountSnapshotAt:", v13);
        goto LABEL_19;
      }
      v21 = sub_100024A40();
      v13 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    v11 = 0;
    goto LABEL_20;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userHomePath"));
  if (!v8)
  {
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
LABEL_27:
      sub_10002E55C();
LABEL_28:

    goto LABEL_23;
  }
  v9 = v7;
  v10 = v5;
LABEL_7:
  v11 = objc_msgSend(v9, "manageSnapshot:forVolumeAt:", v10, v8);
LABEL_8:

  return v11;
}

- (BOOL)prepareWorkContainerInUserHome:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unsigned __int8 v33;
  id v34;
  NSObject *v35;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  void *v55;
  _QWORD v56[4];
  void *v57;
  _QWORD v58[4];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[3];
  _QWORD v64[3];

  v3 = a3;
  if (a3)
  {
    v5 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userHomePath"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/MSD_staging")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/MSD_secondary_staging")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/MSD_stashed_staging")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/.backup")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v63[0] = NSFileOwnerAccountName;
  v63[1] = NSFileGroupOwnerAccountName;
  v64[0] = CFSTR("mobile");
  v64[1] = CFSTR("mobile");
  v63[2] = NSFilePosixPermissions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 448));
  v64[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 3));

  v12 = sub_100024A40();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[MSDHOperations prepareWorkContainerInUserHome:]";
    v61 = 2114;
    v62 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
  }

  v38 = v7;
  if (v3)
  {
    v58[0] = v7;
    v14 = v41;
    v58[1] = v42;
    v58[2] = v41;
    v15 = v40;
    v58[3] = v40;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4));
    objc_msgSend(v8, "addObjectsFromArray:", v16);

    v57 = v42;
    v17 = &v57;
  }
  else
  {
    v56[0] = v7;
    v14 = v41;
    v56[1] = v42;
    v56[2] = v41;
    v15 = v39;
    v56[3] = v39;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 4));
    objc_msgSend(v8, "addObjectsFromArray:", v18);

    v55 = v42;
    v17 = &v55;
  }
  v17[1] = v14;
  v17[2] = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:"));
  objc_msgSend(v9, "addObjectsFromArray:", v19);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(v20);
        -[MSDHOperations removeDirectory:](self, "removeDirectory:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v22);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v25 = v8;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v26)
  {
    v27 = v26;
    v37 = v5;
    v28 = 0;
    v29 = *(_QWORD *)v46;
    while (2)
    {
      v30 = 0;
      v31 = v28;
      do
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(v25);
        v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v30);
        v44 = v31;
        v33 = objc_msgSend(v43, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v32, 1, v11, &v44, v37, v38);
        v28 = v44;

        if ((v33 & 1) == 0)
        {
          v34 = sub_100024A40();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            sub_10002E5BC();

          goto LABEL_29;
        }
        v30 = (char *)v30 + 1;
        v31 = v28;
      }
      while (v27 != v30);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v27)
        continue;
      break;
    }
LABEL_29:

    v5 = v37;
  }
  else
  {
    v33 = 1;
  }

  return v33;
}

- (BOOL)destroyWorkContainerInUserHome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v9;
  NSObject *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userHomePath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
  if (!-[MSDHOperations removeDirectory:](self, "removeDirectory:", v5))
  {
    v9 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_9;
  }
  if (!-[MSDHOperations removeDirectory:](self, "removeDirectory:", v6))
  {
    v11 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
LABEL_8:
      sub_10002E638();
LABEL_9:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = 1;
LABEL_4:

  return v7;
}

- (BOOL)moveUserHomeStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  unsigned __int8 v24;
  id v25;
  unsigned __int8 v26;
  BOOL v27;
  id v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  void *v44;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userHomePath"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v10));
  v38 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v11, &v38));
  v13 = v38;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileType"));
    v15 = objc_msgSend(v14, "isEqualToString:", NSFileTypeSymbolicLink);

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[MSDHOperations getPathInUserHomeDirectory:](self, "getPathInUserHomeDirectory:", v6));
      v37 = v13;
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationOfSymbolicLinkAtPath:error:", v11, &v37));
      v18 = v37;

      v19 = sub_100024A40();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v40 = v11;
          v41 = 2114;
          v42 = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found valid wormhole in staging from %{public}@ to %{public}@", buf, 0x16u);
        }

        if (!-[MSDHOperations moveStagingToFinal:finalPath:](self, "moveStagingToFinal:finalPath:", v17, v16))
          goto LABEL_28;
        v22 = sub_100024A40();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v40 = v11;
          v41 = 2114;
          v42 = v16;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Creating new wormhole in staging from %{public}@ to %{public}@", buf, 0x16u);
        }

        v36 = v18;
        v24 = objc_msgSend(v8, "removeItemAtPath:error:", v11, &v36);
        v25 = v36;

        if ((v24 & 1) != 0)
        {
          v35 = v25;
          v26 = objc_msgSend(v8, "createSymbolicLinkAtPath:withDestinationPath:error:", v11, v16, &v35);
          v18 = v35;

          if ((v26 & 1) != 0)
          {

            v27 = 1;
LABEL_12:
            v13 = v18;
            goto LABEL_16;
          }
          v33 = sub_100024A40();
          v21 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
            *(_DWORD *)buf = 138543874;
            v40 = v11;
            v41 = 2114;
            v42 = v16;
            v43 = 2114;
            v44 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot create symlink from %{public}@ to %{public}@ - %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v32 = sub_100024A40();
          v21 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_10002E790();
          v18 = v25;
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        sub_10002E714();
      }

LABEL_28:
      v27 = 0;
      goto LABEL_12;
    }
    v28 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileType"));
      *(_DWORD *)buf = 138543618;
      v40 = v11;
      v41 = 2114;
      v42 = v29;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wormhole in staging %{public}@ has unexpected file type - %{public}@", buf, 0x16u);

    }
    v27 = 1;
  }
  else
  {
    v31 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002E698();
    v27 = 0;
  }
LABEL_16:

  return v27;
}

- (BOOL)disableLaunchdServicesForWatch
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int service_enabled;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  int v17;
  id v18;
  NSObject *v19;
  const char *v20;
  id v21;
  __int16 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;
  _BYTE v32[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("com.apple.atc"), CFSTR("com.apple.eventkitsyncd"), CFSTR("com.apple.imautomatichistorydeletionagent"), 0));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v6);
        v23 = 0;
        v8 = objc_retainAutorelease(v7);
        service_enabled = launch_get_service_enabled(objc_msgSend(v8, "UTF8String"), (char *)&v23 + 1, &v23);
        if (service_enabled)
        {
          v10 = service_enabled;
          v11 = sub_100024A40();
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v8;
            v30 = 1024;
            v31 = v10;
            v19 = v12;
            v20 = "Failed to get status for launchd service '%{public}@' with error - %d";
LABEL_18:
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x12u);
          }
          goto LABEL_8;
        }
        if (HIBYTE(v23) | v23)
        {
          v13 = sub_100024A40();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disabling launchd service '%{public}@'", buf, 0xCu);
          }

          v15 = objc_retainAutorelease(v8);
          v16 = launch_set_service_enabled(objc_msgSend(v15, "UTF8String"), 0);
          if (v16)
          {
            v17 = v16;
            v18 = sub_100024A40();
            v12 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v15;
              v30 = 1024;
              v31 = v17;
              v19 = v12;
              v20 = "Failed to disable launchd service '%{public}@' with error - %d";
              goto LABEL_18;
            }
LABEL_8:

          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v21 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      v4 = v21;
    }
    while (v21);
  }

  return 1;
}

- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  NSObject *v26;
  unsigned __int8 v27;
  id v28;
  BOOL v29;
  unsigned __int8 v30;
  id v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *obj;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v43 = v6;
  v52 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v55 = "-[MSDHOperations moveStagingToFinal:finalPath:]";
    v56 = 2114;
    v57 = v5;
    v58 = 2114;
    v59 = v43;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - stagingPath:  %{public}@ - finalPath:  %{public}@", buf, 0x20u);
  }

  if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v5, &v52))
    v11 = v52 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v36 = sub_100024A40();
    obj = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      sub_10002E888();
    v28 = 0;
    goto LABEL_38;
  }
  v41 = v5;
  if (objc_msgSend(v8, "fileExistsAtPath:", v43))
  {
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtPath:", v5));
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v12)
    {
      v13 = v12;
      v42 = 0;
      v14 = *(_QWORD *)v49;
      v40 = v8;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          v17 = objc_autoreleasePoolPush();
          v18 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v16));
          if (objc_msgSend(v8, "fileExistsAtPath:", v18))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingPathComponent:", v16));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByDeletingLastPathComponent"));
            if ((objc_msgSend(v8, "fileExistsAtPath:", v19) & 1) == 0
              && objc_msgSend(v8, "fileExistsAtPath:", v20))
            {
              v21 = sub_100024A40();
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                v55 = v18;
                v56 = 2114;
                v57 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Moving %{public}@ to %{public}@", buf, 0x16u);
              }

              v47 = v42;
              v23 = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v18, v19, &v47);
              v24 = v47;

              if ((v23 & 1) == 0)
              {
                v32 = sub_100024A40();
                v33 = objc_claimAutoreleasedReturnValue(v32);
                v28 = v24;
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedDescription"));
                  *(_DWORD *)buf = 138543874;
                  v55 = v18;
                  v56 = 2114;
                  v57 = v19;
                  v58 = 2114;
                  v59 = v35;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Cannot move %{public}@ to %{public}@ - %{public}@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v17);
                v34 = obj;
                v8 = v40;
                v7 = v41;
                goto LABEL_37;
              }
              v42 = v24;
              v8 = v40;
              v7 = v41;
            }

          }
          objc_autoreleasePoolPop(v17);
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v42 = 0;
    }

    v46 = v42;
    v30 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v46);
    v28 = v46;

    if ((v30 & 1) != 0)
    {
      v29 = 1;
LABEL_31:
      v7 = v41;
LABEL_32:

      goto LABEL_33;
    }
    v38 = sub_100024A40();
    v34 = objc_claimAutoreleasedReturnValue(v38);
    v7 = v41;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10002E80C();
LABEL_37:

    goto LABEL_38;
  }
  v25 = sub_100024A40();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = (const char *)v5;
    v56 = 2114;
    v57 = v43;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Moving %{public}@ to %{public}@", buf, 0x16u);
  }

  v45 = 0;
  v27 = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v5, v43, &v45);
  v28 = v45;
  if ((v27 & 1) == 0)
  {
    v37 = sub_100024A40();
    obj = objc_claimAutoreleasedReturnValue(v37);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      v29 = 0;
      goto LABEL_31;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedDescription"));
    *(_DWORD *)buf = 138543874;
    v55 = (const char *)v5;
    v56 = 2114;
    v57 = v43;
    v58 = 2114;
    v59 = v39;
    _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "Could not move %{public}@ to %{public}@ with error - %{public}@", buf, 0x20u);

    v7 = v5;
LABEL_38:
    v29 = 0;
    goto LABEL_32;
  }
  v29 = 1;
  v7 = v5;
LABEL_33:

  return v29;
}

- (BOOL)switchToBackupFolder
{
  id v2;
  NSObject *v3;
  const std::__fs::filesystem::path *v4;
  const std::__fs::filesystem::path *v5;
  std::error_code *v6;
  int v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  __CFString *v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  __CFString *v24;
  const std::__fs::filesystem::path *v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  id v29;
  id v30;
  unsigned __int8 v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;

  v2 = sub_100024A40();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = CFSTR("/private/var/.backup");
    v39 = 2114;
    v40 = CFSTR("/private/var/backup");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Renaming %{public}@ to %{public}@...", buf, 0x16u);
  }

  v4 = (const std::__fs::filesystem::path *)objc_msgSend(CFSTR("/private/var/.backup"), "fileSystemRepresentation");
  v5 = (const std::__fs::filesystem::path *)objc_msgSend(CFSTR("/private/var/backup"), "fileSystemRepresentation");
  rename(v4, v5, v6);
  if (!v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userHomePath"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("/backup")));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/backup"), "stringByAppendingPathComponent:", v12));
    v36 = 0;
    v16 = -[NSObject createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v36);
    v17 = v36;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      v30 = sub_100024A40();
      v23 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10002EA60();
      v24 = 0;
      goto LABEL_21;
    }
    v35 = v17;
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject destinationOfSymbolicLinkAtPath:error:](v9, "destinationOfSymbolicLinkAtPath:error:", v15, &v35));
    v20 = v35;

    v21 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2114;
        v40 = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Renaming %{public}@ to %{public}@...", buf, 0x16u);
      }

      v24 = objc_retainAutorelease(v19);
      v25 = (const std::__fs::filesystem::path *)-[__CFString fileSystemRepresentation](v24, "fileSystemRepresentation");
      v26 = (const std::__fs::filesystem::path *)-[__CFString fileSystemRepresentation](objc_retainAutorelease(v14), "fileSystemRepresentation");
      rename(v25, v26, v27);
      if (!v28)
      {
        v34 = v20;
        v32 = -[NSObject removeItemAtPath:error:](v9, "removeItemAtPath:error:", v15, &v34);
        v18 = v34;

        if ((v32 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_22;
        }
        v33 = sub_100024A40();
        v23 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_10002E964();
LABEL_21:

        v10 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v29 = sub_100024A40();
      v23 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10002E9E0(v23);
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10002E8E8();
      v24 = 0;
    }
    v18 = v20;
    goto LABEL_21;
  }
  v8 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10002EADC(v9);
  v10 = 0;
LABEL_23:

  return v10;
}

- (BOOL)reboot
{
  int v2;
  int v3;
  id v4;
  NSObject *v5;
  uint64_t v6;

  v2 = reboot3(0, a2);
  if (v2)
  {
    v3 = v2;
    v4 = sub_100024A40();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10002EB5C(v3, v5, v6);

  }
  return 0;
}

- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  MSDHFileMetadataRestore *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = -[MSDHFileMetadataRestore initWithManifestUID:deviceUID:]([MSDHFileMetadataRestore alloc], "initWithManifestUID:deviceUID:", v13, v12);

  if (!v14)
  {
    v20 = sub_100024A40();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10002EBC4();
    goto LABEL_13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));

  if (!v15)
  {
    v22 = sub_100024A40();
    v21 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10002EBF0(v21, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_13;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mergedBackupManifest:", location, length));

  if (!v17)
  {
    v30 = sub_100024A40();
    v21 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10002EC60();
LABEL_13:

    v17 = 0;
    goto LABEL_14;
  }
  if (!-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:](v14, "restoreAttributesUnder:fromManifestData:", v11, v17))
  {
LABEL_14:
    v18 = 0;
    goto LABEL_6;
  }
  v18 = 1;
LABEL_6:

  return v18;
}

- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MSDHFileMetadataRestore *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unsigned __int8 v21;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  v17 = -[MSDHFileMetadataRestore initWithManifestUID:deviceUID:]([MSDHFileMetadataRestore alloc], "initWithManifestUID:deviceUID:", v16, v15);

  if (!v17)
  {
    v23 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002ECD4();
    goto LABEL_12;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));

  if (!v18)
  {
    v24 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002ED00(v20, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_12;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getManifestDataFromSection:forIdentifier:", v13, v14));

  if (!v20)
  {
    v32 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002ED70();
LABEL_12:
    v21 = 0;
    goto LABEL_5;
  }
  v21 = -[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:](v17, "restoreAttributesUnder:fromManifestData:", v12, v20);
LABEL_5:

  return v21;
}

- (BOOL)quitHelper
{
  exit(0);
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  MSDFileArchiver *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), "stringByAppendingPathComponent:", v4));

  if (objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz")))
  {
    v46 = 0;
    v7 = objc_msgSend(v5, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"), &v46);
    v8 = v46;
    v9 = v8;
    if ((v7 & 1) == 0)
    {
      v39 = sub_100024A40();
      v14 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10002EF80();
      goto LABEL_37;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v5, "fileExistsAtPath:", v6))
  {
    v45 = v10;
    v11 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v45);
    v9 = v45;

    if ((v11 & 1) == 0)
    {
      v40 = sub_100024A40();
      v14 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10002EF54();
      goto LABEL_37;
    }
    v10 = v9;
  }
  v44 = v10;
  v12 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v44);
  v9 = v44;

  if ((v12 & 1) == 0)
  {
    v33 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002EF28();
    goto LABEL_37;
  }
  v13 = MGCopyAnswer(CFSTR("DiskUsage"), 0);
  if (!v13)
  {
    v34 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002EDD8();
    v30 = 1;
    goto LABEL_19;
  }
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", kMGQDiskUsageAmountDataAvailable));
  v16 = v15;
  if (!v15 || (uint64_t)objc_msgSend(v15, "longLongValue") <= 52428800)
  {
    v32 = sub_100024A40();
    v24 = (MSDFileArchiver *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
      sub_10002EE04(v16, &v24->super);
    goto LABEL_36;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("demod.log")));
  v18 = -[MSDHOperations generateLogsForPredicate:toFile:](self, "generateLogsForPredicate:toFile:", CFSTR("subsystem == 'com.apple.MobileStoreDemo'"), v17);

  if ((v18 & 1) == 0)
  {
    v35 = sub_100024A40();
    v24 = (MSDFileArchiver *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
      sub_10002EEFC();
    goto LABEL_36;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("demoloop.log")));
  v20 = -[MSDHOperations generateLogsForPredicate:toFile:](self, "generateLogsForPredicate:toFile:", CFSTR("subsystem == 'com.apple.ist.dcota'"), v19);

  if ((v20 & 1) == 0)
  {
    v36 = sub_100024A40();
    v24 = (MSDFileArchiver *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
      sub_10002EED0();
LABEL_36:

LABEL_37:
    v30 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/var/logs/demod/demod-finish-demo-restore.log")))
  {
LABEL_17:
    v24 = objc_alloc_init(MSDFileArchiver);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz")));
    v27 = -[MSDFileArchiver compressContent:toPath:](v24, "compressContent:toPath:", v25, v26);

    if ((v27 & 1) != 0)
    {
      v47[0] = NSFileOwnerAccountName;
      v47[1] = NSFileGroupOwnerAccountName;
      v48[0] = CFSTR("mobile");
      v48[1] = CFSTR("mobile");
      v47[2] = NSFilePosixPermissions;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 448));
      v48[2] = v28;
      v29 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 3));

      objc_msgSend(v5, "changeFileAttributes:atPath:", v29, CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"));
      v30 = 1;
      v14 = v29;
      goto LABEL_19;
    }
    v37 = sub_100024A40();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_10002EE78();

    goto LABEL_36;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("demod-finish-demo-restore.log")));
  v43 = v9;
  v22 = objc_msgSend(v5, "copyItemAtPath:toPath:error:", CFSTR("/var/logs/demod/demod-finish-demo-restore.log"), v21, &v43);
  v23 = v43;

  if ((v22 & 1) != 0)
  {
    v9 = v23;
    goto LABEL_17;
  }
  v41 = sub_100024A40();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    sub_10002EEA4();

  v30 = 0;
  v9 = v23;
LABEL_19:

  if (objc_msgSend(v5, "fileExistsAtPath:", v6))
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  return v30;
}

- (BOOL)generateLogsForPredicate:(id)a3 toFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  NSObject *v16;
  char v17;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSLogEventStore localStore](OSLogEventStore, "localStore"));
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_100020140;
  v40 = sub_100020150;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v9 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100020140;
  v30 = sub_100020150;
  v31 = 0;
  objc_msgSend(v7, "createFileAtPath:contents:attributes:", v6, 0, 0);
  v10 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v6));
  v11 = (void *)v27[5];
  v27[5] = v10;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100020158;
  v20[3] = &unk_100048FE0;
  v23 = &v36;
  v12 = v5;
  v21 = v12;
  v24 = &v32;
  v13 = v9;
  v22 = v13;
  v25 = &v26;
  objc_msgSend(v8, "prepareWithCompletionHandler:", v20);
  v14 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request to collect MobileStoreDemo logs timed out.", v19, 2u);
    }

    objc_msgSend((id)v37[5], "invalidate");
  }
  objc_msgSend((id)v27[5], "closeFile");
  v17 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = sub_100024A40();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, ">>> Copying item from '%{public}@'", buf, 0xCu);
  }

  if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), "stringByAppendingPathComponent:", v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));
    v18 = 0;
    v9 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v18);
    v10 = v18;
    if ((v9 & 1) != 0)
    {
      if ((objc_msgSend(v4, "cloneFile:to:expectingHash:correctOwnership:", v3, v7, 0, 0) & 1) != 0)
      {
        v11 = +[MSDXattr setContentRoot:](MSDXattr, "setContentRoot:", v7);

        goto LABEL_7;
      }
      v16 = sub_100024A40();
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v10, "localizedDescription"));
        *(_DWORD *)buf = 138543874;
        v20 = v3;
        v21 = 2114;
        v22 = v7;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to copy item from %{public}@ to %{public}@ with error - %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v14 = sub_100024A40();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10002EFAC();
    }

    v11 = 0;
    goto LABEL_7;
  }
  v13 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10002F028();
  v11 = 1;
LABEL_7:

  return v11;
}

- (BOOL)runPreflightChecksOnSecondPartyAppData:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v5;
  void *v6;
  MSDHSnapshottedDataSaver *v7;
  BOOL v8;
  NSString *v9;
  char *v10;
  id v11;
  NSObject *v12;
  char *v14;
  char *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int64_t v19;
  __CFString *v20;
  id v21;
  NSObject *v22;
  BOOL v23;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v5 = a3;
  v29 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_alloc_init(MSDHSnapshottedDataSaver);
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v29))
    v8 = v29 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("App data folder does not exist or is not a folder:  %@"), v5, v27, v28);
LABEL_22:
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
    v18 = 0;
    goto LABEL_23;
  }
  v10 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](v7, "getFileSizeForItemAtPath:", v5);
  v11 = sub_100024A40();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10002F1A8();

  if (v10 == (char *)-1)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to calculate size of source data:  %@"), v5, v27, v28);
    goto LABEL_22;
  }
  if ((unint64_t)v10 > 0x280000000)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Size of source data:  %lld at:  %@ exceeds max size of:  %llu"), v10, v5, 0x280000000);
    goto LABEL_22;
  }
  if (!-[MSDHSnapshottedDataSaver canDeviceHaveEnoughSpaceForItemDomainWithSize:](v7, "canDeviceHaveEnoughSpaceForItemDomainWithSize:", v10))
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device does not have enough space to preserve data - Data size:  %lld"), v10, v27, v28);
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter")))
  {
    v14 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](v7, "getFileSizeForItemAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"));
    if (v14 == (char *)-1)
    {
      v18 = 0;
      v20 = CFSTR("Failed to calculate current size of second party app data shelter.");
      goto LABEL_23;
    }
    v15 = v14;
    v16 = sub_100024A40();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_10002F148();

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"), "stringByAppendingPathComponent:", v5));
    if (objc_msgSend(v6, "fileExistsAtPath:", v18))
    {
      v19 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](v7, "getFileSizeForItemAtPath:", v18);
      if (v19 == -1)
      {
        v20 = CFSTR("Failed to calculate size of existing second party app data");
        goto LABEL_23;
      }
      v15 -= v19;
    }
  }
  else
  {
    v15 = 0;
    v18 = 0;
  }
  v25 = sub_100024A40();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_10002F0E8();

  if (&v10[(_QWORD)v15] <= (char *)0x280000000)
  {
    v23 = 1;
    goto LABEL_29;
  }
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The current size of the second-party data shelter is %llu.  Saving this data of size %lld bytes will cause it to exceed the data cap of %lld bytes."), v15, v10, 0x280000000));
LABEL_23:
  if (a4 && v20)
    *a4 = objc_retainAutorelease(v20);
  v21 = sub_100024A40();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10002F088();

  v23 = 0;
LABEL_29:

  return v23;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  BOOL v17;
  int *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v35 = 0;
  v8 = -[MSDHOperations runPreflightChecksOnSecondPartyAppData:withReturnErrorMsg:](self, "runPreflightChecksOnSecondPartyAppData:withReturnErrorMsg:", v6, &v35);
  v9 = v35;
  if (!v8)
  {
    v23 = 0;
    v10 = 0;
    v15 = 0;
    goto LABEL_19;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"), "stringByAppendingPathComponent:", v6));
  if (objc_msgSend(v7, "fileExistsAtPath:", v10))
  {
    v34 = 0;
    v11 = objc_msgSend(v7, "removeItemAtPath:error:", v10, &v34);
    v12 = v34;
    v13 = v12;
    if ((v11 & 1) == 0)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
      v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete destination folder in persitent storage - Error:  %@"), v20));

      v15 = 0;
      goto LABEL_15;
    }
    v14 = v12;
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingLastPathComponent"));
  if ((objc_msgSend(v7, "fileExistsAtPath:", v10) & 1) != 0)
  {
    v13 = v14;
LABEL_9:
    if ((objc_msgSend(v7, "cloneFile:to:expectingHash:correctOwnership:", v6, v10, 0, 0) & 1) != 0)
    {
      if (+[MSDXattr setContentRoot:](MSDXattr, "setContentRoot:", v10))
      {
        v17 = 1;
        goto LABEL_31;
      }
      v22 = __error();
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set xattr for destination folder in persistent storage - Error:  %s"), strerror(*v22), v31);
    }
    else
    {
      v18 = __error();
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to copy source data  %@ to persistent storage - Error:  %s"), v6, strerror(*v18));
    }
    v21 = objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_18;
  }
  v33 = v14;
  v16 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v33);
  v13 = v33;

  if ((v16 & 1) != 0)
    goto LABEL_9;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
  v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create parent destination folder in persistent storage - Error:  %@"), v20));

LABEL_15:
  v9 = (id)v20;
LABEL_18:

  v23 = v13;
  v9 = (id)v21;
LABEL_19:
  if (objc_msgSend(v7, "fileExistsAtPath:", v10))
  {
    v32 = v23;
    v24 = objc_msgSend(v7, "removeItemAtPath:error:", v10, &v32);
    v13 = v32;

    if ((v24 & 1) == 0)
    {
      v25 = sub_100024A40();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
        *(_DWORD *)buf = 138412546;
        v37 = v10;
        v38 = 2112;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to remove folder:  %@ - Error:  %@", buf, 0x16u);

      }
    }
  }
  else
  {
    v13 = v23;
  }
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  v28 = sub_100024A40();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    sub_10002F088();

  v17 = 0;
LABEL_31:

  return v17;
}

- (BOOL)restartBluetooth
{
  uint64_t (*v2)(const __CFString *, _QWORD, const __CFString *);
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = (uint64_t (*)(const __CFString *, _QWORD, const __CFString *))off_100053E50;
  v11 = off_100053E50;
  if (!off_100053E50)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000213AC;
    v7[3] = &unk_100049008;
    v7[4] = &v8;
    sub_1000213AC((uint64_t)v7);
    v2 = (uint64_t (*)(const __CFString *, _QWORD, const __CFString *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    LODWORD(v2) = v2(CFSTR("bluetoothd"), 0, CFSTR("Restarting bluetoothd to restore bluetooth pairing record for DeKOTA devices."));
    if (!(_DWORD)v2)
      return (_DWORD)v2 == 0;
  }
  else
  {
    sub_10002F208();
  }
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10002F228((int)v2, v5, v6);

  return (_DWORD)v2 == 0;
}

- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __SCPreferences *v8;
  const __SCPreferences *v9;
  const __CFString *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  int v23;
  const char *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  unsigned int v28;

  v5 = (__CFString *)a3;
  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315650;
    v24 = "-[MSDHOperations setComputerNameAndHostname:encoding:]";
    v25 = 2114;
    v26 = v5;
    v27 = 1026;
    v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - computerName:  %{public}@ - encoding:  0x%{public}x", (uint8_t *)&v23, 0x1Cu);
  }

  v8 = SCPreferencesCreate(0, CFSTR("demod_helper:setComputerName"), 0);
  if (!v8)
  {
    v16 = sub_100024A40();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10002F290(v17);

    goto LABEL_22;
  }
  v9 = v8;
  if (!SCPreferencesSetComputerName(v8, v5, a4))
  {
    v18 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002F304(v13);
    goto LABEL_21;
  }
  v10 = (const __CFString *)_CSCopyLocalHostnameForComputerName(0, v5);
  v11 = sub_100024A40();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002F378();
LABEL_21:

    CFRelease(v9);
LABEL_22:
    v14 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10002F500();

  if (!SCPreferencesSetLocalHostName(v9, v10))
  {
    v19 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002F3A4(v20);
    goto LABEL_29;
  }
  if (!SCPreferencesCommitChanges(v9))
  {
    v21 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002F418(v20);
    goto LABEL_29;
  }
  if (!SCPreferencesApplyChanges(v9))
  {
    v22 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002F48C(v20);
LABEL_29:

    v14 = 0;
    goto LABEL_12;
  }
  v14 = 1;
LABEL_12:
  CFRelease(v9);
  CFRelease(v10);
LABEL_13:

  return v14;
}

- (id)getPathInUserHomeDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](MSDHVolumeManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userHomePath"));

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/var/MSDWorkContainer")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
    v7 = CFSTR("/var/MSDWorkContainer");
  }
  else
  {
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer")))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
      goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
    v7 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer");
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v7, "length")));
LABEL_7:
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

  return v10;
}

- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6
{
  __CFString *v9;
  __CFString *v10;
  int v11;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v9 = (__CFString *)a6;
  v10 = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a3, a4, v10, v9, kCFPreferencesAnyHost);
  v11 = CFPreferencesSynchronize(v10, v9, kCFPreferencesAnyHost);

  if (!v11)
  {
    v13 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002F560(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  return v11 != 0;
}

- (void)setSignedManifest:(id)a3
{
  objc_storeStrong((id *)&self->_signedManifest, a3);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_signedManifest, 0);
}

@end
