@implementation RPPeopleDaemon

+ (id)sharedPeopleDaemon
{
  if (qword_100132288 != -1)
    dispatch_once(&qword_100132288, &stru_100114230);
  return (id)qword_100132280;
}

- (RPPeopleDaemon)init
{
  RPPeopleDaemon *v2;
  RPPeopleDaemon *v3;
  RPPeopleDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPPeopleDaemon;
  v2 = -[RPPeopleDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_airdropModeNotifyToken = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_familyNotifyToken = -1;
    v3->_friendsSuggestedNotifyToken = -1;
    v3->_privacyChangedNotifyToken = -1;
    -[RPPeopleDaemon _irkMetricsSetup](v3, "_irkMetricsSetup");
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  id v4;
  id *v6;
  id *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  unsigned int v15;
  const char *v16;
  id *v17;
  double Current;
  double Double;
  void **v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  SFDeviceDiscovery *v25;
  SFDeviceDiscovery *v26;
  id *v27;
  RPPeopleDaemon *v28;
  id v29;
  id *v30;
  NSMutableDictionary *discoveredDevices;
  CURangingSession *v32;
  id *v33;
  CURangingSession *v34;
  id *v35;
  SFService *v36;
  SFService *v37;
  id *v38;
  SFDeviceDiscovery *v39;
  SFDeviceDiscovery *v40;
  id *v41;
  RPPeopleDaemon *v42;
  NSMutableDictionary *rangingBLEActionDevicesActive;
  NSMutableDictionary *rangingBLEActionDevicesOther;
  id v45;
  id *v46;
  NSMutableSet *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id *v56;
  uint64_t v57;
  void *v58;
  id *v59;
  void *v61;
  id v63;
  unsigned int v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  _QWORD v73[5];
  unsigned int v74;
  _QWORD v75[5];
  unsigned int v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[5];
  unsigned int v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  id obj;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];

  if (a3 < 21)
  {
    v97 = 0;
    v98 = &v97;
    v99 = 0x3032000000;
    v100 = sub_10000F9D8;
    v101 = sub_10000F978;
    v102 = 0;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_familyMemberMonitor, "familyMembers"));
    v6 = (id *)(v98 + 5);
    obj = (id)v98[5];
    NSAppendPrintF(&obj, "-- RPPeopleDaemon: %d devices, %d family, %d XPC --\n", -[NSMutableDictionary count](self->_discoveredDevices, "count"), objc_msgSend(v61, "count"), -[NSMutableSet count](self->_xpcConnections, "count"));
    objc_storeStrong(v6, obj);
    if (a3 > 10)
    {
      v22 = 50;
    }
    else
    {
      if (objc_msgSend(v61, "count"))
      {
        v7 = (id *)(v98 + 5);
        v95 = (id)v98[5];
        NSAppendPrintF(&v95, "Family: ");
        objc_storeStrong(v7, v95);
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v63 = v61;
        v8 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        if (v8)
        {
          v9 = "";
          v10 = *(_QWORD *)v92;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v92 != v10)
                objc_enumerationMutation(v63);
              v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v11);
              v13 = (id *)(v98 + 5);
              v90 = (id)v98[5];
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appleID"));
              v15 = objc_msgSend(v12, "isMe");
              v16 = " (me)";
              if (!v15)
                v16 = "";
              NSAppendPrintF(&v90, "%s%{mask}%s", v9, v14, v16);
              objc_storeStrong(v13, v90);

              v11 = (char *)v11 + 1;
              v9 = ", ";
            }
            while (v8 != v11);
            v8 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
            v9 = ", ";
          }
          while (v8);
        }

        v17 = (id *)(v98 + 5);
        v89 = (id)v98[5];
        NSAppendPrintF(&v89, "\n");
        objc_storeStrong(v17, v89);
      }
      Current = CFAbsoluteTimeGetCurrent();
      Double = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("pdFriendSyncStart"), 0);
      if (Double >= 0.0)
      {
        if (Double == 0.0)
        {
          v20 = (void **)(v98 + 5);
          v87 = (void *)v98[5];
          NSAppendPrintF(&v87, "Friend Sync Start: not started\n");
          v21 = v87;
        }
        else
        {
          v20 = (void **)(v98 + 5);
          if (Double <= Current)
          {
            v86 = (void *)v98[5];
            NSAppendPrintF(&v86, "Friend Sync Start: %{DateCF}\n", *(_QWORD *)&Double);
            v21 = v86;
          }
          else
          {
            v85 = (void *)v98[5];
            NSAppendPrintF(&v85, "Friend Sync Start: %{DateCF}, %{dur}\n", *(_QWORD *)&Double, (int)fmin(Double - Current, 2147483650.0));
            v21 = v85;
          }
        }
      }
      else
      {
        v20 = (void **)(v98 + 5);
        v88 = (void *)v98[5];
        NSAppendPrintF(&v88, "Friend Sync Start: disabled\n");
        v21 = v88;
      }
      v23 = v21;
      v24 = *v20;
      *v20 = v23;

      v22 = 30;
    }
    v64 = v22;
    v25 = self->_deviceDiscovery;
    v26 = v25;
    if (v25)
    {
      v27 = (id *)(v98 + 5);
      v84 = (id)v98[5];
      NSAppendPrintF(&v84, "%@\n", v25);
      objc_storeStrong(v27, v84);
    }

    v28 = self;
    v29 = -[NSMutableDictionary count](self->_discoveredDevices, "count");
    if (v29)
    {
      v30 = (id *)(v98 + 5);
      v83 = (id)v98[5];
      NSAppendPrintF(&v83, "%d device(s)\n", (_DWORD)v29);
      objc_storeStrong(v30, v83);
      v28 = self;
    }
    discoveredDevices = v28->_discoveredDevices;
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_100084030;
    v81[3] = &unk_100114258;
    v81[4] = &v97;
    v82 = v64;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v81);
    v32 = v28->_rangingInitiator;
    if (v32)
    {
      v33 = (id *)(v98 + 5);
      v80 = (id)v98[5];
      NSAppendPrintF(&v80, "Ranging initiator: On\n");
      objc_storeStrong(v33, v80);
    }

    v34 = self->_rangingResponder;
    if (v34)
    {
      v35 = (id *)(v98 + 5);
      v79 = (id)v98[5];
      NSAppendPrintF(&v79, "Ranging responder: On\n");
      objc_storeStrong(v35, v79);
    }

    v36 = self->_rangingBLEActionAdvertiser;
    v37 = v36;
    if (v36)
    {
      v38 = (id *)(v98 + 5);
      v78 = (id)v98[5];
      NSAppendPrintF(&v78, "Ranging advertiser: %@\n", v36);
      objc_storeStrong(v38, v78);
    }

    v39 = self->_rangingBLEActionScanner;
    v40 = v39;
    if (v39)
    {
      v41 = (id *)(v98 + 5);
      v77 = (id)v98[5];
      NSAppendPrintF(&v77, "Ranging scanner: %@\n", v39);
      objc_storeStrong(v41, v77);
    }

    v42 = self;
    rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100084098;
    v75[3] = &unk_1001114D8;
    v75[4] = &v97;
    v76 = v64;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rangingBLEActionDevicesActive, "enumerateKeysAndObjectsUsingBlock:", v75);
    rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100084100;
    v73[3] = &unk_1001114D8;
    v73[4] = &v97;
    v74 = v64;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rangingBLEActionDevicesOther, "enumerateKeysAndObjectsUsingBlock:", v73);
    v45 = -[NSMutableSet count](self->_xpcConnections, "count");
    if (v45)
    {
      v46 = (id *)(v98 + 5);
      v72 = (id)v98[5];
      NSAppendPrintF(&v72, "%d XPC Cnx\n", (_DWORD)v45);
      objc_storeStrong(v46, v72);
      v42 = self;
    }
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v47 = v42->_xpcConnections;
    v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v68, v103, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v69;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v69 != v49)
            objc_enumerationMutation(v47);
          v51 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v50);
          v52 = (id *)(v98 + 5);
          v67 = (id)v98[5];
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "xpcCnx"));
          NSAppendPrintF(&v67, "    %#{pid}", objc_msgSend(v53, "processIdentifier"));
          objc_storeStrong(v52, v67);

          v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "activatedDiscovery"));
          v55 = (void *)v54;
          if (v54)
          {
            v56 = (id *)(v98 + 5);
            v66 = (id)v98[5];
            v57 = CUDescriptionWithLevel(v54, v64);
            v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
            NSAppendPrintF(&v66, ", %@", v58);
            objc_storeStrong(v56, v66);

          }
          v59 = (id *)(v98 + 5);
          v65 = (id)v98[5];
          NSAppendPrintF(&v65, "\n");
          objc_storeStrong(v59, v65);
          v50 = (char *)v50 + 1;
        }
        while (v48 != v50);
        v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v68, v103, 16);
      }
      while (v48);
    }

    v4 = (id)v98[5];
    _Block_object_dispose(&v97, 8);

  }
  else
  {
    v3 = NSPrintF("RPPeopleDaemon %{ptr}", a2, self);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  }
  return v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000841C0;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  NSObject *dispatchQueue;
  int airdropModeNotifyToken;
  CUSystemMonitor *v7;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD handler[5];
  uint64_t state64;

  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _activate]", 30, "Activate\n");
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.rapport.people"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  if (self->_airdropModeNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000843E0;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch("com.apple.sharing.airdrop-mode-changed", &self->_airdropModeNotifyToken, dispatchQueue, handler);
    airdropModeNotifyToken = self->_airdropModeNotifyToken;
    state64 = 0;
    notify_get_state(airdropModeNotifyToken, &state64);
    self->_airdropMode = state64;
  }
  if (!self->_systemMonitor)
  {
    v7 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v7;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000844BC;
    v13[3] = &unk_1001110F8;
    v13[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000844C4;
    v12[3] = &unk_1001110F8;
    v12[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000844E8;
    v11[3] = &unk_1001110F8;
    v11[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v11);
    v9 = self->_systemMonitor;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000844F0;
    v10[3] = &unk_1001110F8;
    v10[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v9, "activateWithCompletion:", v10);
  }
  -[RPPeopleDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084550;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSString *primaryAppleIDCached;
  CUSystemMonitor *systemMonitor;
  int airdropModeNotifyToken;
  NSXPCListener *xpcListener;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _invalidate]", 30, "Invalidating\n");
    }
    primaryAppleIDCached = self->_primaryAppleIDCached;
    self->_primaryAppleIDCached = 0;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    airdropModeNotifyToken = self->_airdropModeNotifyToken;
    if (airdropModeNotifyToken != -1)
    {
      notify_cancel(airdropModeNotifyToken);
      self->_airdropModeNotifyToken = -1;
    }
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_xpcConnections;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "xpcCnx", (_QWORD)v13));
          objc_msgSend(v12, "invalidate");

        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[RPPeopleDaemon _discoveryEnsureStopped](self, "_discoveryEnsureStopped");
    -[RPPeopleDaemon _familyEnsureStopped](self, "_familyEnsureStopped");
    -[RPPeopleDaemon _friendsEnsureStopped](self, "_friendsEnsureStopped");
    -[RPPeopleDaemon _rangingInitiatorEnsureStopped](self, "_rangingInitiatorEnsureStopped");
    -[RPPeopleDaemon _rangingResponderEnsureStopped](self, "_rangingResponderEnsureStopped");
    -[RPPeopleDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  int v3;
  void *v5;
  void *v6;

  v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon daemonInfoChanged:]", 30, "Removing family identities on sign out\n");
    }
    -[RPPeopleDaemon _familyEnsureStopped](self, "_familyEnsureStopped");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v5, "postDaemonInfoChanges:", 2);

    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon daemonInfoChanged:]", 30, "Removing friend identities on sign out\n");
    }
    -[RPPeopleDaemon _friendsEnsureStopped](self, "_friendsEnsureStopped");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v6, "postDaemonInfoChanges:", 128);

    -[RPPeopleDaemon _update](self, "_update");
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon daemonInfoChanged:]", 30, "Reloading identities on sign in\n");
  -[RPPeopleDaemon _update](self, "_update");
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x80000) == 0)
      return;
LABEL_21:
    -[RPPeopleDaemon reportIRKMetrics](self, "reportIRKMetrics");
    return;
  }
LABEL_20:
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_familyAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100114298);
  -[RPPeopleDaemon _update](self, "_update");
  if ((v3 & 0x80000) != 0)
    goto LABEL_21;
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  CFTypeID v12;
  uint64_t v13;
  RPPeopleDaemon *v14;
  uint64_t v15;
  RPCloudMessageContext *v17;
  uint64_t v18;
  NSMutableDictionary *familyAccountIdentityMap;
  Block_layout *v20;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FamilyReq"), 9) != (id)0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "rangeOfString:options:", CFSTR("FamilyAck"), 9) != (id)0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "rangeOfString:options:", CFSTR("FamilyUp"), 9) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("appleID"), TypeID, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (!v11)
      goto LABEL_34;
    if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FamilyReq"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FamilyAck"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FamilyUp"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_49:

LABEL_50:
          v8 = 1;
          goto LABEL_51;
        }
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Family Identity Update: %##@\n", v7);
        }
        v14 = self;
        v15 = 34;
      }
      else
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Family Identity Response: %##@\n", v7);
        }
        v14 = self;
        v15 = 33;
      }
    }
    else
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Family Identity Request: %##@\n", v7);
      }
      v14 = self;
      v15 = 32;
    }
    -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](v14, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", v15, v11, 0, 0);
    goto LABEL_49;
  }
  if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FriendReq"), 9) != (id)0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "rangeOfString:options:", CFSTR("FriendAck"), 9) != (id)0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "rangeOfString:options:", CFSTR("FriendUp"), 9) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = CFStringGetTypeID();
    v13 = CFDictionaryGetTypedValue(v7, CFSTR("appleID"), v12, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v11)
    {
      if (CFDictionaryGetInt64(v7, CFSTR("nonWaking"), 0))
      {
        if (dword_100131788 <= 10
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 10, "Diag: Friend Identity non-waking message\n");
        }
        v17 = objc_opt_new(RPCloudMessageContext);
        -[RPCloudMessageContext setNonWakingRequest:](v17, "setNonWakingRequest:", 1);
      }
      else
      {
        if (dword_100131788 <= 10
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 10, "Diag: Friend Identity waking message\n");
        }
        v17 = 0;
      }
      if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FriendReq"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FriendAck"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("FriendUp"), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_89:

            goto LABEL_49;
          }
          if (dword_100131788 > 30)
          {
            v18 = 66;
          }
          else
          {
            if (dword_100131788 == -1)
            {
              v18 = 66;
              if (!_LogCategory_Initialize(&dword_100131788, 30))
                goto LABEL_88;
            }
            else
            {
              v18 = 66;
            }
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Friend Identity Update: %##@\n", v7);
          }
        }
        else if (dword_100131788 > 30)
        {
          v18 = 65;
        }
        else
        {
          if (dword_100131788 == -1)
          {
            v18 = 65;
            if (!_LogCategory_Initialize(&dword_100131788, 30))
              goto LABEL_88;
          }
          else
          {
            v18 = 65;
          }
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Friend Identity Response: %##@\n", v7);
        }
      }
      else if (dword_100131788 > 30)
      {
        v18 = 64;
      }
      else
      {
        if (dword_100131788 == -1)
        {
          v18 = 64;
          if (!_LogCategory_Initialize(&dword_100131788, 30))
            goto LABEL_88;
        }
        else
        {
          v18 = 64;
        }
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Friend Identity Request: %##@\n", v7);
      }
LABEL_88:
      -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](self, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", v18, v11, 1, v17);
      goto LABEL_89;
    }
LABEL_34:
    if (dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 90, "### No AppleID for people identity message\n");
    }
    goto LABEL_49;
  }
  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("FamilyClearDates")))
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: FamilyClearDates\n");
    }
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    v20 = &stru_1001142B8;
    goto LABEL_100;
  }
  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("FriendClearDates")))
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: FriendClearDates\n");
    }
    familyAccountIdentityMap = self->_friendAccountIdentityMap;
    v20 = &stru_1001142D8;
LABEL_100:
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v20);
LABEL_101:
    -[RPPeopleDaemon _update](self, "_update");
    goto LABEL_50;
  }
  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("FriendPrivacy")))
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: FriendPrivacy\n");
    }
    -[RPPeopleDaemon _updateFriendPrivacy](self, "_updateFriendPrivacy");
    goto LABEL_50;
  }
  if (objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("FriendSuggest")))
  {
    if (objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("PruneFriends")))
    {
      if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("ResetFriends")))
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: ResetFriends\n");
        }
        -[RPPeopleDaemon _resetFriends](self, "_resetFriends");
        goto LABEL_50;
      }
      if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("RegenerateSelfIdentity")))
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: RegenerateSelfIdentity\n");
        }
        -[RPPeopleDaemon _regenerateSelfIdentity:](self, "_regenerateSelfIdentity:", CFSTR("dcmd"));
        goto LABEL_50;
      }
      if (objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("update")))
      {
        v8 = 0;
        goto LABEL_51;
      }
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: Update\n");
      }
      goto LABEL_101;
    }
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: PruneFriends\n");
    }
    v8 = 1;
    -[RPPeopleDaemon _pruneFriends:](self, "_pruneFriends:", 1);
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon diagnosticCommand:params:]", 30, "Diag: FriendSuggest\n");
    }
    v8 = 1;
    self->_friendsSuggestedNeedsUpdate = 1;
    -[RPPeopleDaemon _update](self, "_update");
  }
LABEL_51:

  return v8;
}

- (BOOL)addOrUpdateIdentity:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _UNKNOWN **v37;
  RPCloudMessageContext *v38;
  void *v39;
  uint64_t *v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  id *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v6 = a3;
  if (objc_msgSend(v6, "type") != 15)
  {
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = sub_10000F9D8;
    v58 = sub_10000F978;
    v59 = 0;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100085830;
    v50[3] = &unk_100114300;
    v52 = &v54;
    v8 = v6;
    v51 = v8;
    v53 = a4;
    v9 = objc_retainBlock(v50);
    v49 = v9;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon addOrUpdateIdentity:error:]", 30, "AddOrUpdateIdentity: %@\n", v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountID"));
    v17 = v10;
    if (!v10 || !objc_msgSend(v10, "length"))
    {
      v41 = v55;
      v42 = RPErrorF(4294960540, (uint64_t)"No accountID", v11, v12, v13, v14, v15, v16, v48);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      v7 = 0;
      v24 = (void *)v41[5];
      v41[5] = v43;
      goto LABEL_20;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceID"));
    if (v24)
    {
      if (objc_msgSend(v8, "type") == 6)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactID"));
        v32 = -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:](self, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:", v17, v31, 0, 1, 1, 0);
        v33 = objc_alloc_init((Class)NSMutableDictionary);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIRKData"));
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("_dIRK"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "edPKData"));
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("_edPK"));

        v36 = objc_msgSend(v8, "featureFlags");
        if (v36)
          v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "featureFlags")));
        else
          v37 = &off_10011AC98;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("_ff"));
        if (v36)

        if (((-[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 6, v24, v17, v31, v33) | v32) & 0xCA86C) != 0)
        {
          v38 = objc_alloc_init(RPCloudMessageContext);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sendersKnownAlias"));
          -[RPCloudMessageContext setSendersKnownAlias:](v38, "setSendersKnownAlias:", v39);

          -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](self, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", 64, v17, 1, v38);
        }

        v7 = 1;
        v9 = v49;
        goto LABEL_19;
      }
      v44 = v55;
      v47 = RPErrorF(4294960540, (uint64_t)"Only friend device identity allowed", v25, v26, v27, v28, v29, v30, v48);
      v46 = objc_claimAutoreleasedReturnValue(v47);
    }
    else
    {
      v44 = v55;
      v45 = RPErrorF(4294960540, (uint64_t)"No IDSDeviceID", v18, v19, v20, v21, v22, v23, v48);
      v46 = objc_claimAutoreleasedReturnValue(v45);
    }
    v7 = 0;
    v31 = (void *)v44[5];
    v44[5] = v46;
