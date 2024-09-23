@implementation NRLinkManagerBluetooth

- (void)cancel
{
  NSMutableSet *links;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  NSMutableSet *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self)
  {
    self->super._state = 1004;
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003);
    -[NRLinkManagerBluetooth invalidateManager](self, "invalidateManager");
    links = self->_links;
  }
  else
  {
    objc_msgSend(0, "reportEvent:", 2003);
    objc_msgSend(0, "invalidateManager");
    links = 0;
  }
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSMutableSet copy](links, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "cancelWithReason:", CFSTR("Cancelling Bluetooth link manager"), (_QWORD)v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (self)
    v9 = self->_links;
  else
    v9 = 0;
  -[NSMutableSet removeAllObjects](v9, "removeAllObjects", (_QWORD)v10);

}

- (void)invalidateManager
{
  CBScalablePipeManager *pipeManager;
  CBCentralManager *centralManager;
  NSArray *peripherals;
  CBPeripheralManager *peripheralManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NRLinkManagerBluetooth;
  -[NRLinkManager invalidateManager](&v7, "invalidateManager");
  if (self)
  {
    -[CBScalablePipeManager setDelegate:](self->_pipeManager, "setDelegate:", 0);
    objc_storeWeak((id *)&self->_bluetoothManagerDelegate, 0);
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0;

    if (self->_centralManager)
    {
      sub_100029644((uint64_t)self);
      -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
      centralManager = self->_centralManager;
      self->_centralManager = 0;

    }
    peripherals = self->_peripherals;
    self->_peripherals = 0;

    if (self->_peripheralManager)
    {
      sub_10002BC58((id *)&self->super.super.isa);
      -[CBPeripheralManager setDelegate:](self->_peripheralManager, "setDelegate:", 0);
      peripheralManager = self->_peripheralManager;
      self->_peripheralManager = 0;

    }
    self->_currentAdvertisementRate = 0;
  }
  else
  {
    objc_msgSend(0, "setDelegate:", 0);
  }
}

- (void)dealloc
{
  id v3;
  id v4;
  objc_super v5;

  if (qword_1001E45C0 != -1)
    dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
  if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
  {
    if (qword_1001E45C0 != -1)
      dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
    v3 = (id)qword_1001E45B8;
    v4 = -[NRLinkManagerBluetooth copyName](self, "copyName");
    _NRLogWithArgs(v3, 1, "%s%.30s:%-4d %@", ", "-[NRLinkManagerBluetooth dealloc]", 312, v4);

  }
  -[NRLinkManagerBluetooth invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)NRLinkManagerBluetooth;
  -[NRLinkManagerBluetooth dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return CFSTR("Link Manager - Bluetooth");
}

- (id)copyStatusString
{
  id v3;
  id v4;
  int state;
  const char *v6;
  int v7;
  const char *v8;
  int v9;
  const char *v10;
  int v11;
  const char *v12;
  int v13;
  const char *v14;
  int v15;
  const char *v16;
  id v17;
  uint64_t type;
  void *StringFromNRLinkType;
  id v20;
  NSArray *peripherals;
  id v22;
  id v23;
  void *v24;
  unint64_t currentAdvertisementState;
  id v26;
  uint64_t currentAdvertisementRate;
  __CFString *v28;
  NSMutableDictionary *pipeStateDictionary;
  id v31;
  id v32;
  void *v33;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v4, "appendString:", CFSTR("["));
  if (self)
  {
    state = self->_pipeRegistrationForMedium.state;
    if ((state - 1) <= 1)
    {
      if (state == 1)
        v6 = "(inprog)";
      else
        v6 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s,"), "M", v6);
    }
    v7 = self->_pipeRegistrationForHigh.state;
    if ((v7 - 1) <= 1)
    {
      if (v7 == 1)
        v8 = "(inprog)";
      else
        v8 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s,"), "H", v8);
    }
    v9 = self->_pipeRegistrationForIsochronous.state;
    if ((v9 - 1) <= 1)
    {
      if (v9 == 1)
        v10 = "(inprog)";
      else
        v10 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s,"), "I", v10);
    }
    v11 = self->_p2pPipeRegistrationForMedium.state;
    if ((v11 - 1) <= 1)
    {
      if (v11 == 1)
        v12 = "(inprog)";
      else
        v12 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s,"), "M(p2p)", v12);
    }
    v13 = self->_p2pPipeRegistrationForHigh.state;
    if ((v13 - 1) <= 1)
    {
      if (v13 == 1)
        v14 = "(inprog)";
      else
        v14 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s,"), "H(p2p)", v14);
    }
    v15 = self->_p2pPipeRegistrationForIsochronous.state;
    if ((v15 - 1) <= 1)
    {
      if (v15 == 1)
        v16 = "(inprog)";
      else
        v16 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s,"), "I(p2p)", v16);
    }
    objc_msgSend(v4, "appendString:", CFSTR("]"));
    v17 = -[NRLinkManagerBluetooth copyName](self, "copyName");
    objc_msgSend(v3, "appendFormat:", CFSTR("\nName: %@"), v17);

    type = self->super._type;
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("]"));
    v31 = objc_msgSend(0, "copyName");
    objc_msgSend(v3, "appendFormat:", CFSTR("\nName: %@"), v31);

    type = 0;
  }
  StringFromNRLinkType = (void *)createStringFromNRLinkType(type);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nLinkManager type: %@"), StringFromNRLinkType);

  if (self)
  {
    v20 = sub_1000A3074(self->super._state);
    objc_msgSend(v3, "appendFormat:", CFSTR("\nState: %@ %@"), v20, v4);

    objc_msgSend(v3, "appendFormat:", CFSTR("\nLinks: %@"), self->_links);
    objc_msgSend(v3, "appendFormat:", CFSTR("\nPipes: %@"), self->_connectedPipes);
    peripherals = self->_peripherals;
  }
  else
  {
    v32 = sub_1000A3074(0);
    objc_msgSend(v3, "appendFormat:", CFSTR("\nState: %@ %@"), v32, v4);

    objc_msgSend(v3, "appendFormat:", CFSTR("\nLinks: %@"), 0);
    objc_msgSend(v3, "appendFormat:", CFSTR("\nPipes: %@"), 0);
    peripherals = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nPeripherals: %@"), peripherals);
  v22 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v22, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss z"));
  v23 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v22, "setLocale:", v23);

  if (self)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringFromDate:", self->_peripheralConnectDate));
    objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectPeripheral invoked: %@"), v24);

    objc_msgSend(v3, "appendFormat:", CFSTR("\nCentralMgr: %@"), self->_centralManager);
    objc_msgSend(v3, "appendFormat:", CFSTR("\nPeripheralMgr: %@"), self->_peripheralManager);
    currentAdvertisementState = self->_currentAdvertisementState;
    if (currentAdvertisementState >= 5)
      v26 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("UnknownType(%lld)"), currentAdvertisementState);
    else
      v26 = *(&off_1001B6518 + currentAdvertisementState);
    objc_msgSend(v3, "appendFormat:", CFSTR("\ncurrentAdvertisementState: %@"), v26);

    currentAdvertisementRate = self->_currentAdvertisementRate;
    if (self->_currentAdvertisementRate)
    {
      if ((_DWORD)currentAdvertisementRate == 1)
        v28 = CFSTR("1 sec");
      else
        v28 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("UnknownType(%lld)"), currentAdvertisementRate);
    }
    else
    {
      v28 = CFSTR("Default");
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("\ncurrentAdvertisementRate: %@"), v28);

    pipeStateDictionary = self->_pipeStateDictionary;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringFromDate:", 0));
    objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectPeripheral invoked: %@"), v33);

    objc_msgSend(v3, "appendFormat:", CFSTR("\nCentralMgr: %@"), 0);
    objc_msgSend(v3, "appendFormat:", CFSTR("\nPeripheralMgr: %@"), 0);
    objc_msgSend(v3, "appendFormat:", CFSTR("\ncurrentAdvertisementState: %@"), CFSTR("Idle"));
    objc_msgSend(v3, "appendFormat:", CFSTR("\ncurrentAdvertisementRate: %@"), CFSTR("Default"));
    pipeStateDictionary = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nBT connection state: %@"), pipeStateDictionary);

  return v3;
}

