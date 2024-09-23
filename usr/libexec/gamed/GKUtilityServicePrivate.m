@implementation GKUtilityServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (id)sharedFriendSuggestionDenier
{
  if (qword_100317E08 != -1)
    dispatch_once(&qword_100317E08, &stru_1002BB698);
  return (id)qword_100317E00;
}

- (void)currentNonGameCenterForegroundGameHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[GKClientProxy nonGameCenterForegroundClient](GKClientProxy, "nonGameCenterForegroundClient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentGame"));
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)notifyRemoteAlertCompletedPresentingDashboard
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKRemoteAlertLauncher shared](GKRemoteAlertLauncher, "shared"));
  objc_msgSend(v2, "notifyDashboardDidLaunch");

}

- (void)invokeASCAppLaunchTrampolineWithURL:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v5 = a3;
  v33 = a4;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v34 = v5;
  v6 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryItems"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v8)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_15;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v46 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("appId"));

      if (v16)
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
        v18 = v11;
        v11 = (void *)v17;
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("bundleId"));

        if (!v20)
          continue;
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
        v18 = v10;
        v10 = (void *)v21;
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  }
  while (v9);
LABEL_15:

  if (+[GKGame isNewsApp:](GKGame, "isNewsApp:", v10))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v22, "openNewsApp");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012F08;
    block[3] = &unk_1002BB450;
    v25 = v33;
    v44 = v33;
    v43 = v11;
    dispatch_async(v24, block);

    v26 = v44;
    v27 = v34;
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 623, "-[GKUtilityServicePrivate invokeASCAppLaunchTrampolineWithURL:handler:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v28));

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100012F40;
    v38[3] = &unk_1002BB4A0;
    v27 = v34;
    v39 = v34;
    v40 = v11;
    v26 = v29;
    v41 = v26;
    objc_msgSend(v26, "perform:", v38);
    v25 = v33;
    if (v33)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "replyQueue"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100013390;
      v35[3] = &unk_1002BB450;
      v37 = v33;
      v36 = v26;
      objc_msgSend(v36, "notifyOnQueue:block:", v31, v35);

    }
  }

}

- (void)getHostGameWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(id, void *))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10001357C;
  v19 = sub_10001358C;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalBundleIdentifier"));

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100013594;
  v12 = &unk_1002BB710;
  v7 = v6;
  v13 = v7;
  v14 = &v15;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "currentGame", v9, v10, v11, v12));
  v4[2](v4, v8);

  _Block_object_dispose(&v15, 8);
}

- (void)getCredentialInfoAndStoreBagValuesForKeys:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKUtilityService: getCredentialInfoAndStoreBagValuesForKeys:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKUtilityService _bagValuesForKeys:](self, "_bagValuesForKeys:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));

  if (!v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pushToken"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("pushToken"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playerInternal"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playerID"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("playerID"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authenticationToken"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("authToken"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accountName"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("accountName"));

    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100013854;
    v22[3] = &unk_1002BB450;
    v24 = v8;
    v23 = v11;
    objc_msgSend(v23, "notifyOnQueue:block:", v14, v22);

  }
LABEL_8:

}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKUtilityServicePrivateInterface, a2);
}

- (void)openSettings
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSettings");

}

- (void)openGameCenterSettings
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openGameCenterSettings");

}

- (void)terminate
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(self, a2);
  v3 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Exiting in response to termination request", v4, 2u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002BB730);
}

+ (void)removeCacheDirectory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v11);
  v6 = v11;

  if ((v5 & 1) != 0)
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v7);
    v9 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Successfully cleared GameKit cache directory: %@", buf, 0xCu);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR))
      sub_100016DDC();
  }

}

- (void)clearCachesWithHandler:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013C4C;
  v4[3] = &unk_1002BB758;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)resetEnvironmentWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013E4C;
  v7[3] = &unk_1002BB758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "resetEnvironmentWithHandler:", v7);

}

- (void)pingWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)updateNotificationTopicsForcefully:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  objc_msgSend(v4, "updateNotificationTopicsForceFully:", v3);

}

- (void)refreshPreferences
{
  -[GKUtilityServicePrivate refreshPreferencesWithDataType:](self, "refreshPreferencesWithDataType:", 12);
}

