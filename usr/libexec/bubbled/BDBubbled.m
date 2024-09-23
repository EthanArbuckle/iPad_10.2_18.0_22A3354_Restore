@implementation BDBubbled

+ (id)sharedXPCInterface
{
  if (qword_100011D90 != -1)
    dispatch_once(&qword_100011D90, &stru_10000C4F0);
  return (id)qword_100011D88;
}

- (id)keybagdProxy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &stru_10000C530));

  return v3;
}

- (void)powerLog:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = a3;
  if (qword_100011D98
    || (v6 = dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2),
        (qword_100011D98 = (uint64_t)v6) == 0))
  {
    v4 = off_100011DA0;
    if (!off_100011DA0)
      return;
  }
  else
  {
    v4 = dlsym(v6, "PLLogRegisteredEvent");
    off_100011DA0 = v4;
    if (!v4)
      return;
  }
  v7 = CFSTR("status");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v8 = v5;
  ((void (*)(uint64_t, const __CFString *, NSDictionary *, _QWORD))v4)(58, CFSTR("SYNCBUBBLE STATUS"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1), 0);

  if (v3)
    NSLog(CFSTR("Bubbled POWERLOG: YES"));
  else
    NSLog(CFSTR("Bubbled POWERLOG: NO"));
}

- (void)start
{
  NSDate *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id location;

  -[BDBubbled powerLog:](self, "powerLog:", 1);
  v3 = objc_opt_new(NSDate);
  -[BDBubbled setLaunchDate:](self, "setLaunchDate:", v3);

  -[BDBubbled setPopStatus:](self, "setPopStatus:", 0);
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.mobile.keybagd.UserManager.xpc"), 4096);
  -[BDBubbled setKeybagdConnection:](self, "setKeybagdConnection:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BDKeybagd));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection"));
  objc_msgSend(v6, "setRemoteObjectInterface:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BDBubbled sharedXPCInterface](BDBubbled, "sharedXPCInterface"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection"));
  objc_msgSend(v8, "setExportedInterface:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection"));
  objc_msgSend(v9, "setExportedObject:", self);

  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection"));
  objc_msgSend(v10, "setInterruptionHandler:", &stru_10000C550);

  objc_copyWeak(&v14, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection", _NSConcreteStackBlock, 3221225472, sub_100006D30, &unk_10000C578));
  objc_msgSend(v11, "setInvalidationHandler:", &v13);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdConnection](self, "keybagdConnection"));
  objc_msgSend(v12, "resume");

  -[BDBubbled fetchMachServiceNames](self, "fetchMachServiceNames");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)fetchMachServiceNames
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = getuid();
  v4 = getpid();
  NSLog(CFSTR("UID:%d, PID %d"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdProxy](self, "keybagdProxy"));
  v6 = getpid();
  v7 = getuid();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006EA8;
  v8[3] = &unk_10000C5A0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "fetchMachServiceNameswithPID:WithUID:WithCompletionHandler:", v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)beginNextClient
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled machServiceNames](self, "machServiceNames"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    NSLog(CFSTR("In beginNextClient, setting up connection with received mach service"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled machServiceNames](self, "machServiceNames"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    NSLog(CFSTR("In beginNextClient, setting up connection with received mach service %@"), v6);

    v7 = objc_alloc((Class)NSXPCConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled machServiceNames](self, "machServiceNames"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = objc_msgSend(v7, "initWithMachServiceName:options:", v9, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedXPCInterface](RDClient, "sharedXPCInterface"));
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BDServer sharedXPCInterface](BDServer, "sharedXPCInterface"));
    objc_msgSend(v10, "setExportedInterface:", v12);

    objc_msgSend(v10, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000071D4;
    v16[3] = &unk_10000C578;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "setInterruptionHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007218;
    v14[3] = &unk_10000C578;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "setInvalidationHandler:", v14);
    NSLog(CFSTR("resuming Connection for MACHService"));
    objc_msgSend(v10, "resume");
    NSLog(CFSTR("STARTED Connection for MACHService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient clientWithXPCConnection:](RDClient, "clientWithXPCConnection:", v10));
    -[BDBubbled setCurrentClient:](self, "setCurrentClient:", v13);

    NSLog(CFSTR("Kickstarting Connection for MACHService"));
    -[BDBubbled kickstartCurrentClient](self, "kickstartCurrentClient");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    NSLog(CFSTR("beginNextClient BUBBLEPOPCALL"));
    -[BDBubbled bubbleIsOkayToPop](self, "bubbleIsOkayToPop");
  }
}

- (void)kickstartCurrentClient
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  NSLog(CFSTR("Calling Upload Connection for MACHService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient"));
  objc_msgSend(v3, "clearTaskLists");

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1000073C0;
  v8[4] = sub_1000073D0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled machServiceNames](self, "machServiceNames"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000073D8;
  v6[3] = &unk_10000C5C8;
  objc_copyWeak(&v7, &location);
  v6[4] = v8;
  objc_msgSend(v5, "uploadContentWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);

  objc_destroyWeak(&location);
}

- (void)removeCurrentClient
{
  void *v3;

  NSLog(CFSTR("Removing machservice"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled machServiceNames](self, "machServiceNames"));
  objc_msgSend(v3, "removeObjectAtIndex:", 0);

  -[BDBubbled setCurrentClient:](self, "setCurrentClient:", 0);
  -[BDBubbled beginNextClient](self, "beginNextClient");
}

- (void)removeCurrentClientAndMachServiceName
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  NSLog(CFSTR("BD: REMOVE CURRENT CLIENT AND MACH SERVICE NAME"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled machServiceNames](self, "machServiceNames"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdProxy](self, "keybagdProxy"));
  v5 = getpid();
  objc_msgSend(v4, "removeMachServiceName:withPID:WithUID:", v6, v5, getuid());

  -[BDBubbled removeCurrentClient](self, "removeCurrentClient");
}

