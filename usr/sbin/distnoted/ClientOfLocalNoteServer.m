@implementation ClientOfLocalNoteServer

- (ClientOfLocalNoteServer)initWithClientConnection:(id)a3 configuration:(distnoted_configuration *)a4
{
  ClientOfLocalNoteServer *v6;
  uint64_t v7;
  ClientOfLocalNoteServer *v8;
  _NSDNXPCConnection *client;
  _QWORD v11[6];
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _OWORD buffer[256];
  char v17[256];

  v15.receiver = self;
  v15.super_class = (Class)ClientOfLocalNoteServer;
  v6 = -[ClientOfLocalNoteServer init](&v15, "init");
  v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
  v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
  v13 = 0u;
  v14 = 0u;
  xpc_connection_get_audit_token(a3, &v13);
  buffer[0] = v13;
  buffer[1] = v14;
  v7 = sandbox_reference_retain_by_audit_token(buffer);
  *(_QWORD *)&v6->_started = 0;
  v6->_sandboxReference = v7;
  v6->_invalidHandlers = objc_opt_new(NSMutableArray);
  v6->_suspended = 0;
  v6->_registrar = (__CFXNotificationRegistrar *)CFXNotificationRegistrarCreate(kCFAllocatorSystemDefault, 2);
  v6->_parent = (_NSDNXPCServer *)a4->var1;
  v6->_queue = (OS_xpc_object *)xpc_array_create(0, 0);
  v6->_client = -[_NSDNXPCConnection initWithPeerConnection:]([_NSDNXPCConnection alloc], "initWithPeerConnection:", a3);
  v8 = v6;
  client = v6->_client;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003D84;
  v12[3] = &unk_100008420;
  v12[4] = v6;
  -[_NSDNXPCConnection addInvalidationHandler:](client, "addInvalidationHandler:", v12);
  -[_NSDNXPCConnection addTerminationImminentHandler:](v6->_client, "addTerminationImminentHandler:", &stru_100008460);
  snprintf(v17, 0x100uLL, "ClientOfLocalNoteServer.0x%016lx.dq", v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002354;
  v11[3] = &unk_1000084B0;
  v11[4] = v6;
  v11[5] = a4;
  -[_NSDNXPCConnection setHandleMessage:](v6->_client, "setHandleMessage:", v11);
  return v6;
}

- (void)handlePost:(id)a3
{
  xpc_object_t value;
  const void *v6;
  xpc_object_t v7;
  const void *v8;
  xpc_object_t v9;
  char uint64;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  value = xpc_dictionary_get_value(a3, "name");
  v6 = (const void *)_CFXPCCreateCFObjectFromXPCObject(value);
  v7 = xpc_dictionary_get_value(a3, "object");
  v8 = (const void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  v9 = xpc_dictionary_get_value(a3, "userinfo");
  uint64 = xpc_dictionary_get_uint64(a3, "options");
  if (v6 && v8)
  {
    v11 = uint64;
    -[ClientOfLocalNoteServer forward:](+[ClientOfLocalNoteServer monitor](ClientOfLocalNoteServer, "monitor"), "forward:", a3);
    bzero(&v16, 0x810uLL);
    v15 = 0x2000000000;
    v17 = &v18;
    CFXNotificationRegistrarFind(self->_registrar, v6, v8, &v15);
    if ((_DWORD)v15)
    {
      v12 = 0;
      v13 = 0;
      v14 = v11 & 1;
      do
      {
        -[ClientOfLocalNoteServer postNotification:object:token:options:immediate:userInfo:](self, "postNotification:object:token:options:immediate:userInfo:", v6, v8, v17[v12 + 7], v17[v12 + 3], v14, v9);
        ++v13;
        v12 += 8;
      }
      while (v13 < v15);
    }
    _CFXNotificationRegistrationBufferDestroy(&v15);
  }
  if (v6)
    CFRelease(v6);
  if (v8)
    CFRelease(v8);
}

- (BOOL)isLoginWindow
{
  return 0;
}

- (void)addInvalidationHandler:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_invalidHandlers, "addObject:", v4);

}

