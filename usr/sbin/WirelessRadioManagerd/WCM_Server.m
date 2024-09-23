@implementation WCM_Server

- (id)getQueue
{
  return self->mQueue;
}

+ (id)singleton
{
  id result;
  objc_super v4;

  result = (id)qword_1002711A8;
  if (!qword_1002711A8)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_Server;
    result = objc_msgSend(objc_msgSendSuper2(&v4, "allocWithZone:", 0), "init");
    qword_1002711A8 = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "singleton", a3);
}

- (WCM_Server)init
{
  WCM_Server *v2;
  WCM_Server *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_Server;
  v2 = -[WCM_Server init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->mConnection = 0;
    v2->testMode = 0;
    v2->mQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WRMServer", 0);
    v3->mClientSessions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v3;
}

- (void)dealloc
{
  OS_xpc_object *mConnection;
  NSObject *mQueue;
  NSMutableArray *mClientSessions;
  objc_super v6;

  mConnection = self->mConnection;
  if (mConnection)
    xpc_release(mConnection);
  mQueue = self->mQueue;
  if (mQueue)
    dispatch_release(mQueue);
  mClientSessions = self->mClientSessions;
  if (mClientSessions)

  v6.receiver = self;
  v6.super_class = (Class)WCM_Server;
  -[WCM_Server dealloc](&v6, "dealloc");
}

- (void)startService
{
  NSObject *global_queue;
  OS_xpc_object *mach_service;
  _QWORD handler[5];

  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 1uLL);
  self->mConnection = mach_service;
  if (!mach_service)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Failed to create XPC server. Exiting."));
    exit(0);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100077284;
  handler[3] = &unk_100203460;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(self->mConnection);
}

- (void)handleEvent:(id)a3
{
  NSObject *mQueue;
  _QWORD v4[6];

  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000772E8;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)handleXPCEvent:(id)a3
{
  xpc_type_t type;
  char *v6;

  type = xpc_get_type(a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_Server: Handling XPC Event : %@"), a3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_Server: Handling XPC Connection Event"));
    -[WCM_Server handleConnection:](self, "handleConnection:", a3);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_Server: XPC server error: %s"), xpc_dictionary_get_string(a3, _xpc_error_key_description));
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received new message %@"), a3);
  }
  else
  {
    v6 = xpc_copy_description(a3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Unexpected XPC server event: %s"), v6);
    free(v6);
  }
}

- (void)handleConnection:(id)a3
{
  WCM_Session *v5;

  if (!self->testMode)
  {
    v5 = objc_alloc_init(WCM_Session);
    -[WCM_Session initWithConnection:](v5, "initWithConnection:", a3);
    -[WCM_Server addSessionToList:](self, "addSessionToList:", v5);

  }
}

- (void)addSessionToList:(id)a3
{
  -[NSMutableArray addObject:](self->mClientSessions, "addObject:", a3);
  -[WCM_Server existingSessions](self, "existingSessions");
}

- (void)removeSessionFromList:(id)a3
{
  -[NSMutableArray removeObject:](self->mClientSessions, "removeObject:", a3);
  -[WCM_Server existingSessions](self, "existingSessions");
}

- (id)getSessionFor:(int)a3
{
  NSObject *mQueue;
  void *v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_100077590;
  v12 = sub_1000775A0;
  v13 = 0;
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000775AC;
  block[3] = &unk_100203488;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_async(mQueue, block);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)getSessionSync:(int)a3
{
  NSMutableArray *mClientSessions;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[WCM_Server existingSessions](self, "existingSessions");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  mClientSessions = self->mClientSessions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(mClientSessions);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v10, "getProcessId") == a3)
      return v10;
    if (v7 == (id)++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)existingSessions
{
  NSMutableArray *mClientSessions;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_Server: %d active sessions"), -[NSMutableArray count](self->mClientSessions, "count"));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  mClientSessions = self->mClientSessions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mClientSessions);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Session: %@"), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)enterTestMode
{
  NSMutableArray *mClientSessions;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCM_Server: Entering Test Mode"));
  self->testMode = 1;
  -[WCM_Server existingSessions](self, "existingSessions");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  mClientSessions = self->mClientSessions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mClientSessions);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "suspendExternalConnection");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)exitTestMode
{
  NSMutableArray *mClientSessions;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCM_Server: Existing Test Mode"));
  self->testMode = 0;
  -[WCM_Server existingSessions](self, "existingSessions");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  mClientSessions = self->mClientSessions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mClientSessions);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "resumeExternalConnection");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mClientSessions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

@end
