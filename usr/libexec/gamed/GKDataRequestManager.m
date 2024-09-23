@implementation GKDataRequestManager

- (void)appStateChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKApplicationStateKey));
  v6 = objc_msgSend(v5, "integerValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKApplicationStateDisplayIDKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKApplicationStatePIDKey));
  v9 = objc_msgSend(v8, "integerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:pid:createIfNecessary:](GKClientProxy, "clientForBundleID:pid:createIfNecessary:", v7, v9, (_DWORD)v6 == 8));
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "isUIService") & 1) == 0)
    {
      v12 = objc_msgSend(v11, "isExtension");
      if ((v12 & 1) == 0)
      {
        if (!os_log_GKGeneral)
          v13 = (id)GKOSLoggers(v12);
        v14 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          v15 = v14;
          v28 = 138413058;
          v29 = v11;
          v30 = 1024;
          v31 = objc_msgSend(v11, "applicationState");
          v32 = 1024;
          v33 = (int)v6;
          v34 = 2112;
          v35 = v4;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "appState for client %@ changed from %d to %d -- userinfo = %@", (uint8_t *)&v28, 0x22u);

        }
        objc_msgSend(v11, "setPreviousApplicationState:", objc_msgSend(v11, "applicationState"));
        objc_msgSend(v11, "setApplicationState:", v6);
        switch((int)v6)
        {
          case 1:
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryCredentialForEnvironment:", objc_msgSend(v11, "environment")));

            if (v21)
              -[GKDataRequestManager terminateClient:](self, "terminateClient:", v11);
            else
              +[GKClientProxy removeClient:](GKClientProxy, "removeClient:", v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalBundleIdentifier"));
            v24 = v23;
            if (v23)
              v25 = v23;
            else
              v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
            v26 = v25;

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager applicationStateMonitor](self, "applicationStateMonitor"));
            objc_msgSend(v27, "stopObservingStateChangesForBundleID:", v26);

            break;
          case 2:
          case 4:
            if (objc_msgSend(v11, "isGameCenter"))
              -[GKDataRequestManager setAuthenticatingWithSettingsBundleID:](self, "setAuthenticatingWithSettingsBundleID:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "primaryCredentialForEnvironment:", objc_msgSend(v11, "environment")));

            if (v17)
              objc_msgSend(v11, "backgroundWithCompletionHandler:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKMultiplayerMatchService, "serviceWithTransport:forClient:localPlayer:", 0, v11, 0));
            objc_msgSend(v18, "cancelOutstandingMatchRequestWithHandler:", &stru_1002C3C90);

            v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
            objc_msgSend(v19, "clientEnteredBackgroundState:", v11);

            -[GKDataRequestManager clearAllNearbyInvites](self, "clearAllNearbyInvites");
            break;
          case 8:
            objc_msgSend(v11, "didEnterForeground");
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
            objc_msgSend(v22, "clientEnteredForegroundState:", v11);

            break;
          default:
            break;
        }
      }
    }
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  double Current;
  GKEntitlements *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char isKindOfClass;
  uint64_t v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  double v44;
  NSObject *log;
  _QWORD v46[4];
  id v47;
  GKDataRequestManager *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id location;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  GKEntitlements *v63;

  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = -[GKEntitlements initWithConnection:]([GKEntitlements alloc], "initWithConnection:", v7);
  v10 = objc_msgSend(v7, "processIdentifier");
  if ((_DWORD)v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleIdentifierFromConnection:](NSBundle, "_gkBundleIdentifierFromConnection:", v7));
    v12 = v11;
    if (!v11)
      goto LABEL_17;
    v13 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v14 = (id)GKOSLoggers(v11);
      v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_100118520();
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:pid:createIfNecessary:](GKClientProxy, "clientForBundleID:pid:createIfNecessary:", v12, v10, 1));
    v11 = objc_msgSend(v15, "setOriginalBundleIdentifier:", v12);
    if (v15)
    {
      v17 = objc_opt_class(GKSpoofingClientProxy, v16);
      isKindOfClass = objc_opt_isKindOfClass(v15, v17);
      if ((isKindOfClass & 1) != 0)
      {
        v19 = objc_claimAutoreleasedReturnValue(-[GKEntitlements grandfatheredEntitlementsForSpoofedApps](v9, "grandfatheredEntitlementsForSpoofedApps"));

        v9 = (GKEntitlements *)v19;
      }
      v20 = -[GKEntitlements hasAnyEntitlement](v9, "hasAnyEntitlement");
      if (v20)
      {
        if (!os_log_GKGeneral)
          v21 = (id)GKOSLoggers(v20);
        v22 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          log = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalBundleIdentifier"));
          *(_DWORD *)buf = 67110146;
          v55 = (int)v10;
          v56 = 2112;
          v57 = v23;
          v58 = 2112;
          v59 = v24;
          v60 = 1024;
          v61 = isKindOfClass & 1;
          v62 = 2112;
          v63 = v9;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "accepted client connection (pid:%d, bundleID:%@, originalBundleIdentifier: %@, isSpoofing:%d, entitlements:%@)", buf, 0x2Cu);

        }
        objc_msgSend(v15, "setEntitlements:", v9);
        objc_msgSend(v7, "setExportedObject:", v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKDaemonInterface interface](GKDaemonInterface, "interface"));
        objc_msgSend(v7, "setExportedInterface:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientInterface interface](GKClientInterface, "interface"));
        objc_msgSend(v7, "setRemoteObjectInterface:", v26);

        objc_initWeak(&location, v7);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100113AB8;
        v50[3] = &unk_1002C3A30;
        objc_copyWeak(&v52, &location);
        v27 = v15;
        v51 = v27;
        objc_msgSend(v7, "setInterruptionHandler:", v50);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100113BB8;
        v46[3] = &unk_1002C3A58;
        objc_copyWeak(&v49, &location);
        v28 = v27;
        v47 = v28;
        v48 = self;
        objc_msgSend(v7, "setInvalidationHandler:", v46);
        objc_msgSend(v28, "setPid:", v10);
        objc_msgSend(v28, "setConnection:", v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "originalBundleIdentifier"));
        v30 = v29;
        if (v29)
          v31 = v29;
        else
          v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bundleIdentifier"));
        v10 = v31;

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager applicationStateMonitor](self, "applicationStateMonitor"));
        if (objc_msgSend(v40, "startObservingStateChangesForBundleID:", v10)
          && objc_msgSend(v28, "applicationState") == 8)
        {
          objc_msgSend(v28, "didEnterForeground");
        }
        v41 = objc_msgSend(v7, "resume");
        if (!os_log_GKGeneral)
          v42 = (id)GKOSLoggers(v41);
        v43 = os_log_GKPerf;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v44 = CFAbsoluteTimeGetCurrent();
          sub_1001184E0(v44, Current);
        }

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);

        LOBYTE(v10) = 1;
        goto LABEL_28;
      }
      if (!os_log_GKGeneral)
        v34 = (id)GKOSLoggers(v20);
      v35 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v36 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalBundleIdentifier"));
        *(_DWORD *)buf = 67109634;
        v55 = (int)v10;
        v56 = 2112;
        v57 = v37;
        v58 = 2112;
        v59 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "rejected connection from client lacking any entitlement (pid:%d, bundleID:%@, originalBundleIdentifier: %@)", buf, 0x1Cu);

      }
    }
    else
    {
LABEL_17:
      if (!os_log_GKGeneral)
        v32 = (id)GKOSLoggers(v11);
      v33 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v55 = (int)v10;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Could not get client for pid (%d)", buf, 8u);
      }
      NSLog(CFSTR("Could not get client for pid (%d)"), v10);
    }
    LOBYTE(v10) = 0;
