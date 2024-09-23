@implementation BTUserCloudServicesDaemon

+ (id)sharedBTServicesDaemon
{
  if (qword_1002125F8 != -1)
    dispatch_once(&qword_1002125F8, &stru_1001E4AC8);
  return (id)qword_1002125F0;
}

- (BTUserCloudServicesDaemon)init
{
  BTUserCloudServicesDaemon *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  BTUserCloudServicesDaemon *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BTUserCloudServicesDaemon;
  v2 = -[BTUserCloudServicesDaemon init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BTUserCloudServicesDaemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  void *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.bluetooth"), 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (!v6)
        {
          v26 = v7;
          NSAppendPrintF(&v26, "\n");
          v11 = v26;

          v7 = v11;
        }
        v12 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
        {
          v13 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), v10, 0, 0);
          v25 = v7;
          NSAppendPrintF(&v25, "Pref: '%@' = '%##@'\n", v10, v13);
          v14 = v25;

          ++v6;
          v7 = v14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  v24 = v7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "statedumpAndRecordDailyMetric"));
  NSAppendPrintF(&v24, "%@\n", v16);
  v17 = v24;

  v23 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deviceManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "printDebug"));
  NSAppendPrintF(&v23, "%@\n", v20);
  v21 = v23;

  return v21;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007508C;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v6[5];

  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.BluetoothCloudServices"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  if (!self->_stateHandle)
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000751B4;
    v6[3] = &unk_1001E2940;
    v6[4] = self;
    self->_stateHandle = os_state_add_handler(dispatchQueue, v6);
  }
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075228;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;
  unint64_t stateHandle;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  stateHandle = self->_stateHandle;
  if (stateHandle)
  {
    os_state_remove_handler(stateHandle);
    self->_stateHandle = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  BTCloudServicesXPCConnection *v7;
  NSMutableSet *xpcConnections;
  NSMutableSet *v9;
  NSMutableSet *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BTCloudServicesXPCConnection *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  BTUserCloudServicesDaemon *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id location;
  _OWORD v40[3];

  v28 = a3;
  v6 = a4;
  v7 = objc_alloc_init(BTCloudServicesXPCConnection);
  -[BTCloudServicesXPCConnection setDaemon:](v7, "setDaemon:", self);
  -[BTCloudServicesXPCConnection setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  -[BTCloudServicesXPCConnection setXpcCnx:](v7, "setXpcCnx:", v6);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  v35 = self;
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  memset(v40, 0, 32);
  if (v6)
    objc_msgSend(v6, "auditToken");
  v36 = v6;
  v11 = xpc_copy_code_signing_identity_for_token(v40);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
    free(v12);
  }
  else
  {
    v13 = 0;
  }
  v27 = (void *)v13;
  -[BTCloudServicesXPCConnection setSigningIdentity:](v7, "setSigningIdentity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BTCloudServicesXPCClientInterface));
  v34 = objc_alloc((Class)NSSet);
  v33 = objc_opt_class(NSArray);
  v32 = objc_opt_class(NSDictionary);
  v31 = objc_opt_class(NSData);
  v30 = objc_opt_class(NSDate);
  v29 = objc_opt_class(NSError);
  v15 = objc_opt_class(NSFileHandle);
  v16 = v7;
  v17 = objc_opt_class(NSNull);
  v18 = objc_opt_class(NSNumber);
  v19 = objc_opt_class(NSString);
  v20 = objc_opt_class(NSUUID);
  v21 = objc_opt_class(BTCloudDevice);
  v22 = objc_opt_class(BTMagicPairingSettings);
  v23 = objc_opt_class(BTCloudDeviceSupportInformation);
  v24 = objc_msgSend(v34, "initWithObjects:", v33, v32, v31, v30, v29, v15, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(BTCloudSoundProfileRecord), 0);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "createDeviceRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "modifyDeviceRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deleteDeviceRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deviceRecord:completion:", 1, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deviceRecordsWithCompletion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "createDeviceSupportInformationRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "modifyDeviceSupportInformationRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deleteDeviceSupportInformationRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deviceSupportInformationRecord:completion:", 1, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deviceSupportInformationRecordsWithCompletion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "createMagicSettingsRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "modifyMagicSettingsRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deleteDeviceRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "magicSettingsRecord:completion:", 1, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "magicSettingsRecordsWithCompletion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "accountInfoWithCompletion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "cloudPairingIdentifierForPeripheral:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "cloudPairingIdentifierForPeripheral:completion:", 1, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "createSoundProfileRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "modifySoundProfileRecord:completion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "fetchSoundProfileRecordWithCompletion:", 0, 1);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, "deleteSoundProfileRecordWithCompletion:", 0, 1);
  objc_msgSend(v36, "_setQueue:", v35->_dispatchQueue);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BTCloudServicesXPCDaemonInterface));
  objc_msgSend(v36, "setExportedInterface:", v25);

  objc_msgSend(v36, "setExportedObject:", v16);
  objc_initWeak(&location, v35);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100075908;
  v37[3] = &unk_1001E4768;
  objc_copyWeak(&v38, &location);
  v37[4] = v16;
  objc_msgSend(v36, "setInvalidationHandler:", v37);
  objc_msgSend(v36, "setRemoteObjectInterface:", v14);
  objc_msgSend(v36, "resume");
  if (dword_10020FC38 <= 20 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 20)))
    LogPrintF(&dword_10020FC38, "-[BTUserCloudServicesDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started: %#{pid}", objc_msgSend(v36, "processIdentifier"));
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

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
  if (dword_10020FC38 <= 20)
  {
    if (dword_10020FC38 != -1 || (v6 = _LogCategory_Initialize(&dword_10020FC38, 20), v4 = v7, v6))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "xpcCnx"));
      LogPrintF(&dword_10020FC38, "-[BTUserCloudServicesDaemon _xpcConnectionInvalidated:]", 20, "XPC connection ended: %#{pid}", objc_msgSend(v5, "processIdentifier"));

      v4 = v7;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
