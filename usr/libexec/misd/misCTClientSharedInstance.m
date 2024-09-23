@implementation misCTClientSharedInstance

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EB00;
  block[3] = &unk_100030FD0;
  block[4] = a1;
  if (qword_100035410 != -1)
    dispatch_once(&qword_100035410, block);
  return (id)qword_100035418;
}

- (misCTClientSharedInstance)init
{
  misCTClientSharedInstance *v2;
  misCTClientSharedInstance *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)misCTClientSharedInstance;
  v2 = -[misCTClientSharedInstance init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[misCTClientSharedInstance _setupCTServerConnection](v2, "_setupCTServerConnection");
    v3->_CTAssertion = 0;
  }
  return v3;
}

- (void)dealloc
{
  __CTServerConnection *ctServerConnection;
  void *CTAssertion;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    CFRelease(ctServerConnection);
    self->_ctServerConnection = 0;
  }
  CTAssertion = self->_CTAssertion;
  if (CTAssertion)
  {
    CFRelease(CTAssertion);
    self->_CTAssertion = 0;
  }
  -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", 0);
  sub_100003108(1u, (uint64_t)"misCTClientSharedInstance dealloc", v5, v6, v7, v8, v9, v10, (uint64_t)v11.receiver);
  v11.receiver = self;
  v11.super_class = (Class)misCTClientSharedInstance;
  -[misCTClientSharedInstance dealloc](&v11, "dealloc");
}

- (void)_setupCTServerConnection
{
  __CTServerConnection *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];

  if (!self->_ctServerConnection)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001ED4C;
    v21[3] = &unk_100030FF8;
    v21[4] = self;
    v3 = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, CFSTR("com.apple.misd"), qword_100035470, v21);
    self->_ctServerConnection = v3;
    if (v3)
    {
      sub_100003108(1u, (uint64_t)"created CT server connection", v4, v5, v6, v7, v8, v9, v20);
      v10 = objc_alloc((Class)CoreTelephonyClient);
      self->_ctClient = (CoreTelephonyClient *)objc_msgSend(v10, "initWithQueue:", qword_100035470);
      self->_ctClientDelegates = objc_alloc_init(misCTClientDelegates);
      v11 = _CTServerConnectionRegisterForNotification(self->_ctServerConnection, kCTConnectionInvalidatedNotification);
      if (HIDWORD(v11))
      {
        v20 = v11;
        v12 = "error registering kCTConnectionInvalidatedNotification (%d, %d)";
      }
      else
      {
        v13 = _CTServerConnectionRegisterForNotification(self->_ctServerConnection, kCTDaemonReadyNotification);
        if (!HIDWORD(v13))
          return;
        v20 = v13;
        v12 = "error registering kCTDaemonReadyNotification (%d, %d)";
      }
      LOBYTE(v3) = 0;
    }
    else
    {
      v12 = "Unable to create CT server connection";
    }
    sub_100003108(v3, (uint64_t)v12, v4, v5, v6, v7, v8, v9, v20);
    if (self->_ctServerConnection)
    {
      sub_100003108(0, (uint64_t)"%s: closing CT server connection due to init errors", v14, v15, v16, v17, v18, v19, (uint64_t)"-[misCTClientSharedInstance _setupCTServerConnection]");
      CFRelease(self->_ctServerConnection);
      self->_ctServerConnection = 0;
    }
  }
}

- (__CTServerConnection)ctServerConnection
{
  __CTServerConnection *result;

  result = self->_ctServerConnection;
  if (!result)
  {
    -[misCTClientSharedInstance _setupCTServerConnection](self, "_setupCTServerConnection");
    return self->_ctServerConnection;
  }
  return result;
}

