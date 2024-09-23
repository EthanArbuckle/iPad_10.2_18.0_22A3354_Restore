@implementation SDNetworkResolver

- (SDNetworkResolver)initWithNode:(__SFNode *)a3
{
  SDNetworkResolver *v4;
  SDNetworkResolver *v5;
  NSNumber *flags;
  NSString *protocol;
  SDBonjourResolver *resolver;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDNetworkResolver;
  v4 = -[SDNetworkResolver init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    flags = v4->_flags;
    v4->_flags = 0;

    v5->_node = (__SFNode *)CFRetain(a3);
    protocol = v5->_protocol;
    v5->_protocol = 0;

    resolver = v5->_resolver;
    v5->_resolver = 0;

    v5->_session = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_node);
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkResolver;
  -[SDNetworkResolver dealloc](&v3, "dealloc");
}

- (void)notifyClientAboutResolve:(int)a3
{
  void *v5;
  uint64_t v6;
  id WeakRetained;
  NSMutableDictionary *v8;

  v8 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", self->_node, kSFOperationNodeKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", self->_flags, kSFOperationFlagsKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", self->_protocol, kSFOperationProtocolKey);
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SFNodeError"), a3, 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v5, kSFOperationErrorKey);

    v6 = 10;
  }
  else
  {
    v6 = 9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "networkResolver:event:withResults:", self, v6, v8);

  -[SDNetworkResolver stop](self, "stop");
}

- (void)bonjourResolverDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  SDNetworkResolver *v10;
  uint64_t v11;
  const __CFURL *v12;
  const __CFURL *v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef v16;
  const __CFString *v17;
  __CFString *v18;
  void *v19;
  const __CFURL *v20;
  __SFNode *node;
  void *v22;
  __SFNode *v23;
  void *v24;
  __SFNode *v25;
  void *v26;
  __SFNode *v27;
  void *v28;
  id WeakRetained;

  v4 = a3;
  v5 = objc_msgSend(v4, "error");
  if ((_DWORD)v5)
  {
    v7 = (int)v5;
    v8 = browser_log(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000E7690(v7, v9);

    v10 = self;
    v11 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  v12 = (const __CFURL *)SFNodeCopyURL(self->_node);
  if (v12)
  {
    v13 = v12;
    v14 = CFURLCopyScheme(v12);
    if (v14)
    {
      v15 = v14;
      v16 = CFURLCopyPath(v13);
      if (v16)
      {
        v17 = v16;
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "portNumber"));
        v20 = sub_1000CDE00(v15, 0, 0, v18, (int)objc_msgSend(v19, "intValue"), v17, 0, 0);

        SFNodeSetURL(self->_node, v20);
        if (v20)
          CFRelease(v20);
        CFRelease(v17);
      }
      CFRelease(v15);
    }
    CFRelease(v13);
  }
  else
  {
    node = self->_node;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "portNumber"));
    SFNodeSetPortNumber(node, objc_msgSend(v22, "intValue"));

    v23 = self->_node;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostName"));
    SFNodeSetHostName(v23, v24);

    v25 = self->_node;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    SFNodeSetPath(v25, v26);

    v27 = self->_node;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    SFNodeSetURL(v27, v28);

  }
  if (-[NSString isEqualToString:](self->_protocol, "isEqualToString:", kSFNodeProtocolVNC))
  {
    v10 = self;
    v11 = 0;
LABEL_16:
    -[SDNetworkResolver notifyClientAboutResolve:](v10, "notifyClientAboutResolve:", v11);
    goto LABEL_17;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
    -[SDNetworkResolver mount](self, "mount");
LABEL_17:

}

- (int)start
{
  NSString *protocol;
  id v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __CFNetService *v13;
  SDBonjourResolver *v14;
  CFStringRef Name;
  CFStringRef Type;
  SDBonjourResolver *v17;
  SDBonjourResolver *resolver;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  const void *v30;
  void *v31;
  SDBonjourResolver *v32;
  void *v33;
  SDBonjourResolver *v34;
  SDBonjourResolver *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD block[5];

  protocol = self->_protocol;
  if (!protocol)
  {
    v4 = sub_10019B6A0();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_protocol;
    self->_protocol = v5;

    protocol = self->_protocol;
    if (!protocol)
      return -2;
  }
  if (-[NSString isEqualToString:](protocol, "isEqualToString:", kSFNodeProtocolODisk))
  {
    v7 = (void *)SFNodeCopyURL(self->_node);
    v8 = (void *)SFNodeCopyDomain(self->_node);
    v9 = SFNodeCopyServiceName(self->_node);
    v11 = (void *)v9;
    if (v7)
    {
      v12 = _CFNetServiceCreateFromURL(0, v7);
      if (v12)
      {
        v13 = (__CFNetService *)v12;
        v14 = [SDBonjourResolver alloc];
        Name = CFNetServiceGetName(v13);
        Type = CFNetServiceGetType(v13);
        v17 = -[SDBonjourResolver initWithName:type:domain:path:timeout:](v14, "initWithName:type:domain:path:timeout:", Name, Type, CFNetServiceGetDomain(v13), 0, 0);
        resolver = self->_resolver;
        self->_resolver = v17;

        -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", self);
        -[SDBonjourResolver resolve](self->_resolver, "resolve");
        CFRelease(v13);
LABEL_18:

        goto LABEL_19;
      }
      if (!v11 || !v8)
        goto LABEL_18;
    }
    else if (!v9 || !v8)
    {
      v19 = browser_log(v9, v10);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1000E7730(v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_24:

      return -2;
    }
    v28 = sub_1000CEF58(self->_protocol);
    if (v28)
    {
      v30 = v28;
      v31 = (void *)SFNodeCopyRealName(self->_node, v29);
      v32 = [SDBonjourResolver alloc];
      if (SFNodeIsSharePoint(self->_node))
        v33 = v31;
      else
        v33 = 0;
      v34 = -[SDBonjourResolver initWithName:type:domain:path:timeout:](v32, "initWithName:type:domain:path:timeout:", v11, v30, v8, v33, 0);
      v35 = self->_resolver;
      self->_resolver = v34;

      -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", self);
      -[SDBonjourResolver resolve](self->_resolver, "resolve");

      goto LABEL_18;
    }
    v37 = browser_log(0, v29);
    v20 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000E7700(v20, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_24;
  }
LABEL_19:
  if (!self->_resolver)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E75B0;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return 0;
}

- (void)stop
{
  SDBonjourResolver *resolver;
  SDBonjourResolver *v4;

  resolver = self->_resolver;
  if (resolver)
  {
    -[SDBonjourResolver setDelegate:](resolver, "setDelegate:", 0);
    -[SDBonjourResolver cancel](self->_resolver, "cancel");
    v4 = self->_resolver;
    self->_resolver = 0;

  }
}

- (NSNumber)flags
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlags:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (SDNetworkResolverDelegate)delegate
{
  return (SDNetworkResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