- (void)linkIsAvailable:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  NSMutableSet *links;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  unsigned int v22;
  id v23;
  OS_dispatch_queue *v24;
  NSObject *v25;
  id v26;
  int IsLevelEnabled;
  id v28;
  NRLinkManagerBluetooth *v29;
  id v30;
  _QWORD block[4];
  char *v32;
  NRLinkManagerBluetooth *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    v7 = objc_msgSend(v4, "copyShortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nrUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 2004, CFSTR("%@ %@"), v7, v9);

    if (self && self->super._state == 1004)
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        _NRLogWithArgs(qword_1001E45B8, 1, "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@", ", "-[NRLinkManagerBluetooth linkIsAvailable:]", 998, self);
      }
    }
    else
    {
      v10 = (char *)v4;
      v11 = objc_opt_class(NRLinkBluetooth);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v29 = self;
        v30 = v4;
        if (self)
          links = self->_links;
        else
          links = 0;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = -[NSMutableSet copy](links, "copy");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
              if (v18)
                v19 = *(void **)(v18 + 327);
              else
                v19 = 0;
              v20 = v19;
              v21 = *(id *)(v10 + 327);
              v22 = objc_msgSend(v20, "isEqual:", v21);

              if (v22)
              {
                v23 = objc_msgSend(v10, "copyShortDescription");
                objc_msgSend((id)v18, "cancelWithReason:", CFSTR("Replaced by new link %@"), v23);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v15);
        }

        if (v29)
        {
          -[NSMutableSet addObject:](v29->_links, "addObject:", v10);
          v24 = v29->super._queue;
        }
        else
        {
          objc_msgSend(0, "addObject:", v10);
          v24 = 0;
        }
        v4 = v30;
        v25 = v24;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E118;
        block[3] = &unk_1001B8778;
        v32 = v10;
        v33 = v29;
        dispatch_async(v25, block);

      }
      else
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
        {
          if (qword_1001E45C0 != -1)
            dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
          _NRLogWithArgs(qword_1001E45B8, 17, "Got bad link %@", v10);
        }
      }

    }
  }
  else
  {
    v26 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v26, 17);

    if (IsLevelEnabled)
    {
      v28 = sub_10002A890();
      _NRLogWithArgs(v28, 17, "%s called with null link", "-[NRLinkManagerBluetooth linkIsAvailable:]");

    }
  }

}

- (void)linkIsReady:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  char *v8;
  uint64_t v9;
  id v10;
  _BOOL4 v11;
  NSMutableSet *connectedPipes;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char *v21;
  id v22;
  BOOL v23;
  char *v24;
  id v25;
  NSMutableDictionary *v26;
  void *v27;
  OS_dispatch_queue *v28;
  NSObject *v29;
  id v30;
  int IsLevelEnabled;
  id v32;
  void *v33;
  NRLinkManagerBluetooth *v34;
  id v35;
  NSMutableSet *obj;
  _QWORD block[4];
  char *v38;
  NRLinkManagerBluetooth *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v30 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v30, 17);

    if (IsLevelEnabled)
    {
      v32 = sub_10002A890();
      _NRLogWithArgs(v32, 17, "%s called with null link", "-[NRLinkManagerBluetooth linkIsReady:]");

    }
    goto LABEL_39;
  }
  v7 = objc_msgSend(v4, "copyShortDescription");
  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2005, v7);

  if (self && self->super._state == 1004)
  {
    if (qword_1001E45C0 != -1)
      dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
    if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      _NRLogWithArgs(qword_1001E45B8, 1, "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@", ", "-[NRLinkManagerBluetooth linkIsReady:]", 1035, self);
    }
    goto LABEL_39;
  }
  v8 = (char *)v4;
  v9 = objc_opt_class(NRLinkBluetooth);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (qword_1001E45C0 != -1)
      dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
    if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      _NRLogWithArgs(qword_1001E45B8, 17, "Got bad link %@", v8);
    }
    goto LABEL_38;
  }
  v35 = v4;
  v10 = *(id *)(v8 + 335);
  v11 = objc_msgSend(v10, "type") == (id)2;

  sub_10002BE24((uint64_t)self, 3, v11);
  sub_10002BE24((uint64_t)self, 2, v11);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = self;
  if (self)
    connectedPipes = self->_connectedPipes;
  else
    connectedPipes = 0;
  obj = connectedPipes;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v13)
  {
LABEL_34:

    v24 = 0;
    goto LABEL_35;
  }
  v14 = v13;
  v15 = *(_QWORD *)v41;
