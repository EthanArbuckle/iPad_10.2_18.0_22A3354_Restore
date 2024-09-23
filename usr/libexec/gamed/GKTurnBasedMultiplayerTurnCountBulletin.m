@implementation GKTurnBasedMultiplayerTurnCountBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnCountBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v10, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountTurnBasedTurnCount);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("i")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pushCredentialForEnvironment:", objc_msgSend(v12, "environment")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerInternal"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerID"));
    v17 = objc_msgSend(v16, "isEqualToString:", v11);

    if (v17)
    {
      v30 = v12;
      v31 = v11;
      v32 = v7;
      v33 = v5;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("tc")));
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("t")));
            v24 = objc_msgSend(v23, "unsignedIntegerValue");

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("d")));
            v26 = objc_msgSend(objc_alloc((Class)GKGameDescriptor), "initWithPushDictionary:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](GKBadgeController, "sharedController"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));
              objc_msgSend(v28, "setBadgeCount:forBundleID:badgeType:", v24, v29, 2);

            }
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v19);
      }

      v7 = v32;
      v5 = v33;
      v12 = v30;
      v11 = v31;
    }
  }
  if (v7)
    v7[2](v7, 0);

}

@end
