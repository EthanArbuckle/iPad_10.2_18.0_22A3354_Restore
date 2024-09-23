@implementation FMDDetachNotificationManager

+ (id)defaultStorageLocation
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100304A08);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("FMDDetachNotificationManager")));

  return v5;
}

- (FMDDetachNotificationManager)init
{
  FMDDetachNotificationManager *v2;
  dispatch_queue_t v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMDDetachNotificationManager;
  v2 = -[FMDDetachNotificationManager init](&v13, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDDetachNotificationManager.serialQueue", 0);
    -[FMDDetachNotificationManager setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = objc_alloc((Class)FMDataArchiver);
    v6 = objc_msgSend((id)objc_opt_class(v2, v5), "defaultStorageLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v4, "initWithFileURL:", v7);
    -[FMDDetachNotificationManager setDataArchiver:](v2, "setDataArchiver:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v9, "setDataProtectionClass:", 4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v10, "setBackedUp:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v11, "setCreateDirectories:", 1);

    -[FMDDetachNotificationManager _loadFromDisk](v2, "_loadFromDisk");
  }
  return v2;
}

- (void)updateAccessoryIds:(id)a3 version:(id)a4 withCompletion:(id)a5
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
  v11 = objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager serialQueue](self, "serialQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100096A9C;
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

- (void)_loadFromDisk
{
  void *v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager dataArchiver](self, "dataArchiver"));
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(FMDDetachNotificationManager, v4), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readArrayAndClasses:error:", v6, &v22));
  v8 = v22;

  if ((objc_msgSend(v8, "fm_isFileNotFoundError") & 1) != 0 || (v7 ? (v9 = v8 == 0) : (v9 = 0), v9))
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notifWhenDetachedListVersion](v13, "notifWhenDetachedListVersion"));
    -[FMDDetachNotificationManager setNotifWhenDetachedListVersion:](self, "setNotifWhenDetachedListVersion:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notifyWhenDetachedAccessoryIds](v13, "notifyWhenDetachedAccessoryIds"));
    -[FMDDetachNotificationManager setNotifyWhenDetachedAccessoryIds:](self, "setNotifyWhenDetachedAccessoryIds:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notificationIdbyAccessoryIds](v13, "notificationIdbyAccessoryIds"));
    -[FMDDetachNotificationManager setNotificationIdbyAccessoryIds:](self, "setNotificationIdbyAccessoryIds:", v16);

    v17 = sub_1000530AC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notifWhenDetachedListVersion](v13, "notifWhenDetachedListVersion"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notifyWhenDetachedAccessoryIds](v13, "notifyWhenDetachedAccessoryIds"));
      v21 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 138412802;
      v24 = v13;
      v25 = 2112;
      v26 = v19;
      v27 = 2048;
      v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Notification manager %@ loaded version = %@ accessories count = %lu", buf, 0x20u);

    }
  }
  else
  {

    -[FMDDetachNotificationManager setNotifWhenDetachedListVersion:](self, "setNotifWhenDetachedListVersion:", CFSTR("0"));
    v10 = objc_alloc_init((Class)NSSet);
    -[FMDDetachNotificationManager setNotifyWhenDetachedAccessoryIds:](self, "setNotifyWhenDetachedAccessoryIds:", v10);

    v11 = objc_alloc_init((Class)NSDictionary);
    -[FMDDetachNotificationManager setNotificationIdbyAccessoryIds:](self, "setNotificationIdbyAccessoryIds:", v11);

    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022BE74((uint64_t)v8, v13);
    v7 = &__NSArray0__struct;
  }

}

- (id)_writeToDisk
{
  void *v3;
  void *v4;
  void *v5;
  FMDDetachNotificationManager *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager dataArchiver](self, "dataArchiver"));
  v7 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "saveArray:", v4));

  return v5;
}

- (void)getLocationFor:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  void (**v21)(id, void *);
  uint8_t buf[4];
  void *v23;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager locationStore](self, "locationStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "historicalLocationForAccessory:", v6));
  v10 = v9;
  if (v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeStamp")),
        objc_msgSend(v11, "timeIntervalSinceNow"),
        v13 = fabs(v12),
        v11,
        v13 <= 1.0))
  {
    v18 = sub_1000031B8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "using old location %@", buf, 0xCu);
    }

    v7[2](v7, v10);
  }
  else
  {
    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "fetching new location", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "locatorForAccessory:", v6));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000971E8;
    v20[3] = &unk_1002C4290;
    v21 = v7;
    objc_msgSend(v8, "retreiveLocationForAccessory:forEvent:locator:completion:", v6, 2, v17, v20);

  }
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  FMDDetachNotificationManager *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notifyWhenDetachedAccessoryIds](self, "notifyWhenDetachedAccessoryIds"));
  if (objc_msgSend(v7, "containsObject:", v6))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("notificationAccessoryId"), kFMDNotBackedUpPrefDomain));
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_9;
  }
  v10 = sub_1000031B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDDetachNotificationManager: Accessory %@ disconnected postig notificaiton", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v14 = objc_alloc((Class)NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notificationIdbyAccessoryIds](self, "notificationIdbyAccessoryIds"));
  v16 = objc_msgSend(v14, "initWithDictionary:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v6);
  -[FMDDetachNotificationManager setNotificationIdbyAccessoryIds:](self, "setNotificationIdbyAccessoryIds:", v16);
  v19 = sub_1000031B8();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FMDDetachNotificationManager: Accessory disconnected %@", buf, 0xCu);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100097584;
  v24[3] = &unk_1002C4938;
  v25 = v13;
  v26 = v4;
  v27 = self;
  v28 = v6;
  v29 = v18;
  v30 = v16;
  v21 = v16;
  v22 = v18;
  v23 = v13;
  -[FMDDetachNotificationManager getLocationFor:withCompletion:](self, "getLocationFor:withCompletion:", v26, v24);

LABEL_9:
}

