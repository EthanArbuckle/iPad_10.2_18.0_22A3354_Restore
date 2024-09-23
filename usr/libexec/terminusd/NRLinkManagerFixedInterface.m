@implementation NRLinkManagerFixedInterface

- (void)cancel
{
  OS_dispatch_queue *v3;
  __SCDynamicStore *dynamicStoreRef;
  NSMutableSet *links;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSMutableSet *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self)
  {
    v3 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003);
    if (self->super._state == 1004)
    {
      if (qword_1001E47F8 != -1)
        dispatch_once(&qword_1001E47F8, &stru_1001B7828);
      if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
      {
        if (qword_1001E47F8 != -1)
          dispatch_once(&qword_1001E47F8, &stru_1001B7828);
        _NRLogWithArgs(qword_1001E47F0, 1, "%s%.30s:%-4d Already cancelled", ", "-[NRLinkManagerFixedInterface cancel]", 71);
      }
      return;
    }
    self->super._state = 1004;
    dynamicStoreRef = self->_dynamicStoreRef;
    if (dynamicStoreRef)
    {
      CFRelease(dynamicStoreRef);
      self->_dynamicStoreRef = 0;
    }
    -[NRLinkManagerFixedInterface invalidateManager](self, "invalidateManager");
    links = self->_links;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    objc_msgSend(0, "reportEvent:", 2003);
    objc_msgSend(0, "invalidateManager");
    links = 0;
  }
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSMutableSet copy](links, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "cancelWithReason:", CFSTR("Cancelling all links"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (self)
    v11 = self->_links;
  else
    v11 = 0;
  -[NSMutableSet removeAllObjects](v11, "removeAllObjects");

}

- (void)invalidateManager
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NRLinkManagerFixedInterface;
  -[NRLinkManager invalidateManager](&v2, "invalidateManager");
}

- (void)dealloc
{
  id v3;
  id v4;
  objc_super v5;

  if (qword_1001E47F8 != -1)
    dispatch_once(&qword_1001E47F8, &stru_1001B7828);
  if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
  {
    if (qword_1001E47F8 != -1)
      dispatch_once(&qword_1001E47F8, &stru_1001B7828);
    v3 = (id)qword_1001E47F0;
    v4 = -[NRLinkManagerFixedInterface copyName](self, "copyName");
    _NRLogWithArgs(v3, 1, "%s%.30s:%-4d %@", ", "-[NRLinkManagerFixedInterface dealloc]", 97, v4);

  }
  -[NRLinkManagerFixedInterface invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)NRLinkManagerFixedInterface;
  -[NRLinkManagerFixedInterface dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return CFSTR("Link Manager - FixedInterface");
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
  NWAddressEndpoint *peerEndpoint;
  void *v12;

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init((Class)NSMutableString);
  v6 = -[NRLinkManagerFixedInterface copyName](self, "copyName");
  objc_msgSend(v5, "appendFormat:", CFSTR("\nName: %@"), v6);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinkManager type: %@"), StringFromNRLinkType);

    state = self->super._state;
  }
  else
  {
    v12 = (void *)createStringFromNRLinkType(0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinkManager type: %@"), v12);

    state = 0;
  }
  v9 = sub_1000A3074(state);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nState: %@"), v9);

  if (self)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinks: %@"), self->_links);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nFixed Interface: %@"), self->_fixedInterfaceName);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal Endpoint: %@"), self->_localEndpoint);
    peerEndpoint = self->_peerEndpoint;
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinks: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nFixed Interface: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal Endpoint: %@"), 0);
    peerEndpoint = 0;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("\nRemote Endpoint: %@"), peerEndpoint);
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
  id v10;
  int IsLevelEnabled;
  _QWORD block[4];
  id v13;
  NRLinkManagerFixedInterface *v14;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v10 = sub_1000F8278();
    IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v9 = sub_1000F8278();
    _NRLogWithArgs(v9, 17, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsAvailable:]");
    goto LABEL_14;
  }
  -[NRLinkManager reportEvent:](self, "reportEvent:", 2004);
  if (!self)
  {
    objc_msgSend(0, "addObject:", v4);
    v7 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    -[NSMutableSet addObject:](self->_links, "addObject:", v4);
    v7 = self->super._queue;
LABEL_13:
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F8C00;
    block[3] = &unk_1001B8778;
    v13 = v4;
    v14 = self;
    v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E47F8 != -1)
    dispatch_once(&qword_1001E47F8, &stru_1001B7828);
  if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
  {
    if (qword_1001E47F8 != -1)
      dispatch_once(&qword_1001E47F8, &stru_1001B7828);
    _NRLogWithArgs(qword_1001E47F0, 1, "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@", ", "-[NRLinkManagerFixedInterface linkIsAvailable:]", 251, self);
  }
LABEL_15:

}