LABEL_19:

LABEL_20:
    ((void (*)(_QWORD *))v9[2])(v9);

    _Block_object_dispose(&v54, 8);
    goto LABEL_21;
  }
  v7 = -[RPPeopleDaemon addOrUpdateAdHocPairedIdentity:error:](self, "addOrUpdateAdHocPairedIdentity:error:", v6, a4);
LABEL_21:

  return v7;
}

- (BOOL)addOrUpdateAdHocPairedIdentity:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon addOrUpdateAdHocPairedIdentity:error:]", 30, "AddOrUpdateAdHocPairedIdentity: %@\n", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "addOrUpdateAdHocPairedIdentity:", v4);

  return 1;
}

- (void)prefsChanged
{
  unsigned int DeviceClass;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  id v7;
  _BOOL4 v8;
  const char *v9;
  const char *v10;
  uint64_t Int64;
  int64_t v12;
  int64_t prefFamilyIdentityPruneSeconds;
  uint64_t v14;
  int64_t v15;
  int64_t prefFriendAccountPruneSeconds;
  int64_t v17;
  int64_t prefFriendRefreshMaxSeconds;
  int64_t v19;
  int64_t v20;
  int64_t prefFriendRefreshMinSeconds;
  int64_t *p_prefFriendRefreshSeconds;
  int64_t prefFriendRefreshSeconds;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  BOOL v32;
  const char *v33;
  int v34;
  const char *v35;
  uint64_t prefFriendSuggestMax;
  uint64_t v37;
  uint64_t v40;
  uint64_t prefFriendSuggestPollSeconds;
  int64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  int64_t prefFriendSyncDelaySeconds;
  uint64_t v47;
  BOOL v48;
  _BOOL4 v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  BOOL v53;
  _BOOL4 v54;
  const char *v55;
  const char *v56;
  double Double;
  double v58;
  double prefPrivacyCoalesceMinSecs;
  double v60;
  double v61;
  double prefPrivacyCoalesceMaxSecs;
  double v63;
  double prefPTSBurstScanActionSecs;
  double v65;
  double v66;
  double prefPTSBurstScanInfoSecs;
  uint64_t v68;
  _BOOL4 v69;
  uint64_t v70;
  BOOL v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  _BOOL4 v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  int v79;
  int v80;
  int prefTrackWhileAsleepState;
  const char *v82;
  _BOOL4 v83;
  int v84;
  const char *v85;
  const char *v86;
  id v87;
  int v88;

  v88 = 0;
  DeviceClass = GestaltGetDeviceClass(self, a2);
  v4 = -[objc_class sharedInstance](off_1001317F8(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v87 = 0;
  v6 = objc_msgSend(v5, "isDeviceEnrolledWithDeKOTA:", &v87);
  v7 = v87;

  if (v7)
    v8 = 0;
  else
    v8 = v6;
  if (self->_prefDisableSelfIdentityRolling != v8)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v9 = "yes";
      if (v8)
        v10 = "no";
      else
        v10 = "yes";
      if (!v8)
        v9 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "DisableSelfIdentityRolling: %s -> %s\n", v10, v9);
    }
    self->_prefDisableSelfIdentityRolling = v8;
  }
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("familyIdentityPruneSecs"), &v88);
  if (v88)
    v12 = 600;
  else
    v12 = Int64;
  prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
  if (v12 != prefFamilyIdentityPruneSeconds)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_23;
        prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FamilyIdentityPruneSeconds: %lld -> %lld\n", prefFamilyIdentityPruneSeconds, v12);
    }
LABEL_23:
    self->_prefFamilyIdentityPruneSeconds = v12;
  }
  v14 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("frPruneAccountSecs"), &v88);
  if (v88)
    v15 = 604800;
  else
    v15 = v14;
  prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
  if (v15 != prefFriendAccountPruneSeconds)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_32;
        prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendAccountPruneSeconds: %lld -> %lld\n", prefFriendAccountPruneSeconds, v15);
    }
LABEL_32:
    self->_prefFriendAccountPruneSeconds = v15;
  }
  v17 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("frRefreshMax"), &v88);
  prefFriendRefreshMaxSeconds = self->_prefFriendRefreshMaxSeconds;
  if (v17 == prefFriendRefreshMaxSeconds)
    goto LABEL_39;
  if (dword_100131788 <= 30)
  {
    v19 = self->_prefFriendRefreshMaxSeconds;
    if (dword_100131788 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131788, 30))
        goto LABEL_38;
      v19 = self->_prefFriendRefreshMaxSeconds;
    }
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendRefreshMax: %lld -> %lld\n", v19, v17);
  }
LABEL_38:
  self->_prefFriendRefreshMaxSeconds = v17;
LABEL_39:
  v20 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("frRefreshMin"), &v88);
  prefFriendRefreshMinSeconds = self->_prefFriendRefreshMinSeconds;
  if (v20 != prefFriendRefreshMinSeconds)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_46;
        prefFriendRefreshMinSeconds = self->_prefFriendRefreshMinSeconds;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendRefreshMin: %lld -> %lld\n", prefFriendRefreshMinSeconds, v20);
    }
LABEL_46:
    self->_prefFriendRefreshMinSeconds = v20;
    p_prefFriendRefreshSeconds = &self->_prefFriendRefreshSeconds;
    goto LABEL_47;
  }
  p_prefFriendRefreshSeconds = &self->_prefFriendRefreshSeconds;
  if (v17 == prefFriendRefreshMaxSeconds)
  {
    prefFriendRefreshSeconds = self->_prefFriendRefreshSeconds;
    goto LABEL_52;
  }
LABEL_47:
  if (v20 < 1)
  {
    prefFriendRefreshSeconds = 0;
  }
  else
  {
    prefFriendRefreshSeconds = 0;
    v24 = self->_prefFriendRefreshMaxSeconds;
    if (v24 >= 1 && v20 < v24)
      prefFriendRefreshSeconds = arc4random()
                               % (self->_prefFriendRefreshMaxSeconds - self->_prefFriendRefreshMinSeconds + 1)
                               + v20;
  }
LABEL_52:
  v25 = *p_prefFriendRefreshSeconds;
  if (prefFriendRefreshSeconds == *p_prefFriendRefreshSeconds)
    goto LABEL_58;
  if (dword_100131788 <= 30)
  {
    if (dword_100131788 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131788, 30))
        goto LABEL_57;
      v25 = *p_prefFriendRefreshSeconds;
    }
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendRefreshSecs: %lld -> %lld\n", v25, prefFriendRefreshSeconds);
  }
LABEL_57:
  *p_prefFriendRefreshSeconds = prefFriendRefreshSeconds;
LABEL_58:
  v26 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("frSuggestMax"), &v88);
  v27 = v88;
  if (!v88)
  {
    v30 = "pref";
    goto LABEL_70;
  }
  v27 = 1;
  if ((DeviceClass > 0xB || ((1 << DeviceClass) & 0x80E) == 0) && DeviceClass != 100)
  {
    v26 = 0;
    v30 = "disabled";
    goto LABEL_70;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](IDSServerBag, "sharedInstance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("rapport-friend-keys-max-v2")));

  if (v29)
  {
    v30 = "server-v2";
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](IDSServerBag, "sharedInstance"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("rapport-friend-keys-max")));

    if (!v29)
    {
      v30 = "default";
      goto LABEL_69;
    }
    v30 = "server";
  }
  v26 = CFGetInt64(v29, &v88);

LABEL_69:
  v27 = v88;
LABEL_70:
  v32 = v27 == 0;
  v33 = "clamped";
  v34 = !v32;
  if (!v32)
    v33 = v30;
  if (v26 < -1)
    v34 = 1;
  if (v26 > 1000)
    v34 = 1;
  if (v34)
  {
    v26 = 32;
    v35 = v33;
  }
  else
  {
    v35 = v30;
  }
  prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (v26 != prefFriendSuggestMax)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_87;
        LODWORD(prefFriendSuggestMax) = self->_prefFriendSuggestMax;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendSuggestMax: %d -> %lld (%s)\n", prefFriendSuggestMax, v26, v35);
    }
LABEL_87:
    self->_prefFriendSuggestMax = v26;
  }
  v37 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("frSuggestPollSecs"), &v88);
  if (v37 <= 0x7FFFFFFF && v37 >= -1 && v88 == 0)
    v40 = v37;
  else
    v40 = 3600;
  prefFriendSuggestPollSeconds = self->_prefFriendSuggestPollSeconds;
  if (v40 != prefFriendSuggestPollSeconds)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_102;
        LODWORD(prefFriendSuggestPollSeconds) = self->_prefFriendSuggestPollSeconds;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendSuggestPollSeconds: %d -> %lld\n", prefFriendSuggestPollSeconds, v40);
    }
LABEL_102:
    self->_prefFriendSuggestPollSeconds = v40;
  }
  v42 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("frSyncDelaySecs"), &v88);
  if (v88)
  {
    if (DeviceClass <= 0xB && ((1 << DeviceClass) & 0x80E) != 0 || DeviceClass == 100)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](IDSServerBag, "sharedInstance"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("rapport-friend-keys-initial-delay")));

      if (v44)
      {
        v42 = CFGetInt64(v44, &v88);
        v45 = "server";
      }
      else
      {
        v45 = "default";
      }

    }
    else
    {
      v45 = "disabled";
      v42 = -1;
    }
  }
  else
  {
    v45 = "pref";
  }
  prefFriendSyncDelaySeconds = self->_prefFriendSyncDelaySeconds;
  if (v42 != prefFriendSyncDelaySeconds)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_118;
        prefFriendSyncDelaySeconds = self->_prefFriendSyncDelaySeconds;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "FriendSyncDelaySeconds: %lld -> %lld (%s)\n", prefFriendSyncDelaySeconds, v42, v45);
    }
LABEL_118:
    self->_prefFriendSyncDelaySeconds = v42;
  }
  v47 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("pdFamily"), &v88);
  if (v88)
    v48 = 0;
  else
    v48 = v47 == 0;
  v49 = !v48;
  if (self->_prefPeopleDiscoveryFamily != v49)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v50 = "yes";
      if (v49)
        v51 = "no";
      else
        v51 = "yes";
      if (!v49)
        v50 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeopleDiscoveryFamily: %s -> %s\n", v51, v50);
    }
    self->_prefPeopleDiscoveryFamily = v49;
  }
  v52 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("pdFriends"), &v88);
  if (v88)
    v53 = 0;
  else
    v53 = v52 == 0;
  v54 = !v53;
  if (self->_prefPeopleDiscoveryFriends != v54)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v55 = "yes";
      if (v54)
        v56 = "no";
      else
        v56 = "yes";
      if (!v54)
        v55 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeopleDiscoveryFriends: %s -> %s\n", v56, v55);
    }
    self->_prefPeopleDiscoveryFriends = v54;
  }
  Double = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("pdPrivacyCoalesceMin"), &v88);
  if (v88)
    v58 = 300.0;
  else
    v58 = Double;
  prefPrivacyCoalesceMinSecs = self->_prefPrivacyCoalesceMinSecs;
  if (v58 != prefPrivacyCoalesceMinSecs)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_161;
        prefPrivacyCoalesceMinSecs = self->_prefPrivacyCoalesceMinSecs;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeoplePrivacyCoalesceMinSeconds: %.0f -> %.0f\n", prefPrivacyCoalesceMinSecs, v58);
    }
LABEL_161:
    self->_prefPrivacyCoalesceMinSecs = v58;
  }
  v60 = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("pdPrivacyCoalesceMax"), &v88);
  if (v88)
    v61 = 900.0;
  else
    v61 = v60;
  prefPrivacyCoalesceMaxSecs = self->_prefPrivacyCoalesceMaxSecs;
  if (v61 != prefPrivacyCoalesceMaxSecs)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_170;
        prefPrivacyCoalesceMaxSecs = self->_prefPrivacyCoalesceMaxSecs;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeoplePrivacyCoalesceMaxSeconds: %.0f -> %.0f\n", prefPrivacyCoalesceMaxSecs, v61);
    }
LABEL_170:
    self->_prefPrivacyCoalesceMaxSecs = v61;
  }
  v63 = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("pdPTSBurstActionScanSecs"), &v88);
  if (v88 && GestaltGetBoolean(CFSTR("R1Capability"), 0, 0))
    v63 = 2.0;
  prefPTSBurstScanActionSecs = self->_prefPTSBurstScanActionSecs;
  if (v63 != prefPTSBurstScanActionSecs)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_179;
        prefPTSBurstScanActionSecs = self->_prefPTSBurstScanActionSecs;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeoplePTSBurstScanActionSeconds: %.3f -> %.3f\n", prefPTSBurstScanActionSecs, v63);
    }
LABEL_179:
    self->_prefPTSBurstScanActionSecs = v63;
  }
  v65 = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("pdPTSBurstInfoScanSecs"), &v88);
  if (v88)
    v66 = 2.0;
  else
    v66 = v65;
  prefPTSBurstScanInfoSecs = self->_prefPTSBurstScanInfoSecs;
  if (v66 != prefPTSBurstScanInfoSecs)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_188;
        prefPTSBurstScanInfoSecs = self->_prefPTSBurstScanInfoSecs;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeoplePTSBurstScanInfoSeconds: %.3f -> %.3f\n", prefPTSBurstScanInfoSecs, v66);
    }
LABEL_188:
    self->_prefPTSBurstScanInfoSecs = v66;
  }
  v68 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("pdRanging"), &v88);
  v69 = v68 != 0;
  if (v88)
  {
    v70 = v68;
    if (GestaltGetBoolean(CFSTR("R1Capability"), 0, 0))
      v71 = 0;
    else
      v71 = v70 == 0;
    v69 = !v71;
  }
  if (self->_prefRanging != v69)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v72 = "yes";
      if (v69)
        v73 = "no";
      else
        v73 = "yes";
      if (!v69)
        v72 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeopleDiscoveryRanging: %s -> %s\n", v73, v72);
    }
    self->_prefRanging = v69;
  }
  v74 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("pdStrangers"), &v88);
  v75 = v74 != 0;
  if (self->_prefPeopleStrangers != v75)
  {
    if (dword_100131788 <= 30)
    {
      v76 = v74;
      if (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30))
      {
        v77 = "yes";
        if (v76)
          v78 = "no";
        else
          v78 = "yes";
        if (!v76)
          v77 = "no";
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "PeopleStrangers: %s -> %s\n", v78, v77);
      }
    }
    self->_prefPeopleStrangers = v75;
  }
  if (CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("pdTrackWhileAsleep"), &v88))
    v79 = 6;
  else
    v79 = 5;
  if (v88)
    v80 = 0;
  else
    v80 = v79;
  prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
  if (v80 != prefTrackWhileAsleepState)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 != -1)
      {
LABEL_227:
        if (prefTrackWhileAsleepState >= 8)
        {
          if (prefTrackWhileAsleepState <= 9)
            v82 = "?";
          else
            v82 = "User";
        }
        else
        {
          v82 = (&off_100114678)[prefTrackWhileAsleepState];
        }
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "People track while asleep enabled: %s -> %s\n", v82, (&off_1001146B8)[v80]);
        goto LABEL_235;
      }
      if (_LogCategory_Initialize(&dword_100131788, 30))
      {
        prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
        goto LABEL_227;
      }
    }
LABEL_235:
    self->_prefTrackWhileAsleepState = v80;
  }
  v83 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("oneTimeDateRequestedResetCompleted"), &v88) != 0;
  v84 = v88;
  if (!v88)
    goto LABEL_242;
  if (dword_100131788 <= 30)
  {
    if (dword_100131788 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131788, 30))
        goto LABEL_241;
      v84 = v88;
    }
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "OneTimeDateRequestedResetCompleted: error returned %d\n", v84);
  }
LABEL_241:
  v83 = 0;
LABEL_242:
  if (self->_prefOneTimeDateRequestedResetCompleted != v83)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v85 = "yes";
      if (v83)
        v86 = "no";
      else
        v86 = "yes";
      if (!v83)
        v85 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon prefsChanged]", 30, "OneTimeDateRequestedResetCompleted: %s -> %s\n", v86, v85);
    }
    self->_prefOneTimeDateRequestedResetCompleted = v83;
  }
  -[RPPeopleDaemon _update](self, "_update");

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
  void *v3;

  if (-[NSMutableSet count](self->_discoveryClients, "count"))
    -[RPPeopleDaemon _discoveryEnsureStarted](self, "_discoveryEnsureStarted");
  else
    -[RPPeopleDaemon _discoveryEnsureStopped](self, "_discoveryEnsureStopped");
  if (self->_prefPeopleDiscoveryFamily
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0)),
        v3,
        v3))
  {
    -[RPPeopleDaemon _familyEnsureStarted](self, "_familyEnsureStarted");
  }
  else
  {
    -[RPPeopleDaemon _familyEnsureStopped](self, "_familyEnsureStopped");
  }
  if (self->_prefPeopleDiscoveryFriends)
    -[RPPeopleDaemon _friendsEnsureStarted](self, "_friendsEnsureStarted");
  else
    -[RPPeopleDaemon _friendsEnsureStopped](self, "_friendsEnsureStopped");
  if (-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn"))
  {
    if (self->_ptsActive)
      -[RPPeopleDaemon _rangingInitiatorEnsureStarted](self, "_rangingInitiatorEnsureStarted");
    else
      -[RPPeopleDaemon _rangingInitiatorEnsureStopped](self, "_rangingInitiatorEnsureStopped");
    if (self->_prefRanging)
    {
      -[RPPeopleDaemon _rangingBLEActionScannerEnsureStarted](self, "_rangingBLEActionScannerEnsureStarted");
      return;
    }
  }
  else
  {
    -[RPPeopleDaemon _rangingInitiatorEnsureStopped](self, "_rangingInitiatorEnsureStopped");
  }
  -[RPPeopleDaemon _rangingBLEActionScannerEnsureStopped](self, "_rangingBLEActionScannerEnsureStopped");
}

- (id)_primaryAppleID:(BOOL)a3
{
  _BOOL4 v3;
  NSString **p_primaryAppleIDCached;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  p_primaryAppleIDCached = &self->_primaryAppleIDCached;
  v6 = self->_primaryAppleIDCached;
  v7 = v6;
  if (v3 || !v6)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CUSystemMonitor primaryAppleID](self->_systemMonitor, "primaryAppleID"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = CUNormalizeEmailAddress(v9, 1);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue(v11);

    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)p_primaryAppleIDCached, v8);
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _primaryAppleID:]", 30, "PrimaryAppleID updated: %{mask}\n", v8);
    }
    if (v3)
      -[RPPeopleDaemon _update](self, "_update");
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)_regenerateSelfIdentity:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  *(int32x2_t *)&self->_irkMetrics.selfIdentRolled = vadd_s32(*(int32x2_t *)&self->_irkMetrics.selfIdentRolled, (int32x2_t)0x100000001);
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _regenerateSelfIdentity:]", 30, "Re-generate SelfIdentity: %@\n", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v4, "regenerateSelfIdentity:", v5);

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_familyAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100114320);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_friendAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100114340);
  -[RPPeopleDaemon _update](self, "_update");

}

