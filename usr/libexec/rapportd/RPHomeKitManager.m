@implementation RPHomeKitManager

- (id)homeKitUserIdentifiers
{
  NSArray *homeKitCurrentUserIDs;
  void *v5;
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  RPHomeKitManager *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitCurrentUserIDs = self->_homeKitCurrentUserIDs;
  if (homeKitCurrentUserIDs)
    return homeKitCurrentUserIDs;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
        if (v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));

          if (v15)
          {
            if (!v8)
              v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueIdentifier"));
            -[NSArray addObject:](v8, "addObject:", v17);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v18 = v21->_homeKitCurrentUserIDs;
  v21->_homeKitCurrentUserIDs = v8;
  v19 = v8;

  v20 = v21->_homeKitCurrentUserIDs;
  return v20;
}

- (RPHomeKitManager)initWithQueue:(id)a3
{
  id v5;
  RPHomeKitManager *v6;
  RPHomeKitManager *v7;
  id v8;
  HMHomeManager *v9;
  HMHomeManager *homeManager;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPHomeKitManager;
  v6 = -[RPHomeKitManager init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = objc_msgSend(objc_alloc(off_100130CB8()), "initWithOptions:cachePolicy:", 32780, 2);
    v9 = (HMHomeManager *)objc_msgSend(objc_alloc(off_100130CC0()), "initWithHomeMangerConfiguration:", v8);
    homeManager = v7->_homeManager;
    v7->_homeManager = v9;

  }
  return v7;
}

- (void)invalidate
{
  HMHomeManager *homeManager;
  HMUser *currentUser;
  HMHome *currentHome;
  id mediaGroupsChangedHandler;
  id personalRequestsStateChangedHandler;
  id roomUpdatedHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", 0);
    homeManager = self->_homeManager;
    self->_homeManager = 0;

    -[HMUser setDelegate:](self->_currentUser, "setDelegate:", 0);
    currentUser = self->_currentUser;
    self->_currentUser = 0;

    -[HMHome setDelegate:](self->_currentHome, "setDelegate:", 0);
    currentHome = self->_currentHome;
    self->_currentHome = 0;

    mediaGroupsChangedHandler = self->_mediaGroupsChangedHandler;
    self->_mediaGroupsChangedHandler = 0;

    personalRequestsStateChangedHandler = self->_personalRequestsStateChangedHandler;
    self->_personalRequestsStateChangedHandler = 0;

    roomUpdatedHandler = self->_roomUpdatedHandler;
    self->_roomUpdatedHandler = 0;

    if (dword_100130C48 <= 30
      && (dword_100130C48 != -1 || _LogCategory_Initialize(&dword_100130C48, 30)))
    {
      LogPrintF(&dword_100130C48, "-[RPHomeKitManager invalidate]", 30, "Invalidated\n");
    }
  }
}

- (id)filterHomeKitUserIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v26;
  void *v27;
  void *v28;
  RPHomeKitManager *v29;
  id v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v29 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v4;
  v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v30)
  {
    v26 = *(_QWORD *)v43;
    v27 = v6;
    v28 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v6);
        v31 = v7;
        v33 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v7);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](v29->_homeManager, "homes", v26));
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v39;
          while (2)
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v39 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "users"));
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v35;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v35 != v17)
                      objc_enumerationMutation(v14);
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1)
                                                                                       + 8 * (_QWORD)v18), "uniqueIdentifier"));
                    objc_msgSend(v13, "addObject:", v19);

                    v18 = (char *)v18 + 1;
                  }
                  while (v16 != v18);
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                }
                while (v16);
              }

              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUser"));
              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUser"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueIdentifier"));
                objc_msgSend(v13, "addObject:", v22);

              }
              v23 = objc_msgSend(v13, "containsObject:", v33);

              if ((v23 & 1) != 0)
              {

                v5 = v28;
                goto LABEL_25;
              }
              v11 = (char *)v11 + 1;
            }
            while (v11 != v9);
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v9)
              continue;
            break;
          }
        }

        v5 = v28;
        objc_msgSend(v28, "addObject:", v33);
LABEL_25:
        v7 = v31 + 1;
        v6 = v27;
      }
      while ((id)(v31 + 1) != v30);
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v30);
  }

  if (objc_msgSend(v5, "count"))
  {
    v24 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v24, "removeObjectsInArray:", v5);
  }
  else
  {
    v24 = v6;
  }

  return v24;
}