LABEL_28:

  }
  return (char)v10;
}

- (id)storeBag
{
  return +[GKStoreBag storeBagForEnvironment:dataRequestManager:](GKStoreBag, "storeBagForEnvironment:dataRequestManager:", self->_currentEnvironment);
}

+ (id)sharedManager
{
  return (id)qword_100318038;
}

- (int64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (GKApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (id)updateRequestWithPushToken:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager pushToken](self, "pushToken"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("push-token"));
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (void)presentNearbyInvite:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKDataRequestManager+Nearby: presentNearbyInvite", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "presenting nearby invite:%@", buf, 0xCu);
  }
  v11 = -[GKDataRequestManager beginTransaction:](self, "beginTransaction:", CFSTR("presentNearbyInvite"));
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "begun presentNearbyInvite:", buf, 2u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100110A68;
  v16[3] = &unk_1002C38A0;
  v16[4] = self;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("bundleID")));
  v18 = v5;
  v14 = v5;
  v15 = v17;
  -[GKDataRequestManager loadLocalizedGameNameForBundleID:handler:](self, "loadLocalizedGameNameForBundleID:handler:", v15, v16);

}

- (void)nearbyInviteWasCancelled:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKDataRequestManager: nearbyInviteWasCancelled", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("playerID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("deviceID")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("bundleID")));
  v10 = objc_claimAutoreleasedReturnValue(+[GKInviteInternal nearbyInviteIDForPlayerID:deviceID:bundleID:](GKInviteInternal, "nearbyInviteIDForPlayerID:deviceID:bundleID:", v7, v8, v9));
  v11 = (void *)v10;
  if (v9 && v10)
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v10);
    v13 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKDataRequestManager: nearbyInviteWasCancelled - Telling Client", v15, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v9));
    objc_msgSend(v14, "cancelGameInvite:", v11);

  }
}

- (void)handleNearbyInviteResponse:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  int v27;
  void *v28;

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  v7 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v7)
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKDataRequestManager+Nearby: handleNearbyInviteResponse", (uint8_t *)&v27, 2u);
  }
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v27 = 138412290;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "nearby invite NC response: %@", (uint8_t *)&v27, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("inviteDictionary")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("bundleID")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v11));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("buttonPressed")));
    v14 = objc_msgSend(v13, "integerValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 == (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("inviteDictionary")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14 != 0));
      objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("accepted"));

      if (!v14)
      {
        if (v13)
          v21 = 1;
        else
          v21 = 3;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
        objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("declineReason"));

      }
      objc_msgSend(v12, "respondedToNearbyInvite:", v19);

    }
    else
    {
      v25 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v26 = (id)GKOSLoggers(v17);
        v25 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_1001114E8((uint64_t)v4, (uint64_t)v16, v25);
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v23 = (id)GKOSLoggers(0);
    v24 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100111474((uint64_t)v4, v24);
  }

}

