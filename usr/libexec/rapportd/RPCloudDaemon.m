@implementation RPCloudDaemon

+ (id)sharedCloudDaemon
{
  if (qword_100131F20 != -1)
    dispatch_once(&qword_100131F20, &stru_1001110D0);
  return (id)qword_100131F18;
}

- (BOOL)idsHasWatch
{
  RPCloudDaemon *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  id v8;
  unsigned __int8 v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!-[RPCloudDaemon idsIsSignedIn](self, "idsIsSignedIn"))
    return 0;
  v3 = self;
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v3, "idsDeviceArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1)
                                                                                  + 8 * (_QWORD)i), "modelIdentifier")));
        v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("Watch"));

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  objc_sync_exit(v3);
  return v10;
}

- (BOOL)idsIsSignedIn
{
  RPCloudDaemon *v2;
  int prefIsSignedInForce;
  BOOL v4;
  IDSService *nearbyIDSService;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = self;
  objc_sync_enter(v2);
  prefIsSignedInForce = v2->_prefIsSignedInForce;
  if (prefIsSignedInForce < 0)
  {
    if (v2->_idsIsSignedInCache < 0)
    {
      nearbyIDSService = v2->_nearbyIDSService;
      if (nearbyIDSService)
      {
        v2->_idsIsSignedInCache = 0;
        v11 = 0u;
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](nearbyIDSService, "accounts", 0));
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v12;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v12 != v8)
                objc_enumerationMutation(v6);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "isActive") & 1) != 0)
              {
                v2->_idsIsSignedInCache = 1;
                goto LABEL_15;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_15:

      }
    }
    v4 = v2->_idsIsSignedInCache > 0;
  }
  else
  {
    v4 = prefIsSignedInForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (NSString)idsDeviceIDSelf
{
  RPCloudDaemon *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_idsDeviceIDSelf;
  if (!v3)
  {
    v3 = (NSString *)IDSCopyLocalDeviceUniqueID();
    if (v3)
    {
      objc_storeStrong((id *)&v2->_idsDeviceIDSelf, v3);
    }
    else
    {
      if (dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon idsDeviceIDSelf]", 90, "### No IDS device ID\n");
      }
      v3 = 0;
    }
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)idsCorrelationIdentifier
{
  NSString *idsCorrelationIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v10[6];

  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  if (!idsCorrelationIdentifier)
  {
    if (self->_idQueryInProgress)
      return 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor primaryAppleID](self->_systemMonitor, "primaryAppleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_bestGuessURI"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance"));
      dispatchQueue = self->_dispatchQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100012E80;
      v10[3] = &unk_100111120;
      v10[4] = self;
      v10[5] = v5;
      objc_msgSend(v8, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v7, CFSTR("com.apple.private.alloy.nearby"), CFSTR("com.apple.private.alloy.nearby"), dispatchQueue, v10);
      self->_idQueryInProgress = 1;

    }
    idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  }
  return idsCorrelationIdentifier;
}

- (NSDictionary)idsFamilyEndpointMap
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return self->_idsFamilyEndpointMap;
}

- (RPCloudDaemon)init
{
  RPCloudDaemon *v2;
  RPCloudDaemon *v3;
  RPCloudDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPCloudDaemon;
  v2 = -[RPCloudDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_prefIsSignedInForce = -1;
    *(_QWORD *)&v3->_idsHandheldCountCache = -1;
    *(_QWORD *)&v3->_idsHasHomePodCache = -1;
    *(_QWORD *)&v3->_idsHasMacCache = -1;
    v3->_idsIsSignedInCache = -1;
    *(_QWORD *)&v3->_prefHasAppleTVForce = -1;
    *(_QWORD *)&v3->_prefHasiPadForce = -1;
    v3->_prefHasRealityDeviceForce = -1;
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id obj;
  const char *obja;
  uint64_t v31;
  const char *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_idsFamilyEndpointMap, "allKeys"));
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v34)
  {
    v31 = *(_QWORD *)v39;
    v3 = &stru_100115158;
    do
    {
      v4 = 0;
      v5 = v3;
      do
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_idsFamilyEndpointMap, "objectForKeyedSubscript:", v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyEndpointData"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_idsFamilyEndpointMap, "objectForKeyedSubscript:", v6));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "familyEndpointData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "productVersion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    IDSID: %@, name: %@, productVersion: %@\n"), v6, v9, v12));

        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v13));
        v4 = (char *)v4 + 1;
        v5 = v3;
      }
      while (v34 != v4);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v34);
  }
  else
  {
    v3 = &stru_100115158;
  }

  v37 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](self, "idsDeviceArray"));
  v35 = objc_msgSend(v14, "count");
  if (-[RPCloudDaemon idsIsSignedIn](self, "idsIsSignedIn"))
    v15 = "yes";
  else
    v15 = "no";
  v32 = v15;
  if (-[RPCloudDaemon idsHasAppleTV](self, "idsHasAppleTV"))
    v16 = "yes";
  else
    v16 = "no";
  obja = v16;
  if (-[RPCloudDaemon idsHasHomePod](self, "idsHasHomePod"))
    v17 = "yes";
  else
    v17 = "no";
  if (-[RPCloudDaemon idsHasiPad](self, "idsHasiPad"))
    v18 = "yes";
  else
    v18 = "no";
  if (-[RPCloudDaemon idsHasMac](self, "idsHasMac"))
    v19 = "yes";
  else
    v19 = "no";
  if (-[RPCloudDaemon idsHasWatch](self, "idsHasWatch"))
    v20 = "yes";
  else
    v20 = "no";
  if (-[RPCloudDaemon idsHasRealityDevice](self, "idsHasRealityDevice"))
    v21 = "yes";
  else
    v21 = "no";
  v22 = -[RPCloudDaemon idsHandheldCount](self, "idsHandheldCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsFamilyEndpointMap](self, "idsFamilyEndpointMap"));
  NSAppendPrintF(&v37, "-- RPCloudDaemon --\nIDS devices %d, Signed In %s, AppleTV %s, HomePod %s, iPad %s, Mac %s, Watch %s, RealityDevice %s, Handheld %d, Sessions %d \n%d FamilyEndpointMap:\n%@", v35, v32, obja, v17, v18, v19, v20, v21, v22, 0, objc_msgSend(v23, "count"), v3);
  v24 = v37;

  if (a3 <= 20)
  {
    v36 = v24;
    NSAppendPrintF(&v36, "\n");
    v25 = v36;

    v24 = v25;
  }
  v26 = v24;

  return v26;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001212C;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000122EC;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  CUSystemMonitor *systemMonitor;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100130118 <= 30
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon _invalidate]", 30, "Invalidate\n");
    }
    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    -[RPCloudDaemon _idsEnsureStopped](self, "_idsEnsureStopped");
    -[RPCloudDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100130118 <= 30
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  if ((a3 & 0x400) != 0)
  {
    if (dword_100130118 <= 30
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon daemonInfoChanged:]", 30, "Daemon info changed: %#ll{flags}\n", a3, &unk_1001095A5);
    }
    -[RPCloudDaemon idsFamilyEndpointsUpdateWithForce:](self, "idsFamilyEndpointsUpdateWithForce:", 1);
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return 0;
}

- (void)prefsChanged
{
  _BOOL4 v3;
  int v4;
  int prefHasAppleTVForce;
  _BOOL4 v6;
  int v7;
  int prefHasHomePodForce;
  _BOOL4 v9;
  int v10;
  int prefHasiPadForce;
  _BOOL4 v12;
  int v13;
  int prefHasMacForce;
  _BOOL4 v15;
  int v16;
  int prefHasRealityDeviceForce;
  uint64_t Int64;
  BOOL v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  _BOOL4 v23;
  int v24;
  int prefIsSignedInForce;
  int v26;

  v26 = 0;
  v3 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("hasAppleTVForce"), &v26) != 0;
  if (v26)
    v4 = -1;
  else
    v4 = v3;
  prefHasAppleTVForce = self->_prefHasAppleTVForce;
  if (v4 == prefHasAppleTVForce)
    goto LABEL_10;
  if (dword_100130118 <= 40)
  {
    if (dword_100130118 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100130118, 40))
        goto LABEL_9;
      prefHasAppleTVForce = self->_prefHasAppleTVForce;
    }
    LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "HasAppleTVForce: %d -> %d\n", prefHasAppleTVForce, v4);
  }