- (void)resetHomeKitUserIdentifiers
{
  NSArray *homeKitCurrentUserIDs;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitCurrentUserIDs = self->_homeKitCurrentUserIDs;
  self->_homeKitCurrentUserIDs = 0;

}

- (id)homeHubDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RPHomeKitManager _setupHome](self, "_setupHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager currentHome](self, "currentHome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryWithSiriEndpointIdentifier:", v4));

  return v6;
}

- (BOOL)personalRequestsStateForAccessory:(id)a3
{
  id v4;
  HMUser *currentUser;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  -[RPHomeKitManager _setupHome](self, "_setupHome");
  currentUser = self->_currentUser;
  if (currentUser)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMUser assistantAccessControlForHome:](currentUser, "assistantAccessControlForHome:", self->_currentHome));
    if (objc_msgSend(v6, "isEnabled"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessories", 0));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "siriEndpointIdentifier"));
            v12 = objc_msgSend(v11, "isEqual:", v4);

            if ((v12 & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_15;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (void)setCurrentUser:(id)a3
{
  HMUser **p_currentUser;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  p_currentUser = &self->_currentUser;
  if (!self->_currentUser
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMUser uniqueIdentifier](*p_currentUser, "uniqueIdentifier")),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        v9 = v11,
        (v8 & 1) == 0))
  {
    if (dword_100130C48 <= 30
      && (dword_100130C48 != -1 || _LogCategory_Initialize(&dword_100130C48, 30)))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
      LogPrintF(&dword_100130C48, "-[RPHomeKitManager setCurrentUser:]", 30, "Set current HomeKit user to %@", v10);

    }
    if (*p_currentUser)
      -[HMUser setDelegate:](*p_currentUser, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_currentUser, a3);
    -[HMUser setDelegate:](self->_currentUser, "setDelegate:", self);
    v9 = v11;
  }

}

- (void)setCurrentHome:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = v7;
  if (!self->_currentHome)
  {
    if (dword_100130C48 <= 30
      && (dword_100130C48 != -1 || _LogCategory_Initialize(&dword_100130C48, 30)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      LogPrintF(&dword_100130C48, "-[RPHomeKitManager setCurrentHome:]", 30, "Set current HomeKit Home to '%@'\n", v6);

    }
    objc_storeStrong((id *)&self->_currentHome, a3);
    -[HMHome setDelegate:](self->_currentHome, "setDelegate:", self);
    v5 = v7;
  }

}

- (void)_setupHome
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!self->_currentUser || !self->_currentHome)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));

          if (v9)
          {
            -[RPHomeKitManager setCurrentHome:](self, "setCurrentHome:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
            -[RPHomeKitManager setCurrentUser:](self, "setCurrentUser:", v10);

            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  HMHomeManager *homeManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  homeManager = self->_homeManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100055308;
  v9[3] = &unk_100112C98;
  v10 = v6;
  v8 = v6;
  -[HMHomeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:](homeManager, "currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:", a3, v9);

}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055500;
  block[3] = &unk_1001116C8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "siriEndpointProfile"));

  if (v9)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005568C;
    block[3] = &unk_1001116C8;
    block[4] = self;
    v12 = v7;
    v13 = v8;
    dispatch_async(dispatchQueue, block);

  }
}

- (HMUser)currentUser
{
  return self->_currentUser;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)mediaGroupsChangedHandler
{
  return self->_mediaGroupsChangedHandler;
}

- (void)setMediaGroupsChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)personalRequestsStateChangedHandler
{
  return self->_personalRequestsStateChangedHandler;
}

- (void)setPersonalRequestsStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)roomUpdatedHandler
{
  return self->_roomUpdatedHandler;
}

- (void)setRoomUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (NSArray)homeKitCurrentUserIDs
{
  return self->_homeKitCurrentUserIDs;
}

- (void)setHomeKitCurrentUserIDs:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitCurrentUserIDs, a3);
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitCurrentUserIDs, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong(&self->_roomUpdatedHandler, 0);
  objc_storeStrong(&self->_personalRequestsStateChangedHandler, 0);
  objc_storeStrong(&self->_mediaGroupsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
}

@end