- (void)refreshPreferencesWithDataType:(unsigned int)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  unsigned int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  objc_msgSend(v4, "synchronize");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "synchronize");

  CFPreferencesSynchronize(CFSTR("com.apple.VideoConference"), kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(CFSTR("com.apple.persistentconnection"), kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesAppSynchronize(CFSTR("com.apple.logging"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014044;
  v6[3] = &unk_1002BB778;
  v7 = a3;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v6);
}

- (void)loadDataForURL:(id)a3 postBody:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  if (v8)
  {
    v9 = a4;
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeBag"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100014168;
    v15[3] = &unk_1002BB7A0;
    v16 = v8;
    objc_msgSend(v12, "readDataForURL:postData:client:credential:includeUDID:includeAPNS:completion:", v10, v9, v13, v14, 1, 1, v15);

  }
}

- (void)cancelNetworkManagerTasks
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  objc_msgSend(v2, "cancelCurrentTasks");

}

- (void)checkAndUpdateArcadeSubscriberStatusWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 822, "-[GKUtilityServicePrivate checkAndUpdateArcadeSubscriberStatusWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100014304;
  v15[3] = &unk_1002BB850;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "performOnManagedObjectContext:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000147D8;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)getArcadeSubscription:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    (*((void (**)(id, id))a3 + 2))(v4, objc_msgSend(v5, "arcadeSubscriptionState"));

  }
}

- (void)callBlockWithFriendSuggester:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKUtilityServicePrivate sharedFriendSuggestionDenier](GKUtilityServicePrivate, "sharedFriendSuggestionDenier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014940;
  v7[3] = &unk_1002BB878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "denyListWithCompletionHandler:", v7);

}

- (void)rerankedFriendSuggestionsHandlesWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKUtilityServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014A90;
  v4[3] = &unk_1002BB8C8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKUtilityServicePrivate callBlockWithFriendSuggester:](v5, "callBlockWithFriendSuggester:", v4);

}

- (void)getFriendSuggestionDenyListWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKUtilityServicePrivate sharedFriendSuggestionDenier](GKUtilityServicePrivate, "sharedFriendSuggestionDenier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014D8C;
  v7[3] = &unk_1002BB878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "denyListWithCompletionHandler:", v7);

}

- (void)denyPlayer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD block[4];
  void *v21;
  uint8_t buf[4];
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "denyPlayer: Adding %@ to the deny list.", buf, 0xCu);
  }
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKUtilityServicePrivate sharedFriendSuggestionDenier](GKUtilityServicePrivate, "sharedFriendSuggestionDenier"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000150EC;
    v17[3] = &unk_1002BB8F0;
    v17[4] = self;
    v18 = v6;
    v19 = v8;
    v12 = v8;
    objc_msgSend(v11, "denyPlayerID:completionHandler:", v18, v17);

    v13 = v18;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000150DC;
    block[3] = &unk_1002BB540;
    v21 = v8;
    v16 = v8;
    dispatch_async(v15, block);

    v13 = v21;
  }

}

- (void)denyContact:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD block[4];
  void *v21;
  uint8_t buf[4];
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "denyContact: Adding %@ to the deny list.", buf, 0xCu);
  }
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKUtilityServicePrivate sharedFriendSuggestionDenier](GKUtilityServicePrivate, "sharedFriendSuggestionDenier"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100015378;
    v17[3] = &unk_1002BB8F0;
    v17[4] = self;
    v18 = v6;
    v19 = v8;
    v12 = v8;
    objc_msgSend(v11, "denyContactID:completionHandler:", v18, v17);

    v13 = v18;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015368;
    block[3] = &unk_1002BB540;
    v21 = v8;
    v16 = v8;
    dispatch_async(v15, block);

    v13 = v21;
  }

}

- (void)handleFriendSuggestionDenialWithNotificationPayload:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015520;
  block[3] = &unk_1002BB568;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, block);

}

- (void)clearFriendSuggestionsDenyList
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKUtilityServicePrivate sharedFriendSuggestionDenier](GKUtilityServicePrivate, "sharedFriendSuggestionDenier"));
  objc_msgSend(v2, "clearDenyList");

}

- (void)suggestedFriendsWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKUtilityServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015670;
  v4[3] = &unk_1002BB9A8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKUtilityServicePrivate fetchFriendSuggestionsWithHandler:](v5, "fetchFriendSuggestionsWithHandler:", v4);

}