- (void)clearAllNearbyInvites
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(self);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKDataRequestManager+Nearby: clearAllNearbyInvites", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v6 = objc_msgSend(v4, "getBulletinsOfType:", objc_opt_class(GKBulletinNearbyInvite, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v4, "withdrawBulletin:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

+ (id)clientQueue
{
  return (id)qword_100318030;
}

+ (id)pushQueue
{
  if (qword_100318048 != -1)
    dispatch_once(&qword_100318048, &stru_1002C38C0);
  return (id)qword_100318040;
}

+ (id)syncQueue
{
  if (qword_100318058 != -1)
    dispatch_once(&qword_100318058, &stru_1002C38E0);
  return (id)qword_100318050;
}

- (void)performSync:(id)a3
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  const char *label;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  dispatch_block_t block;

  block = a3;
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "syncQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);

  if (v8 == v6)
  {
    label = dispatch_queue_get_label(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKDataRequestManager performSync:]", label, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]"), v11, "-[GKDataRequestManager performSync:]", objc_msgSend(v13, "UTF8String"), 317));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  dispatch_sync(v6, block);

}

- (void)performAsync:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "syncQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_async(v7, v4);

}

- (GKDataRequestManager)init
{
  GKDataRequestManager *v2;
  GKDataRequestManager *v3;
  _QWORD v5[4];
  GKDataRequestManager *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKDataRequestManager;
  v2 = -[GKDataRequestManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001119C8;
    v5[3] = &unk_1002BBBD8;
    v6 = v2;
    +[GKActivity named:execute:](GKActivity, "named:execute:", CFSTR("gamed - init"), v5);

  }
  return v3;
}

- (void)iCloudAccountAvailabilityChanged:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKAccount;
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG))
    sub_100117F38(v6);
  +[GKCloudGameSession updateUserWithHandler:](GKCloudGameSession, "updateUserWithHandler:", 0);

}

- (void)reachabilityDidChange:(id)a3
{
  if (-[GKReachability _gkCurrentReachabilityStatus](self->_reachability, "_gkCurrentReachabilityStatus", a3))+[GKClientProxy performDelayedRequestsForEnvironment:](GKClientProxy, "performDelayedRequestsForEnvironment:", self->_currentEnvironment);
}

- (void)finishStartup
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100111C50;
  v2[3] = &unk_1002BBBD8;
  v2[4] = self;
  +[GKActivity named:execute:](GKActivity, "named:execute:", CFSTR("gamed - finishStartup"), v2);
}

- (void)storeBagChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  GKDataRequestManager *v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received store bag did change notification", buf, 2u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100112B8C;
  v9[3] = &unk_1002BB658;
  v10 = v5;
  v11 = self;
  v8 = v5;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v9);

}

- (id)pushConnectionForEnvironment:(int64_t)a3
{
  uint64_t v3;

  v3 = 72;
  if (a3 == 3)
    v3 = 80;
  return *(id *)((char *)&self->super.isa + v3);
}

- (APSConnection)activePushConnection
{
  return (APSConnection *)-[GKDataRequestManager pushConnectionForEnvironment:](self, "pushConnectionForEnvironment:", -[GKDataRequestManager activePushEnvironment](self, "activePushEnvironment"));
}

