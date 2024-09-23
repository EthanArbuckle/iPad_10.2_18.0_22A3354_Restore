@implementation FMFDStoreController

+ (id)cacheFileURL
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("FMFDStoreCache.data")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));

  return v9;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016D30;
  block[3] = &unk_100099320;
  block[4] = a1;
  if (qword_1000B36A8 != -1)
    dispatch_once(&qword_1000B36A8, block);
  return (id)qword_1000B36A0;
}

- (void)accountWasRemoved
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up local model cache due to account removed notification", v5, 2u);
  }

  -[FMFDStoreController cleanup](self, "cleanup");
}

- (void)cleanupOldModel
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up local model cache due to old model notification", v5, 2u);
  }

  -[FMFDStoreController cleanup](self, "cleanup");
  objc_msgSend((id)objc_opt_class(self), "cleanupLegacyStoredDataIfNeeded");
}

+ (void)cleanupLegacyStoredDataIfNeeded
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", off_1000B2C98);

  if (v3 != (id)qword_1000B2CA0)
  {
    +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", off_1000B2C60[0], off_1000B3028);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setInteger:forKey:", qword_1000B2CA0, off_1000B2C98);

  }
}

- (id)passwordData
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDStoreController keychainManager](self, "keychainManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataForAccount:service:", CFSTR("FMFDStoreControllerKey"), CFSTR("FMFDStoreController")));

  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData fm_randomBytes:](NSData, "fm_randomBytes:", 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDStoreController keychainManager](self, "keychainManager"));
    objc_msgSend(v5, "setData:forAccount:service:synchronizable:dataProtectionClass:migratable:", v4, CFSTR("FMFDStoreControllerKey"), CFSTR("FMFDStoreController"), 0, 3, 0);

  }
  return v4;
}

- (void)updateModelCacheWithData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFDStoreController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000171C0;
  v7[3] = &unk_100099348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)modelCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;

  v44 = objc_opt_class(NSSet);
  v2 = objc_opt_class(NSArray);
  v3 = objc_opt_class(NSDictionary);
  v4 = objc_opt_class(FMFDevice);
  v5 = objc_opt_class(FMFHandle);
  v6 = objc_opt_class(FMFFence);
  v7 = objc_opt_class(FMFPlacemark);
  v8 = objc_opt_class(NSDate);
  v9 = objc_opt_class(NSNull);
  v10 = objc_opt_class(NSString);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(FMFSchedule), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDStoreController dataArchiver](self, "dataArchiver"));
  v48 = 0;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "readDictionaryAndClasses:error:", v12, &v48));
  v15 = v48;

  if (!v15)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("modelCache")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDStoreController passwordData](self, "passwordData"));
    v47 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject decryptWithKey:error:](v17, "decryptWithKey:error:", v19, &v47));
    v15 = v47;

    if (v20)
    {
      if (!v15)
      {
        v46 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v20, &v46));
        v15 = v46;

        v25 = sub_100011D0C();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        v27 = v26;
        if (v15)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            sub_100063284(v15);

          v18 = 0;
          v14 = v24;
        }
        else
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));
            *(_DWORD *)buf = 138412290;
            v50 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unarchived data keys: %@", buf, 0xCu);

          }
          v29 = sub_100011D0C();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", off_1000B2C90[0]));
            *(_DWORD *)buf = 138412290;
            v50 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Unarchived model version: %@", buf, 0xCu);

          }
          v32 = sub_100011D0C();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", off_1000B2C88[0]));
            *(_DWORD *)buf = 138412290;
            v50 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Unarchived fences: %@", buf, 0xCu);

          }
          v35 = sub_100011D0C();
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", off_1000B2C80[0]));
            *(_DWORD *)buf = 138412290;
            v50 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Unarchived devices: %@", buf, 0xCu);

          }
          v38 = sub_100011D0C();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", off_1000B2C68[0]));
            *(_DWORD *)buf = 138412290;
            v50 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Unarchived followers: %@", buf, 0xCu);

          }
          v41 = sub_100011D0C();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", off_1000B2C70[0]));
            *(_DWORD *)buf = 138412290;
            v50 = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Unarchived following: %@", buf, 0xCu);

          }
          v14 = v24;
          v15 = 0;
          v18 = v14;
        }
        goto LABEL_11;
      }
      v21 = sub_100011D0C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000632FC(v15);

    }
    v18 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v16 = sub_100011D0C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_100063374(v15);
  v18 = 0;
LABEL_12:

  return v18;
}

- (void)cleanup
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMFDStoreController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001797C;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (FMKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
  objc_storeStrong((id *)&self->_keychainManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
