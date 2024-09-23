@implementation OTAAutoAssetClient

- (OTAAutoAssetClient)initWithError:(id *)a3
{
  OTAAutoAssetClient *v4;
  OTAAutoAssetClient *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  OTAAutoAssetClient *v9;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OTAAutoAssetClient;
  v4 = -[OTAAutoAssetClient init](&v12, "init");
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  v11 = 0;
  v6 = -[OTAAutoAssetClient _createInterestInAssetType:withAssetSpecifier:withError:](v4, "_createInterestInAssetType:withAssetSpecifier:withError:", CFSTR("com.apple.MobileAsset.PKITrustStore"), CFSTR("PKITrustStore"), &v11);
  v7 = v11;
  v8 = v7;
  if ((v6 & 1) != 0)
  {

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_handleAssetChangedNotification
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient assetDidChangeHandler](self, "assetDidChangeHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient assetDidChangeHandler](self, "assetDidChangeHandler"));
    v4[2]();

  }
}

- (void)_registerForNotificationsForAssetType:(id)a3 andAssetSpecifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  _QWORD v16[5];
  int out_token;

  v6 = a4;
  v7 = a3;
  v8 = (const char *)objc_msgSend(CFSTR("com.apple.trustd.notifyQueue"), "UTF8String");
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = dispatch_queue_create(v8, v10);
  -[OTAAutoAssetClient setNotifyQueue:](self, "setNotifyQueue:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MAAutoAssetNotifications notifyRegistrationName:forAssetType:forAssetSpecifier:](MAAutoAssetNotifications, "notifyRegistrationName:forAssetType:forAssetSpecifier:", CFSTR("ASSET_VERSION_DOWNLOADED"), v7, v6));
  out_token = -1;
  v13 = objc_retainAutorelease(v12);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  v15 = objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient notifyQueue](self, "notifyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100058F48;
  v16[3] = &unk_100079BD0;
  v16[4] = self;
  notify_register_dispatch(v14, &out_token, v15, v16);

}

- (void)registerForAssetChangedNotificationsWithBlock:(id)a3
{
  if (a3)
    -[OTAAutoAssetClient setAssetDidChangeHandler:](self, "setAssetDidChangeHandler:");
  -[OTAAutoAssetClient _registerForNotificationsForAssetType:andAssetSpecifier:](self, "_registerForNotificationsForAssetType:andAssetSpecifier:", CFSTR("com.apple.MobileAsset.PKITrustStore"), CFSTR("PKITrustStore"));
}

- (id)_createAutoAssetWithType:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  __CFError *v14;
  const void *v15;
  NSObject *v16;
  CFIndex Code;
  id v19;
  uint8_t buf[4];
  __CFError *v21;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)MAAutoAssetSelector), "initForAssetType:withAssetSpecifier:", v9, v8);

  -[OTAAutoAssetClient setCurrentAssetSelector:](self, "setCurrentAssetSelector:", v10);
  v11 = objc_alloc((Class)MAAutoAsset);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient currentAssetSelector](self, "currentAssetSelector"));
  v19 = 0;
  v13 = objc_msgSend(v11, "initForClientName:selectingAsset:error:", CFSTR("trustd"), v12, &v19);
  v14 = (__CFError *)v19;

  if (v14)
  {
    v15 = sub_100011628("SecError");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to create auto-asset instance: %@", buf, 0xCu);
    }

    Code = CFErrorGetCode(v14);
    sub_100052038((uint64_t)CFSTR("AssetBuiltInEvent"), 0, Code);
    if (a5)
      *a5 = objc_retainAutorelease(v14);

    v13 = 0;
  }

  return v13;
}

- (void)_recheckAssetVersion
{
  void *v3;
  const void *v4;
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  const void *v9;
  NSObject *v10;
  const void *v11;
  NSObject *v12;
  CFIndex Code;
  CFErrorRef v14;
  CFErrorRef err;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  unint64_t v19;

  if (-[OTAAutoAssetClient recheckAssetVersion](self, "recheckAssetVersion"))
  {
    -[OTAAutoAssetClient setRecheckAssetVersion:](self, "setRecheckAssetVersion:", 0);
    err = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient lastAssetPath](self, "lastAssetPath"));
    -[OTAAutoAssetClient setLastAvailableVersion:](self, "setLastAvailableVersion:", sub_10003479C((uint64_t)v3, (__CFString **)&err));

    if (-[OTAAutoAssetClient lastAvailableVersion](self, "lastAvailableVersion"))
    {
      if (-[OTAAutoAssetClient lastCurrentVersion](self, "lastCurrentVersion"))
      {
        v4 = sub_100011628("OTATrust");
        v5 = objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = -[OTAAutoAssetClient lastAvailableVersion](self, "lastAvailableVersion");
          v7 = -[OTAAutoAssetClient lastCurrentVersion](self, "lastCurrentVersion");
          *(_DWORD *)buf = 134218240;
          v17 = v6;
          v18 = 2048;
          v19 = v7;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Available version after recheck: %llu, our current version: %llu", buf, 0x16u);
        }

        v8 = -[OTAAutoAssetClient lastAvailableVersion](self, "lastAvailableVersion");
        if (v8 > -[OTAAutoAssetClient lastCurrentVersion](self, "lastCurrentVersion"))
        {
          v9 = sub_100011628("OTATrust");
          v10 = objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will exit when clean to use updated asset", buf, 2u);
          }

          xpc_transaction_exit_clean();
        }
      }
    }
    else
    {
      v11 = sub_100011628("SecError");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to read trust store version from asset path, giving up", buf, 2u);
      }

      if (err)
        Code = CFErrorGetCode(err);
      else
        Code = 0xFFFFFFFFLL;
      sub_100052038((uint64_t)CFSTR("AssetBuiltInEvent"), 0, Code);
    }
    v14 = err;
    if (err)
    {
      err = 0;
      CFRelease(v14);
    }
  }
}

- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  const void *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  OTAAutoAssetClient *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v8 = a4;
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient _createAutoAssetWithType:specifier:error:](self, "_createAutoAssetWithType:specifier:error:", a3, v8, &v17));
  v10 = v17;
  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100058E10;
    v14[3] = &unk_100079BF8;
    v15 = v8;
    v16 = self;
    objc_msgSend(v9, "interestInContent:completion:", CFSTR("system trusted certificates"), v14);

  }
  else
  {
    v11 = sub_100011628("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to create auto-asset instance for %@: %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v9 != 0;
}

- (BOOL)_removeInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient currentAssetSelector](self, "currentAssetSelector"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058D08;
  v10[3] = &unk_100079C20;
  v11 = v6;
  v8 = v6;
  +[MAAutoAsset eliminateAllForSelector:completion:](MAAutoAsset, "eliminateAllForSelector:completion:", v7, v10);

  return 1;
}

- (id)startUsingLocalAsset
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OTAAutoAssetClient savedTrustStoreAssetPath](OTAAutoAssetClient, "savedTrustStoreAssetPath"));
  -[OTAAutoAssetClient setLastAssetPath:](self, "setLastAssetPath:", v3);
  -[OTAAutoAssetClient _lockLocalAsset:](self, "_lockLocalAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OTAAutoAssetClient validTrustStoreAssetPath:mustExist:](OTAAutoAssetClient, "validTrustStoreAssetPath:mustExist:", v3, 1));

  return v4;
}

- (void)stopUsingLocalAsset
{
  -[OTAAutoAssetClient _endLocalAssetLocks](self, "_endLocalAssetLocks");
}

- (void)_lockLocalAsset:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[7];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000585E0;
  v19[4] = sub_1000585F0;
  v4 = a3;
  v20 = v4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0xAAAAAAAAAAAAAAAALL;
  v5 = sub_10003479C((uint64_t)v4, 0);
  if (!v5)
    v5 = sub_1000348EC();
  v18 = v5;
  -[OTAAutoAssetClient setLastCurrentVersion:](self, "setLastCurrentVersion:", v16[3]);
  v6 = objc_alloc((Class)MAAutoAsset);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient currentAssetSelector](self, "currentAssetSelector"));
  v14 = 0;
  v8 = objc_msgSend(v6, "initForClientName:selectingAsset:error:", CFSTR("trustd"), v7, &v14);
  v9 = v14;

  if (v9)
  {
    v10 = sub_100011628("SecError");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to create auto-asset instance: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v8, "currentStatus:", &stru_100079CB0);
    v11 = objc_opt_new(MAAutoAssetPolicy);
    -[NSObject setUserInitiated:](v11, "setUserInitiated:", 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000585F8;
    v13[3] = &unk_100079CD8;
    v13[5] = v19;
    v13[6] = &v15;
    v13[4] = self;
    objc_msgSend(v8, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", CFSTR("system trusted certificates"), v11, 0, 0, v13);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

}

- (void)_endLocalAssetLocks
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OTAAutoAssetClient currentAssetSelector](self, "currentAssetSelector"));
  +[MAAutoAsset endAllPreviousLocksOfSelector:completion:](MAAutoAsset, "endAllPreviousLocksOfSelector:completion:", v2, &stru_100079D18);

}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (id)assetDidChangeHandler
{
  return self->_assetDidChangeHandler;
}

- (void)setAssetDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)recheckAssetVersion
{
  return self->_recheckAssetVersion;
}

- (void)setRecheckAssetVersion:(BOOL)a3
{
  self->_recheckAssetVersion = a3;
}

- (unint64_t)lastCurrentVersion
{
  return self->_lastCurrentVersion;
}

- (void)setLastCurrentVersion:(unint64_t)a3
{
  self->_lastCurrentVersion = a3;
}

