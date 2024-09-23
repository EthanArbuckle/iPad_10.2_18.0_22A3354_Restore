@implementation APMetricClientConnection

- (APMetricClientConnection)initWithHost:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  APMetricClientConnection *v8;
  APMetricClientConnection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APMetricClientConnection;
  v8 = -[APMetricClientConnection init](&v11, "init");
  v9 = v8;
  if (v8)
    -[APMetricClientConnection _setupConnection:port:](v8, "_setupConnection:port:", v6, v7);

  return v9;
}

- (void)_setupConnection:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  NSObject *secure_tcp;
  NSObject *host;
  NSObject *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  uint64_t v16;
  _QWORD handler[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
    host = nw_endpoint_create_host(v9, v10);
    v13 = nw_connection_create(host, secure_tcp);
    global_queue = dispatch_get_global_queue(9, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    nw_connection_set_queue(v13, v15);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10016ADC4;
    handler[3] = &unk_1002187D0;
    handler[4] = v9;
    nw_connection_set_state_changed_handler(v13, handler);
    nw_connection_start(v13);
    -[APMetricClientConnection setClientConnection:](self, "setClientConnection:", v13);

  }
  else
  {
    v16 = APLogForCategory(23);
    secure_tcp = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(secure_tcp, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, secure_tcp, OS_LOG_TYPE_ERROR, "hostname or port missing", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (void)send:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APMetricClientConnection lineBreakFramer:](self, "lineBreakFramer:", a3));
  -[APMetricClientConnection _sendRawData:](self, "_sendRawData:", v4);

}

- (void)_sendRawData:(id)a3
{
  dispatch_queue_global_t global_queue;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *queue;

  global_queue = dispatch_get_global_queue(0, 0);
  queue = objc_claimAutoreleasedReturnValue(global_queue);
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = dispatch_data_create(v7, (size_t)v8, queue, 0);
  v10 = objc_claimAutoreleasedReturnValue(-[APMetricClientConnection clientConnection](self, "clientConnection"));
  nw_connection_send(v10, v9, _nw_content_context_default_message, 1, &stru_100218810);

}

- (id)lineBreakFramer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\r\n")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
    objc_msgSend(v3, "appendData:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v3));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (OS_nw_connection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (NSString)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

@end
