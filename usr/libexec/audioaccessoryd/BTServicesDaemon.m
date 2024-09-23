@implementation BTServicesDaemon

+ (id)sharedBTServicesDaemon
{
  if (qword_100212648[0] != -1)
    dispatch_once(qword_100212648, &stru_1001E53C0);
  return (id)qword_100212640;
}

- (BTServicesDaemon)init
{
  char *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BTServicesDaemon;
  v2 = -[BTServicesDaemon init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BTServicesDaemon", v4);
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    *((_DWORD *)v2 + 2) = -1;
    *(_QWORD *)(v2 + 52) = -1;
    v7 = v2;
  }

  return (BTServicesDaemon *)v2;
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  SFDeviceDiscovery *v13;
  SFDeviceDiscovery *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  NSMutableDictionary *shareAudioActionTriggeredDevices;
  CUBluetoothClient *v19;
  CUBluetoothClient *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  CUUserNotificationSession *v24;
  CUUserNotificationSession *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  id *v29;
  id v30;
  id *v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  id *v36;
  void *v37;
  id v38;
  unsigned int v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  id *v43;
  uint64_t v44;
  void *v45;
  id *v46;
  id *v47;
  void *v48;
  id v49;
  int v50;
  uint64_t v51;
  void *j;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id *v56;
  uint64_t *v57;
  id v58;
  id v59;
  NSMutableSet *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  id obj;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];

  v3 = a3;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = sub_100091F7C;
  v89 = sub_100091F8C;
  v90 = 0;
  obj = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BTIdentityDaemon sharedBTIdentityDaemon](BTIdentityDaemon, "sharedBTIdentityDaemon"));
  v6 = CUDescriptionWithLevel(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  NSAppendPrintF(&obj, "%@", v7);
  objc_storeStrong(&v90, obj);

  v8 = (id *)(v86 + 5);
  v83 = (id)v86[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  v10 = CUDescriptionWithLevel(v9, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  NSAppendPrintF(&v83, "%@", v11);
  objc_storeStrong(v8, v83);

  v12 = (id *)(v86 + 5);
  v82 = (id)v86[5];
  NSAppendPrintF(&v82, "-- BTShareAudioTV (trig %d)--\n", -[NSMutableDictionary count](self->_shareAudioActionTriggeredDevices, "count"));
  objc_storeStrong(v12, v82);
  v13 = self->_shareAudioActionScanner;
  v14 = v13;
  if (v13)
  {
    v15 = (id *)(v86 + 5);
    v81 = (id)v86[5];
    v16 = CUDescriptionWithLevel(v13, v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    NSAppendPrintF(&v81, "%@\n", v17);
    objc_storeStrong(v15, v81);

  }
  shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100091F94;
  v80[3] = &unk_1001E2CE0;
  v80[4] = &v85;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](shareAudioActionTriggeredDevices, "enumerateKeysAndObjectsUsingBlock:", v80);
  v19 = self->_shareAudioConnectedDeviceMonitor;
  v20 = v19;
  if (v19)
  {
    v21 = (id *)(v86 + 5);
    v79 = (id)v86[5];
    v22 = CUDescriptionWithLevel(v19, v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    NSAppendPrintF(&v79, "%@\n", v23);
    objc_storeStrong(v21, v79);

  }
  v24 = self->_shareAudioActionUINoteSession;
  v25 = v24;
  if (v24)
  {
    v26 = (id *)(v86 + 5);
    v78 = (id)v86[5];
    v27 = CUDescriptionWithLevel(v24, v3);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    NSAppendPrintF(&v78, "%@\n", v28);
    objc_storeStrong(v26, v78);

  }
  v29 = (id *)(v86 + 5);
  v77 = (id)v86[5];
  NSAppendPrintF(&v77, "\n");
  objc_storeStrong(v29, v77);
  v30 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v30)
  {
    v31 = (id *)(v86 + 5);
    v76 = (id)v86[5];
    NSAppendPrintF(&v76, "XPC Cnx: %d\n", (_DWORD)v30);
    objc_storeStrong(v31, v76);
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v61 = self->_xpcConnections;
  v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v33)
          objc_enumerationMutation(v61);
        v35 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        v36 = (id *)(v86 + 5);
        v71 = (id)v86[5];
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "xpcCnx"));
        v38 = objc_msgSend(v37, "processIdentifier");
        v39 = objc_msgSend(v35, "entitled");
        v40 = "no";
        if (v39)
          v40 = "yes";
        NSAppendPrintF(&v71, "    %#{pid}, entitled %s", v38, v40);
        objc_storeStrong(v36, v71);

        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "audioSession"));
        v42 = (void *)v41;
        if (v41)
        {
          v43 = (id *)(v86 + 5);
          v70 = (id)v86[5];
          NSAppendPrintF(&v70, ", %@", v41);
          objc_storeStrong(v43, v70);
        }

        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "shareAudioSession"));
        v45 = (void *)v44;
        if (v44)
        {
          v46 = (id *)(v86 + 5);
          v69 = (id)v86[5];
          NSAppendPrintF(&v69, ", %@", v44);
          objc_storeStrong(v46, v69);
        }

        v47 = (id *)(v86 + 5);
        v68 = (id)v86[5];
        NSAppendPrintF(&v68, "\n");
        objc_storeStrong(v47, v68);
      }
      v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
    }
    while (v32);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v48 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.bluetooth"), 0);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v91, 16);
  if (!v49)
    goto LABEL_33;
  v50 = 0;
  v51 = *(_QWORD *)v65;
  do
  {
    for (j = 0; j != v49; j = (char *)j + 1)
    {
      if (*(_QWORD *)v65 != v51)
        objc_enumerationMutation(v48);
      v53 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
      v54 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
      {
        v55 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), v53, 0, 0);
        v56 = (id *)(v86 + 5);
        v63 = (id)v86[5];
        NSAppendPrintF(&v63, "Pref: '%@' = '%##@'\n", v53, v55);
        objc_storeStrong(v56, v63);

        ++v50;
      }
    }
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v91, 16);
  }
  while (v49);

  if (v50 >= 1)
  {
    v57 = v86;
    v62 = (id)v86[5];
    NSAppendPrintF(&v62, "\n");
    v58 = v62;
    v48 = (void *)v57[5];
    v57[5] = (uint64_t)v58;
LABEL_33:

  }
  v59 = (id)v86[5];
  _Block_object_dispose(&v85, 8);

  return v59;
}

