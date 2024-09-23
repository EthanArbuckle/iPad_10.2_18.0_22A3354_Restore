@implementation RPStatusDaemon

+ (id)sharedStatusDaemon
{
  if (qword_100132370 != -1)
    dispatch_once(&qword_100132370, &stru_100114DA0);
  return (id)qword_100132368;
}

- (RPStatusDaemon)init
{
  RPStatusDaemon *v2;
  RPStatusDaemon *v3;
  RPStatusDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPStatusDaemon;
  v2 = -[RPStatusDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSMutableSet *obj;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  _BYTE v39[128];

  if (a3 < 21)
  {
    v38 = 0;
    NSAppendPrintF(&v38, "-- RPStatusDaemon --\n");
    v7 = v38;
    if (a3 >= 11)
      v8 = 50;
    else
      v8 = 30;
    v9 = -[NSMutableSet count](self->_xpcConnections, "count");
    if (v9)
    {
      v37 = v7;
      NSAppendPrintF(&v37, "%d XPC Cnx\n", (_DWORD)v9);
      v10 = v37;

      v7 = v10;
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = self->_xpcConnections;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v32 = v7;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "xpcCnx"));
          NSAppendPrintF(&v32, "    %#{pid}", objc_msgSend(v16, "processIdentifier"));
          v17 = v32;

          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subscriber"));
          v19 = (void *)v18;
          if (v18)
          {
            v31 = v17;
            v20 = CUDescriptionWithLevel(v18, v8);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            NSAppendPrintF(&v31, ", %@", v21);
            v22 = v31;

            v17 = v22;
          }

          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "provider"));
          v24 = (void *)v23;
          if (v23)
          {
            v30 = v17;
            v25 = CUDescriptionWithLevel(v23, v8);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            NSAppendPrintF(&v30, ", %@", v26);
            v27 = v30;

            v17 = v27;
          }

          v29 = v17;
          NSAppendPrintF(&v29, "\n");
          v7 = v29;

        }
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v12);
    }

    return v7;
  }
  else
  {
    v4 = NSPrintF("RPPeopleDaemon %{ptr}", a2, self);
    return (id)objc_claimAutoreleasedReturnValue(v4);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE0D0;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  RPMessageable *v5;
  RPMessageable *messenger;
  void *v7;
  const __CFString *v8;
  _UNKNOWN **v9;

  if (dword_100131B88 <= 30 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    LogPrintF(&dword_100131B88, "-[RPStatusDaemon _activate]", 30, "Activate\n");
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.rapport.StatusUpdates"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  if (!self->_messenger)
  {
    v5 = (RPMessageable *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
    messenger = self->_messenger;
    self->_messenger = v5;

    v8 = CFSTR("statusFlags");
    v9 = &off_10011ACE0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    -[RPMessageable registerEventID:options:handler:](self->_messenger, "registerEventID:options:handler:", CFSTR("_statusInfo"), v7, &stru_100114DE0);

  }
  -[RPStatusDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE334;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100131B88 <= 30
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusDaemon _invalidate]", 30, "Invalidating\n");
    }
    -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_statusInfo"));
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    -[RPStatusDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100131B88 <= 30
      && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 30)))
    {
      LogPrintF(&dword_100131B88, "-[RPStatusDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPStatusUpdatableXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSXPCInterface *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSXPCInterface *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  _QWORD v76[6];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = -[RPStatusUpdatableXPCConnection initWithDaemon:xpcCnx:]([RPStatusUpdatableXPCConnection alloc], "initWithDaemon:xpcCnx:", self, v5);
  -[RPStatusUpdatableXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  v10 = self->_xpcClientInterface;
  if (!v10)
  {
    v74 = objc_alloc((Class)NSSet);
    v72 = objc_opt_class(NSArray, v11, v12);
    v15 = objc_opt_class(NSDictionary, v13, v14);
    v18 = objc_opt_class(NSData, v16, v17);
    v21 = objc_opt_class(NSDate, v19, v20);
    v24 = objc_opt_class(NSNull, v22, v23);
    v27 = objc_opt_class(NSNumber, v25, v26);
    v30 = objc_opt_class(NSString, v28, v29);
    v33 = objc_msgSend(v74, "initWithObjects:", v72, v15, v18, v21, v24, v27, v30, objc_opt_class(NSUUID, v31, v32), 0);
    v10 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPStatusUpdatableXPCClientInterface));
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v33, "xpcStatusUpdatableGiveStatusUpdate:peerDevice:currentState:statusInfo:", 1, 0);
    objc_storeStrong((id *)&self->_xpcClientInterface, v10);

  }
  v34 = self->_xpcDaemonInterface;
  if (!v34)
  {
    v75 = objc_alloc((Class)NSSet);
    v73 = objc_opt_class(NSArray, v35, v36);
    v71 = objc_opt_class(NSDictionary, v37, v38);
    v41 = objc_opt_class(NSData, v39, v40);
    v44 = objc_opt_class(NSDate, v42, v43);
    v47 = objc_opt_class(NSNull, v45, v46);
    v50 = objc_opt_class(NSNumber, v48, v49);
    v53 = objc_opt_class(NSString, v51, v52);
    v56 = objc_msgSend(v75, "initWithObjects:", v73, v71, v41, v44, v47, v50, v53, objc_opt_class(NSUUID, v54, v55), 0);
    v57 = objc_alloc((Class)NSSet);
    v60 = objc_opt_class(NSArray, v58, v59);
    v63 = objc_msgSend(v57, "initWithObjects:", v60, objc_opt_class(RPStatusDevice, v61, v62), 0);
    v34 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPStatusUpdatableXPCDaemonInterface));
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v34, "setClasses:forSelector:argumentIndex:ofReply:", v63, "xpcStatusSubscriberActivate:completion:", 0, 1);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v34, "setClasses:forSelector:argumentIndex:ofReply:", v63, "xpcStatusProviderActivate:completion:", 0, 1);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v34, "setClasses:forSelector:argumentIndex:ofReply:", v56, "xpcStatusUpdatableProvideStatus:statusInfo:", 0, 0);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:](v34, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v64, v65), "xpcStatusUpdatableCancelProvideStatus:", 0, 0);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:](v34, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v66, v67), "xpcStatusUpdatableSubscribeToStatus:", 0, 0);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:](v34, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSString, v68, v69), "xpcStatusUpdatableUnsubscribeToStatus:", 0, 0);
    objc_storeStrong((id *)&self->_xpcDaemonInterface, v34);

  }
  objc_msgSend(v5, "setExportedInterface:", v34);
  objc_msgSend(v5, "setExportedObject:", v6);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000AE92C;
  v76[3] = &unk_100111928;
  v76[4] = self;
  v76[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v76);
  objc_msgSend(v5, "setRemoteObjectInterface:", v10);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(v5, "resume");
  if (dword_100131B88 <= 20 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 20)))
    LogPrintF(&dword_100131B88, "-[RPStatusDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

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

  -[RPStatusDaemon _update](self, "_update");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcDaemonInterface, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcClientInterface, 0);
}

@end