- (void)_updateNotificationTopicsForcefully:(BOOL)a3
{
  id v5;
  NSObject *v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  NSObject *v9;
  const char *label;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  APSConnection *v18;
  APSConnection *pushConnectionProd;
  APSConnection *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  APSConnection *v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  APSConnection *pushConnectionDev;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  id v45;
  APSConnection *v46;
  _QWORD v47[4];
  NSObject *v48;
  GKDataRequestManager *v49;
  const __CFString *v50;
  const __CFString *v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  APSConnection *v55;
  const __CFString *v56;
  const __CFString *v57;

  v5 = objc_msgSend((id)objc_opt_class(self, a2), "syncQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  v9 = v8;
  if (v8 != v6)
  {
    label = dispatch_queue_get_label(v8);
    v11 = dispatch_queue_get_label(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKDataRequestManager _updateNotificationTopicsForcefully:]", label, v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == syncQueue)\n[%s (%s:%d)]"), v13, "-[GKDataRequestManager _updateNotificationTopicsForcefully:]", objc_msgSend(v15, "UTF8String"), 585));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  if (a3 || !-[GKDataRequestManager pushUpdatesBusy](self, "pushUpdatesBusy"))
  {
    -[GKDataRequestManager setPushUpdatesBusy:](self, "setPushUpdatesBusy:", 1);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10011323C;
    v47[3] = &unk_1002BB658;
    v48 = v6;
    v49 = self;
    v17 = objc_retainBlock(v47);
    if (!self->_activePushEnvironment)
    {
      -[GKDataRequestManager _clearPushConnections](self, "_clearPushConnections");
LABEL_38:
      ((void (*)(_QWORD *))v17[2])(v17);
      goto LABEL_39;
    }
    v18 = (APSConnection *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager pushConnectionForEnvironment:](self, "pushConnectionForEnvironment:"));
    pushConnectionProd = self->_pushConnectionProd;
    if (v18 == pushConnectionProd)
      pushConnectionProd = self->_pushConnectionDev;
    v20 = pushConnectionProd;
    v46 = v20;
    if (!os_log_GKGeneral)
      v21 = (id)GKOSLoggers(v20);
    v22 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      if (v46 == self->_pushConnectionProd)
        v23 = CFSTR("prod");
      else
        v23 = CFSTR("dev");
      *(_DWORD *)buf = 138412290;
      v53 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Clearing gamed topic for %@", buf, 0xCu);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v57 = CFSTR("com.apple.gamed");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
    -[APSConnection setEnabledTopics:ignoredTopics:](v46, "setEnabledTopics:ignoredTopics:", v24, v25);

    if (!os_log_GKGeneral)
      v27 = (id)GKOSLoggers(v26);
    v28 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v29 = CFSTR("dev");
      if (v18 == self->_pushConnectionProd)
        v29 = CFSTR("prod");
      *(_DWORD *)buf = 138412290;
      v53 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Enabling gamed topic for %@", buf, 0xCu);
    }
    v56 = CFSTR("com.apple.gamed");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[APSConnection setEnabledTopics:ignoredTopics:](v18, "setEnabledTopics:ignoredTopics:", v30, v31);

    if (!os_log_GKGeneral)
      v33 = (id)GKOSLoggers(v32);
    v34 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v35 = self->_pushConnectionProd;
      *(_DWORD *)buf = 138412546;
      v53 = CFSTR("com.apple.gamed");
      v54 = 2112;
      v55 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Enabling topic (%@) for %@", buf, 0x16u);
    }
    v51 = CFSTR("com.apple.gamed");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
    -[APSConnection _setEnabledTopics:](self->_pushConnectionProd, "_setEnabledTopics:", v36);

    if (!os_log_GKGeneral)
      v38 = (id)GKOSLoggers(v37);
    v39 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      pushConnectionDev = self->_pushConnectionDev;
      *(_DWORD *)buf = 138412546;
      v53 = CFSTR("com.apple.gamed");
      v54 = 2112;
      v55 = pushConnectionDev;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Enabling topic (%@) for %@", buf, 0x16u);
    }
    v50 = CFSTR("com.apple.gamed");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
    -[APSConnection _setEnabledTopics:](self->_pushConnectionDev, "_setEnabledTopics:", v41);

    v42 = objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](v18, "publicToken"));
    v43 = (void *)v42;
    v44 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v45 = (id)GKOSLoggers(v42);
      v44 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      sub_1001183B0();
      if (v43)
      {
LABEL_33:
        -[GKDataRequestManager _setPushToken:](self, "_setPushToken:", v43);
        if (objc_msgSend(v43, "length"))
        {
          -[GKDataRequestManager sendPushTokenWithReplyQueue:completion:](self, "sendPushTokenWithReplyQueue:completion:", 0, v17);

LABEL_39:
          goto LABEL_40;
        }
      }
    }
    else if (v43)
    {
      goto LABEL_33;
    }

    goto LABEL_38;
  }
LABEL_40:

}

- (void)setUpCloudKitNotificationTopics
{
  void *v3;
  id v4;
  uint64_t v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  APSConnection *v8;
  APSConnection *apsConnection;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.gamed")));
  if (!self->_apsConnection)
  {
    v4 = objc_alloc((Class)APSConnection);
    v5 = APSEnvironmentProduction;
    global_queue = dispatch_get_global_queue(0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v8 = (APSConnection *)objc_msgSend(v4, "initWithEnvironmentName:namedDelegatePort:queue:", v5, CFSTR("com.apple.aps.gamed.CK"), v7);
    apsConnection = self->_apsConnection;
    self->_apsConnection = v8;

    -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", self);
  }
  v11 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[APSConnection _setEnabledTopics:](self->_apsConnection, "_setEnabledTopics:", v10);

}

- (void)credentialsDidChange:(id)a3
{
  -[GKDataRequestManager updateNotificationTopicsForceFully:](self, "updateNotificationTopicsForceFully:", 1);
}

- (void)updateNotificationTopicsForceFully:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001134F4;
  v3[3] = &unk_1002BCAF8;
  v3[4] = self;
  v4 = a3;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v3);
}

- (void)_clearPushConnections
{
  id v3;
  NSObject *v4;
  APSConnection *pushConnectionProd;
  id v6;
  id v7;
  NSObject *v8;
  APSConnection *pushConnectionDev;
  int v10;
  APSConnection *v11;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushConnectionProd = self->_pushConnectionProd;
    v10 = 138412290;
    v11 = pushConnectionProd;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing topics for prod %@", (uint8_t *)&v10, 0xCu);
  }
  v6 = -[APSConnection _setEnabledTopics:](self->_pushConnectionProd, "_setEnabledTopics:", &__NSArray0__struct);
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v6);
  v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushConnectionDev = self->_pushConnectionDev;
    v10 = 138412290;
    v11 = pushConnectionDev;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Clearing topics for dev %@", (uint8_t *)&v10, 0xCu);
  }
  -[APSConnection _setEnabledTopics:](self->_pushConnectionDev, "_setEnabledTopics:", &__NSArray0__struct);
}

