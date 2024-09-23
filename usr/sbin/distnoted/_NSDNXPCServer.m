@implementation _NSDNXPCServer

- (id)allClients
{
  return -[NSMutableArray copy](self->_clients, "copy");
}

- (_NSDNXPCServer)initWithConfiguration:(distnoted_configuration *)a3
{
  _NSDNXPCServer *v3;
  _NSDNXPCServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSDNXPCServer;
  v3 = -[_NSDNXPCServer init](&v6, "init", a3);
  v3->_invalidHandlers = objc_opt_new(NSMutableArray);
  v3->_clients = objc_opt_new(NSMutableArray);
  v4 = v3;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDNXPCServer;
  -[_NSDNXPCServer dealloc](&v3, "dealloc");
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  const __CFString *v3;
  NSString *v5;
  NSString *serviceName;

  if (self->_started)
  {
    v3 = CFSTR("Error: Service name set but already started. Ignoring.");
LABEL_5:
    CFLog(3, v3);
    return;
  }
  if (self->_invalid)
  {
    v3 = CFSTR("Error: Service name set but connection is invalid. Ignoring.");
    goto LABEL_5;
  }
  v5 = (NSString *)objc_msgSend(a3, "copy");
  serviceName = self->_serviceName;
  self->_serviceName = v5;

}

- (id)makeNewClient
{
  return self->_makeNewClient;
}

- (void)setMakeNewClient:(id)a3
{
  const __CFString *v3;
  id v5;
  id makeNewClient;

  if (self->_started)
  {
    v3 = CFSTR("Error: Setting new client handler set but already started. Ignoring.");
LABEL_5:
    CFLog(3, v3);
    return;
  }
  if (self->_invalid)
  {
    v3 = CFSTR("Error: Setting new client handler set but connection is invalid. Ignoring.");
    goto LABEL_5;
  }
  v5 = objc_msgSend(a3, "copy");
  makeNewClient = self->_makeNewClient;
  self->_makeNewClient = v5;

}

- (void)setPrivileged:(BOOL)a3
{
  self->_priv = a3;
}

- (id)__invalidate
{
  id makeNewClient;
  NSMutableArray *invalidHandlers;

  makeNewClient = self->_makeNewClient;
  self->_makeNewClient = 0;
  invalidHandlers = self->_invalidHandlers;
  self->_invalidHandlers = 0;

  return invalidHandlers;
}

- (void)invalidate
{
  int invalid;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  invalid = self->_invalid;
  self->_invalid = invalid + 1;
  if (invalid)
    goto LABEL_4;
  if (self->_conn)
  {
    xpc_connection_cancel(self->_conn);
LABEL_4:
    v3 = 0;
    goto LABEL_5;
  }
  v3 = -[_NSDNXPCServer __invalidate](self, "__invalidate");
LABEL_5:
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i) + 16))();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addInvalidationHandler:(id)a3
{
  id v5;
  NSMutableArray *invalidHandlers;
  id v7;

  v5 = objc_msgSend(a3, "copy");
  invalidHandlers = self->_invalidHandlers;
  v7 = v5;
  -[NSMutableArray addObject:](invalidHandlers, "addObject:");
  if (!invalidHandlers)
    (*((void (**)(id))a3 + 2))(a3);

}

- (void)start:(id)a3
{
  int started;
  const __CFString *serviceName;
  UInt8 *v7;
  uint64_t v8;
  OS_xpc_object *mach_service;
  CFIndex maxBufLen[6];
  CFRange v11;
  CFRange v12;

  if (!self->_invalid)
  {
    if (self->_makeNewClient)
    {
      started = self->_started;
      self->_started = started + 1;
      if (!started)
      {
        serviceName = (const __CFString *)self->_serviceName;
        if (serviceName)
        {
          maxBufLen[0] = 0;
          v11.length = CFStringGetLength(serviceName);
          v11.location = 0;
          CFStringGetBytes(serviceName, v11, 0x8000100u, 0, 0, 0, 0, maxBufLen);
          v7 = (UInt8 *)malloc_type_malloc(maxBufLen[0] + 1, 0x12400B2EuLL);
          v12.length = CFStringGetLength(serviceName);
          v12.location = 0;
          CFStringGetBytes(serviceName, v12, 0x8000100u, 0, 0, v7, maxBufLen[0], 0);
          v7[maxBufLen[0]] = 0;
          if (self->_priv)
            v8 = 3;
          else
            v8 = 1;
          mach_service = xpc_connection_create_mach_service((const char *)v7, (dispatch_queue_t)a3, v8);
        }
        else
        {
          mach_service = xpc_connection_create(0, (dispatch_queue_t)a3);
          v7 = 0;
        }
        self->_conn = mach_service;
        maxBufLen[0] = (CFIndex)_NSConcreteStackBlock;
        maxBufLen[1] = 3221225472;
        maxBufLen[2] = (CFIndex)sub_100001E14;
        maxBufLen[3] = (CFIndex)&unk_100008548;
        maxBufLen[4] = (CFIndex)self;
        maxBufLen[5] = (CFIndex)a3;
        xpc_connection_set_event_handler(mach_service, maxBufLen);
        xpc_connection_activate(self->_conn);
        if (serviceName)
          free(v7);
      }
    }
    else
    {
      CFLog(3, CFSTR("Error: Starting before make new client is set"));
    }
  }
}

- (id)createEndpoint
{
  if (self->_serviceName)
    return 0;
  else
    return xpc_endpoint_create(self->_conn);
}

@end