- (void)postNotification:(__CFString *)a3 object:(__CFString *)a4 token:(unint64_t)a5 options:(unint64_t)a6 immediate:(unsigned __int8)a7 userInfo:(id)a8
{
  int v10;
  CFTypeID v15;
  CFTypeID v16;
  size_t v17;
  xpc_object_t v18;
  unint64_t v19;
  uint64_t v20;
  OS_xpc_object *v21;
  const char *string;
  const char *v23;
  OS_xpc_object *queue;
  _QWORD v25[9];
  xpc_object_t values[5];
  xpc_object_t v27;
  char *keys[5];
  const char *v29;

  if (a3)
  {
    if (a4)
    {
      v10 = a7;
      v15 = CFGetTypeID(a4);
      if (v15 == CFStringGetTypeID())
      {
        v16 = CFGetTypeID(a4);
        if (v16 == CFStringGetTypeID())
        {
          v29 = 0;
          v27 = 0;
          keys[0] = "method";
          values[0] = xpc_string_create("post_token");
          keys[1] = "version";
          values[1] = xpc_uint64_create(1uLL);
          keys[2] = "token";
          values[2] = xpc_uint64_create(a5);
          keys[3] = "name";
          values[3] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(a3);
          keys[4] = "object";
          values[4] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(a4);
          if (a8)
          {
            v29 = "userinfo";
            v27 = xpc_retain(a8);
            v17 = 6;
          }
          else
          {
            v17 = 5;
          }
          v18 = xpc_dictionary_create((const char *const *)keys, values, v17);
          v19 = 0;
          v20 = 8 * v17;
          do
          {
            xpc_release(values[v19 / 8]);
            v19 += 8;
          }
          while (v20 != v19);
          if (v10 || (a6 & 1) != 0 || !self->_suspended)
          {
            if (v10 || (a6 & 1) != 0)
              -[ClientOfLocalNoteServer flushQueue](self, "flushQueue");
            -[_NSDNXPCConnection sendMessage:](self->_client, "sendMessage:", v18);
            goto LABEL_24;
          }
          if (a6 != 8)
          {
            if (a6 == 2 || (a6 & 4) == 0)
              goto LABEL_24;
            v21 = (OS_xpc_object *)xpc_array_create(0, 0);
            string = xpc_dictionary_get_string(v18, "name");
            v23 = xpc_dictionary_get_string(v18, "object");
            queue = self->_queue;
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1000045BC;
            v25[3] = &unk_1000084D8;
            v25[6] = a5;
            v25[7] = string;
            v25[8] = v23;
            v25[4] = v18;
            v25[5] = v21;
            xpc_array_apply(queue, v25);
            xpc_release(self->_queue);
            self->_queue = v21;
          }
          -[ClientOfLocalNoteServer enqueuePost:](self, "enqueuePost:", v18);
LABEL_24:
          xpc_release(v18);
        }
      }
    }
  }
}

+ (ClientOfLocalNoteServer)monitor
{
  return (ClientOfLocalNoteServer *)qword_10000CDE0;
}

+ (void)setMonitor:(id)a3
{
  if ((id)qword_10000CDE0 != a3)
  {

    qword_10000CDE0 = (uint64_t)a3;
  }
}

- (NSString)processName
{
  int v2;
  CFIndex v3;
  CFStringEncoding v4;
  UInt8 buffer[4096];

  v2 = proc_pidpath(self->_pid, buffer, 0x1000u);
  if (v2 < 1)
    return (NSString *)CFSTR("(Unknown)");
  v3 = v2;
  v4 = CFStringFileSystemEncoding();
  return (NSString *)(id)CFStringCreateWithBytes(kCFAllocatorSystemDefault, buffer, v3, v4, 0);
}