- (void)openRadarforAudioQuality
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[8];
  _QWORD v21[8];

  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesDaemon openRadarforAudioQuality]", 30, "audioQuality - File Radar");
  v20[0] = CFSTR("Classification");
  v20[1] = CFSTR("ComponentID");
  v21[0] = CFSTR("Performance");
  v21[1] = CFSTR("815886");
  v20[2] = CFSTR("ComponentName");
  v20[3] = CFSTR("ComponentVersion");
  v21[2] = CFSTR("CoreBluetooth - HFP Audio | iOS");
  v21[3] = CFSTR("iOS");
  v20[4] = CFSTR("ExtensionIdentifiers");
  v20[5] = CFSTR("Reproducibility");
  v21[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v21[5] = CFSTR("I Didn't Try");
  v20[6] = CFSTR("Keywords");
  v20[7] = CFSTR("Title");
  v21[6] = CFSTR("1551854");
  v21[7] = CFSTR("Bluetooth Audio Quality Feedback");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v9, v10));
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("tap-to-radar://new")));
  objc_msgSend(v12, "setQueryItems:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
  objc_msgSend(v13, "openURL:configuration:completionHandler:", v14, 0, 0);

}

- (void)_audioQualityShowBanner:(int)a3 title:(id)a4 deviceAddressString:(id)a5 messageKey:(id)a6 messageArgs:(id)a7 timeoutSeconds:(double)a8
{
  __CFString *v11;
  id v12;
  BTBannerUISession *v13;
  BTBannerUISession *audioQualityBanner;
  BTBannerUISession *v15;
  const __CFString *v16;
  __CFString *v17;
  _QWORD v18[6];
  __CFString *v19;

  v11 = (__CFString *)a4;
  v12 = a6;
  v13 = (BTBannerUISession *)objc_alloc_init((Class)BTBannerUISession);
  audioQualityBanner = self->_audioQualityBanner;
  self->_audioQualityBanner = v13;
  v15 = v13;

  if (v11)
    v16 = v11;
  else
    v16 = &stru_1001ED4C0;
  -[BTBannerUISession setCenterContentText:](v15, "setCenterContentText:", v16);
  -[BTBannerUISession setCenterContentItemsText:](v15, "setCenterContentItemsText:", v12);

  -[BTBannerUISession setDispatchQueue:](v15, "setDispatchQueue:", self->_dispatchQueue);
  -[BTBannerUISession setTimeoutSeconds:](v15, "setTimeoutSeconds:", a8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000923DC;
  v18[3] = &unk_1001E53E8;
  v18[4] = v15;
  v18[5] = self;
  v19 = v11;
  v17 = v11;
  -[BTBannerUISession setActionHandler:](v15, "setActionHandler:", v18);
  -[BTBannerUISession activate](v15, "activate");

}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092678;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  BTServicesDaemon *v2;
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  NSObject *dispatchQueue;
  NSObject *v6;
  NSObject *v7;
  OS_dispatch_queue *v8;
  id v9;
  CBController *v10;
  CBController *cbController;
  CBController *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD handler[5];

  v2 = self;
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.BluetoothServices"));
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v3;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_xpcListener, "_setQueue:", v2->_dispatchQueue);
    self = (BTServicesDaemon *)-[NSXPCListener resume](v2->_xpcListener, "resume");
  }
  if (v2->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100092A30;
    handler[3] = &unk_1001E2398;
    handler[4] = v2;
    self = (BTServicesDaemon *)notify_register_dispatch("com.apple.bluetooth.prefsChanged", &v2->_prefsChangedNotifyToken, dispatchQueue, handler);
  }
  if (v2->_ignoreResetNotifyToken == -1)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _activate]", 30, "Register for Ignore BT Reset");
    }
    v6 = v2->_dispatchQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100092AA0;
    v17[3] = &unk_1001E2398;
    v17[4] = v2;
    self = (BTServicesDaemon *)notify_register_dispatch("com.apple.bluetooth.ignoreReset", &v2->_ignoreResetNotifyToken, v6, v17);
  }
  if (IsAppleInternalBuild(self) && v2->_audioQualityNotifyToken == -1)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _activate]", 30, "audioQuality register _audioQualityNotify");
    }
    v7 = v2->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100092B18;
    v16[3] = &unk_1001E2398;
    v16[4] = v2;
    notify_register_dispatch("com.apple.bluetooth.audioQuality", &v2->_audioQualityNotifyToken, v7, v16);
  }
  if (!v2->_stateHandle)
  {
    v8 = v2->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100092BAC;
    v15[3] = &unk_1001E2940;
    v15[4] = v2;
    v2->_stateHandle = os_state_add_handler(v8, v15);
  }
  v9 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.ShareAudioNotifications"));
  objc_msgSend(v9, "setWantsNotificationResponsesDelivered");
  -[BTServicesDaemon _prefsChanged](v2, "_prefsChanged");
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _activate]", 30, "Initializing CB Controller and registering for interrupt");
  v10 = (CBController *)objc_alloc_init((Class)CBController);
  cbController = v2->_cbController;
  v2->_cbController = v10;

  -[CBController setDispatchQueue:](v2->_cbController, "setDispatchQueue:", v2->_dispatchQueue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100092BC8;
  v14[3] = &unk_1001E20E8;
  v14[4] = v2;
  -[CBController setInterruptionHandler:](v2->_cbController, "setInterruptionHandler:", v14);
  v12 = v2->_cbController;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100092C54;
  v13[3] = &unk_1001E2110;
  v13[4] = v2;
  -[CBController activateWithCompletion:](v12, "activateWithCompletion:", v13);

}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092D44;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_prefsChanged
{
  uint64_t Int64;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  _BOOL4 v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  BOOL v26;
  _BOOL4 v27;
  const char *v28;
  const char *v29;
  int v30;

  v30 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("shaTV"), &v30);
  v5 = Int64 != 0;
  if (v30)
  {
    v6 = Int64;
    v5 = GestaltGetDeviceClass(Int64, v4) - 1 < 3 || v6 != 0;
  }
  if (self->_prefShareAudioTV != v5)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      v8 = "yes";
      if (v5)
        v9 = "no";
      else
        v9 = "yes";
      if (!v5)
        v8 = "no";
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _prefsChanged]", 30, "ShareAudioActionScanner: %s -> %s", v9, v8);
    }
    self->_prefShareAudioTV = v5;
  }
  v10 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("disableConnectNotification"), &v30);
  if (v30)
    v11 = 0;
  else
    v11 = v10 == 0;
  v12 = !v11;
  if (self->_dontShowConnectBanner != v12)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      v13 = "yes";
      if (v12)
        v14 = "no";
      else
        v14 = "yes";
      if (!v12)
        v13 = "no";
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _prefsChanged]", 30, "DisableConnectNotification: %s -> %s", v14, v13);
    }
    self->_dontShowConnectBanner = v12;
  }
  v15 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("disableCrashNotification"), &v30);
  if (v30)
    v16 = 0;
  else
    v16 = v15 == 0;
  v17 = !v16;
  if (self->_dontShowCrashBanner != v17)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      v18 = "yes";
      if (v17)
        v19 = "no";
      else
        v19 = "yes";
      if (!v17)
        v18 = "no";
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _prefsChanged]", 30, "DisableCrashNotification: %s -> %s", v19, v18);
    }
    self->_dontShowCrashBanner = v17;
  }
  v20 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("disableHIDLagNotification"), &v30);
  if (v30)
    v21 = 0;
  else
    v21 = v20 == 0;
  v22 = !v21;
  if (self->_dontShowHIDLagBanner != v22)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      v23 = "yes";
      if (v22)
        v24 = "no";
      else
        v24 = "yes";
      if (!v22)
        v23 = "no";
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _prefsChanged]", 30, "DisableHIDLagNotification: %s -> %s", v24, v23);
    }
    self->_dontShowHIDLagBanner = v22;
  }
  v25 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("enableHIDIntervalNotification"), &v30);
  if (v30)
    v26 = 1;
  else
    v26 = v25 == 0;
  v27 = !v26;
  if (self->_doesShowHIDIntervalBanner != v27)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      v28 = "yes";
      if (v27)
        v29 = "no";
      else
        v29 = "yes";
      if (!v27)
        v28 = "no";
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _prefsChanged]", 30, "EnableHIDIntervalNotification: %s -> %s", v29, v28);
    }
    self->_doesShowHIDIntervalBanner = v27;
  }
  -[BTServicesDaemon _scheduleUpdate](self, "_scheduleUpdate");
}