LABEL_9:
  self->_prefHasAppleTVForce = v4;
LABEL_10:
  v6 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("hasHomePodForce"), &v26) != 0;
  if (v26)
    v7 = -1;
  else
    v7 = v6;
  prefHasHomePodForce = self->_prefHasHomePodForce;
  if (v7 != prefHasHomePodForce)
  {
    if (dword_100130118 <= 40)
    {
      if (dword_100130118 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130118, 40))
          goto LABEL_18;
        prefHasHomePodForce = self->_prefHasHomePodForce;
      }
      LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "HasHomePodForce: %d -> %d\n", prefHasHomePodForce, v7);
    }
LABEL_18:
    self->_prefHasHomePodForce = v7;
  }
  v9 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("hasiPadForce"), &v26) != 0;
  if (v26)
    v10 = -1;
  else
    v10 = v9;
  prefHasiPadForce = self->_prefHasiPadForce;
  if (v10 != prefHasiPadForce)
  {
    if (dword_100130118 <= 40)
    {
      if (dword_100130118 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130118, 40))
          goto LABEL_27;
        prefHasiPadForce = self->_prefHasiPadForce;
      }
      LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "HasiPadForce: %d -> %d\n", prefHasiPadForce, v10);
    }
LABEL_27:
    self->_prefHasiPadForce = v10;
  }
  v12 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("hasMacForce"), &v26) != 0;
  if (v26)
    v13 = -1;
  else
    v13 = v12;
  prefHasMacForce = self->_prefHasMacForce;
  if (v13 != prefHasMacForce)
  {
    if (dword_100130118 <= 40)
    {
      if (dword_100130118 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130118, 40))
          goto LABEL_36;
        prefHasMacForce = self->_prefHasMacForce;
      }
      LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "HasMacForce: %d -> %d\n", prefHasMacForce, v13);
    }
LABEL_36:
    self->_prefHasMacForce = v13;
  }
  v15 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("hasRealityDeviceForce"), &v26) != 0;
  if (v26)
    v16 = -1;
  else
    v16 = v15;
  prefHasRealityDeviceForce = self->_prefHasRealityDeviceForce;
  if (v16 != prefHasRealityDeviceForce)
  {
    if (dword_100130118 <= 40)
    {
      if (dword_100130118 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130118, 40))
          goto LABEL_45;
        prefHasRealityDeviceForce = self->_prefHasRealityDeviceForce;
      }
      LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "HasRealityDeviceForce: %d -> %d\n", prefHasRealityDeviceForce, v16);
    }
LABEL_45:
    self->_prefHasRealityDeviceForce = v16;
  }
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("idsEnabled"), &v26);
  if (v26)
    v19 = 0;
  else
    v19 = Int64 == 0;
  v20 = !v19;
  if (self->_prefIDSEnabled != v20)
  {
    if (dword_100130118 <= 40
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 40)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "IDS enabled: %s -> %s\n", v22, v21);
    }
    self->_prefIDSEnabled = v20;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("isSignedInForce"), &v26) != 0;
  if (v26)
    v24 = -1;
  else
    v24 = v23;
  prefIsSignedInForce = self->_prefIsSignedInForce;
  if (v24 != prefIsSignedInForce)
  {
    if (dword_100130118 <= 40)
    {
      if (dword_100130118 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130118, 40))
          goto LABEL_71;
        prefIsSignedInForce = self->_prefIsSignedInForce;
      }
      LogPrintF(&dword_100130118, "-[RPCloudDaemon prefsChanged]", 40, "IsSignedInForce: %d -> %d\n", prefIsSignedInForce, v24);
    }
LABEL_71:
    self->_prefIsSignedInForce = v24;
  }
  -[RPCloudDaemon _update](self, "_update");
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)_update
{
  if (self->_prefIDSEnabled)
    -[RPCloudDaemon _idsEnsureStarted](self, "_idsEnsureStarted");
  else
    -[RPCloudDaemon _idsEnsureStopped](self, "_idsEnsureStopped");
}

- (void)_primaryAppleIDChanged
{
  NSString *idsCorrelationIdentifier;

  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  self->_idsCorrelationIdentifier = 0;

}

- (void)_idsEnsureStarted
{
  IDSService *v3;
  IDSService *nearbyIDSService;

  if (!self->_nearbyIDSService)
  {
    if (dword_100130118 <= 40
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 40)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon _idsEnsureStarted]", 40, "IDS start: Nearby\n");
    }
    v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.nearby"));
    nearbyIDSService = self->_nearbyIDSService;
    self->_nearbyIDSService = v3;

    -[IDSService addDelegate:queue:](self->_nearbyIDSService, "addDelegate:queue:", self, self->_dispatchQueue);
  }
}

- (void)_idsEnsureStopped
{
  IDSService *nearbyIDSService;
  NSString *idsCorrelationIdentifier;

  if (self->_nearbyIDSService)
  {
    if (dword_100130118 <= 40
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 40)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon _idsEnsureStopped]", 40, "IDS stop: Nearby\n");
    }
    -[IDSService removeDelegate:](self->_nearbyIDSService, "removeDelegate:", self);
    nearbyIDSService = self->_nearbyIDSService;
    self->_nearbyIDSService = 0;

  }
  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  self->_idsCorrelationIdentifier = 0;

}

- (id)_idsAccountWithURI:(id)a3 senderID:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  RPCloudDaemon *v44;
  RPCloudDaemon *v45;
  id *v46;
  id *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];

  v6 = a3;
  v7 = (void *)IDSCopyRawAddressForDestination();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_nearbyIDSService, "accounts"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v62;
    v46 = a4;
    v48 = v6;
    v42 = *(_QWORD *)v62;
    v44 = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "canSend"))
        {
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aliasStrings"));
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v58;
            while (2)
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v58 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v19, "isEqual:", v7))
                {
                  if (v46)
                  {
                    v35 = objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsURIWithID:](v44, "_idsURIWithID:", v19));
                    v36 = *v46;
                    *v46 = (id)v35;

                  }
                  v34 = v13;
                  goto LABEL_40;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
              if (v16)
                continue;
              break;
            }
          }

          v11 = v42;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      a4 = v46;
      v6 = v48;
      self = v44;
    }
    while (v10);
  }

  if (objc_msgSend(v6, "_FZIDType") == (id)-1)
  {
    v34 = 0;
  }
  else
  {
    v20 = IMCanonicalizeFormattedString(v7, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_nearbyIDSService, "accounts"));
    v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v21)
    {
      v22 = v21;
      v45 = self;
      v47 = a4;
      v48 = v6;
      v23 = *(_QWORD *)v54;
      v40 = *(_QWORD *)v54;
      do
      {
        v24 = 0;
        v41 = v22;
        do
        {
          if (*(_QWORD *)v54 != v23)
            objc_enumerationMutation(v14);
          v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v24);
          if (objc_msgSend(v25, "canSend", v40))
          {
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v43 = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aliasStrings"));
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v50;
              while (2)
              {
                for (k = 0; k != v28; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v50 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)k);
                  v32 = IMCanonicalizeFormattedString(v31, 3);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
                  if (objc_msgSend(v33, "isEqual:", v8))
                  {
                    if (v47)
                    {
                      v38 = objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsURIWithID:](v45, "_idsURIWithID:", v31));
                      v39 = *v47;
                      *v47 = (id)v38;

                    }
                    v34 = v43;

                    goto LABEL_40;
                  }

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                if (v28)
                  continue;
                break;
              }
            }

            v23 = v40;
            v22 = v41;
          }
          v24 = (char *)v24 + 1;
        }
        while (v24 != v22);
        v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v22);
      v34 = 0;
