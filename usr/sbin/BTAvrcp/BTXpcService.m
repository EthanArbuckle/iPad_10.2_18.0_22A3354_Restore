@implementation BTXpcService

- (BTXpcService)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BTXpcService init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Calling %@ is not allowed"), v3);

  return 0;
}

- (BTXpcService)initWithName:(const char *)a3 sessionClass:(Class)a4
{
  BTXpcService *v6;
  xpc_connection_t *p_isa;
  xpc_connection_t mach_service;
  xpc_connection_t v9;
  _xpc_connection_s *v10;
  BTXpcService *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v13;
  _QWORD handler[4];
  BTXpcService *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BTXpcService;
  v6 = -[BTXpcService init](&v17, "init");
  if (!v6)
    return 0;
  p_isa = &v6->super.isa;
  v6->_name = a3;
  objc_storeStrong((id *)&v6->_sessionClass, a4);
  mach_service = xpc_connection_create_mach_service(a3, (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  v9 = p_isa[3];
  p_isa[3] = mach_service;

  v10 = p_isa[3];
  if (v10)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003C4C;
    handler[3] = &unk_1000187D0;
    v11 = p_isa;
    v16 = v11;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_resume(p_isa[3]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100003C58, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    p_isa = &v16->super.isa;
  }
  else
  {
    v13 = qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_FAULT))
      sub_10000FC18(v13);
    v11 = 0;
  }

  return v11;
}

- (void)_handleEvent:(id)a3
{
  id v4;
  xpc_type_t type;
  xpc_type_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    -[BTXpcService _handleConnection:](self, "_handleConnection:", v4);
  }
  else
  {
    v6 = type;
    v7 = qword_10001F1C0;
    v8 = os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v8)
        sub_10000FC58((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
    }
    else if (v8)
    {
      sub_10000FCC0((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
    }
  }

}

- (void)_handleConnection:(id)a3
{
  _xpc_connection_s *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = (_xpc_connection_s *)a3;
  v5 = (void *)xpc_connection_copy_entitlement_value(v4, -[BTXpcService name](self, "name"));
  v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v6))
  {

  }
  else
  {
    v7 = qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR))
      sub_10000FD28(v7);
    xpc_connection_cancel(v4);
  }

}

- (const)name
{
  return self->_name;
}

- (Class)sessionClass
{
  return self->_sessionClass;
}

- (OS_xpc_object)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_sessionClass, 0);
}

@end