- (void)_scheduleUpdate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100093264;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }
}

- (void)_update
{
  self->_updatePending = 0;
  if (self->_dontShowConnectBanner)
    -[BTServicesDaemon _cbConnectedDiscoveryEnsureStopped](self, "_cbConnectedDiscoveryEnsureStopped");
  else
    -[BTServicesDaemon _cbConnectedDiscoveryEnsureStarted](self, "_cbConnectedDiscoveryEnsureStarted");
  if (self->_prefShareAudioTV)
    -[BTServicesDaemon _shareAudioActionScannerEnsureStarted](self, "_shareAudioActionScannerEnsureStarted");
  else
    -[BTServicesDaemon _shareAudioActionScannerEnsureStopped](self, "_shareAudioActionScannerEnsureStopped");
  if (self->_prefShareAudioTV)
    -[BTServicesDaemon _shareAudioConnectedMonitorEnsureStarted](self, "_shareAudioConnectedMonitorEnsureStarted");
  else
    -[BTServicesDaemon _shareAudioConnectedMonitorEnsureStopped](self, "_shareAudioConnectedMonitorEnsureStopped");
}

- (void)showCrashBannerIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  CUUserNotificationSession *v12;
  CUUserNotificationSession *uiNoteSession;
  CUUserNotificationSession *v14;
  CFTypeID TypeID;
  void *v16;
  _QWORD v17[6];
  id v18;
  _QWORD v19[5];
  const __CFString *v20;
  uint64_t TypedValue;

  v4 = a3;
  v5 = mach_absolute_time();
  v6 = UpTicksToSeconds(v5 - self->_showFirmwareCrashLastTicks);
  if (!self->_showFirmwareCrashLastTicks || (v7 = v6, v6 >= 0x3C))
  {
    v8 = mach_absolute_time();
    self->_showFirmwareCrashLastTicks = v8;
    if (IsAppleInternalBuild(v8) && !self->_dontShowCrashBanner)
    {
      if (self->_uiNoteSession)
      {
        if (dword_10020FF08 <= 30
          && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
        {
          LogPrintF(&dword_10020FF08, "-[BTServicesDaemon showCrashBannerIfNeeded:]", 30, "Diag: Removing old crash banner");
        }
        -[CUUserNotificationSession removeAllActions](self->_uiNoteSession, "removeAllActions");
        -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_input")));
      v10 = objc_msgSend(v9, "isEqual:", CFSTR("HostCrashed"));

      if (v10)
        v11 = CFSTR("Bluetooth host has crashed");
      else
        v11 = CFSTR("Bluetooth firmware has crashed");
      if (dword_10020FF08 <= 30
        && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
      {
        LogPrintF(&dword_10020FF08, "-[BTServicesDaemon showCrashBannerIfNeeded:]", 30, "Diag: Bluetooth crash banner");
      }
      v12 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
      uiNoteSession = self->_uiNoteSession;
      self->_uiNoteSession = v12;
      v14 = v12;

      -[CUUserNotificationSession setBundleID:](v14, "setBundleID:", CFSTR("com.apple.BTUserNotifications"));
      -[CUUserNotificationSession setCategoryID:](v14, "setCategoryID:", CFSTR("BTUserNotifications"));
      -[CUUserNotificationSession setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
      -[CUUserNotificationSession setIconName:](v14, "setIconName:", CFSTR("Bluetooth.icns"));
      -[CUUserNotificationSession setTitleKey:](v14, "setTitleKey:", v11);
      -[CUUserNotificationSession setBodyKey:](v14, "setBodyKey:", CFSTR("Please file a radar"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100093658;
      v19[3] = &unk_1001E5410;
      v19[4] = v14;
      -[CUUserNotificationSession setActionHandler:](v14, "setActionHandler:", v19);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10009370C;
      v17[3] = &unk_1001E2570;
      v17[4] = v14;
      v17[5] = self;
      v18 = v4;
      -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:](v14, "addActionWithIdentifier:title:flags:handler:", CFSTR("FileRadarAction"), CFSTR("File Radar"), 0, v17);
      -[CUUserNotificationSession activate](v14, "activate");

    }
    goto LABEL_25;
  }
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesDaemon showCrashBannerIfNeeded:]", 30, "Diag: Bluetooth firmware crash banner not shown due to throttle");
  if (v7 >= 0xA)
  {
LABEL_25:
    v20 = CFSTR("CrashType");
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("_input"), TypeID, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &TypedValue, &v20, 1));
    CUMetricsLog(CFSTR("com.apple.Bluetooth.Crashes"), v16);

  }
}

- (void)_fileRadarForFWCrash:(id)a3
{
  id v4;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[7];

  v4 = a3;
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _fileRadarForFWCrash:]", 30, "Diag: Bluetooth firmware crash - File Radar");
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("FWErrorType"), TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Bluetooth Crashed: %@"), v7);
  v10[0] = CFSTR("Classification");
  v10[1] = CFSTR("ComponentID");
  v11[0] = CFSTR("Crash/Hang/Data Loss");
  v11[1] = CFSTR("161045");
  v10[2] = CFSTR("ComponentName");
  v10[3] = CFSTR("ComponentVersion");
  v11[2] = CFSTR("Bluetooth (New Bugs)");
  v11[3] = CFSTR("iOS");
  v10[4] = CFSTR("ExtensionIdentifiers");
  v10[5] = CFSTR("Reproducibility");
  v11[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v11[5] = CFSTR("I Didn't Try");
  v10[6] = CFSTR("Title");
  v11[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 7));
  -[BTServicesDaemon _fileRadar:](self, "_fileRadar:", v9);

}

