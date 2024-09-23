@implementation MSDCache

+ (id)sharedInstance
{
  if (qword_100175238 != -1)
    dispatch_once(&qword_100175238, &stru_10013E368);
  return (id)qword_100175230;
}

- (MSDCache)init
{
  MSDCache *v2;
  void *v3;
  void *v4;
  MSDCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDCache;
  v2 = -[MSDCache init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    -[MSDCache setFileManager:](v2, "setFileManager:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[MSDCache setDevice:](v2, "setDevice:", v4);

    v5 = v2;
  }

  return v2;
}

- (BOOL)createContainer:(id)a3
{
  id v4;
  MSDCache *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  void *v15;
  int v17;
  id v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"));

  if ((v7 & 1) == 0)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "creating container:%{public}@", (uint8_t *)&v17, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache device](v5, "device"));
    objc_msgSend(v10, "manageDemoVolume:", CFSTR("Setup"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    v14 = objc_msgSend(v15, "prepareWorkDirectory:writableByNonRoot:", v11, 1);

  }
  objc_sync_exit(v5);

  return v14;
}

- (BOOL)containerExist:(id)a3
{
  id v4;
  MSDCache *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v4));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)deleteContainer:(id)a3
{
  id v4;
  MSDCache *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;
  id v12;
  NSObject *v13;
  uint64_t v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {
    v12 = sub_1000605D0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BC070((uint64_t)v6, v13, v14);

    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    v10 = objc_msgSend(v9, "removeWorkDirectory:", v6);

  }
  objc_sync_exit(v5);

  return v10;
}

- (BOOL)checkIfFileIsInContainer:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  MSDCache *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v8, "fileManager"));
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  objc_sync_exit(v8);
  return v12;
}

- (BOOL)moveFile:(id)a3 toLocation:(id)a4 fromContainer:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MSDCache *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v14, "fileManager"));
  v21 = v13;
  v18 = objc_msgSend(v17, "moveItemAtPath:toPath:error:", v16, v11, &v21);
  v19 = v21;

  objc_sync_exit(v14);
  return v18;
}

- (BOOL)storeDataBlob:(id)a3 withContainerIdentifier:(id)a4
{
  id v6;
  id v7;
  MSDCache *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __CFString *v12;
  unsigned __int8 v13;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v8, "fileManager"));
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v11 & 1) == 0 && !-[MSDCache createContainer:](v8, "createContainer:", v7))
  {
    v17 = sub_1000605D0();
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000BC114((uint64_t)v7, v16, v18);
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x400000)
  {
    v15 = sub_1000605D0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000BC0D8((uint64_t)&v19, (uint64_t)objc_msgSend(v6, "length"), v16);
LABEL_10:

    v13 = 0;
    v12 = CFSTR("PersistentDataBlob");
    goto LABEL_5;
  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("PersistentDataBlob")));
  v13 = objc_msgSend(v6, "writeToFile:atomically:", v12, 1);
LABEL_5:

  objc_sync_exit(v8);
  return v13;
}

- (id)retrieveDataBlob:(id)a3
{
  id v4;
  MSDCache *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  int v19;
  __CFString *v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) != 0)
  {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PersistentDataBlob")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v9));
      goto LABEL_10;
    }
  }
  else
  {
    v13 = sub_1000605D0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000BC17C((uint64_t)v6, v14, v15);

    v9 = CFSTR("PersistentDataBlob");
  }
  v16 = sub_1000604F0();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "persistent data blob file does not exist:%{public}@", (uint8_t *)&v19, 0xCu);
  }

  v12 = 0;
LABEL_10:

  objc_sync_exit(v5);
  return v12;
}

- (BOOL)deleteDataBlob:(id)a3
{
  id v4;
  MSDCache *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  id v13;
  id v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByAppendingPathComponent:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
    v14 = 0;
    v10 = objc_msgSend(v9, "removeItemAtPath:error:", v6, &v14);
    v11 = v14;

  }
  else
  {
    v13 = sub_1000605D0();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000BC1E4(v11);
    v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (NSMutableDictionary)deletionList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeletionList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_deletionList, 0);
}

@end