LABEL_40:
      v6 = v48;
    }
    else
    {
      v34 = 0;
    }

  }
  return v34;
}

- (NSArray)idsDeviceArray
{
  RPCloudDaemon *v2;
  NSArray *idsDeviceArray;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;

  v2 = self;
  objc_sync_enter(v2);
  idsDeviceArray = v2->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_100130118 <= 30
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon idsDeviceArray]", 30, "Get IDSDevices\n");
    }
    v4 = objc_claimAutoreleasedReturnValue(-[IDSService devices](v2->_nearbyIDSService, "devices"));
    v5 = v2->_idsDeviceArray;
    v2->_idsDeviceArray = (NSArray *)v4;

    idsDeviceArray = v2->_idsDeviceArray;
  }
  v6 = idsDeviceArray;
  objc_sync_exit(v2);

  return v6;
}

- (id)idsDeviceForBluetoothUUID:(id)a3
{
  id v4;
  RPCloudDaemon *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v5, "idsDeviceArray", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nsuuid"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (NSDictionary)idsDeviceMap
{
  RPCloudDaemon *v2;
  NSDictionary *idsDeviceMap;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = self;
  objc_sync_enter(v2);
  idsDeviceMap = v2->_idsDeviceMap;
  if (!idsDeviceMap)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray"));
    if (!v4)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride", (_QWORD)v16));
          if (v11)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v12 = (NSDictionary *)objc_msgSend(v5, "copy");
    v13 = v2->_idsDeviceMap;
    v2->_idsDeviceMap = v12;

    idsDeviceMap = v2->_idsDeviceMap;
  }
  v14 = idsDeviceMap;
LABEL_14:
  objc_sync_exit(v2);

  return v14;
}

- (void)idsFamilyEndpointQueryWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getFamilyURIs"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDInfoOptions refreshIDInfo](IDSIDInfoOptions, "refreshIDInfo"));
  if (dword_100130118 <= 30 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon idsFamilyEndpointQueryWithCompletion:]", 30, "Starting family IDS query.\n");
  objc_msgSend(v6, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:", v5, CFSTR("com.apple.private.alloy.nearby.family"), 1, v7, CFSTR("com.apple.private.alloy.nearby"), self->_dispatchQueue, v8);

}

- (void)setIdsFamilyEndpointMap:(id)a3
{
  NSDictionary *v4;
  NSDictionary *idsFamilyEndpointMap;

  v4 = (NSDictionary *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsFamilyEndpointMap = self->_idsFamilyEndpointMap;
  self->_idsFamilyEndpointMap = v4;

}

- (void)idsFamilyEndpointsUpdateWithForce:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = v5;
  if (self->_lastFamilyQueryDate)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }
  if (-[RPCloudDaemon getDeviceClass](self, "getDeviceClass") == 4
    && !self->_idQueryInProgress
    && (v3 || v8 == 0.0 || v8 > 300.0))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001376C;
    v9[3] = &unk_100111148;
    v9[4] = self;
    -[RPCloudDaemon idsFamilyEndpointQueryWithCompletion:](self, "idsFamilyEndpointQueryWithCompletion:", v9);
    self->_idQueryInProgress = 1;
  }

}

- (int)idsHandheldCount
{
  RPCloudDaemon *v2;
  int idsHandheldCountCache;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = self;
  objc_sync_enter(v2);
  idsHandheldCountCache = v2->_idsHandheldCountCache;
  if (idsHandheldCountCache < 0 && v2->_nearbyIDSService)
  {
    v2->_idsHandheldCountCache = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "modelIdentifier"));
          v9 = GestaltProductTypeStringToDeviceClass() - 4 < 0xFFFFFFFD;

          if (!v9)
            ++v2->_idsHandheldCountCache;
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    idsHandheldCountCache = v2->_idsHandheldCountCache;
  }
  objc_sync_exit(v2);

  return idsHandheldCountCache;
}