- (void)_fileRadarForHIDLag:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[7];

  v4 = a3;
  if (dword_10020FF08 <= 30 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _fileRadarForHIDLag:]", 30, "Diag: Bluetooth HID Lag Detected - File Radar");
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Bluetooth HID Lag Detected"));
  v7[0] = CFSTR("Classification");
  v7[1] = CFSTR("ComponentID");
  v8[0] = CFSTR("Crash/Hang/Data Loss");
  v8[1] = CFSTR("183565");
  v7[2] = CFSTR("ComponentName");
  v7[3] = CFSTR("ComponentVersion");
  v8[2] = CFSTR("CoreBluetooth - HID Lag");
  v8[3] = CFSTR("iOS");
  v7[4] = CFSTR("ExtensionIdentifiers");
  v7[5] = CFSTR("Reproducibility");
  v8[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v8[5] = CFSTR("I Didn't Try");
  v7[6] = CFSTR("Title");
  v8[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 7));
  -[BTServicesDaemon _fileRadar:](self, "_fileRadar:", v6);

}

- (void)_fileRadar:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v10, v11));
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("tap-to-radar://new")));
  objc_msgSend(v13, "setQueryItems:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
  objc_msgSend(v14, "openURL:configuration:completionHandler:", v15, 0, 0);

}