- (void)bubbleIsOkayToPop
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  NSLog(CFSTR("BD: BUBBLE IS OKAY TO POP"), a2);
  v3 = -[BDBubbled popStatus](self, "popStatus");
  NSLog(CFSTR("Bubble is popping with Status:%lu"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled keybagdProxy](self, "keybagdProxy"));
  v5 = getpid();
  objc_msgSend(v4, "StopBubbleWithPID:WithUID:WithStatus:", v5, getuid(), v3);

  -[BDBubbled powerLog:](self, "powerLog:", 0);
  NSLog(CFSTR("XXXXXXX BUBBLED END XXXXXXXX"));
  exit(0);
}

- (void)bubbleShouldPop
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  NSLog(CFSTR("In bubbleShouldPop BDBubbled.m"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient"));

  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100007774;
    v5[3] = &unk_10000C578;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "willSwitchToUser:completionHandler:", 0, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[BDBubbled bubbleIsOkayToPop](self, "bubbleIsOkayToPop");
  }
}

- (void)verifyCurrentClientHasPID:(int)a3 thenCallBlock:(id)a4
{
  uint64_t v4;
  void *v6;
  unsigned int v7;
  void *v8;
  void (**v9)(void);

  v4 = *(_QWORD *)&a3;
  v9 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient"));
  v7 = objc_msgSend(v6, "pid");

  if (v7 == (_DWORD)v4)
  {
    v9[2]();
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient"));
    NSLog(CFSTR("BD: Our current client (pid %d) is not pid %d"), objc_msgSend(v8, "pid"), v4);

  }
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
  -[BDBubbled addUserSwitchBlockingTask:forPID:completionHandler:](self, "addUserSwitchBlockingTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
  -[BDBubbled removeUserSwitchBlockingTask:forPID:completionHandler:](self, "removeUserSwitchBlockingTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  NSLog(CFSTR("BD: ADD USER SWITCH TASK: %@"), v8);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000079B4;
  v11[3] = &unk_10000C5F0;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  -[BDBubbled verifyCurrentClientHasPID:thenCallBlock:](self, "verifyCurrentClientHasPID:thenCallBlock:", v6, v11);
  if (v9)
    v9[2](v9, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  NSLog(CFSTR("BD: REMOVE USER SWITCH TASK: %@"), v8);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007B18;
  v11[3] = &unk_10000C5F0;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  -[BDBubbled verifyCurrentClientHasPID:thenCallBlock:](self, "verifyCurrentClientHasPID:thenCallBlock:", v6, v11);
  if (v9)
    v9[2](v9, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4
{
  -[BDBubbled addUserSyncTask:forPID:completionHandler:](self, "addUserSyncTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4
{
  -[BDBubbled removeUserSyncTask:forPID:completionHandler:](self, "removeUserSyncTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  NSLog(CFSTR("BD: ADD USER SYNC TASK: %@"), v8);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007CEC;
  v11[3] = &unk_10000C5F0;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  -[BDBubbled verifyCurrentClientHasPID:thenCallBlock:](self, "verifyCurrentClientHasPID:thenCallBlock:", v6, v11);
  if (v9)
    v9[2](v9, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  NSLog(CFSTR("BD: REMOVE SYNC TASK: %@"), v8);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007E50;
  v11[3] = &unk_10000C5F0;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  -[BDBubbled verifyCurrentClientHasPID:thenCallBlock:](self, "verifyCurrentClientHasPID:thenCallBlock:", v6, v11);
  if (v9)
    v9[2](v9, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)registerUserSyncStakeholderForPID:(int)a3 machServiceName:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)unregisterStakeholderForPID:(int)a3 status:(unint64_t)a4 reason:(id)a5 completionHandler:(id)a6
{
  void *v8;
  id v9;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BDBubbled currentClient](self, "currentClient", *(_QWORD *)&a3, a4, a5, a6));
  if (v8)
  {
    v9 = v8;
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (a4 == 1)
        -[BDBubbled setPopStatus:](self, "setPopStatus:", 1);
      -[BDBubbled removeCurrentClient](self, "removeCurrentClient");
    }
    else
    {
      -[BDBubbled removeCurrentClientAndMachServiceName](self, "removeCurrentClientAndMachServiceName");
    }
    objc_msgSend(v9, "setStakeholderIsRegistered:", 0);
    v8 = v9;
  }

}

- (NSMutableArray)machServiceNames
{
  return self->_machServiceNames;
}

- (void)setMachServiceNames:(id)a3
{
  objc_storeStrong((id *)&self->_machServiceNames, a3);
}

- (RDClient)currentClient
{
  return self->_currentClient;
}

- (void)setCurrentClient:(id)a3
{
  objc_storeStrong((id *)&self->_currentClient, a3);
}

- (NSXPCConnection)keybagdConnection
{
  return self->_keybagdConnection;
}

- (void)setKeybagdConnection:(id)a3
{
  objc_storeStrong((id *)&self->_keybagdConnection, a3);
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
  objc_storeStrong((id *)&self->_launchDate, a3);
}

- (unint64_t)popStatus
{
  return self->_popStatus;
}

- (void)setPopStatus:(unint64_t)a3
{
  self->_popStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_storeStrong((id *)&self->_keybagdConnection, 0);
  objc_storeStrong((id *)&self->_currentClient, 0);
  objc_storeStrong((id *)&self->_machServiceNames, 0);
}

@end