- (BOOL)registerCellularDataStatusNotification:(BOOL)a3 callback:(void *)a4 callbackArg:(void *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v10 = a3;
  v12 = "NO";
  if (a3)
    v12 = "YES";
  sub_100003108(1u, (uint64_t)"registerCellularDataStatusNotification: %s", a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7, (uint64_t)v12);
  if (!v10)
  {
    -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", 0);
    self->_eventCallback = 0;
    self->_eventCallbackArg = 0;
    return 1;
  }
  if (self->_ctServerConnection)
  {
    -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", self->_ctClientDelegates);
    self->_eventCallback = a4;
    self->_eventCallbackArg = a5;
    return 1;
  }
  sub_100003108(0, (uint64_t)"registerCellularDataStatusNotification enable failed due to invalid CT server connection.", v13, v14, v15, v16, v17, v18, v20);
  return 0;
}

- (void)_updateDualSimStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CoreTelephonyClient *ctClient;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;

  v19 = 0;
  self->_isDualSim = 0;
  ctClient = self->_ctClient;
  if (ctClient)
  {
    v10 = -[CoreTelephonyClient getSubscriptionInfoWithError:](ctClient, "getSubscriptionInfoWithError:", &v19);
    if (v19)
    {
      v17 = "%s: failed to query cellular subscription info";
    }
    else
    {
      v18 = v10;
      if (v10 && objc_msgSend(v10, "subscriptionsInUse"))
      {
        if ((unint64_t)objc_msgSend(objc_msgSend(v18, "subscriptionsInUse"), "count") > 1)
          self->_isDualSim = 1;
        v17 = "%s: updated dual sim status to %s";
      }
      else
      {
        v17 = "%s: failed to get the subscription contexts";
      }
    }
    sub_100003108(0, (uint64_t)v17, v11, v12, v13, v14, v15, v16, (uint64_t)"-[misCTClientSharedInstance _updateDualSimStatus]");
  }
  else
  {
    sub_100003108(0, (uint64_t)"%s: CT client not initialized", v2, v3, v4, v5, v6, v7, (uint64_t)"-[misCTClientSharedInstance _updateDualSimStatus]");
  }
}

- (BOOL)isDualSim
{
  return self->_isDualSim;
}