- (BOOL)idsHasAppleTV
{
  RPCloudDaemon *v2;
  int prefHasAppleTVForce;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = self;
  objc_sync_enter(v2);
  prefHasAppleTVForce = v2->_prefHasAppleTVForce;
  if (prefHasAppleTVForce < 0)
  {
    if (v2->_idsHasAppleTVCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasAppleTVCache = 0;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v5);
            v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1)
                                                                                      + 8 * (_QWORD)i), "modelIdentifier")));
            v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("AppleTV"));

            if ((v10 & 1) != 0)
            {
              v2->_idsHasAppleTVCache = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    v4 = v2->_idsHasAppleTVCache > 0;
  }
  else
  {
    v4 = prefHasAppleTVForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasHomePod
{
  RPCloudDaemon *v2;
  int prefHasHomePodForce;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = self;
  objc_sync_enter(v2);
  prefHasHomePodForce = v2->_prefHasHomePodForce;
  if (prefHasHomePodForce < 0)
  {
    if (v2->_idsHasHomePodCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasHomePodCache = 0;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v5);
            v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1)
                                                                                      + 8 * (_QWORD)i), "modelIdentifier")));
            if ((objc_msgSend(v9, "hasPrefix:", CFSTR("AudioAccessory1,")) & 1) != 0
              || (objc_msgSend(v9, "hasPrefix:", CFSTR("AudioAccessory5,")) & 1) != 0
              || (objc_msgSend(v9, "hasPrefix:", CFSTR("AudioAccessory6,")) & 1) != 0
              || (objc_msgSend(v9, "hasPrefix:", CFSTR("HomePod")) & 1) != 0)
            {

              v2->_idsHasHomePodCache = 1;
              goto LABEL_18;
            }

          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_18:

    }
    v4 = v2->_idsHasHomePodCache > 0;
  }
  else
  {
    v4 = prefHasHomePodForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasiPad
{
  RPCloudDaemon *v2;
  int prefHasiPadForce;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = self;
  objc_sync_enter(v2);
  prefHasiPadForce = v2->_prefHasiPadForce;
  if (prefHasiPadForce < 0)
  {
    if (v2->_idsHasiPadCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasiPadCache = 0;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v5);
            v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1)
                                                                                      + 8 * (_QWORD)i), "modelIdentifier")));
            v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("iPad"));

            if ((v10 & 1) != 0)
            {
              v2->_idsHasiPadCache = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    v4 = v2->_idsHasiPadCache > 0;
  }
  else
  {
    v4 = prefHasiPadForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasMac
{
  RPCloudDaemon *v2;
  int prefHasMacForce;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = self;
  objc_sync_enter(v2);
  prefHasMacForce = v2->_prefHasMacForce;
  if (prefHasMacForce < 0)
  {
    if (v2->_idsHasMacCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasMacCache = 0;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v5);
            v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1)
                                                                                      + 8 * (_QWORD)i), "modelIdentifier")));
            v10 = objc_msgSend(v9, "containsString:", CFSTR("Mac"));

            if ((v10 & 1) != 0)
            {
              v2->_idsHasMacCache = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    v4 = v2->_idsHasMacCache > 0;
  }
  else
  {
    v4 = prefHasMacForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)idsHasRealityDevice
{
  RPCloudDaemon *v2;
  int prefHasRealityDeviceForce;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = self;
  objc_sync_enter(v2);
  prefHasRealityDeviceForce = v2->_prefHasRealityDeviceForce;
  if (prefHasRealityDeviceForce < 0)
  {
    if (v2->_idsHasRealityDeviceCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasRealityDeviceCache = 0;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v5);
            v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1)
                                                                                      + 8 * (_QWORD)i), "modelIdentifier")));
            v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("RealityDevice"));

            if ((v10 & 1) != 0)
            {
              v2->_idsHasRealityDeviceCache = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    v4 = v2->_idsHasRealityDeviceCache > 0;
  }
  else
  {
    v4 = prefHasRealityDeviceForce != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)_idsURIWithID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "_FZIDType") == (id)-1)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_bestGuessURI"));
      v7 = (void *)v6;
      if (v6)
        v8 = (void *)v6;
      else
        v8 = v4;
      v5 = v8;

    }
    else
    {
      v5 = v4;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  NSObject *dispatchQueue;
  IDSService *v14;
  char *v15;
  IDSService *nearbyIDSService;
  __CFString *v17;
  id v18;
  unsigned __int8 *v19;
  char *v20;
  unsigned __int8 *v21;
  unint64_t v22;
  RPCloudMessageContext *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  char v28;
  unsigned __int8 *v29;
  const char *v30;
  id v31;

  v31 = a5;
  v11 = a6;
  v12 = a7;
  dispatchQueue = self->_dispatchQueue;
  v14 = (IDSService *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v15 = (char *)objc_msgSend(v31, "length");
  nearbyIDSService = self->_nearbyIDSService;

  if (nearbyIDSService != v14)
  {
    if (dword_100130118 <= 90
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:incomingData:fromID:context:]", 90, "### IDS unsupported cloud service: From '%@', %zu bytes, <%.32@>\n", v11, v15, v31);
    }
    v17 = 0;
    goto LABEL_16;
  }
  v17 = CFSTR("com.apple.private.alloy.nearby");
  v18 = objc_retainAutorelease(v31);
  v19 = (unsigned __int8 *)objc_msgSend(v18, "bytes");
  v20 = v15 - 4;
  if ((unint64_t)v15 < 4)
  {
    if (dword_100130118 <= 90
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:incomingData:fromID:context:]", 90, "### IDS header truncated from '%@', %zu bytes, <%.32@>\n", v11, v15, v18);
    }
    goto LABEL_16;
  }
  v21 = v19;
  v22 = ((unint64_t)v19[1] << 16) | ((unint64_t)v19[2] << 8) | v19[3];
  if ((unint64_t)v20 >= v22)
  {
    v23 = objc_alloc_init(RPCloudMessageContext);
    -[RPCloudMessageContext setCloudServiceID:](v23, "setCloudServiceID:", v17);
    -[RPCloudMessageContext setFromID:](v23, "setFromID:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toID"));
    -[RPCloudMessageContext setToID:](v23, "setToID:", v24);

    v25 = *v21;
    if (dword_100130118 > 30 || dword_100130118 == -1 && !_LogCategory_Initialize(&dword_100130118, 30))
    {
LABEL_56:
      v28 = v25 - 32;
      if ((v25 - 32) <= 0x21)
      {
        v29 = v21 + 4;
        if (((1 << v28) & 7) != 0)
        {
          -[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:](self, "_receivedFamilyIdentityFrameType:ptr:length:msgCtx:", v25, v29, v22, v23);
          goto LABEL_68;
        }
        if (((1 << v28) & 0x30000) != 0)
        {
          -[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:](self, "_receivedWatchIdentityFrameType:ptr:length:fromID:", v25, v29, v22, v11);
          goto LABEL_68;
        }
        if (((1 << v28) & 0x300000000) != 0)
        {
          -[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:](self, "_receivedFriendIdentityFrameType:ptr:length:msgCtx:", v25, v29, v22, v23);
LABEL_68:

          goto LABEL_16;
        }
      }
      if ((_DWORD)v25 != 1
        && dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        v30 = sub_100014B50(v25);
        LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:incomingData:fromID:context:]", 90, "### IDS ignoring unhandled frame 0x%02X (%s), from '%@', %zu bytes, <%.32@>\n", v25, v30, v11, v22, v18);
      }
      goto LABEL_68;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudMessageContext toID](v23, "toID"));
    if ((int)v25 <= 47)
    {
      v27 = "Invalid";
      switch((int)v25)
      {
        case 0:
          goto LABEL_55;
        case 1:
          v27 = "NoOp";
          break;
        case 3:
          v27 = "PS_Start";
          break;
        case 4:
          v27 = "PS_Next";
          break;
        case 5:
          v27 = "PV_Start";
          break;
        case 6:
          v27 = "PV_Next";
          break;
        case 7:
          v27 = "U_OPACK";
          break;
        case 8:
          v27 = "E_OPACK";
          break;
        case 9:
          v27 = "P_OPACK";
          break;
        case 10:
          v27 = "PA_Req";
          break;
        case 11:
          v27 = "PA_Rsp";
          break;
        case 16:
          v27 = "SessionStartRequest";
          break;
        case 17:
          v27 = "SessionStartResponse";
          break;
        case 18:
          v27 = "SessionData";
          break;
        case 32:
          v27 = "FamilyIdentityRequest";
          break;
        case 33:
          v27 = "FamilyIdentityResponse";
          break;
        case 34:
          v27 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_54;
      }
      goto LABEL_55;
    }
    if ((int)v25 <= 63)
    {
      if ((_DWORD)v25 == 48)
      {
        v27 = "WatchIdentityRequest";
        goto LABEL_55;
      }
      if ((_DWORD)v25 == 49)
      {
        v27 = "WatchIdentityResponse";
        goto LABEL_55;
      }
    }
    else
    {
      switch((_DWORD)v25)
      {
        case '@':
          v27 = "FriendIdentityRequest";
          goto LABEL_55;
        case 'A':
          v27 = "FriendIdentityResponse";
          goto LABEL_55;
        case 'B':
          v27 = "FriendIdentityUpdate";
LABEL_55:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:incomingData:fromID:context:]", 30, "IDS received frame from '%@', ClSI '%@', ToID %@, 0x%02X (%s), %zu bytes, <%.32@>\n", v11, v17, v26, v25, v27, v22, v18);

          goto LABEL_56;
      }
    }
LABEL_54:
    v27 = "?";
    goto LABEL_55;
  }
  if (dword_100130118 <= 90 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:incomingData:fromID:context:]", 90, "### IDS payload truncated from '%@', %zu bytes, <%.32@>\n", v11, v22, v18);
LABEL_16:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  if (v15 || !a6)
  {
    if (dword_100130118 <= 90
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:identifier:didSendWithSuccess:error:context:]", 90, "### IDS send failed ID %@, error %{error}\n", v14, v15);
    }
  }
  else if (dword_100130118 <= 30
         && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
  {
    LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:identifier:didSendWithSuccess:error:context:]", 30, "IDS sent ID %@\n", v14);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (dword_100130118 <= 30 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon service:account:identifier:hasBeenDeliveredWithContext:]", 30, "IDS delivered ID %@\n", v10, v12);

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  RPCloudDaemon *v7;
  NSArray *idsDeviceArray;
  NSDictionary *idsDeviceMap;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (dword_100130118 <= 30 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon service:activeAccountsChanged:]", 30, "IDS ActiveAccountsChanged, %d account(s)\n", objc_msgSend(v6, "count"));
  v7 = self;
  objc_sync_enter(v7);
  idsDeviceArray = v7->_idsDeviceArray;
  v7->_idsDeviceArray = 0;

  idsDeviceMap = v7->_idsDeviceMap;
  v7->_idsDeviceMap = 0;

  v7->_idsIsSignedInCache = -1;
  *(_QWORD *)&v7->_idsHasHomePodCache = -1;
  *(_QWORD *)&v7->_idsHasMacCache = -1;
  *(_QWORD *)&v7->_idsHandheldCountCache = -1;
  objc_sync_exit(v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v10, "postDaemonInfoChanges:", 1);

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  RPCloudDaemon *v18;
  NSArray *idsDeviceArray;
  NSArray *v20;
  NSDictionary *idsDeviceMap;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  if (dword_100130118 <= 30 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon service:devicesChanged:]", 30, "IDS DevicesChanged: %d device(s)\n", objc_msgSend(v7, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(IDSDevice, v10, v11);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
        {
          v22 = v8;
          if (dword_100130118 <= 90)
          {
            if (dword_100130118 != -1 || (v22 = v8, _LogCategory_Initialize(&dword_100130118, 90)))
            {
              LogPrintF(&dword_100130118, "-[RPCloudDaemon service:devicesChanged:]", 90, "### Bad IDS device: %@\n", v15);
              v22 = v8;
            }
          }
          goto LABEL_18;
        }
      }
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
        continue;
      break;
    }
  }

  v17 = (NSArray *)objc_msgSend(v8, "copy");
  v18 = self;
  objc_sync_enter(v18);
  idsDeviceArray = v18->_idsDeviceArray;
  v18->_idsDeviceArray = v17;
  v20 = v17;

  idsDeviceMap = v18->_idsDeviceMap;
  v18->_idsDeviceMap = 0;

  v18->_idsIsSignedInCache = -1;
  *(_QWORD *)&v18->_idsHasHomePodCache = -1;
  *(_QWORD *)&v18->_idsHasMacCache = -1;
  *(_QWORD *)&v18->_idsHandheldCountCache = -1;
  objc_sync_exit(v18);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v22, "postDaemonInfoChanges:", 1);