- (void)_showConnectBannerIfEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v4 = a3;
  v5 = mach_absolute_time();
  v6 = UpTicksToSeconds(v5 - self->_showConnectBannerLastTicks);
  if (self->_showConnectBannerLastTicks)
    v7 = v6 >= 0xA;
  else
    v7 = 1;
  if (v7)
  {
    v8 = mach_absolute_time();
    self->_showConnectBannerLastTicks = v8;
    if (IsAppleInternalBuild(v8))
    {
      if (!self->_dontShowConnectBanner)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        if (!objc_msgSend(v9, "length"))
        {
LABEL_21:

          goto LABEL_22;
        }
        v10 = objc_msgSend(v4, "connectedServices");

        if (v10 && (objc_msgSend(v4, "connectedServices") & 0x1000000) == 0)
        {
          if (dword_10020FF08 <= 30
            && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
          {
            LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _showConnectBannerIfEnabled:]", 30, "Diag: Show Connect Banner %d", objc_msgSend(v4, "connectedServices"));
          }
          v9 = objc_alloc_init((Class)NSDateFormatter);
          objc_msgSend(v9, "setDateFormat:", CFSTR("hh:mm:ss a"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v11));

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
          v14 = CUPrintNSDataAddress(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", (char *)objc_msgSend(v15, "length") - 5));
          if ((objc_msgSend(v4, "connectedServices") & 0x400000) != 0)
          {
            v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LE Connection at %@"), v12);
          }
          else if ((objc_msgSend(v4, "connectedServices") & 0x800000) != 0)
          {
            v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Classic Connection at %@"), v12);
          }
          else
          {
            v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connected at %@"), v12);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = objc_alloc_init((Class)CUUserNotificationSession);
          objc_msgSend(v19, "setBundleID:", CFSTR("com.apple.BTUserNotifications"));
          objc_msgSend(v19, "setCategoryID:", CFSTR("BTUserNotifications"));
          objc_msgSend(v19, "setDispatchQueue:", self->_dispatchQueue);
          objc_msgSend(v19, "setIconName:", CFSTR("Bluetooth.icns"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@"), v20, CFSTR(" ("), v16, CFSTR(")")));
          objc_msgSend(v19, "setTitleKey:", v21);

          objc_msgSend(v19, "setSubtitleKey:", v18);
          objc_msgSend(v19, "activate");
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100093F4C;
          v22[3] = &unk_1001E5410;
          v22[4] = v19;
          objc_msgSend(v19, "setActionHandler:", v22);

          goto LABEL_21;
        }
      }
    }
  }
LABEL_22:

}

- (void)_showHIDLagBannerIfEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  CUUserNotificationSession *v11;
  CUUserNotificationSession *uiNoteSession;
  CUUserNotificationSession *v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  CUUserNotificationSession *v18;
  BTServicesDaemon *v19;
  id v20;
  _QWORD v21[5];

  v4 = a3;
  v5 = mach_absolute_time();
  v6 = UpTicksToSeconds(v5 - self->_showHIDLagBannerLastTicks);
  if (self->_showHIDLagBannerLastTicks && v6 < 0x3C)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _showHIDLagBannerIfEnabled:]", 30, "Diag: Bluetooth HID lag banner not shown due to throttle");
    }
  }
  else
  {
    v7 = mach_absolute_time();
    self->_showHIDLagBannerLastTicks = v7;
    if (IsAppleInternalBuild(v7) && !self->_dontShowHIDLagBanner)
    {
      if (self->_uiNoteSession)
      {
        if (dword_10020FF08 <= 30
          && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
        {
          LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _showHIDLagBannerIfEnabled:]", 30, "Diag: Removing old HID Lag banner");
        }
        -[CUUserNotificationSession removeAllActions](self->_uiNoteSession, "removeAllActions");
        -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_input")));
      v9 = objc_msgSend(v8, "isEqual:", CFSTR("HIDLagDetected"));

      if (v9)
        v10 = CFSTR("Bluetooth HID Lag Detected");
      else
        v10 = CFSTR("Bluetooth HID Lag detected");
      if (dword_10020FF08 <= 30
        && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
      {
        LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _showHIDLagBannerIfEnabled:]", 30, "Diag: Bluetooth HID Lag Detected");
      }
      v11 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
      uiNoteSession = self->_uiNoteSession;
      self->_uiNoteSession = v11;
      v13 = v11;

      -[CUUserNotificationSession setBundleID:](v13, "setBundleID:", CFSTR("com.apple.BTUserNotifications"));
      -[CUUserNotificationSession setCategoryID:](v13, "setCategoryID:", CFSTR("BTUserNotifications"));
      -[CUUserNotificationSession setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
      -[CUUserNotificationSession setIconName:](v13, "setIconName:", CFSTR("Bluetooth.icns"));
      -[CUUserNotificationSession setTitleKey:](v13, "setTitleKey:", v10);
      -[CUUserNotificationSession setBodyKey:](v13, "setBodyKey:", CFSTR("Please file a radar"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000942E0;
      v21[3] = &unk_1001E5410;
      v21[4] = v13;
      -[CUUserNotificationSession setActionHandler:](v13, "setActionHandler:", v21);
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_100094394;
      v17 = &unk_1001E2570;
      v18 = v13;
      v19 = self;
      v20 = v4;
      -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:](v13, "addActionWithIdentifier:title:flags:handler:", CFSTR("FileRadarAction"), CFSTR("File Radar"), 0, &v14);
      -[CUUserNotificationSession activate](v13, "activate", v14, v15, v16, v17, v18, v19);

    }
  }

}

- (void)_showHIDIntervalBannerIfEnabled:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (IsAppleInternalBuild(v9) && self->_doesShowHIDIntervalBanner)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _showHIDIntervalBannerIfEnabled:]", 30, "Diag: Show HID Interval Banner");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeviceName")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Intervalms")));
    objc_msgSend(v5, "doubleValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is %.2f ms"), v4, v6));
    v8 = objc_alloc_init((Class)CUUserNotificationSession);
    objc_msgSend(v8, "setBundleID:", CFSTR("com.apple.BTUserNotifications"));
    objc_msgSend(v8, "setCategoryID:", CFSTR("BTUserNotifications"));
    objc_msgSend(v8, "setFlags:", 8);
    objc_msgSend(v8, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v8, "setIconName:", CFSTR("Bluetooth.icns"));
    objc_msgSend(v8, "setTimeoutSeconds:", 5.0);
    objc_msgSend(v8, "setTitleKey:", CFSTR("Update HID interval"));
    objc_msgSend(v8, "setSubtitleKey:", v7);
    objc_msgSend(v8, "activate");

  }
}

- (void)_cbConnectedDiscoveryEnsureStarted
{
  CBDiscovery *v3;
  CBDiscovery *cbConnectedDiscovery;
  CBDiscovery *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_cbConnectedDiscovery)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _cbConnectedDiscoveryEnsureStarted]", 30, "CB Connected Discovery monitor start");
    }
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    cbConnectedDiscovery = self->_cbConnectedDiscovery;
    self->_cbConnectedDiscovery = v3;

    -[CBDiscovery setDispatchQueue:](self->_cbConnectedDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setDiscoveryFlags:](self->_cbConnectedDiscovery, "setDiscoveryFlags:", (unint64_t)-[CBDiscovery discoveryFlags](self->_cbConnectedDiscovery, "discoveryFlags") | 0x200000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100094674;
    v7[3] = &unk_1001E30A0;
    v7[4] = self;
    -[CBDiscovery setDeviceFoundHandler:](self->_cbConnectedDiscovery, "setDeviceFoundHandler:", v7);
    v5 = self->_cbConnectedDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100094680;
    v6[3] = &unk_1001E2110;
    v6[4] = self;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_cbConnectedDiscoveryEnsureStopped
{
  CBDiscovery *cbConnectedDiscovery;

  if (self->_cbConnectedDiscovery)
  {
    if (dword_10020FF08 <= 30
      && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 30)))
    {
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _cbConnectedDiscoveryEnsureStopped]", 30, "CB Connected Discovery monitor stop");
    }
    -[CBDiscovery invalidate](self->_cbConnectedDiscovery, "invalidate");
    cbConnectedDiscovery = self->_cbConnectedDiscovery;
    self->_cbConnectedDiscovery = 0;

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BTServicesXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[6];

  v5 = a4;
  v6 = objc_alloc_init(BTServicesXPCConnection);
  -[BTServicesXPCConnection setDaemon:](v6, "setDaemon:", self);
  -[BTServicesXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[BTServicesXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BTServicesXPCClientInterface));
  v21 = objc_alloc((Class)NSSet);
  v20 = objc_opt_class(NSArray);
  v10 = objc_opt_class(NSDictionary);
  v11 = objc_opt_class(NSData);
  v12 = objc_opt_class(NSDate);
  v13 = objc_opt_class(NSError);
  v14 = objc_opt_class(NSNull);
  v15 = objc_opt_class(NSNumber);
  v16 = objc_opt_class(NSString);
  v17 = objc_msgSend(v21, "initWithObjects:", v20, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(NSUUID), 0);
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v17, "shareAudioProgressEvent:info:", 1, 0);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BTServicesXPCDaemonInterface));
  objc_msgSend(v5, "setExportedInterface:", v18);

  objc_msgSend(v5, "setExportedObject:", v6);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100094A58;
  v23[3] = &unk_1001E23E8;
  v23[4] = self;
  v23[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v23);
  objc_msgSend(v5, "setRemoteObjectInterface:", v22);
  objc_msgSend(v5, "resume");
  if (dword_10020FF08 <= 20 && (dword_10020FF08 != -1 || _LogCategory_Initialize(&dword_10020FF08, 20)))
    LogPrintF(&dword_10020FF08, "-[BTServicesDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started: %#{pid}", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (dword_10020FF08 <= 20)
  {
    if (dword_10020FF08 != -1 || (v6 = _LogCategory_Initialize(&dword_10020FF08, 20), v4 = v7, v6))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "xpcCnx"));
      LogPrintF(&dword_10020FF08, "-[BTServicesDaemon _xpcConnectionInvalidated:]", 20, "XPC connection ended: %#{pid}", objc_msgSend(v5, "processIdentifier"));

      v4 = v7;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);

}

