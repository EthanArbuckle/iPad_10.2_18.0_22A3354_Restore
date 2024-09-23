@implementation NRLinkManagerWiFi

- (void)cancel
{
  OS_dispatch_queue *v3;
  NSMutableSet *links;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableSet *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self)
  {
    v3 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003);
    if (self->super._state == 1004)
    {
      if (qword_1001E4AB8 != -1)
        dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
      if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
      {
        if (qword_1001E4AB8 != -1)
          dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
        _NRLogWithArgs(qword_1001E4AB0, 1, "%s%.30s:%-4d Already cancelled", ", "-[NRLinkManagerWiFi cancel]", 248);
      }
      return;
    }
    self->super._state = 1004;
    -[NRLinkManagerWiFi invalidateManager](self, "invalidateManager");
    links = self->_links;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    objc_msgSend(0, "reportEvent:", 2003);
    objc_msgSend(0, "invalidateManager");
    links = 0;
  }
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSMutableSet copy](links, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "cancelWithReason:", CFSTR("Cancelling all links"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self)
    v10 = self->_links;
  else
    v10 = 0;
  -[NSMutableSet removeAllObjects](v10, "removeAllObjects");

}

- (void)invalidateManager
{
  __SCDynamicStore *scdynamicStoreRef;
  __SCDynamicStore *v4;
  CWFInterface *coreWiFiHandle;
  CWFInterface *v6;
  NSObject *v7;
  CWFInterface *v8;
  CWFInterface *v9;
  CWFActivity *wowActivity;
  CWFActivity *backgroundActivity;
  CWFActivity *directToCloudActivity;
  NSMutableSet *wifiAutojoinClients;
  NSMutableDictionary *assertionReasonDictionary;
  NSMutableDictionary *assertionClientDictionary;
  NSMutableDictionary *lastAssertionReport;
  _QWORD block[4];
  CWFInterface *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NRLinkManagerWiFi;
  -[NRLinkManager invalidateManager](&v19, "invalidateManager");
  if (self)
  {
    scdynamicStoreRef = self->_scdynamicStoreRef;
    if (scdynamicStoreRef)
    {
      SCDynamicStoreSetDispatchQueue(scdynamicStoreRef, 0);
      v4 = self->_scdynamicStoreRef;
      if (v4)
      {
        CFRelease(v4);
        self->_scdynamicStoreRef = 0;
      }
    }
    coreWiFiHandle = self->_coreWiFiHandle;
    if (coreWiFiHandle)
    {
      v6 = coreWiFiHandle;
      if (qword_1001E4AC0 != -1)
        dispatch_once(&qword_1001E4AC0, &stru_1001B8948);
      v7 = qword_1001E4AC8;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100143438;
      block[3] = &unk_1001B8AE0;
      v8 = v6;
      v18 = v8;
      dispatch_async(v7, block);
      v9 = self->_coreWiFiHandle;
      self->_coreWiFiHandle = 0;

      wowActivity = self->_wowActivity;
      self->_wowActivity = 0;

      backgroundActivity = self->_backgroundActivity;
      self->_backgroundActivity = 0;

      directToCloudActivity = self->_directToCloudActivity;
      self->_directToCloudActivity = 0;

    }
    sub_100143440((uint64_t)self, 0);
    wifiAutojoinClients = self->_wifiAutojoinClients;
    self->_wifiAutojoinClients = 0;

    assertionReasonDictionary = self->_assertionReasonDictionary;
    self->_assertionReasonDictionary = 0;

    assertionClientDictionary = self->_assertionClientDictionary;
    self->_assertionClientDictionary = 0;

    lastAssertionReport = self->_lastAssertionReport;
    self->_lastAssertionReport = 0;

    sub_100142200((uint64_t)self);
  }
  else
  {
    sub_100143440(0, 0);
  }
}