LABEL_18:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v15)
      objc_enumerationMutation(obj);
    v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
    v20 = *(id *)(v8 + 327);
    if (objc_msgSend(v19, "isEqual:", v20))
      break;

LABEL_20:
    if (v14 == (id)++v16)
    {
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v14)
        goto LABEL_34;
      goto LABEL_18;
    }
  }
  v21 = v8;
  v22 = objc_msgSend(v17, "priority");

  v23 = v22 == (id)2;
  v8 = v21;
  if (!v23)
    goto LABEL_20;
  v24 = v17;

  if (v24)
    sub_1000812F0(v21, v24);
LABEL_35:
  v25 = *(id *)(v8 + 327);
  if (v34)
  {
    v26 = v34->_requestedLinkRequirements;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v25));
    sub_10002D508((id *)&v34->super.super.isa, v27, v25);

    v28 = v34->super._queue;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", v25));
    sub_10002D508(0, v33, v25);

    v28 = 0;
  }
  v29 = v28;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E008;
  block[3] = &unk_1001B8778;
  v38 = v8;
  v39 = v34;
  dispatch_async(v29, block);

  v4 = v35;
LABEL_38:

LABEL_39:
}

- (void)linkIsSuspended:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  char *v8;
  uint64_t v9;
  id v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  id v13;
  int IsLevelEnabled;
  id v15;
  _QWORD block[4];
  char *v17;
  NRLinkManagerBluetooth *v18;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    v7 = objc_msgSend(v4, "copyShortDescription");
    -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2006, v7);

    if (self && self->super._state == 1004)
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        _NRLogWithArgs(qword_1001E45B8, 1, "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@", ", "-[NRLinkManagerBluetooth linkIsSuspended:]", 1091, self);
      }
    }
    else
    {
      v8 = (char *)v4;
      v9 = objc_opt_class(NRLinkBluetooth);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = *(id *)(v8 + 327);
        sub_10002D508((id *)&self->super.super.isa, 0, v10);

        if (self)
          v11 = self->super._queue;
        else
          v11 = 0;
        v12 = v11;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002DEF8;
        block[3] = &unk_1001B8778;
        v17 = v8;
        v18 = self;
        dispatch_async(v12, block);

      }
      else
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
        {
          if (qword_1001E45C0 != -1)
            dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
          _NRLogWithArgs(qword_1001E45B8, 17, "Got bad link %@", v8);
        }
      }

    }
  }
  else
  {
    v13 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v13, 17);

    if (IsLevelEnabled)
    {
      v15 = sub_10002A890();
      _NRLogWithArgs(v15, 17, "%s called with null link", "-[NRLinkManagerBluetooth linkIsSuspended:]");

    }
  }

}

- (void)linkIsUnavailable:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  char *v13;
  BOOL v14;
  int v15;
  BOOL v16;
  id v17;
  OS_dispatch_queue *v18;
  char *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  int *v25;
  id v26;
  int IsLevelEnabled;
  id v28;
  _QWORD block[5];
  char *v30;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    v7 = objc_msgSend(v4, "copyShortDescription");
    -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2007, v7);

    if (self && self->super._state == 1004)
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        _NRLogWithArgs(qword_1001E45B8, 1, "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@", ", "-[NRLinkManagerBluetooth linkIsUnavailable:]", 1123, self);
      }
      goto LABEL_56;
    }
    v8 = (char *)v4;
    v9 = objc_opt_class(NRLinkBluetooth);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        _NRLogWithArgs(qword_1001E45B8, 17, "Got bad link %@", v8);
      }
      goto LABEL_55;
    }
    v10 = *(id *)(v8 + 335);
    v11 = objc_msgSend(v10, "type");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nrUUID"));
    v13 = sub_10012FFF4((uint64_t)NRDLocalDevice, v12);

    if (*(_QWORD *)(v8 + 335))
    {
      if (v8[233])
      {
        v14 = 0;
LABEL_26:
        v15 = 0;
        if (self)
        {
          if (!v8[233])
          {
            v15 = 0;
            if (self->_p2pPipeRegistrationForMedium.state == 2)
            {
              if (v13)
              {
                if (v13[9])
                  v16 = v11 == (id)2;
                else
                  v16 = 0;
                v15 = v16;
              }
            }
          }
        }
LABEL_37:
        -[NSMutableSet removeObject:](self->_links, "removeObject:", v8);
        v17 = *(id *)(v8 + 327);
        sub_10002D508((id *)&self->super.super.isa, 0, v17);

        v18 = self->super._queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002DA60;
        block[3] = &unk_1001B8778;
        block[4] = self;
        v19 = v8;
        v30 = v19;
        dispatch_async((dispatch_queue_t)v18, block);

        if (!v14 && !v15)
          goto LABEL_54;
        v20 = self->_pipeStateDictionary;
        if (v20)
        {
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nrUUID"));

          if (v22)
          {
            if (qword_1001E45C0 != -1)
              dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
            if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
            {
              if (qword_1001E45C0 != -1)
                dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
              _NRLogWithArgs(qword_1001E45B8, 1, "%s%.30s:%-4d resetting pipe state", ", "-[NRLinkManagerBluetooth linkIsUnavailable:]", 1160);
            }
            v23 = self->_pipeStateDictionary;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nrUUID"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", 0, v24);

          }
        }
        if (v11 == (id)2)
        {
          if ((*(_WORD *)&self->_p2pPipeRegistrationForMedium & 0x800) == 0)
          {
            -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4214, CFSTR("p2p"));
            v25 = &OBJC_IVAR___NRLinkManagerBluetooth__p2pPipeRegistrationForMedium;
LABEL_53:
            *((_BYTE *)&self->super.super.isa + *v25 + 1) |= 8u;
            sub_10002A358((uint64_t)self, 1, v11 == (id)2);
          }
        }
        else if ((*(_WORD *)&self->_pipeRegistrationForMedium & 0x800) == 0)
        {
          -[NRLinkManager reportEvent:](self, "reportEvent:", 4214);
          v25 = &OBJC_IVAR___NRLinkManagerBluetooth__pipeRegistrationForMedium;
          goto LABEL_53;
        }
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      if (self)
      {
        v14 = 0;
        if (self->_pipeRegistrationForMedium.state == 2 && v13)
          v14 = v13[9] != 0;
        goto LABEL_26;
      }
    }
    v14 = 0;
    v15 = 0;
    goto LABEL_37;
  }
  v26 = sub_10002A890();
  IsLevelEnabled = _NRLogIsLevelEnabled(v26, 17);

  if (IsLevelEnabled)
  {
    v28 = sub_10002A890();
    _NRLogWithArgs(v28, 17, "%s called with null link", "-[NRLinkManagerBluetooth linkIsUnavailable:]");

  }