- (void)_discoveryEnsureStarted
{
  SFDeviceDiscovery *deviceDiscovery;
  char **v4;
  unsigned int deviceDiscoveryID;
  NSMutableDictionary *v6;
  NSMutableDictionary *discoveredDevices;
  SFDeviceDiscovery *v8;
  SFDeviceDiscovery *v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  unsigned int v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  id v18;
  id v19;
  int prefTrackWhileAsleepState;
  _BOOL8 v21;
  NSMutableSet *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  NSMutableSet *v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void *k;
  void *v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  const char *v44;
  const char *v45;
  unsigned int v46;
  int v47;
  OS_dispatch_source *ptsBurstScanTimer;
  NSObject *v49;
  OS_dispatch_source *v50;
  OS_dispatch_source *v51;
  OS_dispatch_source *v52;
  NSObject *v53;
  int Boolean;
  uint64_t v55;
  int v56;
  const char *v57;
  SFDeviceDiscovery *v58;
  _QWORD handler[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  unsigned int v73;
  _QWORD v74[5];
  unsigned int v75;
  _QWORD v76[5];
  unsigned int v77;
  _QWORD v78[5];
  unsigned int v79;
  _QWORD v80[5];
  unsigned int v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];

  deviceDiscovery = self->_deviceDiscovery;
  v4 = &off_100131000;
  if (!deviceDiscovery)
  {
    deviceDiscoveryID = self->_deviceDiscoveryID;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]", 30, "Device discovery start ID %u\n", deviceDiscoveryID);
    }
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = v6;

    v8 = (SFDeviceDiscovery *)objc_alloc_init(off_100131800());
    v9 = self->_deviceDiscovery;
    self->_deviceDiscovery = v8;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 11);
    -[SFDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", CFSTR("RPPeople"));
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 20);
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100087494;
    v80[3] = &unk_1001117E8;
    v80[4] = self;
    v81 = deviceDiscoveryID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v80);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000874B8;
    v78[3] = &unk_1001117E8;
    v78[4] = self;
    v79 = deviceDiscoveryID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v78);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000874DC;
    v76[3] = &unk_100111810;
    v76[4] = self;
    v77 = deviceDiscoveryID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v76);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100087504;
    v74[3] = &unk_100111838;
    v74[4] = self;
    v75 = deviceDiscoveryID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_deviceDiscovery, "setInterruptionHandler:", v74);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_100087598;
    v72[3] = &unk_100114360;
    v73 = deviceDiscoveryID;
    -[SFDeviceDiscovery setInvalidationHandler:](self->_deviceDiscovery, "setInvalidationHandler:", v72);
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v10 = self->_discoveryClients;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v14)
          objc_enumerationMutation(v10);
        v13 |= objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i), "discoveryFlags");
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    }
    while (v12);

    self->_discoveryFlagsAggregate = v13;
    if ((v13 & 0x5FE) == 2)
    {
      v16 = 1048577;
      goto LABEL_23;
    }
  }
  else
  {

    LOWORD(v13) = 0;
    self->_discoveryFlagsAggregate = 0;
  }
  if ((v13 & 0x5F8) != 0 || (v13 & 6) == 0)
    v16 = 1;
  else
    v16 = 33;
LABEL_23:
  v18 = -[SFDeviceDiscovery discoveryFlags](self->_deviceDiscovery, "discoveryFlags");
  if ((id)v16 != v18)
  {
    if (deviceDiscovery)
    {
      if (dword_100131788 <= 30)
      {
        v19 = v18;
        if (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30))
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]", 30, "Device discovery update flags %#{flags} -> %#{flags}\n", v19, &unk_10010B018, v16, &unk_10010B018);
      }
    }
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", v16);
  }
  prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
  v21 = prefTrackWhileAsleepState == 6;
  if (!prefTrackWhileAsleepState)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v22 = self->_discoveryClients;
    v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v65;
      while (2)
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v65 != v25)
            objc_enumerationMutation(v22);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j), "discoveryFlags") & 1) != 0)
          {
            v21 = 1;
            goto LABEL_41;
          }
        }
        v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_41:

  }
  if (v21 != -[SFDeviceDiscovery trackPeers](self->_deviceDiscovery, "trackPeers"))
  {
    if (deviceDiscovery
      && dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v27 = "yes";
      if (v21)
        v28 = "no";
      else
        v28 = "yes";
      if (!v21)
        v27 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]", 30, "Device discovery update track peers %s -> %s\n", v28, v27);
    }
    -[SFDeviceDiscovery setTrackPeers:](self->_deviceDiscovery, "setTrackPeers:", v21);
  }
  v29 = v21 | ((unsigned __int16)(v13 & 0x200) >> 9);
  if ((_DWORD)v29 != -[SFDeviceDiscovery overrideScreenOff](self->_deviceDiscovery, "overrideScreenOff"))
  {
    if (deviceDiscovery
      && dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v30 = "yes";
      if ((_DWORD)v29)
        v31 = "no";
      else
        v31 = "yes";
      if (!(_DWORD)v29)
        v30 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]", 30, "Device discovery update screen off %s -> %s\n", v31, v30);
    }
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_deviceDiscovery, "setOverrideScreenOff:", v29);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v32 = self->_discoveryClients;
  v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
  if (!v33)
  {

    v36 = 0;
LABEL_81:
    v35 = 20;
    goto LABEL_82;
  }
  v34 = v33;
  v58 = deviceDiscovery;
  v35 = 0;
  v36 = 0;
  v37 = *(_QWORD *)v61;
  do
  {
    for (k = 0; k != v34; k = (char *)k + 1)
    {
      if (*(_QWORD *)v61 != v37)
        objc_enumerationMutation(v32);
      v39 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
      v40 = objc_msgSend(v39, "scanRate");
      v41 = objc_msgSend(v39, "discoveryMode");
      if (v35 <= v40)
        v42 = v40;
      else
        v42 = v35;
      if (v41 != 1)
        v35 = v42;
      v36 |= v41 == 1;
    }
    v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
  }
  while (v34);

  deviceDiscovery = v58;
  v4 = &off_100131000;
  if (!v35)
    goto LABEL_81;
LABEL_82:
  if (self->_ptsActive == (v36 & 1))
  {
    if ((v36 & 1) == 0)
      goto LABEL_113;
    goto LABEL_105;
  }
  if (deviceDiscovery)
  {
    v43 = *((_DWORD *)v4 + 482);
    if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v44 = "yes";
      if ((v36 & 1) != 0)
        v45 = "no";
      else
        v45 = "yes";
      if ((v36 & 1) == 0)
        v44 = "no";
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]", 30, "Device discovery update PTS %s -> %s\n", v45, v44);
    }
  }
  self->_ptsActive = v36 & 1;
  v46 = -[SFDeviceDiscovery changeFlags](self->_deviceDiscovery, "changeFlags");
  if ((v36 & 1) != 0)
    v47 = 4;
  else
    v47 = 0;
  if ((v46 & 0xFFFFFFFB | v47) != v46)
    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:");
  if ((v36 & 1) != 0)
  {
    if (self->_prefPTSBurstScanInfoSecs > 0.0)
    {
      ptsBurstScanTimer = self->_ptsBurstScanTimer;
      if (ptsBurstScanTimer)
      {
        v49 = ptsBurstScanTimer;
        dispatch_source_cancel(v49);
        v50 = self->_ptsBurstScanTimer;
        self->_ptsBurstScanTimer = 0;

      }
      v51 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v52 = self->_ptsBurstScanTimer;
      self->_ptsBurstScanTimer = v51;
      v53 = v51;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100087614;
      handler[3] = &unk_1001110F8;
      handler[4] = self;
      dispatch_source_set_event_handler(v53, handler);
      CUDispatchTimerSet(v53, self->_prefPTSBurstScanInfoSecs, -1.0, -4.0);
      dispatch_activate(v53);

    }
LABEL_105:
    if (self->_ptsBurstScanTimer)
    {
      if (v35 <= 50)
        v35 = 50;
    }
    else
    {
      Boolean = GestaltGetBoolean(CFSTR("R1Capability"), 0, 0);
      v55 = 30;
      if (v35 > 30)
        v55 = v35;
      if (Boolean)
        v35 = v55;
    }
  }
LABEL_113:
  v56 = *((_DWORD *)v4 + 482);
  if (v56 <= 30 && (v56 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
  {
    if (v35 <= 19)
    {
      v57 = "Background";
      switch(v35)
      {
        case 1:
          v57 = "BackgroundOld";
          break;
        case 2:
          v57 = "NormalOld";
          break;
        case 3:
          v57 = "HighOld";
          break;
        case 4:
          v57 = "AggressiveOld";
          break;
        case 10:
          goto LABEL_133;
        default:
          goto LABEL_132;
      }
      goto LABEL_133;
    }
    if (v35 > 39)
    {
      if (v35 == 40)
      {
        v57 = "High";
        goto LABEL_133;
      }
      if (v35 == 50)
      {
        v57 = "Aggressive";
        goto LABEL_133;
      }
    }
    else
    {
      if (v35 == 20)
      {
        v57 = "Normal";
        goto LABEL_133;
      }
      if (v35 == 30)
      {
        v57 = "HighNormal";
LABEL_133:
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]", 30, "Device discovery scan rate: %s\n", v57);
        goto LABEL_134;
      }
    }
LABEL_132:
    v57 = "?";
    goto LABEL_133;
  }
LABEL_134:
  if ((id)v35 != -[SFDeviceDiscovery scanRate](self->_deviceDiscovery, "scanRate"))
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", v35);
  if (!deviceDiscovery)
    -[SFDeviceDiscovery activateWithCompletion:](self->_deviceDiscovery, "activateWithCompletion:", &stru_100114380);
}

- (void)_discoveryEnsureStopped
{
  SFDeviceDiscovery *deviceDiscovery;
  NSMutableDictionary *discoveredDevices;
  OS_dispatch_source *ptsBurstScanTimer;
  OS_dispatch_source *v6;
  NSObject *v7;

  if (self->_deviceDiscovery)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStopped]", 30, "Device discovery stop ID %u\n", self->_deviceDiscoveryID);
    }
    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    ++self->_deviceDiscoveryID;
    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0;

    self->_discoveryFlagsAggregate = 0;
    if (self->_ptsActive)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStopped]", 30, "Device discovery update PTS: stop\n");
      }
      self->_ptsActive = 0;
    }
    -[NSMutableSet removeAllObjects](self->_rangingCapableDevices, "removeAllObjects");
    ptsBurstScanTimer = self->_ptsBurstScanTimer;
    if (ptsBurstScanTimer)
    {
      v7 = ptsBurstScanTimer;
      dispatch_source_cancel(v7);
      v6 = self->_ptsBurstScanTimer;
      self->_ptsBurstScanTimer = 0;

    }
  }
}

- (void)_daemonDeviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  if (v6)
  {
    v7 = objc_alloc_init((Class)RPDevice);
    objc_msgSend(v7, "setIdentifier:", v6);
    objc_msgSend(v7, "updateWithSFDevice:changes:", v4, 0xFFFFFFFFLL);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredDevices, "setObject:forKeyedSubscript:", v7, v6);
    if (dword_100131788 <= 20
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 20)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _daemonDeviceFound:]", 20, "Device found: %@\n", v7);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_xpcConnections;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "clientDeviceFound:report:", v7, 1);
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    -[RPPeopleDaemon _rangingUpdateForDevice:](self, "_rangingUpdateForDevice:", v7);
  }

}

- (void)_daemonDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v5));
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v5);
      if (dword_100131788 <= 20
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 20)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _daemonDeviceLost:]", 20, "Device lost: %@\n", v6);
      }
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = self->_xpcConnections;
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "clientDeviceLost:", v6);
          }
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

      -[RPPeopleDaemon _rangingRemoveDevice:](self, "_rangingRemoveDevice:", v6);
    }

  }
}

- (void)_daemonDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSMutableSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v8));
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "updateWithSFDevice:changes:", v6, v4);
      if (((unsigned __int16)v11 & 0x25B) != 0)
        v12 = 30;
      else
        v12 = 20;
      if ((int)v12 >= dword_100131788
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, v12)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _daemonDeviceChanged:changes:]", v12, "Device changed: %@, %#{flags}\n", v10, v11, &unk_10010B134);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = self->_xpcConnections;
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "clientDeviceChanged:changes:", v10, v11);
          }
          v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v15);
      }

      -[RPPeopleDaemon _rangingUpdateForDevice:](self, "_rangingUpdateForDevice:", v10);
    }
    else
    {
      -[RPPeopleDaemon _daemonDeviceFound:](self, "_daemonDeviceFound:", v6);
    }

  }
}

- (void)_daemonDevice:(id)a3 updatedMeasurement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v8));
    if (v9)
    {
      objc_msgSend(v6, "setRelativeLocation:", v7);
      if (dword_100131788 <= 20
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 20)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _daemonDevice:updatedMeasurement:]", 20, "Device ranged: %@\n", v6);
      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = self->_xpcConnections;
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "clientDevice:updatedMeasurement:", v9, v7);
          }
          v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)_familyEnsureStarted
{
  CUSystemMonitor *v3;
  CUSystemMonitor *familyMemberMonitor;
  CUSystemMonitor *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *familySyncCheckTimer;
  NSObject *v8;
  _QWORD handler[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  if (!self->_familyMemberMonitor)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _familyEnsureStarted]", 30, "People discovery family start\n");
    }
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    familyMemberMonitor = self->_familyMemberMonitor;
    self->_familyMemberMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_familyMemberMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008818C;
    v13[3] = &unk_1001110F8;
    v13[4] = self;
    -[CUSystemMonitor setFamilyUpdatedHandler:](self->_familyMemberMonitor, "setFamilyUpdatedHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000881CC;
    v12[3] = &unk_1001110F8;
    v12[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_familyMemberMonitor, "setFirstUnlockHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000881D4;
    v11[3] = &unk_1001110F8;
    v11[4] = self;
    -[CUSystemMonitor setSystemNameChangedHandler:](self->_familyMemberMonitor, "setSystemNameChangedHandler:", v11);
    v5 = self->_familyMemberMonitor;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000881DC;
    v10[3] = &unk_1001110F8;
    v10[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v10);
  }
  if (!self->_familySyncCheckTimer)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    familySyncCheckTimer = self->_familySyncCheckTimer;
    self->_familySyncCheckTimer = v6;

    v8 = self->_familySyncCheckTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000881E4;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet(self->_familySyncCheckTimer, 18000.0, 18000.0, -4.0);
    dispatch_activate((dispatch_object_t)self->_familySyncCheckTimer);
  }
  -[RPPeopleDaemon _updateFamilyIdentities](self, "_updateFamilyIdentities");
}

- (void)_familyEnsureStopped
{
  NSMutableArray *bufferedCloudMessages;
  CUSystemMonitor *familyMemberMonitor;
  int familyNotifyToken;
  NSMutableDictionary *familyAccountIdentityMap;
  NSMutableDictionary *familyDeviceIdentityMap;
  OS_dispatch_source *familySyncCheckTimer;
  OS_dispatch_source *v9;
  NSObject *v10;

  bufferedCloudMessages = self->_bufferedCloudMessages;
  self->_bufferedCloudMessages = 0;

  if (self->_familyMemberMonitor)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _familyEnsureStopped]", 30, "People discovery family stop\n");
    }
    -[CUSystemMonitor invalidate](self->_familyMemberMonitor, "invalidate");
    familyMemberMonitor = self->_familyMemberMonitor;
    self->_familyMemberMonitor = 0;

  }
  familyNotifyToken = self->_familyNotifyToken;
  if (familyNotifyToken != -1)
  {
    notify_cancel(familyNotifyToken);
    self->_familyNotifyToken = -1;
  }
  -[NSMutableDictionary removeAllObjects](self->_familyAccountIdentityMap, "removeAllObjects");
  familyAccountIdentityMap = self->_familyAccountIdentityMap;
  self->_familyAccountIdentityMap = 0;

  -[NSMutableDictionary removeAllObjects](self->_familyDeviceIdentityMap, "removeAllObjects");
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  self->_familyDeviceIdentityMap = 0;

  self->_familyFlags = 0;
  familySyncCheckTimer = self->_familySyncCheckTimer;
  if (familySyncCheckTimer)
  {
    v10 = familySyncCheckTimer;
    dispatch_source_cancel(v10);
    v9 = self->_familySyncCheckTimer;
    self->_familySyncCheckTimer = 0;

  }
}

- (id)getFamilyDeviceIdentities
{
  return -[NSMutableDictionary allValues](self->_familyDeviceIdentityMap, "allValues");
}

- (id)getFamilyURIs
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_familyMemberMonitor, "familyMembers"));
  v3 = objc_alloc_init((Class)NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
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
        if ((objc_msgSend(v9, "isMe", (_QWORD)v13) & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appleID"));

          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appleID"));
            objc_msgSend(v3, "addObject:", v11);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_updateFamilyIdentities
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  void *v6;

  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v3 = -[RPPeopleDaemon _updateFamilyAccounts](self, "_updateFamilyAccounts");
    v4 = -[RPPeopleDaemon _updateFamilyDevices](self, "_updateFamilyDevices") + v3;
    v5 = -[RPPeopleDaemon _pruneFamilyDevices](self, "_pruneFamilyDevices") << 31 >> 31;
    -[RPPeopleDaemon _processBufferedCloudMessages](self, "_processBufferedCloudMessages");
    -[RPPeopleDaemon _updateFamilySyncing](self, "_updateFamilySyncing");
    if (v4 != v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v6, "postDaemonInfoChanges:", 2);

    }
    -[RPPeopleDaemon _updateFamilyNotification](self, "_updateFamilyNotification");
  }
  else if (dword_100131788 <= 30
         && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
  {
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyIdentities]", 30, "Deferring family account identities update until FirstUnlock\n");
  }
}

