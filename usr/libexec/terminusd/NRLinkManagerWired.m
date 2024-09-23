@implementation NRLinkManagerWired

- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4
{
  NSObject *v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NRLinkManagerWired *v24;
  id v26;
  int IsLevelEnabled;
  id v28;
  id v29;
  int v30;
  id v31;
  int v32;
  id v33;
  objc_super v34;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v26 = sub_1000C5B5C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v26, 17);

    if (IsLevelEnabled)
    {
      v28 = sub_1000C5B5C();
      _NRLogWithArgs(v28, 17, "%s called with null queue");
LABEL_12:

      v24 = 0;
      goto LABEL_7;
    }
LABEL_16:
    v24 = 0;
    goto LABEL_7;
  }
  dispatch_assert_queue_V2(v6);
  if (!v7)
  {
    v29 = sub_1000C5B5C();
    v30 = _NRLogIsLevelEnabled(v29, 17);

    if (v30)
    {
      v28 = sub_1000C5B5C();
      _NRLogWithArgs(v28, 17, "%s called with null managerDelegate");
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  v34.receiver = self;
  v34.super_class = (Class)NRLinkManagerWired;
  v8 = -[NRLinkManager initManagerWithQueue:managerDelegate:](&v34, "initManagerWithQueue:managerDelegate:", v6, v7);
  if (!v8)
  {
    v31 = sub_1000C5B5C();
    v32 = _NRLogIsLevelEnabled(v31, 17);

    if (v32)
    {
      v33 = sub_1000C5B5C();
      _NRLogWithArgs(v33, 17, "[NRLinkManager initManagerWithQueue:] failed");

    }
    self = 0;
    goto LABEL_16;
  }
  v9 = (uint64_t)v8;
  v8[8] = 5;
  v10 = objc_alloc_init((Class)NSMutableSet);
  v11 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;

  v12 = objc_alloc_init((Class)NSMutableSet);
  v13 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = v12;

  v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v14;

  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = *(void **)(v9 + 88);
  *(_QWORD *)(v9 + 88) = v16;

  v18 = objc_alloc_init((Class)NSMutableDictionary);
  v19 = *(void **)(v9 + 64);
  *(_QWORD *)(v9 + 64) = v18;

  v20 = objc_alloc_init((Class)NSMutableDictionary);
  v21 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v20;

  objc_msgSend((id)v9, "reportEvent:", 2001);
  v22 = *(id *)(v9 + 24);
  dispatch_assert_queue_V2(v22);

  if (*(_DWORD *)(v9 + 12) != 1003)
  {
    v23 = *(id *)(v9 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C84FC;
    block[3] = &unk_1001B8AE0;
    block[4] = v9;
    dispatch_async(v23, block);

    sub_1000C8584(v9);
  }
  *(_DWORD *)(v9 + 12) = 1003;
  objc_msgSend((id)v9, "reportEvent:", 2002);
  self = (NRLinkManagerWired *)(id)v9;
  v24 = self;
LABEL_7:

  return v24;
}

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
    -[NRLinkManagerWired invalidateManager](self, "invalidateManager");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "cancelWithReason:", CFSTR("Cancelling Wired link manager"), (_QWORD)v10);
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
  __SCDynamicStore *scdynamicStoreRef;
  __SCDynamicStore *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NRLinkManagerWired;
  -[NRLinkManager invalidateManager](&v5, "invalidateManager");
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
  }
}

