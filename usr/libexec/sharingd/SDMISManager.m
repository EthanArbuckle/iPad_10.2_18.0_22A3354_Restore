@implementation SDMISManager

+ (id)sharedManager
{
  if (qword_1007C6498 != -1)
    dispatch_once(&qword_1007C6498, &stru_100714528);
  return (id)qword_1007C6490;
}

- (SDMISManager)init
{
  SDMISManager *v2;
  SDMISManager *v3;
  NSTimer *authTimer;
  SCDynamicStoreRef v5;
  __CFRunLoop *Current;
  SCDynamicStoreContext v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDMISManager;
  v2 = -[SDMISManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    authTimer = v2->_authTimer;
    v2->_attachCount = 0;
    v2->_authTimer = 0;
    v2->_netClient = 0;
    *(_QWORD *)&v2->_state = 1020;
    v2->_needStateUpdate = 1;

    v8.version = 0;
    memset(&v8.retain, 0, 24);
    v8.info = v3;
    v5 = SCDynamicStoreCreate(0, CFSTR("com.apple.wirelessmodemsettings.MISManager"), (SCDynamicStoreCallBack)sub_1000183A0, &v8);
    v3->_scDynamicStore = v5;
    if (v5)
    {
      SCDynamicStoreAddWatchedKey(v5, CFSTR("com.apple.MobileInternetSharing"), 0);
      v3->_scRunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v3->_scDynamicStore, 0);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v3->_scRunLoopSource, kCFRunLoopCommonModes);
    }
  }
  return v3;
}

- (void)dealloc
{
  __SCDynamicStore *scDynamicStore;
  __CFRunLoop *Current;
  objc_super v5;

  self->_attachCount = 0;
  -[SDMISManager detachMIS](self, "detachMIS");
  scDynamicStore = self->_scDynamicStore;
  if (scDynamicStore)
  {
    SCDynamicStoreRemoveWatchedKey(scDynamicStore, CFSTR("com.apple.MobileInternetSharing"), 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_scRunLoopSource, kCFRunLoopCommonModes);
    CFRelease(self->_scDynamicStore);
  }
  v5.receiver = self;
  v5.super_class = (Class)SDMISManager;
  -[SDMISManager dealloc](&v5, "dealloc");
}

- (void)attachMIS
{
  SDMISManager *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  NETRBClient *netClient;
  int v7;
  NETRBClient *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_netClient)
  {
    v3 = &_dispatch_main_q;
    v2->_netClient = (NETRBClient *)_NETRBClientCreate(&_dispatch_main_q, &stru_100714568, 0);

    v4 = tethering_log();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      netClient = v2->_netClient;
      v7 = 138412290;
      v8 = netClient;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created NETRB client = %@", (uint8_t *)&v7, 0xCu);
    }

  }
  ++v2->_attachCount;
  objc_sync_exit(v2);

}

- (void)detachMIS
{
  SDMISManager *v2;
  uint64_t attachCount;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v2 = self;
  objc_sync_enter(v2);
  attachCount = v2->_attachCount;
  v2->_attachCount = attachCount - 1;
  if (v2->_netClient)
    v4 = attachCount <= 1;
  else
    v4 = 0;
  if (v4)
  {
    v5 = _NETRBClientDestroy();
    v2->_netClient = 0;
    v2->_attachCount = 0;
    v6 = tethering_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Destroyed NETRB client", v8, 2u);
    }

  }
  objc_sync_exit(v2);

}

- (void)stopService
{
  NETRBClient *netClient;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  netClient = self->_netClient;
  if (netClient)
  {
    v3 = _NETRBClientStopService(netClient, a2);
    v4 = tethering_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping Auth", v6, 2u);
    }

  }
}

