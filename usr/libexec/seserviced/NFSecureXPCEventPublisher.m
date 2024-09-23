@implementation NFSecureXPCEventPublisher

- (void)dealloc
{
  _xpc_connection_s *v3;
  objc_super v4;

  if (-[NFSecureXPCEventPublisher available](self, "available"))
  {
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisher connection](self, "connection"));
    xpc_connection_cancel(v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)NFSecureXPCEventPublisher;
  -[NFSecureXPCEventPublisher dealloc](&v4, "dealloc");
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NFSecureXPCEventPublisher *v9;
  NFSecureXPCEventPublisher *v10;
  id v11;
  const char *v12;
  OS_dispatch_queue *v13;
  NSObject *queue;
  dispatch_queue_attr_t v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *v17;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  _xpc_connection_s *v20;
  _QWORD handler[4];
  id v23;
  id v24;
  id location;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NFSecureXPCEventPublisher;
  v9 = -[NFSecureXPCEventPublisher init](&v26, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    v11 = objc_retainAutorelease(v7);
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    if (v8)
    {
      v13 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v13;
    }
    else
    {
      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      queue = objc_claimAutoreleasedReturnValue(v15);
      v16 = dispatch_queue_create(v12, queue);
      v17 = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v16;

    }
    mach_service = xpc_connection_create_mach_service(v12, (dispatch_queue_t)v10->_queue, 2uLL);
    connection = v10->_connection;
    v10->_connection = mach_service;

    objc_initWeak(&location, v10);
    v20 = v10->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100051098;
    handler[3] = &unk_100304CB0;
    objc_copyWeak(&v24, &location);
    v23 = v11;
    xpc_connection_set_event_handler(v20, handler);
    v10->_available = 1;
    xpc_connection_activate(v10->_connection);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)sendEvent:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  xpc_type_t type;
  uint64_t v8;
  const _xpc_type_s *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *name;

  v4 = a3;
  v5 = -[NFSecureXPCEventPublisher available](self, "available");
  if (v5)
  {
    type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisher connection](self, "connection"));
      xpc_connection_send_notification(v11, v4);
    }
    else
    {
      v9 = type;
      v10 = SESDefaultLogObject(type, v8);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315138;
        name = xpc_type_get_name(v9);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid event type: %s", (uint8_t *)&v15, 0xCu);
      }
    }

  }
  else
  {
    v12 = SESDefaultLogObject(v5, v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (char *)objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisher serviceName](self, "serviceName"));
      v15 = 138412290;
      name = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Service unavailable: %@", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