- (void)clearPushEnvironment
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001136A0;
  v2[3] = &unk_1002BBBD8;
  v2[4] = self;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[GKDataRequestManager setReceivesMemoryWarnings:](self, "setReceivesMemoryWarnings:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  objc_msgSend(v4, "setPreferencesDelegate:", 0);

  -[GKDataRequestManager setGameModeListener:](self, "setGameModeListener:", 0);
  v5.receiver = self;
  v5.super_class = (Class)GKDataRequestManager;
  -[GKDataRequestManager dealloc](&v5, "dealloc");
}

- (int64_t)preferredEnvironment
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v3 = objc_msgSend(v2, "environment");

  return (int64_t)v3;
}

+ (BOOL)allowSelfSignedCertForEnvironment:(int64_t)a3
{
  return ((unint64_t)a3 < 0xB) & (0x518u >> a3);
}

- (void)resetEnvironmentWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Resetting environment", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v9 = -[GKDataRequestManager currentEnvironment](self, "currentEnvironment");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011390C;
  v11[3] = &unk_1002BB6E8;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "removeAllCredentialsForEnvironment:completionHandler:", v9, v11);

}

- (void)resetEnvironment
{
  -[GKDataRequestManager resetEnvironmentWithHandler:](self, "resetEnvironmentWithHandler:", &stru_1002C3A08);
}

- (void)awaitNATSettingsAndUpdateIfNeededWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager commonNATSettings](self, "commonNATSettings"));

  if (v5)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v6);
    v8 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[NAT] Has cached NAT settings. Returning.", v9, 2u);
    }
    v4[2](v4);
  }
  else
  {
    -[GKDataRequestManager updateCachedNATSettingsIfNeededWithCompletionHandler:](self, "updateCachedNATSettingsIfNeededWithCompletionHandler:", v4);
  }

}

- (void)updateCachedNATSettingsIfNeededWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  char *specific;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];
  void (**v21)(_QWORD);
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  specific = (char *)dispatch_get_specific(&off_100314488);
  if (specific == "com.apple.GameKit.GKDataRequestManager.sync")
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(specific);
    v9 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[NAT] Updating cached settings.", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKViceroyNATConfiguration settingsKeys](GKViceroyNATConfiguration, "settingsKeys"));
      v13 = objc_msgSend((id)objc_opt_class(self, v12), "syncQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10011405C;
      v17[3] = &unk_1002BC448;
      v17[4] = self;
      v18 = v10;
      v19 = v4;
      objc_msgSend(v18, "getValuesForKeys:queue:completion:", v11, v14, v17);

    }
    else
    {
      if (!os_log_GKGeneral)
        v15 = (id)GKOSLoggers(0);
      v16 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[NAT] No store bag, not updating NAT settings", buf, 2u);
      }
      v4[2](v4);
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v6 = (id)GKOSLoggers(specific);
    v7 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[NAT] Not on sync queue, switching to sync queue.", buf, 2u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100114050;
    v20[3] = &unk_1002BB758;
    v20[4] = self;
    v21 = v4;
    -[GKDataRequestManager performAsync:](self, "performAsync:", v20);

  }
}

- (void)getValidNATTypeWithForceRelay:(BOOL)a3 withHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (v4)
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v6);
    v9 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[NAT] Returning forced relay NAT type.", buf, 2u);
    }
    ((void (**)(_QWORD, id))v7)[2](v7, +[GKViceroyNATTypeHelper forceRelayNATType](GKViceroyNATTypeHelper, "forceRelayNATType"));
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100114420;
    v10[3] = &unk_1002BB758;
    v10[4] = self;
    v11 = v6;
    -[GKDataRequestManager performAsync:](self, "performAsync:", v10);

  }
}

- (BOOL)hasValidNATSettings
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager commonNATSettings](self, "commonNATSettings"));
  v3 = v2 != 0;

  return v3;
}

- (int64_t)activePushEnvironment
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100114E64;
  v4[3] = &unk_1002BE9C0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKDataRequestManager performSync:](self, "performSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setActivePushEnvironment:(int64_t)a3
{
  dispatch_queue_t current_queue;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  const char *label;
  uint64_t v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  id v22;
  NSObject *v23;
  int64_t activePushEnvironment;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  APSConnection *v29;
  APSConnection *pushConnectionDev;
  uint64_t v31;
  id v32;
  NSObject *v33;
  APSConnection *v34;
  uint8_t buf[4];
  _QWORD v36[2];

  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  v8 = objc_msgSend((id)objc_opt_class(self, v7), "syncQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);

  if (v6 != v9)
  {
    label = dispatch_queue_get_label(v6);
    v12 = objc_msgSend((id)objc_opt_class(self, v11), "syncQueue");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_get_label(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKDataRequestManager _setActivePushEnvironment:]", label, v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]"), v16, "-[GKDataRequestManager _setActivePushEnvironment:]", objc_msgSend(v18, "UTF8String"), 987));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v19);
  }

  if ((unint64_t)a3 <= 2)
    v21 = 2;
  else
    v21 = a3;
  if (v21 != self->_activePushEnvironment)
  {
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(v20);
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      activePushEnvironment = self->_activePushEnvironment;
      *(_DWORD *)buf = 67109376;
      LODWORD(v36[0]) = activePushEnvironment;
      WORD2(v36[0]) = 1024;
      *(_DWORD *)((char *)v36 + 6) = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Changing push environment from %d to %d", buf, 0xEu);
    }
    self->_activePushEnvironment = v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v25, "setInteger:forKey:", self->_activePushEnvironment, GKPushEnvironmentKey);
    objc_msgSend(v25, "synchronize");
    if (self->_activePushEnvironment == 3 && !self->_pushConnectionDev)
    {
      v26 = objc_alloc((Class)APSConnection);
      v27 = APSEnvironmentDevelopment;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager pushQueue](GKDataRequestManager, "pushQueue"));
      v29 = (APSConnection *)objc_msgSend(v26, "initWithEnvironmentName:namedDelegatePort:queue:", v27, CFSTR("com.apple.gamed.apsdev"), v28);
      pushConnectionDev = self->_pushConnectionDev;
      self->_pushConnectionDev = v29;

      if (!os_log_GKGeneral)
        v32 = (id)GKOSLoggers(v31);
      v33 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v34 = self->_pushConnectionDev;
        *(_DWORD *)buf = 138412290;
        v36[0] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Created dev push connection: %@", buf, 0xCu);
      }
      -[APSConnection setDelegate:](self->_pushConnectionDev, "setDelegate:", self);
    }
    -[GKDataRequestManager _updateNotificationTopicsForcefully:](self, "_updateNotificationTopicsForcefully:", 1);

  }
}

