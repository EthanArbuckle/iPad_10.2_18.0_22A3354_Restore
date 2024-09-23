@implementation FMDMagSafeDataStore

+ (id)defaultStorageLocation
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100304A08);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("fmdMagSafeDevices")));

  return v5;
}

+ (id)lostModeStorageLocation
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100304A08);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("fmdMagSafeLostDevices")));

  return v5;
}

+ (id)sharedInstance
{
  if (qword_1003068C0 != -1)
    dispatch_once(&qword_1003068C0, &stru_1002C4C80);
  return (id)qword_1003068B8;
}

- (FMDMagSafeDataStore)init
{
  FMDMagSafeDataStore *v2;
  dispatch_queue_t v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FMDMagSafeDataStore;
  v2 = -[FMDMagSafeDataStore init](&v23, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDMagSafeDataStore.serialQueue", 0);
    -[FMDMagSafeDataStore setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = objc_alloc((Class)FMDataArchiver);
    v6 = objc_msgSend((id)objc_opt_class(v2, v5), "defaultStorageLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v4, "initWithFileURL:", v7);
    -[FMDMagSafeDataStore setDataArchiver:](v2, "setDataArchiver:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v9, "setDataProtectionClass:", 4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v10, "setBackedUp:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v11, "setCreateDirectories:", 1);

    v12 = objc_alloc((Class)FMDataArchiver);
    v14 = objc_msgSend((id)objc_opt_class(v2, v13), "lostModeStorageLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_msgSend(v12, "initWithFileURL:", v15);
    -[FMDMagSafeDataStore setLostModeDataArchiver:](v2, "setLostModeDataArchiver:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](v2, "lostModeDataArchiver"));
    objc_msgSend(v17, "setDataProtectionClass:", 4);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](v2, "lostModeDataArchiver"));
    objc_msgSend(v18, "setBackedUp:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](v2, "lostModeDataArchiver"));
    objc_msgSend(v19, "setCreateDirectories:", 1);

    v20 = sub_1000031B8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_10022D200((uint64_t)v2, v21);

  }
  return v2;
}

- (void)clearDataStore
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB498;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)addAccessory:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB5A8;
  block[3] = &unk_1002C2088;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeAccessoryWithId:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB78C;
  block[3] = &unk_1002C2088;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeAccessoryWithSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB954;
  block[3] = &unk_1002C2088;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)readAllAccessoriesFromDisk
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](self, "dataArchiver"));
  v4 = objc_opt_class(FMDMagSafeAccessory, v3);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(NSString, v5), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDictionaryAndClasses:error:", v7, &v17));
  v9 = v17;

  if ((objc_msgSend(v9, "fm_isFileNotFoundError") & 1) == 0 && (!v8 || v9 != 0))
  {

    v11 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10022D294();

    v8 = &__NSDictionary0__struct;
  }
  v13 = sub_1000530AC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134218242;
    v19 = v15;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "readAllAccessoriesFromDisk total = %lu accessories = %@", buf, 0x16u);
  }

  return v8;
}

- (id)_writeAccessoriesToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](self, "dataArchiver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "saveDictionary:", v4));

  return v6;
}

- (id)writeLostModeInfo:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = CFSTR("accessoryList");
  v13[1] = CFSTR("version");
  v14[0] = a3;
  v14[1] = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](self, "lostModeDataArchiver"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "saveDictionary:", v8));

  if (!v10)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"), 0, 0, 1u);
  }

  return v10;
}

- (id)readLostModeAccessoriesList
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](self, "lostModeDataArchiver"));
  v4 = objc_opt_class(NSString, v3);
  v6 = objc_opt_class(NSArray, v5);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v6, objc_opt_class(NSNumber, v7), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDictionaryAndClasses:error:", v9, &v21));
  v11 = v21;

  if ((objc_msgSend(v11, "fm_isFileNotFoundError") & 1) == 0 && (!v10 || v11 != 0))
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022D294();

  }
  v15 = sub_1000530AC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accessoryList")));
    v18 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218242;
    v23 = v18;
    v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "readLostModeAccessoriesList total = %lu accessories = %@", buf, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accessoryList")));

  return v19;
}

- (id)readLostModeAccessoriesListVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](self, "lostModeDataArchiver"));
  v4 = objc_opt_class(NSString, v3);
  v6 = objc_opt_class(NSArray, v5);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v6, objc_opt_class(NSNumber, v7), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDictionaryAndClasses:error:", v9, &v21));
  v11 = v21;

  if ((objc_msgSend(v11, "fm_isFileNotFoundError") & 1) == 0 && (!v10 || v11 != 0))
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022D294();

  }
  v15 = sub_1000530AC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accessoryList")));
    v18 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218242;
    v23 = v18;
    v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "readLostModeAccessoriesList total = %lu accessories = %@", buf, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version")));

  return v19;
}

- (void)updateLostModeKeyRollTimeFor:(id)a3 lastLostModeKeyRollTime:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AC440;
  v15[3] = &unk_1002C48C0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (FMDataArchiver)lostModeDataArchiver
{
  return self->_lostModeDataArchiver;
}

- (void)setLostModeDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeDataArchiver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeDataArchiver, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
