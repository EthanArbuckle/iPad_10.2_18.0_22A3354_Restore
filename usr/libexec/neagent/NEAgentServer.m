@implementation NEAgentServer

- (NEAgentServer)init
{
  __assert_rtn("-[NEAgentServer init]", "NEAgentServer.m", 52, "0");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t isKindOfClass;
  const char *v11;
  uint64_t v12;
  id Property;
  NEAgentSession *v14;
  id v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  void ***v20;
  void *v21;
  uint64_t v22;
  OS_os_transaction *transaction;
  NSXPCListener *v24;
  NSXPCListener *delegateListener;
  NSMutableArray *activeSessions;
  BOOL v27;
  uint64_t v28;
  NSObject *v29;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *);
  void *v34;
  NEAgentSession *v35;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.neagent-client")));
  v9 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);
  if ((isKindOfClass & 1) == 0 || (isKindOfClass = (uint64_t)objc_msgSend(v8, "BOOLValue"), (isKindOfClass & 1) == 0))
  {
    v28 = ne_log_obj(isKindOfClass, v11, v12);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Rejecting un-entitled XPC client", (uint8_t *)&v31, 2u);
    }

    goto LABEL_15;
  }
  if (self)
    Property = objc_getProperty(self, v11, 16, 1);
  else
    Property = 0;
  if (Property != v6)
  {
LABEL_15:
    v27 = 0;
    goto LABEL_16;
  }
  kdebug_trace(726990956, 0, 0, 0, 0);
  v14 = [NEAgentSession alloc];
  v15 = v7;
  if (v14)
  {
    v36.receiver = v14;
    v36.super_class = (Class)NEAgentSession;
    v14 = -[NEAgentServer init](&v36, "init");
    if (v14)
    {
      v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = dispatch_queue_create("NEAgentSession queue", v17);
      queue = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v18;

      v31 = _NSConcreteStackBlock;
      v32 = 3221225472;
      v33 = sub_100004624;
      v34 = &unk_100008420;
      v14 = v14;
      v35 = v14;
      v20 = objc_retainBlock(&v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEAgentControl, v31, v32, v33, v34));
      objc_msgSend(v15, "setExportedInterface:", v21);

      objc_msgSend(v15, "setExportedObject:", v14);
      objc_msgSend(v15, "setInvalidationHandler:", v20);
      objc_msgSend(v15, "setInterruptionHandler:", v20);
      v22 = os_transaction_create("com.apple.neagent.session");
      transaction = v14->_transaction;
      v14->_transaction = (OS_os_transaction *)v22;

      objc_storeStrong((id *)&v14->_connection, a4);
      objc_msgSend(v15, "resume");
      v24 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
      -[NSXPCListener setDelegate:](v24, "setDelegate:", v14);
      -[NSXPCListener resume](v24, "resume");
      delegateListener = v14->_delegateListener;
      v14->_delegateListener = v24;

    }
  }

  os_unfair_lock_lock(&self->_lock);
  if (self)
    activeSessions = self->_activeSessions;
  else
    activeSessions = 0;
  -[NSMutableArray addObject:](activeSessions, "addObject:", v14);
  os_unfair_lock_unlock(&self->_lock);

  v27 = 1;
LABEL_16:

  return v27;
}

- (void)applicationInstallsDidStart:(id)a3
{
  sub_100003290((uint64_t)self, 0, a3);
}

- (void)applicationsWillInstall:(id)a3
{
  sub_100003290((uint64_t)self, 0, a3);
}

- (void)pluginsWillUninstall:(id)a3
{
  sub_100003550((uint64_t)self, 1, a3);
}

- (void)pluginsDidInstall:(id)a3
{
  sub_100003550((uint64_t)self, 2, a3);
}

- (void)applicationsWillUninstall:(id)a3
{
  sub_100003290((uint64_t)self, 3, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLSSessions, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