- (void)_shareAudioActionScannerEnsureStarted
{
  SFDeviceDiscovery **p_shareAudioActionScanner;
  id v4;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];

  p_shareAudioActionScanner = &self->_shareAudioActionScanner;
  if (!self->_shareAudioActionScanner)
  {
    v4 = objc_alloc_init((Class)SFDeviceDiscovery);
    objc_storeStrong((id *)p_shareAudioActionScanner, v4);
    objc_msgSend(v4, "setChangeFlags:", 5);
    objc_msgSend(v4, "setDiscoveryFlags:", 16);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v4, "setPurpose:", CFSTR("ShareAudio"));
    objc_msgSend(v4, "setRssiThreshold:", -70);
    objc_msgSend(v4, "setScanRate:", 20);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100094CDC;
    v8[3] = &unk_1001E3240;
    v8[4] = self;
    v8[5] = v4;
    objc_msgSend(v4, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100094D00;
    v7[3] = &unk_1001E3240;
    v7[4] = self;
    v7[5] = v4;
    objc_msgSend(v4, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100094D24;
    v6[3] = &unk_1001E3268;
    v6[4] = self;
    v6[5] = v4;
    objc_msgSend(v4, "setDeviceChangedHandler:", v6);
    if (dword_100210038 <= 30
      && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    {
      LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerEnsureStarted]", 30, "Action scanner start");
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100094D48;
    v5[3] = &unk_1001E2410;
    v5[4] = self;
    v5[5] = v4;
    objc_msgSend(v4, "activateWithCompletion:", v5);

  }
}

- (void)_shareAudioActionScannerEnsureStopped
{
  SFDeviceDiscovery *shareAudioActionScanner;

  if (self->_shareAudioActionScanner)
  {
    if (dword_100210038 <= 30
      && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    {
      LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerEnsureStopped]", 30, "Action scanner stop");
    }
    -[SFDeviceDiscovery invalidate](self->_shareAudioActionScanner, "invalidate");
    shareAudioActionScanner = self->_shareAudioActionScanner;
    self->_shareAudioActionScanner = 0;

  }
}

- (void)_shareAudioActionScannerDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *shareAudioActionTriggeredDevices;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    if (objc_msgSend(v16, "deviceActionType") == 31)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bleDevice"));
      if (self->_shareAudioActionUINoteSession)
      {
        if (dword_100210038 <= 10
          && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 10)))
        {
          LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]", 10, "Action scanner ignoring: already prompted, %@", v6);
        }
      }
      else if (self->_shareAudioSession)
      {
        if (dword_100210038 <= 10
          && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 10)))
        {
          LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]", 10, "Action scanner ignoring: already in-progress, %@", v6);
        }
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_shareAudioActionTriggeredDevices, "objectForKeyedSubscript:", v5));

        if (v7)
        {
          if (dword_100210038 <= 10
            && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 10)))
          {
            LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]", 10, "Action scanner ignoring: triggered, %@", v6);
          }
        }
        else
        {
          v8 = (uint64_t)objc_msgSend(v6, "smoothedRSSI");
          if (v8 <= -71)
          {
            if (dword_100210038 <= 10)
            {
              v15 = v8;
              if (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 10))
                LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]", 10, "Action scanner ignoring: weak RSSI %d, %@", v15, v6);
            }
          }
          else if ((-[CUBluetoothClient statusFlags](self->_shareAudioConnectedDeviceMonitor, "statusFlags") & 8) != 0)
          {
            if (dword_100210038 <= 30
              && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
            {
              LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]", 30, "Action scanner triggering connect banner: %@", v6);
            }
            shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
            v10 = v16;
            if (!shareAudioActionTriggeredDevices)
            {
              v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v12 = self->_shareAudioActionTriggeredDevices;
              self->_shareAudioActionTriggeredDevices = v11;

              v10 = v16;
              shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](shareAudioActionTriggeredDevices, "setObject:forKeyedSubscript:", v10, v5);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_shareAudioConnectedDeviceMap, "allValues"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

            if (v14 && (objc_msgSend(v16, "deviceFlags") & 8) != 0)
              -[BTServicesDaemon _shareAudioSessionStartWithDarwinDevice:wxDevice:](self, "_shareAudioSessionStartWithDarwinDevice:wxDevice:", v16, v14);
            else
              -[BTServicesDaemon _shareAudioShowConnectBanner:](self, "_shareAudioShowConnectBanner:", v16);

          }
          else if (dword_100210038 <= 10
                 && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 10)))
          {
            LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]", 10, "Action scanner ignoring: no self ShareAudio, %@", v6);
          }
        }
      }

    }
    else
    {
      -[BTServicesDaemon _shareAudioActionScannerDeviceLost:](self, "_shareAudioActionScannerDeviceLost:", v16);
    }
  }

}

- (void)_shareAudioActionScannerDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  CUUserNotificationSession *shareAudioActionUINoteSession;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_shareAudioActionTriggeredDevices, "objectForKeyedSubscript:", v5));

    if (v6)
    {
      if (dword_100210038 <= 30
        && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
        LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceLost:]", 30, "Action scanner lost: %@", v7);

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shareAudioActionTriggeredDevices, "setObject:forKeyedSubscript:", 0, v5);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](self->_shareAudioActionUINoteSession, "identifier"));
    v9 = objc_msgSend(v8, "isEqual:", v5);

    if (v9)
    {
      if (dword_100210038 <= 30
        && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));
        LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioActionScannerDeviceLost:]", 30, "Action scanner canceling banner: lost, %@", v10);

      }
      -[CUUserNotificationSession invalidate](self->_shareAudioActionUINoteSession, "invalidate");
      shareAudioActionUINoteSession = self->_shareAudioActionUINoteSession;
      self->_shareAudioActionUINoteSession = 0;

    }
  }

}