- (BOOL)_updateFamilyAccounts
{
  void *v3;
  id v4;
  NSMutableDictionary *familyAccountIdentityMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  NSMutableDictionary *v22;
  id v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_familyMemberMonitor, "familyMembers"));
  if (v25
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_familyAccountIdentityMap, "allKeys")),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    if (!familyAccountIdentityMap)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v7 = self->_familyAccountIdentityMap;
      self->_familyAccountIdentityMap = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v35 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identitiesOfType:error:", 3, &v35));
      v24 = v35;

      if (!v9
        && dword_100131788 <= 90
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyAccounts]", 90, "### Load family account identities failed: %{error}\n", v24);
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            if (v16)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_familyAccountIdentityMap, "setObject:forKeyedSubscript:", v15, v16);
              if (dword_100131788 <= 30
                && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
              {
                LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyAccounts]", 30, "Loaded family account identity: %@\n", v15);
              }
              *((_BYTE *)v37 + 24) = 1;
            }

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        }
        while (v12);
      }

      familyAccountIdentityMap = self->_familyAccountIdentityMap;
    }
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001143A0);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v25;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v21, "isMe") & 1) == 0
            && -[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:](self, "_updateFamilyIdentityWithFamilyMember:", v21))
          {
            *((_BYTE *)v37 + 24) = 1;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      }
      while (v18);
    }

    v22 = self->_familyAccountIdentityMap;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000889F0;
    v26[3] = &unk_1001143C8;
    v26[4] = &v36;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v26);
    v10 = *((_BYTE *)v37 + 24) != 0;
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyAccounts]", 30, "Deferring family account identities update until family members list is ready\n");
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)_updateFamilyIdentityWithFamilyMember:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSMutableDictionary *familyAccountIdentityMap;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appleID"));
  v6 = (void *)v5;
  if (v5)
  {
    v7 = CUNormalizeEmailAddress(v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_familyAccountIdentityMap, "objectForKeyedSubscript:", v8));
    LODWORD(v10) = v9 == 0;
    v11 = (id)v9;
    if (!v9)
      v11 = objc_alloc_init((Class)RPIdentity);
    objc_msgSend(v11, "setPresent:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateAdded"));

    if (!v12)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v11, "setDateAdded:", v10);

      LODWORD(v10) = 1;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateRemoved"));

    if (v13)
    {
      objc_msgSend(v11, "setDateRemoved:", 0);
      LODWORD(v10) = 1;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v15 = objc_msgSend(v14, "isEqual:", v8);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v11, "setIdentifier:", v8);
      LODWORD(v10) = 1;
    }
    if (objc_msgSend(v11, "type") == 3)
    {
      if (v9)
      {
        if (!(_DWORD)v10)
        {
          if (dword_100131788 <= 10
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:]", 10, "Unchanged family account identity: %@\n", v11);
          }
          LOBYTE(v10) = 0;
LABEL_37:

          goto LABEL_38;
        }
LABEL_20:
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:]", 30, "Updated family account identity: %@\n", v11);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        objc_msgSend(v10, "saveIdentity:error:", v11, 0);

        LOBYTE(v10) = 1;
        goto LABEL_37;
      }
    }
    else
    {
      objc_msgSend(v11, "setType:", 3);
      if (v9)
        goto LABEL_20;
      LOBYTE(v10) = 1;
    }
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    if (!familyAccountIdentityMap)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v18 = self->_familyAccountIdentityMap;
      self->_familyAccountIdentityMap = v17;

      familyAccountIdentityMap = self->_familyAccountIdentityMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](familyAccountIdentityMap, "setObject:forKeyedSubscript:", v11, v8);
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:]", 30, "Added family account identity: %@\n", v11);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    objc_msgSend(v19, "saveIdentity:error:", v11, 0);

    goto LABEL_37;
  }
  if (dword_100131788 <= 50 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 50)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:]", 50, "### Ignoring family member with no AppleID: %@\n", v4);
  LOBYTE(v10) = 0;
LABEL_38:

  return (char)v10;
}

- (BOOL)_updateFamilyDevices
{
  BOOL v2;
  NSMutableDictionary *v4;
  NSMutableDictionary *familyDeviceIdentityMap;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  if (self->_familyDeviceIdentityMap)
    return 0;
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  self->_familyDeviceIdentityMap = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadFamilyDeviceIdentitiesWithError:", &v22));
  v8 = v22;

  if (!v7
    && dword_100131788 <= 90
    && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
  {
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyDevices]", 90, "### Load family device identities failed: %{error}\n", v8);
  }
  v17 = v8;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v2 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        if (v15)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_familyDeviceIdentityMap, "setObject:forKeyedSubscript:", v14, v15);
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyDevices]", 30, "Loaded family device identity: %@\n", v14, v17, (_QWORD)v18);
          }
          v2 = 1;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_pruneFamilyDevices
{
  int64_t prefFamilyIdentityPruneSeconds;
  double Current;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *familyDeviceIdentityMap;
  uint64_t v19;
  BOOL v20;
  id obj;
  _QWORD v22[7];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
  if (prefFamilyIdentityPruneSeconds <= 0)
  {
    if (dword_100131788 <= 10
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFamilyDevices]", 10, "Skipping prune friend accounts: invalid prune seconds %lld\n", prefFamilyIdentityPruneSeconds);
    }
    return 0;
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_familyAccountIdentityMap, "allKeys"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v20 = 0;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_familyAccountIdentityMap, "objectForKeyedSubscript:", v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateRemoved"));
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "timeIntervalSinceReferenceDate");
            v14 = (uint64_t)(Current - v13);
            if (prefFamilyIdentityPruneSeconds <= v14)
            {
              if (dword_100131788 <= 30
                && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
              {
                LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFamilyDevices]", 30, "Prune family account identity: %ll{dur}, %@\n", v14, v10);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_familyAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v9);
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
              objc_msgSend(v15, "removeIdentity:error:", v10, 0);

              familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472;
              v22[2] = sub_1000893E4;
              v22[3] = &unk_1001143F0;
              v22[4] = v9;
              v22[5] = v10;
              v22[6] = self;
              -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyDeviceIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v22);
              v20 = 1;
            }
            else if (dword_100131788 <= 9
                   && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 9)))
            {
              LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFamilyDevices]", 9, "Skipping prune family account identity: premature, %ll{dur}, %@\n", v14, v10);
            }
          }
          else if (dword_100131788 <= 8
                 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 8)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFamilyDevices]", 8, "Skipping prune family account identity: active, %@\n", v10, v19);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }
    else
    {
      v20 = 0;
    }

    return v20;
  }
}

- (void)_updateFamilySyncing
{
  void *v3;
  CFTypeID TypeID;
  void *v5;
  void *v6;
  BOOL v7;
  NSMutableDictionary *familyAccountIdentityMap;
  int maxNumFamilyDevices;
  signed int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD v14[13];
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 10;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor systemName](self->_familyMemberMonitor, "systemName"));
  if (v3)
  {
    TypeID = CFStringGetTypeID();
    v5 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.rapport"), CFSTR("familySyncedName"), TypeID, 0);
    v6 = v5;
    v7 = v5 != 0;
    if (v5 && (objc_msgSend(v5, "isEqual:", v3) & 1) != 0)
      v7 = 0;
    else
      CFPrefs_SetValue(CFSTR("com.apple.rapport"), CFSTR("familySyncedName"), v3);

  }
  else
  {
    v7 = 0;
  }
  familyAccountIdentityMap = self->_familyAccountIdentityMap;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100089804;
  v14[3] = &unk_100114418;
  v14[6] = &v36;
  v14[7] = &v32;
  v15 = v7;
  v14[8] = &v28;
  v14[9] = &v24;
  v14[4] = v3;
  v14[5] = self;
  v14[10] = &v40;
  v14[11] = &v16;
  v14[12] = &v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v14);
  maxNumFamilyDevices = self->_irkMetrics.maxNumFamilyDevices;
  v10 = -[NSMutableDictionary count](self->_familyDeviceIdentityMap, "count");
  if (maxNumFamilyDevices <= v10)
    v11 = v10;
  else
    v11 = maxNumFamilyDevices;
  self->_irkMetrics.maxNumFamilyDevices = v11;
  self->_sendIRKMetricsReport = 1;
  v12 = *((unsigned int *)v41 + 6);
  if (dword_100131788 <= v12)
  {
    if (dword_100131788 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131788, *((unsigned int *)v41 + 6)))
        goto LABEL_15;
      v12 = *((unsigned int *)v41 + 6);
    }
    v13 = -[NSMutableDictionary count](self->_familyAccountIdentityMap, "count");
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilySyncing]", v12, "Updated family account syncing: Total %d, Removed %d, Refresh %d, Retry %d, Later %d, Request %d, Failed %d\n", v13, *((_DWORD *)v37 + 6), *((_DWORD *)v33 + 6), *((_DWORD *)v29 + 6), *((_DWORD *)v25 + 6), *((_DWORD *)v21 + 6), *((_DWORD *)v17 + 6));
  }
LABEL_15:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)receivedFamilyIdentityRequest:(id)a3 msgCtx:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fromID"));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v9 = self->_familyAccountIdentityMap;
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v7));

      if (v11)
      {
        TypeID = CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v15, CFSTR("_idsID"), TypeID, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (v14)
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]", 30, "Received family identity request: from '%{mask}', IDS '%.8@'\n", v7, v14);
          }
          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 4, v14, v7, 0, v15);
          -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](self, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", 33, v8, 0, v6);
        }
        else if (dword_100131788 <= 60
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]", 60, "### Ignoring family identity request with no IDS device ID\n");
        }

      }
      else if (dword_100131788 <= 60
             && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]", 60, "### Ignoring family identity request from unknown peer: '%{mask}'\n", v7);
      }
    }
    else
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]", 30, "Buffering family identity request before ready: '%{mask}'\n", v7);
      }
      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v15, 32, v6);
    }

  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]", 30, "Buffering family identity request before FirstUnlock: '%{mask}'\n", v7);
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v15, 32, v6);
  }

}

- (void)receivedFamilyIdentityResponse:(id)a3 msgCtx:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleID"));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v8 = self->_familyAccountIdentityMap;
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v7));
      if (v10)
      {
        TypeID = CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v16, CFSTR("_idsID"), TypeID, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (v13)
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]", 30, "Received family identity response: from '%{mask}', IDS '%.8@'\n", v7, v13);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v10, "setDateAcknowledged:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
          objc_msgSend(v15, "saveIdentity:error:", v10, 0);

          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 4, v13, v7, 0, v16);
        }
        else if (dword_100131788 <= 60
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]", 60, "### Ignoring family identity response with no IDS device ID\n");
        }

      }
      else if (dword_100131788 <= 60
             && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]", 60, "### Ignoring family identity response from unknown peer: '%{mask}'\n", v7);
      }

    }
    else
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]", 30, "Buffering family identity response before ready: '%{mask}'\n", v7);
      }
      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v16, 33, v6);
    }

  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]", 30, "Buffering family identity response before FirstUnlock: '%{mask}'\n", v7);
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v16, 33, v6);
  }

}

- (void)receivedFamilyIdentityUpdate:(id)a3 msgCtx:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleID"));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v8 = self->_familyAccountIdentityMap;
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v7));

      if (v10)
      {
        TypeID = CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v14, CFSTR("_idsID"), TypeID, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (v13)
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]", 30, "Received family identity update: from '%{mask}', IDS '%.8@'\n", v7, v13);
          }
          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:](self, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 4, v13, v7, 0, v14);
        }
        else if (dword_100131788 <= 60
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]", 60, "### Ignoring family identity update with no IDS device ID\n");
        }

      }
      else if (dword_100131788 <= 60
             && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]", 60, "### Ignoring family identity update from unknown peer: '%{mask}'\n", v7);
      }
    }
    else
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]", 30, "Buffering family identity update before ready: '%{mask}'\n", v7);
      }
      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v14, 34, v6);
    }

  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]", 30, "Buffering family identity update before FirstUnlock: '%{mask}'\n", v7);
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v14, 34, v6);
  }

}

- (void)_updateFamilyNotification
{
  NSMutableDictionary *familyDeviceIdentityMap;
  unint64_t familyFlags;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  int v8;
  int *p_familyNotifyToken;
  int familyNotifyToken;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  if (-[NSMutableDictionary count](self->_familyDeviceIdentityMap, "count"))
    v13[3] |= 2uLL;
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008A5F8;
  v11[3] = &unk_1001143C8;
  v11[4] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyDeviceIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v11);
  familyFlags = self->_familyFlags;
  v5 = v13;
  v6 = v13[3];
  if (v6 != familyFlags)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        v7 = _LogCategory_Initialize(&dword_100131788, 30);
        v5 = v13;
        if (!v7)
          goto LABEL_8;
        v6 = v13[3];
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyNotification]", 30, "Family flags changed: %#ll{flags} -> %#ll{flags}\n", familyFlags, &unk_10010B177, v6, &unk_10010B177);
      v5 = v13;
    }
LABEL_8:
    familyNotifyToken = self->_familyNotifyToken;
    p_familyNotifyToken = &self->_familyNotifyToken;
    v8 = familyNotifyToken;
    *((_QWORD *)p_familyNotifyToken - 1) = v5[3];
    if (familyNotifyToken == -1)
    {
      notify_register_check("com.apple.rapport.familyFlagsChanged", p_familyNotifyToken);
      v8 = *p_familyNotifyToken;
      v5 = v13;
    }
    notify_set_state(v8, v5[3]);
    notify_post("com.apple.rapport.familyFlagsChanged");
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_friendsEnsureStarted
{
  CUCoalescer *v3;
  CUCoalescer *privacyChangedCoalescer;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  _QWORD v7[5];

  -[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded](self, "_friendsUpdateSuggestedIfNeeded");
  -[RPPeopleDaemon _updateFriendIdentities](self, "_updateFriendIdentities");
  if (!self->_privacyChangedCoalescer
    && self->_prefPrivacyCoalesceMinSecs > 0.0
    && self->_prefPrivacyCoalesceMaxSecs > 0.0)
  {
    v3 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    privacyChangedCoalescer = self->_privacyChangedCoalescer;
    self->_privacyChangedCoalescer = v3;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008A784;
    v7[3] = &unk_1001110F8;
    v7[4] = self;
    -[CUCoalescer setActionHandler:](self->_privacyChangedCoalescer, "setActionHandler:", v7);
    -[CUCoalescer setDispatchQueue:](self->_privacyChangedCoalescer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](self->_privacyChangedCoalescer, "setMinDelay:", self->_prefPrivacyCoalesceMinSecs);
    -[CUCoalescer setMaxDelay:](self->_privacyChangedCoalescer, "setMaxDelay:", self->_prefPrivacyCoalesceMaxSecs);
  }
  if (self->_privacyChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10008A78C;
    v6[3] = &unk_1001115C8;
    v6[4] = self;
    notify_register_dispatch("com.apple.sharing.privacy-changed", &self->_privacyChangedNotifyToken, dispatchQueue, v6);
    -[CUCoalescer trigger](self->_privacyChangedCoalescer, "trigger");
  }
}

- (void)_friendsEnsureStopped
{
  NSMutableDictionary *friendAccountIdentityMap;
  NSMutableDictionary *friendDeviceIdentityMap;
  NSArray *friendsSuggestedArray;
  int friendsSuggestedNotifyToken;
  CUCoalescer *privacyChangedCoalescer;
  int privacyChangedNotifyToken;
  OS_dispatch_source *friendsSuggestedPollTimer;
  OS_dispatch_source *v10;
  NSObject *v11;

  -[NSMutableDictionary removeAllObjects](self->_friendAccountIdentityMap, "removeAllObjects");
  friendAccountIdentityMap = self->_friendAccountIdentityMap;
  self->_friendAccountIdentityMap = 0;

  -[NSMutableDictionary removeAllObjects](self->_friendDeviceIdentityMap, "removeAllObjects");
  friendDeviceIdentityMap = self->_friendDeviceIdentityMap;
  self->_friendDeviceIdentityMap = 0;

  friendsSuggestedArray = self->_friendsSuggestedArray;
  self->_friendsSuggestedArray = 0;

  self->_friendsSuggestedNeedsUpdate = 0;
  friendsSuggestedNotifyToken = self->_friendsSuggestedNotifyToken;
  if (friendsSuggestedNotifyToken != -1)
  {
    notify_cancel(friendsSuggestedNotifyToken);
    self->_friendsSuggestedNotifyToken = -1;
  }
  -[CUCoalescer invalidate](self->_privacyChangedCoalescer, "invalidate");
  privacyChangedCoalescer = self->_privacyChangedCoalescer;
  self->_privacyChangedCoalescer = 0;

  privacyChangedNotifyToken = self->_privacyChangedNotifyToken;
  if (privacyChangedNotifyToken != -1)
  {
    notify_cancel(privacyChangedNotifyToken);
    self->_privacyChangedNotifyToken = -1;
  }
  friendsSuggestedPollTimer = self->_friendsSuggestedPollTimer;
  if (friendsSuggestedPollTimer)
  {
    v11 = friendsSuggestedPollTimer;
    dispatch_source_cancel(v11);
    v10 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = 0;

  }
}

- (void)_friendsUpdateSuggestedIfNeeded
{
  int friendsSuggestedNotifyToken;
  int *p_friendsSuggestedNotifyToken;
  int prefFriendSuggestMax;
  NSObject *dispatchQueue;
  int prefFriendSuggestPollSeconds;
  OS_dispatch_source *friendsSuggestedPollTimer;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  id v14;
  id v15;
  SEL v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[6];
  _QWORD handler[5];

  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) == 0)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Deferring friend update suggested until FirstUnlock\n");
    }
    return;
  }
  p_friendsSuggestedNotifyToken = &self->_friendsSuggestedNotifyToken;
  friendsSuggestedNotifyToken = self->_friendsSuggestedNotifyToken;
  prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (prefFriendSuggestMax < 1)
  {
    if (friendsSuggestedNotifyToken != -1)
    {
      if (dword_100131788 > 30)
        goto LABEL_25;
      if (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30))
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends suggest notify stop\n");
      friendsSuggestedNotifyToken = *p_friendsSuggestedNotifyToken;
      if (*p_friendsSuggestedNotifyToken != -1)
      {
LABEL_25:
        notify_cancel(friendsSuggestedNotifyToken);
        *p_friendsSuggestedNotifyToken = -1;
      }
    }
LABEL_26:
    friendsSuggestedPollTimer = self->_friendsSuggestedPollTimer;
    if (!friendsSuggestedPollTimer)
      goto LABEL_34;
    if (dword_100131788 >= 31)
    {
      v9 = friendsSuggestedPollTimer;
    }
    else
    {
      if (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30))
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends suggest poll stop\n");
      v9 = self->_friendsSuggestedPollTimer;
      if (!v9)
      {
LABEL_34:
        if (prefFriendSuggestMax < 1)
          return;
        goto LABEL_38;
      }
    }
    dispatch_source_cancel((dispatch_source_t)v9);
    v10 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = 0;

    goto LABEL_34;
  }
  if (friendsSuggestedNotifyToken == -1)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends suggest notify start\n");
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10008AE0C;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch("com.apple.PeopleSuggester.ReQuery", &self->_friendsSuggestedNotifyToken, dispatchQueue, handler);
  }
  prefFriendSuggestPollSeconds = self->_prefFriendSuggestPollSeconds;
  if (prefFriendSuggestPollSeconds < 1)
    goto LABEL_26;
  if (!self->_friendsSuggestedPollTimer)
  {
    if (dword_100131788 <= 30)
    {
      if (dword_100131788 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131788, 30))
          goto LABEL_37;
        prefFriendSuggestPollSeconds = self->_prefFriendSuggestPollSeconds;
      }
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends suggest poll start: %d seconds\n", prefFriendSuggestPollSeconds);
    }
LABEL_37:
    v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v12 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = v11;
    v13 = v11;

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008AEA4;
    v20[3] = &unk_100111928;
    v20[4] = v13;
    v20[5] = self;
    dispatch_source_set_event_handler(v13, v20);
    CUDispatchTimerSet(v13, (double)self->_prefFriendSuggestPollSeconds, (double)self->_prefFriendSuggestPollSeconds, 1.0);
    dispatch_activate(v13);

  }