- (void)dealloc
{
  id v3;
  id v4;
  objc_super v5;

  if (qword_1001E4AB8 != -1)
    dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
  if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
  {
    if (qword_1001E4AB8 != -1)
      dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
    v3 = (id)qword_1001E4AB0;
    v4 = -[NRLinkManagerWiFi copyName](self, "copyName");
    _NRLogWithArgs(v3, 1, "%s%.30s:%-4d %@", ", "-[NRLinkManagerWiFi dealloc]", 297, v4);

  }
  -[NRLinkManagerWiFi invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)NRLinkManagerWiFi;
  -[NRLinkManagerWiFi dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return CFSTR("Link Manager - WiFi");
}

- (id)copyStatusString
{
  OS_dispatch_queue *queue;
  NSObject *v4;
  id v5;
  id v6;
  void *StringFromNRLinkType;
  uint64_t state;
  id v9;
  const char *v10;
  NRSCDInterfaceConfig *wifiInterfaceConfig;
  NRSCDInterfaceConfig *v12;
  NRSCDInterfaceConfig *awdlInterfaceConfig;
  NRSCDInterfaceConfig *v14;
  NRSCDInterfaceConfig *nanInterfaceConfig;
  NRSCDInterfaceConfig *v16;
  NRSCDInterfaceConfig *irInterfaceConfig;
  NRSCDInterfaceConfig *v18;
  uint64_t clearedPreferWiFiAssertCounts;
  void *v21;

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init((Class)NSMutableString);
  v6 = -[NRLinkManagerWiFi copyName](self, "copyName");
  objc_msgSend(v5, "appendFormat:", CFSTR("\nName: %@"), v6);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinkManager type: %@"), StringFromNRLinkType);

    state = self->super._state;
  }
  else
  {
    v21 = (void *)createStringFromNRLinkType(0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinkManager type: %@"), v21);

    state = 0;
  }
  v9 = sub_1000A3074(state);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nState: %@"), v9);

  if (self)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinks: %@"), self->_links);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nWiFi Interface config: %@"), self->_wifiInterfaceConfig);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nAWDL Interface config: %@"), self->_awdlInterfaceConfig);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nNAN Interface config: %@"), self->_nanInterfaceConfig);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nIR Interface config: %@"), self->_irInterfaceConfig);
    if (self->_wowActivity)
      v10 = "YES";
    else
      v10 = "NO";
    objc_msgSend(v5, "appendFormat:", CFSTR("\nWiFi WoW Enabled: %s"), v10);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nWiFi Client Type: %zd"), self->_currentWiFiClientType);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal WiFi Endpoint: %@"), self->_localWiFiEndpoint);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal WiFi Signature: %@"), self->_localWiFiSignature);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote WiFi Signature: %@"), self->_peerWiFiSignature);
    wifiInterfaceConfig = self->_wifiInterfaceConfig;
    if (wifiInterfaceConfig)
      wifiInterfaceConfig = (NRSCDInterfaceConfig *)wifiInterfaceConfig->_peerEndpointDictionary;
    v12 = wifiInterfaceConfig;
    objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote WiFi Endpoints: %@"), v12);

    awdlInterfaceConfig = self->_awdlInterfaceConfig;
    if (awdlInterfaceConfig)
      awdlInterfaceConfig = (NRSCDInterfaceConfig *)awdlInterfaceConfig->_peerEndpointDictionary;
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinks: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nWiFi Interface config: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nAWDL Interface config: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nNAN Interface config: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nIR Interface config: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nWiFi WoW Enabled: %s"), "NO");
    objc_msgSend(v5, "appendFormat:", CFSTR("\nWiFi Client Type: %zd"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal WiFi Endpoint: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal WiFi Signature: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote WiFi Signature: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote WiFi Endpoints: %@"), 0);
    awdlInterfaceConfig = 0;
  }
  v14 = awdlInterfaceConfig;
  objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote AWDL EndpointDict: %@"), v14);

  if (self)
  {
    nanInterfaceConfig = self->_nanInterfaceConfig;
    if (nanInterfaceConfig)
      nanInterfaceConfig = (NRSCDInterfaceConfig *)nanInterfaceConfig->_peerEndpointDictionary;
    v16 = nanInterfaceConfig;
    objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote NAN EndpointDict: %@"), v16);

    irInterfaceConfig = self->_irInterfaceConfig;
    if (irInterfaceConfig)
      irInterfaceConfig = (NRSCDInterfaceConfig *)irInterfaceConfig->_peerEndpointDictionary;
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote NAN EndpointDict: %@"), 0);
    irInterfaceConfig = 0;
  }
  v18 = irInterfaceConfig;
  objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote IR EndpointDict: %@"), v18);

  if (self)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nPrefer WiFi asserts: %d"), self->_preferWiFiAsserts);
    clearedPreferWiFiAssertCounts = self->_clearedPreferWiFiAssertCounts;
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nPrefer WiFi asserts: %d"), 0);
    clearedPreferWiFiAssertCounts = 0;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCleared Prefer WiFi asserts: %d"), clearedPreferWiFiAssertCounts);
  return v5;
}

