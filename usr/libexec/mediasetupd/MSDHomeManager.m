@implementation MSDHomeManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CCF8;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052738 != -1)
    dispatch_once(&qword_100052738, block);
  return (id)qword_100052740;
}

- (MSDHomeManager)init
{
  MSDHomeManager *v2;
  MSDHomeManager *v3;
  id v4;
  uint64_t v5;
  void *v6;
  HMHomeManager *v7;
  HMHomeManager *homeManager;
  uint64_t v9;
  uint64_t v10;
  NSMutableSet *delegates;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *queuedAwaitingCurrentHome;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MSDHomeManager;
  v2 = -[MSDHomeManager init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isWaitingToStart = 1;
    *(_WORD *)&v2->_waitingForHomesToLoad = 0;
    v2->_readinessLock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc((Class)HMMutableHomeManagerConfiguration), "initWithOptions:cachePolicy:", 104, 2);
    objc_msgSend(v4, "setDiscretionary:", 1);
    v6 = (void *)objc_opt_new(NSOperationQueue, v5);
    objc_msgSend(v4, "setDelegateQueue:", v6);
    v7 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)HMHomeManager), "initWithHomeMangerConfiguration:", v4);
    homeManager = v3->_homeManager;
    v3->_homeManager = v7;

    -[HMHomeManager setDelegate:](v3->_homeManager, "setDelegate:", v3);
    v10 = objc_opt_new(NSMutableSet, v9);
    delegates = v3->_delegates;
    v3->_delegates = (NSMutableSet *)v10;

    v13 = objc_opt_new(NSMutableArray, v12);
    queuedAwaitingCurrentHome = v3->_queuedAwaitingCurrentHome;
    v3->_queuedAwaitingCurrentHome = (NSMutableArray *)v13;

  }
  return v3;
}

- (void)addDelegate:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](self->_delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDelegate:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)homeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHomeManager allHomes](self, "allHomes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HMHome)currentHome
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D0F4;
  v5[3] = &unk_1000491A8;
  v5[4] = self;
  v5[5] = &v6;
  -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v5);
  if (*((_BYTE *)v7 + 24))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentHome](self->_homeManager, "currentHome"));
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);
  return (HMHome *)v3;
}

- (HMAccessory)currentAccessory
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D204;
  v5[3] = &unk_1000491A8;
  v5[4] = self;
  v5[5] = &v6;
  -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v5);
  if (*((_BYTE *)v7 + 24))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory"));
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);
  return (HMAccessory *)v3;
}

- (NSArray)allHomes
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D314;
  v5[3] = &unk_1000491A8;
  v5[4] = self;
  v5[5] = &v6;
  -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v5);
  if (*((_BYTE *)v7 + 24))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes"));
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);
  return (NSArray *)v3;
}

- (void)awaitCurrentHomeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = sub_10000D464;
    v14 = sub_10000D474;
    v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D47C;
    v7[3] = &unk_1000491D0;
    v9 = &v10;
    v7[4] = self;
    v6 = (void (**)(_QWORD))v4;
    v8 = v6;
    -[MSDHomeManager _withRequestLock:](self, "_withRequestLock:", v7);
    if (v11[5])
      v6[2](v6);

    _Block_object_dispose(&v10, 8);
  }

}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager userCloudShareManager](self->_homeManager, "userCloudShareManager"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager userCloudShareManager](self->_homeManager, "userCloudShareManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D5C8;
  v8[3] = &unk_100048BD8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "registerForContainerIDs:completion:", v7, v8);

}

- (id)getHomeForUserIdentifier:(id)a3
{
  return 0;
}