LABEL_56:

}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  OS_dispatch_queue *v13;
  NSObject *v14;
  id v15;
  int IsLevelEnabled;
  id v17;
  id v18;
  int v19;
  _QWORD block[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v9 = queue;
  dispatch_assert_queue_V2(v9);

  if (!v6)
  {
    v15 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17);

    if (!IsLevelEnabled)
      goto LABEL_24;
    v17 = sub_10002A890();
    _NRLogWithArgs(v17, 17, "%s called with null link");
LABEL_29:

    goto LABEL_24;
  }
  if (!v7)
  {
    v18 = sub_10002A890();
    v19 = _NRLogIsLevelEnabled(v18, 17);

    if (!v19)
      goto LABEL_24;
    v17 = sub_10002A890();
    _NRLogWithArgs(v17, 17, "%s called with null data");
    goto LABEL_29;
  }
  v10 = objc_msgSend(v6, "copyShortDescription");
  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 2008, v10);

  if (self && self->super._state == 1004)
  {
    if (qword_1001E45C0 != -1)
      dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
    if (_NRLogIsLevelEnabled(qword_1001E45B8, 1))
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      _NRLogWithArgs(qword_1001E45B8, 1, "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@", ", "-[NRLinkManagerBluetooth linkDidReceiveData:data:]", 1175, self);
    }
  }
  else
  {
    v11 = v6;
    v12 = objc_opt_class(NRLinkBluetooth);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      if (self)
        v13 = self->super._queue;
      else
        v13 = 0;
      v14 = v13;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002D4BC;
      block[3] = &unk_1001B87A0;
      block[4] = self;
      v21 = v11;
      v22 = v7;
      dispatch_async(v14, block);

    }
    else
    {
      if (qword_1001E45C0 != -1)
        dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
      if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
      {
        if (qword_1001E45C0 != -1)
          dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
        _NRLogWithArgs(qword_1001E45B8, 17, "Got bad link %@", v11);
      }
    }

  }
LABEL_24:

}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int IsLevelEnabled;
  id v8;

  v4 = a4;
  v8 = a3;
  if (v8)
  {
    if (self)
      self = (NRLinkManagerBluetooth *)objc_loadWeakRetained((id *)&self->super._managerDelegate);
    if ((objc_opt_respondsToSelector(self, "linkPeerIsAsleep:isAsleep:") & 1) != 0)
      -[NRLinkManagerBluetooth linkPeerIsAsleep:isAsleep:](self, "linkPeerIsAsleep:isAsleep:", v8, v4);
  }
  else
  {
    v6 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v6, 17);

    if (!IsLevelEnabled)
      goto LABEL_7;
    self = (NRLinkManagerBluetooth *)sub_10002A890();
    _NRLogWithArgs(self, 17, "%s called with null link", "-[NRLinkManagerBluetooth linkPeerIsAsleep:isAsleep:]");
  }

