@implementation BrowseRegistration

- (BrowseRegistration)initWithRequest:(id)a3
{
  id v4;
  BrowseRegistration *v5;
  xpc_connection_t remote_connection;
  void *v7;
  _xpc_connection_s *v8;
  BrowseRegistration *v9;
  BrowseRegistration *v10;
  _QWORD handler[4];
  BrowseRegistration *v13;

  v4 = a3;
  v5 = -[BrowseRegistration init](self, "init");
  if (v5)
  {
    -[BrowseRegistration setType:](v5, "setType:", xpc_dictionary_get_uint64(v4, "device_type"));
    remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    -[BrowseRegistration setConnection:](v5, "setConnection:", v7);

    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](v5, "connection"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100021144;
    handler[3] = &unk_100050F08;
    v9 = v5;
    v13 = v9;
    xpc_connection_set_event_handler(v8, handler);

    objc_msgSend((id)qword_100057EA8, "addObject:", v9);
    v10 = v9;

  }
  return v5;
}

- (void)deliverDevice:(id)a3
{
  id v4;
  unsigned int v5;
  _xpc_connection_s *v6;
  char *v7;
  NSObject *v8;
  xpc_object_t v9;
  void *v10;
  _xpc_connection_s *v11;
  int v12;
  char *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == -[BrowseRegistration type](self, "type") || -[BrowseRegistration type](self, "type") == 0xFFFF)
  {
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    v7 = sub_100016F70(v6);

    v8 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Delivering device (client=\"%s\")", (uint8_t *)&v12, 0xCu);
    }
    free(v7);
    v9 = xpc_dictionary_create(0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    sub_1000213A8(v4, v10, v9);

    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    xpc_connection_send_message(v11, v9);

  }
}

- (void)cancel
{
  _xpc_connection_s *v3;
  char *v4;
  _xpc_connection_s *v5;
  _QWORD barrier[5];

  if (!-[BrowseRegistration canceled](self, "canceled"))
  {
    -[BrowseRegistration setCanceled:](self, "setCanceled:", 1);
    objc_msgSend((id)qword_100057EA8, "removeObject:", self);
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    v4 = sub_100016F70(v3);

    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEBUG))
      sub_100039120();
    free(v4);
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    barrier[0] = _NSConcreteStackBlock;
    barrier[1] = 3221225472;
    barrier[2] = sub_100021570;
    barrier[3] = &unk_1000510D0;
    barrier[4] = self;
    xpc_connection_send_barrier(v5, barrier);

  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