- (void)linkIsReady:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  id v11;
  int IsLevelEnabled;
  id v13;
  _QWORD block[4];
  id v15;
  NRLinkManagerFixedInterface *v16;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v11 = sub_1000F8278();
    IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v10 = sub_1000F8278();
    _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsReady:]");
    goto LABEL_14;
  }
  -[NRLinkManager reportEvent:](self, "reportEvent:", 2005);
  if (!self)
  {
    v13 = v4;
    v8 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    v7 = v4;
    v8 = self->super._queue;
LABEL_13:
    v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F8AF0;
    block[3] = &unk_1001B8778;
    v15 = v4;
    v16 = self;
    v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E47F8 != -1)
    dispatch_once(&qword_1001E47F8, &stru_1001B7828);
  if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
  {
    if (qword_1001E47F8 != -1)
      dispatch_once(&qword_1001E47F8, &stru_1001B7828);
    _NRLogWithArgs(qword_1001E47F0, 1, "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@", ", "-[NRLinkManagerFixedInterface linkIsReady:]", 276, self);
  }
LABEL_15:

}

- (void)linkIsSuspended:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  OS_dispatch_queue *v8;
  NSObject *v9;
  id v10;
  id v11;
  int IsLevelEnabled;
  id v13;
  _QWORD block[4];
  id v15;
  NRLinkManagerFixedInterface *v16;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v11 = sub_1000F8278();
    IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v10 = sub_1000F8278();
    _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsSuspended:]");
    goto LABEL_14;
  }
  -[NRLinkManager reportEvent:](self, "reportEvent:", 2006);
  if (!self)
  {
    v13 = v4;
    v8 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    v7 = v4;
    v8 = self->super._queue;
LABEL_13:
    v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F89E0;
    block[3] = &unk_1001B8778;
    v15 = v4;
    v16 = self;
    v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E47F8 != -1)
    dispatch_once(&qword_1001E47F8, &stru_1001B7828);
  if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
  {
    if (qword_1001E47F8 != -1)
      dispatch_once(&qword_1001E47F8, &stru_1001B7828);
    _NRLogWithArgs(qword_1001E47F0, 1, "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@", ", "-[NRLinkManagerFixedInterface linkIsSuspended:]", 299, self);
  }
LABEL_15:

}

- (void)linkIsUnavailable:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  OS_dispatch_queue *v7;
  NSObject *v8;
  id v9;
  id v10;
  int IsLevelEnabled;
  _QWORD block[4];
  id v13;
  NRLinkManagerFixedInterface *v14;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v10 = sub_1000F8278();
    IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v9 = sub_1000F8278();
    _NRLogWithArgs(v9, 17, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsUnavailable:]");
    goto LABEL_14;
  }
  -[NRLinkManager reportEvent:](self, "reportEvent:", 2007);
  if (!self)
  {
    objc_msgSend(0, "removeObject:", v4);
    v7 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    -[NSMutableSet removeObject:](self->_links, "removeObject:", v4);
    v7 = self->super._queue;
LABEL_13:
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F82B8;
    block[3] = &unk_1001B8778;
    v13 = v4;
    v14 = self;
    v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E47F8 != -1)
    dispatch_once(&qword_1001E47F8, &stru_1001B7828);
  if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
  {
    if (qword_1001E47F8 != -1)
      dispatch_once(&qword_1001E47F8, &stru_1001B7828);
    _NRLogWithArgs(qword_1001E47F0, 1, "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@", ", "-[NRLinkManagerFixedInterface linkIsUnavailable:]", 322, self);
  }
LABEL_15:

}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  id v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    objc_msgSend(0, "reportEvent:", 2008);
    v13 = v6;
    queue = 0;
    goto LABEL_10;
  }
  v8 = self->super._queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2008);
  if (self->super._state != 1004)
  {
    v9 = v6;
    queue = self->super._queue;
LABEL_10:
    v11 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F81FC;
    block[3] = &unk_1001B87A0;
    block[4] = self;
    v15 = v6;
    v16 = v7;
    v12 = v6;
    dispatch_async(v11, block);

    goto LABEL_11;
  }
  if (qword_1001E47F8 != -1)
    dispatch_once(&qword_1001E47F8, &stru_1001B7828);
  if (_NRLogIsLevelEnabled(qword_1001E47F0, 1))
  {
    if (qword_1001E47F8 != -1)
      dispatch_once(&qword_1001E47F8, &stru_1001B7828);
    _NRLogWithArgs(qword_1001E47F0, 1, "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@", ", "-[NRLinkManagerFixedInterface linkDidReceiveData:data:]", 345, self);
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedInterfaceName, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

@end
