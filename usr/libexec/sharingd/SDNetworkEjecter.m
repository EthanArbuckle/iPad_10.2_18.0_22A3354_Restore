@implementation SDNetworkEjecter

- (SDNetworkEjecter)initWithNode:(__SFNode *)a3
{
  SDNetworkEjecter *v4;
  SDNetworkEjecter *v5;
  NSNumber *flags;
  NSString *protocol;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDNetworkEjecter;
  v4 = -[SDNetworkEjecter init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    flags = v4->_flags;
    v4->_flags = 0;

    protocol = v5->_protocol;
    v5->_protocol = 0;

    *(_QWORD *)&v5->_mountedCount = 0;
    v5->_node = (__SFNode *)CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_node);
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkEjecter;
  -[SDNetworkEjecter dealloc](&v3, "dealloc");
}

- (void)notifyClientAboutEject:(int)a3
{
  int mountedCount;
  int v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  NSMutableDictionary *v10;

  if (!a3)
  {
    mountedCount = self->_mountedCount;
    if (mountedCount)
    {
      v6 = self->_ejectedCount + 1;
      self->_ejectedCount = v6;
      if (v6 != mountedCount)
        return;
    }
    SFNodeSetMountPoint(self->_node, 0);
    SFNodeRemoveKind(self->_node, kSFNodeKindConnected);
    SFNodeSetConnectionState(self->_node, 0);
  }
  v10 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", self->_node, kSFOperationNodeKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", self->_flags, kSFOperationFlagsKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", self->_protocol, kSFOperationProtocolKey);
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SFNodeError"), a3, 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, kSFOperationErrorKey);

    v8 = 10;
  }
  else
  {
    v8 = 9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "networkEjecter:event:withResults:", self, v8, v10);

}

- (void)eject
{
  unint64_t v3;
  int IsSharePoint;
  __SFNode *node;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  if (SFNodeIsMounted(self->_node, a2))
  {
    v3 = -[NSNumber longValue](self->_flags, "longValue");
    IsSharePoint = SFNodeIsSharePoint(self->_node);
    node = self->_node;
    if (IsSharePoint)
    {
      v6 = SFNodeCopyMountPoint(node);
      v7 = (void *)v6;
      if (v6)
      {
        v14 = v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
        -[SDNetworkEjecter ejectMountPoints:useAssistant:](self, "ejectMountPoints:useAssistant:", v8, (v3 >> 1) & 1);

      }
      else
      {
        -[SDNetworkEjecter notifyClientAboutEject:](self, "notifyClientAboutEject:", 0xFFFFFFFFLL);
      }

    }
    else if (SFNodeIsServer(node))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v11 = (void *)SFNodeCopyRealName(self->_node, v10);
      if (-[NSString isEqual:](self->_protocol, "isEqual:", kSFNodeProtocolODisk))
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "odiskMountPointsForServer:", v11));
      else
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mountPointsForServer:", v11));
      v13 = (id)v12;
      -[SDNetworkEjecter ejectMountPoints:useAssistant:](self, "ejectMountPoints:useAssistant:", v12, (v3 >> 1) & 1);

    }
  }
  else
  {
    -[SDNetworkEjecter notifyClientAboutEject:](self, "notifyClientAboutEject:", 0);
  }
}

- (int)start
{
  id v3;
  NSString *v4;
  NSString *protocol;
  _QWORD block[5];

  if (!self->_protocol)
  {
    v3 = sub_10019B6A0();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(v3);
    protocol = self->_protocol;
    self->_protocol = v4;

    if (!self->_protocol)
      return -2;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012802C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 0;
}

- (void)stop
{
  uint64_t v2;
  NSObject *v3;

  v2 = browser_log(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1001280F8(v3);

}

- (NSNumber)flags
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlags:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (SDNetworkEjecterDelegate)delegate
{
  return (SDNetworkEjecterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_flags, 0);
}

@end