LABEL_38:
  if (!self->_friendsSuggestedGetting && (!self->_friendsSuggestedArray || self->_friendsSuggestedNeedsUpdate))
  {
    v14 = objc_alloc_init(off_100131808());
    objc_msgSend(v14, "setDispatchQueue:", self->_dispatchQueue);
    v15 = objc_alloc_init(off_100131810());
    objc_msgSend(v15, "setMaxPeople:", self->_prefFriendSuggestMax);
    v16 = NSSelectorFromString(CFSTR("excludeBackfills"));
    if ((objc_opt_respondsToSelector(v15, v16) & 1) != 0)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends update suggested - no backfills\n");
      }
      objc_msgSend(v15, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("excludeBackfills"));
    }
    else
    {
      if (dword_100131788 > 30)
      {
LABEL_54:
        *(_WORD *)&self->_friendsSuggestedGetting = 1;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10008AF44;
        v18[3] = &unk_1001130D8;
        v18[4] = self;
        v19 = v14;
        v17 = v14;
        objc_msgSend(v17, "getPeopleSuggestions:completion:", v15, v18);

        return;
      }
      if (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30))
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends update suggested didn't find backfills selector\n");
    }
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]", 30, "Friends update suggested get: max %d\n", self->_prefFriendSuggestMax);
    }
    goto LABEL_54;
  }
}

- (id)getFriendDeviceIdentities
{
  return -[NSMutableDictionary allValues](self->_friendDeviceIdentityMap, "allValues");
}

- (BOOL)_pruneFriends:(BOOL)a3
{
  _BOOL8 v3;
  CFAbsoluteTime Current;
  double pruneLastSeconds;
  double v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  v3 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (v3 || Current >= 584466893.0)
  {
    pruneLastSeconds = self->_pruneLastSeconds;
    if (pruneLastSeconds == 0.0)
    {
      pruneLastSeconds = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("frPruneLastSecs"), 0);
      self->_pruneLastSeconds = pruneLastSeconds;
    }
    v7 = vabdd_f64(Current, pruneLastSeconds);
    if (v3 || v7 >= 86400.0)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriends:]", 30, "Prune friends: Last %ll{dur}\n", (uint64_t)v7);
      }
      v9 = -[RPPeopleDaemon _pruneFriendAccounts:](self, "_pruneFriendAccounts:", v3);
      v10 = -[RPPeopleDaemon _pruneFriendDevices](self, "_pruneFriendDevices");
      self->_pruneLastSeconds = Current;
      CFPrefs_SetDouble(CFSTR("com.apple.rapport"), CFSTR("frPruneLastSecs"), Current);
      LOBYTE(v8) = v9 | v10;
    }
    else
    {
      if (dword_100131788 > 10)
        goto LABEL_13;
      if (dword_100131788 != -1 || (v8 = _LogCategory_Initialize(&dword_100131788, 10)) != 0)
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriends:]", 10, "Skipping prune friends: too soon, last %ll{dur}, min %{dur}\n", (uint64_t)v7, 86400);
        goto LABEL_13;
      }
    }
  }
  else
  {
    if (dword_100131788 > 30)
    {
LABEL_13:
      LOBYTE(v8) = 0;
      return v8;
    }
    if (dword_100131788 != -1 || (v8 = _LogCategory_Initialize(&dword_100131788, 30)) != 0)
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriends:]", 30, "Skipping prune friends: bad clock, %{DateCF}\n", *(_QWORD *)&Current);
      goto LABEL_13;
    }
  }
  return v8;
}

- (BOOL)_pruneFriendAccounts:(BOOL)a3
{
  int64_t prefFriendAccountPruneSeconds;
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  double Current;
  double v15;
  uint64_t v16;
  uint64_t v18;
  int64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
  if (a3 || prefFriendAccountPruneSeconds > 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendAccountIdentityMap, "allKeys"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v6)
    {
      v8 = 0;
      goto LABEL_39;
    }
    v7 = v6;
    v19 = prefFriendAccountPruneSeconds;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_friendAccountIdentityMap, "objectForKeyedSubscript:", v11));
        if (!objc_msgSend(v11, "length"))
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendAccounts:]", 30, "Prune friend account identity with empty identifier: %@\n", v12);
          }
          goto LABEL_34;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateRemoved"));
        if (v13)
        {
          Current = CFAbsoluteTimeGetCurrent();
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          v16 = (uint64_t)(Current - v15);
          if (v19 <= v16)
          {
            if (dword_100131788 <= 30
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
            {
              LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendAccounts:]", 30, "Prune friend account identity: %ll{dur}, %@\n", v16, v12);
            }

LABEL_34:
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v11);
            v8 = 1;
            self->_needsFriendAccountUpdate = 1;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
            objc_msgSend(v13, "removeIdentity:error:", v12, 0);
            goto LABEL_35;
          }
          if (dword_100131788 <= 9
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 9)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendAccounts:]", 9, "Skipping prune friend account identity: premature, %ll{dur}, %@\n", v16, v12);
          }
        }
        else if (dword_100131788 <= 8
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 8)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendAccounts:]", 8, "Skipping prune friend account identity: active, %@\n", v12, v18);
        }
LABEL_35:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v7)
      {
LABEL_39:

        return v8;
      }
    }
  }
  if (dword_100131788 <= 10 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendAccounts:]", 10, "Skipping prune friend accounts: invalid prune seconds %lld\n", prefFriendAccountPruneSeconds);
  return 0;
}

- (BOOL)_pruneFriendDevices
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendDeviceIdentityMap, "allKeys"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_friendDeviceIdentityMap, "objectForKeyedSubscript:", v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountID"));
        if (v10
          && (v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_friendAccountIdentityMap, "objectForKeyedSubscript:", v10))) != 0)
        {
          v12 = (void *)v11;
          if (dword_100131788 <= 8
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 8)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendDevices]", 8, "Skipping prune friend device identity: active, %@, %@\n", v9, v12);
          }
        }
        else
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFriendDevices]", 30, "Prune friend device identity: %@\n", v9);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", 0, v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
          objc_msgSend(v13, "removeIdentity:error:", v9, 0);

          v12 = 0;
          v5 = 1;
        }

        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v4 = v14;
    }
    while (v14);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (void)_resetFriends
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendAccountIdentityMap, "allKeys"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_friendAccountIdentityMap, "objectForKeyedSubscript:", v8));
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _resetFriends]", 30, "Delete friend account identity for reset: %@\n", v9);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v8);
        self->_needsFriendAccountUpdate = 1;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        objc_msgSend(v10, "removeIdentity:error:", v9, 0);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendDeviceIdentityMap, "allKeys"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_friendDeviceIdentityMap, "objectForKeyedSubscript:", v16));
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _resetFriends]", 30, "Delete friend device identity for reset: %@\n", v17);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", 0, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        objc_msgSend(v18, "removeIdentity:error:", v17, 0);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  -[RPPeopleDaemon _update](self, "_update");
}

- (BOOL)_shouldThrottleFriendSyncing
{
  int prefFriendSuggestMax;

  prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (prefFriendSuggestMax >= 33
    && dword_100131788 <= 30
    && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
  {
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _shouldThrottleFriendSyncing]", 30, "Friend sync throttling is enabled\n");
  }
  return prefFriendSuggestMax > 32;
}

- (void)_updateFriendIdentities
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  id v6;

  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    v3 = -[RPPeopleDaemon _updateFriendAccounts](self, "_updateFriendAccounts");
    v4 = -[RPPeopleDaemon _updateFriendDevices](self, "_updateFriendDevices") + v3;
    v5 = -[RPPeopleDaemon _pruneFriends:](self, "_pruneFriends:", 0) << 31 >> 31;
    -[RPPeopleDaemon _processBufferedCloudMessages](self, "_processBufferedCloudMessages");
    -[RPPeopleDaemon _updateFriendSyncing](self, "_updateFriendSyncing");
    if (v4 != v5)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v6, "postDaemonInfoChanges:", 128);

    }
  }
  else if (dword_100131788 <= 30
         && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
  {
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendIdentities]", 30, "Deferring friend account identities update until FirstUnlock\n");
  }
}

- (BOOL)_updateFriendAccounts
{
  NSMutableDictionary *v3;
  NSMutableDictionary *friendAccountIdentityMap;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int maxNumDuetSuggestions;
  signed int v14;
  int v15;
  CFAbsoluteTime Current;
  NSMutableDictionary *v17;
  id v18;
  NSArray *v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *k;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  NSMutableDictionary *v34;
  int v35;
  int v37;
  NSArray *v38;
  NSArray *obj;
  uint64_t v40;
  id v41;
  int v42;
  id v43;
  uint64_t v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];

  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  if (!self->_friendAccountIdentityMap)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    friendAccountIdentityMap = self->_friendAccountIdentityMap;
    self->_friendAccountIdentityMap = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v63 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identitiesOfType:error:", 5, &v63));
    v43 = v63;

    if (!v6
      && dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendAccounts]", 90, "### Load friend account identities failed: %{error}\n", v43);
    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          if (v12)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", v11, v12);
            if (dword_100131788 <= 30
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
            {
              LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendAccounts]", 30, "Loaded friend account identity: %@\n", v11);
            }
            *((_BYTE *)v65 + 24) = 1;
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v8);
    }

    self->_needsFriendAccountUpdate = 1;
  }
  v38 = self->_friendsSuggestedArray;
  if (!v38)
  {
    ++self->_irkMetrics.duetNotQueried;
    self->_sendIRKMetricsReport = 1;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendAccounts]", 30, "Deferring friend account identities update until friends suggested ready\n");
    }
    goto LABEL_62;
  }
  maxNumDuetSuggestions = self->_irkMetrics.maxNumDuetSuggestions;
  v14 = -[NSArray count](self->_friendsSuggestedArray, "count");
  if (maxNumDuetSuggestions <= v14)
    v15 = v14;
  else
    v15 = maxNumDuetSuggestions;
  self->_irkMetrics.maxNumDuetSuggestions = v15;
  self->_sendIRKMetricsReport = 1;
  if (!self->_needsFriendAccountUpdate)
  {
LABEL_62:
    v35 = *((unsigned __int8 *)v65 + 24);
    goto LABEL_63;
  }
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendAccounts]", 30, "Updating friend account identities");
  self->_needsFriendAccountUpdate = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v17 = self->_friendAccountIdentityMap;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10008C39C;
  v58[3] = &unk_100114438;
  *(CFAbsoluteTime *)&v58[4] = Current;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v58);
  v18 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSArray count](v38, "count"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = v38;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j), "contactID"));
        objc_msgSend(v18, "addObject:", v23);

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    }
    while (v20);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v19;
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
  if (v41)
  {
    v37 = 0;
    v40 = *(_QWORD *)v51;
LABEL_42:
    v44 = 0;
    v42 = v37;
    v37 += (int)v41;
    while (1)
    {
      if (*(_QWORD *)v51 != v40)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v44);
      if ((objc_opt_respondsToSelector(v24, "sendersKnownAlias") & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sendersKnownAlias"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_stripFZIDPrefix"));

      }
      else
      {
        v26 = 0;
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "handles"));
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v28; k = (char *)k + 1)
          {
            if (*(_QWORD *)v47 != v29)
              objc_enumerationMutation(v27);
            v31 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contactID"));
            LODWORD(v31) = -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:](self, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:", v31, v32, v26, 0, 0, v18);

            if ((_DWORD)v31)
              *((_BYTE *)v65 + 24) = 1;
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
        }
        while (v28);
      }

      v33 = ++v42 < self->_prefFriendSuggestMax;
      if (!v33)
        break;
      if ((id)++v44 == v41)
      {
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
        if (v41)
          goto LABEL_42;
        break;
      }
    }
  }

  v34 = self->_friendAccountIdentityMap;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10008C41C;
  v45[3] = &unk_1001143C8;
  v45[4] = &v64;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v34, "enumerateKeysAndObjectsUsingBlock:", v45);
  v35 = *((unsigned __int8 *)v65 + 24);

LABEL_63:
  _Block_object_dispose(&v64, 8);
  return v35 != 0;
}

- (unsigned)_updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4 sendersKnownAlias:(id)a5 userAdded:(BOOL)a6 updateDateRequested:(BOOL)a7 suggestedContactIDs:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSMutableDictionary *friendAccountIdentityMap;
  NSMutableDictionary *v56;
  NSMutableDictionary *v57;
  void *v58;
  id v60;
  id v61;
  RPPeopleDaemon *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v18 = CUNormalizeEmailAddress(v14, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0));
  if (objc_msgSend(v20, "caseInsensitiveCompare:", v19))
  {
    v63 = v10;
    v64 = v20;
    v62 = self;
    v21 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_friendAccountIdentityMap, "objectForKeyedSubscript:", v19));
    if (v21)
    {
      v22 = (id)v21;
      v23 = 0;
    }
    else
    {
      v22 = objc_alloc_init((Class)RPIdentity);
      v23 = 2048;
    }
    objc_msgSend(v22, "setPresent:", 1);
    if (objc_msgSend(v15, "length"))
    {
      v24 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contactID"));
      if (objc_msgSend(v25, "isEqual:", v15))
      {

      }
      else
      {
        v60 = v16;
        v26 = v14;
        v27 = v15;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contactID"));
        v29 = objc_msgSend(v17, "containsObject:", v28);

        if ((v29 & 1) != 0)
        {
          v15 = v27;
        }
        else
        {
          v15 = v27;
          objc_msgSend(v22, "setContactID:", v27);
          v23 = v23 | 0x8000;
        }
        v14 = v26;
        v16 = v60;
      }
      v9 = v24;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateAdded"));

    if (!v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v22, "setDateAdded:", v31);

      v23 = v23 | 2;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateRemoved"));

    if (v32)
    {
      objc_msgSend(v22, "setDateRemoved:", 0);
      v23 = v23 | 2;
    }
    if (v9)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v22, "setDateRequested:", v33);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
    v35 = objc_msgSend(v34, "isEqual:", v19);

    if ((v35 & 1) == 0)
    {
      objc_msgSend(v22, "setIdentifier:", v19);
      v23 = v23 | 0x2020;
    }
    v36 = v16;
    if (!v16)
      goto LABEL_48;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allUsedSendersKnownAliases"));

    v61 = v15;
    if (!v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sendersKnownAlias"));

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sendersKnownAlias"));
        v65 = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
        objc_msgSend(v22, "setAllUsedSendersKnownAliases:", v40);

      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
        objc_msgSend(v22, "setAllUsedSendersKnownAliases:", v39);
      }

    }
    if (!objc_msgSend(v36, "length"))
    {
LABEL_48:

      if (objc_msgSend(v22, "type") != 5)
      {
        objc_msgSend(v22, "setType:", 5);
        v23 = v23 | 0x200;
      }
      if (v63 && (objc_msgSend(v22, "userAdded") & 1) == 0)
      {
        objc_msgSend(v22, "setUserAdded:", 1);
        v23 = v23 | 0x4000;
      }
      if ((v23 & 0x800) != 0)
      {
        friendAccountIdentityMap = v62->_friendAccountIdentityMap;
        if (!friendAccountIdentityMap)
        {
          v56 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v57 = v62->_friendAccountIdentityMap;
          v62->_friendAccountIdentityMap = v56;

          friendAccountIdentityMap = v62->_friendAccountIdentityMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](friendAccountIdentityMap, "setObject:forKeyedSubscript:", v22, v19);
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]", 30, "Added friend account identity: %@\n", v22);
        }
      }
      else
      {
        if (!(_DWORD)v23)
        {
          if (dword_100131788 <= 10
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]", 10, "Unchanged friend account identity: %@\n", v22);
          }
          goto LABEL_71;
        }
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]", 30, "Updated friend account identity: %@, %#{flags}\n", v22, v23, &unk_10010B192);
        }
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v58, "saveIdentity:error:", v22, 0);

LABEL_71:
      v20 = v64;
      goto LABEL_72;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sendersKnownAlias"));
    v42 = v36;
    v43 = v41;
    if (v43 == v42)
    {

      goto LABEL_40;
    }
    v44 = v43;
    if (v43)
    {
      v45 = objc_msgSend(v42, "isEqual:", v43);

      if ((v45 & 1) != 0)
      {
LABEL_40:
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allUsedSendersKnownAliases"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sendersKnownAlias"));
        v48 = objc_msgSend(v46, "containsObject:", v47);

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v62->_friendDeviceIdentityMap, "allKeys"));
        v50 = objc_msgSend(v49, "containsObject:", v14);

        if ((v48 & 1) == 0 && (v50 & 1) == 0)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allUsedSendersKnownAliases"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v51));

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sendersKnownAlias"));
          objc_msgSend(v52, "addObject:", v53);

          v54 = objc_msgSend(v52, "copy");
          objc_msgSend(v22, "setAllUsedSendersKnownAliases:", v54);

          v23 = v23 | 0x1000000;
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]", 30, "updateFriendIdentity: priming friend account with updated SKA for IRK exchange retry\n");
          }
          objc_msgSend(v22, "setDateRequested:", 0);

        }
        v15 = v61;
        goto LABEL_48;
      }
    }
    else
    {

    }
    objc_msgSend(v22, "setSendersKnownAlias:", v42);
    v23 = v23 | 0x40000;
    goto LABEL_40;
  }
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]", 30, "Ignoring local friend identity update of ourself\n");
  LODWORD(v23) = 0;
LABEL_72:

  return v23;
}

- (BOOL)updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4
{
  return -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:](self, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:", a3, a4, 0, 1, 1, 0) != 0;
}

- (BOOL)_updateFriendDevices
{
  BOOL v2;
  NSMutableDictionary *v4;
  NSMutableDictionary *friendDeviceIdentityMap;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  if (self->_friendDeviceIdentityMap)
    return 0;
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  friendDeviceIdentityMap = self->_friendDeviceIdentityMap;
  self->_friendDeviceIdentityMap = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadFriendDeviceIdentitiesWithError:", &v22));
  v8 = v22;

  if (!v7
    && dword_100131788 <= 90
    && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
  {
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendDevices]", 90, "### Load friend device identities failed: %{error}\n", v8);
  }
  v17 = v8;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v2 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        if (v15)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", v14, v15);
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendDevices]", 30, "Loaded friend device identity: %@\n", v14, v17, (_QWORD)v18);
          }
          v2 = 1;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_updateFriendPrivacy
{
  id v3;
  NSMutableDictionary *friendAccountIdentityMap;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  if (!self->_friendPrivacyGetting)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    friendAccountIdentityMap = self->_friendAccountIdentityMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008D06C;
    v10[3] = &unk_100114460;
    v10[4] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](friendAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v10);
    if (objc_msgSend(v3, "count"))
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacy]", 30, "Friend privacy get: %d contacts\n", objc_msgSend(v3, "count"));
      }
      v5 = objc_alloc_init(off_100131808());
      objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
      v6 = objc_alloc_init(off_100131810());
      objc_msgSend(v6, "setContactIDs:", v3);
      self->_friendPrivacyGetting = 1;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10008D0B8;
      v8[3] = &unk_1001130D8;
      v8[4] = self;
      v9 = v5;
      v7 = v5;
      objc_msgSend(v7, "getPeopleSuggestions:completion:", v6, v8);

    }
    else if (dword_100131788 <= 30
           && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacy]", 30, "Friend privacy get: skipping, no contacts\n");
    }

  }
}