- (void)_shareAudioConnectedMonitorEnsureStarted
{
  CUBluetoothClient *v3;
  CUBluetoothClient *shareAudioConnectedDeviceMonitor;
  CUBluetoothClient *v5;
  _QWORD v6[6];
  _QWORD v7[6];

  if (!self->_shareAudioConnectedDeviceMonitor)
  {
    if (dword_100210038 <= 30
      && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    {
      LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioConnectedMonitorEnsureStarted]", 30, "Connected monitor start");
    }
    v3 = (CUBluetoothClient *)objc_alloc_init((Class)CUBluetoothClient);
    shareAudioConnectedDeviceMonitor = self->_shareAudioConnectedDeviceMonitor;
    self->_shareAudioConnectedDeviceMonitor = v3;
    v5 = v3;

    -[CUBluetoothClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBluetoothClient setFlags:](v5, "setFlags:", 24);
    -[CUBluetoothClient setLabel:](v5, "setLabel:", CFSTR("ShareAudio"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000954B4;
    v7[3] = &unk_1001E5438;
    v7[4] = v5;
    v7[5] = self;
    -[CUBluetoothClient setDeviceConnectedHandler:](v5, "setDeviceConnectedHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000954D0;
    v6[3] = &unk_1001E5438;
    v6[4] = v5;
    v6[5] = self;
    -[CUBluetoothClient setDeviceDisconnectedHandler:](v5, "setDeviceDisconnectedHandler:", v6);
    -[CUBluetoothClient activate](v5, "activate");

  }
}

- (void)_shareAudioConnectedMonitorEnsureStopped
{
  CUBluetoothClient *shareAudioConnectedDeviceMonitor;

  if (self->_shareAudioConnectedDeviceMonitor)
  {
    if (dword_100210038 <= 30
      && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    {
      LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioConnectedMonitorEnsureStopped]", 30, "Connected monitor start");
    }
    -[CUBluetoothClient invalidate](self->_shareAudioConnectedDeviceMonitor, "invalidate");
    shareAudioConnectedDeviceMonitor = self->_shareAudioConnectedDeviceMonitor;
    self->_shareAudioConnectedDeviceMonitor = 0;

  }
}

- (void)_shareAudioConnectedDeviceFound:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *shareAudioConnectedDeviceMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "deviceFlags");
  v5 = v11;
  if ((v4 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    if (v7)
    {
      if (dword_100210038 <= 30
        && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
      {
        LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioConnectedDeviceFound:]", 30, "Connected device: %@", v11);
      }
      shareAudioConnectedDeviceMap = self->_shareAudioConnectedDeviceMap;
      if (!shareAudioConnectedDeviceMap)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v10 = self->_shareAudioConnectedDeviceMap;
        self->_shareAudioConnectedDeviceMap = v9;

        shareAudioConnectedDeviceMap = self->_shareAudioConnectedDeviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](shareAudioConnectedDeviceMap, "setObject:forKeyedSubscript:", v11, v7);
    }

    v5 = v11;
  }

}

- (void)_shareAudioConnectedDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_shareAudioConnectedDeviceMap, "objectForKeyedSubscript:", v5));

    if (v6)
    {
      if (dword_100210038 <= 30
        && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
      {
        LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioConnectedDeviceLost:]", 30, "Disconnected device: %@", v7);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shareAudioConnectedDeviceMap, "setObject:forKeyedSubscript:", 0, v5);
    }
  }

}