- (void)setActivePushEnvironment:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100115210;
  v3[3] = &unk_1002C1620;
  v3[4] = self;
  v3[5] = a3;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v3);
}

- (NSData)pushToken
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1001152E0;
  v9 = sub_1001152F0;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001152F8;
  v4[3] = &unk_1002BE9C0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKDataRequestManager performSync:](self, "performSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

- (void)_setPushToken:(id)a3
{
  id v5;
  dispatch_queue_t current_queue;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  const char *label;
  uint64_t v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSData **p_pushToken;
  uint64_t v22;
  id v23;
  NSObject *v24;
  NSData *pushToken;
  int64_t activePushEnvironment;
  NSData *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  NSData *v32;
  __int16 v33;
  int v34;

  v5 = a3;
  current_queue = dispatch_get_current_queue();
  v7 = objc_claimAutoreleasedReturnValue(current_queue);
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "syncQueue");
  v10 = objc_claimAutoreleasedReturnValue(v9);

  if (v7 != v10)
  {
    v30 = v5;
    label = dispatch_queue_get_label(v7);
    v13 = objc_msgSend((id)objc_opt_class(self, v12), "syncQueue");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_get_label(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKDataRequestManager _setPushToken:]", label, v15, v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]"), v17, "-[GKDataRequestManager _setPushToken:]", objc_msgSend(v19, "UTF8String"), 1033));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);
    v5 = v30;
  }

  p_pushToken = &self->_pushToken;
  objc_storeStrong((id *)&self->_pushToken, a3);
  if (!os_log_GKGeneral)
    v23 = (id)GKOSLoggers(v22);
  v24 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushToken = self->_pushToken;
    activePushEnvironment = self->_activePushEnvironment;
    *(_DWORD *)buf = 138412546;
    v32 = pushToken;
    v33 = 1024;
    v34 = activePushEnvironment;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "pushToken: %@ activePushEnvironment: %d", buf, 0x12u);
  }
  v27 = *p_pushToken;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v29 = v28;
  if (v27)
    objc_msgSend(v28, "setObject:forKey:", *p_pushToken, GKPushTokenKey);
  else
    objc_msgSend(v28, "removeObjectForKey:", GKPushTokenKey);

}

- (void)setPushToken:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKDataRequestManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100115610;
  v4[3] = &unk_1002BB658;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKDataRequestManager performAsync:](v5, "performAsync:", v4);

}

- (void)_updatePushEnvironmentWithStoreBag:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v6 = (unint64_t)objc_msgSend(v5, "pushEnvironment");

  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = 67109120;
    LODWORD(v15) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "default pushEnvironment = %d", (uint8_t *)&v14, 8u);
  }
  if (v6 <= 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("gk-apns-env")));
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("dev"));
    if ((_DWORD)v11)
      v6 = 3;
    else
      v6 = 2;
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v11);
    v13 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v10;
      v16 = 1024;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "using bag pushEnvironment %@ (%d)", (uint8_t *)&v14, 0x12u);
    }

  }
  -[GKDataRequestManager _setActivePushEnvironment:](self, "_setActivePushEnvironment:", v6);

}

- (void)updateActivePushEnvironment
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "syncQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011586C;
  v8[3] = &unk_1002C3AF8;
  v8[4] = self;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v7, "getValuesForKeys:queue:completion:", &off_1002DC698, v6, v8);

}

- (void)sendPushTokenWithReplyQueue:(id)a3
{
  -[GKDataRequestManager sendPushTokenWithReplyQueue:completion:](self, "sendPushTokenWithReplyQueue:completion:", a3, &stru_1002C3B18);
}