- (int)activateTethering:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CoreTelephonyClient *ctClient;
  int result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;

  if (!self->_ctClient)
  {
    sub_100003108(0, (uint64_t)"%s: CT client not initialized", a3, v3, v4, v5, v6, v7, (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
    return -1;
  }
  v8 = a3;
  if (!-[misCTClientSharedInstance ctServerConnection](self, "ctServerConnection"))
    sub_100023B9C();
  if (v8)
  {
    v25 = 0;
    sub_100003108(1u, (uint64_t)"%s: creating tethering assertion", v10, v11, v12, v13, v14, v15, (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
    ctClient = self->_ctClient;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001F080;
    v24[3] = &unk_100031020;
    v24[4] = self;
    self->_CTAssertion = -[CoreTelephonyClient createAssertionForConnectionType:allocator:error:onReAssertError:](ctClient, "createAssertionForConnectionType:allocator:error:onReAssertError:", 4, 0, &v25, v24);
    result = (int)v25;
    if (v25)
    {
      objc_msgSend(objc_msgSend(v25, "description"), "UTF8String");
      sub_100003108(0, (uint64_t)"%s: failed creating CT tethering context assertion with error '%s'", v18, v19, v20, v21, v22, v23, (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
      -[misCTClientSharedInstance activateTethering:](self, "activateTethering:", 0);
      return -1;
    }
  }
  else if (self->_CTAssertion)
  {
    sub_100003108(1u, (uint64_t)"%s: releasing tethering assertion", v10, v11, v12, v13, v14, v15, (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
    CFRelease(self->_CTAssertion);
    result = 0;
    self->_CTAssertion = 0;
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)convertConnectionStatus:(id)a3 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a4
{
  NSMutableString *v6;
  unsigned int v7;
  int v8;
  id v9;
  uint64_t v10;
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

  v6 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 20);
  v7 = objc_msgSend(a3, "state");
  if (v7 >= 4)
  {
    objc_msgSend(a3, "state");
    sub_100003108(0, (uint64_t)"%s: unknown connection state %d, ignoring", v16, v17, v18, v19, v20, v21, (uint64_t)"-[misCTClientSharedInstance convertConnectionStatus:ctInterfaceConnStatus:]");
  }
  else
  {
    v8 = v7 + 1;
    -[NSMutableString setString:](v6, "setString:", off_100031040[v7]);
    a4->var0 = v8;
    v9 = -[NSMutableString UTF8String](v6, "UTF8String");
    objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String");
    objc_msgSend(objc_msgSend(a3, "pdp"), "intValue");
    sub_100003108(1u, (uint64_t)"convertConnectionStatus: state: %s, ifname: %s, pdp_idx: %d", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    if (objc_msgSend(a3, "interfaceName"))
    {
      strncpy(a4->var2, (const char *)objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String"), 0xFuLL);
      a4->var1 = objc_msgSend(objc_msgSend(a3, "pdp"), "intValue");
    }
    else
    {
      a4->var2[0] = 0;
      a4->var1 = -1;
    }
  }
}

- (void)convertTetheringStatus:(mis_ctinterface_tethering_status *)a3 CTStatus:(id)a4
{
  BOOL v7;
  unsigned int v8;

  if (!objc_msgSend(a4, "carrierEnabled")
    || !objc_msgSend(objc_msgSend(a4, "carrierEnabled"), "intValue"))
  {
    a3->var0 = 0;
LABEL_9:
    a3->var1 = 0;
    goto LABEL_10;
  }
  a3->var0 = 1;
  if (!objc_msgSend(a4, "userAuthenticated")
    || !objc_msgSend(objc_msgSend(a4, "userAuthenticated"), "intValue"))
  {
    goto LABEL_9;
  }
  a3->var1 = 1;
  if (objc_msgSend(a4, "connectionAvailabilityStatus")
    && (objc_msgSend(objc_msgSend(a4, "connectionAvailabilityStatus"), "available") & 1) != 0)
  {
    v7 = 1;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  a3->var2 = v7;
  if (objc_msgSend(a4, "misPdpMaxHosts"))
    v8 = objc_msgSend(objc_msgSend(a4, "misPdpMaxHosts"), "intValue");
  else
    v8 = 3;
  a3->var3 = v8;
  -[misCTClientSharedInstance convertConnectionStatus:ctInterfaceConnStatus:](self, "convertConnectionStatus:ctInterfaceConnStatus:", objc_msgSend(a4, "connectionStatus"), &a3->var4);
}

- (int)getTetheringStatus:(mis_ctinterface_tethering_status *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CoreTelephonyClient *ctClient;
  id v11;
  const char *v12;
  const char *v13;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v23 = 0;
  ctClient = self->_ctClient;
  if (!ctClient)
  {
    v22 = "-[misCTClientSharedInstance getTetheringStatus:]";
    v13 = "%s: CT client not initialized";
    goto LABEL_6;
  }
  v11 = -[CoreTelephonyClient getTetheringStatusSync:connectionType:](ctClient, "getTetheringStatusSync:connectionType:", &v23, 4);
  if (v23)
  {
    v12 = (const char *)objc_msgSend(objc_msgSend(v23, "domain"), "UTF8String");
    objc_msgSend(v23, "code");
    objc_msgSend(objc_msgSend(v23, "description"), "UTF8String");
    v22 = v12;
    v13 = "getTetheringStatusSync() failed, domain: [%s] code: [%ld] desc: [%s]";
LABEL_4:
    LOBYTE(ctClient) = 0;
LABEL_6:
    sub_100003108(ctClient, (uint64_t)v13, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)v22);
    return -1;
  }
  if (!v11)
  {
    v22 = "-[misCTClientSharedInstance getTetheringStatus:]";
    v13 = "%s tethering status is empty";
    goto LABEL_4;
  }
  -[misCTClientSharedInstance convertTetheringStatus:CTStatus:](self, "convertTetheringStatus:CTStatus:", a3, v11);
  if (a3->var0)
    v15 = "true";
  else
    v15 = "false";
  objc_msgSend(objc_msgSend(objc_msgSend(v11, "connectionStatus"), "interfaceName"), "UTF8String");
  sub_100003108(1u, (uint64_t)"getTetheringStatusSync: carrier_enabled: %s, user_auth: %s, conn_avail: %s, max_hosts: %d, ifname: %s", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  return 0;
}

- (int)getTetheringInterfaceName:(char *)a3
{
  unsigned int v4;
  int result;
  __int128 v6;
  char v7[24];

  v6 = 0u;
  *(_OWORD *)v7 = 0u;
  v4 = -[misCTClientSharedInstance getTetheringStatus:](self, "getTetheringStatus:", &v6);
  result = -1;
  if (!v4)
  {
    if (v7[0])
    {
      strncpy(a3, v7, 0xFuLL);
      return 0;
    }
  }
  return result;
}

- (int)isDataPlanEnabled:(BOOL *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *a3 = 0;
  if (!((unint64_t)_CTServerConnectionGetCellularDataIsEnabled(-[misCTClientSharedInstance ctServerConnection](self, "ctServerConnection"), a3) >> 32))return 0;
  sub_100003108(0, (uint64_t)"%s: error while querying data plan status (domain %d, error %d)", v3, v4, v5, v6, v7, v8, (uint64_t)"-[misCTClientSharedInstance isDataPlanEnabled:]");
  return 12;
}

- (void)processCTTetheringStatusChangeNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*eventCallback)(uint64_t, _OWORD *, void *);
  _OWORD v10[2];
  uint64_t v11;

  if (a3)
  {
    memset(v10, 0, sizeof(v10));
    -[misCTClientSharedInstance convertTetheringStatus:CTStatus:](self, "convertTetheringStatus:CTStatus:", v10, a3);
    eventCallback = (void (*)(uint64_t, _OWORD *, void *))self->_eventCallback;
    if (eventCallback)
      eventCallback(1, v10, self->_eventCallbackArg);
  }
  else
  {
    sub_100003108(0, (uint64_t)"processCTTetheringStatusChangeNotification: tethering status is empty", 0, v3, v4, v5, v6, v7, v11);
  }
}

- (void)processCTConnectionStateChangeNotification:(id)a3 connection:(int)a4 connectionStatus:(id)a5 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a6
{
  uint64_t v6;
  uint64_t v7;
  void (*eventCallback)(uint64_t, mis_ctinterface_ct_conn_status *, void *);

  if (a4 == 4)
  {
    -[misCTClientSharedInstance convertConnectionStatus:ctInterfaceConnStatus:](self, "convertConnectionStatus:ctInterfaceConnStatus:", a5, a6);
    eventCallback = (void (*)(uint64_t, mis_ctinterface_ct_conn_status *, void *))self->_eventCallback;
    if (eventCallback)
      eventCallback(2, a6, self->_eventCallbackArg);
  }
  else
  {
    sub_100003108(1u, (uint64_t)"processCTConnectionStateChangeNotification: ignoring unknown connection type %d", (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, (uint64_t)a6, v6, v7, *(uint64_t *)&a4);
  }
}

- (void)handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_eventCallback)
  {
    sub_100003108(0, (uint64_t)"%s: ignoring CT notification as no service is in progress", (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"-[misCTClientSharedInstance handleCTNotification:notificationInfo:]");
    return;
  }
  if (CFEqual(a3, kCTConnectionInvalidatedNotification))
  {
    v11 = 3;
LABEL_7:
    ((void (*)(uint64_t, __CFDictionary *, void *))self->_eventCallback)(v11, a4, self->_eventCallbackArg);
    return;
  }
  if (CFEqual(a3, kCTDaemonReadyNotification))
  {
    v11 = 4;
    goto LABEL_7;
  }
  CFStringGetCStringPtr(a3, 0x8000100u);
  sub_100003108(0, (uint64_t)"%s: received unknown notification %s", v12, v13, v14, v15, v16, v17, (uint64_t)"-[misCTClientSharedInstance handleCTNotification:notificationInfo:]");
}

@end