+ (id)serializeFriendSuggestions:(id)a3 contactIDsSupportingPushFriending:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];

  v5 = a3;
  v22 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contactID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));

        if (!v14)
        {
          v27[0] = CFSTR("contactID");
          v27[1] = CFSTR("supportsFriendingViaPush");
          v28[0] = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v22, "containsObject:", v13)));
          v28[1] = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handle"));
          objc_msgSend(v17, "_gkSetIfNonNilObject:forKey:", v18, CFSTR("handle"));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contactAssociationID"));
          objc_msgSend(v17, "_gkSetIfNonNilObject:forKey:", v19, CFSTR("caid"));

          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v9);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
  return v20;
}

- (id)contactIDsFromSuggestions:(id)a3
{
  return objc_msgSend(a3, "_gkMapWithBlock:", &stru_1002BB9C8);
}

- (void)getFriendSuggestionsWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKUtilityServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015AE8;
  v4[3] = &unk_1002BB9A8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKUtilityServicePrivate fetchFriendSuggestionsWithHandler:](v5, "fetchFriendSuggestionsWithHandler:", v4);

}

- (void)fetchFriendSuggestionsWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKUtilityServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015BE0;
  v4[3] = &unk_1002BB8C8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKUtilityServicePrivate callBlockWithFriendSuggester:](v5, "callBlockWithFriendSuggester:", v4);

}

- (void)getGameInviteFriendSuggestionsWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKUtilityServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016078;
  v4[3] = &unk_1002BB8C8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKUtilityServicePrivate callBlockWithFriendSuggester:](v5, "callBlockWithFriendSuggester:", v4);

}

- (void)suggestedContactsListWithLimit:(id)a3 handler:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016374;
  v6[3] = &unk_1002BBA18;
  v7 = a4;
  v5 = v7;
  -[GKUtilityServicePrivate getFriendSuggestionsWithHandler:](self, "getFriendSuggestionsWithHandler:", v6);

}

- (void)getWidgetStoreBagValueWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 1138, "-[GKUtilityServicePrivate getWidgetStoreBagValueWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000164E4;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100016684;
  v12[3] = &unk_1002BB758;
  v13 = v7;
  v14 = v4;
  v10 = v4;
  v11 = v7;
  objc_msgSend(v11, "notifyOnQueue:block:", v9, v12);

}

- (void)clearEntityCacheForBagKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v9, "deleteEntitiesWithBagKey:clientProxy:completionHandler:", v7, v8, v6);

}

- (void)getCacheLocationsForPlayerID:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, id);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  GKSecureFileLocator *v13;
  void *v14;
  GKSecureFileLocator *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];

  v28[0] = CFSTR("Insecure Cache");
  v6 = (void (**)(id, id))a4;
  v27 = a3;
  v7 = GKInsecureCacheRoot();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v28[1] = CFSTR("Support Data");
  v29[0] = v8;
  v9 = GKSupportDataRoot();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v29[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

  v13 = [GKSecureFileLocator alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = -[GKSecureFileLocator initWithFileManager:](v13, "initWithFileManager:", v14);

  v16 = GKGameCenterIdentifier;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "language"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKSecureFileLocator globalContextID](GKSecureFileLocator, "globalContextID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKSecureFileLocator databaseDirectoryWithBundleID:language:contextID:](v15, "databaseDirectoryWithBundleID:language:contextID:", v16, v18, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "gkFileSystemRepresentation"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("Global Cache"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "language"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKSecureFileLocator databaseDirectoryWithBundleID:language:contextID:](v15, "databaseDirectoryWithBundleID:language:contextID:", v16, v23, v27));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "gkFileSystemRepresentation"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("Player Cache"));

  v26 = objc_msgSend(v12, "copy");
  v6[2](v6, v26);

}

- (void)getCentralCacheLocationForPlayerID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a4;
  v8 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "language"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterCacheDatabaseURLForPlayerID:language:name:fileManager:](GKClientProxy, "gameCenterCacheDatabaseURLForPlayerID:language:name:fileManager:", v8, v9, CFSTR("database.sqlite3"), v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "gkFileSystemRepresentation"));
  (*((void (**)(id, void *))a4 + 2))(v7, v12);

}

- (void)resetSignInPromptsWithCompletionHandler:(id)a3
{
  void (**v3)(_QWORD);
  void (**v4)(_QWORD);
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void (**)(_QWORD))a3;
  v4 = v3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = (id)GKOSLoggers(v3);
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKUtilityServicePrivate: Resetting sign in prompt limits", v8, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("GKFullscreenSignInPresentationDataKey"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("GKSignInBannerPresentationDataKey"));
  v4[2](v4);

}

@end