- (void)sendPushTokenWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int64_t currentEnvironment;
  int64_t activePushEnvironment;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;

  v6 = a3;
  v7 = a4;
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "syncQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v6)
    v6 = v10;
  currentEnvironment = self->_currentEnvironment;
  activePushEnvironment = self->_activePushEnvironment;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100115B90;
  v17[3] = &unk_1002C3B90;
  v20 = currentEnvironment;
  v21 = activePushEnvironment;
  v18 = v11;
  v19 = v7;
  v17[4] = self;
  v15 = v11;
  v16 = v7;
  objc_msgSend(v14, "getValuesForKeys:queue:completion:", &off_1002DC6B0, v6, v17);

}

- (id)ampController
{
  return +[GKAMPController controller](GKAMPController, "controller");
}

- (void)synchronizeBagWithPreferences
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
  v8[0] = GKMaxRecentPlayersCount;
  v8[1] = GKMaxRecentPlayersTime;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "syncQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "getValuesForKeys:queue:completion:", v4, v7, &stru_1002C3BD0);

}

- (void)terminateClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKMultiplayerMatchService, "serviceWithTransport:forClient:localPlayer:", 0, v7, 0));
  objc_msgSend(v4, "cancelGameInviteWithHandler:", &stru_1002C3BF0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKMultiplayerMatchService, "serviceWithTransport:forClient:localPlayer:", 0, v7, 0));
  objc_msgSend(v5, "cancelOutstandingMatchRequestWithHandler:", &stru_1002C3C10);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  objc_msgSend(v6, "disconnectConnectionsForClient:reason:handler:", v7, 3, &stru_1002C3C30);

  -[GKDataRequestManager clearAllNearbyInvites](self, "clearAllNearbyInvites");
  objc_msgSend(v7, "clearDiscoveryInfo");
  +[GKClientProxy removeClient:](GKClientProxy, "removeClient:", v7);
  objc_msgSend(v7, "terminateWithCompletionHandler:", &stru_1002C3C70);

}

- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKDataRequestManager: loadLocalizedGameNameForBundleID", buf, 2u);
  }
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v10, 0));
    v17 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10011671C;
    v13[3] = &unk_1002BCA30;
    v14 = v5;
    v15 = v7;
    objc_msgSend(v11, "getGameMetadataForBundleIDs:handler:", v12, v13);

  }
}

- (void)gameCenterDidBecomeRestricted
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKDataRequestManager: gameCenterDidBecomeRestricted", v5, 2u);
  }
  -[GKDataRequestManager resetEnvironment](self, "resetEnvironment");
}

- (void)processIncomingiMessageInvite:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Processing incoming Messages invite data dictionary: %@", (uint8_t *)&v7, 0xCu);
  }
  +[GKBulletin bulletinsForPushNotification:withHandler:](GKBulletin, "bulletinsForPushNotification:withHandler:", v4, &stru_1002C3CD0);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL8 v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  v11 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKDataRequestManager: connection:didReceivePublicToken:", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "connection: %@ publicToken: %@", buf, 0x16u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100116C70;
  v16[3] = &unk_1002BC380;
  v16[4] = self;
  v17 = v6;
  v18 = v8;
  v14 = v8;
  v15 = v6;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v16);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL8 v28;
  id v29;
  NSObject *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKDataRequestManager: connection:didReceiveIncomingMessage:", (uint8_t *)&v31, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topic"));
  v13 = (void *)v12;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v12);
  v15 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v31 = 138412290;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received push: %@", (uint8_t *)&v31, 0xCu);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v16, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountAll);

  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v17);
  v19 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v31 = 138412546;
    v32 = v13;
    v33 = 2112;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "received push for topic %@, userInfo = %@", (uint8_t *)&v31, 0x16u);
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.gamed")) & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v21 = objc_msgSend(v20, "isGameCenterDisabled");

    if ((v21 & 1) == 0)
      -[GKDataRequestManager processIncomingMessage:](self, "processIncomingMessage:", v11);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.gamed")));
    v23 = objc_msgSend(v13, "isEqualToString:", v22);

    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CKDatabaseNotification notificationFromRemoteNotificationDictionary:](CKDatabaseNotification, "notificationFromRemoteNotificationDictionary:", v11));
      +[GKCloudGameSession updateCacheForDatabaseScope:handler:](GKCloudGameSession, "updateCacheForDatabaseScope:handler:", objc_msgSend(v25, "databaseScope"), &stru_1002C3CF0);

    }
    else
    {
      if (!os_log_GKGeneral)
        v26 = (id)GKOSLoggers(v24);
      v27 = os_log_GKTrace;
      v28 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
      if (v28)
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "GKDataRequestManager: PUSH FAILED: unknown topic", (uint8_t *)&v31, 2u);
      }
      if (!os_log_GKGeneral)
        v29 = (id)GKOSLoggers(v28);
      v30 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v31 = 138412290;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "PUSH FAILED: Unknown topic (%@)", (uint8_t *)&v31, 0xCu);
      }
    }
  }

}

- (void)processIncomingMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  -[GKDataRequestManager beginTransaction:](self, "beginTransaction:", CFSTR("processMessage"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011723C;
  block[3] = &unk_1002BBBD8;
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[GKDataRequestManager endTransaction:](self, "endTransaction:", CFSTR("processMessage"));

}

- (void)endTransaction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKDataRequestManager: endTransaction:", buf, 2u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100117448;
  v9[3] = &unk_1002BB658;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v9);

}

- (void)beginTransaction:(id)a3
{
  -[GKDataRequestManager beginTransaction:completion:](self, "beginTransaction:completion:", a3, 0);
}

