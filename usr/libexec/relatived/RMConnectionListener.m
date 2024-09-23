@implementation RMConnectionListener

- (id)_initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RMConnectionListener *v14;
  RMConnectionListener *v15;
  NSMutableArray *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RMConnectionListener;
  v14 = -[RMConnectionListener init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[RMConnectionListener setQueue:](v14, "setQueue:", v10);
    v16 = objc_opt_new(NSMutableArray);
    -[RMConnectionListener setConnections:](v15, "setConnections:", v16);

    -[RMConnectionListener setMessageHandlerConstructor:](v15, "setMessageHandlerConstructor:", v13);
    -[RMConnectionListener setEntitlement:](v15, "setEntitlement:", v11);
    -[RMConnectionListener setTccService:](v15, "setTccService:", v12);
  }

  return v15;
}

- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 messageHandlerConstructor:(id)a5
{
  return (RMConnectionListener *)-[RMConnectionListener _initWithQueue:entitlement:tccService:messageHandlerConstructor:](self, "_initWithQueue:entitlement:tccService:messageHandlerConstructor:", a3, a4, 0, a5);
}

- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RMConnectionListener *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
    {
      v14 = v13;
      v15 = -[RMConnectionListener _initWithQueue:entitlement:tccService:messageHandlerConstructor:](self, "_initWithQueue:entitlement:tccService:messageHandlerConstructor:", v10, v11, v12, v13);

      return v15;
    }
  }
  else
  {
    sub_100016478();
  }
  sub_100016594();
  return (RMConnectionListener *)sub_10000CA5C();
}

- (BOOL)isEndpointConnectionAllowed:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  id *v21;
  char *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  BOOL v26;
  int v28;
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  void *v33;

  v4 = (id *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));
    LODWORD(v5) = sub_100009920(v4, v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener tccService](self, "tccService"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));

    if (!v8)
      sub_1000166B0();
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener tccService](self, "tccService"));
    LODWORD(v7) = sub_10000A00C((_BOOL8)v4, v9);

  }
  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100024DE0);
  v10 = qword_10002C4A8;
  if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "NO";
    if ((_DWORD)v5)
      v12 = "YES";
    else
      v12 = "NO";
    if ((_DWORD)v7)
      v11 = "YES";
    v28 = 136446466;
    v29 = v12;
    v30 = 2082;
    *(_QWORD *)v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client status: Entitled: %{public}s Authorized: %{public}s", (uint8_t *)&v28, 0x16u);
  }
  if (((v5 | v7) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));

    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));
      if (!v14
        || (v15 = (void *)v14,
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener deprecatedEntitlement](self, "deprecatedEntitlement")),
            v16,
            v15,
            !v16)
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener deprecatedEntitlement](self, "deprecatedEntitlement")),
            v18 = sub_100009920(v4, v17),
            v17,
            !v18))
      {
        v26 = 0;
        goto LABEL_26;
      }
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100024DE0);
      v19 = (void *)qword_10002C4A8;
      if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = sub_10000A068(v4);
        v22 = (char *)objc_claimAutoreleasedReturnValue(v21);
        v23 = sub_10000A0A0(v4);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener deprecatedEntitlement](self, "deprecatedEntitlement"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener entitlement](self, "entitlement"));
        v28 = 138544131;
        v29 = v22;
        v30 = 1025;
        *(_DWORD *)v31 = v23;
        *(_WORD *)&v31[4] = 2114;
        *(_QWORD *)&v31[6] = v24;
        v32 = 2114;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Client %{public}@ (%{private}d) uses deprecated entitlement %{public}@: please use %{public}@ instead", (uint8_t *)&v28, 0x26u);

      }
    }
  }
  v26 = 1;
LABEL_26:

  return v26;
}

- (void)startListeningForService:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  xpc_connection_t mach_service;
  void *v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  _QWORD handler[5];
  uint8_t buf[4];
  id v15;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  mach_service = xpc_connection_create_mach_service(v5, v6, 1uLL);
  -[RMConnectionListener setListener:](self, "setListener:", mach_service);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  if (!v8)
    sub_1000167CC((uint64_t)v4);
  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100024DE0);
  v9 = qword_10002C4A8;
  if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering handler for service: %{private}@", buf, 0xCu);
  }
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000CFBC;
  handler[3] = &unk_100024D58;
  handler[4] = self;
  xpc_connection_set_event_handler(v10, handler);

  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  xpc_connection_resume(v11);

  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100024DE0);
  v12 = qword_10002C4A8;
  if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Listener started for service: %{private}@", buf, 0xCu);
  }

}

- (void)traverseEndpointsAsynchronously:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D4CC;
  v7[3] = &unk_100024D80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  _xpc_connection_s *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener connections](self, "connections"));
  v5 = objc_msgSend(v4, "copy");

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &stru_100024DC0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener connections](self, "connections"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener listener](self, "listener"));
  xpc_connection_cancel(v7);

  -[RMConnectionListener setListener:](self, "setListener:", 0);
}

- (void)endpointWasInterrupted:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  v3 = a3;
  if (qword_10002C4A0 != -1)
    goto LABEL_13;
  while (1)
  {
    v4 = qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_10001F8D2;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Interruption events shouldn't be received by the daemon\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100024DE0);
    v5 = qword_10002C4A8;
    if (os_signpost_enabled((os_log_t)qword_10002C4A8))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_10001F8D2;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Interruption events shouldn't be received by the daemon", "{\"msg%{public}.0s\":\"Interruption events shouldn't be received by the daemon\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100024DE0);
    v6 = qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_10001F8D2;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Interruption events shouldn't be received by the daemon\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m", 191, "-[RMConnectionListener endpointWasInterrupted:]");
LABEL_13:
    dispatch_once(&qword_10002C4A0, &stru_100024DE0);
  }
}

- (void)endpointWasInvalidated:(id)a3
{
  NSObject *v4;
  id *v5;
  void *v6;
  void *v7;
  RMConnectionHandlerInternal *v8;
  id *v9;
  void *v10;
  id *v11;
  RMConnectionListener *v12;
  SEL v13;
  id *v14;

  v14 = (id *)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[RMConnectionListener queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  sub_1000163A4(v14, 0);
  v5 = sub_100015474(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConnectionListener connections](self, "connections"));
    v8 = [RMConnectionHandlerInternal alloc];
    v9 = sub_100015474(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = sub_10000C720((id *)&v8->super.isa, v14, v10);
    objc_msgSend(v7, "removeObject:", v11);

  }
  else
  {
    v12 = (RMConnectionListener *)sub_100016960();
    -[RMConnectionListener deprecatedEntitlement](v12, v13);
  }
}

- (NSString)deprecatedEntitlement
{
  return self->_deprecatedEntitlement;
}

- (void)setDeprecatedEntitlement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (id)messageHandlerConstructor
{
  return self->_messageHandlerConstructor;
}

- (void)setMessageHandlerConstructor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)tccService
{
  return self->_tccService;
}

- (void)setTccService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccService, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong(&self->_messageHandlerConstructor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deprecatedEntitlement, 0);
}

@end