LABEL_18:

}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_100130118 <= 30
    && ((v6 = v3, dword_100130118 != -1) || (v5 = _LogCategory_Initialize(&dword_100130118, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_100130118, "-[RPCloudDaemon serviceSpaceDidBecomeAvailable:]", 30, "IDS space became available\n");

  }
  else
  {

  }
}

- (void)_receivedFamilyIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6
{
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v8 = a3;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fromID"));
  v22 = 0;
  v13 = (void *)OPACKDecodeBytes(a4, a5, 8, &v22);
  if (!v13)
  {
    if (dword_100130118 > 90 || dword_100130118 == -1 && !_LogCategory_Initialize(&dword_100130118, 90))
      goto LABEL_94;
    if (v8 <= 47)
    {
      v18 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_73;
        case 1:
          v18 = "NoOp";
          break;
        case 3:
          v18 = "PS_Start";
          break;
        case 4:
          v18 = "PS_Next";
          break;
        case 5:
          v18 = "PV_Start";
          break;
        case 6:
          v18 = "PV_Next";
          break;
        case 7:
          v18 = "U_OPACK";
          break;
        case 8:
          v18 = "E_OPACK";
          break;
        case 9:
          v18 = "P_OPACK";
          break;
        case 10:
          v18 = "PA_Req";
          break;
        case 11:
          v18 = "PA_Rsp";
          break;
        case 16:
          v18 = "SessionStartRequest";
          break;
        case 17:
          v18 = "SessionStartResponse";
          break;
        case 18:
          v18 = "SessionData";
          break;
        case 32:
          v18 = "FamilyIdentityRequest";
          break;
        case 33:
          v18 = "FamilyIdentityResponse";
          break;
        case 34:
          v18 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_72;
      }
      goto LABEL_73;
    }
    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        v18 = "WatchIdentityRequest";
        goto LABEL_73;
      }
      if (v8 == 49)
      {
        v18 = "WatchIdentityResponse";
        goto LABEL_73;
      }
    }
    else
    {
      switch(v8)
      {
        case '@':
          v18 = "FriendIdentityRequest";
          goto LABEL_73;
        case 'A':
          v18 = "FriendIdentityResponse";
          goto LABEL_73;
        case 'B':
          v18 = "FriendIdentityUpdate";
LABEL_73:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:]", 90, "### Family identity message decode failed: type %s, fromID '%@', %#m\n", v18, v10, v22);
          goto LABEL_94;
      }
    }
LABEL_72:
    v18 = "?";
    goto LABEL_73;
  }
  v14 = objc_opt_class(NSDictionary, v11, v12);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    v15 = (void *)IDSCopyRawAddressForDestination(v10);
    v16 = v15;
    if (!v15)
    {
      if (dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:]", 90, "### Family identity convert to AppleID failed (%@)\n", v10);
      }
      goto LABEL_53;
    }
    if (objc_msgSend(v15, "_appearsToBePhoneNumber"))
      v17 = CUNormalizePhoneNumber(v16);
    else
      v17 = CUNormalizeEmailAddress(v16, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v9, "setAppleID:", v20);

    switch(v8)
    {
      case '"':
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
        objc_msgSend(v21, "receivedFamilyIdentityUpdate:msgCtx:", v13, v9);
        break;
      case '!':
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
        objc_msgSend(v21, "receivedFamilyIdentityResponse:msgCtx:", v13, v9);
        break;
      case ' ':
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
        objc_msgSend(v21, "receivedFamilyIdentityRequest:msgCtx:", v13, v9);
        break;
      default:
        if (dword_100130118 <= 90
          && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
        {
          sub_100014B50(v8);
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:]", 90, "### Unhandled family identity frame 0x%02X (%s)\n");
        }
        goto LABEL_53;
    }

LABEL_53:
    goto LABEL_94;
  }
  if (dword_100130118 <= 90 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
  {
    if (v8 <= 47)
    {
      v19 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_93;
        case 1:
          v19 = "NoOp";
          break;
        case 3:
          v19 = "PS_Start";
          break;
        case 4:
          v19 = "PS_Next";
          break;
        case 5:
          v19 = "PV_Start";
          break;
        case 6:
          v19 = "PV_Next";
          break;
        case 7:
          v19 = "U_OPACK";
          break;
        case 8:
          v19 = "E_OPACK";
          break;
        case 9:
          v19 = "P_OPACK";
          break;
        case 10:
          v19 = "PA_Req";
          break;
        case 11:
          v19 = "PA_Rsp";
          break;
        case 16:
          v19 = "SessionStartRequest";
          break;
        case 17:
          v19 = "SessionStartResponse";
          break;
        case 18:
          v19 = "SessionData";
          break;
        case 32:
          v19 = "FamilyIdentityRequest";
          break;
        case 33:
          v19 = "FamilyIdentityResponse";
          break;
        case 34:
          v19 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_92;
      }
      goto LABEL_93;
    }
    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        v19 = "WatchIdentityRequest";
        goto LABEL_93;
      }
      if (v8 == 49)
      {
        v19 = "WatchIdentityResponse";
        goto LABEL_93;
      }
    }
    else
    {
      switch(v8)
      {
        case '@':
          v19 = "FriendIdentityRequest";
          goto LABEL_93;
        case 'A':
          v19 = "FriendIdentityResponse";
          goto LABEL_93;
        case 'B':
          v19 = "FriendIdentityUpdate";
LABEL_93:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:]", 90, "### Family identity message not dictionary: type %s, fromID '%@', %#m\n", v19, v10, v22);
          goto LABEL_94;
      }
    }
LABEL_92:
    v19 = "?";
    goto LABEL_93;
  }
LABEL_94:

}