- (void)beginTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKDataRequestManager: beginTransaction:", buf, 2u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001175F4;
  v13[3] = &unk_1002BB568;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v11 = v8;
  v12 = v6;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v13);

}

- (void)terminate
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKDataRequestManager: Forced termination", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Forced termination. Goodbye.", v8, 2u);
  }
  -[GKDataRequestManager performSync:](self, "performSync:", &stru_1002C3D30);
}

+ (id)statsQueue
{
  if (qword_100318068 != -1)
    dispatch_once(&qword_100318068, &stru_1002C3D50);
  return (id)qword_100318060;
}

+ (id)ratingsQueue
{
  if (qword_100318078 != -1)
    dispatch_once(&qword_100318078, &stru_1002C3D70);
  return (id)qword_100318070;
}

- (BOOL)receivesMemoryWarnings
{
  return self->_receivesMemoryWarnings;
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  self->_receivesMemoryWarnings = a3;
}

- (NSDate)nearbyQueryLastCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNearbyQueryLastCheckDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)nearbyQueryAllowance
{
  return self->_nearbyQueryAllowance;
}

- (void)setNearbyQueryAllowance:(double)a3
{
  self->_nearbyQueryAllowance = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (APSConnection)pushConnectionProd
{
  return self->_pushConnectionProd;
}

- (void)setPushConnectionProd:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnectionProd, a3);
}

- (APSConnection)pushConnectionDev
{
  return self->_pushConnectionDev;
}

- (void)setPushConnectionDev:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnectionDev, a3);
}

- (NSMutableDictionary)transactionBag
{
  return self->_transactionBag;
}

- (void)setTransactionBag:(id)a3
{
  objc_storeStrong((id *)&self->_transactionBag, a3);
}

- (NSCountedSet)transactionCounts
{
  return self->_transactionCounts;
}

- (void)setTransactionCounts:(id)a3
{
  objc_storeStrong((id *)&self->_transactionCounts, a3);
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (NSString)authenticatingWithSettingsBundleID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAuthenticatingWithSettingsBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (GKReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (_TtC14GameDaemonCore18GKGameModeListener)gameModeListener
{
  return self->_gameModeListener;
}

- (void)setGameModeListener:(id)a3
{
  objc_storeStrong((id *)&self->_gameModeListener, a3);
}

- (BOOL)pushUpdatesBusy
{
  return self->_pushUpdatesBusy;
}

- (void)setPushUpdatesBusy:(BOOL)a3
{
  self->_pushUpdatesBusy = a3;
}

- (GKWidgetEventListener)widgetEventListner
{
  return self->_widgetEventListner;
}

- (void)setWidgetEventListner:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEventListner, a3);
}

- (unint64_t)natType
{
  return self->_natType;
}

- (void)setNatType:(unint64_t)a3
{
  self->_natType = a3;
}

- (NSDate)lastNATTypeCheckDate
{
  return self->_lastNATTypeCheckDate;
}

- (void)setLastNATTypeCheckDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastNATTypeCheckDate, a3);
}

- (NSDictionary)commonNATSettings
{
  return self->_commonNATSettings;
}

- (void)setCommonNATSettings:(id)a3
{
  objc_storeStrong((id *)&self->_commonNATSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonNATSettings, 0);
  objc_storeStrong((id *)&self->_lastNATTypeCheckDate, 0);
  objc_storeStrong((id *)&self->_widgetEventListner, 0);
  objc_storeStrong((id *)&self->_gameModeListener, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_authenticatingWithSettingsBundleID, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_transactionCounts, 0);
  objc_storeStrong((id *)&self->_transactionBag, 0);
  objc_storeStrong((id *)&self->_pushConnectionDev, 0);
  objc_storeStrong((id *)&self->_pushConnectionProd, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_nearbyQueryLastCheckDate, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_publicListener, 0);
}

- (NSMutableSet)removedApp
{
  return (NSMutableSet *)objc_getAssociatedObject(self, CFSTR("GK_REMOVED_APP_SET_KEY"));
}

- (void)setRemovedApp:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("GK_REMOVED_APP_SET_KEY"), a3, (void *)0x301);
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  GKDataRequestManager *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v21 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](self, "removedApp"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[GKDataRequestManager setRemovedApp:](self, "setRemovedApp:", v6);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = GKInfoPlistKeyFriendsAPIUsageDescription;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleURL"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleURL"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "infoDictionary"));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v11));
          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](v21, "removedApp"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
            objc_msgSend(v19, "addObject:", v20);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  GKGameSettingsInternal *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](self, "removedApp", a3));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
        v8 = objc_opt_new(GKGameSettingsInternal);
        -[GKGameSettingsInternal setBundleID:](v8, "setBundleID:", v7);
        -[GKGameSettingsInternal setAllowFriendListAccess:](v8, "setAllowFriendListAccess:", 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v9, 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameSettingsInternal bundleID](v8, "bundleID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameSettingsInternal serverAllowFriendListAccessValue](v8, "serverAllowFriendListAccessValue"));
        objc_msgSend(v10, "submitFriendListAccess:value:handler:", v11, v12, &stru_1002C3D90);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](self, "removedApp"));
  objc_msgSend(v13, "removeAllObjects");

}

@end
