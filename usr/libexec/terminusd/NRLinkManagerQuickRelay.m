@implementation NRLinkManagerQuickRelay

- (void)cancel
{
  -[NRLinkManagerQuickRelay invalidateManager](self, "invalidateManager");
  if (self)
    self->super._state = 1004;
}

- (void)invalidateManager
{
  uint64_t v3;
  OS_nw_path_evaluator *pathEvaluator;
  OS_nw_path_evaluator *v5;
  APSConnection *apsConnection;
  APSConnection *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRLinkManagerQuickRelay;
  -[NRLinkManager invalidateManager](&v8, "invalidateManager");
  if (self)
  {
    pathEvaluator = self->_pathEvaluator;
    if (pathEvaluator)
    {
      nw_path_evaluator_cancel(pathEvaluator, v3);
      v5 = self->_pathEvaluator;
      self->_pathEvaluator = 0;

    }
    apsConnection = self->_apsConnection;
    if (apsConnection)
    {
      -[APSConnection setDelegate:](apsConnection, "setDelegate:", 0);
      v7 = self->_apsConnection;
      self->_apsConnection = 0;

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  if (qword_1001E4808 != -1)
    dispatch_once(&qword_1001E4808, &stru_1001B7870);
  if (_NRLogIsLevelEnabled(qword_1001E4800, 1))
  {
    if (qword_1001E4808 != -1)
      dispatch_once(&qword_1001E4808, &stru_1001B7870);
    _NRLogWithArgs(qword_1001E4800, 1, "%s%.30s:%-4d Dealloc: %@", ", "-[NRLinkManagerQuickRelay dealloc]", 89, self);
  }
  -[NRLinkManagerQuickRelay invalidateManager](self, "invalidateManager");
  v3.receiver = self;
  v3.super_class = (Class)NRLinkManagerQuickRelay;
  -[NRLinkManagerQuickRelay dealloc](&v3, "dealloc");
}

- (id)copyName
{
  return CFSTR("Link Manager - QuickRelay");
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
  void *v11;

  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init((Class)NSMutableString);
  v6 = -[NRLinkManagerQuickRelay copyName](self, "copyName");
  objc_msgSend(v5, "appendFormat:", CFSTR("\nName: %@"), v6);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinkManager type: %@"), StringFromNRLinkType);

    state = self->super._state;
  }
  else
  {
    v11 = (void *)createStringFromNRLinkType(0);
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLinkManager type: %@"), v11);

    state = 0;
  }
  v9 = sub_1000A3074(state);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nState: %@"), v9);

  return v5;
}

- (void)linkIsAvailable:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  id v8;
  int IsLevelEnabled;
  id v10;
  _QWORD block[4];
  id v12;
  NRLinkManagerQuickRelay *v13;

  v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      -[NSMutableSet addObject:](self->_links, "addObject:", v4);
      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      objc_msgSend(0, "addObject:", v4);
      queue = 0;
    }
    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F9F68;
    block[3] = &unk_1001B8778;
    v12 = v4;
    v13 = self;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = sub_1000F9858();
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17);

    if (IsLevelEnabled)
    {
      v10 = sub_1000F9858();
      _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsAvailable:]");

    }
  }

}

- (void)linkIsSuspended:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  id v8;
  int IsLevelEnabled;
  id v10;
  _QWORD block[4];
  id v12;
  NRLinkManagerQuickRelay *v13;

  v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      queue = 0;
    }
    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F9E58;
    block[3] = &unk_1001B8778;
    v12 = v4;
    v13 = self;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = sub_1000F9858();
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17);

    if (IsLevelEnabled)
    {
      v10 = sub_1000F9858();
      _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsSuspended:]");

    }
  }

}

