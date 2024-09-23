@implementation KTKVSStore

- (void)processChangedKeys:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = kApplicationIdentifierMap;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManagerServer optInKeyForApplication:](KTOptInManagerServer, "optInKeyForApplication:", v9, (_QWORD)v13));
        if (objc_msgSend(v3, "containsObject:", v10))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[KTOptInManagerServer notificationKeyForApplication:](KTOptInManagerServer, "notificationKeyForApplication:", v9));
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
            objc_msgSend(v12, "postNotificationName:object:userInfo:deliverImmediately:", v11, 0, 0, 1);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)handleKVSStoreChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSUbiquitousKeyValueStoreChangeReasonKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSUbiquitousKeyValueStoreChangedKeysKey));
  v6 = objc_msgSend(v4, "integerValue");
  if ((unint64_t)v6 < 2)
    goto LABEL_4;
  if (v6 == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAccount, -284, CFSTR("KVS store quota violation")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v8, "logResultForEvent:hardFailure:result:", CFSTR("KVSStoreQuotaViolation"), 1, v7);

    goto LABEL_6;
  }
  if (v6 == (id)3)
LABEL_4:
    -[KTKVSStore processChangedKeys:](self, "processChangedKeys:", v5);
LABEL_6:

}

+ (BOOL)afterFirstUnlock
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];

  v2 = MKBDeviceUnlockedSinceBoot(a1, a2);
  if (v2 != 1)
  {
    if (qword_1002A78D0 != -1)
      dispatch_once(&qword_1002A78D0, &stru_100248D48);
    v3 = qword_1002A78D8;
    if (os_log_type_enabled((os_log_t)qword_1002A78D8, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to open KVS store, device never unlocked: %d", (uint8_t *)v5, 8u);
    }
  }
  return v2 == 1;
}

+ (id)strictStore
{
  if (+[KTKVSStore afterFirstUnlock](KTKVSStore, "afterFirstUnlock") && qword_1002A78E8 != -1)
    dispatch_once(&qword_1002A78E8, &stru_100248D68);
  return (id)qword_1002A78E0;
}

- (NSString)accountMetricID
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTKVSStore objectForKey:](self, "objectForKey:", CFSTR("accountMetricID")));
  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    -[KTKVSStore setObject:forKey:](self, "setObject:forKey:", v7, CFSTR("accountMetricID"));
    v3 = (void *)v7;
  }
  return (NSString *)v3;
}

- (void)forceSync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (qword_1002A78D0 != -1)
    dispatch_once(&qword_1002A78D0, &stru_100248DA8);
  v5 = qword_1002A78D8;
  if (os_log_type_enabled((os_log_t)qword_1002A78D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "KTKVSStore calling synchronizeWithCompletionHandler", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015BB08;
  v7[3] = &unk_10023D268;
  v8 = v4;
  v6 = v4;
  -[KTKVSStore synchronizeWithCompletionHandler:](self, "synchronizeWithCompletionHandler:", v7);

}

- (BOOL)storeReady
{
  return 1;
}

@end