- (void)_shareAudioShowConnectBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CUUserNotificationSession *v11;
  CUUserNotificationSession *shareAudioActionUINoteSession;
  CUUserNotificationSession *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  _QWORD *(*v22)(_QWORD *);
  void *v23;
  CUUserNotificationSession *v24;
  BTServicesDaemon *v25;
  id v26;
  id v27;
  _QWORD v28[6];
  const __CFString *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_shareAudioConnectedDeviceMap, "allValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    if (!objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.ShareAudioNotifications.bundle")));
      v9 = CULocalizedStringEx(v8, CFSTR("Localizable"), CFSTR("APPLETV"));
      v10 = objc_claimAutoreleasedReturnValue(v9);

      v7 = (void *)v10;
    }
    v11 = (CUUserNotificationSession *)objc_alloc_init((Class)CUUserNotificationSession);
    shareAudioActionUINoteSession = self->_shareAudioActionUINoteSession;
    self->_shareAudioActionUINoteSession = v11;
    v13 = v11;

    -[CUUserNotificationSession setBundleID:](v13, "setBundleID:", CFSTR("com.apple.ShareAudioNotifications"));
    -[CUUserNotificationSession setCategoryID:](v13, "setCategoryID:", CFSTR("ShareAudioCategoryID"));
    -[CUUserNotificationSession setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
    -[CUUserNotificationSession setFlags:](v13, "setFlags:", 9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    -[CUUserNotificationSession setIdentifier:](v13, "setIdentifier:", v15);

    -[CUUserNotificationSession setLabel:](v13, "setLabel:", CFSTR("ShareAudio"));
    -[CUUserNotificationSession setTitleKey:](v13, "setTitleKey:", v7);
    -[CUUserNotificationSession setBodyKey:](v13, "setBodyKey:", CFSTR("SHARE_AUDIO_BODY_FORMAT"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v17 = (void *)v16;
    v18 = CFSTR("?");
    if (v16)
      v18 = (const __CFString *)v16;
    v29 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    -[CUUserNotificationSession setBodyArguments:](v13, "setBodyArguments:", v19);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100095A58;
    v28[3] = &unk_1001E29B8;
    v28[4] = v13;
    v28[5] = self;
    -[CUUserNotificationSession setActionHandler:](v13, "setActionHandler:", v28);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100095B30;
    v23 = &unk_1001E5460;
    v24 = v13;
    v25 = self;
    v26 = v4;
    v27 = v6;
    -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:](v13, "addActionWithIdentifier:title:flags:handler:", CFSTR("ShareAudioActionIDConnect"), CFSTR("SHARE_AUDIO_BUTTON"), 0, &v20);
    -[CUUserNotificationSession activate](v13, "activate", v20, v21, v22, v23, v24, v25);

  }
  else if (dword_100210038 <= 30
         && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
  {
    LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioShowConnectBanner:]", 30, "No connected ShareAudio device");
  }

}

- (void)_shareAudioSessionStartWithDarwinDevice:(id)a3 wxDevice:(id)a4
{
  id v6;
  id v7;
  BTShareAudioSessionDaemon *v8;
  BTShareAudioSessionDaemon *shareAudioSession;
  BTShareAudioSessionDaemon *v10;
  _QWORD v11[6];

  v6 = a3;
  v7 = a4;
  if (self->_shareAudioSession)
  {
    if (dword_100210038 <= 30
      && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    {
      LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioSessionStartWithDarwinDevice:wxDevice:]", 30, "Aborting previous session to start new one: %@", v6);
    }
    -[BTShareAudioSessionDaemon invalidate](self->_shareAudioSession, "invalidate");
  }
  if (dword_100210038 <= 30 && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioSessionStartWithDarwinDevice:wxDevice:]", 30, "Session start: Darwin %@, Wx %@", v6, v7);
  v8 = objc_alloc_init(BTShareAudioSessionDaemon);
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = v8;
  v10 = v8;

  -[BTShareAudioSessionDaemon setDarwinDevice:](v10, "setDarwinDevice:", v6);
  -[BTShareAudioSessionDaemon setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
  -[BTShareAudioSessionDaemon setMode:](v10, "setMode:", 1);
  -[BTShareAudioSessionDaemon setWxDevice:](v10, "setWxDevice:", v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100095D74;
  v11[3] = &unk_1001E5488;
  v11[4] = v10;
  v11[5] = self;
  -[BTShareAudioSessionDaemon setProgressHandler:](v10, "setProgressHandler:", v11);
  -[BTShareAudioSessionDaemon activate](v10, "activate");

}

- (void)_shareAudioSessionEnded:(id)a3
{
  BTShareAudioSessionDaemon *shareAudioSession;
  id v5;

  v5 = a3;
  if (dword_100210038 <= 30 && (dword_100210038 != -1 || _LogCategory_Initialize(&dword_100210038, 30)))
    LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioSessionEnded:]", 30, "Session ended: %{error}", v5);
  -[BTShareAudioSessionDaemon invalidate](self->_shareAudioSession, "invalidate");
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

}

- (void)_shareAudioSessionProgressEvent:(int)a3 info:(id)a4
{
  const char *v6;
  const __CFString *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;

  v13 = (__CFString *)a4;
  if (dword_100210038 > 30 || dword_100210038 == -1 && !_LogCategory_Initialize(&dword_100210038, 30))
    goto LABEL_42;
  if (a3 > 119)
  {
    if (a3 <= 219)
    {
      switch(a3)
      {
        case 120:
          v6 = "ShowPairInstructions";
          goto LABEL_39;
        case 200:
          v6 = "GuestiOSConnecting";
          goto LABEL_39;
        case 210:
          v6 = "GuestiOSAuthenticated";
          goto LABEL_39;
      }
    }
    else if (a3 > 309)
    {
      if (a3 == 310)
      {
        v6 = "GuestHeadphonesConnected";
        goto LABEL_39;
      }
      if (a3 == 320)
      {
        v6 = "GuestHeadphonesWaitForRoute";
        goto LABEL_39;
      }
    }
    else
    {
      if (a3 == 220)
      {
        v6 = "GuestiOSWaitingForAccept";
        goto LABEL_39;
      }
      if (a3 == 300)
      {
        v6 = "GuestHeadphonesConnecting";
        goto LABEL_39;
      }
    }
LABEL_38:
    v6 = "?";
    goto LABEL_39;
  }
  if (a3 <= 29)
  {
    switch(a3)
    {
      case 0:
        v6 = "Invalid";
        goto LABEL_39;
      case 10:
        v6 = "Activated";
        goto LABEL_39;
      case 20:
        v6 = "Invalidated";
        goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v6 = "Failed";
      goto LABEL_39;
    }
    if (a3 == 100)
    {
      v6 = "Confirm";
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (a3 == 30)
  {
    v6 = "Interrupted";
    goto LABEL_39;
  }
  if (a3 != 40)
    goto LABEL_38;
  v6 = "Succeeded";
LABEL_39:
  v7 = &stru_1001ED4C0;
  if (v13)
    v7 = v13;
  LogPrintF(&dword_100210038, "-[BTServicesDaemon _shareAudioSessionProgressEvent:info:]", 30, "Session progress: %s %##@", v6, v7);
LABEL_42:
  if (a3 == 50)
  {
    TypeID = CFErrorGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v13, CFSTR("error"), TypeID, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v10)
    {
      -[BTServicesDaemon _shareAudioSessionEnded:](self, "_shareAudioSessionEnded:", v10);
    }
    else
    {
      v11 = BTErrorF(4294960596, "Failed without error?");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[BTServicesDaemon _shareAudioSessionEnded:](self, "_shareAudioSessionEnded:", v12);

    }
  }
  else if (a3 == 40)
  {
    -[BTServicesDaemon _shareAudioSessionEnded:](self, "_shareAudioSessionEnded:", 0);
  }

}

- (BOOL)ignoreBTRestart
{
  return self->_ignoreBTRestart;
}

- (void)setIgnoreBTRestart:(BOOL)a3
{
  self->_ignoreBTRestart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_uiNoteSession, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong((id *)&self->_shareAudioActionUINoteSession, 0);
  objc_storeStrong((id *)&self->_shareAudioConnectedDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_shareAudioConnectedDeviceMap, 0);
  objc_storeStrong((id *)&self->_shareAudioActionTriggeredDevices, 0);
  objc_storeStrong((id *)&self->_shareAudioActionScanner, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cbController, 0);
  objc_storeStrong((id *)&self->_cbConnectedDiscovery, 0);
  objc_storeStrong((id *)&self->_audioQualityBanner, 0);
}

@end
