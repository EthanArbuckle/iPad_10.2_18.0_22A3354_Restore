@implementation NDUserEventAgentConnection

- (void)removePendingWakeForClient:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BFE4;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

+ (id)sharedUserEventAgentConnection
{
  if (qword_1000C7080 != -1)
    dispatch_once(&qword_1000C7080, &stru_1000B1768);
  return (id)qword_1000C7078;
}

- (NDUserEventAgentConnection)init
{
  NDUserEventAgentConnection *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *pendingWakes;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NDUserEventAgentConnection;
  v2 = -[NDUserEventAgentConnection init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.nsurlsessiond.UserEventAgentConnectionQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    pendingWakes = v2->_pendingWakes;
    v2->_pendingWakes = v9;

  }
  return v2;
}

- (void)start
{
  OS_xpc_object *mach_service;
  OS_xpc_object *listener;
  NSObject *v5;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_xpc_object *v10;

  mach_service = xpc_connection_create_mach_service("com.apple.nsurlsessiond-launchondemand", (dispatch_queue_t)self->_queue, 1uLL);
  listener = self->_listener;
  self->_listener = mach_service;

  v5 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_listener;
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created xpc listener: %@", buf, 0xCu);
  }
  v7 = self->_listener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000452A4;
  handler[3] = &unk_1000B1790;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->_listener);
}

- (void)handleNewConnection:(id)a3
{
  _xpc_connection_s *v5;
  OS_xpc_object **p_connection;
  OS_xpc_object *connection;
  NSObject *v8;
  OS_xpc_object *v9;
  _QWORD handler[5];
  uint8_t buf[16];

  v5 = (_xpc_connection_s *)a3;
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    v8 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received a new connection from UserEventAgent! Canceling the old one", buf, 2u);
      connection = *p_connection;
    }
    xpc_connection_cancel(connection);
    v9 = *p_connection;
    *p_connection = 0;

  }
  objc_storeStrong((id *)&self->_connection, a3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100044F6C;
  handler[3] = &unk_1000B1790;
  handler[4] = self;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_set_target_queue(v5, (dispatch_queue_t)self->_queue);
  xpc_connection_resume(*p_connection);

}

- (BOOL)canLaunchProcessWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_registeredClients, "objectForKey:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)launchProcessWithIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  NDUserEventAgentConnection *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044DB8;
  block[3] = &unk_1000B20B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)performWake:(id)a3 uponNotification:(id)a4 sessionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100044C68;
  v15[3] = &unk_1000B17B8;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWakes, 0);
  objc_storeStrong((id *)&self->_registeredClients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