- (void)_receivedFriendIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6
{
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v8 = a3;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fromID"));
  v22 = 0;
  v13 = (void *)OPACKDecodeBytes(a4, a5, 8, &v22);
  if (!v13)
  {
    if (dword_100130118 > 90 || dword_100130118 == -1 && !_LogCategory_Initialize(&dword_100130118, 90))
      goto LABEL_94;
    if (v8 <= 47)
    {
      v18 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_73;
        case 1:
          v18 = "NoOp";
          break;
        case 3:
          v18 = "PS_Start";
          break;
        case 4:
          v18 = "PS_Next";
          break;
        case 5:
          v18 = "PV_Start";
          break;
        case 6:
          v18 = "PV_Next";
          break;
        case 7:
          v18 = "U_OPACK";
          break;
        case 8:
          v18 = "E_OPACK";
          break;
        case 9:
          v18 = "P_OPACK";
          break;
        case 10:
          v18 = "PA_Req";
          break;
        case 11:
          v18 = "PA_Rsp";
          break;
        case 16:
          v18 = "SessionStartRequest";
          break;
        case 17:
          v18 = "SessionStartResponse";
          break;
        case 18:
          v18 = "SessionData";
          break;
        case 32:
          v18 = "FamilyIdentityRequest";
          break;
        case 33:
          v18 = "FamilyIdentityResponse";
          break;
        case 34:
          v18 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_72;
      }
      goto LABEL_73;
    }
    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        v18 = "WatchIdentityRequest";
        goto LABEL_73;
      }
      if (v8 == 49)
      {
        v18 = "WatchIdentityResponse";
        goto LABEL_73;
      }
    }
    else
    {
      switch(v8)
      {
        case '@':
          v18 = "FriendIdentityRequest";
          goto LABEL_73;
        case 'A':
          v18 = "FriendIdentityResponse";
          goto LABEL_73;
        case 'B':
          v18 = "FriendIdentityUpdate";
LABEL_73:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:]", 90, "### Friend identity message decode failed: type %s, fromID '%@', %#m\n", v18, v10, v22);
          goto LABEL_94;
      }
    }
LABEL_72:
    v18 = "?";
    goto LABEL_73;
  }
  v14 = objc_opt_class(NSDictionary, v11, v12);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    v15 = (void *)IDSCopyRawAddressForDestination(v10);
    v16 = v15;
    if (!v15)
    {
      if (dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:]", 90, "### Friend identity convert to AppleID failed (%@)\n", v10);
      }
      goto LABEL_53;
    }
    if (objc_msgSend(v15, "_appearsToBePhoneNumber"))
      v17 = CUNormalizePhoneNumber(v16);
    else
      v17 = CUNormalizeEmailAddress(v16, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v9, "setAppleID:", v20);

    switch(v8)
    {
      case 'B':
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
        objc_msgSend(v21, "receivedFriendIdentityUpdate:msgCtx:", v13, v9);
        break;
      case 'A':
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
        objc_msgSend(v21, "receivedFriendIdentityResponse:msgCtx:", v13, v9);
        break;
      case '@':
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
        objc_msgSend(v21, "receivedFriendIdentityRequest:msgCtx:", v13, v9);
        break;
      default:
        if (dword_100130118 <= 90
          && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
        {
          sub_100014B50(v8);
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:]", 90, "### Unhandled friend identity frame 0x%02X (%s)\n");
        }
        goto LABEL_53;
    }

LABEL_53:
    goto LABEL_94;
  }
  if (dword_100130118 <= 90 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
  {
    if (v8 <= 47)
    {
      v19 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_93;
        case 1:
          v19 = "NoOp";
          break;
        case 3:
          v19 = "PS_Start";
          break;
        case 4:
          v19 = "PS_Next";
          break;
        case 5:
          v19 = "PV_Start";
          break;
        case 6:
          v19 = "PV_Next";
          break;
        case 7:
          v19 = "U_OPACK";
          break;
        case 8:
          v19 = "E_OPACK";
          break;
        case 9:
          v19 = "P_OPACK";
          break;
        case 10:
          v19 = "PA_Req";
          break;
        case 11:
          v19 = "PA_Rsp";
          break;
        case 16:
          v19 = "SessionStartRequest";
          break;
        case 17:
          v19 = "SessionStartResponse";
          break;
        case 18:
          v19 = "SessionData";
          break;
        case 32:
          v19 = "FamilyIdentityRequest";
          break;
        case 33:
          v19 = "FamilyIdentityResponse";
          break;
        case 34:
          v19 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_92;
      }
      goto LABEL_93;
    }
    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        v19 = "WatchIdentityRequest";
        goto LABEL_93;
      }
      if (v8 == 49)
      {
        v19 = "WatchIdentityResponse";
        goto LABEL_93;
      }
    }
    else
    {
      switch(v8)
      {
        case '@':
          v19 = "FriendIdentityRequest";
          goto LABEL_93;
        case 'A':
          v19 = "FriendIdentityResponse";
          goto LABEL_93;
        case 'B':
          v19 = "FriendIdentityUpdate";
LABEL_93:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:]", 90, "### Friend identity message not dictionary: type %s, fromID '%@', %#m\n", v19, v10, v22);
          goto LABEL_94;
      }
    }
LABEL_92:
    v19 = "?";
    goto LABEL_93;
  }
LABEL_94:

}

- (void)_receivedWatchIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 fromID:(id)a6
{
  int v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  unsigned int v20;

  v8 = a3;
  v10 = a6;
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("device:")) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceMap](self, "idsDeviceMap"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", 7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

    if (!v13)
    {
      if (dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]", 90, "### Ignoring watch identity from unknown fromID '%@'\n", v10);
      }
      goto LABEL_95;
    }
    v20 = 0;
    v16 = (void *)OPACKDecodeBytes(a4, a5, 8, &v20);
    if (v16)
    {
      v17 = objc_opt_class(NSDictionary, v14, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        if (v8 == 49)
        {
          -[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:](self, "_receivedWatchIdentityResponse:fromIDSDevice:", v16, v13);
        }
        else if (v8 == 48)
        {
          -[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:](self, "_receivedWatchIdentityRequest:fromIDSDevice:", v16, v13);
        }
        else if (dword_100130118 <= 90
               && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
        {
          sub_100014B50(v8);
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]", 90, "### Unhandled watch identity frame 0x%02X (%s)\n");
        }
        goto LABEL_94;
      }
      if (dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        if (v8 <= 47)
        {
          v19 = "Invalid";
          switch(v8)
          {
            case 0:
              goto LABEL_93;
            case 1:
              v19 = "NoOp";
              break;
            case 3:
              v19 = "PS_Start";
              break;
            case 4:
              v19 = "PS_Next";
              break;
            case 5:
              v19 = "PV_Start";
              break;
            case 6:
              v19 = "PV_Next";
              break;
            case 7:
              v19 = "U_OPACK";
              break;
            case 8:
              v19 = "E_OPACK";
              break;
            case 9:
              v19 = "P_OPACK";
              break;
            case 10:
              v19 = "PA_Req";
              break;
            case 11:
              v19 = "PA_Rsp";
              break;
            case 16:
              v19 = "SessionStartRequest";
              break;
            case 17:
              v19 = "SessionStartResponse";
              break;
            case 18:
              v19 = "SessionData";
              break;
            case 32:
              v19 = "FamilyIdentityRequest";
              break;
            case 33:
              v19 = "FamilyIdentityResponse";
              break;
            case 34:
              v19 = "FamilyIdentityUpdate";
              break;
            default:
              goto LABEL_92;
          }
          goto LABEL_93;
        }
        if (v8 <= 63)
        {
          if (v8 == 48)
          {
            v19 = "WatchIdentityRequest";
            goto LABEL_93;
          }
          if (v8 == 49)
          {
            v19 = "WatchIdentityResponse";
            goto LABEL_93;
          }
        }
        else
        {
          switch(v8)
          {
            case '@':
              v19 = "FriendIdentityRequest";
              goto LABEL_93;
            case 'A':
              v19 = "FriendIdentityResponse";
              goto LABEL_93;
            case 'B':
              v19 = "FriendIdentityUpdate";
LABEL_93:
              LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]", 90, "### Watch identity message not dictionary: type %s, fromID '%@', %#m\n", v19, v10, v20);
              goto LABEL_94;
          }
        }
LABEL_92:
        v19 = "?";
        goto LABEL_93;
      }
LABEL_94:

LABEL_95:
      goto LABEL_96;
    }
    if (dword_100130118 > 90 || dword_100130118 == -1 && !_LogCategory_Initialize(&dword_100130118, 90))
      goto LABEL_94;
    if (v8 <= 47)
    {
      v18 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_73;
        case 1:
          v18 = "NoOp";
          break;
        case 3:
          v18 = "PS_Start";
          break;
        case 4:
          v18 = "PS_Next";
          break;
        case 5:
          v18 = "PV_Start";
          break;
        case 6:
          v18 = "PV_Next";
          break;
        case 7:
          v18 = "U_OPACK";
          break;
        case 8:
          v18 = "E_OPACK";
          break;
        case 9:
          v18 = "P_OPACK";
          break;
        case 10:
          v18 = "PA_Req";
          break;
        case 11:
          v18 = "PA_Rsp";
          break;
        case 16:
          v18 = "SessionStartRequest";
          break;
        case 17:
          v18 = "SessionStartResponse";
          break;
        case 18:
          v18 = "SessionData";
          break;
        case 32:
          v18 = "FamilyIdentityRequest";
          break;
        case 33:
          v18 = "FamilyIdentityResponse";
          break;
        case 34:
          v18 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_72;
      }
      goto LABEL_73;
    }
    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        v18 = "WatchIdentityRequest";
        goto LABEL_73;
      }
      if (v8 == 49)
      {
        v18 = "WatchIdentityResponse";
        goto LABEL_73;
      }
    }
    else
    {
      switch(v8)
      {
        case '@':
          v18 = "FriendIdentityRequest";
          goto LABEL_73;
        case 'A':
          v18 = "FriendIdentityResponse";
          goto LABEL_73;
        case 'B':
          v18 = "FriendIdentityUpdate";
LABEL_73:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]", 90, "### Watch identity message decode failed: type %s, fromID '%@', %#m\n", v18, v10, v20);
          goto LABEL_94;
      }
    }
LABEL_72:
    v18 = "?";
    goto LABEL_73;
  }
  if (dword_100130118 <= 90 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]", 90, "### Ignoring watch identity from unsupported fromID '%@'\n", v10);
LABEL_96:

}

- (void)_receivedWatchIdentityRequest:(id)a3 fromIDSDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIDOverride"));
    if (v7)
    {
      if (dword_100130118 <= 30
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]", 30, "Received watch identity request: from IDS '%.8@'\n", v7);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v8, "saveIdentityWithIDSDeviceID:message:error:", v7, v11, 0);

      v9 = objc_alloc_init((Class)NSMutableDictionary);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v10, "addSelfIdentityInfoToMessage:flags:", v9, 0);

      -[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:](self, "sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:", v9, CFSTR("com.apple.private.alloy.nearby"), 49, v6, 1, 0, 0);
    }
    else if (dword_100130118 <= 90
           && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]", 90, "### Ignoring watch identity request from IDS device with no ID\n");
    }

  }
  else if (dword_100130118 <= 30
         && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
  {
    LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]", 30, "### Ignoring watch identity request before FirstUnlock\n");
  }

}

- (void)_receivedWatchIdentityResponse:(id)a3 fromIDSDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIDOverride"));
    if (v7)
    {
      if (dword_100130118 <= 30
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]", 30, "Received watch identity response: from IDS '%.8@'\n", v7);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v8, "saveIdentityWithIDSDeviceID:message:error:", v7, v9, 0);

    }
    else if (dword_100130118 <= 90
           && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]", 90, "### Ignoring watch identity response from IDS device with no ID\n");
    }

  }
  else if (dword_100130118 <= 60
         && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 60)))
  {
    LogPrintF(&dword_100130118, "-[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]", 60, "### Ignoring watch identity response before FirstUnlock\n");
  }

}

- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationDevice:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9
{
  uint64_t v10;
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  id v27;
  void *v28;
  const char *v29;

  v10 = *(_QWORD *)&a7;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v25 = (void *)IDSCopyIDForDevice(v17);
  if (v25)
  {
    v26 = -[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:](self, "sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:", v15, v16, v12, v25, v10, v18, a9);
    goto LABEL_41;
  }
  v27 = RPErrorF(4294960591, (uint64_t)"No IDS destination ID for device %@", v19, v20, v21, v22, v23, v24, (uint64_t)v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (dword_100130118 <= 90 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
  {
    if ((int)v12 <= 47)
    {
      v29 = "Invalid";
      switch((int)v12)
      {
        case 0:
          goto LABEL_37;
        case 1:
          v29 = "NoOp";
          break;
        case 3:
          v29 = "PS_Start";
          break;
        case 4:
          v29 = "PS_Next";
          break;
        case 5:
          v29 = "PV_Start";
          break;
        case 6:
          v29 = "PV_Next";
          break;
        case 7:
          v29 = "U_OPACK";
          break;
        case 8:
          v29 = "E_OPACK";
          break;
        case 9:
          v29 = "P_OPACK";
          break;
        case 10:
          v29 = "PA_Req";
          break;
        case 11:
          v29 = "PA_Rsp";
          break;
        case 16:
          v29 = "SessionStartRequest";
          break;
        case 17:
          v29 = "SessionStartResponse";
          break;
        case 18:
          v29 = "SessionData";
          break;
        case 32:
          v29 = "FamilyIdentityRequest";
          break;
        case 33:
          v29 = "FamilyIdentityResponse";
          break;
        case 34:
          v29 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_36;
      }
      goto LABEL_37;
    }
    if ((int)v12 <= 63)
    {
      if ((_DWORD)v12 == 48)
      {
        v29 = "WatchIdentityRequest";
        goto LABEL_37;
      }
      if ((_DWORD)v12 == 49)
      {
        v29 = "WatchIdentityResponse";
        goto LABEL_37;
      }
    }
    else
    {
      switch((_DWORD)v12)
      {
        case '@':
          v29 = "FriendIdentityRequest";
          goto LABEL_37;
        case 'A':
          v29 = "FriendIdentityResponse";
          goto LABEL_37;
        case 'B':
          v29 = "FriendIdentityUpdate";
LABEL_37:
          LogPrintF(&dword_100130118, "-[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:]", 90, "### IDS send frame failed: %s, %{error}\n", v29, v28);
          goto LABEL_38;
      }
    }
LABEL_36:
    v29 = "?";
    goto LABEL_37;
  }
LABEL_38:
  if (a9)
    *a9 = objc_retainAutorelease(v28);

  v26 = 0;
LABEL_41:

  return v26;
}

- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationID:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9
{
  char v10;
  int v12;
  id v15;
  __CFString *v16;
  id v17;
  const char *v18;
  void *Data;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  IDSService *v45;
  IDSService *v46;
  void *v47;
  uint64_t v48;
  id v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v68;
  void **v69;
  id v70;
  void *v71;
  id v72;
  const char *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  _BYTE v80[4];
  unsigned int v81[3];

  v10 = a7;
  v12 = a5;
  v15 = a4;
  v16 = (__CFString *)a6;
  v17 = a8;
  if (v12 > 47)
  {
    if (v12 <= 63)
    {
      if (v12 == 48)
      {
        v18 = "WatchIdentityRequest";
        goto LABEL_31;
      }
      if (v12 == 49)
      {
        v18 = "WatchIdentityResponse";
        goto LABEL_31;
      }
    }
    else
    {
      switch(v12)
      {
        case '@':
          v18 = "FriendIdentityRequest";
          goto LABEL_31;
        case 'A':
          v18 = "FriendIdentityResponse";
          goto LABEL_31;
        case 'B':
          v18 = "FriendIdentityUpdate";
          goto LABEL_31;
      }
    }
LABEL_30:
    v18 = "?";
  }
  else
  {
    v18 = "Invalid";
    switch(v12)
    {
      case 0:
        break;
      case 1:
        v18 = "NoOp";
        break;
      case 3:
        v18 = "PS_Start";
        break;
      case 4:
        v18 = "PS_Next";
        break;
      case 5:
        v18 = "PV_Start";
        break;
      case 6:
        v18 = "PV_Next";
        break;
      case 7:
        v18 = "U_OPACK";
        break;
      case 8:
        v18 = "E_OPACK";
        break;
      case 9:
        v18 = "P_OPACK";
        break;
      case 10:
        v18 = "PA_Req";
        break;
      case 11:
        v18 = "PA_Rsp";
        break;
      case 16:
        v18 = "SessionStartRequest";
        break;
      case 17:
        v18 = "SessionStartResponse";
        break;
      case 18:
        v18 = "SessionData";
        break;
      case 32:
        v18 = "FamilyIdentityRequest";
        break;
      case 33:
        v18 = "FamilyIdentityResponse";
        break;
      case 34:
        v18 = "FamilyIdentityUpdate";
        break;
      default:
        goto LABEL_30;
    }
  }
LABEL_31:
  v81[0] = 0;
  Data = (void *)OPACKEncoderCreateData(a3, 0, v81);
  v26 = Data;
  if (Data)
  {
    v73 = v18;
    v74 = v15;
    v80[0] = v12;
    v27 = objc_msgSend(Data, "length");
    v80[1] = BYTE2(v27);
    v80[2] = BYTE1(v27);
    v80[3] = (_BYTE)v27;
    v28 = objc_alloc_init((Class)NSMutableData);
    objc_msgSend(v28, "appendBytes:length:", v80, 4);
    objc_msgSend(v28, "appendData:", v26);
    v29 = objc_alloc_init((Class)NSMutableDictionary);
    v30 = v29;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v29, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
      objc_msgSend(v30, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionRequireBluetoothKey);
    }
    v31 = IDSSendMessageOptionFromIDKey;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "toID"));
    if (v32)
    {
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsAccountWithURI:senderID:](self, "_idsAccountWithURI:senderID:", v32, 0));

      v15 = v74;
      if (v33)
        goto LABEL_49;
    }
    else
    {

      v15 = v74;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sendersKnownAlias"));
    v79 = objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsURIWithID:](self, "_idsURIWithID:", v37));

    v38 = (void *)v79;
    if (v79)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsAccountWithURI:senderID:](self, "_idsAccountWithURI:senderID:", v79, &v79));
      v38 = (void *)v79;
      if (v33)
      {
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v79, v31);
        v38 = (void *)v79;
      }
    }
    else
    {
      v33 = 0;
    }