- (void)startMonitoring
{
  if (!-[_NSDNXPCConnection euid](self->_client, "euid"))
    +[ClientOfLocalNoteServer setMonitor:](ClientOfLocalNoteServer, "setMonitor:", self);
}

- (void)dump
{
  xpc_object_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  uint64_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  ClientOfLocalNoteServer *v14;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  xpc_object_t values[2];
  char *keys[2];
  _BYTE v23[128];

  if (!-[_NSDNXPCConnection euid](self->_client, "euid"))
  {
    v3 = xpc_array_create(0, 0);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = self;
    obj = -[_NSDNXPCServer allClients](self->_parent, "allClients");
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7);
          v9 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v9, "process", (const char *)objc_msgSend(objc_msgSend((id)v8, "processName"), "UTF8String"));
          xpc_dictionary_set_int64(v9, "pid", *(int *)(v8 + 72));
          v10 = xpc_array_create(0, 0);
          v11 = *(_QWORD *)(v8 + 24);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100003CD0;
          v16[3] = &unk_1000083E8;
          v16[4] = v10;
          CFXNotificationRegistrarEnumerate(v11, v16);
          xpc_dictionary_set_value(v9, "registrations", v10);
          xpc_release(v10);
          xpc_array_append_value(v3, v9);
          xpc_release(v9);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v5);
    }
    v12 = xpc_string_create("dump");
    *(_OWORD *)keys = off_100008408;
    values[0] = v12;
    values[1] = v3;
    v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_release(v12);
    xpc_release(v3);
    -[_NSDNXPCConnection sendMessage:](v14->_client, "sendMessage:", v13);
    xpc_release(v13);
  }
}

- (void)dealloc
{
  objc_super v3;

  if ((self->_sandboxReference & 0x8000000000000000) == 0)
    sandbox_reference_release();
  CFRelease(self->_registrar);
  xpc_release(self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)ClientOfLocalNoteServer;
  -[ClientOfLocalNoteServer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  int invalid;
  _NSDNXPCConnection *client;
  NSMutableArray *invalidHandlers;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  invalid = self->_invalid;
  self->_invalid = invalid + 1;
  if (!invalid)
  {
    client = self->_client;
    self->_client = 0;
    invalidHandlers = self->_invalidHandlers;
    self->_invalidHandlers = 0;
    -[_NSDNXPCConnection invalidate](client, "invalidate");

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](invalidHandlers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(invalidHandlers);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](invalidHandlers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    getpid();
  }
  if (+[ClientOfLocalNoteServer monitor](ClientOfLocalNoteServer, "monitor") == self)
    +[ClientOfLocalNoteServer setMonitor:](ClientOfLocalNoteServer, "setMonitor:", 0);
}

- (void)start:(id)a3
{
  int started;
  _NSDNXPCConnection *v5;
  _NSDNXPCConnection *v6;

  started = self->_started;
  self->_started = started + 1;
  if (!started)
  {
    v5 = self->_client;
    if (v5)
    {
      v6 = v5;
      -[_NSDNXPCConnection start:](v5, "start:", a3);

    }
  }
}

- (void)flushQueue
{
  OS_xpc_object *queue;
  _QWORD applier[5];

  queue = self->_queue;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000044F4;
  applier[3] = &unk_100008488;
  applier[4] = self;
  xpc_array_apply(queue, applier);
  xpc_release(self->_queue);
  self->_queue = (OS_xpc_object *)xpc_array_create(0, 0);
}

- (void)enqueuePost:(id)a3
{
  xpc_array_append_value(self->_queue, a3);
  if (xpc_array_get_count(self->_queue) >= 0x1F4)
    -[ClientOfLocalNoteServer flushQueue](self, "flushQueue");
}

- (void)forward:(id)a3
{
  -[_NSDNXPCConnection sendMessage:](self->_client, "sendMessage:", a3);
}

@end