- (NSUUID)homeOwnerUniqueIdentifier
{
  return 0;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  char *v6;
  id v7;
  _BOOL4 isWaitingToStart;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;

  v6 = (char *)a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (isWaitingToStart)
  {
    if (v11)
    {
      v16 = 136315138;
      v17 = "-[MSDHomeManager homeManager:didAddHome:]";
      v12 = "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.";
      v13 = v10;
      v14 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    if (v11)
    {
      v16 = 138478083;
      v17 = v6;
      v18 = 2113;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HMHomeManager %{private}@ Added Home %{private}@", (uint8_t *)&v16, 0x16u);
    }

    if (!objc_msgSend(v7, "isCurrentUserRestrictedGuest"))
    {
      objc_msgSend(v7, "setDelegate:", self);
      v10 = objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
      -[NSObject refreshDataForReason:completion:](v10, "refreshDataForReason:completion:", 0, &stru_100049210);
      goto LABEL_11;
    }
    v15 = sub_10002E034();
    v10 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v12 = "Determined that the user was a restricted guest. Skipping CloudKit refresh";
      v13 = v10;
      v14 = 2;
      goto LABEL_9;
    }
  }
LABEL_11:

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6;
  id v7;
  _BOOL4 isWaitingToStart;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  if (isWaitingToStart)
  {
    v9 = sub_10002E034();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[MSDHomeManager homeManager:didRemoveHome:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    v12 = objc_msgSend(v6, "isHomeRemovedPermanently:", v11);

    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("NO");
      v16 = 138478339;
      v17 = (const char *)v6;
      v18 = 2113;
      if (v12)
        v15 = CFSTR("YES");
      v19 = v7;
      v20 = 2113;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "HMHomeManager %{private}@ Removed Home %{private}@ isRemovedPermanently: %{private}@", (uint8_t *)&v16, 0x20u);
    }

    if (v12)
      -[MSDHomeManager _homeWasRemoved](self, "_homeWasRemoved");
  }

}

- (void)homeManager:(id)a3 didRemoveHomePermanently:(id)a4
{
  char *v6;
  id v7;
  _BOOL4 isWaitingToStart;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v6 = (char *)a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_readinessLock);
  isWaitingToStart = self->_isWaitingToStart;
  os_unfair_lock_unlock(&self->_readinessLock);
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (isWaitingToStart)
  {
    if (v11)
    {
      v12 = 136315138;
      v13 = "-[MSDHomeManager homeManager:didRemoveHomePermanently:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s HMHomeManager still prewarming. Will refresh once HMHomeManager is fully ready.", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    if (v11)
    {
      v12 = 138478083;
      v13 = v6;
      v14 = 2113;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HMHomeManager %{private}@ Permanently Removed Home %{private}@", (uint8_t *)&v12, 0x16u);
    }

    -[MSDHomeManager _homeWasRemoved](self, "_homeWasRemoved");
  }

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 isWaitingToStart;
  char v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unsigned int v20;

  v4 = a3;
  v5 = -[MSDHomeManager isHomeManagerReady:](self, "isHomeManagerReady:", v4);
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMHomeManagerStatusToString(objc_msgSend(v4, "status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v15 = 136315650;
    v16 = "-[MSDHomeManager homeManagerDidUpdateHomes:]";
    v17 = 2112;
    v18 = v9;
    v19 = 1024;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s manager status: %@, managerIsReady: %i", (uint8_t *)&v15, 0x1Cu);

  }
  os_unfair_lock_lock(&self->_readinessLock);
  isWaitingToStart = self->_isWaitingToStart;
  if (!self->_isHomeKitInitialized)
    self->_isHomeKitInitialized = 1;
  os_unfair_lock_unlock(&self->_readinessLock);
  v11 = v5 ^ 1;
  if (isWaitingToStart)
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    v12 = sub_10002E034();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homes"));
      v15 = 138477827;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received update on homes: %{private}@", (uint8_t *)&v15, 0xCu);

    }
    -[MSDHomeManager _addHomeDelegates:](self, "_addHomeDelegates:", v4);
  }

}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  unsigned int v17;

  v5 = a3;
  v6 = -[MSDHomeManager isHomeManagerReady:](self, "isHomeManagerReady:", v5);
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HMHomeManagerStatusToString(objc_msgSend(v5, "status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[MSDHomeManager homeManager:didUpdateStatus:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s manager status: %@, managerIsReady: %i", buf, 0x1Cu);

  }
  if (v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v17) = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000DFA8;
    v13[3] = &unk_100049238;
    v15 = buf;
    v13[4] = self;
    v14 = v5;
    -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v13);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      -[MSDHomeManager _handleHomeKitFinishedInitialization](self, "_handleHomeKitFinishedInitialization");
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000E16C;
      v12[3] = &unk_100048AC0;
      v12[4] = self;
      -[MSDHomeManager _withReadinessLock:](self, "_withReadinessLock:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
      objc_msgSend(v11, "refreshDataForReason:completion:", 9, &stru_100049258);

    }
    _Block_object_dispose(buf, 8);
  }

}

