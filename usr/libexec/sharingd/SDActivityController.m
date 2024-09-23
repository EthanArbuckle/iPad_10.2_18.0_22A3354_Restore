@implementation SDActivityController

- (SDActivityController)init
{
  SDActivityController *v2;
  IDSService *v3;
  IDSService *activityService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDActivityController;
  v2 = -[SDXPCDaemon init](&v6, "init");
  if (v2)
  {
    v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.activity"));
    activityService = v2->_activityService;
    v2->_activityService = v3;

    -[IDSService addDelegate:queue:](v2->_activityService, "addDelegate:queue:", v2, &_dispatch_main_q);
  }
  return v2;
}

- (BOOL)restart
{
  return 0;
}

- (id)idsDeviceFromBTIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)appleID
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityController activityService](self, "activityService", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loginID"));

        if (v8)
        {
          v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loginID"));
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSString *)v4;
}

- (BOOL)shouldStart
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_msgSend(v3, "isActivityContinuationAllowed");

  if ((v4 & 1) == 0)
  {
    v15 = handoff_log(v5, v6);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Handoff is disabled in settings on this device", buf, 2u);
    }
    v16 = 0;
    goto LABEL_27;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((-[NSObject deviceWasUnlockedOnce](v7, "deviceWasUnlockedOnce") & 1) != 0
    || (v8 = -[NSObject deviceUIUnlocked](v7, "deviceUIUnlocked"), (v8 & 1) != 0))
  {
    v10 = -[NSObject alwaysSendPayload](v7, "alwaysSendPayload");
    if ((_DWORD)v10)
    {
      v12 = handoff_log(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v14 = "Real Handoff is disabled since alwaysSendPayload is enabled";
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices", 0));
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v13);
            v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v21, "supportsHandoff"))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "nsuuid"));

              if (v22)
              {
                v16 = 1;
                goto LABEL_26;
              }
            }
          }
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v18)
            continue;
          break;
        }
      }

      v25 = handoff_log(v23, v24);
      v13 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v14 = "Failed to find any valid cloud paired devices";
    }
  }
  else
  {
    v26 = handoff_log(v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v14 = "Handoff is disabled until first unlock has occurred";
  }
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
LABEL_24:
  v16 = 0;
LABEL_26:

LABEL_27:
  return v16;
}

- (NSArray)allPeerBTIdentifiers
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices", 0));
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
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
        if (objc_msgSend(v9, "supportsHandoff"))
          v11 = v10 == 0;
        else
          v11 = 1;
        if (!v11)
          -[NSMutableArray addObject:](v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a4;
  v7 = handoff_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", CFSTR("@unionOfObjects.uniqueIDOverride")));
    v10 = SFCompactStringFromCollection(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13 = 138412290;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "List of Activity Continuation devices changed %@", (uint8_t *)&v13, 0xCu);

  }
  -[SDActivityController activityServiceDevicesChanged:](self, "activityServiceDevicesChanged:", v5);
  if (objc_msgSend(v5, "count"))
  {
    -[SDActivityController restart](self, "restart");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
    objc_msgSend(v12, "deleteAllEncryptionAndDecryptionKeys");

  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v9 = handoff_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10008B0D0(v6, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "devices"));
  -[SDActivityController nearbyServiceDevicesChanged:](self, "nearbyServiceDevicesChanged:", v11);

}

- (IDSService)activityService
{
  return self->_activityService;
}

- (void)setActivityService:(id)a3
{
  objc_storeStrong((id *)&self->_activityService, a3);
}

- (void)setShouldStart:(BOOL)a3
{
  self->_shouldStart = a3;
}

- (void)setAllPeerBTIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allPeerBTIdentifiers, a3);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_allPeerBTIdentifiers, 0);
  objc_storeStrong((id *)&self->_activityService, 0);
}

@end