- (void)linkIsAvailable:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  OS_dispatch_queue *v7;
  NSObject *v8;
  id v9;
  int IsLevelEnabled;
  id v11;
  _QWORD block[4];
  id v13;
  NRLinkManagerWiFi *v14;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2004);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001E4AB8 != -1)
          dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
        if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
        {
          if (qword_1001E4AB8 != -1)
            dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
          _NRLogWithArgs(qword_1001E4AB0, 1, "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@", ", "-[NRLinkManagerWiFi linkIsAvailable:]", 418, self);
        }
        goto LABEL_14;
      }
      -[NSMutableSet addObject:](self->_links, "addObject:", v4);
      v7 = self->super._queue;
    }
    else
    {
      objc_msgSend(0, "addObject:", v4);
      v7 = 0;
    }
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100143328;
    block[3] = &unk_1001B8778;
    v13 = v4;
    v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  v9 = sub_100140BFC();
  IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17);

  if (IsLevelEnabled)
  {
    v11 = sub_100140BFC();
    _NRLogWithArgs(v11, 17, "%s called with null link", "-[NRLinkManagerWiFi linkIsAvailable:]");

  }
LABEL_14:

}

- (void)linkIsReady:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  OS_dispatch_queue *v7;
  NSObject *v8;
  id v9;
  int IsLevelEnabled;
  id v11;
  _QWORD block[4];
  id v13;
  NRLinkManagerWiFi *v14;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2005);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001E4AB8 != -1)
          dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
        if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
        {
          if (qword_1001E4AB8 != -1)
            dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
          _NRLogWithArgs(qword_1001E4AB0, 1, "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@", ", "-[NRLinkManagerWiFi linkIsReady:]", 442, self);
        }
        goto LABEL_14;
      }
      v7 = self->super._queue;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100143218;
    block[3] = &unk_1001B8778;
    v13 = v4;
    v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  v9 = sub_100140BFC();
  IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17);

  if (IsLevelEnabled)
  {
    v11 = sub_100140BFC();
    _NRLogWithArgs(v11, 17, "%s called with null link", "-[NRLinkManagerWiFi linkIsReady:]");

  }
LABEL_14:

}

- (void)linkIsSuspended:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  OS_dispatch_queue *v7;
  NSObject *v8;
  id v9;
  int IsLevelEnabled;
  id v11;
  _QWORD block[4];
  id v13;
  NRLinkManagerWiFi *v14;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2006);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001E4AB8 != -1)
          dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
        if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
        {
          if (qword_1001E4AB8 != -1)
            dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
          _NRLogWithArgs(qword_1001E4AB0, 1, "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@", ", "-[NRLinkManagerWiFi linkIsSuspended:]", 471, self);
        }
        goto LABEL_14;
      }
      v7 = self->super._queue;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100143108;
    block[3] = &unk_1001B8778;
    v13 = v4;
    v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  v9 = sub_100140BFC();
  IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17);

  if (IsLevelEnabled)
  {
    v11 = sub_100140BFC();
    _NRLogWithArgs(v11, 17, "%s called with null link", "-[NRLinkManagerWiFi linkIsSuspended:]");

  }