- (void)dealloc
{
  id v3;
  id v4;
  objc_super v5;

  if (qword_1001E4768 != -1)
    dispatch_once(&qword_1001E4768, &stru_1001B7398);
  if (_NRLogIsLevelEnabled(qword_1001E4760, 1))
  {
    if (qword_1001E4768 != -1)
      dispatch_once(&qword_1001E4768, &stru_1001B7398);
    v3 = (id)qword_1001E4760;
    v4 = -[NRLinkManagerWired copyName](self, "copyName");
    _NRLogWithArgs(v3, 1, "%s%.30s:%-4d %@", ", "-[NRLinkManagerWired dealloc]", 119, v4);

  }
  -[NRLinkManagerWired invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)NRLinkManagerWired;
  -[NRLinkManagerWired dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return CFSTR("Link Manager - Wired");
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
  NSMutableDictionary *nrUUIDToPeerDictionary;
  void *v12;

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init((Class)NSMutableString);
  v6 = -[NRLinkManagerWired copyName](self, "copyName");
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
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal state: %@"), self->_interfaceToLocalAddressDictionary);
    nrUUIDToPeerDictionary = self->_nrUUIDToPeerDictionary;
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinks: %@"), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal state: %@"), 0);
    nrUUIDToPeerDictionary = 0;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("\nPeer state: %@"), nrUUIDToPeerDictionary);
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
  NRLinkManagerWired *v14;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v10 = sub_1000C5B5C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v9 = sub_1000C5B5C();
    _NRLogWithArgs(v9, 17, "%s called with null link", "-[NRLinkManagerWired linkIsAvailable:]");
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
    block[2] = sub_1000C83EC;
    block[3] = &unk_1001B8778;
    v13 = v4;
    v14 = self;
    v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E4768 != -1)
    dispatch_once(&qword_1001E4768, &stru_1001B7398);
  if (_NRLogIsLevelEnabled(qword_1001E4760, 1))
  {
    if (qword_1001E4768 != -1)
      dispatch_once(&qword_1001E4768, &stru_1001B7398);
    _NRLogWithArgs(qword_1001E4760, 1, "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@", ", "-[NRLinkManagerWired linkIsAvailable:]", 605, self);
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
  NRLinkManagerWired *v16;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v11 = sub_1000C5B5C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v10 = sub_1000C5B5C();
    _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerWired linkIsReady:]");
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
    block[2] = sub_1000C82DC;
    block[3] = &unk_1001B8778;
    v15 = v4;
    v16 = self;
    v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E4768 != -1)
    dispatch_once(&qword_1001E4768, &stru_1001B7398);
  if (_NRLogIsLevelEnabled(qword_1001E4760, 1))
  {
    if (qword_1001E4768 != -1)
      dispatch_once(&qword_1001E4768, &stru_1001B7398);
    _NRLogWithArgs(qword_1001E4760, 1, "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@", ", "-[NRLinkManagerWired linkIsReady:]", 630, self);
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
  NRLinkManagerWired *v16;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v11 = sub_1000C5B5C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v10 = sub_1000C5B5C();
    _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerWired linkIsSuspended:]");
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
    block[2] = sub_1000C81CC;
    block[3] = &unk_1001B8778;
    v15 = v4;
    v16 = self;
    v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E4768 != -1)
    dispatch_once(&qword_1001E4768, &stru_1001B7398);
  if (_NRLogIsLevelEnabled(qword_1001E4760, 1))
  {
    if (qword_1001E4768 != -1)
      dispatch_once(&qword_1001E4768, &stru_1001B7398);
    _NRLogWithArgs(qword_1001E4760, 1, "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@", ", "-[NRLinkManagerWired linkIsSuspended:]", 653, self);
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
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    v10 = sub_1000C5B5C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17);

    if (!IsLevelEnabled)
      goto LABEL_15;
    v9 = sub_1000C5B5C();
    _NRLogWithArgs(v9, 17, "%s called with null link", "-[NRLinkManagerWired linkIsUnavailable:]");
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
    block[2] = sub_1000C6D88;
    block[3] = &unk_1001B8778;
    block[4] = self;
    v13 = v4;
    v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001E4768 != -1)
    dispatch_once(&qword_1001E4768, &stru_1001B7398);
  if (_NRLogIsLevelEnabled(qword_1001E4760, 1))
  {
    if (qword_1001E4768 != -1)
      dispatch_once(&qword_1001E4768, &stru_1001B7398);
    _NRLogWithArgs(qword_1001E4760, 1, "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@", ", "-[NRLinkManagerWired linkIsUnavailable:]", 676, self);
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
  _QWORD block[4];
  id v15;
  NRLinkManagerWired *v16;
  id v17;

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
    block[2] = sub_1000C6C78;
    block[3] = &unk_1001B87A0;
    v15 = v6;
    v16 = self;
    v17 = v7;
    v12 = v6;
    dispatch_async(v11, block);

    goto LABEL_11;
  }
  if (qword_1001E4768 != -1)
    dispatch_once(&qword_1001E4768, &stru_1001B7398);
  if (_NRLogIsLevelEnabled(qword_1001E4760, 1))
  {
    if (qword_1001E4768 != -1)
      dispatch_once(&qword_1001E4768, &stru_1001B7398);
    _NRLogWithArgs(qword_1001E4760, 1, "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@", ", "-[NRLinkManagerWired linkDidReceiveData:data:]", 695, self);
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrUUIDToPeerDictionary, 0);
  objc_storeStrong((id *)&self->_interfaceToLocalAddressDictionary, 0);
  objc_storeStrong((id *)&self->_interfaceToV6Addresses, 0);
  objc_storeStrong((id *)&self->_interfaceToV4Addresses, 0);
  objc_storeStrong((id *)&self->_wiredInterfaceNameList, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

@end