- (void)_updateFriendPrivacyResults:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  NSMutableDictionary *friendAccountIdentityMap;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSArray *friendsSuggestedArray;
  char v17;
  id obj;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v4)
  {
    v17 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactID"));
        if (!v9)
        {

          goto LABEL_31;
        }
        v26 = 0;
        v27 = &v26;
        v28 = 0x3032000000;
        v29 = sub_10000F9D8;
        v30 = sub_10000F978;
        v31 = 0;
        v20 = 0;
        v21 = &v20;
        v22 = 0x3032000000;
        v23 = sub_10000F9D8;
        v24 = sub_10000F978;
        v25 = 0;
        friendAccountIdentityMap = self->_friendAccountIdentityMap;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10008D60C;
        v19[3] = &unk_100114488;
        v19[4] = v9;
        v19[5] = &v26;
        v19[6] = &v20;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](friendAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v19);
        if (v27[5] && v21[5])
        {
          v11 = objc_msgSend(v8, "flags");
          if ((v11 & 3) != 0)
          {
            if (dword_100131788 <= 30
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
            {
              LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacyResults:]", 30, "Friend account identity privacy: delete, %@, %#{flags}\n", v27[5], v11, &unk_10010B28D);
            }
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "dateRequested"));

            v13 = v12 != 0;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v21[5]);
            self->_needsFriendAccountUpdate = 1;
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
            objc_msgSend(v14, "removeIdentity:error:", v27[5], 0);

            -[RPPeopleDaemon _pruneFriendDevices](self, "_pruneFriendDevices");
            v17 |= v13;
            v5 = 1;
          }
        }
        else if (dword_100131788 <= 30
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacyResults:]", 30, "Friend account identity privacy: not found, %@\n", v9);
        }
        _Block_object_dispose(&v20, 8);

        _Block_object_dispose(&v26, 8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v4)
        continue;
      break;
    }

    if ((v5 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v15, "postDaemonInfoChanges:", 128);

    }
    if ((v17 & 1) != 0)
    {
      if (self->_prefDisableSelfIdentityRolling)
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacyResults:]", 30, "Press demo mode enabled, not rolling self identity");
        }
      }
      else
      {
        friendsSuggestedArray = self->_friendsSuggestedArray;
        self->_friendsSuggestedArray = 0;

        -[RPPeopleDaemon _regenerateSelfIdentity:](self, "_regenerateSelfIdentity:", CFSTR("Friend Blocked/Removed"));
      }
    }
  }
  else
  {

  }
LABEL_31:

}

- (void)_updateFriendSyncing
{
  double Double;
  double v4;
  double v5;
  double Current;
  uint64_t v7;
  double v8;
  unsigned int v9;
  char v10;
  double friendRequestMaxReachedLastSeconds;
  double v12;
  NSMutableDictionary *friendAccountIdentityMap;
  double v14;
  int maxNumFriendAccounts;
  signed int v16;
  int v17;
  int maxNumFriendDevices;
  signed int v19;
  int v20;
  unsigned int v21;
  _QWORD v22[16];
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  _QWORD v64[3];
  int v65;

  if (self->_prefFriendSyncDelaySeconds < 0)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: skipping when disabled via delay\n");
    }
  }
  else
  {
    Double = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("pdFriendSyncStart"), 0);
    if (Double < 0.0)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: skipping when disabled via negative start seconds, resetting to 0\n");
      }
      Current = CFAbsoluteTimeGetCurrent();
      goto LABEL_23;
    }
    v4 = Double;
    v5 = CFAbsoluteTimeGetCurrent();
    Current = v5;
    if (v4 > 0.0 && vabdd_f64(v4, v5) > 2592000.0)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: resetting out-of-range start seconds: %f\n", v4 - Current);
      }
      goto LABEL_23;
    }
    if (v4 == 0.0)
    {
LABEL_23:
      v7 = arc4random() % 0x2A301 + 86400;
      v8 = Current + (double)v7;
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: initial delay: %{DateCF}, %{dur}\n", *(_QWORD *)&v8, v7);
      }
      CFPrefs_SetDouble(CFSTR("com.apple.rapport"), CFSTR("pdFriendSyncStart"), v8);
      return;
    }
    if (v4 <= v5)
    {
      v9 = -[RPPeopleDaemon _shouldThrottleFriendSyncing](self, "_shouldThrottleFriendSyncing");
      v10 = v9;
      if (!v9)
        goto LABEL_32;
      friendRequestMaxReachedLastSeconds = self->_friendRequestMaxReachedLastSeconds;
      if (friendRequestMaxReachedLastSeconds == 0.0)
      {
        friendRequestMaxReachedLastSeconds = CFPrefs_GetDouble(CFSTR("com.apple.rapport"), CFSTR("frMaxReachedLastSecs"), 0);
        self->_friendRequestMaxReachedLastSeconds = friendRequestMaxReachedLastSeconds;
      }
      v12 = vabdd_f64(Current, friendRequestMaxReachedLastSeconds);
      if (v12 < 3300.0)
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: too soon since last time max reaached; last %ll{dur}, min %{dur}\n",
            (uint64_t)v12,
            3300);
        }
      }
      else
      {
LABEL_32:
        v64[0] = 0;
        v64[1] = v64;
        v64[2] = 0x2020000000;
        v65 = 10;
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x2020000000;
        v59 = 0;
        v52 = 0;
        v53 = &v52;
        v54 = 0x2020000000;
        v55 = 0;
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v51 = 0;
        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 0;
        v40 = 0;
        v41 = &v40;
        v42 = 0x2020000000;
        v43 = 0;
        v36 = 0;
        v37 = &v36;
        v38 = 0x2020000000;
        v39 = 0;
        v32 = 0;
        v33 = &v32;
        v34 = 0x2020000000;
        v35 = 0;
        v28 = 0;
        v29 = &v28;
        v30 = 0x2020000000;
        v31 = 0;
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        friendAccountIdentityMap = self->_friendAccountIdentityMap;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10008DE3C;
        v22[3] = &unk_1001144B0;
        v22[6] = &v24;
        v22[7] = &v36;
        v22[4] = self;
        v22[5] = &v60;
        v22[8] = &v32;
        v22[9] = &v48;
        v22[10] = &v56;
        v22[11] = &v52;
        v22[12] = v64;
        v22[13] = &v40;
        v22[14] = &v44;
        v22[15] = &v28;
        v23 = v10;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](friendAccountIdentityMap, "enumerateKeysAndObjectsUsingBlock:", v22);
        if (*((_BYTE *)v25 + 24))
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: max requests reached\n");
          }
          v14 = CFAbsoluteTimeGetCurrent();
          self->_friendRequestMaxReachedLastSeconds = v14;
          CFPrefs_SetDouble(CFSTR("com.apple.rapport"), CFSTR("frMaxReachedLastSecs"), v14);
        }
        maxNumFriendAccounts = self->_irkMetrics.maxNumFriendAccounts;
        v16 = -[NSMutableDictionary count](self->_friendAccountIdentityMap, "count");
        if (maxNumFriendAccounts <= v16)
          v17 = v16;
        else
          v17 = maxNumFriendAccounts;
        self->_irkMetrics.maxNumFriendAccounts = v17;
        maxNumFriendDevices = self->_irkMetrics.maxNumFriendDevices;
        v19 = -[NSMutableDictionary count](self->_friendDeviceIdentityMap, "count");
        if (maxNumFriendDevices <= v19)
          v20 = v19;
        else
          v20 = maxNumFriendDevices;
        self->_irkMetrics.maxNumFriendDevices = v20;
        self->_sendIRKMetricsReport = 1;
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          v21 = -[NSMutableDictionary count](self->_friendAccountIdentityMap, "count");
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: updated accounts: Total %d, Removed %d, Refresh %d, One-Time Refresh %d, Missing SendersKnownAlias %d, Retry %d, Later %d, Request %d, Failed %d, OverMax %d\n", v21, *((_DWORD *)v61 + 6), *((_DWORD *)v57 + 6), *((_DWORD *)v33 + 6), *((_DWORD *)v29 + 6), *((_DWORD *)v53 + 6), *((_DWORD *)v49 + 6), *((_DWORD *)v45 + 6), *((_DWORD *)v41 + 6), *((_DWORD *)v37 + 6));
        }
        if (!self->_prefOneTimeDateRequestedResetCompleted)
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: completed the one time dateRequest refresh, setting pref accordingly");
          }
          CFPrefs_SetValue(CFSTR("com.apple.rapport"), CFSTR("oneTimeDateRequestedResetCompleted"), kCFBooleanTrue);
          self->_prefOneTimeDateRequestedResetCompleted = 1;
        }
        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(v64, 8);
      }
    }
    else if (dword_100131788 <= 30
           && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]", 30, "Friend sync: waiting for start: %{DateCF}, %{dur}\n", *(_QWORD *)&v4, (int)fmin(v4 - Current, 2147483650.0));
    }
  }
}

- (void)_irkMetricsSetup
{
  __int128 v2;

  self->_irkMetricsReportLock._os_unfair_lock_opaque = 0;
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *(_OWORD *)&self->_irkMetrics.selfIdentRolled = v2;
  *(_OWORD *)&self->_irkMetrics.requestsSent = v2;
  *(_OWORD *)&self->_irkMetrics.requestsIgnoredNoIDSDevice = v2;
  *(_QWORD *)&self->_irkMetrics.maxNumFamilyDevices = -1;
}

- (void)_fetchSameAccountIdentities
{
  void *v3;
  void *v4;
  int maxNumSelfDevices;
  signed int v6;
  int v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identitiesOfType:error:", 2, &v8));

  maxNumSelfDevices = self->_irkMetrics.maxNumSelfDevices;
  v6 = objc_msgSend(v4, "count");
  if (maxNumSelfDevices <= v6)
    v7 = v6;
  else
    v7 = maxNumSelfDevices;
  self->_irkMetrics.maxNumSelfDevices = v7;
  self->_sendIRKMetricsReport = 1;

}

- (void)reportIRKMetrics
{
  uint64_t v3;
  int selfIdentRolled;
  void *v5;
  int selfIdentRolledBlocked;
  void *v7;
  int duetNotQueried;
  void *v9;
  void *v10;
  int requestsSent;
  void *v12;
  void *v13;
  void *v14;
  int requestsIgnored;
  void *v16;
  int requestsIgnoredNoIDSDevice;
  void *v18;
  int requestsIgnoredSelfIdentReq;
  void *v20;
  int requestsIgnoredUnknownPeer;
  void *v22;
  int requestsAcked;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  id v28;

  -[RPPeopleDaemon _fetchSameAccountIdentities](self, "_fetchSameAccountIdentities");
  os_unfair_lock_lock(&self->_irkMetricsReportLock);
  if (self->_sendIRKMetricsReport)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    selfIdentRolled = self->_irkMetrics.selfIdentRolled;
    v28 = (id)v3;
    if ((selfIdentRolled & 0x80000000) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (selfIdentRolled + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v5, CFSTR("selfIdentRolled"));

    }
    selfIdentRolledBlocked = self->_irkMetrics.selfIdentRolledBlocked;
    if ((selfIdentRolledBlocked & 0x80000000) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (selfIdentRolledBlocked + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, CFSTR("selfIdentRolledBlocked"));

    }
    duetNotQueried = self->_irkMetrics.duetNotQueried;
    if ((duetNotQueried & 0x80000000) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (duetNotQueried + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v9, CFSTR("duetNotQueried"));

    }
    if ((self->_irkMetrics.maxNumDuetSuggestions & 0x80000000) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, CFSTR("numDuetSuggestions"));

    }
    requestsSent = self->_irkMetrics.requestsSent;
    if ((requestsSent & 0x80000000) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (requestsSent + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v12, CFSTR("requestsSent"));

    }
    if ((self->_irkMetrics.maxNumFriendAccounts & 0x80000000) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v13, CFSTR("numFriendAccounts"));

    }
    if ((self->_irkMetrics.maxNumFriendDevices & 0x80000000) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, CFSTR("numFriendDevices"));

    }
    requestsIgnored = self->_irkMetrics.requestsIgnored;
    if ((requestsIgnored & 0x80000000) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (requestsIgnored + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, CFSTR("requestsIgnored"));

    }
    requestsIgnoredNoIDSDevice = self->_irkMetrics.requestsIgnoredNoIDSDevice;
    if ((requestsIgnoredNoIDSDevice & 0x80000000) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (requestsIgnoredNoIDSDevice + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, CFSTR("requestsIgnoredNoIDSDevice"));

    }
    requestsIgnoredSelfIdentReq = self->_irkMetrics.requestsIgnoredSelfIdentReq;
    if ((requestsIgnoredSelfIdentReq & 0x80000000) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (requestsIgnoredSelfIdentReq + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("requestsIgnoredSelfIdentReq"));

    }
    requestsIgnoredUnknownPeer = self->_irkMetrics.requestsIgnoredUnknownPeer;
    if ((requestsIgnoredUnknownPeer & 0x80000000) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (requestsIgnoredUnknownPeer + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, CFSTR("requestsIgnoredUnknownPeer"));

    }
    requestsAcked = self->_irkMetrics.requestsAcked;
    if ((requestsAcked & 0x80000000) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (requestsAcked + 1)));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, CFSTR("requestsAcked"));

    }
    if ((self->_irkMetrics.maxNumFamilyDevices & 0x80000000) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("numFamilyDevices"));

    }
    if ((self->_irkMetrics.maxNumSelfDevices & 0x80000000) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("numSelfDevices"));

    }
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon reportIRKMetrics]", 30, "Friend sync: submitting IRK metrics to Core Analytics %@", v28);
    }
    CUMetricsLog(CFSTR("com.apple.rapport.metrics.irkexchange"), v28);
    *(_QWORD *)&self->_irkMetrics.maxNumFamilyDevices = -1;
    *(_QWORD *)&v27 = -1;
    *((_QWORD *)&v27 + 1) = -1;
    *(_OWORD *)&self->_irkMetrics.requestsSent = v27;
    *(_OWORD *)&self->_irkMetrics.requestsIgnoredNoIDSDevice = v27;
    *(_OWORD *)&self->_irkMetrics.selfIdentRolled = v27;
    self->_sendIRKMetricsReport = 0;
    os_unfair_lock_unlock(&self->_irkMetricsReportLock);

  }
  else
  {
    os_unfair_lock_unlock(&self->_irkMetricsReportLock);
  }
}

- (void)receivedFriendIdentityRequest:(id)a3 msgCtx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  RPPeopleDaemon *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fromID"));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("_idsID"), TypeID, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0));
      if (objc_msgSend(v13, "caseInsensitiveCompare:", v8))
      {
        v14 = objc_alloc_init(off_100131818());
        objc_msgSend(v14, "setEmailAddress:", v8);
        objc_msgSend(v14, "setPhoneNumber:", v8);
        v15 = objc_alloc_init(off_100131808());
        objc_msgSend(v15, "setDispatchQueue:", self->_dispatchQueue);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10008EAE0;
        v17[3] = &unk_1001144D8;
        v18 = v15;
        v19 = self;
        v20 = v8;
        v21 = v12;
        v22 = v6;
        v23 = v7;
        v24 = v9;
        v16 = v15;
        objc_msgSend(v16, "findContact:completion:", v14, v17);

      }
      else
      {
        ++self->_irkMetrics.requestsIgnored;
        ++self->_irkMetrics.requestsIgnoredSelfIdentReq;
        self->_sendIRKMetricsReport = 1;
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]", 30, "Ignoring friend identity request from ourself\n");
        }
      }

    }
    else
    {
      *(int32x2_t *)&self->_irkMetrics.requestsIgnored = vadd_s32(*(int32x2_t *)&self->_irkMetrics.requestsIgnored, (int32x2_t)0x100000001);
      self->_sendIRKMetricsReport = 1;
      if (dword_100131788 <= 60
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]", 60, "### Ignoring friend identity request with no IDS device ID\n");
      }
    }

  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]", 30, "Buffering friend identity request before FirstUnlock: '%{mask}'\n", v8);
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 64, v7);
  }

}

- (void)receivedFriendIdentityResponse:(id)a3 msgCtx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  RPPeopleDaemon *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appleID"));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("_idsID"), TypeID, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v11)
    {
      v12 = self->_friendAccountIdentityMap;
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0));
        if (objc_msgSend(v13, "caseInsensitiveCompare:", v8))
        {
          v14 = objc_alloc_init(off_100131818());
          objc_msgSend(v14, "setEmailAddress:", v8);
          objc_msgSend(v14, "setPhoneNumber:", v8);
          v15 = objc_alloc_init(off_100131808());
          objc_msgSend(v15, "setDispatchQueue:", self->_dispatchQueue);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10008EFAC;
          v17[3] = &unk_100114500;
          v18 = v15;
          v19 = v8;
          v20 = v11;
          v21 = v12;
          v22 = self;
          v23 = v6;
          v16 = v15;
          objc_msgSend(v16, "findContact:completion:", v14, v17);

        }
        else if (dword_100131788 <= 30
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]", 30, "Ignoring friend identity response from ourself\n");
        }

      }
      else
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]", 30, "Buffering friend identity response before ready: '%{mask}'\n", v8);
        }
        -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 65, v7);
      }

    }
    else if (dword_100131788 <= 60
           && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]", 60, "### Ignoring friend identity response with no IDS device ID\n");
    }

  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]", 30, "Buffering friend identity response before FirstUnlock: '%{mask}'\n", v8);
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 65, v7);
  }

}

- (void)receivedFriendIdentityUpdate:(id)a3 msgCtx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  void *v20;
  RPPeopleDaemon *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appleID"));
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("_idsID"), TypeID, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v11)
    {
      v12 = self->_friendAccountIdentityMap;
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0));
        if (objc_msgSend(v13, "caseInsensitiveCompare:", v8))
        {
          v14 = objc_alloc_init(off_100131818());
          objc_msgSend(v14, "setEmailAddress:", v8);
          objc_msgSend(v14, "setPhoneNumber:", v8);
          v15 = objc_alloc_init(off_100131808());
          objc_msgSend(v15, "setDispatchQueue:", self->_dispatchQueue);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10008F4C8;
          v17[3] = &unk_100114528;
          v18 = v15;
          v19 = v8;
          v20 = v11;
          v21 = self;
          v22 = v6;
          v16 = v15;
          objc_msgSend(v16, "findContact:completion:", v14, v17);

        }
        else if (dword_100131788 <= 30
               && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]", 30, "Ignoring friend identity update from ourself\n");
        }

      }
      else
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]", 30, "Buffering friend identity update before ready: '%{mask}'\n", v8);
        }
        -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 66, v7);
      }

    }
    else if (dword_100131788 <= 60
           && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]", 60, "### Ignoring friend identity update with no IDS device ID\n");
    }

  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]", 30, "Buffering friend identity update before FirstUnlock: '%{mask}'\n", v8);
    }
    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 66, v7);
  }

}

- (void)_rangingBLEActionScannerEnsureStarted
{
  SFDeviceDiscovery **p_rangingBLEActionScanner;
  id v4;
  id v5;
  id v6;
  id v7;
  SFDeviceDiscovery *rangingBLEActionScanner;
  SFDeviceDiscovery *v9;
  _QWORD v10[6];
  _QWORD v11[4];
  id v12;
  RPPeopleDaemon *v13;
  _QWORD v14[4];
  id v15;
  RPPeopleDaemon *v16;
  _QWORD v17[4];
  id v18;
  RPPeopleDaemon *v19;

  if (!self->_rangingBLEActionScanner)
  {
    p_rangingBLEActionScanner = &self->_rangingBLEActionScanner;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerEnsureStarted]", 30, "Ranging BLE action scanner start\n");
    }
    v4 = objc_alloc_init(off_100131800());
    objc_storeStrong((id *)p_rangingBLEActionScanner, v4);
    objc_msgSend(v4, "setChangeFlags:", 1);
    objc_msgSend(v4, "setDiscoveryFlags:", 16);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v4, "setPurpose:", CFSTR("RPPeople"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008F7E0;
    v17[3] = &unk_100114550;
    v5 = v4;
    v18 = v5;
    v19 = self;
    objc_msgSend(v5, "setDeviceFoundHandler:", v17);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008F7FC;
    v14[3] = &unk_100114550;
    v6 = v5;
    v15 = v6;
    v16 = self;
    objc_msgSend(v6, "setDeviceLostHandler:", v14);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008F818;
    v11[3] = &unk_100114578;
    v12 = v6;
    v13 = self;
    v7 = v6;
    objc_msgSend(v7, "setDeviceChangedHandler:", v11);

    rangingBLEActionScanner = self->_rangingBLEActionScanner;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008F834;
    v10[3] = &unk_1001121C0;
    v10[4] = rangingBLEActionScanner;
    v10[5] = self;
    v9 = rangingBLEActionScanner;
    -[SFDeviceDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v10);

  }
}

