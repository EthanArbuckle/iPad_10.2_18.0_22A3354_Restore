@implementation NIServerConnection

- (NIServerConnection)initWithSessionID:(id)a3 queue:(id)a4 exportedObject:(id)a5 options:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  NIServerConnection *v15;
  NIServerConnection *v16;
  os_log_t v17;
  OS_os_log *log;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  NSXPCConnection *v25;
  NSXPCConnection *connection;
  NSXPCConnection *v27;
  id v28;
  void *v29;
  NSXPCConnection *v30;
  id v31;
  void *v32;
  void *v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerConnection.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionID"));

  }
  v35.receiver = self;
  v35.super_class = (Class)NIServerConnection;
  v15 = -[NIServerConnection init](&v35, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_options = a6;
    v17 = os_log_create("com.apple.NearbyInteraction", "NIServerConnection");
    log = v16->_log;
    v16->_log = (OS_os_log *)v17;

    if (+[NIServerConnection _internalBuildShouldDenyConnection](NIServerConnection, "_internalBuildShouldDenyConnection"))
    {
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v19 = v16->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "processName"));
          *(_DWORD *)buf = 138412290;
          v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Deny connection: %@", buf, 0xCu);

        }
      }
    }
    else
    {
      v23 = objc_alloc((Class)NSXPCConnection);
      if ((a6 & 1) != 0)
        v24 = CFSTR("com.apple.nearbyd.xpc.nearbyinteraction.observer");
      else
        v24 = CFSTR("com.apple.nearbyd.xpc.nearbyinteraction");
      v25 = (NSXPCConnection *)objc_msgSend(v23, "initWithMachServiceName:options:", v24, 4096);
      connection = v16->_connection;
      v16->_connection = v25;

      v27 = v16->_connection;
      v28 = sub_1002D7274();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[NSXPCConnection setExportedInterface:](v27, "setExportedInterface:", v29);

      if (v14)
        -[NSXPCConnection setExportedObject:](v16->_connection, "setExportedObject:", v14);
      v30 = v16->_connection;
      v31 = sub_1002D6474();
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      -[NSXPCConnection setRemoteObjectInterface:](v30, "setRemoteObjectInterface:", v32);

      -[NSXPCConnection _setQueue:](v16->_connection, "_setQueue:", v13);
    }
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[NIServerConnection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NIServerConnection;
  -[NIServerConnection dealloc](&v3, "dealloc");
}

- (id)remoteObjectProxy
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002C7D20;
  v4[3] = &unk_100813988;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4));
}

- (id)synchronousRemoteObjectProxy
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002C7DDC;
  v4[3] = &unk_100813988;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4));
}

- (id)interruptionHandler
{
  return -[NSXPCConnection interruptionHandler](self->_connection, "interruptionHandler");
}

- (id)invalidationHandler
{
  return -[NSXPCConnection invalidationHandler](self->_connection, "invalidationHandler");
}

- (void)setInterruptionHandler:(id)a3
{
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", a3);
}

- (void)setInvalidationHandler:(id)a3
{
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", a3);
}

- (void)resume
{
  -[NSXPCConnection resume](self->_connection, "resume");
}

- (void)invalidate
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForConnection
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

+ (id)createOneShotConnectionAndResume:(BOOL)a3
{
  _BOOL4 v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NIServerConnection *v7;
  NSUUID *v8;
  NIServerConnection *v9;

  v3 = a3;
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_create("com.apple.NearbyInteraction", v5);
  v7 = [NIServerConnection alloc];
  v8 = objc_opt_new(NSUUID);
  v9 = -[NIServerConnection initWithSessionID:queue:exportedObject:options:](v7, "initWithSessionID:queue:exportedObject:options:", v8, v6, 0, 0);

  if (v3)
    -[NIServerConnection resume](v9, "resume");

  return v9;
}

+ (BOOL)_internalBuildShouldDenyConnection
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR(".GlobalPreferences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.NearbyInteraction.ConnectionAllowList")));
    if (v4 && (v5 = objc_opt_class(NSArray, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "processName"));
      v8 = objc_msgSend(v4, "containsObject:", v7) ^ 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.NearbyInteraction.ConnectionDenyList")));
      if (!v6 || (v10 = objc_opt_class(NSArray, v9), (objc_opt_isKindOfClass(v6, v10) & 1) == 0))
      {
        LOBYTE(v8) = 0;
        goto LABEL_11;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "processName"));
      LOBYTE(v8) = objc_msgSend(v6, "containsObject:", v11);

    }
LABEL_11:

    return v8;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)exportedObject
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setExportedObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