LABEL_14:

}

- (void)linkIsUnavailable:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  OS_dispatch_queue *v7;
  NSObject *v8;
  id v9;
  int IsLevelEnabled;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2007);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001E4AB8 != -1)
          dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
        if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
        {
          if (qword_1001E4AB8 != -1)
            dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
          _NRLogWithArgs(qword_1001E4AB0, 1, "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@", ", "-[NRLinkManagerWiFi linkIsUnavailable:]", 493, self);
        }
        goto LABEL_14;
      }
      -[NSMutableSet removeObject:](self->_links, "removeObject:", v4);
      v7 = self->super._queue;
    }
    else
    {
      objc_msgSend(0, "removeObject:", v4);
      v7 = 0;
    }
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100140C3C;
    block[3] = &unk_1001B8778;
    block[4] = self;
    v13 = v4;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  v9 = sub_100140BFC();
  IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17);

  if (IsLevelEnabled)
  {
    v11 = sub_100140BFC();
    _NRLogWithArgs(v11, 17, "%s called with null link", "-[NRLinkManagerWiFi linkIsUnavailable:]");

  }
LABEL_14:

}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    objc_msgSend(0, "reportEvent:", 2008);
    queue = 0;
    goto LABEL_10;
  }
  v8 = self->super._queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2008);
  if (self->super._state != 1004)
  {
    queue = self->super._queue;
LABEL_10:
    v10 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100140BB0;
    block[3] = &unk_1001B87A0;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(v10, block);

    goto LABEL_11;
  }
  if (qword_1001E4AB8 != -1)
    dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
  if (_NRLogIsLevelEnabled(qword_1001E4AB0, 1))
  {
    if (qword_1001E4AB8 != -1)
      dispatch_once(&qword_1001E4AB8, &stru_1001B8928);
    _NRLogWithArgs(qword_1001E4AB0, 1, "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@", ", "-[NRLinkManagerWiFi linkDidReceiveData:data:]", 520, self);
  }
LABEL_11:

}

- (void)handleThermalStateUpdate
{
  OS_dispatch_queue *queue;
  NSObject *v4;
  _DWORD *v5;
  unsigned int v6;
  NSMutableSet *links;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  objc_opt_self(NRLinkDirector);
  if (qword_1001E4710 != -1)
    dispatch_once(&qword_1001E4710, &stru_1001B6E60);
  v5 = (id)qword_1001E4708;
  if (v5 && (v6 = v5[5], v5, v6 >= 0x1E))
  {
    if (self)
      links = self->_links;
    else
      links = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = -[NSMutableSet copy](links, "copy");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "subtype", (_QWORD)v14) == 102)
            objc_msgSend(v13, "cancelWithReason:", CFSTR("critical thermal state reached"));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  else
  {
    sub_100140334((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phsStateUpdateDelegates, 0);
  objc_storeStrong((id *)&self->_lastAssertionReport, 0);
  objc_storeStrong((id *)&self->_assertionClientDictionary, 0);
  objc_storeStrong((id *)&self->_assertionReasonDictionary, 0);
  objc_storeStrong((id *)&self->_directToCloudAgent, 0);
  objc_storeStrong((id *)&self->_wifiAutojoinClients, 0);
  objc_storeStrong((id *)&self->_directToCloudActivity, 0);
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
  objc_storeStrong((id *)&self->_wowActivity, 0);
  objc_storeStrong((id *)&self->_coreWiFiHandle, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_destroyWeak((id *)&self->_wifiManagerDelegate);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_scdKeyMIS, 0);
  objc_storeStrong((id *)&self->_irInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_nanInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_awdlInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_peerWiFiSignature, 0);
  objc_storeStrong((id *)&self->_localWiFiSignature, 0);
  objc_storeStrong((id *)&self->_peerWiFiEndpoint, 0);
  objc_storeStrong((id *)&self->_localAWDLEndpoint, 0);
  objc_storeStrong((id *)&self->_localWiFiEndpoint, 0);
}

@end
