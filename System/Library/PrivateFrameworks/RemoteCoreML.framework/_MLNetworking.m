@implementation _MLNetworking

- (id)initConnection:(id)a3
{
  id v5;
  char *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  char v12;
  const char *v13;
  const char *v14;
  nw_endpoint_t bonjour_service;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  nw_connection_t v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_MLNetworking;
  v6 = -[_MLNetworking init](&v23, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.remoteCoreMLClientNetwork", 0);
    v8 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v7;

    +[_MLLog clientFramework](_MLLog, "clientFramework");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v9;

    v11 = (id *)(v6 + 32);
    objc_storeStrong((id *)v6 + 4, a3);
    v12 = objc_msgSend(v5, "useBonjour");
    v13 = (const char *)objc_msgSend(*((id *)v6 + 4), "networkNameIdentifier");
    if ((v12 & 1) != 0)
    {
      if (objc_msgSend(v5, "useUDP"))
        v14 = "_nwcat._udp";
      else
        v14 = "_nwcat._tcp";
      bonjour_service = nw_endpoint_create_bonjour_service(v13, v14, "local");
    }
    else
    {
      bonjour_service = nw_endpoint_create_host(v13, (const char *)objc_msgSend(*v11, "port"));
    }
    v16 = bonjour_service;
    +[_MLNetworkUtilities doInitNetwork:](_MLNetworkUtilities, "doInitNetwork:", *((_QWORD *)v6 + 4));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v17;

    if (objc_msgSend(*((id *)v6 + 4), "localAddr") || objc_msgSend(*v11, "localPort"))
    {
      if ((objc_msgSend(v5, "useBonjour") & 1) != 0)
        v19 = 0;
      else
        v19 = objc_msgSend(v5, "networkNameIdentifier");
      +[_MLNetworkUtilities bindEndPoints:localAddr:localPort:](_MLNetworkUtilities, "bindEndPoints:localAddr:localPort:", *((_QWORD *)v6 + 6), v19, objc_msgSend(v5, "port"));
    }
    v20 = nw_connection_create(v16, *((nw_parameters_t *)v6 + 6));
    v21 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v20;

  }
  return v6;
}

- (id)initListener:(id)a3
{
  id v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  nw_listener_t v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MLNetworking;
  v6 = -[_MLNetworking init](&v17, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.remoteCoreMLServerNetwork", 0);
    v8 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v7;

    +[_MLLog serverFramework](_MLLog, "serverFramework");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v9;

    objc_storeStrong((id *)v6 + 4, a3);
    +[_MLNetworkUtilities doInitNetwork:](_MLNetworkUtilities, "doInitNetwork:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v11;

    v13 = 0;
    if ((objc_msgSend(v5, "useBonjour") & 1) == 0)
      v13 = objc_msgSend(v5, "networkNameIdentifier");
    +[_MLNetworkUtilities bindEndPoints:localAddr:localPort:](_MLNetworkUtilities, "bindEndPoints:localAddr:localPort:", *((_QWORD *)v6 + 6), v13, objc_msgSend(v5, "port"));
    v14 = nw_listener_create(*((nw_parameters_t *)v6 + 6));
    v15 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v14;

    +[_MLNetworkUtilities setupBonjour:name:useBonjour:useUDP:](_MLNetworkUtilities, "setupBonjour:name:useBonjour:useUDP:", *((_QWORD *)v6 + 3), objc_msgSend(v5, "networkNameIdentifier"), objc_msgSend(v5, "useBonjour"), objc_msgSend(v5, "useUDP"));
    nw_listener_set_queue(*((nw_listener_t *)v6 + 3), MEMORY[0x24BDAC9B8]);
    +[_MLNetworkUtilities setupListenerStateChangeHandler:useUDP:](_MLNetworkUtilities, "setupListenerStateChangeHandler:useUDP:", *((_QWORD *)v6 + 3), objc_msgSend(v5, "useUDP"));
  }

  return v6;
}

- (void)startConnection
{
  NSObject *connection;
  _QWORD v5[6];

  nw_connection_set_queue((nw_connection_t)self->_connection, (dispatch_queue_t)self->_q);
  connection = self->_connection;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32___MLNetworking_startConnection__block_invoke;
  v5[3] = &unk_24F356FC8;
  v5[4] = self;
  v5[5] = a2;
  nw_connection_set_state_changed_handler(connection, v5);
  nw_connection_start((nw_connection_t)self->_connection);
}

- (void)setReceiveDataCallBack:(id)a3
{
  id v4;

  v4 = a3;
  -[_MLNetworking startConnection](self, "startConnection");
  -[_MLNetworking receiveLoop:](self, "receiveLoop:", v4);

}

- (void)setListenerReceiveDataCallBack:(id)a3
{
  id v5;
  NSObject *listener;
  id v7;
  _QWORD handler[5];
  id v9;
  SEL v10;

  v5 = a3;
  listener = self->_listener;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke;
  handler[3] = &unk_24F356FF0;
  v9 = v5;
  v10 = a2;
  handler[4] = self;
  v7 = v5;
  nw_listener_set_new_connection_handler(listener, handler);
  nw_listener_start((nw_listener_t)self->_listener);

}

- (void)sendData:(id)a3
{
  id v5;
  const void *v6;
  size_t v7;
  NSObject *v8;
  NSObject *connection;
  NSObject *v10;
  _QWORD v11[6];

  v5 = objc_retainAutorelease(a3);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  v8 = dispatch_data_create(v6, v7, 0, 0);
  connection = self->_connection;
  v10 = *MEMORY[0x24BDE0850];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __26___MLNetworking_sendData___block_invoke;
  v11[3] = &unk_24F357018;
  v11[4] = self;
  v11[5] = a2;
  nw_connection_send(connection, v8, v10, 1, v11);

}

- (void)receiveLoop:(id)a3
{
  id v5;
  NSObject *connection;
  id v7;
  _QWORD completion[5];
  id v9;
  SEL v10;

  v5 = a3;
  connection = self->_connection;
  completion[0] = MEMORY[0x24BDAC760];
  completion[1] = 3221225472;
  completion[2] = __29___MLNetworking_receiveLoop___block_invoke;
  completion[3] = &unk_24F357068;
  v9 = v5;
  v10 = a2;
  completion[4] = self;
  v7 = v5;
  nw_connection_receive(connection, 4u, 0xFFFFFFFF, completion);

}

- (void)stop
{
  nw_connection_cancel((nw_connection_t)self->_connection);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_nw_listener)listener
{
  return self->_listener;
}

- (_MLNetworkOptions)nwOptions
{
  return self->_nwOptions;
}

- (OS_nw_protocol_stack)protocol_stack
{
  return self->_protocol_stack;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (BOOL)isClient
{
  return self->_isClient;
}

- (OS_os_log)logType
{
  return self->_logType;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_protocol_stack, 0);
  objc_storeStrong((id *)&self->_nwOptions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