- (unint64_t)lastAvailableVersion
{
  return self->_lastAvailableVersion;
}

- (void)setLastAvailableVersion:(unint64_t)a3
{
  self->_lastAvailableVersion = a3;
}

- (NSString)lastAssetPath
{
  return self->_lastAssetPath;
}

- (void)setLastAssetPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastAssetPath, a3);
}

- (MAAutoAssetSelector)currentAssetSelector
{
  return self->_currentAssetSelector;
}

- (void)setCurrentAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetSelector, 0);
  objc_storeStrong((id *)&self->_lastAssetPath, 0);
  objc_storeStrong(&self->_assetDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

+ (id)validTrustStoreAssetPath:(id)a3 mustExist:(BOOL)a4
{
  const __CFString *v5;
  __CFString *v6;
  id v7;
  const char *v8;
  int v9;
  id v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  _QWORD v16[6];
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  _QWORD *v32;

  v5 = (const __CFString *)a3;
  v6 = (__CFString *)v5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000585E0;
  v22 = sub_1000585F0;
  v23 = 0;
  if (!v5)
  {
    v11 = sub_100011628("OTATrust");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "invalid asset path: NULL", buf, 2u);
    }

    goto LABEL_10;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005970C;
  v16[3] = &unk_100079C48;
  v16[4] = &v18;
  v16[5] = &v24;
  v17 = a4;
  *(_QWORD *)buf = _NSConcreteStackBlock;
  v29 = 0x40000000;
  v30 = sub_100026C34;
  v31 = &unk_100075DD0;
  v32 = v16;
  sub_100019A20(v5, (uint64_t)buf);
  if (!*((_BYTE *)v25 + 24))
  {
LABEL_10:
    v10 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v19[5], CFSTR("AssetVersion.plist"))));
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    if (!v8 || (v9 = openat_authenticated_np(-2, v8, 0, -1), v9 == -1))
    {
      v13 = sub_100011628("OTATrust");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ignoring asset path (not on an AuthAPFS volume)", buf, 2u);
      }

      sub_100052038((uint64_t)CFSTR("AssetBuiltInEvent"), 0, 13);
      v10 = 0;
    }
    else
    {
      close(v9);
      v10 = (id)v19[5];
    }

  }
  else
  {
    v10 = (id)v19[5];
  }
LABEL_16:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

+ (BOOL)saveTrustStoreAssetPath:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  const void *v9;
  NSObject *v10;
  uint64_t v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;

  v3 = a3;
  if (sub_100015138())
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_1000585E0;
    v19 = sub_1000585F0;
    v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000596C8;
    v14[3] = &unk_100079C70;
    v14[4] = &v15;
    sub_1000352AC((uint64_t)CFSTR("AutoAsset.plist"), v14);
    v4 = v16[5];
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("AssetPath"));
      v13 = 0;
      v7 = objc_msgSend(v6, "writeToClassDURL:permissions:error:", v5, 438, &v13);
      v8 = v13;
      if ((v7 & 1) == 0)
      {
        v9 = sub_100011628("SecError");
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v16[5];
          *(_DWORD *)buf = 138543618;
          v22 = v11;
          v23 = 2112;
          v24 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to write %{public}@: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)savedTrustStoreAssetPath
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  CFTypeID v6;
  NSObject *v7;
  const void *v8;
  const void *v9;
  NSObject *v10;
  const __CFString *v11;
  const void *v12;
  const __CFString *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  const __CFString *v23;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1000585E0;
  v20 = sub_1000585F0;
  v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100059684;
  v15[3] = &unk_100079C70;
  v15[4] = &v16;
  sub_1000352AC((uint64_t)CFSTR("AutoAsset.plist"), v15);
  if (v17[5])
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:"));
    v3 = v2;
    if (v2)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v2, "objectForKey:", CFSTR("AssetPath")));
      v5 = v4;
      if (v4)
      {
        v6 = CFGetTypeID(v4);
        if (v6 == CFStringGetTypeID())
        {
          v5 = v5;
          v7 = v5;
LABEL_15:

          goto LABEL_16;
        }
      }
      v9 = sub_100011628("OTATrust");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (const __CFString *)v17[5];
        *(_DWORD *)buf = 138543362;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "could not read OTAAutoAssetPathKey from %{public}@", buf, 0xCu);
      }

    }
    else
    {
      v12 = sub_100011628("OTATrust");
      v5 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (const __CFString *)v17[5];
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unable to read from %{public}@", buf, 0xCu);
      }
    }
    v7 = 0;
    goto LABEL_15;
  }
  v8 = sub_100011628("OTATrust");
  v3 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = CFSTR("AutoAsset.plist");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "unable to resolve location of %{public}@", buf, 0xCu);
  }
  v7 = 0;
LABEL_16:

  _Block_object_dispose(&v16, 8);
  return v7;
}

@end