LABEL_7:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  CBPeripheralManager *v4;
  CBPeripheralManager *peripheralManager;
  CBPeripheralManager *v6;

  v6 = (CBPeripheralManager *)a3;
  if (self)
  {
    v4 = self->_peripheralManager;
    if (v4)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v6)
        sub_10002D33C(self, (unint64_t)-[CBPeripheralManager state](v6, "state"));
    }
  }

}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6;
  CBPeripheralManager *v7;
  CBPeripheralManager *peripheralManager;
  NSString *v9;
  NSString *v10;
  id v11;
  void *v12;
  CBPeripheralManager *v13;

  v13 = (CBPeripheralManager *)a3;
  v6 = a4;
  if (self)
  {
    v7 = self->_peripheralManager;
    if (v7)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v13)
      {
        if (v6)
        {
          v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
          v10 = v9;
          if (v9 == CBErrorDomain)
          {
            v11 = objc_msgSend(v6, "code");

            if (v11 != (id)9)
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
              -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 3503, v12);

              self->_currentAdvertisementState = 0;
            }
          }
          else
          {

          }
        }
        else
        {
          -[NRLinkManager reportEvent:](self, "reportEvent:", 3502);
          self->_currentAdvertisementState = 4;
        }
      }
    }
  }

}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  id v6;
  CBPeripheralManager *v7;
  CBPeripheralManager *peripheralManager;
  int currentAdvertisementState;
  void *v10;
  CBPeripheralManager *v11;

  v11 = (CBPeripheralManager *)a3;
  v6 = a4;
  if (self)
  {
    v7 = self->_peripheralManager;
    if (v7)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v11)
      {
        currentAdvertisementState = self->_currentAdvertisementState;
        self->_currentAdvertisementState = 0;
        if (v6)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
          -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 3506, v10);

        }
        else
        {
          -[NRLinkManager reportEvent:](self, "reportEvent:", 3505);
          if (currentAdvertisementState == 3)
            sub_10002AB14((uint64_t)self);
        }
      }
    }
  }

}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = objc_msgSend(a3, "state");
  v5 = (unint64_t)v4;
  if ((unint64_t)v4 >= 6)
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("UnknownState(%lld)"), v4);
  else
    v6 = *(&off_1001B6540 + (_QWORD)v4);
  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4200, v6);

  sub_10002CFC8((uint64_t)self, v5);
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  id v19;
  int v20;
  id v21;
  int IsLevelEnabled;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a4;
  v8 = a5;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v10 = queue;
  dispatch_assert_queue_V2(v10);

  if (a3)
  {
    if (!v26)
    {
      v21 = sub_10002A890();
      IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17);

      if (!IsLevelEnabled)
        goto LABEL_35;
      v11 = sub_10002A890();
      _NRLogWithArgs(v11, 17, "%s called with null identifier");
      goto LABEL_34;
    }
    v11 = v26;
    v12 = v8;
    if (!self)
      goto LABEL_33;
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.terminusLink")))
    {
      if (v12)
      {
        self->_pipeRegistrationForMedium.state = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
        v25 = v13;
        v14 = "pipe";
LABEL_9:
        v15 = "Medium";
LABEL_18:
        -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4204, CFSTR("%s %s error %@"), v15, v14, v25);
LABEL_19:

LABEL_33:
        goto LABEL_34;
      }
      self->_pipeRegistrationForMedium.state = 2;
      v16 = "pipe";
      goto LABEL_21;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.terminusLink.urgent")))
    {
      if (v12)
      {
        self->_pipeRegistrationForHigh.state = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
        v25 = v13;
        v14 = "pipe";
LABEL_13:
        v15 = "High";
        goto LABEL_18;
      }
      self->_pipeRegistrationForHigh.state = 2;
      v17 = "pipe";
LABEL_26:
      v18 = "High";
LABEL_32:
      -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4202, CFSTR("%s %s"), v18, v17);
      goto LABEL_33;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.terminusLink.datagram")))
    {
      if (v12)
      {
        self->_pipeRegistrationForIsochronous.state = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
        v25 = v13;
        v14 = "pipe";
LABEL_17:
        v15 = "Isochronous";
        goto LABEL_18;
      }
      self->_pipeRegistrationForIsochronous.state = 2;
      v17 = "pipe";
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.terminusLink.p2p")))
      {
        if (v12)
        {
          self->_p2pPipeRegistrationForMedium.state = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
          v25 = v13;
          v14 = "p2pPipe";
          goto LABEL_9;
        }
        self->_p2pPipeRegistrationForMedium.state = 2;
        v16 = "p2pPipe";
LABEL_21:
        -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4202, CFSTR("%s %s"), "Medium", v16);
        sub_100029D0C((uint64_t)self);
        goto LABEL_33;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.terminusLink.urgent.p2p")))
      {
        if (v12)
        {
          self->_p2pPipeRegistrationForHigh.state = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
          v25 = v13;
          v14 = "p2pPipe";
          goto LABEL_13;
        }
        self->_p2pPipeRegistrationForHigh.state = 2;
        v17 = "p2pPipe";
        goto LABEL_26;
      }
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.terminusLink.datagram.p2p")))
      {
        if (!v12)
        {
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4203, CFSTR("\"%@\"), v11, v23);
          goto LABEL_33;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
        -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4205, CFSTR("\"%@\" error %@"), v11, v13, v24);
        goto LABEL_19;
      }
      if (v12)
      {
        self->_p2pPipeRegistrationForIsochronous.state = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
        v25 = v13;
        v14 = "p2pPipe";
        goto LABEL_17;
      }
      self->_p2pPipeRegistrationForIsochronous.state = 2;
      v17 = "p2pPipe";
    }
    v18 = "Isochronous";
    goto LABEL_32;
  }
  v19 = sub_10002A890();
  v20 = _NRLogIsLevelEnabled(v19, 17);

  if (!v20)
    goto LABEL_35;
  v11 = sub_10002A890();
  _NRLogWithArgs(v11, 17, "%s called with null pipeManager");
LABEL_34:

LABEL_35:
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  OS_dispatch_queue *queue;
  NSObject *v7;
  id v8;
  id v9;
  $D01F01AB5E9A2EA38BB98B1ADF83C57C pipeRegistrationForMedium;
  NRLinkManagerBluetooth *v11;
  uint64_t v12;
  int v13;
  $D01F01AB5E9A2EA38BB98B1ADF83C57C p2pPipeRegistrationForMedium;
  id v15;
  int IsLevelEnabled;
  id v17;
  int v18;
  id v19;

  v19 = a4;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v7 = queue;
  dispatch_assert_queue_V2(v7);

  if (!a3)
  {
    v15 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17);

    if (!IsLevelEnabled)
      goto LABEL_20;
    v9 = sub_10002A890();
    _NRLogWithArgs(v9, 17, "%s called with null pipeManager");
    goto LABEL_19;
  }
  if (!v19)
  {
    v17 = sub_10002A890();
    v18 = _NRLogIsLevelEnabled(v17, 17);

    if (!v18)
      goto LABEL_20;
    v9 = sub_10002A890();
    _NRLogWithArgs(v9, 17, "%s called with null identifier");
    goto LABEL_19;
  }
  v8 = v19;
  v9 = v8;
  if (self)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.terminusLink")))
    {
      self->_pipeRegistrationForMedium.state = 0;
      -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4207, CFSTR("%s %s"), "Medium", "pipe");
      if ((self->_pipeRegistrationForMedium.flags & 2) != 0)
        sub_10002BE24((uint64_t)self, 1, 0);
      sub_10002A358((uint64_t)self, 2, 0);
      sub_10002A358((uint64_t)self, 3, 0);
      pipeRegistrationForMedium = self->_pipeRegistrationForMedium;
      if ((*(_WORD *)&pipeRegistrationForMedium & 0x800) == 0)
        goto LABEL_19;
      self->_pipeRegistrationForMedium.flags = pipeRegistrationForMedium.flags & 0xF7;
      -[NRLinkManager reportEvent:](self, "reportEvent:", 4215);
      v11 = self;
      v12 = 1;
      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.terminusLink.urgent")))
    {
      self->_pipeRegistrationForHigh.state = 0;
      -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4207, CFSTR("%s %s"), "High", "pipe");
      if ((self->_pipeRegistrationForHigh.flags & 2) != 0)
      {
        v11 = self;
        v12 = 2;
LABEL_17:
        v13 = 0;
LABEL_18:
        sub_10002BE24((uint64_t)v11, v12, v13);
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.terminusLink.datagram")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.terminusLink.p2p")))
        {
          self->_p2pPipeRegistrationForMedium.state = 0;
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4207, CFSTR("%s %s"), "Medium", "p2pPipe");
          if ((self->_p2pPipeRegistrationForMedium.flags & 2) != 0)
            sub_10002BE24((uint64_t)self, 1, 1);
          p2pPipeRegistrationForMedium = self->_p2pPipeRegistrationForMedium;
          if ((*(_WORD *)&p2pPipeRegistrationForMedium & 0x800) == 0)
            goto LABEL_19;
          self->_p2pPipeRegistrationForMedium.flags = p2pPipeRegistrationForMedium.flags & 0xF7;
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4215, CFSTR("p2p"));
          v11 = self;
          v12 = 1;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.terminusLink.urgent.p2p")))
        {
          self->_p2pPipeRegistrationForHigh.state = 0;
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4207, CFSTR("%s %s"), "High", "p2pPipe");
          if ((self->_p2pPipeRegistrationForHigh.flags & 2) == 0)
            goto LABEL_19;
          v11 = self;
          v12 = 2;
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.terminusLink.datagram.p2p")))
          {
            -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4208, v9);
            goto LABEL_19;
          }
          self->_p2pPipeRegistrationForIsochronous.state = 0;
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4207, CFSTR("%s %s"), "Isochronous", "p2pPipe");
          if ((self->_p2pPipeRegistrationForIsochronous.flags & 2) == 0)
            goto LABEL_19;
          v11 = self;
          v12 = 3;
        }
        v13 = 1;
        goto LABEL_18;
      }
      self->_pipeRegistrationForIsochronous.state = 0;
      -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4207, CFSTR("%s %s"), "Isochronous", "pipe");
      if ((self->_pipeRegistrationForIsochronous.flags & 2) != 0)
      {
        v11 = self;
        v12 = 3;
        goto LABEL_17;
      }
    }
  }
LABEL_19:

LABEL_20:
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  OS_dispatch_queue *v13;
  id v14;
  int IsLevelEnabled;
  id v16;
  id v17;
  int v18;
  _QWORD block[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v14 = sub_10002A890();
    IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17);

    if (!IsLevelEnabled)
      goto LABEL_10;
    v16 = sub_10002A890();
    _NRLogWithArgs(v16, 17, "%s called with null pipeManager");
LABEL_21:

    goto LABEL_10;
  }
  if (!v7)
  {
    v17 = sub_10002A890();
    v18 = _NRLogIsLevelEnabled(v17, 17);

    if (!v18)
      goto LABEL_10;
    v16 = sub_10002A890();
    _NRLogWithArgs(v16, 17, "%s called with null pipe");
    goto LABEL_21;
  }
  self->_noBTCallbackSimCrashGenerated = 0;
  if (objc_msgSend(v7, "priority") == (id)1)
  {
    v9 = 4210;
LABEL_9:
    -[NSMutableSet addObject:](self->_connectedPipes, "addObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", v9, CFSTR("pipe %@ bluetoothUUID %@"), v8, v11);

    v12 = dispatch_time(0x8000000000000000, 500000000);
    v13 = self->super._queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002AF0C;
    block[3] = &unk_1001B8778;
    block[4] = self;
    v20 = v8;
    dispatch_after(v12, (dispatch_queue_t)v13, block);

    goto LABEL_10;
  }
  if (objc_msgSend(v8, "priority") == (id)2)
  {
    v9 = 4406;
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "priority") == (id)3)
  {
    v9 = 4306;
    goto LABEL_9;
  }
  if (qword_1001E45C0 != -1)
    dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
  if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
  {
    if (qword_1001E45C0 != -1)
      dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
    _NRLogWithArgs(qword_1001E45B8, 17, "Pipe of unsupported priority connected: %@", v8);
  }