- (void)linkIsReady:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  id v8;
  int IsLevelEnabled;
  id v10;
  _QWORD block[4];
  id v12;
  NRLinkManagerQuickRelay *v13;

  v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      queue = 0;
    }
    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F9D48;
    block[3] = &unk_1001B8778;
    v12 = v4;
    v13 = self;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = sub_1000F9858();
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17);

    if (IsLevelEnabled)
    {
      v10 = sub_1000F9858();
      _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsReady:]");

    }
  }

}

- (void)linkIsUnavailable:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  id v8;
  int IsLevelEnabled;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      -[NSMutableSet removeObject:](self->_links, "removeObject:", v4);
      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      objc_msgSend(0, "removeObject:", v4);
      queue = 0;
    }
    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F98E4;
    block[3] = &unk_1001B8778;
    block[4] = self;
    v12 = v4;
    dispatch_async(v7, block);

    sub_1000F9930((uint64_t)self);
  }
  else
  {
    v8 = sub_1000F9858();
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17);

    if (IsLevelEnabled)
    {
      v10 = sub_1000F9858();
      _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsUnavailable:]");

    }
  }

}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  id v12;
  int IsLevelEnabled;
  id v14;
  id v15;
  int v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = sub_1000F9858();
    IsLevelEnabled = _NRLogIsLevelEnabled(v12, 17);

    if (!IsLevelEnabled)
      goto LABEL_6;
    v14 = sub_1000F9858();
    _NRLogWithArgs(v14, 17, "%s called with null link");
LABEL_11:

    goto LABEL_6;
  }
  if (!v7)
  {
    v15 = sub_1000F9858();
    v16 = _NRLogIsLevelEnabled(v15, 17);

    if (!v16)
      goto LABEL_6;
    v14 = sub_1000F9858();
    _NRLogWithArgs(v14, 17, "%s called with null data");
    goto LABEL_11;
  }
  if (self)
  {
    v9 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

    queue = self->super._queue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    queue = 0;
  }
  v11 = queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F9898;
  block[3] = &unk_1001B87A0;
  block[4] = self;
  v18 = v6;
  v19 = v8;
  dispatch_async(v11, block);

LABEL_6:
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (qword_1001E4808 != -1)
    dispatch_once(&qword_1001E4808, &stru_1001B7870);
  if (_NRLogIsLevelEnabled(qword_1001E4800, 1))
  {
    if (qword_1001E4808 != -1)
      dispatch_once(&qword_1001E4808, &stru_1001B7870);
    _NRLogWithArgs(qword_1001E4800, 1, "%s%.30s:%-4d APSConnection: %@, token: %@", ", "-[NRLinkManagerQuickRelay connection:didReceivePublicToken:]", 294, v7, v6);
  }
  -[NRLinkManagerQuickRelay connection:didChangeConnectedStatus:](self, "connection:didChangeConnectedStatus:", v7, objc_msgSend(v7, "isConnected"));

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL8 v4;
  OS_dispatch_queue *queue;
  NSObject *v7;
  const char *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v7 = queue;
  dispatch_assert_queue_V2(v7);

  if (qword_1001E4808 != -1)
    dispatch_once(&qword_1001E4808, &stru_1001B7870);
  if (_NRLogIsLevelEnabled(qword_1001E4800, 1))
  {
    if (qword_1001E4808 != -1)
      dispatch_once(&qword_1001E4808, &stru_1001B7870);
    if (v4)
      v8 = "YES";
    else
      v8 = "NO";
    _NRLogWithArgs(qword_1001E4800, 1, "%s%.30s:%-4d APSConnection: %@, connected: %s", ", "-[NRLinkManagerQuickRelay connection:didChangeConnectedStatus:]", 301, v9, v8);
  }
  if (self)
  {
    self->_apsConnected = v4;
    self = (NRLinkManagerQuickRelay *)objc_loadWeakRetained((id *)&self->_quickRelayManagerDelegate);
  }
  -[NRLinkManagerQuickRelay apsIsConnected:](self, "apsIsConnected:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quickRelayManagerDelegate);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

@end