LABEL_49:
    if (objc_msgSend(v17, "nonWakingRequest"))
      objc_msgSend(v30, "setObject:forKeyedSubscript:", &off_10011A9E0, IDSSendMessageOptionPushPriorityKey);
    if (!objc_msgSend(v15, "isEqual:", CFSTR("com.apple.private.alloy.nearby"))
      || (v45 = self->_nearbyIDSService) == 0)
    {
      v49 = RPErrorF(4294896131, (uint64_t)"Unsupported cloudServiceID: '%@'", v39, v40, v41, v42, v43, v44, (uint64_t)v15);
      v46 = (IDSService *)objc_claimAutoreleasedReturnValue(v49);
      if (dword_100130118 <= 90
        && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
      {
        LogPrintF(&dword_100130118, "-[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:]", 90, "### IDS send frame failed: %s, %{error}\n", v73, v46);
      }
      if (a9)
      {
        v46 = objc_retainAutorelease(v46);
        v50 = 0;
        *a9 = v46;
      }
      else
      {
        v50 = 0;
      }
      goto LABEL_92;
    }
    v46 = v45;
    v16 = v16;
    v47 = v16;
    if ((-[__CFString hasPrefix:](v16, "hasPrefix:", CFSTR("token:")) & 1) == 0)
    {
      if (-[__CFString _appearsToBePhoneNumber](v16, "_appearsToBePhoneNumber"))
      {
        v48 = IDSCopyIDForPhoneNumber(v16);
LABEL_69:
        v47 = (void *)v48;

        goto LABEL_70;
      }
      v47 = v16;
      if (-[__CFString _appearsToBeEmail](v16, "_appearsToBeEmail"))
      {
        v48 = IDSCopyIDForEmailAddress(v16);
        goto LABEL_69;
      }
    }
LABEL_70:
    if (objc_msgSend(v47, "isEqual:", v16))
    {

      v16 = CFSTR("=");
    }
    v71 = v47;
    if (v47)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v47));
      if (v33)
      {
        v78 = 0;
        v77 = 0;
        v69 = &v77;
        v58 = -[IDSService sendData:fromAccount:toDestinations:priority:options:identifier:error:](v46, "sendData:fromAccount:toDestinations:priority:options:identifier:error:", v28, v33, v57, 300, v30, &v78);
        v70 = v78;
        v59 = v77;
      }
      else
      {
        v75 = 0;
        v76 = 0;
        v58 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](v46, "sendData:toDestinations:priority:options:identifier:error:", v28, v57, 300, v30, &v76, &v75);
        v70 = v76;
        v59 = v75;
      }
      v72 = v59;

      if ((v58 & 1) != 0)
      {
        if (dword_100130118 > 30)
        {
          v50 = 1;
          v15 = v74;
        }
        else
        {
          v15 = v74;
          if (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "loginID"));
            LogPrintF(&dword_100130118, "-[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:]", 30, "IDS send frame %s, to '%@' (%@), Account %@, ClSI '%@', %zu bytes, IDS ID %@\n", v73, v71, v16, v65, v74, v27, v70);

          }
          v50 = 1;
        }
      }
      else
      {
        if (dword_100130118 <= 90
          && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
        {
          LogPrintF(&dword_100130118, "-[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:]", 90, "### IDS send frame failed: %s, %{error}\n", v73, v72);
        }
        v15 = v74;
        if (a9)
        {
          v66 = RPNestedErrorF((uint64_t)v72, 4294960549, (uint64_t)"IDS send failed", v60, v61, v62, v63, v64, (uint64_t)v69);
          v50 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue(v66);
        }
        else
        {
          v50 = 0;
        }
      }

    }
    else if (a9)
    {
      v68 = RPErrorF(4294960591, (uint64_t)"Bad destination ID", v51, v52, v53, v54, v55, v56, (uint64_t)v69);
      v50 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue(v68);
    }
    else
    {
      v50 = 0;
    }

LABEL_92:
    goto LABEL_93;
  }
  if (v81[0])
    v34 = v81[0];
  else
    v34 = 4294960596;
  v35 = RPErrorF(v34, (uint64_t)"Encode failed", v20, v21, v22, v23, v24, v25, (uint64_t)v69);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  if (dword_100130118 <= 90 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:]", 90, "### IDS send frame failed: %s, %{error}\n", v18, v36);
  if (a9)
    *a9 = objc_retainAutorelease(v36);

  v50 = 0;
LABEL_93:

  return v50;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForID:(SEL)a3
{
  id v6;
  RPCloudDaemon *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  __int128 v16;
  int64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a4;
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  if (-[RPCloudDaemon idsIsSignedIn](self, "idsIsSignedIn"))
  {
    v7 = self;
    objc_sync_enter(v7);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v7, "idsDeviceArray"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if (v14)
          {
            if (v12)
            {
              objc_msgSend(v12, "operatingSystemVersion");
            }
            else
            {
              v16 = 0uLL;
              v17 = 0;
            }
            *(_OWORD *)&retstr->var0 = v16;
            retstr->var2 = v17;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

    objc_sync_exit(v7);
  }

  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (IDSService)nearbyIDSService
{
  return self->_nearbyIDSService;
}

- (void)setNearbyIDSService:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyIDSService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyIDSService, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_lastFamilyQueryDate, 0);
  objc_storeStrong((id *)&self->_idsFamilyEndpointMap, 0);
  objc_storeStrong((id *)&self->_idsDeviceMap, 0);
  objc_storeStrong((id *)&self->_idsDeviceIDSelf, 0);
  objc_storeStrong((id *)&self->_idsDeviceArray, 0);
  objc_storeStrong((id *)&self->_idsCorrelationIdentifier, 0);
}

@end