LABEL_10:

}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSMutableSet *connectedPipes;
  void *v17;
  NSMutableSet *links;
  NSMutableSet *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  unsigned int v27;
  id v28;
  NSMutableSet *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  unsigned int v37;
  id v38;
  id v39;
  id v40;
  int v41;
  id v42;
  id v43;
  int v44;
  id v45;
  int IsLevelEnabled;
  id v47;
  unsigned __int8 v48;
  id v49;
  NSMutableSet *v50;
  NSMutableSet *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  uint64_t v56;
  void *v57;
  id v58;
  unsigned int v59;
  id v60;
  id v61;
  uint64_t v62;
  void *j;
  _BYTE *v64;
  void *v65;
  id WeakRetained;
  id v67;
  char *v68;
  void *k;
  _BYTE *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id obj;
  NRLinkManagerBluetooth *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peer"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

      if (!v12)
      {
        v45 = sub_10002A890();
        IsLevelEnabled = _NRLogIsLevelEnabled(v45, 17);

        v12 = 0;
        if (IsLevelEnabled)
        {
          v47 = sub_10002A890();
          _NRLogWithArgs(v47, 17, "%s called with null bluetoothUUID", "-[NRLinkManagerBluetooth scalablePipeManager:pipeDidDisconnect:error:]");

          v12 = 0;
        }
        goto LABEL_109;
      }
      if (objc_msgSend(v9, "priority") == (id)1)
      {
        v13 = 0;
        v14 = 0;
        v15 = 4211;
      }
      else if (objc_msgSend(v9, "priority") == (id)2)
      {
        v14 = 0;
        v15 = 4407;
        v13 = 1;
      }
      else
      {
        if (objc_msgSend(v9, "priority") != (id)3)
        {
          if (qword_1001E45C0 != -1)
            dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
          if (_NRLogIsLevelEnabled(qword_1001E45B8, 17))
          {
            if (qword_1001E45C0 != -1)
              dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
            _NRLogWithArgs(qword_1001E45B8, 17, "Pipe of unsupported priority disconnected: %@", v9);
          }
          goto LABEL_109;
        }
        v13 = 0;
        v15 = 4307;
        v14 = 1;
      }
      -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", v15, CFSTR("pipe %@ bluetoothUUID %@ error %@"), v9, v12, v10);
      v78 = self;
      v75 = v10;
      v76 = v9;
      if (self)
      {
        if (!-[NSMutableSet containsObject:](self->_connectedPipes, "containsObject:", v9))
        {
          if (v14)
          {
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
LABEL_18:
            v17 = v12;
            links = self->_links;
            goto LABEL_19;
          }
          if (v13)
          {
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
LABEL_38:
            v17 = v12;
            v29 = self->_links;
            goto LABEL_39;
          }
LABEL_72:
          v49 = objc_alloc_init((Class)NSMutableArray);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          if (self)
            v50 = self->_links;
          else
            v50 = 0;
          v74 = v8;
          v51 = v50;
          v52 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v53; i = (char *)i + 1)
              {
                if (*(_QWORD *)v84 != v54)
                  objc_enumerationMutation(v51);
                v56 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i);
                if (v56)
                  v57 = *(void **)(v56 + 327);
                else
                  v57 = 0;
                v58 = v57;
                v59 = objc_msgSend(v58, "isEqual:", v12);

                if (v59)
                  objc_msgSend(v49, "addObject:", v56);
              }
              v53 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
            }
            while (v53);
          }
          v73 = v12;

          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          obj = v49;
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v80;
            if (v78)
            {
              do
              {
                for (j = 0; j != v61; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v80 != v62)
                    objc_enumerationMutation(obj);
                  v64 = *(_BYTE **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)j);
                  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "nrUUID"));
                  if (v64)
                  {
                    objc_msgSend(v64, "setNoTransport:", 1);
                    v64[233] = 1;
                    objc_msgSend(v64, "cancelWithReason:", CFSTR("Bluetooth Pipe Disconnected"));
                  }
                  WeakRetained = objc_loadWeakRetained((id *)&v78->_bluetoothManagerDelegate);
                  objc_msgSend(WeakRetained, "pipeDidConnectForNRUUID:nrUUID:", 0, v65);

                  sub_10002A8D0((uint64_t)v78, v65);
                }
                v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
              }
              while (v61);
            }
            else
            {
              do
              {
                for (k = 0; k != v61; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v80 != v62)
                    objc_enumerationMutation(obj);
                  v70 = *(_BYTE **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)k);
                  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "nrUUID"));
                  if (v70)
                  {
                    objc_msgSend(v70, "setNoTransport:", 1);
                    v70[233] = 1;
                    objc_msgSend(v70, "cancelWithReason:", CFSTR("Bluetooth Pipe Disconnected"));
                  }
                  objc_msgSend(0, "pipeDidConnectForNRUUID:nrUUID:", 0, v71);
                  v72 = v71;

                }
                v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
              }
              while (v61);
            }
          }

          v12 = v73;
          v8 = v74;
          v9 = v76;
          if (v78 && v78->_peripheralManager)
          {
            v67 = v73;
            objc_opt_self(NRDLocalDevice);
            v68 = sub_100134B14((uint64_t)NRDLocalDevice, v67, 1);

            if (v68 && v68[8] && v68[9])
            {
              sub_10002AB14((uint64_t)v78);
            }
            else
            {
              if (qword_1001E45C0 != -1)
                dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
              if (_NRLogIsLevelEnabled(qword_1001E45B8, 0))
              {
                if (qword_1001E45C0 != -1)
                  dispatch_once(&qword_1001E45C0, &stru_1001B64E0);
                _NRLogWithArgs(qword_1001E45B8, 0, "%s%.30s:%-4d Not starting BT advertisements for disabled device %@ with pipe %@", ", "-[NRLinkManagerBluetooth scalablePipeManager:pipeDidDisconnect:error:]", 1950, v68, v76);
              }
            }

          }
          v10 = v75;
          goto LABEL_109;
        }
        connectedPipes = self->_connectedPipes;
      }
      else
      {
        v48 = objc_msgSend(0, "containsObject:", v9);
        connectedPipes = 0;
        if ((v48 & 1) == 0)
        {
          v17 = v12;
          if (v14)
          {
            links = 0;
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
LABEL_19:
            v19 = links;
            v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v92;
              do
              {
                v23 = 0;
                do
                {
                  if (*(_QWORD *)v92 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v23);
                  if (v24)
                    v25 = *(void **)(v24 + 327);
                  else
                    v25 = 0;
                  v26 = v25;
                  v27 = objc_msgSend(v26, "isEqual:", v17);

                  if (v27)
                  {
                    sub_1000802A0(v24, 0);
                    goto LABEL_53;
                  }
                  v23 = (char *)v23 + 1;
                }
                while (v21 != v23);
                v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
                v21 = v28;
              }
              while (v28);
            }
LABEL_53:

            v10 = v75;
            v9 = v76;
            v12 = v17;
LABEL_109:

            goto LABEL_110;
          }
          self = 0;
          if (v13)
          {
            v29 = 0;
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
LABEL_39:
            v19 = v29;
            v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v88;
              do
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v88 != v32)
                    objc_enumerationMutation(v19);
                  v34 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v33);
                  if (v34)
                    v35 = *(void **)(v34 + 327);
                  else
                    v35 = 0;
                  v36 = v35;
                  v37 = objc_msgSend(v36, "isEqual:", v17);

                  if (v37)
                  {
                    sub_1000812F0((char *)v34, 0);
                    goto LABEL_53;
                  }
                  v33 = (char *)v33 + 1;
                }
                while (v31 != v33);
                v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
                v31 = v38;
              }
              while (v38);
            }
            goto LABEL_53;
          }
          goto LABEL_72;
        }
      }
      -[NSMutableSet removeObject:](connectedPipes, "removeObject:", v9);
      if ((v14 & 1) != 0)
      {
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        if (!self)
        {
          v17 = v12;
          links = 0;
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      if ((v13 & 1) != 0)
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        if (!self)
        {
          v17 = v12;
          v29 = 0;
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      goto LABEL_72;
    }
    v39 = v8;
    v43 = sub_10002A890();
    v44 = _NRLogIsLevelEnabled(v43, 17);

    v8 = v39;
    if (v44)
    {
      v42 = sub_10002A890();
      _NRLogWithArgs(v42, 17, "%s called with null pipe");
      goto LABEL_64;
    }
  }
  else
  {
    v39 = 0;
    v40 = sub_10002A890();
    v41 = _NRLogIsLevelEnabled(v40, 17);

    v8 = 0;
    if (v41)
    {
      v42 = sub_10002A890();
      _NRLogWithArgs(v42, 17, "%s called with null pipeManager");
LABEL_64:

      v8 = v39;
    }
  }
LABEL_110:

}