- (BOOL)isHomeManagerReady:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "status") & 0x31) == 0;
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  MSDDataRefresh *v6;
  _DWORD v7[2];

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v3, "isMultiUserEnabled");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Home MUEnablement status changed : %d", (uint8_t *)v7, 8u);
  }

  if (objc_msgSend(v3, "isMultiUserEnabled"))
  {
    v6 = -[MSDDataRefresh initWithReason:]([MSDDataRefresh alloc], "initWithReason:", 2);
    -[MSDDataRefresh performRefreshWithCompletion:](v6, "performRefreshWithCompletion:", &stru_100049278);

  }
}

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    v16 = "-[MSDHomeManager shareManager:didReceiveShareInvitation:completionHandler:]";
    v17 = 2113;
    v18 = v7;
    v19 = 2113;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s, Manager:%{private}@ invitation: %{private}@", buf, 0x20u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000E4F4;
  v13[3] = &unk_1000492A0;
  v14 = v9;
  v12 = v9;
  +[MSDHomeCloudShareCreate acceptInvitation:completion:](MSDHomeCloudShareCreate, "acceptInvitation:completion:", v8, v13);

}

- (void)_addHomeDelegates:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "homes"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E63C;
  v5[3] = &unk_1000492C8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (BOOL)isHomeKitReady
{
  os_unfair_lock_assert_owner(&self->_readinessLock);
  if (self->_isHomeKitInitialized)
    return -[MSDHomeManager isHomeManagerReady:](self, "isHomeManagerReady:", self->_homeManager);
  else
    return 0;
}

- (void)_homeWasRemoved
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
  objc_msgSend(v2, "refreshDataForReason:completion:", 1, &stru_1000492E8);

}

- (void)_noteHomesStillLoading
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostID;
  uint8_t v7[16];

  os_unfair_lock_assert_owner(&self->_readinessLock);
  if (!-[MSDHomeManager isWaitingForHomesToLoad](self, "isWaitingForHomesToLoad"))
  {
    self->_waitingForHomesToLoad = 1;
    self->signpostID = MSDGenerateSignpostID();
    v3 = MSDSignpostFacility();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    signpostID = self->signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "LookupHomes", (const char *)&unk_100039E4E, v7, 2u);
    }

  }
}

- (void)_withReadinessLock:(id)a3
{
  os_unfair_lock_s *p_readinessLock;
  void (**v4)(_QWORD);

  p_readinessLock = &self->_readinessLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_readinessLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_readinessLock);
}

- (void)_withRequestLock:(id)a3
{
  os_unfair_lock_s *p_requestQueueLock;
  void (**v4)(_QWORD);

  p_requestQueueLock = &self->_requestQueueLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_requestQueueLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_requestQueueLock);
}

- (void)_handleHomeKitFinishedInitialization
{
  -[MSDHomeManager _handleHomeKitSyncComplete](self, "_handleHomeKitSyncComplete");
}

- (void)_handleHomeKitSyncComplete
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_delegates;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "homeManager:didHomeKitSyncComplete:") & 1) != 0)
        {
          global_queue = dispatch_get_global_queue(2, 0);
          v10 = objc_claimAutoreleasedReturnValue(global_queue);
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10000EA00;
          v11[3] = &unk_100049310;
          v11[4] = v8;
          v11[5] = self;
          dispatch_async(v10, v11);

        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (NSMutableSet)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (BOOL)isWaitingForHomesToLoad
{
  return self->_waitingForHomesToLoad;
}

- (void)setWaitingForHomesToLoad:(BOOL)a3
{
  self->_waitingForHomesToLoad = a3;
}

- (BOOL)isHomeKitInitialized
{
  return self->_isHomeKitInitialized;
}

- (void)setIsHomeKitInitialized:(BOOL)a3
{
  self->_isHomeKitInitialized = a3;
}

- (BOOL)isWaitingToStart
{
  return self->_isWaitingToStart;
}

- (void)setIsWaitingToStart:(BOOL)a3
{
  self->_isWaitingToStart = a3;
}

- (NSMutableArray)queuedAwaitingCurrentHome
{
  return self->_queuedAwaitingCurrentHome;
}

- (void)setQueuedAwaitingCurrentHome:(id)a3
{
  objc_storeStrong((id *)&self->_queuedAwaitingCurrentHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedAwaitingCurrentHome, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