- (void)_rangingBLEActionScannerEnsureStopped
{
  OS_dispatch_source *rangingBLEActionBurstTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  SFDeviceDiscovery *rangingBLEActionScanner;
  NSMutableDictionary *rangingBLEActionDevicesActive;
  NSMutableDictionary *rangingBLEActionDevicesOther;

  rangingBLEActionBurstTimer = self->_rangingBLEActionBurstTimer;
  if (rangingBLEActionBurstTimer)
  {
    v4 = rangingBLEActionBurstTimer;
    dispatch_source_cancel(v4);
    v5 = self->_rangingBLEActionBurstTimer;
    self->_rangingBLEActionBurstTimer = 0;

  }
  if (self->_rangingBLEActionScanner)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerEnsureStopped]", 30, "Ranging BLE action scanner stop\n");
    }
    -[SFDeviceDiscovery invalidate](self->_rangingBLEActionScanner, "invalidate");
    rangingBLEActionScanner = self->_rangingBLEActionScanner;
    self->_rangingBLEActionScanner = 0;

    rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
    self->_rangingBLEActionDevicesActive = 0;

    rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
    self->_rangingBLEActionDevicesOther = 0;

    -[RPPeopleDaemon _rangingResponderUpdate](self, "_rangingResponderUpdate");
  }
}

- (void)_rangingBLEActionScannerDeviceFound:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSMutableDictionary *rangingBLEActionDevicesOther;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  NSMutableDictionary *rangingBLEActionDevicesActive;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (dword_100131788 <= 30)
  {
    if (dword_100131788 != -1 || (v5 = _LogCategory_Initialize(&dword_100131788, 30), v4 = v16, v5))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerDeviceFound:]", 30, "Ranging BLE action scanner found/updated: %@\n", v4);
      v4 = v16;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  if (v7)
  {
    if (objc_msgSend(v16, "deviceActionType") == 53)
    {
      if (self->_airdropMode != 1
        && (((unsigned __int16)objc_msgSend(v16, "deviceFlags") & 0x444E) != 0
         || self->_airdropMode == 3 && self->_prefPeopleStrangers))
      {
        rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
        if (!rangingBLEActionDevicesActive)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v14 = self->_rangingBLEActionDevicesActive;
          self->_rangingBLEActionDevicesActive = v13;

          rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](rangingBLEActionDevicesActive, "objectForKeyedSubscript:", v7));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesActive, "setObject:forKeyedSubscript:", v16, v7);
        if (!v15)
          -[RPPeopleDaemon _rangingBLEActionScannerBurst](self, "_rangingBLEActionScannerBurst");
        goto LABEL_13;
      }
      rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
      if (!rangingBLEActionDevicesOther)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v10 = self->_rangingBLEActionDevicesOther;
        self->_rangingBLEActionDevicesOther = v9;

        rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
      }
      v11 = v16;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesActive, "setObject:forKeyedSubscript:", 0, v7);
      rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
      v11 = 0;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](rangingBLEActionDevicesOther, "setObject:forKeyedSubscript:", v11, v7);
LABEL_13:
    -[RPPeopleDaemon _rangingResponderUpdate](self, "_rangingResponderUpdate");
  }

}

- (void)_rangingBLEActionScannerDeviceLost:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (dword_100131788 <= 30)
  {
    if (dword_100131788 != -1 || (v5 = _LogCategory_Initialize(&dword_100131788, 30), v4 = v8, v5))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerDeviceLost:]", 30, "Ranging BLE action scanner lost: %@\n", v4);
      v4 = v8;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesActive, "setObject:forKeyedSubscript:", 0, v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesOther, "setObject:forKeyedSubscript:", 0, v7);
    -[RPPeopleDaemon _rangingResponderUpdate](self, "_rangingResponderUpdate");
  }

}

- (void)_rangingBLEActionScannerBurst
{
  double prefPTSBurstScanActionSecs;
  OS_dispatch_source *v4;
  NSObject *v5;
  dispatch_source_t v6;
  _QWORD handler[4];
  NSObject *v8;
  RPPeopleDaemon *v9;

  prefPTSBurstScanActionSecs = self->_prefPTSBurstScanActionSecs;
  if (prefPTSBurstScanActionSecs > 0.0)
  {
    v4 = self->_rangingBLEActionBurstTimer;
    if (v4)
    {
      v5 = v4;
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerBurst]", 30, "Ranging BLE action scanner burst extend: %.3f seconds\n", prefPTSBurstScanActionSecs);
      }
      CUDispatchTimerSet(v5, prefPTSBurstScanActionSecs, -1.0, 0.1);
    }
    else
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerBurst]", 30, "Ranging BLE action scanner burst start: %.3f seconds\n", prefPTSBurstScanActionSecs);
      }
      v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_rangingBLEActionBurstTimer, v6);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10008FE74;
      handler[3] = &unk_100111928;
      v5 = v6;
      v8 = v5;
      v9 = self;
      dispatch_source_set_event_handler(v5, handler);
      CUDispatchTimerSet(v5, prefPTSBurstScanActionSecs, -1.0, 0.1);
      dispatch_activate(v5);

    }
    if (-[SFDeviceDiscovery scanRate](self->_rangingBLEActionScanner, "scanRate") != (id)30)
      -[SFDeviceDiscovery setScanRate:](self->_rangingBLEActionScanner, "setScanRate:", 30);

  }
}

- (void)_rangingInitiatorEnsureStarted
{
  CURangingSession *v3;
  CURangingSession *rangingInitiator;
  CURangingSession *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RPPeopleDaemon *v10;
  _QWORD v11[5];
  _QWORD v12[6];

  if (!self->_rangingInitiator)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingInitiatorEnsureStarted]", 30, "Ranging initiator start\n");
    }
    v3 = (CURangingSession *)objc_alloc_init((Class)CURangingSession);
    rangingInitiator = self->_rangingInitiator;
    self->_rangingInitiator = v3;
    v5 = v3;

    -[CURangingSession setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CURangingSession setLabel:](v5, "setLabel:", CFSTR("RPPeople"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100090154;
    v12[3] = &unk_1001145A0;
    v12[4] = v5;
    v12[5] = self;
    -[CURangingSession setMeasurementHandlerEx:](v5, "setMeasurementHandlerEx:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100090174;
    v11[3] = &unk_1001110F8;
    v11[4] = self;
    -[CURangingSession setStatusChangedHandler:](v5, "setStatusChangedHandler:", v11);
    -[CURangingSession activate](self->_rangingInitiator, "activate");

  }
  if (!self->_rangingBLEActionAdvertiser && self->_prefRanging)
  {
    v6 = objc_alloc_init(off_100131820());
    objc_storeStrong((id *)&self->_rangingBLEActionAdvertiser, v6);
    objc_msgSend(v6, "setAdvertiseRate:", 50);
    objc_msgSend(v6, "setDeviceActionType:", 53);
    objc_msgSend(v6, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v6, "setIdentifier:", CFSTR("1e270a1a-2920-49b6-b076-4b7914bc85e2"));
    objc_msgSend(v6, "setLabel:", CFSTR("RPPeople"));
    objc_msgSend(v6, "setPairSetupDisabled:", 1);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009017C;
    v8[3] = &unk_1001121C0;
    v9 = v6;
    v10 = self;
    v7 = v6;
    objc_msgSend(v7, "activateWithCompletion:", v8);

  }
}

- (void)_rangingInitiatorEnsureStopped
{
  CURangingSession *rangingInitiator;
  SFService *rangingBLEActionAdvertiser;
  SFService *v5;

  if (self->_rangingInitiator)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingInitiatorEnsureStopped]", 30, "Ranging initiator stop\n");
    }
    -[CURangingSession invalidate](self->_rangingInitiator, "invalidate");
    rangingInitiator = self->_rangingInitiator;
    self->_rangingInitiator = 0;

  }
  rangingBLEActionAdvertiser = self->_rangingBLEActionAdvertiser;
  if (rangingBLEActionAdvertiser)
  {
    -[SFService invalidate](rangingBLEActionAdvertiser, "invalidate");
    v5 = self->_rangingBLEActionAdvertiser;
    self->_rangingBLEActionAdvertiser = 0;

  }
}

- (void)_rangingInitiatorHandlePeer:(id)a3 measurement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *discoveredDevices;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceAddress"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10000F9D8;
  v16 = sub_10000F978;
  v17 = 0;
  discoveredDevices = self->_discoveredDevices;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000903E4;
  v11[3] = &unk_1001145C8;
  v11[4] = v8;
  v11[5] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v11);
  v10 = v13[5];
  if (v10)
    -[RPPeopleDaemon _daemonDevice:updatedMeasurement:](self, "_daemonDevice:updatedMeasurement:", v10, v7);
  _Block_object_dispose(&v12, 8);

}

- (void)_rangingInitiatorStatusChanged
{
  unint64_t v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (unint64_t)-[CURangingSession statusFlags](self->_rangingInitiator, "statusFlags") & 1;
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingInitiatorStatusChanged]", 30, "Status changed: %#{flags}\n", v3, &unk_10010B2A7);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_xpcConnections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "clientPeopleStatusChanged:", v3);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_rangingResponderUpdate
{
  if (-[NSMutableDictionary count](self->_rangingBLEActionDevicesActive, "count"))
    -[RPPeopleDaemon _rangingResponderEnsureStarted](self, "_rangingResponderEnsureStarted");
  else
    -[RPPeopleDaemon _rangingResponderEnsureStopped](self, "_rangingResponderEnsureStopped");
}

- (void)_rangingResponderEnsureStarted
{
  CURangingSession *rangingResponder;
  CURangingSession *v4;
  CURangingSession *v5;
  CURangingSession *v6;
  NSMutableDictionary *rangingBLEActionDevicesActive;
  id v8;
  _QWORD v9[5];

  rangingResponder = self->_rangingResponder;
  if (!rangingResponder)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingResponderEnsureStarted]", 30, "Ranging responder start\n");
    }
    v4 = (CURangingSession *)objc_alloc_init((Class)CURangingSession);
    v5 = self->_rangingResponder;
    self->_rangingResponder = v4;
    v6 = v4;

    -[CURangingSession setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    -[CURangingSession setFlags:](v6, "setFlags:", 1);
    -[CURangingSession setLabel:](v6, "setLabel:", CFSTR("RPPeople"));

  }
  v8 = objc_alloc_init((Class)NSMutableArray);
  rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009072C;
  v9[3] = &unk_1001145F0;
  v9[4] = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rangingBLEActionDevicesActive, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[CURangingSession setPeers:](self->_rangingResponder, "setPeers:", v8);
  if (!rangingResponder)
    -[CURangingSession activate](self->_rangingResponder, "activate");

}

- (void)_rangingResponderEnsureStopped
{
  CURangingSession *rangingResponder;

  if (self->_rangingResponder)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingResponderEnsureStopped]", 30, "Ranging responder stop\n");
    }
    -[CURangingSession invalidate](self->_rangingResponder, "invalidate");
    rangingResponder = self->_rangingResponder;
    self->_rangingResponder = 0;

  }
}

- (void)_rangingResponderUpdateForAirDropChange
{
  int airdropMode;
  NSMutableDictionary *rangingBLEActionDevicesOther;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *k;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  uint64_t v35;
  void *v36;
  NSMutableDictionary *rangingBLEActionDevicesActive;
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  unsigned int v40;
  const char *v41;
  unsigned int v42;
  unsigned int v43;
  const char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];

  airdropMode = self->_airdropMode;
  if (airdropMode != 3)
  {
    if (airdropMode != 2)
    {
      if (airdropMode == 1 && -[NSMutableDictionary count](self->_rangingBLEActionDevicesActive, "count"))
      {
        rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
        if (!rangingBLEActionDevicesOther)
        {
          v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v6 = self->_rangingBLEActionDevicesOther;
          self->_rangingBLEActionDevicesOther = v5;

          rangingBLEActionDevicesOther = self->_rangingBLEActionDevicesOther;
        }
        -[NSMutableDictionary addEntriesFromDictionary:](rangingBLEActionDevicesOther, "addEntriesFromDictionary:", self->_rangingBLEActionDevicesActive);
        -[NSMutableDictionary removeAllObjects](self->_rangingBLEActionDevicesActive, "removeAllObjects");
        v7 = 1;
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_49;
    }
    goto LABEL_22;
  }
  if (!self->_prefPeopleStrangers)
  {
LABEL_22:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_rangingBLEActionDevicesActive, "allKeys"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v23)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_rangingBLEActionDevicesActive, "objectForKeyedSubscript:", v25));
          if ((objc_msgSend(v26, "deviceFlags") & 0x444E) == 0)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesActive, "setObject:forKeyedSubscript:", 0, v25);
            v27 = self->_rangingBLEActionDevicesOther;
            if (!v27)
            {
              v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v29 = self->_rangingBLEActionDevicesOther;
              self->_rangingBLEActionDevicesOther = v28;

              v27 = self->_rangingBLEActionDevicesOther;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v26, v25);
            v22 = 1;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_rangingBLEActionDevicesOther, "allKeys"));
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(_QWORD *)v50 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_rangingBLEActionDevicesOther, "objectForKeyedSubscript:", v35));
          if ((objc_msgSend(v36, "deviceFlags") & 0x444E) != 0)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesOther, "setObject:forKeyedSubscript:", 0, v35);
            rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
            if (!rangingBLEActionDevicesActive)
            {
              v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v39 = self->_rangingBLEActionDevicesActive;
              self->_rangingBLEActionDevicesActive = v38;

              rangingBLEActionDevicesActive = self->_rangingBLEActionDevicesActive;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](rangingBLEActionDevicesActive, "setObject:forKeyedSubscript:", v36, v35);
            v22 = 1;
          }

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v32);
    }

    v7 = v22 & 1;
    goto LABEL_49;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_rangingBLEActionDevicesOther, "allKeys"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v10; k = (char *)k + 1)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)k);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_rangingBLEActionDevicesOther, "objectForKeyedSubscript:", v14));
        if ((objc_msgSend(v15, "deviceFlags") & 0x444E) == 0)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rangingBLEActionDevicesOther, "setObject:forKeyedSubscript:", 0, v14);
          v16 = self->_rangingBLEActionDevicesActive;
          if (!v16)
          {
            v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v18 = self->_rangingBLEActionDevicesActive;
            self->_rangingBLEActionDevicesActive = v17;

            v16 = self->_rangingBLEActionDevicesActive;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v14);
          v11 = 1;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v7 = v11 & 1;
LABEL_49:
  if (dword_100131788 > 30 || dword_100131788 == -1 && !_LogCategory_Initialize(&dword_100131788, 30))
  {
    if (!v7)
      return;
    goto LABEL_55;
  }
  v40 = self->_airdropMode - 1;
  if (v40 > 2)
    v41 = "?";
  else
    v41 = (&off_1001146F0)[v40];
  v42 = -[NSMutableDictionary count](self->_rangingBLEActionDevicesActive, "count");
  v43 = -[NSMutableDictionary count](self->_rangingBLEActionDevicesOther, "count");
  v44 = "no";
  if (v7)
    v44 = "yes";
  LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingResponderUpdateForAirDropChange]", 30, "Update for AirDrop mode: %s, %d active, %d other, changed %s\n", v41, v42, v43, v44);
  if (v7)
LABEL_55:
    -[RPPeopleDaemon _rangingResponderUpdate](self, "_rangingResponderUpdate");
}

- (void)_rangingRemoveDevice:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v8 = v4;
    v5 = -[NSMutableSet count](self->_rangingCapableDevices, "count");
    -[NSMutableSet removeObject:](self->_rangingCapableDevices, "removeObject:", v8);
    v6 = -[NSMutableSet count](self->_rangingCapableDevices, "count") == 0;
    v4 = v8;
    v7 = v6;
    if ((((v5 != 0) ^ v7) & 1) == 0)
    {
      -[RPPeopleDaemon _update](self, "_update");
      v4 = v8;
    }
  }

}

- (void)_rangingUpdateForDevice:(id)a3
{
  void *v4;
  id v5;
  NSMutableSet *rangingCapableDevices;
  NSMutableSet *v7;
  NSMutableSet *v8;
  CURangingSession *rangingInitiator;
  CURangingSession *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CFTypeID TypeID;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  if (v4)
  {
    v5 = -[NSMutableSet count](self->_rangingCapableDevices, "count");
    if (((unsigned __int16)objc_msgSend(v17, "flags") & 0x24D) != 0 || (self->_discoveryFlagsAggregate & 0x400) != 0)
    {
      rangingCapableDevices = self->_rangingCapableDevices;
      if (!rangingCapableDevices)
      {
        v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v8 = self->_rangingCapableDevices;
        self->_rangingCapableDevices = v7;

        rangingCapableDevices = self->_rangingCapableDevices;
      }
      -[NSMutableSet addObject:](rangingCapableDevices, "addObject:", v4);
      rangingInitiator = self->_rangingInitiator;
      if (rangingInitiator)
      {
        v10 = rangingInitiator;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bleDevice"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleDevice"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "advertisementFields"));
        v14 = objc_alloc_init((Class)CURangingSample);
        objc_msgSend(v14, "setChannel:", CFDictionaryGetInt64Ranged(v13, CFSTR("ch"), 0, 255, 0));
        TypeID = CFDataGetTypeID();
        objc_msgSend(v14, "setDeviceAddress:", CFDictionaryGetTypedValue(v13, CFSTR("bdAddr"), TypeID, 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
        objc_msgSend(v14, "setDeviceModel:", v16);

        objc_msgSend(v14, "setRawRSSI:", objc_msgSend(v12, "rssi"));
        -[CURangingSession addSample:](v10, "addSample:", v14);

      }
    }
    else
    {
      -[NSMutableSet removeObject:](self->_rangingCapableDevices, "removeObject:", v4);
    }
    if ((v5 != 0) == (-[NSMutableSet count](self->_rangingCapableDevices, "count") == 0))
      -[RPPeopleDaemon _update](self, "_update");
  }

}