- (void)accessoryDidConnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notificationIdbyAccessoryIds](self, "notificationIdbyAccessoryIds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v16 = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDDetachNotificationManager: removing notificaiton for %@", (uint8_t *)&v16, 0xCu);

    }
    v12 = objc_alloc((Class)NSMutableDictionary);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notificationIdbyAccessoryIds](self, "notificationIdbyAccessoryIds"));
    v14 = objc_msgSend(v12, "initWithDictionary:", v13);

    objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v6);
    -[FMDDetachNotificationManager setNotificationIdbyAccessoryIds:](self, "setNotificationIdbyAccessoryIds:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    objc_msgSend(v15, "removeNotificationWithIdentifier:completion:", v8, &stru_1002C4958);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notifyWhenDetachedAccessoryIds](self, "notifyWhenDetachedAccessoryIds"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notifyWhenDetachedAccessoryIds"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notifWhenDetachedListVersion](self, "notifWhenDetachedListVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("notifWhenDetachListVersion"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDDetachNotificationManager notificationIdbyAccessoryIds](self, "notificationIdbyAccessoryIds"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("notificationIdbyAccessoryIds"));

}

- (FMDDetachNotificationManager)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDDetachNotificationManager *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSSet *notifyWhenDetachedAccessoryIds;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSString *notifWhenDetachedListVersion;
  uint64_t v19;
  NSDictionary *notificationIdbyAccessoryIds;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FMDDetachNotificationManager;
  v6 = -[FMDDetachNotificationManager init](&v22, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v9 = objc_opt_class(NSDictionary, v8);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v9, objc_opt_class(NSSet, v10), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("notifyWhenDetachedAccessoryIds")));
    notifyWhenDetachedAccessoryIds = v6->_notifyWhenDetachedAccessoryIds;
    v6->_notifyWhenDetachedAccessoryIds = (NSSet *)v13;

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v15), CFSTR("notifWhenDetachListVersion"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    notifWhenDetachedListVersion = v6->_notifWhenDetachedListVersion;
    v6->_notifWhenDetachedListVersion = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("notificationIdbyAccessoryIds")));
    notificationIdbyAccessoryIds = v6->_notificationIdbyAccessoryIds;
    v6->_notificationIdbyAccessoryIds = (NSDictionary *)v19;

  }
  return v6;
}

- (FMDAccessoryLocationStore)locationStore
{
  return (FMDAccessoryLocationStore *)objc_loadWeakRetained((id *)&self->_locationStore);
}

- (void)setLocationStore:(id)a3
{
  objc_storeWeak((id *)&self->_locationStore, a3);
}

- (NSString)notifWhenDetachedListVersion
{
  return self->_notifWhenDetachedListVersion;
}

- (void)setNotifWhenDetachedListVersion:(id)a3
{
  objc_storeStrong((id *)&self->_notifWhenDetachedListVersion, a3);
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  return (FMDSupportedAccessoryRegistry *)objc_loadWeakRetained((id *)&self->_supportedAccessoryRegistry);
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_supportedAccessoryRegistry, a3);
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

- (NSSet)notifyWhenDetachedAccessoryIds
{
  return self->_notifyWhenDetachedAccessoryIds;
}

- (void)setNotifyWhenDetachedAccessoryIds:(id)a3
{
  objc_storeStrong((id *)&self->_notifyWhenDetachedAccessoryIds, a3);
}

- (NSDictionary)notificationIdbyAccessoryIds
{
  return self->_notificationIdbyAccessoryIds;
}

- (void)setNotificationIdbyAccessoryIds:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIdbyAccessoryIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIdbyAccessoryIds, 0);
  objc_storeStrong((id *)&self->_notifyWhenDetachedAccessoryIds, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_supportedAccessoryRegistry);
  objc_storeStrong((id *)&self->_notifWhenDetachedListVersion, 0);
  objc_destroyWeak((id *)&self->_locationStore);
}

@end