- (void)setState:(int)a3
{
  uint64_t v3;
  NETRBClient *netClient;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];

  v3 = *(_QWORD *)&a3;
  -[SDMISManager attachMIS](self, "attachMIS");
  netClient = self->_netClient;
  if (netClient)
  {
    v6 = _NETRBClientSetGlobalServiceState(netClient, v3);
    v7 = tethering_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting state = %d", (uint8_t *)v9, 8u);
    }

  }
  -[SDMISManager detachMIS](self, "detachMIS");
}

- (void)getState:(int *)a3 andReason:(int *)a4
{
  SDMISManager *v6;
  uint64_t v7;
  NSObject *v8;
  int state;
  int reason;
  _DWORD v11[2];
  __int16 v12;
  int v13;

  v6 = self;
  if (self->_needStateUpdate)
  {
    self = (SDMISManager *)-[SDMISManager readMISState:andReason:](self, "readMISState:andReason:", &self->_state, &self->_reason);
    v6->_needStateUpdate = 0;
  }
  if (a3)
    *a3 = v6->_state;
  if (a4)
    *a4 = v6->_reason;
  v7 = tethering_log(self);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    state = v6->_state;
    reason = v6->_reason;
    v11[0] = 67109376;
    v11[1] = state;
    v12 = 1024;
    v13 = reason;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "state = %d, reason = %d", (uint8_t *)v11, 0xEu);
  }

}

- (int64_t)connectedHosts
{
  int64_t result;

  if (!self->_needStateUpdate)
    return self->_connectedHosts;
  result = -[SDMISManager readConnectHosts](self, "readConnectHosts");
  self->_connectedHosts = result;
  return result;
}

- (BOOL)hostIsOnlyUSBEthernet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  if ((id)-[SDMISManager connectedHosts](self, "connectedHosts") != (id)1)
    return 0;
  v3 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, CFSTR("com.apple.MobileInternetSharing"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Hosts")));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type")));
      v8 = v7;
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("USB-Ethernet")));
        v10 = objc_msgSend(v9, "integerValue") == (id)1;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)readMISState:(int *)a3 andReason:(int *)a4
{
  unsigned int state;
  unsigned int reason;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  state = self->_state;
  reason = self->_reason;
  v8 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, CFSTR("com.apple.MobileInternetSharing"));
  v11 = v8;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("State")));
    state = objc_msgSend(v9, "intValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Reason")));
    reason = objc_msgSend(v10, "intValue");

  }
  if (a3)
    *a3 = state;
  if (a4)
    *a4 = reason;

}

- (int64_t)readConnectHosts
{
  id connectedHosts;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v11[2];

  connectedHosts = (id)self->_connectedHosts;
  v3 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, CFSTR("com.apple.MobileInternetSharing"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Hosts")));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Current")));
      connectedHosts = objc_msgSend(v7, "integerValue");

    }
  }
  v8 = tethering_log(v3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = (_DWORD)connectedHosts;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connected Hosts = %d", (uint8_t *)v11, 8u);
  }

  return (int64_t)connectedHosts;
}

- (void)handleMISStateChanged
{
  int64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  int state;
  int reason;
  uint64_t v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;

  v16 = 0;
  v3 = -[SDMISManager readConnectHosts](self, "readConnectHosts");
  v4 = -[SDMISManager readMISState:andReason:](self, "readMISState:andReason:", (char *)&v16 + 4, &v16);
  v5 = v16;
  if (v16 == __PAIR64__(self->_state, self->_reason) && v3 == self->_connectedHosts)
  {
    v6 = tethering_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "No state change not notifying";
      v9 = v7;
      v10 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else
  {
    self->_state = HIDWORD(v16);
    self->_reason = v5;
    self->_connectedHosts = v3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "misStateChanged:", self);

    v13 = tethering_log(v12);
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      reason = self->_reason;
      *(_DWORD *)buf = 67109376;
      v18 = state;
      v19 = 1024;
      v20 = reason;
      v8 = "Update MIS state = %d for reason = %d";
      v9 = v7;
      v10 = 14;
      goto LABEL_7;
    }
  }

}

- (SDMISManagerDelegate)delegate
{
  return (SDMISManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authTimer, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

@end