- (void)_bufferCloudMessage:(id)a3 frameType:(unsigned __int8)a4 msgCtx:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  const char *v11;
  RPBufferedCloudMessage *v12;
  NSMutableArray *bufferedCloudMessages;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  v9 = -[NSMutableArray count](self->_bufferedCloudMessages, "count");
  if ((unint64_t)v9 < 0x64)
  {
    v12 = objc_alloc_init(RPBufferedCloudMessage);
    -[RPBufferedCloudMessage setFrameType:](v12, "setFrameType:", v6);
    -[RPBufferedCloudMessage setMessage:](v12, "setMessage:", v16);
    -[RPBufferedCloudMessage setMsgCtx:](v12, "setMsgCtx:", v8);
    bufferedCloudMessages = self->_bufferedCloudMessages;
    if (!bufferedCloudMessages)
    {
      v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v15 = self->_bufferedCloudMessages;
      self->_bufferedCloudMessages = v14;

      bufferedCloudMessages = self->_bufferedCloudMessages;
    }
    -[NSMutableArray addObject:](bufferedCloudMessages, "addObject:", v12);
    goto LABEL_40;
  }
  if (dword_100131788 <= 60)
  {
    v10 = v9;
    if (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60))
    {
      if ((int)v6 <= 47)
      {
        v11 = "Invalid";
        switch((int)v6)
        {
          case 0:
            goto LABEL_39;
          case 1:
            v11 = "NoOp";
            break;
          case 3:
            v11 = "PS_Start";
            break;
          case 4:
            v11 = "PS_Next";
            break;
          case 5:
            v11 = "PV_Start";
            break;
          case 6:
            v11 = "PV_Next";
            break;
          case 7:
            v11 = "U_OPACK";
            break;
          case 8:
            v11 = "E_OPACK";
            break;
          case 9:
            v11 = "P_OPACK";
            break;
          case 10:
            v11 = "PA_Req";
            break;
          case 11:
            v11 = "PA_Rsp";
            break;
          case 16:
            v11 = "SessionStartRequest";
            break;
          case 17:
            v11 = "SessionStartResponse";
            break;
          case 18:
            v11 = "SessionData";
            break;
          case 32:
            v11 = "FamilyIdentityRequest";
            break;
          case 33:
            v11 = "FamilyIdentityResponse";
            break;
          case 34:
            v11 = "FamilyIdentityUpdate";
            break;
          default:
            goto LABEL_38;
        }
        goto LABEL_39;
      }
      if ((int)v6 <= 63)
      {
        if ((_DWORD)v6 == 48)
        {
          v11 = "WatchIdentityRequest";
          goto LABEL_39;
        }
        if ((_DWORD)v6 == 49)
        {
          v11 = "WatchIdentityResponse";
          goto LABEL_39;
        }
      }
      else
      {
        switch((_DWORD)v6)
        {
          case '@':
            v11 = "FriendIdentityRequest";
            goto LABEL_39;
          case 'A':
            v11 = "FriendIdentityResponse";
            goto LABEL_39;
          case 'B':
            v11 = "FriendIdentityUpdate";
LABEL_39:
            v12 = (RPBufferedCloudMessage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appleID"));
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]", 60, "### Dropping cloud message at max (%zu): %s, '%{mask}'\n", v10, v11, v12);
LABEL_40:

            goto LABEL_41;
        }
      }
LABEL_38:
      v11 = "?";
      goto LABEL_39;
    }
  }
LABEL_41:

}

- (void)_processBufferedCloudMessages
{
  NSMutableArray *v3;
  NSMutableArray *bufferedCloudMessages;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked")
    && self->_familyAccountIdentityMap
    && -[NSMutableArray count](self->_bufferedCloudMessages, "count"))
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _processBufferedCloudMessages]", 30, "Processing buffered cloud messages: %d\n", -[NSMutableArray count](self->_bufferedCloudMessages, "count"));
    }
    v3 = self->_bufferedCloudMessages;
    bufferedCloudMessages = self->_bufferedCloudMessages;
    self->_bufferedCloudMessages = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
          v11 = objc_msgSend(v10, "frameType");
          if (v11 > 63)
          {
            switch(v11)
            {
              case '@':
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msgCtx"));
                -[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:](self, "receivedFriendIdentityRequest:msgCtx:", v12, v13);
                goto LABEL_26;
              case 'A':
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msgCtx"));
                -[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:](self, "receivedFriendIdentityResponse:msgCtx:", v12, v13);
                goto LABEL_26;
              case 'B':
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msgCtx"));
                -[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:](self, "receivedFriendIdentityUpdate:msgCtx:", v12, v13);
                goto LABEL_26;
            }
          }
          else
          {
            switch(v11)
            {
              case ' ':
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msgCtx"));
                -[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:](self, "receivedFamilyIdentityRequest:msgCtx:", v12, v13);
                goto LABEL_26;
              case '!':
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msgCtx"));
                -[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:](self, "receivedFamilyIdentityResponse:msgCtx:", v12, v13);
                goto LABEL_26;
              case '"':
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msgCtx"));
                -[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:](self, "receivedFamilyIdentityUpdate:msgCtx:", v12, v13);
LABEL_26:

                goto LABEL_27;
            }
          }
          if (dword_100131788 <= 90
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _processBufferedCloudMessages]", 90, "### Unknown buffered message frame type: %d\n", objc_msgSend(v10, "frameType"));
          }
LABEL_27:
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = v14;
      }
      while (v14);
    }

  }
}

- (BOOL)_sendCloudIdentityFrameType:(unsigned __int8)a3 destinationID:(id)a4 flags:(unsigned int)a5 msgCtx:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v7 = *(_QWORD *)&a5;
  v8 = a3;
  v10 = a4;
  v11 = a6;
  if (dword_100131788 <= 30 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
  {
    if ((int)v8 <= 47)
    {
      v12 = "Invalid";
      switch((int)v8)
      {
        case 0:
          goto LABEL_35;
        case 1:
          v12 = "NoOp";
          break;
        case 3:
          v12 = "PS_Start";
          break;
        case 4:
          v12 = "PS_Next";
          break;
        case 5:
          v12 = "PV_Start";
          break;
        case 6:
          v12 = "PV_Next";
          break;
        case 7:
          v12 = "U_OPACK";
          break;
        case 8:
          v12 = "E_OPACK";
          break;
        case 9:
          v12 = "P_OPACK";
          break;
        case 10:
          v12 = "PA_Req";
          break;
        case 11:
          v12 = "PA_Rsp";
          break;
        case 16:
          v12 = "SessionStartRequest";
          break;
        case 17:
          v12 = "SessionStartResponse";
          break;
        case 18:
          v12 = "SessionData";
          break;
        case 32:
          v12 = "FamilyIdentityRequest";
          break;
        case 33:
          v12 = "FamilyIdentityResponse";
          break;
        case 34:
          v12 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_34;
      }
      goto LABEL_35;
    }
    if ((int)v8 <= 63)
    {
      if ((_DWORD)v8 == 48)
      {
        v12 = "WatchIdentityRequest";
        goto LABEL_35;
      }
      if ((_DWORD)v8 == 49)
      {
        v12 = "WatchIdentityResponse";
        goto LABEL_35;
      }
    }
    else
    {
      switch((_DWORD)v8)
      {
        case '@':
          v12 = "FriendIdentityRequest";
          goto LABEL_35;
        case 'A':
          v12 = "FriendIdentityResponse";
          goto LABEL_35;
        case 'B':
          v12 = "FriendIdentityUpdate";
LABEL_35:
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:]", 30, "Send identity request: %s, '%{mask}'\n", v12, v10);
          goto LABEL_36;
      }
    }
LABEL_34:
    v12 = "?";
    goto LABEL_35;
  }
LABEL_36:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v14, "addSelfIdentityInfoToMessage:flags:", v13, v7);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "idsDeviceIDSelf"));

  if (v16)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("_idsID"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v18 = objc_msgSend(v17, "sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:", v13, CFSTR("com.apple.private.alloy.nearby"), v8, v10, 0, v11, 0);

  return v18;
}

- (unsigned)_updateIdentityType:(int)a3 idsDeviceID:(id)a4 appleID:(id)a5 contactID:(id)a6 msg:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  id v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t CFDataOfLength;
  void *v31;
  id v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t NSNumber;
  void *v45;
  id v46;
  id v47;
  void *v48;
  unsigned __int8 v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  unsigned __int8 v54;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  unsigned __int8 v62;
  CFTypeID v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  unsigned __int8 v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  unsigned __int8 v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  unsigned __int8 v82;
  void *v83;
  id v84;
  void *v85;
  id *location;
  RPPeopleDaemon *v88;
  id v89;
  void *v90;
  id v91;
  unsigned int v92;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((_DWORD)v10 == 4)
  {
    v16 = "Family";
    v17 = 120;
    goto LABEL_5;
  }
  if ((_DWORD)v10 == 6)
  {
    v16 = "Friend";
    v17 = 168;
LABEL_5:
    location = (id *)((char *)&self->super.isa + v17);
    v88 = self;
    v18 = *(id *)((char *)&self->super.isa + v17);
    v92 = 0;
    v89 = v18;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v12));
    v90 = v14;
    if (v19)
    {
      v20 = (id)v19;
      v21 = 0;
    }
    else
    {
      v20 = objc_alloc_init((Class)RPIdentity);
      objc_msgSend(v20, "setIdentifier:", v12);
      objc_msgSend(v20, "setType:", v10);
      v21 = 2048;
    }
    if (objc_msgSend(v13, "length"))
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accountID"));
      v23 = v13;
      v24 = v23;
      if (v22 == v23)
      {

        goto LABEL_19;
      }
      if ((v23 != 0) == (v22 == 0))
      {

      }
      else
      {
        v25 = objc_msgSend(v22, "isEqual:", v23);

        if ((v25 & 1) != 0)
          goto LABEL_19;
      }
      objc_msgSend(v20, "setAccountID:", v24);
      v21 |= 0x2000u;
    }
LABEL_19:
    if (!objc_msgSend(v90, "length"))
      goto LABEL_27;
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contactID"));
    v27 = v90;
    v28 = v27;
    if (v26 == v27)
    {

      goto LABEL_27;
    }
    if ((v27 != 0) == (v26 == 0))
    {

    }
    else
    {
      v29 = objc_msgSend(v26, "isEqual:", v27);

      if ((v29 & 1) != 0)
      {
LABEL_27:
        v92 = 0;
        CFDataOfLength = CFDictionaryGetCFDataOfLength(v15, CFSTR("_dIRK"), 16, &v92);
        v31 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
        v91 = v13;
        if (!v31)
        {
LABEL_36:

          v36 = v92;
          if (v92 && dword_100131788 <= 60)
          {
            if (dword_100131788 != -1)
            {
LABEL_39:
              LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]", 60, "### Device message missing DeviceIRK: %s, '%{mask}', %.8@, %#m\n", v16, v13, v12, v36, location);
              goto LABEL_41;
            }
            if (_LogCategory_Initialize(&dword_100131788, 60))
            {
              v36 = v92;
              goto LABEL_39;
            }
          }
LABEL_41:
          v92 = 0;
          v37 = CFDictionaryGetCFDataOfLength(v15, CFSTR("_edPK"), 32, &v92);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          if (!v38)
          {
LABEL_50:

            v43 = v92;
            if (v92 && dword_100131788 <= 60)
            {
              if (dword_100131788 != -1)
              {
LABEL_53:
                LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]", 60, "### Device message missing EdPK: %s, '%{mask}', %.8@, %#m\n", v16, v13, v12, v43);
                goto LABEL_55;
              }
              if (_LogCategory_Initialize(&dword_100131788, 60))
              {
                v43 = v92;
                goto LABEL_53;
              }
            }
LABEL_55:
            v92 = 0;
            NSNumber = NSDictionaryGetNSNumber(v15, CFSTR("_ff"), &v92);
            v45 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
            if (v45)
            {
              v46 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "featureFlags")));
              v47 = v45;
              v48 = v47;
              if (v46 == v47)
              {

              }
              else
              {
                if (v46)
                {
                  v49 = objc_msgSend(v46, "isEqual:", v47);

                  if ((v49 & 1) != 0)
                    goto LABEL_63;
                }
                else
                {

                }
                objc_msgSend(v20, "setFeatureFlags:", objc_msgSend(v48, "unsignedIntegerValue"));
                v21 |= 0x400u;
              }
            }
LABEL_63:

            v50 = v92;
            if (v92 && dword_100131788 <= 60)
            {
              if (dword_100131788 != -1)
              {
LABEL_66:
                LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]", 60, "### Device message missing FeatureFlags: %s, '%{mask}', %.8@, %#m\n", v16, v91, v12, v50);
                goto LABEL_68;
              }
              if (_LogCategory_Initialize(&dword_100131788, 60))
              {
                v50 = v92;
                goto LABEL_66;
              }
            }
LABEL_68:
            v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsDeviceID"));
            v52 = v12;
            v53 = v52;
            if (v51 == v52)
            {

            }
            else
            {
              if ((v52 != 0) != (v51 == 0))
              {
                v54 = objc_msgSend(v51, "isEqual:", v52);

                if ((v54 & 1) != 0)
                  goto LABEL_75;
              }
              else
              {

              }
              objc_msgSend(v20, "setIdsDeviceID:", v53);
              v21 |= 0x40u;
            }
LABEL_75:
            TypeID = CFStringGetTypeID();
            TypedValue = CFDictionaryGetTypedValue(v15, CFSTR("model"), TypeID, 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
            v58 = v57;
            if (v57 && objc_msgSend(v57, "length"))
            {
              v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "model"));
              v60 = v58;
              v61 = v60;
              if (v59 == v60)
              {

              }
              else
              {
                if (v59)
                {
                  v62 = objc_msgSend(v59, "isEqual:", v60);

                  if ((v62 & 1) != 0)
                    goto LABEL_84;
                }
                else
                {

                }
                objc_msgSend(v20, "setModel:", v61);
                v21 |= 0x80u;
              }
            }
LABEL_84:

            v63 = CFStringGetTypeID();
            v64 = CFDictionaryGetTypedValue(v15, CFSTR("name"), v63, 0);
            v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
            v66 = v65;
            if (v65 && objc_msgSend(v65, "length"))
            {
              v67 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              v68 = v66;
              v69 = v68;
              if (v67 == v68)
              {

                goto LABEL_93;
              }
              if (v67)
              {
                v70 = objc_msgSend(v67, "isEqual:", v68);

                if ((v70 & 1) != 0)
                  goto LABEL_93;
              }
              else
              {

              }
              objc_msgSend(v20, "setName:", v69);
              v21 |= 0x100u;
            }
LABEL_93:

            v92 = 0;
            v71 = CFDictionaryGetCFDataOfLength(v15, CFSTR("_bIRK"), 16, &v92);
            v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            if (!v72)
              goto LABEL_101;
            v73 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "btIRKData"));
            v74 = v72;
            v75 = v74;
            if (v73 == v74)
            {

              goto LABEL_101;
            }
            if (v73)
            {
              v76 = objc_msgSend(v73, "isEqual:", v74);

              if ((v76 & 1) != 0)
              {
LABEL_101:

                v92 = 0;
                v77 = CFDictionaryGetCFDataOfLength(v15, CFSTR("_bAdd"), 7, &v92);
                v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
                if (!v78)
                  goto LABEL_109;
                v79 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "btAddress"));
                v80 = v78;
                v81 = v80;
                if (v79 == v80)
                {

                  goto LABEL_109;
                }
                if (v79)
                {
                  v82 = objc_msgSend(v79, "isEqual:", v80);

                  if ((v82 & 1) != 0)
                  {
LABEL_109:

                    if ((v21 & 0x800) != 0)
                    {
                      v83 = v89;
                      v14 = v90;
                      if (!v89)
                      {
                        v84 = objc_alloc_init((Class)NSMutableDictionary);
                        objc_storeStrong(location, v84);
                        v83 = v84;
                      }
                      v89 = v83;
                      objc_msgSend(v83, "setObject:forKeyedSubscript:", v20, v53);
                    }
                    else
                    {
                      v14 = v90;
                      if (!v21)
                        goto LABEL_116;
                    }
                    v85 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
                    objc_msgSend(v85, "saveIdentity:error:", v20, 0);

LABEL_116:
                    v13 = v91;
                    if ((_DWORD)v10 == 4)
                      -[RPPeopleDaemon _updateFamilyNotification](v88, "_updateFamilyNotification");

                    goto LABEL_121;
                  }
                }
                else
                {

                }
                objc_msgSend(v20, "setBtAddress:", v81);
                v21 |= 0x800000u;
                goto LABEL_109;
              }
            }
            else
            {

            }
            objc_msgSend(v20, "setBtIRKData:", v75);
            v21 |= 0x400000u;
            goto LABEL_101;
          }
          v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "edPKData"));
          v40 = v38;
          v41 = v40;
          if (v39 == v40)
          {

          }
          else
          {
            if (v39)
            {
              v42 = objc_msgSend(v39, "isEqual:", v40);

              if ((v42 & 1) != 0)
                goto LABEL_49;
            }
            else
            {

            }
            objc_msgSend(v20, "setEdPKData:", v41);
            v21 |= 8u;
          }
LABEL_49:
          v13 = v91;
          goto LABEL_50;
        }
        v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "deviceIRKData"));
        v33 = v31;
        v34 = v33;
        if (v32 == v33)
        {

        }
        else
        {
          if (v32)
          {
            v35 = objc_msgSend(v32, "isEqual:", v33);

            if ((v35 & 1) != 0)
              goto LABEL_35;
          }
          else
          {

          }
          objc_msgSend(v20, "setDeviceIRKData:", v34);
          v21 |= 4u;
        }
LABEL_35:
        v13 = v91;
        goto LABEL_36;
      }
    }
    objc_msgSend(v20, "setContactID:", v28);
    v21 |= 0x8000u;
    goto LABEL_27;
  }
  if (dword_100131788 <= 90 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]", 90, "### Update device with unsupported identity type: %d\n", v10);
  v21 = 0;
LABEL_121:

  return v21;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPPeopleXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v20[6];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = -[RPPeopleXPCConnection initWithDaemon:xpcCnx:]([RPPeopleXPCConnection alloc], "initWithDaemon:xpcCnx:", self, v5);
  -[RPPeopleXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPPeopleXPCDaemonInterface));
  v11 = objc_alloc((Class)NSSet);
  v14 = objc_opt_class(NSArray, v12, v13);
  v17 = objc_msgSend(v11, "initWithObjects:", v14, objc_opt_class(RPPerson, v15, v16), 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v17, "xpcPeopleDiscoveryActivate:completion:", 0, 1);

  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(v5, "setExportedInterface:", v10);
  objc_msgSend(v5, "setExportedObject:", v6);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100092408;
  v20[3] = &unk_100111928;
  v20[4] = self;
  v20[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPPeopleXPCClientInterface));
  objc_msgSend(v5, "setRemoteObjectInterface:", v18);

  objc_msgSend(v5, "resume");
  if (dword_100131788 <= 20 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 20)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v5, "connectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

  -[RPPeopleDaemon _update](self, "_update");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_ptsBurstScanTimer, 0);
  objc_storeStrong((id *)&self->_rangingResponder, 0);
  objc_storeStrong((id *)&self->_rangingInitiator, 0);
  objc_storeStrong((id *)&self->_rangingCapableDevices, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionScanner, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionDevicesOther, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionDevicesActive, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionBurstTimer, 0);
  objc_storeStrong((id *)&self->_rangingBLEActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_privacyChangedCoalescer, 0);
  objc_storeStrong((id *)&self->_friendsSuggestedPollTimer, 0);
  objc_storeStrong((id *)&self->_friendsSuggestedArray, 0);
  objc_storeStrong((id *)&self->_friendDeviceIdentityMap, 0);
  objc_storeStrong((id *)&self->_friendAccountIdentityMap, 0);
  objc_storeStrong((id *)&self->_familySyncCheckTimer, 0);
  objc_storeStrong((id *)&self->_familyDeviceIdentityMap, 0);
  objc_storeStrong((id *)&self->_familyAccountIdentityMap, 0);
  objc_storeStrong((id *)&self->_familyMemberMonitor, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_primaryAppleIDCached, 0);
  objc_storeStrong((id *)&self->_discoveryClients, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_bufferedCloudMessages, 0);
}

@end