- (void)centralManagerDidUpdateState:(id)a3
{
  CBCentralManager *v4;
  CBCentralManager *centralManager;
  CBCentralManager *v6;

  v6 = (CBCentralManager *)a3;
  if (self)
  {
    v4 = self->_centralManager;
    if (v4)
    {
      centralManager = self->_centralManager;

      if (centralManager == v6)
        sub_10002A7C4(self, (uint64_t)-[CBCentralManager state](v6, "state"));
    }
  }

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  CBCentralManager *v7;
  CBCentralManager *centralManager;
  void *v9;
  CBCentralManager *v10;

  v10 = (CBCentralManager *)a3;
  v6 = a4;
  if (self)
  {
    v7 = self->_centralManager;
    if (v7)
    {
      centralManager = self->_centralManager;

      if (centralManager == v10)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
        -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", 4001, v9);

        sub_100029D0C((uint64_t)self);
      }
    }
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  CBCentralManager *v10;
  CBCentralManager *centralManager;
  NRAnalyticsLinkManagerBluetooth *v12;
  NRAnalyticsLinkManagerBluetooth *v13;
  void *v14;
  unsigned int v15;
  NRAnalyticsLinkManagerBluetooth *v16;
  CBCentralManager *v17;

  v17 = (CBCentralManager *)a3;
  v8 = a4;
  v9 = a5;
  if (self)
  {
    v10 = self->_centralManager;
    if (v10)
    {
      centralManager = self->_centralManager;

      if (centralManager == v17)
      {
        -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4002, CFSTR("peripheral %@ error %@"), v8, v9);
        v12 = (NRAnalyticsLinkManagerBluetooth *)v9;
        v13 = v12;
        if (v12 && -[NRAnalyticsLinkManagerBluetooth code](v12, "code") == (id)14)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRAnalyticsLinkManagerBluetooth domain](v13, "domain"));
          v15 = objc_msgSend(v14, "isEqualToString:", CBErrorDomain);

          if (!v15)
          {
LABEL_11:
            sub_100029434((id *)&self->super.super.isa);
            goto LABEL_12;
          }
          -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4015, CFSTR("peripheral %@"), v8);
          v16 = objc_alloc_init(NRAnalyticsLinkManagerBluetooth);
          v13 = v16;
          if (v16)
            v16->_peerRemovedPairingInformation = 1;
          -[NRAnalyticsLinkManagerBluetooth submit](v16, "submit");
        }

        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  CBCentralManager *v10;
  CBCentralManager *centralManager;
  CBCentralManager *v12;

  v12 = (CBCentralManager *)a3;
  v8 = a4;
  v9 = a5;
  if (self)
  {
    v10 = self->_centralManager;
    if (v10)
    {
      centralManager = self->_centralManager;

      if (centralManager == v12)
      {
        -[NRLinkManager reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 4004, CFSTR("peripheral %@ error %@"), v8, v9);
        sub_100029434((id *)&self->super.super.isa);
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheralConnectDate, 0);
  objc_storeStrong((id *)&self->_pipeStateDictionary, 0);
  objc_storeStrong((id *)&self->_linkRequirementsMonitorSource, 0);
  objc_destroyWeak((id *)&self->_bluetoothManagerDelegate);
  objc_storeStrong((id *)&self->_appliedLinkRequirements, 0);
  objc_storeStrong((id *)&self->_requestedLinkRequirements, 0);
  objc_storeStrong((id *)&self->_connectedPipes, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

@end
